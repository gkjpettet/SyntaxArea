#tag Class
Protected Class TextLine
Inherits SyntaxArea.TextSegment
	#tag CompatibilityFlags = ( TargetConsole and ( Target32Bit or Target64Bit ) ) or ( TargetWeb and ( Target32Bit or Target64Bit ) ) or ( TargetDesktop and ( Target32Bit or Target64Bit ) ) or ( TargetIOS and ( Target64Bit ) ) or ( TargetAndroid and ( Target64Bit ) )
	#tag Event
		Sub LengthChanged()
		  IsDirty = true
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21, Description = 417070656E6473206120776F726420746F2074686973206C696E652E
		Private Sub AddWord(word As SyntaxArea.TextSegment)
		  /// Appends a word to this line.
		  
		  If word.Length = 0 Then Return
		  
		  Words.Add(word)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 49662061206C696E65206765747320757064617465642C2061206E657720546578744C696E65206F626A656374206973206F6674656E20637265617465642E205468656E2074686973206D6574686F642069732063616C6C656420736F207468617420757365722D7365747461626C652070726F706572746965732063616E2062652063617272696564206F7665722E
		Sub AdoptLine(from As SyntaxArea.TextLine)
		  /// If a line gets updated, a new TextLine object is often created.
		  /// Then this method is called so that user-settable properties can
		  /// be carried over.
		  
		  mLineAttributes = from.mLineAttributes
		  
		  mIndentationStateIn = from.mIndentationStateIn
		  mIndentationStateOut = from.mIndentationStateOut
		  mChangedIndentState = from.mChangedIndentState
		  mIsBlkStart = from.mIsBlkStart
		  mIsBlkEnd = from.mIsBlkEnd
		  mBlockIndent = from.mBlockIndent
		  mBlockStartRule = from.mBlockStartRule
		  mBlockEndRule = from.mBlockEndRule
		  IsContinuedFromLine = from.IsContinuedFromLine
		  
		  InvalidateWords()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AppendHighlightedWords(storage() As SyntaxArea.CharSelection, lineIndex As Integer)
		  For Each word As SyntaxArea.TextSegment In words
		    If word.HasBackgroundColor Then
		      Var tmp As New SyntaxArea.CharSelection(Self.Offset + word.Offset, word.Length, lineIndex, lineIndex, word.BackgroundColor)
		      storage.Add(tmp)
		    End If
		  Next word
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function BlockEndRule() As Object
		  Return mBlockEndRule
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function BlockStartRule() As Object
		  Return mBlockStartRule
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ChangedIndentStateAndReset() As Boolean
		  Var b As Boolean = mChangedIndentState
		  
		  mChangedIndentState = False
		  
		  Return b
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CharToDisplayAt(buffer As SyntaxArea.Gapbuffer, index As Integer, displayInvisible As Boolean) As String
		  Var theChar As String = buffer.GetCharAt(Self.Offset + index)
		  
		  Select Case theChar
		  Case " "
		    Return " "
		    
		  Case Chr(9)
		    Return TABCHAR
		    
		  Case Chr(10), Chr(13)
		    If displayInvisible Then
		      Return VISIBLE_EOL_CHAR
		    Else
		      Return ""
		    End If
		    
		  Else
		    Return theChar
		  End Select
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(offset As Integer, length As Integer, delimiterLength As Integer, tabWidth As Integer, indent As Integer, lineContIdx As Integer)
		  Visible = True
		  Folded = False
		  mLineAttributes = New SyntaxArea.TextLineAttributes
		  Super.Constructor(offset, length)
		  Self.DelimiterLength = delimiterLength
		  Self.TabWidth = tabWidth
		  Self.Indent = indent
		  Self.IsContinuedFromLine = lineContIdx
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetAttributes() As SyntaxArea.TextLineAttributes
		  Return mLineAttributes
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HasPlaceholders() As Boolean
		  Return Placeholders.LastIndex > -1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Highlight(definition As SyntaxArea.HighlightDefinition, storage As SyntaxArea.GapBuffer, forcedContext As SyntaxArea.HighlightContext = Nil, defaultColor As Color = &c0) As SyntaxArea.HighlightContext
		  #Pragma DisableBackgroundTasks
		  
		  Words.ResizeTo(-1)
		  Placeholders.ResizeTo(-1)
		  LineSymbols = Nil
		  Highlighted = False
		  
		  If Me.Length = 0 Then Return Nil
		  
		  If definition = Nil Then
		    ParseLine(storage, defaultColor)
		    Return Nil
		  End If
		  
		  Var myText As String = storage.GetText(offset, length)
		  
		  // Run the highlighter, using this line as input and adding an extra EOL to make sure 
		  // the definition matches EOLs.
		  Context = definition.Highlight(myText + chr(13), Words, Placeholders, forcedContext)
		  
		  // As we added an extra eol, remove it.
		  Call Words.Pop
		  
		  LineSymbols = definition.ScanSymbols(myText)
		  
		  // If the highlighter returned a non-Nil context, we need to inform the Highlight thread, 
		  // so it highlights the next line with the current context.
		  highlighted = True
		  Return Context
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52656D6F76657320616C6C20776F7264732066726F6D2074686973206C696E652E
		Sub InvalidateWords()
		  /// Removes all words from this line.
		  
		  Words.ResizeTo(-1)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsBlockEnd(forRule As Object = Nil) As Boolean
		  Return mIsBlkEnd And(forRule = Nil Or forRule = mBlockEndRule)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsBlockStart(forRule As Object = Nil) As Boolean
		  Return mIsBlkStart And mBlockIndent <> 0 And(forRule = Nil Or forRule = mBlockStartRule)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LocalSegmentForXPos(xpos As Integer) As SyntaxArea.TextSegment
		  #If Not DebugBuild
		    #Pragma DisableBackgroundTasks
		    #Pragma DisableBoundsChecking
		  #EndIf
		  
		  Var sum As Single
		  Var word As SyntaxArea.TextSegment
		  For Each word In Words
		    If xpos >= sum And xpos <= sum + Word.Width Then
		      Exit For
		    End If
		    sum = sum + Word.width
		  Next word
		  
		  If word = Nil Then Return Nil
		  
		  // The desired x position is within `word`.
		  Return word
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function NextPlaceholderFromOffset(offset As Integer) As SyntaxArea.TextPlaceholder
		  If Not Self.HasPlaceholders Then Return Nil
		  
		  For Each placeholder As SyntaxArea.TextPlaceholder In Placeholders
		    If Placeholder.Offset + Self.Offset > offset Then Return placeholder
		  Next placeholder
		  
		  Return Nil
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 44726177732074686973206C696E652E
		Sub Paint(storage As SyntaxArea.GapBuffer, g As Graphics, x As Double, y As Double, defaultColor As Color, displayInvisible As Boolean, selStart As Integer, selLength As Integer, showLeadingSpace As Boolean, indentVisually As Boolean)
		  /// Draws this line.
		  
		  #If Not DebugBuild
		    #Pragma DisableBackgroundTasks
		    #Pragma DisableBoundsChecking
		  #EndIf
		  
		  // If there are no words in this line, we need to at least quick-parse it 
		  // so we can display it.
		  If Words.LastIndex < 0 And Length > 0 Then
		    ParseLine(storage, defaultColor)
		  End If
		  
		  If indentVisually Then x = Self.Indent + x
		  
		  Width = 0
		  Var TheText As String
		  Var word As SyntaxArea.TextSegment
		  Var wordFound As Boolean
		  Var darkerHighlightColor As Color = Color.HighlightColor.DarkerColor(50, True)
		  
		  // Paint the tokens.
		  For i As Integer = 0 To Words.LastIndex
		    word = Words(i)
		    g.DrawingColor = darkerHighlightColor
		    
		    Var selfWordOfs As Integer = word.Offset + Self.Offset
		    
		    If word.TYPE = TYPE_SPACE Then
		      TheText = " "
		      If Not showLeadingSpace And Not wordFound Then Continue For
		      
		    ElseIf Word.TYPE = TYPE_TAB Then
		      TheText = TABCHAR
		      If Not showLeadingSpace And Not wordFound Then Continue For
		      
		    ElseIf Word.TYPE = TYPE_EOL Then
		      If displayInvisible Then
		        TheText = VISIBLE_EOL_CHAR
		      Else
		        TheText = ""
		      End If
		      If Not showLeadingSpace And Not wordFound Then Continue For
		      
		    ElseIf word.TYPE = TYPE_PLACEHOLDER Then
		      wordFound = True
		      // Determine the highlight colour
		      If highlighted Then
		        g.DrawingColor = SyntaxArea.AdjustColorForDarkMode(word.TextColor)
		      Else
		        g.DrawingColor = defaultColor
		      End If
		      
		      // `Graphics.DrawText()` can't handle UTF-32 (on OSX, at least)...
		      TheText = storage.GetText(SyntaxArea.TextPlaceholder(word).TextRange.Offset + offset, SyntaxArea.TextPlaceholder(word).TextRange.Length).ConvertEncoding(Encodings.UTF8)
		      TheText = PLACEHOLDER_PADDING_STRING + TheText + PLACEHOLDER_PADDING_STRING
		      
		    Else
		      wordFound = True
		      // Determine the highlight colour.
		      If highlighted Then
		        g.DrawingColor = SyntaxArea.AdjustColorForDarkMode(word.TextColor)
		      Else
		        g.DrawingColor = defaultColor
		      End If
		      TheText = storage.GetText(selfWordOfs, word.Length)
		      
		      // Convert Chr(1), which we use for original NUL chars, to a "NUL" character for display.
		      TheText = TheText.ReplaceAll(Chr(1), "␀")
		    End If
		    
		    g.Bold = Word.Bold Or bold
		    g.Underline = Word.Underline Or underline
		    g.Italic = word.Italic Or italic
		    
		    // Cache the width.
		    If word.LastFont <> g.FontName Or word.LastSize <> g.FontSize Or showInvisible <> displayInvisible Then
		      word.Width = -1
		    End If
		    If word.Width < 0 Then
		      word.Width = g.TextWidth(TheText)
		    End If
		    
		    // Draw the text.
		    If(word.Type = TYPE_WORD Or word.Type = TYPE_PLACEHOLDER Or displayInvisible) And x + word.Width >= 0 And x < g.Width And y >= 0 And y <= g.Height + g.TextHeight Then
		      If Word.TYPE = TYPE_TAB Then
		        // A hack to make the visible character the same width as the tab.
		        TheText = VISIBLE_TAB_CHAR
		      ElseIf Word.TYPE = TYPE_SPACE Then
		        TheText = VISIBLE_SPACE_CHAR
		      End If
		      
		      If word.TYPE = TYPE_PLACEHOLDER Then
		        Var oldc As Color = g.DrawingColor
		        Var colorOffset As Integer = 0
		        
		        // Make the colour darker if the placeholder is in selection.
		        If selfWordOfs >= selStart And selfWordOfs + Word.Length <= selStart + selLength Then
		          colorOffset = 50
		          oldc = oldc.InvertColor
		        End If
		        
		        Var baseCol As Color = SyntaxArea.TextPlaceholder(word).PlaceholderBackgroundColor
		        g.DrawingColor = baseCol.DarkerColor(colorOffset, True)
		        g.FillRoundRectangle(x, y - g.FontAscent, word.Width, g.TextHeight + 1, g.TextHeight, g.TextHeight)
		        
		        g.DrawingColor = baseCol.DarkerColor(30, True).DarkerColor(colorOffset, True)
		        g.DrawRoundRectangle(x, y - g.FontAscent, word.Width, g.TextHeight + 1, g.TextHeight, g.TextHeight)
		        
		        g.DrawingColor = oldc
		      End If
		      
		      #If TargetMacOS
		        // Draw the word normally
		        g.DrawText(TheText, x, y)
		        
		      #Else
		        // On Windows and Linux, selection colours are usually rather dark, which
		        // in turn requires the text to be shown in white when it's selected.
		        If _
		          selLength > 0 And _
		          (selStart < selfWordOfs + word.Length) And _ // Does the selection start before end of this word?
		          (selStart + selLength > selfWordOfs) Then // Does the selection end after start of this word?
		          // if part of the text is selected, we need to split it up into the selected and unselected part,
		          // and draw them in different colors
		          
		          Var l1, l2, l3 As Integer
		          Var t1, t2, t3 As String
		          Var w As Double
		          Var normalColor As Color = g.DrawingColor
		          
		          // The part before the selection.
		          l1 = Max(0, selStart - selfWordOfs)
		          
		          // The part inside the selection.
		          l2 = selLength - Max(0, selfWordOfs - selStart)
		          
		          // The part after the selection.
		          l3 = word.Length - (l1 + l2)
		          
		          t1 = TheText.Left(l1)
		          t2 = TheText.Middle(l1, l2)
		          t3 = TheText.Middle(l1 + l2)
		          
		          If t1 <> "" Then
		            g.DrawText(t1, x, y)
		            w = g.TextWidth(t1)
		          End If
		          
		          g.DrawingColor = SyntaxArea.AdjustColorForDarkMode(&cFFFFFF)
		          g.DrawText(t2, x + w, y)
		          
		          If t3 <> "" Then
		            w = g.TextWidth(t1 + t2)
		            g.DrawingColor = normalColor
		            g.DrawText(t3, x + w, y)
		          End If
		          
		        Else
		          // Draw the word normally.
		          g.DrawText(TheText, x, y)
		        End If
		      #EndIf
		      
		    End If
		    
		    x = x + word.Width
		    width = width + Word.Width
		    word.LastFont = g.FontName
		    word.LastSize = g.FontSize
		  Next
		  
		  // Ellipsis image.
		  If folded Then
		    Var img As Picture = SyntaxArea.BlockFoldedTrailImage
		    g.DrawPicture(img, x + 3, y - g.FontAscent + (g.TextHeight - img.Height) / 2 + 1)
		  End If
		  
		  showInvisible = displayInvisible
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1, Description = 517569636B6C79207061727365732061206C696E652C2073706C697474696E67206974207573696E672073706163657320616E6420746162732E
		Protected Sub ParseLine(buffer As SyntaxArea.GapBuffer, defaultColor As Color)
		  /// Quickly parses a line, splitting it using spaces and tabs.
		  ///
		  /// http://support.realsoftware.com/listarchives/gettingstarted/2005-05/msg00157.html
		  
		  Words.ResizeTo(-1)
		  
		  Var theText As String = buffer.GetText(Offset, Length)
		  If theText.Encoding <> Nil Then theText = theText.ConvertEncoding(SyntaxArea.InternalEncoding)
		  
		  Var scanner As New RegEx
		  scanner.SearchPattern = "[ ]|\t|\x0A|(?:\x0D\x0A?)"
		  
		  Var match As RegExMatch
		  Var offset, length, subStart As Integer
		  Var char As String
		  
		  match = scanner.Search(theText)
		  While match <> Nil
		    subStart = theText.LeftBytes(match.SubExpressionStartB(0)).Length
		    
		    length = substart - offset
		    
		    // Everything from last position up to this whitespace.
		    AddWord(New SyntaxArea.TextSegment(offset, length, SyntaxArea.TextSegment.TYPE_WORD, defaultColor))
		    
		    offset = substart + match.SubExpressionString(0).Length
		    
		    // Sort out the whitespace.
		    char = match.SubExpressionString(0)
		    
		    Select Case char
		    Case Chr(9) // Tab.
		      AddWord(New SyntaxArea.TextSegment(substart, match.SubExpressionString(0).Length, SyntaxArea.TextSegment.TYPE_TAB, defaultColor))
		      
		    Case " "
		      AddWord(New SyntaxArea.TextSegment(substart, match.SubExpressionString(0).Length, SyntaxArea.TextSegment.TYPE_SPACE, defaultColor))
		      
		    Case Chr(10), Chr(13), Chr(13) + Chr(10) // EOLs.
		      AddWord(New SyntaxArea.TextSegment(substart, match.SubExpressionString(0).Length, SyntaxArea.TextSegment.TYPE_EOL, defaultColor))
		    End Select
		    
		    match = scanner.Search
		  Wend
		  
		  // Add any trailing text.
		  If offset < theText.Length Then
		    AddWord(New SyntaxArea.TextSegment(offset, theText.Length - offset, SyntaxArea.TextSegment.TYPE_WORD, defaultColor))
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PlaceholderForOffset(offset As Integer) As SyntaxArea.TextPlaceholder
		  For Each placeholder As SyntaxArea.TextPlaceholder In Placeholders
		    If Placeholder.InRange(offset - Self.Offset) Then Return placeholder
		  Next placeholder
		  
		  Return Nil
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 55736564207768656E207072696E74696E672066726F6D2074686520656469746F722E2044726177732074686973206C696E652E
		Function PrinterPaint(storage As SyntaxArea.GapBuffer, g As Graphics, x As Double, y As Double, w As Integer, defaultColor As Color, displayInvisible As Boolean, wrap As Boolean, indentVisually As Boolean) As Integer
		  /// Used when printing from the editor.
		  /// Draws this line.
		  
		  #If Not DebugBuild
		    #Pragma DisableBackgroundTasks
		    #Pragma DisableBoundsChecking
		  #EndIf
		  
		  Var ox As Integer = x
		  Var lines As Integer = 1
		  
		  // If there are no words in this line, we need to at least quickly parse it so we can display it.
		  If Words.LastIndex < 0 And length > 0 Then
		    ParseLine(storage, defaultColor)
		  End If
		  
		  Var words() As SyntaxArea.TextSegment
		  
		  width = 0
		  Var s As String
		  Var word As SyntaxArea.TextSegment
		  
		  // Make copies of tokens, in case we need to split.
		  For Each word In Self.Words
		    words.Add(word.Clone)
		  Next word
		  
		  // Paint the tokens.
		  Var iLimit As Integer = words.LastIndex
		  For i As Integer = 0 To iLimit
		    word = words(i)
		    g.DrawingColor = Color.HighlightColor.DarkerColor(50, False)
		    
		    If word.Type = TYPE_SPACE Then
		      s = " "
		      
		    ElseIf word.Type = TYPE_TAB Then
		      s = TABCHAR
		      
		    ElseIf word.Type = TYPE_EOL Then
		      If displayInvisible Then
		        s = VISIBLE_EOL_CHAR
		      Else
		        s = ""
		      End If
		      
		    ElseIf word.Type = TYPE_PLACEHOLDER Then
		      // Determine the highlight colour.
		      If highlighted Then
		        g.DrawingColor = word.TextColor
		      Else
		        g.DrawingColor = defaultColor
		      End If
		      s = PLACEHOLDER_PADDING_STRING + storage.GetText(SyntaxArea.TextPlaceholder(word).TextRange.Offset + Offset, _
		      SyntaxArea.TextPlaceholder(word).TextRange.Length) + PLACEHOLDER_PADDING_STRING
		      
		    Else
		      // Determine the highlight colour.
		      If highlighted Then
		        g.DrawingColor = word.TextColor
		      Else
		        g.DrawingColor = defaultColor
		      End If
		      s = storage.GetText(word.Offset + Offset, word.Length)
		    End If
		    
		    g.Bold = word.Bold Or Bold
		    g.Underline = word.Underline Or Underline
		    g.Italic = word.Italic Or Italic
		    
		    // Cache the width.
		    If word.LastFont <> g.FontName Or word.LastSize <> g.FontSize Or showInvisible <> displayInvisible Then
		      word.Width = -1
		    End If
		    If word.Width < 0 Then
		      word.Width = g.TextWidth(s)
		    End If
		    
		    // Text wrap.
		    If x + word.Width > ox + w Then
		      // split the word?
		      If word.Width > w Then
		        Var idx As Integer
		        For idx = 1 To word.Length
		          If g.TextWidth(storage.GetText(word.Offset + Offset, idx)) >= w Then Exit For
		        Next idx
		        
		        idx = idx - 1
		        Var tmp As SyntaxArea.TextSegment = word.SplitAtLength(idx)
		        If wrap Then words.AddAt(i + 1, tmp)
		        i = i - 1
		        Continue For
		        
		      ElseIf wrap Then
		        y = y + g.TextHeight
		        x = ox
		        lines = lines + 1
		        
		      Else
		        // Just clip.
		        Return lines
		      End If
		    End If
		    
		    // Draw the background, if any.
		    If word.HasBackgroundColor And word.Type <> word.TYPE_EOL Then
		      Var oc As Color = g.DrawingColor
		      g.DrawingColor = word.BackgroundColor
		      g.FillRectangle(Ceiling(x), y - g.FontAscent, Ceiling(word.Width), g.TextHeight + 1)
		      g.DrawingColor = oc
		    End If
		    
		    // Draw the text.
		    If(word.Type = TYPE_WORD Or word.Type = TYPE_PLACEHOLDER Or displayInvisible) And _
		      x + word.Width >= 0 And x < g.Width And y >= 0 And y <= g.Height + g.TextHeight Then
		      If word.Type = TYPE_TAB Then
		         // A small hack to make the visible chaacterr the same width as the tab
		        s = VISIBLE_TAB_CHAR
		      ElseIf word.Type = TYPE_SPACE Then
		        s = VISIBLE_SPACE_CHAR
		      End If
		      
		      If word.Type = TYPE_PLACEHOLDER Then
		        Var oldc As Color = g.DrawingColor
		        g.DrawingColor = SyntaxArea.TextPlaceholder(word).PlaceholderBackgroundColor
		        g.FillRoundRectangle(x, y - g.FontAscent, word.Width, g.TextHeight + 1, g.TextHeight, g.TextHeight)
		        
		        g.DrawingColor = SyntaxArea.TextPlaceholder(word).PlaceholderBackgroundColor.DarkerColor(30, False)
		        g.DrawRoundRectangle(x, y - g.FontAscent, word.Width, g.TextHeight + 1, g.TextHeight, g.TextHeight)
		        g.DrawingColor = oldc
		      End If
		      
		      Var x2 As Integer = x
		      If indentVisually Then x2 = Self.indent + x2
		      
		      g.DrawText(s, x2, y)
		    End If
		    
		    x = x + word.Width
		    width = Width + word.Width
		    word.LastFont = g.FontName
		    word.LastSize = g.FontSize
		  Next i
		  
		  showInvisible = displayInvisible
		  
		  Return lines
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetAttributes(attr As SyntaxArea.TextLineAttributes)
		  mLineAttributes = attr
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 557064617465732060544142434841526020746F206D6174636820746865207061737365642077696474682E20416C736F207365747320746865207769647468206F6620657665727920776F7264206F6E20746865206C696E6520746F202D312E
		Sub TabWidth(Assigns value As Integer)
		  /// Updates `TABCHAR` to match the passed width.
		  /// Also sets the width of every word on the line to -1.
		  
		  TABCHAR = ""
		  
		  For i As Integer = 1 To value
		    TABCHAR = TABCHAR + " "
		  Next i
		  
		  For Each word As SyntaxArea.TextSegment In Words
		    word.Width = -1
		  Next word
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TextWidth(buffer As SyntaxArea.GapBuffer, g As Graphics, displayInvisible As Boolean, length As Integer = -1) As Single
		  #If Not DebugBuild
		    #Pragma DisableBackgroundTasks
		    #Pragma DisableBoundsChecking
		  #EndIf
		  
		  If length = 0 Then Return 0
		  If length < 0 Then
		    length = Self.Length
		    If Self.LastFont <> g.FontName Or Self.LastSize <> g.FontSize Then width = 0
		    If TotalWidth > 0 Then Return TotalWidth
		  End If
		  
		  Self.LastFont = g.FontName
		  Self.LastSize = g.FontSize
		  
		  // Unparsed? We'll return the raw text.
		  If words.LastIndex < 0 Then
		    ParseLine(buffer, &c00)
		    If words.LastIndex < 0 Then
		      // `Graphics. StringWidt()`h can't handle UTF-32 (on OSX, at least.)
		      Return g.TextWidth(buffer.GetText(Self.Offset, Self.Length).ConvertEncoding(Encodings.UTF8))
		    End If
		  End If
		  
		  Var ret As Single
		  Var word As SyntaxArea.TextSegment
		  Var charsToRead As Integer
		  Var s As String
		  Var u As Integer = words.LastIndex
		  
		  For i As Integer = 0 To u
		    word = Words(i)
		    charsToRead = word.Length
		    
		    Select Case word.Type
		    Case SyntaxArea.TextSegment.TYPE_SPACE
		      s = " "
		      
		    Case SyntaxArea.TextSegment.TYPE_TAB
		      s = TABCHAR
		      
		    Case SyntaxArea.TextSegment.TYPE_EOL
		      If displayInvisible Then
		        s = " "
		      Else
		        s = ""
		      End If
		      
		    Case SyntaxArea.TextSegment.TYPE_PLACEHOLDER
		      s = PLACEHOLDER_PADDING_STRING + buffer.GetText(SyntaxArea.TextPlaceholder(word).TextRange.Offset + Offset, _
		      SyntaxArea.TextPlaceholder(word).TextRange.Length) + PLACEHOLDER_PADDING_STRING
		      
		    Else
		      // Determine the number of characters to read in the current token.
		      If word.Offset + word.Length > length Then
		        charsToRead = length - word.Offset
		      End If
		      
		      s = buffer.GetText(word.Offset + Self.Offset, charsToRead)
		    End Select
		    
		    If word.LastFont <> g.FontName Or word.LastSize <> g.FontSize Then
		      word.Width = -1
		    End If
		    
		    If word.Width < 0 Or charsToRead < word.Length Then
		      g.Bold = word.Bold
		      g.Italic = word.Italic
		      g.Underline = word.Underline
		      // `Graphics.StringWidth()` can't handle UTF-32 (on OSX, at least)
		      ret = ret + g.TextWidth(s.ConvertEncoding(Encodings.UTF8))
		    Else
		      ret = ret + word.Width
		    End If
		    
		    word.LastFont = g.FontName
		    word.LastSize = g.FontSize
		    If word.Offset + word.Length >= length Then Exit For
		  Next i
		  
		  Return ret
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TotalWidth() As Integer
		  Return Width
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateIndentationState(definition As SyntaxArea.HighlightDefinition, prevIndentationState As String, myText As String)
		  // TODO: Maybe optimize this so that it doesn't need to perform the Regex checks
		  // every time. E.g, if neither the mIndentationState nor the text changed, then
		  // there's no need to update.
		  // However, how to I tell if the text has changed? I shouldn't buffer each line here, that might
		  // be wasteful.
		  
		  If mIndentationStateIn <> prevIndentationState Then
		    mIndentationStateIn = prevIndentationState
		    mIndentationStateOut = prevIndentationState
		    mChangedIndentState = True
		  End If
		  
		  If Me.Length = 0 Then
		    mBlockIndent = 0
		    mIsBlkStart = False
		    mIsBlkEnd = False
		    mBlockStartRule = Nil
		    mBlockEndRule = Nil
		    Return
		  End If
		  
		  Var newState As String
		  mBlockIndent = definition.IsBlockStart(myText, mIndentationStateIn, newState, mBlockStartRule)
		  If newState <> mIndentationStateOut Then
		    mIndentationStateOut = newState
		    mChangedIndentState = True
		  End If
		  
		  mIsBlkEnd = definition.IsBlockEnd(myText, newState, newState, mBlockEndRule)
		  If newState <> mIndentationStateOut Then
		    mIndentationStateOut = newState
		    mChangedIndentState = True
		  End If
		  
		  mIsBlkStart = mBlockIndent <> 0
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function VisualIndent(isIndentedVisually As Boolean) As Integer
		  If isIndentedVisually Then
		    Return Self.Indent
		  End If
		  
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mBlockIndent
			End Get
		#tag EndGetter
		BlockIndentation As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		Context As SyntaxArea.HighlightContext
	#tag EndProperty

	#tag Property, Flags = &h0
		DelimiterLength As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		Folded As Boolean
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected Highlighted As Boolean
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mLineAttributes.Icon
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mLineAttributes.Icon = value
			End Set
		#tag EndSetter
		Icon As Picture
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mIndent
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If value < 0 Then
			    Raise New UnsupportedOperationException("Cannot set a line's indent to < 0.")
			  End If
			  
			  mIndent = value
			  NeedsIndentation = False
			  
			End Set
		#tag EndSetter
		Indent As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mIndentationStateIn
			End Get
		#tag EndGetter
		IndentationStateIn As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mIndentationStateOut
			End Get
		#tag EndGetter
		IndentationStateOut As String
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		IsContinuedFromLine As Integer = -1
	#tag EndProperty

	#tag Property, Flags = &h0
		IsDirty As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		LineSymbols As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h0
		Lock As CriticalSection
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mBlockEndRule As Object
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mBlockIndent As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mBlockStartRule As Object
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mChangedIndentState As Boolean = True
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mIndent As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mIndentationStateIn As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mIndentationStateOut As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mIsBlkEnd As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mIsBlkStart As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21, Description = 486F6C64732076616C75657320746861742062656C6F6E6720746F2061206C696E6520617320746865207573657220736565732069742C20616E640A61726520636F6E74726F6C6C65642062792074686520636F6465207573696E67207468697320656469746F7220726174686572207468616E2076616C756573207468617420617265206E65656465640A666F722074686520656469746F722773206D616E6167656D656E742E20452E673A207468652069636F6E20746861742063616E2062652061737369676E656420746F2061206C696E652E
		#tag Note
			Holds values that belong to a line as the user sees it, and
			are controlled by the code using this editor rather than values that are needed
			for the editor's management.
			
			An example of this is the icon that can be assigned to a line.
		#tag EndNote
		Private mLineAttributes As TextLineAttributes
	#tag EndProperty

	#tag Property, Flags = &h0
		NeedsIndentation As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Placeholders() As TextPlaceholder
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return Width
			End Get
		#tag EndGetter
		ScreenWidth As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h1
		Protected ShowInvisible As Boolean
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected TABCHAR As String
	#tag EndProperty

	#tag Property, Flags = &h0
		Visible As Boolean
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected Words() As SyntaxArea.TextSegment
	#tag EndProperty


	#tag Constant, Name = PLACEHOLDER_PADDING_STRING, Type = String, Dynamic = False, Default = \"  ", Scope = Private
	#tag EndConstant

	#tag Constant, Name = VISIBLE_EOL_CHAR, Type = String, Dynamic = False, Default = \"\xC2\xB6", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = VISIBLE_SPACE_CHAR, Type = String, Dynamic = False, Default = \"\xC2\xB7", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = VISIBLE_TAB_CHAR, Type = String, Dynamic = False, Default = \"", Scope = Protected
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"\xE2\x9E\x9D"
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"\xC2\xBB"
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="DebugDescription"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="EndOffset"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="length"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="offset"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="BackgroundColor"
			Visible=false
			Group="Behavior"
			InitialValue="&h000000"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Bold"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="HasBackgroundColor"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ID"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Italic"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextColor"
			Visible=false
			Group="Behavior"
			InitialValue="&h000000"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Type"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Underline"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Width"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="BlockIndentation"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="DelimiterLength"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Folded"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Icon"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Picture"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Indent"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="IndentationStateIn"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IndentationStateOut"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
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
			Name="IsContinuedFromLine"
			Visible=false
			Group="Behavior"
			InitialValue="-1"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsDirty"
			Visible=false
			Group="Behavior"
			InitialValue="false"
			Type="Boolean"
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
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="NeedsIndentation"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ScreenWidth"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
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
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Visible"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
