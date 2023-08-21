#tag Class
Protected Class Editor
Inherits SyntaxArea.NSScrollViewCanvas
Implements MessageCentre.MessageReceiver
	#tag CompatibilityFlags = (TargetDesktop and (Target32Bit or Target64Bit))
	#tag Event , Description = 5468652063616E766173206973206F70656E696E672E
		Sub Opening()
		  BlockBeginPosX = -1
		  
		  IgnoreRepaint = True
		  
		  RaiseEvent Opening
		  
		  If TextFont = "" Then TextFont = DEFAULT_FONT
		  If FontSize = 0 Then FontSize = DEFAULT_FONTSIZE
		  
		  Me.MouseCursor = System.Cursors.IBeam
		  CursorIsIbeam = True
		  
		  CalculateMaxVerticalSB
		  CalculateMaxHorizontalSB
		  
		  Me.AcceptTextDrop
		  Me.AcceptRawDataDrop("objectID")
		  
		  EnableBlinker(mHasFocus And SelectionLength = 0)
		  IgnoreRepaint = False
		  
		  If TextSelectionColor = Color.Black Then
		    TextSelectionColor = Color.HighlightColor
		  End If
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h1
		Protected Sub AutocompleteCancelled(requestFocus As Boolean)
		  If requestFocus Then SetFocus
		  
		  AutoCompleteDone = True
		  
		  // Stop listening messages from SuggestionWindow.
		  Self.UnregisterForMessage(CurrentSuggestionWindow)
		  
		  currentSuggestionWindow = Nil
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1, Description = 54686520737472696E6720606F7074696F6E60207761732073656C656374656420696E207468652073756767657374696F6E732077696E646F772E
		Protected Sub AutocompleteOptionSelected(option As String)
		  /// The string `option` was selected in the suggestions window.
		  
		  If option <> "" Then
		    If SelectionLength > 0 Then
		      // Replace the highlighted text.
		      SelText = option
		      
		    Else
		      // Add option to current word, removing common prefix.
		      If AutocompleteAppliesStandardCase Then
		        // We need to replace the whole word with the Autocomplete option.
		        PrivateReplace(CaretPos - CurrentAutocompleteOptions.CurrentPathComponent.Length, CurrentAutocompleteOptions.CurrentPathComponent.Length, option)
		      Else
		        SelText = option.Middle(option.LongestCommonPrefixIndex(CurrentAutocompleteOptions.CurrentPathComponent) + 1)
		      End If
		    End If
		  End If
		  
		  // Stop listening messages from SuggestionWindow.
		  Self.UnregisterForMessage(CurrentSuggestionWindow)
		  CurrentSuggestionWindow = Nil
		  
		  // Check indentations.
		  If AutoIndentNewLines And Not mIndentVisually Then
		    Var thisLine As SyntaxArea.TextLine = Lines.GetLine(CaretLine)
		    If thisLine <> Nil And thisLine.IsBlockEnd Then
		      Var state As Variant
		      If PrivateIndentLine(CaretLine, False, state) Then
		        InvalidateLine(CaretLine)
		      End
		    End If
		  End If
		  
		  SetFocus
		  Redraw
		  AutoCompleteDone = True
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1, Description = 436F6D707574657320746865206D6178696D756D20686F72697A6F6E74616C207363726F6C6C6261722076616C75652E
		Protected Sub CalculateMaxHorizontalSB()
		  /// Computes the maximum horizontal scrollbar value.
		  
		  If mHorizontalScrollBar <> Nil Then
		    Var contentWidth As Integer = mLastLongestLinePixels + LineNumberOffset + RightScrollMargin
		    
		    Var n As Integer = Self.Width
		    Var max As Integer = contentWidth - n
		    If max <= 0 Then
		      max = 0
		      n = 0
		    End If
		    
		    mHorizontalScrollBar.Enabled = max > 0
		    mHorizontalScrollBar.MaximumValue = max
		    mHorizontalScrollBar.PageStep = n
		    mHorizontalScrollBar.LineStep = 8
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1, Description = 436F6D707574657320746865206D6178696D756D20766572746963616C207363726F6C6C6261722076616C75652E
		Protected Sub CalculateMaxVerticalSB()
		  /// Computes the maximum vertical scrollbar value.
		  
		  If mVerticalScrollbar <> Nil Then
		    If EnableLineFoldings Then
		      mVerticalScrollbar.MaximumValue = Lines.Count - Lines.invisibleLines - MaxVisibleLines
		    Else
		      mVerticalScrollbar.MaximumValue = Lines.Count - MaxVisibleLines
		    End If
		    
		    // Update the pageStep so a page jump is always the number of visible lines, or a page.
		    mVerticalScrollbar.PageStep = MaxVisibleLines - 1
		  End If
		  
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h0
		Delegate Function ColorReturningProc() As Color
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h1
		Protected Function CurrentAutocompleteOptions() As SyntaxArea.AutocompleteOptions
		  Return mCurrentAutocompleteOptions
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub EnableBlinker(value As Boolean)
		  If mCaretBlinker = Nil Then Return
		  
		  If value And Not ReadOnly Then
		    mCaretBlinker.RunMode = Timer.RunModes.Multiple
		    CaretVisible = True
		  Else
		    mCaretBlinker.RunMode = Timer.RunModes.Off
		    CaretVisible = False
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetCurrentModeColor(propertyName As String) As Color
		  #Pragma Warning "REFACTOR: This should be removed in favour of ColorGroups"
		  
		  Var result As Variant
		  If Color.IsDarkMode Then
		    result = mDarkModeColors.Lookup(propertyName, Nil)
		    If result = Nil Then
		      // We were in light mode before, now we can fetch the correct dark mode colour.
		      result = mBrightModeColors.Lookup(propertyName, Nil)
		      Var dark As Color = SyntaxArea.AdjustColorForDarkMode(result)
		      mDarkModeColors.Value(propertyName) = dark
		      
		    ElseIf result IsA ColorReturningProc Then
		      result = ColorReturningProc(result).Invoke
		      mDarkModeColors.Value(propertyName) = result
		    End If
		    
		  Else
		    result = mBrightModeColors.Lookup(propertyName, Nil)
		    If result Is Nil Then
		      Break // This should not happen...
		      result = mDarkModeColors.Lookup(propertyName, Nil)
		      result = SyntaxArea.InvertedModeColor(result)
		      mBrightModeColors.Value(propertyName) = result
		      
		    ElseIf result IsA ColorReturningProc Then
		      result = ColorReturningProc(result).Invoke
		      mBrightModeColors.Value(propertyName) = result
		    End If
		  End If
		  
		  Return result
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function IndentStr(indents As Integer) As String
		  If mIndentString = "" Then
		    mIndentString = Chr(9)
		    For i As Integer = 1 To 8
		      mIndentString = mIndentString + mIndentString
		    Next i
		  End If
		  
		  Return mIndentString.Left(indents)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 4D61726B7320616C6C206C696E657320666F7220726564726177696E672E
		Sub InvalidateAllLines()
		  /// Marks all lines for redrawing.
		  
		  InvalidateLine(-1)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 496E76616C6964617465732074686520676976656E206C696E6520286D61726B7320697420666F722072652D64726177696E67292E2049662060696E64657860203C2030207468656E20612066756C6C20726566726573682077696C6C206F636375722E
		Sub InvalidateLine(index As Integer)
		  /// Invalidates the given line (marks it for re-drawing).
		  /// If `index` < 0 then a full refresh will occur.
		  
		  mFullRefresh = index < 0 Or mFullRefresh
		  
		  InvalidLines.Value(index) = True
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1, Description = 43616C6C656420627920746865206C696E65206D616E616765722C207768656E20746865206C696E65206E756D626572206368616E6765732E
		Protected Sub LineCountChanged(newLineCount As Integer)
		  /// Called by the line manager, when the line number changes.
		  
		  #Pragma Unused newLineCount
		  
		  // Force recalculation of the line number gutter.
		  LineNumberOffset = 0
		  
		  // Raise the LineCountChanged event.
		  RaiseEvent LineCountChanged(Lines.Count)
		  
		  // Calculate the maximum scrollbar values.
		  CalculateMaxVerticalSB
		  
		  InvalidateAllLines
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LineDelimiter() As String
		  Return lines.LineEnding
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub LineHighlighted(lineIndex As Integer)
		  // Mark for repaint.
		  InvalidateLine(lineIndex)
		  
		  Var line As SyntaxArea.TextLine = Lines.GetLine(lineIndex)
		  If line = Nil Then Return
		  
		  If line.LineSymbols = Nil Or line.LineSymbols.KeyCount = 0 Then Return
		  
		  // Extract the symbols and add them to local table.
		  If CurrentDocumentSymbols = Nil Then CurrentDocumentSymbols = New Dictionary
		  
		  For i As Integer = 0 To line.LineSymbols.KeyCount - 1
		    CurrentDocumentSymbols.Value(line) = Nil
		  Next i
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1, Description = 456974686572207468652073796D626F6C732068617665206368616E6765642C206F7220746865206C696E6520636F6E7461696E696E67207468656D207761732072656D6F7665642C20736F2072656D6F7665207468656D2066726F6D20746865206C6F63616C207461626C652E
		Protected Sub LineSymbolsRemoved(symbols As Dictionary)
		  /// Either the symbols have changed, or the line containing them was removed,
		  /// so remove them from the local table.
		  
		  For Each key As SyntaxArea.TextLine In symbols.Keys
		    If CurrentDocumentSymbols.HasKey(key) Then CurrentDocumentSymbols.Remove(key)
		  Next key
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1, Description = 43616C6C656420627920746865206C696E65206D616E616765722C207768656E20746865726527732061206E6577206C696E652074686174277320746865206C6F6E67657374206C696E652E
		Protected Sub MaxLineLengthChanged(longestLineIndex As Integer)
		  /// Called by the line manager, when there's a new line that's the longest line.
		  
		  #If Not DebugBuild
		    #Pragma DisableBackgroundTasks
		    #Pragma DisableBoundsChecking
		  #EndIf
		  
		  // OPTIMISE: For starters we can get the screen width by reading all the word lengths 
		  // in this line.
		  If longestLineIndex < 0 Then Return
		  Var maxLine As SyntaxArea.TextLine = Lines.GetLine(longestLineIndex)
		  If maxline = Nil Or abs(maxLine.length - mlastLongestLineLength) < 2 Then Return
		  
		  // Cache the length.
		  mLastLongestLineLength = maxLine.Length
		  
		  // Measure the string in pixels.
		  Var tmp As Picture = TemporaryPicture
		  
		  Var maxLength As Single = _
		  maxLine.TextWidth(TextStorage, tmp.Graphics, DisplayInvisibleCharacters)
		  
		  If maxLength = mLastLongestLinePixels Then Return
		  mLastLongestLinePixels = maxLength
		  
		  RaiseEvent MaxLineLengthChanged(mLastLongestLinePixels)
		  
		  // Calculate scrollbar.
		  CalculateMaxHorizontalSB
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function PrivateIndentLine(lineIndex As Integer, ltrimLine As Boolean, ByRef indentationState As Variant) As Boolean
		  Var line As SyntaxArea.TextLine = Lines.GetLine(lineIndex)
		  
		  If line = Nil Then
		    // True because it may just be an empty line, and that doesn't mean we can 
		    // stop the outer loop.
		    Return True
		  End If
		   
		  If SyntaxDefinition = Nil Then
		    line.Indent = 0
		    Return False
		  End If
		  
		  Var modified As Boolean
		  Var previousLine As SyntaxArea.TextLine
		  Var wasDirty As Boolean = line.IsDirty
		  
		  // Determine the indentation level.
		  Var currTextUntrimmed As String = TextStorage.GetText(line.Offset, line.Length)
		  
		  // We need to remove the EOL character at the end of the line as it could 
		  // fool our leading whitespace detection if the entire line is whitespace.
		  Var eol As String = Self.LineDelimiter
		  If currTextUntrimmed.Right(eol.Length) = eol Then
		    currTextUntrimmed = currTextUntrimmed.Left(currTextUntrimmed.Length - eol.Length)
		  End If
		  Var currTextTrimmed As String = currTextUntrimmed.TrimLeft
		  Var currLeadingSpaces As Integer = currTextUntrimmed.Length - currTextTrimmed.Length
		  Var origLeadingSpaces As Integer = currLeadingSpaces
		  
		  If ltrimLine And currLeadingSpaces > 0 Then
		    // Discard leading spaces from current line.
		    If mIndentVisually Then
		      // Remove now because we'll not add new spaces.
		      
		      If CurrentEventID <= 0 Then
		        // This must not happen - the caller must ensure that the EventID is set 
		        // to `System.Ticks` before they start any modification that invokes this method.
		        Break
		        CurrentEventID = System.Ticks
		      End If
		      
		      // Now remove the leading spaces.
		      PrivateReplace(line.Offset, origLeadingSpaces, "", False, CurrentEventID, True, True)
		      line = Lines.GetLine(lineIndex)
		      currLeadingSpaces = 0
		      currTextUntrimmed = currTextTrimmed
		      modified = True
		    End If
		  End If
		  
		  Var indentState As String
		  If indentationState = Nil Then
		    indentState = line.IndentationStateIn
		  Else
		    indentState = indentationState
		  End
		  line.UpdateIndentationState(SyntaxDefinition, indentState, currTextTrimmed)
		  If line.ChangedIndentStateAndReset Then
		    modified = True
		  End
		  indentationState = line.IndentationStateOut
		  
		  If line.IsBlockEnd Then
		    // Use the indentation of previous block start.
		    Var blockStartIdx As Integer = lines.PreviousBlockStartLine(lineIndex)
		    If blockStartIdx < 0 Then
		      // No previous block opening found - use the previous line's indent.
		      blockStartIdx = max(0, lineIndex-1)
		    End If
		    previousLine = lines.GetLine(blockStartIdx)
		    
		    // Reset the indentation.
		    Var newIndent As Integer
		    If previousLine <> Nil Then
		      // Take the block start's indent value.
		      newIndent = previousLine.Indent
		    Else
		      // If there's no block start to find, let's zero the indent level.
		      newIndent = 0
		    End If
		    If newIndent <> line.Indent Or line.NeedsIndentation Then
		      line.Indent = newIndent
		      modified = True
		    End If
		    
		  Else
		    // Check if the previous line is a block start -> then we increase the 
		    // indentation in the current line.
		    Var indentationIncrease As Integer
		    
		    previousLine = Lines.GetLine(lineIndex - 1)
		    If previousLine <> Nil Then
		      Var prevTxt As String = TextStorage.GetText(previousLine.Offset, previousLine.Length)
		      Var prevHasContinuation As Integer = SyntaxDefinition.IsLineContinuation(prevTxt)
		      If prevHasContinuation > 0 Then
		        // We're inside a line continuation.
		        If previousLine.IsContinuedFromLine < 0 Then
		          // Start indentation.
		          indentationIncrease = prevHasContinuation
		          line.IsContinuedFromLine = lineIndex-1
		        Else
		          // Continue indentation, same indent as previous line.
		          indentationIncrease = 0
		          line.IsContinuedFromLine = previousLine.IsContinuedFromLine
		        End
		        
		      Else
		        If previousLine.IsContinuedFromLine >= 0 Then
		          // Unindent a line continuation.
		          previousLine = Lines.GetLine(previousLine.IsContinuedFromLine)
		          indentationIncrease = 0
		        Else
		          indentationIncrease = previousLine.BlockIndentation
		        End If
		        line.IsContinuedFromLine = -1
		      End If
		    End If
		    
		    // Increase the indentation.
		    Var newIndent As Integer
		    If previousLine <> Nil Then
		      Var n As Integer
		      If mIndentVisually Then
		        n = IndentPixels
		      Else
		        n = 1
		      End
		      newIndent = previousLine.Indent + indentationIncrease * n
		    Else
		      newIndent = 0
		    End
		    If newIndent <> line.Indent Or line.NeedsIndentation Then
		      line.Indent = newIndent
		      modified = True
		    End If
		  End If
		  
		  If mIndentVisually Then
		    // We're done.
		    line.IsDirty = wasDirty
		    Return modified
		  End If
		  
		  // Indent by inserting spaces or tabs at the start of the line.
		  Var currIndent As String = currTextUntrimmed.Left(currLeadingSpaces)
		  Var newIndentation As String = indentStr(line.Indent)
		  
		  Var s As String
		  If ltrimLine Then
		    // Discard leading spaces from current line.
		    s = newIndentation
		  Else
		    // Keep leading spaces in current line.
		    s = newIndentation + currIndent
		  End If
		  
		  If s <> currIndent Then
		    If CurrentEventID <= 0 Then
		      // This must not happen - the caller must ensure that the EventID is set to 
		      // `System.Ticks` before they start any modification that invokes this method.
		      Break
		      CurrentEventID = System.Ticks
		    End If
		    
		    PrivateReplace(line.Offset, origLeadingSpaces, s, False, CurrentEventID, True, True)
		    line.IsDirty = wasDirty
		    modified = True
		  End
		  
		  Return modified
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 496E7465726E616C20757365206F6E6C792E2052657475726E732074686520656469746F722773206C696E65206D616E616765722E
		Function PrivateLines() As SyntaxArea.LineManager
		  /// Internal use only. Returns the editor's line manager.
		  
		  Return Self.Lines
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1, Description = 50617274206F6620746865204D65737361676543656E7472652E4D657373616765526563656976657220696E746572666163652E
		Protected Sub ReceiveMessage(theMessage As MessageCentre.Message)
		  /// Part of the MessageCentre.MessageReceiver interface.
		  
		  #If Not DebugBuild
		    #Pragma DisableBackgroundTasks
		    #Pragma DisableBoundsChecking
		  #EndIf
		  
		  // 1 is the message type in this particular scheme.
		  Var type As Integer = theMessage.Info(1)
		  
		  If theMessage.Sender = lines Then
		    Select Case type
		    Case LineManager.LINE_COUNT_CHANGED_MESSAGE
		      Var count As Integer = theMessage.Info(2) // 2 holds the number of lines.
		      Var invisible As Integer = theMessage.Info(3) // 3 holds the number of invisible lines.
		      Self.LineCountChanged(count - invisible)
		      
		    Case LineManager.LINE_CHANGED_MESSAGE
		      Var index As Integer = theMessage.Info(2)
		      Var length As Integer = theMessage.Info(3)
		      
		      If index = CaretLine And mHighlighter <> Nil And _
		        mHighlighter.ThreadState <> Thread.ThreadStates.NotRunning Then
		        mHighlighter.HighlightLine(index)
		      End If
		      
		      If SyntaxDefinition = Nil And LoadingDocument Then Return
		      
		      Call ModifiedLines.AddRange(index, length)
		      
		    Case LineManager.MAX_LINE_LENGTH_CHANGED_MESSAGE
		      Var index As Integer = theMessage.Info(2)
		      Self.MaxLineLengthChanged(index)
		      
		    Case LineManager.LINE_SYMBOLS_REMOVED_MESSAGE
		      LineSymbolsRemoved(theMessage.Info(2))
		    End Select
		    
		  ElseIf theMessage.Sender = CurrentSuggestionWindow Then
		    
		    Select Case Type
		    Case SuggestionWindow.AutocompleteCancelledMsg
		      Var requestFocus As Boolean = theMessage.Info(2)
		      AutocompleteCancelled(requestFocus)
		      
		    Case SuggestionWindow.KeyDownMsg
		      Var key As String = theMessage.Info(2)
		      Call HandleKeyDown(key)
		      
		    Case SuggestionWindow.CurrentAutocompleteOptionsMsg
		      theMessage.AddInfo(3, CurrentAutocompleteOptions)
		      
		    Case SuggestionWindow.OptionSelectedMsg
		      Var option As String = theMessage.Info(2)
		      AutocompleteOptionSelected(option)
		    End Select
		    
		  ElseIf theMessage.Sender = mHighlighter Then
		    Select Case type
		    Case LineHighlighter.HighlightDoneMsg
		      RaiseEvent HighlightingComplete
		      
		    Case LineHighlighter.LineHighlightedMsg
		      LineHighlighted(theMessage.Info(2))
		      
		    Case LineHighlighter.ScreenLinesHighlightedMsg
		      Redraw
		    End Select
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1, Description = 526564726177732074686520656E746972652063616E7661732E
		Protected Sub Redraw(forced As Boolean = False)
		  /// Redraws the entire canvas.
		  
		  If IgnoreRepaint And Not forced Then Return
		  
		  Var scrollPos As Integer = Self.ScrollPosition
		  If EnableLineFoldings Then scrollPos = Lines.GetNumberOfLinesNeededToView(scrollPos)
		  
		  IgnoreRepaint = False
		  mRedrawEverything = True
		  
		  RedrawThreadSafe
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 43616C6C656420627920604361726574426C696E6B65726020746F2075706461746520746865207465787420637572736F72206265616D2E
		Sub RedrawCaret()
		  /// Called by `CaretBlinker` to update the text cursor beam.
		  
		  If IgnoreRepaint Or mWindowIsClosing Then Return
		  
		  Var scrollPos As Integer = Self.ScrollPosition // Since it's computed.
		  If EnableLineFoldings Then scrollPos = Lines.GetNumberOfLinesNeededToView(scrollPos)
		  If (CaretLine < scrollPos Or CaretLine > scrollPos + VisibleLineRange.Length) Then Return
		  
		  // OPTIMISE: Need to find a way to avoid updating the entire
		  // canvas every time we update the blinking text cursor.
		  // Ideally, only the caret's area should be redrawn.
		  
		  mRedrawCaret = True
		  
		  RedrawThreadSafe
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52656D6F76657320616C6C206C656164696E672077686974652073706163652C20616464696E672070726F70657220696E64656E746174696F6E20287573696E672074616220636861726163746572732920696E73746561642E
		Sub ReIndentText()
		  /// Removes all leading white space, adding proper indentation (using tab characters) instead.
		  
		  Self.ReindentText(0, Lines.Count - 1)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52656D6F76657320616C6C206C656164696E672077686974652073706163652C20616464696E672070726F70657220696E64656E746174696F6E20287573696E672074616220636861726163746572732920696E73746561642E
		Sub ReindentText(fromLine As Integer, toLine As Integer)
		  /// Removes all leading white space, adding proper indentation (using tab characters) instead.
		  
		  // Prevent LineHighlighter from interfering while we're modifying the lines.
		  Var lock As New SyntaxArea.LinesLock(Self)
		  #Pragma Unused lock
		  
		  If CurrentEventID <= 0 Then
		    // Ensure that this entire process becomes a single undoable action.
		    CurrentEventID = System.Ticks
		  End If
		  
		  Self.IgnoreRepaint = True
		  
		  Var needsRedraw As Boolean
		  Var state As Variant
		  For i As Integer = fromLine To toLine
		    If PrivateIndentline(i, True, state) Then
		      InvalidateLine(i)
		      needsRedraw = True
		    End If
		    Lines.LineIsIndented(i)
		  Next
		  Self.IgnoreRepaint = False
		  
		  If needsRedraw Then
		    Highlight
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SetBrightModeColor(c As Color, propertyName As String)
		  #Pragma Warning "REFACTOR: Remove this once we have migrated to ColorGroups"
		  
		  propertyName = propertyName.Replace(".Set", ".Get")
		  
		  mBrightModeColors.Value(propertyName) = c
		  
		  If SyntaxArea.SupportsDarkMode Then
		    If Not Color.IsDarkMode Then
		      // Will be set in the getter once we are out of dark mode.
		      mDarkModeColors.Value(propertyName) = Nil
		    Else
		      Var dark As Color = SyntaxArea.AdjustColorForDarkMode(c)
		      
		      If propertyName = "SyntaxArea.Editor.BackColor.Get" Then // Was "CustomEditField.BackColor.Get".
		        mDarkModeColors.Value(propertyName) = &C171717
		      Else
		        mDarkModeColors.Value(propertyName) = dark
		      End If
		    End If
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SetColorProvider(providerFunction As ColorReturningProc, propertyName As String)
		  #Pragma Warning "REFACTOR: Remove this once we have migrated to ColorGroups"
		  
		  propertyName = propertyName.Replace (".Set", ".Get")
		  mBrightModeColors.Value (propertyName) = providerFunction
		  mDarkModeColors.Value (propertyName) = providerFunction
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1, Description = 52657475726E20612074656D706F72617279207069637475726520746861742063616E206265207573656420666F722067726170686963732063616C63756C6174696F6E732C206574632E
		Protected Function TemporaryPicture() As Picture
		  /// Return a temporary picture that can be used for graphics calculations, etc.
		  
		  If mTempPicture = Nil Then mTempPicture = New Picture(2, 2)
		  
		  mTempPicture.Graphics.FontName = TextFont
		  mTempPicture.Graphics.FontSize = FontSize
		  
		  mTempPicture.Graphics.Bold = False
		  mTempPicture.Graphics.Italic = False
		  mTempPicture.Graphics.Underline = False
		  
		  Return mTempPicture
		  
		End Function
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event HighlightingComplete()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event LineCountChanged(newLineCount As Integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event MaxLineLengthChanged(maxLineLengthInPixels As Single)
	#tag EndHook

	#tag Hook, Flags = &h0, Description = 54686520656469746F72206973206F70656E696E672E
		Event Opening()
	#tag EndHook


	#tag Note, Name = ColorReturningProc
		This delegate I think is used to support dark mode colours.
		We should look to refactor to remove this and simply use ColorGroups.
		
	#tag EndNote


	#tag Property, Flags = &h0
		AutoCloseBrackets As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		AutocompleteAppliesStandardCase As Boolean = True
	#tag EndProperty

	#tag Property, Flags = &h0
		AutoCompleteDone As Boolean = True
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected AutocompleteSuggestionInsertionX As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		AutoIndentNewLines As Boolean = True
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return GetCurrentModeColor(CurrentMethodName)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  SetBrightModeColor(value, CurrentMethodName)
			  InvalidateAllLines
			  Redraw
			  
			End Set
		#tag EndSetter
		BackColor As Color
	#tag EndComputedProperty

	#tag Property, Flags = &h1
		Protected BlockBeginPosX As Double
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected BlockBeginPosY As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		Private BlockCharsPattern As String
	#tag EndProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  #Pragma Warning "TODO: Replace this bundled image with something else?"
			  
			  If gBlockEndImage = Nil Then
			    gBlockEndImage = SyntaxArea.LoadMaskedPicture(blockEndMarker)
			  End If
			  
			  Return gBlockEndImage
			  
			End Get
		#tag EndGetter
		Protected Shared BlockEndImage As Picture
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  #Pragma Warning "TODO: Replace this bundled image with something else?"
			  If gBlockFoldedImage = Nil Then
			    gBlockFoldedImage = SyntaxArea.LoadMaskedPicture(blockFoldedMarker)
			  End If
			  
			  Return gBlockFoldedImage
			End Get
		#tag EndGetter
		Protected Shared BlockFoldedImage As Picture
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  #Pragma Warning "TODO: Replace this bundled image with something else?"
			  
			  If gBlockStartImage = Nil Then
			    gBlockStartSmage = SyntaxArea.LoadMaskedPicture(blockStartMarker)
			  End If
			  
			  Return gBlockStartImage
			End Get
		#tag EndGetter
		Protected Shared BlockStartImage As Picture
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  #Pragma Warning "TODO: Replace this bundled image with something else?"
			  
			  If gBookmarkImage = Nil Then
			    gBookmarkImage = SyntaxArea.LoadMaskedPicture(bookmarksimg)
			  End If
			  
			  Return gBookmarkImage
			End Get
		#tag EndGetter
		Protected Shared BookmarkImage As Picture
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  If mBookmarkTable = Nil Then
			    mBookmarkTable = New Dictionary
			  End If
			  
			  Return mBookmarkTable
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mBookmarkTable = value
			End Set
		#tag EndSetter
		Protected BookmarkTable As Dictionary
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mDrawFrame
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mDrawFrame = value
			  InvalidateAllLines
			  Redraw
			End Set
		#tag EndSetter
		Border As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return getCurrentModeColor(CurrentMethodName)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  SetBrightModeColor(value, CurrentMethodName)
			  Redraw
			  
			End Set
		#tag EndSetter
		BorderColor As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return GetCurrentModeColor(CurrentMethodName)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If value = &c00000000 Then
			    // If it's not explicitly assigned, we use a default (yellow)
			    value = Color.Yellow
			  End If
			  
			  SetBrightModeColor(value, CurrentMethodName)
			  
			End Set
		#tag EndSetter
		BracketHighlightColor As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return GetCurrentModeColor(CurrentMethodName)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  SetBrightModeColor(value, CurrentMethodName)
			  Redraw
			  
			End Set
		#tag EndSetter
		CaretColor As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Var x, y As Double
			  Var calcPos As Integer = mDesiredColumnCharPos
			  
			  // Or the caretpos.
			  If mDesiredColumnCharPos < 0 Then calcPos = CaretPos
			  
			  // Find screen position.
			  XYAtCharPos(calcPos, x, y)
			  
			  Return x - LineNumberOffset - LeftMarginOffset + ScrollPositionX
			  
			End Get
		#tag EndGetter
		Protected CaretDesiredColumn As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mCaretLine
			End Get
		#tag EndGetter
		CaretLine As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mCaretPos
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If value = mCaretPos Then Return
			  ChangeSelection(value, 0)
			End Set
		#tag EndSetter
		CaretPos As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private CaretVisible As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		ClearHighlightedRangesOnTextChange As Boolean = True
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected CurrentDocumentSymbols As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected CurrentEventID As Integer
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return gCurrentFocusedField
			End Get
		#tag EndGetter
		Shared CurrentFocusedField As SyntaxArea.Editor
	#tag EndComputedProperty

	#tag Property, Flags = &h1
		Protected CurrentSuggestionWindow As SuggestionWindow
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected CursorIsIbeam As Boolean = True
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return GetCurrentModeColor(CurrentMethodName)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  SetBrightModeColor(value, CurrentMethodName)
			  InvalidateAllLines
			  Redraw
			  
			End Set
		#tag EndSetter
		DirtyLinesColor As Color
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		DisableReset As Boolean = False
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mDisplayDirtyLines
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mDisplayDirtyLines = value
			  InvalidateAllLines
			  Redraw
			  
			End Set
		#tag EndSetter
		DisplayDirtyLines As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mDisplayInvisibleCharacters
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mDisplayInvisibleCharacters = value
			  UpdateDesiredColumn
			  InvalidateAllLines
			  Redraw
			  
			End Set
		#tag EndSetter
		DisplayInvisibleCharacters As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mDisplayLineNumbers
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mDisplayLineNumbers = value
			  UpdateDesiredColumn
			  InvalidateAllLines
			  Redraw
			  
			End Set
		#tag EndSetter
		DisplayLineNumbers As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mDisplayRightMarginMarker
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mDisplayRightMarginMarker = value
			  Redraw
			  
			End Set
		#tag EndSetter
		DisplayRightMarginMarker As Boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private Dragging As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Shared DragSource As SyntaxArea.Editor
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected DragTextOnDrag As Boolean
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected DragTextPos As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected DragTextSelection As SyntaxArea.DataRange
	#tag EndProperty

	#tag Property, Flags = &h0
		EnableAutocomplete As Boolean = False
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mEnableLineFoldings
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If mEnableLineFoldings And Not value Then Lines.UnfoldAll
			  mEnableLineFoldings = value
			  LineNumberOffset = 0
			  UpdateDesiredColumn
			  InvalidateAllLines
			  Redraw
			  
			End Set
		#tag EndSetter
		EnableLineFoldings As Boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		EnableLineFoldingSetting As Boolean
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mFontSize
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If Value = mFontSize Then Return
			  mFontSize = value
			  TextHeight = 0
			  
			  mLastLongestLineLength = 0
			  mLastLongestLinePixels = 0
			  MaxLineLengthChanged(Lines.LongestLineIdx)
			  
			  CalculateMaxHorizontalSB
			  CalculateMaxVerticalSB
			  
			  InvalidateAllLines
			  Redraw
			End Set
		#tag EndSetter
		FontSize As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private Shared gBlockEndImage As Picture
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Shared gBlockFoldedImage As Picture
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Shared gBlockStartImage As Picture
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Shared gBookmarkImage As Picture
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Shared gCurrentFocusedField As SyntaxArea.Editor
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Shared gRightMargInlineImage As Picture
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected Gutter As Picture
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return GetCurrentModeColor(CurrentMethodName)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  SetBrightModeColor(value, CurrentMethodName)
			  InvalidateAllLines
			  Redraw
			  
			End Set
		#tag EndSetter
		GutterBackgroundColor As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return GetCurrentModeColor(CurrentMethodName)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  SetBrightModeColor(value, CurrentMethodName)
			  InvalidateAllLines
			  Redraw
			  
			End Set
		#tag EndSetter
		GutterSeparationLineColor As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return LineNumberOffset
			End Get
		#tag EndGetter
		GutterWidth As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private Shared gWeakCEFs As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h0
		HighlightBlocksOnMouseOverGutter As Boolean
	#tag EndProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  If mHighlightedRanges = Nil Then
			    mHighlightedRanges = New SyntaxArea.CharSelectionManager
			  End If
			  
			  Return mHighlightedRanges
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mHighlightedRanges = value
			  
			End Set
		#tag EndSetter
		Protected HighlightedRanges As SyntaxArea.CharSelectionManager
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		HighlightMatchingBrackets As Boolean = True
	#tag EndProperty

	#tag Property, Flags = &h0
		HighlightMatchingBracketsMode As Integer
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mIgnoreRepaintCount > 0
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  // Make sure it's never negative.
			  If mIgnoreRepaintCount < 0 Then
			    mIgnoreRepaintCount = 0
			  End If
			  
			  If value Then
			    mIgnoreRepaintCount = mIgnoreRepaintCount + 1
			  ElseIf mIgnoreRepaintCount > 0 Then
			    mIgnoreRepaintCount = mIgnoreRepaintCount - 1
			  End If
			  
			End Set
		#tag EndSetter
		IgnoreRepaint As Boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		IndentPixels As Integer = 16
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mIndentVisually
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If mIndentVisually <> value Then
			    mIndentVisually = value
			    Self.ReindentText
			  End If
			  
			End Set
		#tag EndSetter
		IndentVisually As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  If mInvalidLines = Nil Then
			    mInvalidLines = New Dictionary
			  End If
			  
			  Return mInvalidLines
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mInvalidLines = value
			End Set
		#tag EndSetter
		Protected InvalidLines As Dictionary
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private IsDoubleClick As Boolean = False
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mKeepEntireTextIndented
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If mKeepEntireTextIndented <> value Then
			    mKeepEntireTextIndented = value
			    Self.ReindentText
			  End If
			  
			End Set
		#tag EndSetter
		KeepEntireTextIndented As Boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h1
		Protected KeyDownTime As Double
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected LastClickTicks As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected LastDragTicks As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected LastDrawnTopLine As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private LastMouseDownX As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private LastMouseDownY As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private LastMouseUpX As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private LastMouseUpY As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private LastRedrawTicks As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected LastTripleClickTicks As Integer
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mLeftMarginOffset
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mLeftMarginOffset = value
			  InvalidateAllLines
			  Redraw
			  
			End Set
		#tag EndSetter
		LeftMarginOffset As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  If Not DisplayLineNumbers Then Return 0
			  
			  If mLineNumberOffset = 0 Then
			    Var tmp As Picture = TemporaryPicture
			    tmp.Graphics.FontName = LineNumbersTextFont
			    tmp.Graphics.FontSize = LineNumbersFontSize
			    tmp.Graphics.Bold = True
			    mLineNumberOffset = tmp.Graphics.TextWidth(Lines.Count.ToString) + 10
			    
			    If EnableLineFoldings Then
			      mLineNumberOffset = LineNumberOffset + BlockStartImage.Width + 2
			    End If
			  End If
			  
			  Return mLineNumberOffset
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #Pragma Unused value
			  
			  mLineNumberOffset = 0
			End Set
		#tag EndSetter
		Protected LineNumberOffset As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return GetCurrentModeColor(CurrentMethodName)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  SetBrightModeColor(value, CurrentMethodName)
			  InvalidateAllLines
			  Redraw
			  
			End Set
		#tag EndSetter
		LineNumbersColor As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mLineNumbersFontSize
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mLineNumbersFontSize = Min(value, Max(FontSize, value))
			  LineNumberOffset = 0
			  InvalidateAllLines
			  Redraw
			  
			End Set
		#tag EndSetter
		LineNumbersFontSize As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mLineNumbersTextFont
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mLineNumbersTextFont = value
			  LineNumberOffset = 0
			  InvalidateAllLines
			  Redraw
			  
			End Set
		#tag EndSetter
		LineNumbersTextFont As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  If mLines = Nil Then
			    mLines = New SyntaxArea.LineManager(TextStorage, TabWidth)
			    
			    // Register to receive messages from this line manager only.
			    Self.RegisterForMessage(mLines)
			  End If
			  
			  Return mLines
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mLines = value
			End Set
		#tag EndSetter
		Protected Lines As SyntaxArea.LineManager
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private LoadingDocument As Boolean
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected MatchingBlockHighlight As SyntaxArea.CharSelection
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Note
			Careful:
			This returns just the number of rows that fit into the Canvas.
			This is not the same as the number of text lines that may be appearing in
			the Canvas if line folding is used! (Get that value from `Self.VisibleAndHiddenLines`).
		#tag EndNote
		#tag Getter
			Get
			  // This check prevents `ThreadAccessingUIException` when called from a thread.
			  If Thread.Current = Nil Then
			    mMaxVisibleLines = Min(Me.Height / TextHeight, Lines.Count)
			  End
			  
			  Return mMaxVisibleLines
			  
			End Get
		#tag EndGetter
		MaxVisibleLines As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mBackBuffer As Picture
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mBookmarkTable As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mBrightModeColors As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mCaretBlinker As SyntaxArea.CaretBlinker
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mCaretLine As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mCaretPos As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mCurrentAutocompleteOptions As SyntaxArea.AutocompleteOptions
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mDarkModeColors As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mDesiredColumnCharPos As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mDisplayDirtyLines As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mDisplayInvisibleCharacters As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mDisplayLineNumbers As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mDisplayRightMarginMarker As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mDrawFrame As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mEnableLineFoldings As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mFontSize As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mFullRefresh As Boolean
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mHasFocus As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mHighlightedRanges As SyntaxArea.CharSelectionManager
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mHighlighter As SyntaxArea.LineHighlighter
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mHighlightTimer As Timer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mHorizontalScrollbar As DesktopScrollbar
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mIgnoreRepaintCount As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mIndentString As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mIndentVisually As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mInvalidLines As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mKeepEntireTextIndented As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mLastLongestLineLength As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mLastLongestLinePixels As Single
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mLeftMarginOffset As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mLineNumberOffset As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mLineNumbersFontSize As Integer = 9
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mLineNumbersTextFont As String = "System"
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mLines As SyntaxArea.LineManager
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mMaxVisibleLines As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mModifiedLines As SyntaxArea.ModifiedLineRangeManager
	#tag EndProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  If mModifiedLines = Nil Then
			    mModifiedLines = New SyntaxArea.ModifiedLineRangeManager
			  End If
			  
			  Return mModifiedLines
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mModifiedLines = value
			End Set
		#tag EndSetter
		Protected ModifiedLines As SyntaxArea.ModifiedLineRangeManager
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		MouseOverBlock As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mReadOnly As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mRedrawCaret As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mRedrawEverything As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mRedrawTimer As Timer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mRightMargin As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mScrollPosition As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mScrollPositionX As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mSelectionLength As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mSelectionStart As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mSyntaxDefinition As SyntaxArea.HighlightDefinition
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mTabwidth As Integer = 4
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mTempPicture As Picture
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mTextFont As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mTextHeight As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mTextStorage As SyntaxArea.GapBuffer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mThickInsertionPoint As Boolean = True
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mUndoMgr As UndoKit.UndoManager
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mVerticalScrollbar As DesktopScrollbar
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mVisibleLineRange As SyntaxArea.DataRange
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mWeakSelf As WeakRef
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mWindowIsClosing As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private OptionForTrailingSuggestion As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected PreviouslyDrawnSelection As SyntaxArea.CharSelection
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mReadOnly
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mReadOnly = value
			  
			  If Not value Then EnableBlinker(False)
			  
			End Set
		#tag EndSetter
		ReadOnly As Boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private RedrawTime As Double
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mRightMargin = 0 Then
			    // Get default printer area from printer.
			    Var tmpPrinter As New PrinterSetup
			    mRightMargin = tmpPrinter.Width
			  End If
			  
			  Return mRightMargin
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mRightMargin = value
			  Redraw
			  
			End Set
		#tag EndSetter
		RightMarginAtPixel As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  If gRightMargInlineImage = Nil Then
			    gRightMargInlineImage = New Picture(1, 1, 32)
			    gRightMargInlineImage.RGBSurface.Pixel(0, 0) = &cff
			  End If
			  
			  Return gRightMargInlineImage
			  
			End Get
		#tag EndGetter
		Protected Shared RightMarginLineImage As Picture
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		RightScrollMargin As Integer = 150
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mScrollPosition
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  ChangeScrollValues(ScrollPositionX, value)
			  Redraw
			  
			End Set
		#tag EndSetter
		ScrollPosition As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mScrollPositionX
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  ChangeScrollValues(value, ScrollPosition)
			  Redraw
			  
			End Set
		#tag EndSetter
		ScrollPositionX As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private SelectedLine As Integer
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mSelectionLength
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  ChangeSelection(SelectionStart, value)
			  Redraw
			  
			End Set
		#tag EndSetter
		SelectionLength As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mSelectionStart
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  ChangeSelection(value, 0)
			  Redraw
			  
			End Set
		#tag EndSetter
		SelectionStart As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  // Returned line delimiters will be CR, i.e. Chr(13), by default and not CR+LF or LF,
			  /// even on Windows and Linux.
			  
			  Return TextStorage.GetText(SelectionStart, SelectionLength)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  CurrentEventID = System.Ticks
			  Private_replace(SelectionStart, SelectionLength, value, True)
			  
			End Set
		#tag EndSetter
		SelText As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mSyntaxDefinition
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If mSyntaxDefinition <> value Then
			    mSyntaxDefinition = value
			    Lines.UnfoldAll
			    InvalidateAllLines
			    
			    If CurrentDocumentSymbols <> Nil Then CurrentDocumentSymbols.RemoveAll
			    ModifiedLines.Clear
			    
			    If mHighlighter <> Nil Then
			      // Stop the highlighter.
			      StopHighlighter
			      
			      mHighlighter.Definition = value
			      Lines.MarkAllLinesAsChanged
			      VisibleLineRange.Length = -1
			      
			      Highlight
			    End If
			    
			    If value = Nil Then HighlightingComplete
			  End If
			  
			End Set
		#tag EndSetter
		SyntaxDefinition As SyntaxArea.HighlightDefinition
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mTabwidth
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If value <= 0 Then value = 1
			  
			  mIndentString = ""
			  mTabwidth = value
			  Lines.TabWidth = value
			  UpdateDesiredColumn
			  InvalidateAllLines
			  Redraw
			  
			End Set
		#tag EndSetter
		TabWidth As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  // Returned line delimiters will be CR, i.e. Chr(13), by default and not CR+LF or LF,
			  // even on Windows and Linux.
			  
			  Return TextStorage.GetText(0, TextStorage.Length)
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  StopHighlighter
			  
			  // Prevent the LineHighlighter from interfering while we're modifying the lines.
			  Var lock As New SyntaxArea.LinesLock(Self)
			  #Pragma Unused lock
			  
			  LoadingDocument = True
			  IgnoreRepaint = True
			  mCaretLine = 0
			  ChangeSelection(0, 0)
			  
			  // Flag so the undo is not reset, needed for a custom "replace all"
			  // where it is faster to do a replace in the text and replace the whole text by
			  // the replaced text
			  If Not DisableReset Then
			    UndoMgr.Reset
			  Else
			    Var lineAttrs() As SyntaxArea.TextLineAttributes
			    UndoMgr.Push(New SyntaxArea.UndoableReplace(Self, 0, Self.Text.Length, Self.Text, value, lineAttrs, CaretPos, CurrentEventID))
			    disableReset = False
			  End If
			  
			  ModifiedLines.Clear
			  
			  TextStorage.SetText(value)
			  Lines.SetText(value.Length)
			  
			  // Add disable linefoldings for text bigger than 15000 lines otherwise it's slow.
			  If lines.Count > 15000 Then
			    If Me.EnableLineFoldings Then
			      EnableLineFoldingSetting = True
			    End If
			    Me.EnableLineFoldings = False
			  ElseIf EnableLineFoldingSetting Then
			    Me.EnableLineFoldings = True
			  End If
			  
			  TextChanged
			  
			  Highlight
			  InvalidateAllLines
			  IgnoreRepaint = False
			  LoadingDocument = False
			  Redraw
			  
			End Set
		#tag EndSetter
		Text As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return GetCurrentModeColor(CurrentMethodName)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  SetBrightModeColor (value, CurrentMethodName)
			  InvalidateAllLines
			  Redraw
			  
			End Set
		#tag EndSetter
		TextColor As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mTextFont
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If Value = mTextFont Then Return
			  mTextFont = value
			  TextHeight = 0
			  InvalidateAllLines
			  CalculateMaxHorizontalSB
			  CalculateMaxVerticalSB
			  Redraw
			  
			End Set
		#tag EndSetter
		TextFont As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mTextHeight = 0 Then
			    Var tmp As Picture = TemporaryPicture
			    mTextHeight = tmp.Graphics.TextHeight
			  End If
			  
			  Return mTextHeight + 1
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mTextHeight = value
			End Set
		#tag EndSetter
		TextHeight As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return TextStorage.Length
			End Get
		#tag EndGetter
		TextLength As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return GetCurrentModeColor(CurrentMethodName)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  // Set default selection colour to the system default if none specified.
			  If value = &c000000 Then
			    SetBrightModeColor(Color.HighlightColor, CurrentMethodName)
			  Else
			    SetBrightModeColor(value, CurrentMethodName)
			  End If
			  
			End Set
		#tag EndSetter
		TextSelectionColor As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  If mTextStorage = Nil Then
			    // Create a new text buffer.
			    mTextStorage = New GapBuffer
			    
			    // and blinker timer.
			    mCaretBlinker = New SyntaxArea.CaretBlinker(Self)
			  End If
			  
			  Return mTextStorage
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mTextStorage = value
			End Set
		#tag EndSetter
		Protected TextStorage As SyntaxArea.GapBuffer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mThickInsertionPoint
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mThickInsertionPoint = value
			End Set
		#tag EndSetter
		ThickInsertionPoint As Boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h1
		Protected TrailingSuggestion As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected Typing As Boolean
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mUndoMgr = Nil Then
			    mUndoMgr = New UndoKit.UndoManager
			  End If
			  
			  Return mUndoMgr
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mUndoMgr = value
			End Set
		#tag EndSetter
		UndoMgr As UndoKit.UndoManager
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mVisibleLineRange = Nil Then
			    mVisibleLineRange = New SyntaxArea.DataRange
			  End If
			  
			  Return mVisibleLineRange
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mVisibleLineRange = value
			  
			End Set
		#tag EndSetter
		VisibleLineRange As SyntaxArea.DataRange
	#tag EndComputedProperty


	#tag Constant, Name = DEFAULT_FONT, Type = String, Dynamic = False, Default = \"", Scope = Public, Description = 5468652064656661756C7420666F6E7420746F207573652E
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"Menlo"
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"Consolas"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"System"
	#tag EndConstant

	#tag Constant, Name = DEFAULT_FONTSIZE, Type = Double, Dynamic = False, Default = \"12", Scope = Public, Description = 5468652064656661756C7420666F6E742073697A652E
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="AllowFocusRing"
			Visible=true
			Group="Appearance"
			InitialValue=""
			Type="Boolean"
			EditorType="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="InitialParent"
			Visible=false
			Group="Position"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AutoDeactivate"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="Integer"
			EditorType="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Width"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
			EditorType="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
			EditorType="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockLeft"
			Visible=true
			Group="Position"
			InitialValue="True"
			Type="Boolean"
			EditorType="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockTop"
			Visible=true
			Group="Position"
			InitialValue="True"
			Type="Boolean"
			EditorType="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockRight"
			Visible=true
			Group="Position"
			InitialValue="False"
			Type="Boolean"
			EditorType="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockBottom"
			Visible=true
			Group="Position"
			InitialValue="False"
			Type="Boolean"
			EditorType="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabIndex"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabStop"
			Visible=true
			Group="Position"
			InitialValue="True"
			Type="Boolean"
			EditorType="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Enabled"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Tooltip"
			Visible=true
			Group="Appearance"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Visible"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabPanelIndex"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AutoCloseBrackets"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AutocompleteAppliesStandardCase"
			Visible=false
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AutoCompleteDone"
			Visible=false
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AutoIndentNewLines"
			Visible=false
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="BackColor"
			Visible=false
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Border"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="BorderColor"
			Visible=false
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="BracketHighlightColor"
			Visible=false
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="CaretColor"
			Visible=false
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="CaretLine"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="CaretPos"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ClearHighlightedRangesOnTextChange"
			Visible=false
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="DirtyLinesColor"
			Visible=false
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="DisableReset"
			Visible=false
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="DisplayDirtyLines"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="DisplayInvisibleCharacters"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="DisplayLineNumbers"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="DisplayRightMarginMarker"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="EnableAutocomplete"
			Visible=false
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="EnableLineFoldings"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="EnableLineFoldingSetting"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="FontSize"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="GutterBackgroundColor"
			Visible=false
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="GutterSeparationLineColor"
			Visible=false
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="GutterWidth"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="HighlightBlocksOnMouseOverGutter"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="HighlightMatchingBrackets"
			Visible=false
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="HighlightMatchingBracketsMode"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="IgnoreRepaint"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="IndentPixels"
			Visible=false
			Group="Behavior"
			InitialValue="16"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="IndentVisually"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="KeepEntireTextIndented"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LeftMarginOffset"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LineNumbersColor"
			Visible=false
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LineNumbersFontSize"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LineNumbersTextFont"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="MaxVisibleLines"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ReadOnly"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="RightMarginAtPixel"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="RightScrollMargin"
			Visible=false
			Group="Behavior"
			InitialValue="150"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ScrollPosition"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ScrollPositionX"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="SelectionLength"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="SelectionStart"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="SelText"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabWidth"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Text"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextColor"
			Visible=false
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextFont"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextHeight"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextLength"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextSelectionColor"
			Visible=false
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ThickInsertionPoint"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
