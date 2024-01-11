#tag Class
Protected Class LineManager
	#tag Method, Flags = &h1
		Protected Sub AppendLine(segment As SyntaxArea.TextLine)
		  // Append a line to the `Lines` array.
		  Lines.Add(segment)
		  
		  // Determine if this one is longer than the previous longest...
		  If segment.Length > LongestLineLength Then
		    LongestLineIndex = Lines.LastIndex
		    LongestLineLength = segment.Length
		    
		    // and forward it to the delegate.
		    NotifyMaxLineLengthChanged(LongestLineIndex)
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function CalculateInvisibleLines() As integer
		  #If Not DebugBuild
		    #Pragma DisableBackgroundTasks
		    #Pragma DisableBoundsChecking
		  #EndIf
		  
		  // Clear the calculation caches.
		  If NeededCache <> Nil Then NeededCache.RemoveAll
		  If VisibleCache <> Nil Then VisibleCache.RemoveAll
		  
		  Var invisibleLines As Integer
		  Var iLimit As Integer = Count - 1
		  For i As Integer = 0 To iLimit
		    If Not Lines(i).Visible Then invisibleLines = invisibleLines + 1
		  Next i
		  
		  Return invisibleLines
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 436C65617220616C6C206C696E657320616E64207265736574207661726961626C65732E
		Sub Clear()
		  /// Clear all lines and reset variables.
		  
		  RemoveLineSymbols(0, Count - 1)
		  Lines.ResizeTo(-1)
		  LongestLineIndex = -1
		  LongestLineLength = 0
		  LineEnding = Chr(13)
		  CurrentInvisibleLines = -1
		  mFirstLineForIndentation = 0
		  mLastLineForIndentation = -1
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ClearDirtyLines()
		  For Each line As SyntaxArea.TextLine In lines
		    line.IsDirty = False
		  Next line
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(textStorage As SyntaxArea.GapBuffer, tabWidth As Integer)
		  // Create a generic EOL segment.
		  Self.TextStorage = textStorage
		  
		  // No need to find the longest line yet.
		  NeedsLongestRescan = False
		  
		  // Default the line endings to Chr(13).
		  LineEnding = Chr(13)
		  
		  Self.TabWidth = tabWidth
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1, Description = 437265617465732060546578744C696E6560206F626A656374732066726F6D207468652074657874206275666665722E
		Protected Function CreateLines(lineInsertPoint As Integer, offset As Integer, length As Integer, indent As Integer, lineContIdx As Integer, markDirty As Boolean = False) As Integer
		  /// Creates `TextLine` objects from the text buffer.
		  
		  #If Not DebugBuild
		    #Pragma DisableBackgroundTasks
		    #Pragma DisableBoundsChecking
		  #EndIf
		  
		  Var s As String = TextStorage.GetText(offset, length)
		  Var insertedLines, startSearchIndex, ariLineLen(), ariLineDelimeter() As Integer
		  
		  FindLineLengths(s, ariLineLen, ariLineDelimeter)
		  
		  Var lastDirtyLine As SyntaxArea.TextLine
		  Var wasLastDirtyBefore As Boolean
		  
		  For i As Integer = 0 To ariLineLen.LastIndex - 1
		    Var segment As SyntaxArea.TextLine
		    segment = New SyntaxArea.TextLine(offset + startSearchIndex, ariLineLen(i), ariLineDelimeter(i), TabWidth, indent, lineContIdx)
		    startSearchIndex = startSearchIndex + ariLineLen(i)
		    
		    If markDirty Then
		      lastDirtyLine = segment
		      wasLastDirtyBefore = lastDirtyLine.IsDirty
		      lastDirtyLine.IsDirty = True
		    End If
		    
		    // Append or insert?
		    If lineInsertPoint + insertedLines > Lines.LastIndex Then
		      AppendLine(segment)
		    Else
		      InsertLine(lineInsertPoint + insertedLines, segment)
		    End If
		    
		    insertedLines = insertedLines + 1
		  Next i
		  
		  // Trailing text.
		  If startSearchIndex <= s.Length Then
		    If lineInsertPoint + insertedLines > Lines.LastIndex Then
		      Var line As SyntaxArea.TextLine = _
		      New SyntaxArea.TextLine(offset + startSearchIndex, s.Length - startSearchIndex, 0, TabWidth, indent, lineContIdx)
		      If markDirty Then
		        lastDirtyLine = line
		        wasLastDirtyBefore = lastDirtyLine.IsDirty
		        lastDirtyLine.IsDirty = True
		      End If
		      AppendLine(line)
		      insertedLines = insertedLines + 1
		    End If
		  End If
		  
		  If lastDirtyLine <> Nil Then
		    // This deals with a special case: If we're called by `Editor.Private_Replace()`, the first line gets 
		    // deleted and then added here again. But if the insertion was a new line with a carriage return at the end, 
		    // then this deleted/added line is only shifted down, but not actually
		    // changed. This code tries to deal with that by not marking it dirty.
		    lastDirtyLine.IsDirty = wasLastDirtyBefore
		  End
		  
		  NotifyLineChangedRange(lineInsertPoint, insertedLines)
		  
		  Return insertedLines
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub FindLineLengths(sText As String, ariLineLen() As Integer, ariDelimeterLen() As Integer)
		  #If Not DebugBuild
		    #Pragma DisableBackgroundTasks
		    #Pragma DisableBoundsChecking
		  #EndIf
		  
		  Var prevLineEnding As String = LineEnding
		  lineEnding = "" // Will be set below, by the first line delimiter that's encountered.
		  
		  If sText <> "" Then
		    If sText.Encoding <> SyntaxArea.InternalEncoding Then
		      // Should not happen...
		      Raise New UnsupportedFormatException("The encoding of `sText` does not match the internal encoding.")
		    End
		    
		    Var sTextCanonical As String = sText.ReplaceLineEndings(EndOfLine.UNIX)
		    Var ars() As String = sTextCanonical.Split(EndOfLine.UNIX)
		    Var iOffsetB As Integer = 0
		    
		    Var currentEncoding As TextEncoding = sText.Encoding
		    If currentEncoding = Nil Then currentEncoding = Encodings.ASCII
		    
		    // Get the byte length for an EOL char. It could be > 1 (e.g. in UTF-16).
		    Var EOLlen As Integer = currentEncoding.Chr(13).Bytes
		    
		    For Each sLine As String In ars
		      Var iLineLen As Integer = sLine.Length
		      iOffsetB = iOffsetB + sLine.Bytes
		      
		      Var c As Integer = sText.MiddleBytes(iOffsetB, EOLlen).Asc
		      
		      If c = 13 Then
		        // Move the offset by the already found marker.
		        iOffsetB = iOffsetB + EOLlen
		        
		        If sText.Middle(iOffsetB, EOLlen).Asc = 10 Then
		          // Windows.
		          iLineLen = iLineLen + 2
		          iOffsetB = iOffsetB + EOLlen
		          ariDelimeterLen.Add(2)
		          If lineEnding = "" Then lineEnding = Chr(13) + Chr(10)
		          
		        Else
		          // macOS.
		          iLineLen = iLineLen + 1
		          ariDelimeterLen.Add(1)
		          If lineEnding = "" Then lineEnding = Chr(13)
		        End If
		        
		      ElseIf c = 10 Then
		        // Unix.
		        iLineLen = iLineLen + 1
		        iOffsetB = iOffsetB + EOLlen
		        ariDelimeterLen.Add(1)
		        If lineEnding = "" Then lineEnding = Chr(10)
		        
		      ElseIf c = 0 Then
		        // End of the text.
		        ariDelimeterLen.Add(0)
		        ariLineLen.Add(iLineLen)
		        Exit
		        
		      Else
		        Continue
		      End If
		      
		      ariLineLen.Add(iLineLen)
		    Next
		  End If
		  
		  If lineEnding = "" Then
		    // If the text had no line delimiters we'll use the OS default.
		    lineEnding = prevLineEnding
		    If lineEnding = "" Then
		      #If TargetWindows
		        lineEnding = EndOfLine.Windows
		      #Else
		        // macOS uses Unix like Linux.
		        lineEnding = EndOfLine.Unix
		      #EndIf
		    End If
		  End If
		  
		  lineEnding = lineEnding.ConvertEncoding(SyntaxArea.InternalEncoding)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1, Description = 506572666F726D7320612062696E6172792073656172636820666F7220746865206C696E65207468617420636F6E7461696E7320606F6666736574602E
		Protected Function FindLineNumberForOffset(offset As Integer) As Integer
		  /// Performs a binary search for the line that contains `offset`.
		  
		  #If Not DebugBuild
		    #Pragma DisableBackgroundTasks
		    #Pragma DisableBoundsChecking
		  #EndIf
		  
		  If Count = 0 Then Return -1
		  
		  Var leftIndex As Integer
		  Var rightIndex As Integer = Count - 1
		  Var currLine As SyntaxArea.TextLine
		  
		  While leftIndex < rightIndex
		    Var pivot As Integer = (leftIndex + rightIndex) / 2
		    
		    currLine = lines(pivot)
		    
		    If offset < currLine.Offset Then
		      rightIndex = pivot - 1
		    ElseIf offset > currLine.Offset Then
		      leftIndex = pivot + 1
		    Else
		      leftIndex = pivot
		      Exit While
		    End If
		  Wend
		  
		  If lines(leftIndex).Offset > offset Then Return leftIndex - 1
		  Return leftIndex
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1, Description = 466978657320616C6C20746865206F666673657473207374617274696E672061742074686520676976656E206C696E65206E756D6265722C20776974682074686520676976656E206F66667365742E
		Protected Sub FixOffsets(lineNumber As Integer, startOffset As Integer)
		  /// Fixes all the offsets starting at the given line number, with the given offset.
		  
		  #Pragma DisableBackgroundTasks
		  
		  Var maxIndex As Integer = Lines.LastIndex
		  Var line As SyntaxArea.TextLine
		  
		  For i As Integer = lineNumber To maxIndex
		    line = Lines(i)
		    line.Offset = startOffset
		    startOffset = line.Offset + line.Length
		  Next i
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 466F6C647320616C6C20746865206C696E65732E
		Sub FoldAll()
		  /// Folds all the lines.
		  
		  #If Not DebugBuild
		    #Pragma DisableBackgroundTasks
		    #Pragma DisableBoundsChecking
		  #EndIf
		  
		  Var iLimit As Integer = Lines.LastIndex
		  For i As Integer = 0 To iLimit
		    If Lines(i).IsBlockStart And Not Lines(i).Folded Then
		      Call ToggleLineFolding(i)
		    End If
		  Next i
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetAttributesOfLinesInRange(offset As Integer, length As Integer) As SyntaxArea.TextLineAttributes()
		  Var attrs() As SyntaxArea.TextLineAttributes
		  
		  For Each line As SyntaxArea.TextLine In LinesInRange(offset, length)
		    attrs.Add(line.GetAttributes)
		  Next line
		  
		  Return attrs
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 47657473206120676976656E206C696E652E204D61792072657475726E204E696C2E
		Function GetLine(index As Integer) As SyntaxArea.TextLine
		  /// Gets a given line. May return Nil.
		  
		  If index < 0 Or index >= Count Then Return Nil
		  
		  Return Lines(index)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetLineNumberForOffset(offset As Integer, length As Integer = 0) As Integer
		  If offset = 0 Then Return 0
		  
		  If offset = TextLength + length Then
		    // Empty?
		    If Count = 0 Then Return 0
		    
		    // Last line?
		    Var last As SyntaxArea.TextLine = Lines(Lines.LastIndex)
		    If last.DelimiterLength > 0 Then Return Count
		    Return Count - 1
		  End If
		  
		  Return FindLineNumberForOffset(offset)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E7320746865206C6F6E67657374206C696E652E204D61792072657475726E204E696C2E
		Function GetLongestLine() As SyntaxArea.Textline
		  /// Returns the longest line. May return Nil.
		  
		  If LongestLineIndex < 0 Then Return Nil
		  
		  Return Lines(LongestLineIndex)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function GetNumberOfAffectedLines(startLine As Integer, offset As Integer, length As Integer) As Integer
		  // Same line?
		  If length = 0 Then Return 1
		  
		  Var target As Integer = offset + length
		  
		  Var line As SyntaxArea.TextLine = Lines(startLine)
		  If line.DelimiterLength = 0 Then
		    // Last line.
		    Return 1
		  End If
		  
		  If line.Offset + line.Length > target Then
		    // Within the line.
		    Return 1
		  End If
		  
		  If line.Offset + line.Length = target Then
		    // This line and the next.
		    Return 2
		  End If
		  
		  Return GetLineNumberForOffset(target) - startLine + 1
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E7320746865206E756D626572206F66206C696E6573206E656564656420746F20646973706C617920606C696E65734E6565646564602076697369626C65206C696E65732E
		Function GetNumberOfLinesNeededToView(linesNeeded As Integer) As Integer
		  /// Returns the number of lines needed to display `linesNeeded` visible lines.
		  
		  #If Not DebugBuild
		    #Pragma DisableBackgroundTasks
		    #Pragma DisableBoundsChecking
		  #EndIf
		  
		  If InvisibleLines = 0 Then Return linesNeeded
		  If NeededCache = Nil Then NeededCache = New Dictionary
		  
		  // Check the cache.
		  If NeededCache.HasKey(linesNeeded) Then Return NeededCache.Value(linesNeeded)
		  
		  Var visibleLines As Integer
		  Var iLimit As Integer = Count -1
		  For i As Integer = 0 To iLimit
		    If Lines(i).Visible Then visibleLines = visibleLines + 1
		    
		    If visibleLines > linesNeeded Then
		      NeededCache.Value(linesNeeded) = i
		      Return i
		    End If
		  Next i
		  
		  NeededCache.Value(linesNeeded) = Count - 1
		  
		  Return Count - 1
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E7320746865206E756D626572206F662076697369626C65206C696E657320757020746F20606C696E654E756D626572602E
		Function GetNumberOfVisibleLinesUpToLine(lineNumber As Integer) As Integer
		  /// Returns the number of visible lines up to `lineNumber`.
		  
		  #If Not DebugBuild
		    #Pragma DisableBackgroundTasks
		    #Pragma DisableBoundsChecking
		  #EndIf
		  
		  If InvisibleLines = 0 Then Return lineNumber
		  If VisibleCache = Nil Then VisibleCache = New Dictionary
		  
		  // Check the cache.
		  If VisibleCache.HasKey(lineNumber) Then Return VisibleCache.Value(lineNumber)
		  
		  Var invisibleLines As Integer
		  For i As Integer = 0 To lineNumber
		    If Not Lines(i).Visible Then invisibleLines = invisibleLines + 1
		  Next i
		  
		  VisibleCache.Value(lineNumber) = lineNumber - invisibleLines
		  
		  Return lineNumber - invisibleLines
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub IndentationFinished()
		  mFirstLineForIndentation = Lines.Count
		  mLastLineForIndentation = -1
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 496E73657274732060736020617420606F6666736574602E
		Sub Insert(offset As Integer, s As String, alwaysMarkDirty As Boolean)
		  /// Inserts `s` at `offset`.
		  
		  Replace(offset, 0, s, alwaysMarkDirty)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub InsertLine(index As Integer, segment As SyntaxArea.TextLine)
		  // Insert into the Lines array.
		  Lines.AddAt(index, segment)
		  
		  // See if the new line is longer than the previous longest.
		  If segment.Length > LongestLineLength Then
		    LongestLineIndex = index
		    LongestLineLength = segment.Length
		    NotifyMaxLineLengthChanged(LongestLineIndex)
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LineIsIndented(lineIdx As Integer)
		  If lineIdx = mFirstLineForIndentation Then
		    mFirstLineForIndentation = lineIdx + 1
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LineNeedsIndentation(lineIdx As Integer)
		  Var line As SyntaxArea.TextLine = GetLine(lineIdx)
		  
		  If line <> Nil Then
		    If lineIdx < mFirstLineForIndentation Then
		      mFirstLineForIndentation = lineIdx
		    End If
		    
		    If lineIdx > mLastLineForIndentation Then
		      mLastLineForIndentation = lineIdx
		    End If
		    
		    #If DebugBuild And SyntaxArea.DebugIndentation
		      System.DebugLog "InvalidateLine " + lineIdx.ToString + ", now: " + _
		      mFirstLineForIndentation.ToString + " to " + mLastLineForIndentation.ToString
		    #EndIf
		    
		    line.NeedsIndentation = True
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function LinesInRange(offset As Integer, length As Integer) As SyntaxArea.TextLine()
		  Var result() As SyntaxArea.TextLine
		  
		  Var idx As Integer = GetLineNumberForOffset(offset, length)
		  
		  If idx >= 0 And idx <= Lines.LastIndex Then
		    Var line As SyntaxArea.TextLine = Lines(idx)
		    
		    //Ensuret we cover the range from the start of the lin.e
		    length = length + (offset - line.Offset)
		    
		    While length >= 0
		      result.Add(line)
		      length = length - line.Length
		      idx = idx + 1
		      
		      If idx > Lines.LastIndex Then
		        Exit While
		      End If
		      
		      line = Lines(idx)
		    Wend
		  End If
		  
		  Return result
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E7320746865206C6F6E67657374206C696E65277320696E6465782E
		Function LongestLineIdx() As Integer
		  /// Returns the longest line's index.
		  
		  Return LongestLineIndex
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub MarkAllLinesAsChanged()
		  NotifyLineChangedRange(0, Self.Count)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 46696E647320746865206E65787420626C6F636B20656E642066726F6D2074686973206C696E652E2052657475726E73202D312069662074686572652069736E2774206F6E652E204163636F756E747320666F72206E657374656420626C6F636B732E
		Function NextBlockEndLine(forLine As Integer, ignoreIfLineIsBlockStart As Boolean = False) As Integer
		  /// Finds the next block end from this line. Returns -1 if there isn't one.
		  /// Accounts for nested blocks.
		  
		  #If Not DebugBuild
		    #Pragma DisableBackgroundTasks
		    #Pragma DisableBoundsChecking
		  #EndIf
		  
		  Var testLine As SyntaxArea.TextLine = GetLine(forLine)
		  If testLine = Nil Then Return -1
		  
		  If Not ignoreIfLineIsBlockStart And Not testLine.IsBlockStart Then
		    Return -1
		  End If
		  
		  Var forRule As Object = testLine.BlockStartRule
		  Var depth, idx, match, lastLine As Integer
		  
		  // Search down.
		  lastLine = Lines.LastIndex
		  match = -1
		  For idx = forLine + 1 To lastLine
		    testLine = GetLine(idx)
		    If testLine = Nil Then Continue For
		    
		    Var isBlkEnd As Boolean = testLine.IsBlockEnd(forRule)
		    If depth = 0 And isBlkEnd Then
		      // Found it.
		      match = idx
		      Exit For
		    Else
		      // Nested.
		      Var isBlkStart As Boolean = testLine.IsBlockStart(forRule)
		      If isBlkStart And Not isBlkEnd Then
		        depth = depth + 1
		      ElseIf isBlkEnd And Not isBlkStart Then
		        // Nested out.
		        depth = depth - 1
		      End If
		    End If
		  Next idx
		  
		  Return match
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function NextVisibleLine(fromLine as integer) As integer
		  #If Not DebugBuild
		    #Pragma DisableBackgroundTasks
		    #Pragma DisableBoundsChecking
		  #EndIf
		  
		  If InvisibleLines = 0 Then Return fromLine
		  
		  Var iLimit As Integer = Count - 1
		  For i As Integer = fromLine To iLimit
		    If Lines(i).Visible Then Return i
		  Next i
		  
		  Return PreviousVisibleLine(fromLine)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub NotifyLineChangedRange(startIndex As Integer, length As Integer)
		  If length <= 0 Then Return
		  
		  Var msg As New SyntaxArea.Message(Self, Self)
		  msg.AddInfo(Messages.MessageType, Messages.LineChanged)
		  msg.AddInfo(Messages.LineChangedStartIndex, startIndex)
		  msg.AddInfo(Messages.LineChangedLength, length)
		  
		  SyntaxArea.MessageCentre.SendMessage(msg)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub NotifyLineCountChanged()
		  Var msg As New SyntaxArea.Message(Self, Self)
		  msg.AddInfo(Messages.MessageType, Messages.LineCountChanged)
		  msg.AddInfo(Messages.LineCount, count)
		  
		  MessageCentre.SendMessage(msg)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub NotifyMaxLineLengthChanged(longestLineIndex As Integer)
		  Var msg As New SyntaxArea.Message(Self, Self)
		  msg.AddInfo(Messages.MessageType, Messages.MaxLineLengthChanged)
		  msg.AddInfo(2, longestLineIndex)
		  
		  MessageCentre.SendMessage(msg)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 46696E6473207468652070726576696F757320626C6F636B2073746172742066726F6D2074686973206C696E652E2052657475726E73202D31206966207468657265206973206E6F6E652E204163636F756E747320666F72206E657374656420626C6F636B732E
		Function PreviousBlockStartLine(forLine As Integer, ignoreIfLineIsBlockEnd As Boolean = False) As Integer
		  /// Finds the previous block start from this line. Returns -1 if there is none.
		  /// Accounts for nested blocks.
		  
		  #If Not DebugBuild
		    #Pragma DisableBackgroundTasks
		    #Pragma DisableBoundsChecking
		  #EndIf
		  
		  Var testLine As SyntaxArea.TextLine = GetLine(forLine)
		  If testLine = Nil Then Return - 1
		  
		  If Not ignoreIfLineIsBlockEnd And Not testLine.IsBlockEnd Then
		    Return -1
		  End If
		  
		  Var forRule As Object = testLine.BlockEndRule
		  Var depth, idx As Integer
		  Var match As Integer = -1
		  
		  For idx = forLine - 1 DownTo 0
		    testLine = GetLine(idx)
		    If testLine = Nil Then Continue For
		    
		    Var isBlkStart As Boolean = testLine.IsBlockStart(forRule)
		    
		    If depth = 0 And isBlkStart Then
		      // Found it.
		      match = idx
		      Exit For
		    Else
		      // Nested.
		      Var isBlkEnd As Boolean = testLine.IsBlockEnd(forRule)
		      If isBlkEnd And Not isBlkStart Then
		        depth = depth + 1
		      ElseIf isBlkStart And Not isBlkEnd Then
		        // Out of inner block.
		        depth = depth - 1
		      End If
		    End If
		  Next idx
		  
		  Return match
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 46696E6473207468652070726576696F75732076697369626C65206C696E652066726F6D206120676976656E206C696E652E
		Function PreviousVisibleLine(fromLine As Integer) As Integer
		  /// Finds the previous visible line from a given line.
		  
		  #If Not DebugBuild
		    #Pragma DisableBackgroundTasks
		    #Pragma DisableBoundsChecking
		  #EndIf
		  
		  If InvisibleLines = 0 Then Return fromLine
		  
		  For i As Integer = fromLine DownTo 0
		    If Lines(i).Visible Then Return i
		  Next i
		  
		  Return -1
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52656D6F76657320746578742066726F6D2074686520646F63756D656E742E
		Sub Remove(offset As Integer, length As Integer)
		  /// Removes text from the document.
		  
		  Replace(offset, length, "", True)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub RemoveLine(index As Integer)
		  RemoveLineSymbols(index, index)
		  
		  Lines.RemoveAt(index)
		  
		  // If the removed line was the longest we need to rescan.
		  If index = LongestLineIndex Then NeedsLongestRescan = True
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1, Description = 44656C65746573206120706F7274696F6E206F66207468652061727261792E
		Protected Sub RemoveLineSlice(arr() As SyntaxArea.TextLine, fromIndex As Integer = 0, toIndex As Integer = 0)
		  /// Deletes a portion of the array.
		  ///
		  /// Taken from Joe Strout's open source Array Utilities:
		  /// http://www.verex.com/opensource/
		  
		  #If Not DebugBuild
		    #Pragma DisableBackgroundTasks
		    #Pragma DisableBoundsChecking
		  #EndIf
		  
		  Var ub As Integer = arr.LastIndex
		  If fromIndex < 0 Then fromIndex = ub + 1 + fromIndex
		  If toIndex <= 0 Then toIndex = ub + 1 + toIndex
		  
		  // Empty (or invalid) range?
		  If fromIndex >= toIndex Then Return
		  
		  RemoveLineSymbols(fromIndex, toIndex - 1)
		  
		  If LongestLineIndex >= fromIndex And LongestLineIndex <= toIndex Then NeedsLongestRescan = True
		  
		  // Easy case: Deleting the end of the array. We can just resize and be done.
		  If toIndex - 1 = ub Then
		    arr.ResizeTo(fromIndex - 1)
		    Return
		  End If
		  
		  // Another easy case: Deleting just one element (equivalent to Array.Remove).
		  If fromIndex = toIndex - 1 Then
		    arr.RemoveAt(fromIndex)
		    Return
		  End If
		  
		  // Harder case: Copy the data down, and then resize.
		  Var dest As Integer = fromIndex
		  For src As Integer = toIndex To ub
		    arr(dest) = arr(src)
		    dest = dest + 1
		  Next src
		  
		  arr.ResizeTo(dest - 1)
		  
		  Return
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1, Description = 4C6F6F6B7320666F722073796D626F6C7320696E20746865206C696E6573207468617420617265206265696E672072656D6F7665642E20496620666F756E64207765206D6573736167652074686520656469746F7220746F2072656D6F766520737563682073796D626F6C732066726F6D206974732073796D626F6C207461626C652E
		Protected Sub RemoveLineSymbols(fromIndex As Integer, toIndex As Integer)
		  /// Looks for symbols in the lines that are being removed.
		  /// If found we message the editor to remove such symbols from its symbol table.
		  
		  #If Not DebugBuild
		    #Pragma DisableBackgroundTasks
		    #Pragma DisableBoundsChecking
		  #EndIf
		  
		  Var tmp As New Dictionary
		  Var line As SyntaxArea.TextLine
		  For i As Integer = fromIndex To toIndex
		    line = GetLine(i)
		    If line = Nil Or line.LineSymbols = Nil Or line.LineSymbols.KeyCount = 0 Then Continue For
		    tmp.Value(line) = Nil
		  Next i
		  
		  If tmp.KeyCount = 0 Then Return
		  
		  Var msg As New SyntaxArea.Message(Self, Self)
		  msg.AddInfo(1, Messages.LineSymbolsRemoved)
		  msg.AddInfo(2, tmp)
		  
		  If toIndex - fromIndex <= 2 Then
		    MessageCentre.SendMessage(msg)
		  Else
		    MessageCentre.QueueMessage(msg)
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 5265706C616365732061206368756E6B206F66207465787420776974682060736020616E64206C656E67746820606C656E6774686020617420706F736974696F6E20606F6666736574602E
		Sub Replace(offset As Integer, length As Integer, s As String, alwaysMarkDirty As Boolean)
		  /// Replaces a chunk of text with `s` and length `length` at position `offset`.
		  ///
		  /// This method doesn't actually store the text (that's handled by `TextStorage.Replace()`
		  /// but only needs to read its length.
		  
		  #If Not DebugBuild
		    #Pragma DisableBackgroundTasks
		    #Pragma DisableBoundsChecking
		  #EndIf
		  
		  Var lineNumber As Integer = GetLineNumberForOffset(offset, length)
		  
		  If alwaysMarkDirty Then
		    // Mark line as needing indendation.
		    LineNeedsIndentation(lineNumber)
		  End If
		  
		  // Save the original index as it may change.
		  Var originalLine As Integer = lineNumber
		  
		  // We'll store the old highlight context, in case the modified line has one.
		  var oldContext As SyntaxArea.HighlightContext
		  
		  Var lineCount As Integer = Self.Count
		  
		  Var line As TextLine
		  If lineNumber <= lines.LastIndex Then
		    line = lines(lineNumber)
		  End If
		  
		  If length > 0 And line <> Nil Then //merge affected lines...
		    Var numberOfAffectedLines As Integer = getNumberOfAffectedLines(lineNumber, offset, length)
		    Var endLine As TextLine = lines(lineNumber + numberOfAffectedLines - 1)
		    
		    If numberOfAffectedLines > 1 And invisibleLines > 0 Then
		      currentInvisibleLines = -1
		    End If
		    
		    // Save the highlight context of the last line.
		    oldContext = endLine.Context
		    
		    line.Length = endLine.Offset + endLine.Length - line.Offset
		    line.DelimiterLength = endLine.DelimiterLength
		    RemoveLineSlice(Lines, lineNumber + 1, lineNumber + numberOfAffectedLines)
		    line.InvalidateWords
		  End If
		  
		  If line = Nil Then
		    // Ignore.
		    
		  ElseIf length = 0 And s.Length = 1 And s <> LineEnding Then
		    // Simple keystroke.
		    RemoveLineSymbols(lineNumber, lineNumber)
		    
		    // Make line longer by one character.
		    line.Length = line.Length + 1
		    
		    // Fix the offsets.
		    FixOffsets(lineNumber + 1, line.Offset + line.Length)
		    
		    line.InvalidateWords
		    
		    NotifyLineChangedRange(lineNumber, 1)
		    
		    // See if it's now the longest line.
		    If line.Length > LongestLineLength Then
		      LongestLineIndex = lineNumber
		      LongestLineLength = line.Length
		      NotifyMaxLineLengthChanged(LongestLineIndex)
		    End If
		    
		  ElseIf length = 1 And s.Length = 0 Then
		    // Simple delete.
		    RemoveLineSymbols(lineNumber, lineNumber)
		    
		    // Make the line shorter by one character.
		    line.Length = line.Length - 1
		    
		    // Fix the offsets.
		    FixOffsets(lineNumber + 1, line.Offset + line.Length)
		    
		    line.InvalidateWords
		    
		    NotifyLineChangedRange(lineNumber, 1)
		    
		    // If this was the longest line, do a rescan.
		    If lineNumber = LongestLineIndex Then NeedsLongestRescan = True
		    
		  Else
		    // Every other case (long text, returns, etc).
		    // First, unfold line if folded, and we're adding to the end of the line...
		    If line.Folded And offset = line.Offset + line.Length - line.DelimiterLength Then
		      Call ToggleLineFolding(originalLine)
		    End If
		    
		    // line now contains a merged line composing all affected lines.
		    Var delta As Integer = line.Length - length + s.Length
		    
		    // Remove merged line, and start parsing/inserting.
		    RemoveLine(lineNumber)
		    Var insertedLines As Integer = CreateLines(lineNumber, line.Offset, delta, line.Indent, _
		    line.IsContinuedFromLine, alwaysMarkDirty)
		    Lines(lineNumber).AdoptLine(line)
		    lineNumber = lineNumber + insertedLines
		    
		    // Fix the offsets starting from the last modified line.
		    line = Lines(Max(lineNumber - 1, 0))
		    If delta <> 0 Then FixOffsets(lineNumber, line.Offset + line.Length)
		    
		    // Reset the context if any.
		    If oldContext <> Nil Then
		      Lines(originalLine).Context = oldContext
		      NotifyLineChangedRange(originalLine, 1)
		    End
		  End If
		  
		  // Rescan lengths if necessary.
		  If NeedsLongestRescan Then RescanLengths
		  
		  // Fire the LineChangedDelegate if any.
		  If lineCount <> Count Then
		    NotifyLineCountChanged
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 46696E647320746865206C6F6E67657374206C696E652E
		Sub RescanLengths()
		  /// Finds the longest line.
		  
		  LongestLineIndex = -1
		  LongestLineLength = -1
		  
		  #Pragma DisableBackgroundTasks
		  
		  Var idx As Integer
		  For Each line As SyntaxArea.TextLine In Lines
		    If line.Length > LongestLineLength Then
		      LongestLineLength = line.Length
		      LongestLineIndex = idx
		    End If
		    idx = idx + 1
		  Next line
		  
		  NeedsLongestRescan = False
		  
		  If LongestLineIndex < 0 Then Return
		  
		  NotifyMaxLineLengthChanged(LongestLineIndex)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 457870616E647320616C6C20696E76697369626C65206C696E6573207374617274696E6720617420606C696E654E756D6265726020757077617264732E
		Sub RevealLine(lineNumber As Integer)
		  /// Expands all invisible lines starting at `lineNumber` upwards.
		  
		  Var current As SyntaxArea.TextLine
		  For i As Integer = lineNumber DownTo 0
		    current = Lines(i)
		    If current.Folded Then Call ToggleLineFolding(i)
		    If current.Visible Then Return
		  Next i
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetAttributesOfLinesInRange(offset As Integer, length As Integer, attrs() As SyntaxArea.TextLineAttributes)
		  Var lineCount As Integer
		  For Each line As SyntaxArea.TextLine In LinesInRange(offset, length)
		    line.SetAttributes(attrs(lineCount))
		    lineCount = lineCount + 1
		  Next line
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetText(length As Integer)
		  Clear
		  
		  Call CreateLines(0, 0, length, 0, -1)
		  
		  NotifyLineCountChanged
		  
		  NotifyMaxLineLengthChanged(LongestLineIndex)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ToggleLineFolding(lineNumber As Integer) As Integer
		  Var line As SyntaxArea.TextLine = GetLine(lineNumber)
		  If line = Nil Then Return -1
		  
		  // Check if line is a block end/start.
		  If Not line.IsBlockStart And Not line.IsBlockEnd Then
		    Return -1
		  End If
		  
		  // Find the range.
		  Var testLine As SyntaxArea.TextLine
		  Var idx As Integer
		  Var forRule As Object
		  Var match As Integer = -1
		  
		  If line.IsBlockStart Then
		    // Search down.
		    match = NextBlockEndLine(lineNumber)
		    If match < 0 Then Return -1
		    forRule = line.BlockStartRule
		    
		  Else
		    // Search up.
		    match = PreviousBlockStartLine(lineNumber)
		    If match < 0 Then Return -1
		    
		    forRule = line.BlockEndRule
		    
		    // Toggle lines' visibility.
		    line = GetLine(match)
		    Var tmp As Integer
		    tmp = match
		    match = lineNumber
		    lineNumber = tmp
		  End If
		  
		  line.Folded = Not line.Folded
		  Var targetState As Boolean = Not line.Folded
		  
		  Var lineStack() As Boolean
		  lineStack.Add(Not line.Folded)
		  
		  For idx = lineNumber + 1 To match
		    testLine = Lines(idx)
		    
		    If targetState = False Then
		      // We're making everything invisibl so, we don't care.
		      testLine.Visible = False
		    Else
		      // We have to check for parent states.
		      testLine.Visible = lineStack(lineStack.LastIndex)
		      
		      Var isBlkStart As Boolean = testLine.IsBlockStart(forRule)
		      Var isBlkEnd As Boolean = testLine.IsBlockEnd(forRule)
		      
		      If isBlkStart And Not isBlkEnd Then
		        lineStack.Add(Not testLine.Folded And lineStack(lineStack.LastIndex))
		        
		      ElseIf isBlkEnd And Not isBlkStart Then
		        Call lineStack.Pop
		      End If
		    End If
		  Next idx
		  
		  // Force recalculation of InvisibleLines.
		  CurrentInvisibleLines = -1
		  NotifyLineCountChanged
		  
		  Return lineNumber
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 457870616E647320616C6C20666F6C646564206C696E65732E
		Sub UnfoldAll()
		  /// Expands all folded lines.
		  
		  #If Not DebugBuild
		    #Pragma DisableBackgroundTasks
		    #Pragma DisableBoundsChecking
		  #EndIf
		  
		  Var lines As Integer = Count - InvisibleLines
		  
		  For i As Integer = 0 To Count - 1
		    If Self.Lines(i).Folded Then Self.Lines(i).Folded = False
		    Self.Lines(i).Visible = True
		  Next i
		  
		  CurrentInvisibleLines = -1
		  
		  If lines <> Count - InvisibleLines Then NotifyLineCountChanged
		  
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return Lines.LastIndex + 1
			End Get
		#tag EndGetter
		Count As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h1
		Protected CurrentInvisibleLines As Integer = -1
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mFirstLineForIndentation
			End Get
		#tag EndGetter
		FirstLineForIndentation As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If CurrentInvisibleLines < 0 Then
			    CurrentInvisibleLines = CalculateInvisibleLines
			  End If
			  
			  Return CurrentInvisibleLines
			End Get
		#tag EndGetter
		InvisibleLines As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mLastLineForIndentation
			End Get
		#tag EndGetter
		LastLineForIndentation As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		LineEnding As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected Lines() As SyntaxArea.TextLine
	#tag EndProperty

	#tag Property, Flags = &h0
		LinesLock As CriticalSection
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected LongestLineIndex As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected LongestLineLength As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mFirstLineForIndentation As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mLastLineForIndentation As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mTabwidth As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected NeededCache As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected NeedsLongestRescan As Boolean = False
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mTabWidth
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mTabWidth = value
			  
			  For Each line As SyntaxArea.TextLine In Lines
			    line.TabWidth = value
			  Next line
			  
			End Set
		#tag EndSetter
		TabWidth As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Return TextStorage.Length
			End Get
		#tag EndGetter
		Protected TextLength As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h1
		Protected TextStorage As SyntaxArea.GapBuffer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected TmpDefinition As SyntaxArea.HighlightDefinition
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected VisibleCache As Dictionary
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Count"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="FirstLineForIndentation"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="InvisibleLines"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LastLineForIndentation"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LineEnding"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabWidth"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
