#tag Class
Protected Class Editor
Inherits SyntaxArea.NSScrollViewCanvas
Implements MessageCentre.MessageReceiver
	#tag CompatibilityFlags = (TargetDesktop and (Target32Bit or Target64Bit))
	#tag Event , Description = 5468652063616E76617320697320636C6F73696E672E
		Sub Closing()
		  // Remove this control from all the message lists.
		  Self.UnregisterReceiver
		  
		  If mHighlightTimer <> Nil Then
		    mHighlightTimer.RunMode = Timer.RunModes.Off
		    mHighlightTimer.Enabled = False
		    mHighlightTimer = Nil
		  End If
		  
		  If mRedrawTimer <> Nil Then
		    mRedrawTimer.RunMode = Timer.RunModes.Off
		    mRedrawTimer.Enabled = False
		    mRedrawTimer = Nil
		  End If
		  
		  // Kill the highlighting thread.
		  StopHighlighter
		  mHighlighter = Nil
		  
		  // Avoid circular references.
		  mCaretBlinker = Nil
		  Lines = Nil
		  
		  If CurrentFocusedField = Self Then gCurrentFocusedField = Nil
		  
		  mWindowIsClosing = True
		  
		End Sub
	#tag EndEvent

	#tag Event
		Function ConstructContextualMenu(base As DesktopMenuItem, x As Integer, y As Integer) As Boolean
		  If ConstructContextualMenu(DesktopMenuItem(base), x, y) Then Return True
		  
		  If base.Count > 0 Then base.AddMenu New DesktopMenuItem("-")
		  
		  base.AddMenu(EditCut.Clone)
		  base.AddMenu(EditCopy.Clone)
		  base.AddMenu(EditPaste.Clone)
		  base.AddMenu(EditClear.Clone)
		  base.AddMenu(New DesktopMenuItem("-"))
		  base.AddMenu(EditSelectAll.Clone)
		  
		  Return True
		  
		End Function
	#tag EndEvent

	#tag Event
		Function DoCommand(command As String) As Boolean
		  /// Handles `command`.
		  ///
		  /// `command` is a string constant telling us which command we need to handle.
		  
		  CurrentEventID = System.Ticks
		  
		  Select Case command
		    // =========================================
		    // MOVING THE CARET
		    // =========================================
		  Case CmdScrollPageDown
		    PageDown
		    
		  Case CmdScrollPageUp
		    PageUp
		    
		  Case CmdPageDown
		    PageDown
		    
		  Case CmdPageUp
		    PageUp
		    
		  Case CmdMoveDown
		    MoveCaretDown(False, False)
		    
		  Case CmdMoveLeft, CmdMoveBackward
		    MoveCaretLeft(False)
		    
		  Case CmdMoveRight, CmdMoveForward
		    MoveCaretRight(False)
		    
		  Case CmdMoveToBeginningOfDocument
		    MoveCaretUp(False, True)
		    
		  Case CmdScrollToBeginningOfDocument
		    ScrollToHome
		    
		  Case CmdMoveToBeginningOfLine, CmdMoveToLeftEndOfLine
		    MoveCaretLeft(True)
		    
		  Case CmdMoveToEndOfDocument
		    MoveCaretDown(False, True)
		    
		  Case CmdScrollToEndOfDocument
		    ScrollToEnd
		    
		  Case CmdMoveToEndOfLine, CmdMoveToRightEndOfLine
		    MoveCaretRight(True)
		    
		  Case CmdMoveWordLeft
		    MoveCaretToPreviousWordBoundary
		    
		  Case CmdMoveWordRight
		    MoveCaretToNextWordBoundary
		    
		  Case CmdMoveUp
		    MoveCaretUp(False, False)
		    
		    // =========================================
		    // DELETING
		    // =========================================
		  Case CmdDeleteBackward
		    HandleDelete(False, False)
		    
		  Case CmdDeleteForward
		    HandleDelete(True, False)
		    
		    // =========================================
		    // INSERTING
		    // =========================================
		  Case CmdInsertNewline
		    HandleInsertText(EndOfLine, Nil)
		    
		    // =========================================
		    // SELECTING TEXT
		    // =========================================
		  Case CmdMoveLeftAndModifySelection
		    MoveLeftAndModifySelection(False, False)
		    
		  Case CmdMoveWordLeftAndModifySelection
		    MoveLeftAndModifySelection(False, True)
		    
		  Case CmdMoveWordRightAndModifySelection
		    MoveCaretRightAndModifySelection(False, True)
		    
		  Case CmdMoveRightAndModifySelection
		    MoveCaretRightAndModifySelection(False, False)
		    
		  Case CmdMoveToLeftEndOfLineAndModifySelection
		    MoveLeftAndModifySelection(True, False)
		    
		  Case CmdMoveToRightEndOfLineAndModifySelection
		    MoveCaretRightAndModifySelection(True, False)
		    
		  Case CmdMoveUpAndModifySelection
		    MoveUpAndModifySelection(False, False)
		    
		  Case CmdMoveDownAndModifySelection
		    MoveDownAndModifySelection(False, False)
		    
		  Case CmdPageDownAndModifySelection
		    MoveDownAndModifySelection(True, False)
		    
		  Case CmdPageUpAndModifySelection
		    MoveUpAndModifySelection(True, False)
		    
		  Case CmdMoveToBeginningOfDocumentAndModifySelection
		    MoveUpAndModifySelection(False, True)
		    
		  Case CmdMoveToEndOfDocumentAndModifySelection
		    MoveDownAndModifySelection(False, True)
		    
		    // =========================================
		    // MISC
		    // =========================================
		  Case CmdInsertTab
		    HandleTabKey
		    
		  Case CmdInsertBacktab
		    // Shift-Tab. This always acts like a tab insertion (permits the insertion of a tab
		    // even when tab is used for autocomplete).
		    HandleInsertText(Chr(9), Nil)
		    
		  Case "noop:"
		    If Keyboard.AsyncControlKey And Keyboard.AsyncKeyDown(&h31) Then
		      // Ctrl+Space pressed.
		      #Pragma Warning "TODO: Implement"
		      Break
		    End If
		    
		  End Select
		  
		  // Return True to prevent the event from propagating.
		  Return True
		End Function
	#tag EndEvent

	#tag Event
		Function DragEnter(obj As DragItem, action As DragItem.Types) As Boolean
		  #Pragma Unused obj
		  #Pragma Unused action
		  
		  Me.SetFocus
		  
		End Function
	#tag EndEvent

	#tag Event
		Function DragOver(x As Integer, y As Integer, obj As DragItem, action As DragItem.Types) As Boolean
		  #Pragma Unused obj
		  #Pragma Unused action
		  
		  // Save the drag position.
		  DragTextPos = CharPosAtXY(x, y)
		  
		  // If there's no DragTextSelection, then the text must come from some external source.
		  If DragTextSelection = Nil Then
		    ChangeSelection(DragTextPos, 0)
		  End If
		  
		  CaretVisible = True
		  
		  Redraw
		  
		End Function
	#tag EndEvent

	#tag Event
		Sub DropObject(obj As DragItem, action As DragItem.Types)
		  #Pragma Unused action
		  
		  If Not obj.TextAvailable Then Return
		  
		  CurrentEventID = System.Ticks
		  
		  Var moveWithin As Boolean
		  ignoreRepaint = True
		  // Check if the text comes from this same field.
		  moveWithin = DragSource = Self
		  
		  // Moved inside the selected text, do nothing.
		  If moveWithin And DragTextPos >= DragTextSelection.offset And _
		    DragTextPos <= DragTextSelection.offset + DragTextSelection.length Then
		    ignoreRepaint = False
		    Return
		  End If
		  
		  // Since the text is being moved inside the field, remove the old selection.
		  If moveWithin Then
		    PrivateRemove(DragTextSelection.Offset, DragTextSelection.Length, False)
		  End If
		  
		  // Fix offsets, and insert text.
		  If DragTextSelection = Nil Or DragTextPos < DragTextSelection.Offset Then
		    Insert(DragTextPos, obj.Text)
		    
		  ElseIf DragTextPos > DragTextSelection.Offset + DragTextSelection.Length Then
		    Insert(DragTextPos - DragTextSelection.Length, obj.Text)
		  End If
		  
		  // Select the text.
		  ChangeSelection(SelectionStart, - obj.Text.Length)
		  ignoreRepaint = False
		  
		  // If the drag comes from an external source, `MouseUp` isn't raised, so clean up if needed.
		  If Not moveWithin Then
		    dragTextOnDrag = False
		    DragSource = Nil
		    DragTextSelection = Nil
		    InvalidateAllLines
		  End If
		  
		  Me.Setfocus
		  
		  Redraw
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub FocusLost()
		  CurrentEventID = 0
		  mHasFocus = False
		  RaiseEvent FocusLost
		  EnableBlinker(False)
		  Redraw
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub FocusReceived()
		  mHasFocus = True
		  RaiseEvent FocusReceived
		  EnableBlinker(SelectionLength = 0)
		  Redraw
		  
		  gCurrentFocusedField = Self
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub InsertText(text As String, range As TextRange)
		  // Inserts a single character.
		  
		  HandleInsertText(text, range)
		  
		End Sub
	#tag EndEvent

	#tag Event
		Function IsEditable() As Boolean
		  /// Returns False if the canvas is read-only or True if it's editable.
		  
		  Return Not mReadOnly
		  
		End Function
	#tag EndEvent

	#tag Event
		Function MouseDown(x As Integer, y As Integer) As Boolean
		  CurrentEventID = 0
		  Dragging = False
		  
		  If Not mHasFocus Then Self.SetFocus
		  DragTextOnDrag = False
		  
		  If MouseDown(X, Y) Then Return True
		  If IsContextualClick Then Return False
		  
		  IgnoreRepaint = True
		  Var selstart As Integer
		  
		  selStart = CharPosAtXY(x, y)
		  
		  If Keyboard.ShiftKey Then
		    ChangeSelection(Min(selStart, CaretPos), Abs(selStart - CaretPos))
		    
		  ElseIf x < LineNumberOffset Then
		    SelectedLine = Lines.GetLineNumberForOffset(selStart)
		    
		    If EnableLineFoldings And x >= LineNumberOffset - BlockStartImage.Width - 2 Then
		      // Toggle foldings.
		      ToggleLineFold(SelectedLine)
		      CreateMouseOverBlockHighlight(SelectedLine)
		      
		    Else
		      // Line header clicked.
		      SelectLine(SelectedLine, False)
		      RaiseEvent GutterClicked(SelectedLine, x, y)
		    End If
		    
		  ElseIf SelectionLength > 0 And SelStart >= Self.SelectionStart And SelStart <= Self.SelectionStart + SelectionLength Then
		    // Drag.
		    DragTextOnDrag = True
		    
		  Else
		    SelectedLine = -1
		    ChangeSelection(selStart, 0)
		  End If
		  
		  UpdateDesiredColumn
		  LastMouseDownX = x
		  LastMouseDownY = y
		  IgnoreRepaint = False
		  Redraw
		  
		  Return True
		  
		End Function
	#tag EndEvent

	#tag Event
		Sub MouseDrag(x As Integer, y As Integer)
		  // If the mouse doesn't move, don't do anything until it does.
		  If Abs(LastMouseDownX - X) < 4 And Abs(LastMouseDownY - Y) < 4 Then Return
		  
		  Dragging = True
		  
		  // If dragging selected text.
		  If DragTextOnDrag Then
		    HandleTextDrag(x, y)
		    Return
		  End If
		  
		  IgnoreRepaint = True
		  
		  HandleDragOnGutter(x, y)
		  HandleVerticalMouseDrag(x, y)
		  HandleHorizontalMouseDrag(x, y)
		  
		  IgnoreRepaint = False
		  
		  Redraw
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseExit()
		  If MouseOverBlock <> Nil Then
		    MouseOverBlock = Nil
		    Redraw
		  End If
		  
		  RaiseEvent MouseExit
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseMove(x As Integer, y As Integer)
		  Var selstart As Integer
		  Var s As String
		  Var word As String
		  
		  // In a code sense to obtain individual words lets separate EndOfLines, (, ), =, and ".
		  s = Me.Text.ReplaceAll(EndOfLine, " ")
		  s = s.ReplaceAll("(", " ")
		  s = s.ReplaceAll(")", " ")
		  s = s.ReplaceAll(chr(34), " ")
		  s = s.ReplaceLineEndings(" ")
		  s = s.ReplaceAll(chr(9), " ")
		  s = s.ReplaceAll("=", " ")
		  s = s.ReplaceAll("/", " ")
		  
		  selstart = Me.CharPosAtXY(x, y)
		  
		  word = GetWord(selstart, s)
		  
		  If IsURL(word) = True Then
		    Me.MouseCursor = System.Cursors.FingerPointer
		  Else
		    Me.MouseCursor = System.Cursors.StandardPointer
		  End If
		  
		  RaiseEvent WordUnderMouse(word)
		  
		  MouseMove(x, y)
		  
		  // Change the mouse cursor.
		  If x > LineNumberOffset Then
		    // Enter field.
		    If cursorIsIbeam Then Return
		    Me.MouseCursor = System.Cursors.IBeam
		    CursorIsIbeam = True
		    
		    If MouseOverBlock <> Nil Then
		      MouseOverBlock = Nil
		      Redraw
		    End If
		    
		    Return
		  End If
		  
		  // Enter gutter.
		  Me.MouseCursor = System.Cursors.StandardPointer
		  CursorIsIbeam = False
		  
		  // Visual block feedback.
		  If Not EnableLineFoldings Or Not HighlightBlocksOnMouseOverGutter Then
		    If MouseOverBlock <> Nil Then
		      MouseOverBlock = Nil
		      Redraw
		    End If
		    
		    Return
		  End If
		  
		  If x < LineNumberOffset - BlockStartImage.Width - 2 Then
		    If MouseOverBlock <> Nil Then
		      MouseOverBlock = Nil
		      Redraw
		    End If
		    
		    Return
		  End If
		  
		  CreateMouseOverBlockHighlight(Lines.GetLineNumberForOffset(CharPosAtXY(x, y)))
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseUp(x As Integer, y As Integer)
		  Dragging = False
		  
		  // Check for triple click.
		  If x > LineNumberOffset And Not CheckTripleClick(x, y) Then
		    // Check for double click.
		    If x > LineNumberOffset And Not CheckDoubleClick(x, y) Then
		      RaiseEvent MouseUp(x, y)
		      IsDoubleClick = False
		      
		      // Reset drag variables.
		      If DragTextOnDrag Then
		        DragTextOnDrag = False
		        
		        // Clicked on the selected text, but it never got dragged so clear the selection.
		        If DragTextSelection = Nil Then
		          ChangeSelection(CharPosAtXY(x, y), 0)
		        End If
		        
		        DragSource = Nil
		        DragTextSelection = Nil
		        InvalidateAllLines
		        Redraw
		      End If
		    End If
		  End If
		  
		End Sub
	#tag EndEvent

	#tag Event
		Function MouseWheel(x As Integer, y As Integer, deltaX As Integer, deltaY As Integer) As Boolean
		  /// The mouse has wheeled on Windows or Linux.
		  ///
		  /// `x` is the X coord relative to the control that has received the event.
		  /// `y` is the Y coord relative to the control that has received the event.
		  /// `deltaX` is the number of horizontal scroll lines moved.
		  /// `deltaY` is the number of vertical scroll lines moved.
		  ///
		  /// Returns True to prevent propagating the event further.
		  ///
		  /// `deltaX` is positive when the user scrolls right and negative when scrolling left. 
		  /// `deltaY` is positive when the user scrolls down and negative when scrolling up.
		  ///
		  /// Never called on macOS (handled instead within `NSScrollViewBoundsChanged`).
		  
		  #Pragma Unused x
		  #Pragma Unused y
		  
		  #If TargetMacOS Then
		    Return True
		  #EndIf
		  
		  If MouseOverBlock <> Nil Then MouseOverBlock = Nil
		  
		  ChangeScrollValues(ScrollPositionX + (deltaX * 5), ScrollPosition + deltaY)
		  
		End Function
	#tag EndEvent

	#tag Event , Description = 546865207363726F6C6C207669657720626F756E647320686173206368616E6765642E
		Sub NSScrollViewBoundsChanged(bounds As CGRect)
		  /// The user has scrolled with the mouse / trackpad on macOS.
		  ///
		  /// bounds.Origin.X is the horizontal scroll offset (same as NSScrollViewCanvas.ScrollX_)
		  /// bounds.Origin.Y is the vertical scroll offset (same as NSScrollViewCanvas.ScrollY_)
		  /// bounds.RectSize contains the width and height of the document window.
		  ///
		  /// This replaces the `MouseWheel` event on macOS.
		  /// Never fires on Windows / Linux.
		  
		  // Use `y` for brevity.
		  Var y As Integer = bounds.Origin.Y + (mLineHeight / 2)
		  If y > (mContentsHeight - Me.Height - mLineHeight) Then
		    y = mContentsHeight
		  End If
		  
		  If MouseOverBlock <> Nil Then MouseOverBlock = Nil
		  
		  ChangeScrollValues(bounds.Origin.X, y / mLineHeight)
		  
		End Sub
	#tag EndEvent

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

	#tag Event
		Sub Paint(g As Graphics, areas() As Xojo.Rect)
		  #Pragma Unused areas
		  
		  DrawContents(g, Me.Window)
		  
		End Sub
	#tag EndEvent


	#tag MenuHandler
		Function EditClear() As Boolean Handles EditClear.Action
		  Me.SelText = ""
		  Redraw
		  Return True
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function EditCopy() As Boolean Handles EditCopy.Action
		  Copy
		  
		  Return True
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function EditCut() As Boolean Handles EditCut.Action
		  Var c As New Clipboard
		  
		  c.Text = Me.SelText.ReplaceAll(Chr(1), Chr(0))
		  
		  Me.SelText = ""
		  
		  Redraw
		  
		  Return True
		  
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function EditPaste() As Boolean Handles EditPaste.Action
		  Paste
		  
		  Return True
		  
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function EditSelectAll() As Boolean Handles EditSelectAll.Action
		  SelectAll
		  
		  Redraw
		  
		  Return True
		  
		End Function
	#tag EndMenuHandler


	#tag Method, Flags = &h21
		Private Sub AutocompleteCancelled(requestFocus As Boolean)
		  If requestFocus Then SetFocus
		  
		  AutoCompleteDone = True
		  
		  // Stop listening messages from SuggestionWindow.
		  Self.UnregisterForMessage(CurrentSuggestionWindow)
		  
		  currentSuggestionWindow = Nil
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21, Description = 4765747320746865206175746F636F6D706C657465206F7074696F6E732066726F6D2074686520636C69656E742077696E646F772E
		Private Sub AutocompleteEOL()
		  /// Gets the autocomplete options from the client window.
		  
		  Call FetchAutocompleteOptions
		  If CurrentAutocompleteOptions = Nil Then Return // Nothing to autocomplete.
		  
		  Var maxIndex As Integer = CurrentAutocompleteOptions.Options.LastIndex
		  Var firstMatch, longestCommonPrefix, currentPathComponent As String
		  
		  longestCommonPrefix = CurrentAutocompleteOptions.LongestCommonPrefix
		  currentPathComponent = CurrentAutocompleteOptions.CurrentPathComponent
		  If maxIndex > -1 Then firstMatch = CurrentAutocompleteOptions.Options(0)
		  
		  If maxIndex > 0 Then
		    // More than one option.
		    OptionForTrailingSuggestion = longestCommonPrefix
		    trailingSuggestion = _
		    longestCommonPrefix.Right(longestCommonPrefix.Length - currentPathComponent.Length) + "…"
		    
		  ElseIf maxIndex = 0 And Text <> firstMatch Then
		    // Just one.
		    OptionForTrailingSuggestion = firstMatch
		    trailingSuggestion = firstMatch.Middle(firstMatch.LongestCommonPrefixIndex(currentPathComponent))
		    
		  Else
		    // The word is already fully typed.
		    AutoCompleteDone = True
		    Return
		  End If
		  
		  Var y As Double
		  XYAtCharPos(CaretPos, CaretLine, AutocompleteSuggestionInsertionX, y)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21, Description = 54686520737472696E6720606F7074696F6E60207761732073656C656374656420696E207468652073756767657374696F6E732077696E646F772E
		Private Sub AutocompleteOptionSelected(option As String)
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

	#tag Method, Flags = &h21, Description = 436F6D707574657320746865206D6178696D756D20686F72697A6F6E74616C207363726F6C6C6261722076616C75652E
		Private Sub CalculateMaxHorizontalSB()
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

	#tag Method, Flags = &h21, Description = 436F6D707574657320746865206D6178696D756D20766572746963616C207363726F6C6C6261722076616C75652E
		Private Sub CalculateMaxVerticalSB()
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

	#tag Method, Flags = &h0
		Function CaretColumn() As Integer
		  Var line As SyntaxArea.TextLine = Lines.GetLine(CaretLine)
		  If line <> Nil Then
		    Return CaretPos - line.Offset
		  End If
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21, Description = 5363726F6C6C7320746865207669657720746F2060686F72697A6F6E74616C6020706978656C7320616E642060766572746963616C60206C696E65206E756D6265722E
		Private Sub ChangeScrollValues(horizontal As Integer, vertical As Integer)
		  /// Scrolls the view to `horizontal` pixels and `vertical` line number.
		  
		  mCaretBlinker.Reset
		  
		  Var needsRedraw As Boolean = False
		  Var valuesChanged As Boolean
		  
		  If horizontal <> ScrollPositionX Then
		    // Cap values.
		    horizontal = Max(Min(horizontal, mLastLongestLinePixels - Self.Width + LineNumberOffset + RightScrollMargin), 0)
		    
		    // Force a full redraw.
		    If horizontal <> ScrollPositionX Then
		      InvalidateAllLines
		    End If
		    
		    // Change scrollbars.
		    mScrollPositionX = horizontal
		    If mHorizontalScrollBar <> Nil Then
		      mHorizontalScrollBar.Value = horizontal
		    Else
		      needsRedraw = True
		    End If
		    
		    valuesChanged = True
		    RaiseEvent HorizontalScrollValueChanged
		  End If
		  
		  If vertical <> ScrollPosition Then
		    // Cap values.
		    If EnableLineFoldings Then
		      Var v2 As Integer = Max(Min(vertical, Lines.Count - Lines.InvisibleLines - MaxVisibleLines), 0)
		      If vertical <> v2 Then
		        vertical = v2
		      End If
		    Else
		      vertical = Max(Min(vertical, Lines.Count - MaxVisibleLines), 0)
		    End If
		    
		    If vertical <> ScrollPosition Then
		      InvalidateAllLines
		    End If
		    
		    // Change scrollbars.
		    mScrollPosition = vertical
		    If mVerticalScrollbar <> Nil Then
		      mVerticalScrollbar.Value = vertical
		    Else
		      needsRedraw = True
		    End If
		    
		    valuesChanged = True
		    RaiseEvent VerticalScrollValueChanged
		  End If
		  
		  If valuesChanged Then RaiseEvent ScrollValuesChanged
		  If needsRedraw Then Redraw
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ChangeSelection(selStart As Integer, selLength As Integer, viaDoubleClick As Boolean = False)
		  // Changes the current document selection.
		  
		  // Nothing to change.
		  If selStart = mSelectionStart And selLength = mSelectionLength Then Return
		  
		  // Backwards selections?
		  If selLength < 0 Then
		    selLength = - selLength
		    selStart = selStart - selLength
		  End If
		  
		  // Cap selstart.
		  If selStart < 0 Then
		    selStart = 0
		  ElseIf selStart > TextStorage.Length Then
		    selStart = TextStorage.Length
		  End If
		  
		  // Cap SelLength.
		  If selStart + selLength > TextStorage.Length Then
		    selLength = selLength - TextStorage.Length
		  End If
		  
		  // Find the starting line for the selection.
		  Var linenum As Integer = Lines.GetLineNumberForOffset(SelStart)
		  Var line As TextLine = Lines.GetLine(linenum)
		  
		  // Deal with invisible lines.
		  If EnableLineFoldings Then
		    Var startLineIdx, endLineIdx As Integer
		    Var startLine, endLine As SyntaxArea.TextLine
		    Var update As Boolean
		    
		    // Check if selstart is in a visible line, if not, move it to the next or 
		    // previous visible line.
		    If selStart <> mSelectionStart Then
		      If linenum <> CaretLine Then
		        // Only if the new line is different from the previous.
		        startLineIdx = Lines.GetLineNumberForOffset(selStart)
		        startLine = Lines.GetLine(startLineIdx)
		        If startLine <> Nil And selStart > mSelectionStart Then
		          // Moving forwards.
		          If Not startLine.Visible Then
		            startLineIdx = Lines.NextVisibleLine(startLineIdx)
		            update = True
		          End If
		        ElseIf startLine <> Nil And selstart < mSelectionStart Then
		          // Moving backwards.
		          If Not startLine.Visible Then
		            startLineIdx = Lines.PreviousVisibleLine(startLineIdx)
		            update = True
		          End If
		        End If
		        
		        If update Then
		          startLine = Lines.GetLine(startLineIdx)
		          If startLine <> Nil Then
		            selStart = OffsetForXPos(startLine, CaretDesiredColumn)
		            linenum = startLineIdx
		            line = startLine
		            
		            If selLength > 0 Then
		              selLength = mSelectionStart + mSelectionLength - selStart
		            End If
		          End If
		        End If
		      End If
		    End If
		    
		    If Not update And selLength > 0 And selLength <> mSelectionLength Then
		      endLineIdx = Lines.GetLineNumberForOffset(selStart + selLength)
		      endLine = Lines.GetLine(endLineIdx)
		      
		      If endLine <> Nil And selLength > mSelectionLength Then
		        // Enlarging the selection.
		        If Not endLine.Visible Then
		          endLineIdx = Lines.NextVisibleLine(endLineIdx)
		          update = True
		        End If
		      ElseIf endLine <> Nil And selLength < mSelectionLength Then
		        // Shrinking the selection.
		        If Not endLine.Visible Then
		          endlineIdx = Lines.PreviousVisibleLine(endLineIdx)
		          update = True
		        End If
		      End If
		      
		      If update Then
		        endLine = Lines.GetLine(endLineIdx)
		        If endLine <> Nil Then
		          selLength = OffsetForXPos(endLine, CaretDesiredColumn) - selStart
		        End If
		      End If
		    End If
		  End If
		  
		  // Ensure the selection isn't inside an EOL delimiter.
		  If line <> Nil Then
		    If selStart > line.Offset + line.Length - line.DelimiterLength Then
		      If selStart > mSelectionStart Then
		        selStart = line.Offset + line.Length
		      Else
		        selStart = line.Offset + line.Length - line.DelimiterLength
		      End If
		      linenum = Lines.GetLineNumberForOffset(selStart)
		      line = Lines.GetLine(linenum)
		    End If
		  End If
		  
		  // Update the selection if inside a placeholder.
		  Var selectedPlaceholder As SyntaxArea.TextPlaceholder = Nil
		  If mSelectionStart < selStart Then
		    // Moving the start to the right.
		    Var placeholder As SyntaxArea.TextPlaceholder = line.PlaceholderForOffset(selStart)
		    If placeholder <> Nil Then
		      If selLength = 0 Then
		        selStart = placeholder.Offset + line.Offset
		        selLength = placeholder.Length
		        selectedPlaceholder = placeholder
		        
		      Else
		        selStart = placeholder.Offset + placeholder.Length + line.Offset
		        selLength = selLength - placeholder.Length + 1
		      End If
		    End If
		    
		  ElseIf mSelectionStart > selStart Then
		    // Moving start to the left.
		    If selStart = -1 Then Exit
		    
		    Var placeholder As SyntaxArea.TextPlaceholder = line.PlaceholderForOffset(selStart)
		    
		    If placeholder <> Nil Then
		      If selLength = 0 Then
		        selStart = placeholder.Offset + line.Offset
		        selLength = placeholder.Length
		        selectedPlaceholder = placeholder
		        
		      Else
		        selStart = placeholder.Offset + line.Offset
		        selLength = selLength + placeholder.Length - 1
		      End If
		    End If
		    
		  ElseIf mSelectionLength > selLength Then
		    // Shrinking the selection.
		    Var endline As SyntaxArea.TextLine = _
		    Lines.GetLine(Lines.GetLineNumberForOffset(selStart + selLength))
		    If endline <> Nil Then
		      Var placeholder As SyntaxArea.TextPlaceholder = _
		      endline.PlaceholderForOffset(selStart + selLength)
		      
		      If placeholder <> Nil Then
		        selLength = Max(selLength - placeholder.Length + 1, 0)
		      End If
		    End If
		    
		  ElseIf mSelectionLength < selLength Then
		    // Expanding the selection.
		    Var endline As SyntaxArea.TextLine = _
		    Lines.GetLine(Lines.GetLineNumberForOffset(selStart + selLength))
		    If endline <> Nil Then
		      Var placeholder As SyntaxArea.TextPlaceholder = _
		      endline.PlaceholderForOffset(selStart + selLength)
		      
		      If placeholder <> Nil Then
		        selLength = selLength + placeholder.Length - 1
		      End If
		    End If
		  End If
		  
		  // Change internal values.
		  mSelectionStart = selStart
		  mSelectionLength = selLength
		  
		  // If SelLength = 0 or outside selection then update the caret.
		  If selLength = 0 Or CaretPos < selStart Or CaretPos > selStart + selLength Then
		    // Has the line changed? If so, invalidate the lines.
		    If linenum <> CaretLine Then
		      InvalidateLine(CaretLine)
		      mCaretLine = Lines.GetLineNumberForOffset(selStart)
		    End If
		    
		    mCaretPos = selStart
		    
		    // Check if the caret is out of view.
		    ViewToCharPos(CaretLine, mCaretPos)
		  End If
		  
		  // Blink only if no selection.
		  EnableBlinker(selLength = 0)
		  
		  If Not UndoMgr.IsUndoing Then
		    // Raise the SelectionChanged event
		    RaiseEvent SelectionChanged(linenum + 1, selStart - line.Offset, selLength)
		    
		    If selectedPlaceholder <> Nil Then
		      Var label As String = _
		      TextStorage.GetText(line.Offset + selectedPlaceholder.TextRange.Offset, _
		      selectedPlaceholder.TextRange.Length)
		      RaiseEvent PlaceholderSelected(label, linenum, Lines.GetLine(linenum), selectedPlaceholder, viaDoubleClick)
		    End If
		  End If
		  
		  // Fire autocomplete events.
		  If selLength > 0 Or Not EnableAutocomplete Then Return
		  trailingSuggestion = ""
		  
		  // Are we at the end of the current line?
		  If caretPos = line.Offset + line.Length - line.DelimiterLength Then
		    // Check if the caret is out of view.
		    AutocompleteEOL
		  End If
		  
		  InvalidateLine(CaretLine)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E732074686520636861726163746572206F666673657420617420706F736974696F6E2028782C207929206F72202D31206966206E6F7420666F756E642E
		Function CharPosAtXY(x As Integer, y As Integer) As Integer
		  /// Returns the character offset at position (x, y) or -1 if not found.
		  
		  Var lineNum As Integer
		  
		  // Find the line.
		  If EnableLineFoldings Then
		    lineNum = Lines.GetNumberOfLinesNeededToView(Min(Lines.Count - 1, _
		    Max(0, Floor((y + (ScrollPosition * TextHeight)) / TextHeight))))
		  Else
		    lineNum = Min(Lines.Count - 1, _
		    Max(0, Floor((y + (ScrollPosition * TextHeight)) / TextHeight)))
		  End If
		  
		  // Find the character offset.
		  Var line As SyntaxArea.TextLine = Lines.GetLine(lineNum)
		  
		  // Not found?
		  If line = Nil Then Return -1
		  
		  Var offset As Integer = LeftMarginOffset + LineNumberOffset - ScrollPositionX
		  
		  Return OffsetForXPos(line, x - offset)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function CheckDoubleClick(x As Integer, y As Integer) As Boolean
		  Var doubleClickTime, currentClickTicks As Integer
		  
		  doubleClickTime = GetDoubleClickTimeTicks
		  
		  Var result As Boolean = False
		  
		  currentClickTicks = System.Ticks
		  
		  // If the two clicks happened close enough together in time...
		  If(currentClickTicks - LastClickTicks) <= doubleClickTime Then
		    // If the two clicks occured close enough together in space...
		    If Abs(x - LastMouseUpX) <= 4 And Abs(y - LastMouseUpY) <= 4 Then
		      IsDoubleClick = True
		      HandleDoubleClick
		      result = True
		    Else
		      IsDoubleClick = False
		    End If
		  End If
		  LastClickTicks = currentClickTicks
		  LastMouseUpX = x
		  LastMouseUpY = y
		  
		  Return result
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function CheckTripleClick(x As Integer, y As Integer) As Boolean
		  If IsDoubleClick = True Then
		    Var doubleClickTime, currentClickTicks As Integer
		    
		    doubleClickTime = GetDoubleClickTimeTicks
		    
		    Var result As Boolean = False
		    currentClickTicks = System.Ticks
		    
		    // If the three clicks happened close enough together in time...
		    If(currentClickTicks - LastTripleClickTicks) <= doubleClickTime Then
		      // If the three clicks occured close enough together in space...
		      If Abs(x - LastMouseUpX) <= 4 And Abs(y - LastMouseUpY) <= 4 Then
		        HandleTripleClick
		        result = True
		      End If
		    End If
		    LastTripleClickTicks = currentClickTicks
		    LastMouseUpX = x
		    LastMouseUpY = y
		    IsDoubleClick = False
		    Return result
		  Else
		    IsDoubleClick = False
		    Return False
		  End If
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 436C6561727320686967686C6967687465642072616E67657320616E6420726564726177732E
		Sub ClearHighlightedCharacterRanges()
		  /// Clears highlighted ranges and redraws.
		  
		  If HighlightedRanges.SelectionCount = 0 Then Return
		  
		  HighlightedRanges.Clear
		  InvalidateAllLines
		  
		  Redraw
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  // Remember all opened editor objects so we can update them if dark mode is invoked.
		  mWeakSelf = New WeakRef(Self)
		  If gWeakCEFs = Nil Then gWeakCEFs = New Dictionary
		  gWeakCEFs.Value(mWeakSelf) = True
		  
		  Super.Constructor
		  
		  IgnoreRepaint = True
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Copy()
		  If SelectionLength = 0 Then Return
		  Var c As New Clipboard
		  
		  Var textToCopy As String
		  
		  textToCopy = Me.SelText.ReplaceAll(Chr(1), Chr(0))
		  
		  #If TargetWindows
		    // As the `Text()` and `SelText()` functions use CR for line delimiters, 
		    // we need to convert them into the native format here).
		    textToCopy = textToCopy.ReplaceAll(Me.LineDelimiter, EndOfLine.Windows)
		  #ElseIf TargetLinux
		    textToCopy = textToCopy.ReplaceAll(Me.LineDelimiter, EndOfLine.Unix)
		  #EndIf
		  
		  c.Text = textToCopy
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateMouseOverBlockHighlight(lineIndex As Integer)
		  Var line As SyntaxArea.TextLine = Lines.GetLine(lineIndex)
		  If line = Nil Then Return
		  
		  Var openingLine As Integer
		  If line.IsBlockStart Then
		    openingLine = lineIndex
		  Else
		    openingLine = OpeningBlockLineForLine(lineIndex)
		  End If
		  If openingLine < 0 Then Return
		  
		  line = Lines.GetLine(openingLine)
		  If line = Nil Then Return
		  
		  Var x, y1, y2 As Double
		  XYAtCharPos(line.Offset, openingLine, x, y1)
		  
		  Var closingLine As Integer = Lines.NextBlockEndLine(openingLine)
		  If closingLine < 0 Then Return
		  
		  line = lines.GetLine(closingLine)
		  If line = Nil Then Return
		  
		  XYAtCharPos(line.Offset, closingLine, x, y2)
		  
		  If MouseOverBlock <> Nil Then
		    // Avoid a redraw if we can.
		    If MouseOverBlock.Value("y") = _
		    y1 - TextHeight - 2 And MouseOverBlock.Value("h") = y2 - y1 + TextHeight + 4 Then Return
		  End If
		  
		  MouseOverBlock = Nil
		  MouseOverBlock = New Dictionary
		  MouseOverBlock.Value("startLine") = openingLine
		  MouseOverBlock.Value("x") = LeftMarginOffset - 3
		  MouseOverBlock.Value("y") = y1 - TextHeight - 2
		  MouseOverBlock.Value("w") = Self.Width - LineNumberOffset - LeftMarginOffset
		  MouseOverBlock.Value("h") = y2 - y1 + TextHeight + 4
		  
		  Redraw
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function CurrentAutocompleteOptions() As SyntaxArea.AutocompleteOptions
		  Return mCurrentAutocompleteOptions
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21, Description = 47657473207468652063757272656E7420776F72642C207768657265207468652063617265742069732061742E
		Private Function CurrentWord() As SyntaxArea.TextSegment
		  /// Gets the current word, where the caret is at.
		  ///
		  /// A word is anything except whitespace.
		  
		  Var startIndex, endIndex As Integer
		  startIndex = PreviousCharacterInSet(CaretPos + 1, CURRENT_CARET_WORD_DELIMITER_PATTERN)
		  endIndex = NextCharacterInSet(CaretPos - 1, CURRENT_CARET_WORD_DELIMITER_PATTERN)
		  
		  Return New SyntaxArea.TextSegment(startIndex, endIndex - startIndex)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21, Description = 48616E646C6573206368617261637465722064656C6574696F6E2C2065697468657220666F727761726473206F72206261636B77617264732C20776F7264206F72206368617261637465722E
		Private Sub DeleteChars(forwardDelete As Boolean, deleteWord As Boolean)
		  /// Handles character deletion, either forwards or backwards, word or character.
		  
		  // Check if the key would delete a placeholder.
		  Var line As SyntaxArea.TextLine = Lines.GetLine(CaretLine)
		  If line <> Nil And line.HasPlaceholders Then
		    Var placeholder As SyntaxArea.TextPlaceholder
		    If forwardDelete Then
		      Placeholder = line.PlaceholderForOffset(CaretPos + 1)
		    Else
		      Placeholder = line.PlaceholderForOffset(CaretPos - 1)
		    End If
		    If placeholder <> Nil Then
		      ChangeSelection(placeholder.Offset + line.Offset, placeholder.Length)
		    End If
		  End If
		  
		  // Delete highlighted text.
		  If Me.SelectionLength > 0 Then
		    PrivateReplace(SelectionStart, Me.SelectionLength, "")
		    Return
		  End If
		  
		  Var length, offset As Integer
		  
		  If forwardDelete Then
		    If CaretPos >= TextStorage.Length Then Return
		    If deleteWord Then
		      length = NextNonAlpha(CaretPos) - CaretPos
		    Else
		      // Delete a single character.
		      length = 1
		    End If
		  Else
		    // Backspace deletion.
		    If deleteWord Then
		      length = CaretPos - PreviousNonAlpha(CaretPos)
		    Else
		      // Single character deletion.
		      length = 1
		    End If
		  End If
		  
		  Var updateCaret As Boolean = Not forwardDelete
		  If Not mIndentVisually And mKeepEntireTextIndented Then
		    // Here we may have a special case: If IndentVisually=false, and the user backspaces when the
		    // cursor is at the start of the indented line, we'll need to delete not only the indentation
		    // but the line delimiter to the previous line as well, or the user would not be able to ever join
		    // the current line with the previous line because it would get re-indented right away again.
		    Var caretCol As Integer = Self.CaretColumn
		    Var lineText As String = Self.GetLine(caretLine)
		    Var textLeftOfCaret As String = lineText.Left(caretCol)
		    If textLeftOfCaret.Trim = "" Then
		      // The cursor is at the start of the line or inside indentation space.
		      If forwardDelete Then
		        Var rightOfCaret As String = lineText.Middle(caretCol + 1, 1)
		        If rightOfCaret <> "" And rightOfCaret <> LineDelimiter And rightOfCaret.Trim = "" Then
		          // Forward delete in indentation whitespace doesn't work so skip it.
		          System.Beep
		          Return
		        End If
		      Else
		        // Delete to the previous line.
		        length = CaretPos - PreviousLineDelimiter(CaretPos) + 1
		      End If
		    End If
		  End If
		  
		  If forwardDelete Then
		    offset = SelectionStart
		  Else
		    offset = SelectionStart - length
		  End If
		  
		  PrivateRemove(offset, length, updateCaret)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DrawContents(gr As Graphics, parentWindow As DesktopWindow)
		  #If Not DebugBuild
		    #Pragma DisableBackgroundTasks
		  #EndIf
		  
		  // Make sure we're not updating while the LineHighlighter is busy.
		  Var lock As New SyntaxArea.LinesLock(Self)
		  #Pragma Unused lock
		  
		  Self.UpdateIndentation
		  
		  If Not mRedrawEverything And Not mRedrawCaret Then
		    mRedrawEverything = True
		  End If
		  
		  If gr.Height <= 0 Or gr.Width <= 0 Then
		    // There is nothing to draw.
		    Return
		  End If
		  
		  // Check our back buffer to make sure we've got one that we can draw to.
		  // If we don't have a back buffer, then we need to create one.
		  // If our size is different than our back buffer, then we need to create a new one.
		  Var realign As Boolean
		  realign = (mBackBuffer = Nil) Or (gr.Width <> mBackBuffer.Width) Or _
		  (gr.Height <> mBackBuffer.Height)
		  
		  // macOS already double buffers for us so we don't need a back buffer.
		  Var createBackBuffers As Boolean = Not TargetMacOS
		  
		  If realign Then
		    If createBackBuffers Then
		      // Create double buffer.
		      mBackBuffer = parentWindow.BitmapForCaching(gr.Width, gr.Height)
		    End If
		    CalculateMaxHorizontalSB
		    CalculateMaxVerticalSB
		    InvalidateAllLines
		    mRedrawEverything = True
		  End If
		  
		  // Get a graphics context to draw onto.
		  Var g As Graphics
		  If mBackBuffer = Nil Then
		    // Draw directly into the Canvas graphics (required for Retina support)
		    g = gr
		  Else
		    // Draw first into a separate graphics buffer which is then painted into the 
		    // Canvas at the end.
		    g = mBackBuffer.Graphics
		  End If
		  
		  If mRedrawCaret And Not mRedrawEverything Then
		    mRedrawEverything = True
		  End If
		  
		  #If DebugBuild
		    RedrawTime = System.Microseconds
		  #EndIf
		  
		  Var sx, sy As Double
		  Var gg As Graphics // For the gutter (left frame showing line numbers).
		  Var gutterWidth As Integer = LineNumberOffset
		  
		  // Line numbers.
		  If Self.displayLineNumbers Then
		    // Create the line numbers picture if needed.
		    If Not createBackBuffers Then
		      // Draw the gutter directly into the canvas graphics object (Retina requirement).
		      gg = gr
		    Else
		      // Use a separate graphics buffer for the gutter.
		      If Gutter = Nil Or Gutter.Height <> g.Height Or gutter.Width <> gutterWidth Then
		        Gutter = parentWindow.BitmapForCaching(gutterWidth, g.Height)
		        gg = gutter.Graphics
		        gg.FontName = LineNumbersTextFont
		        gg.FontSize = LineNumbersFontSize
		      Else
		        gg = gutter.Graphics
		      End If
		    End If
		    
		    // Repaint the gutter background if needed.
		    If mfullRefresh Or LastDrawnTopLine <> ScrollPosition Then
		      gg.DrawingColor = GutterBackgroundColor.LighterColor(10, True)
		      gg.FillRectangle LineNumberOffset - FoldingOffset, 0, FoldingOffset, g.Height
		      gg.DrawingColor = GutterBackgroundColor
		      gg.FillRectangle 0, 0, gutterWidth - FoldingOffset, g.Height
		      gg.DrawingColor = GutterSeparationLineColor
		      gg.DrawLine(LineNumberOffset - 1, 0, LineNumberOffset - 1, g.Height)
		      LastDrawnTopLine = ScrollPosition
		    End If
		  End If
		  
		  // Paint the selection and get its range.
		  Var selection As New SyntaxArea.CharSelection(-1, -1, -1, -1, TextSelectionColor)
		  Var tmpSelection As SyntaxArea.CharSelection
		  
		  // Get the selection range.
		  If SelectionLength > 0 Then
		    selection.offset = SelectionStart
		    selection.length = SelectionLength
		    selection.StartLine = Lines.GetLineNumberForOffset(SelectionStart)
		    selection.EndLine = Lines.GetLineNumberForOffset(SelectionStart + SelectionLength)
		  End If
		  
		  // Set the text properties.
		  g.FontSize = FontSize
		  g.FontName = TextFont
		  If g <> gr Then
		    gr.FontSize = FontSize
		    gr.FontName = TextFont
		  End If
		  
		  // Cache the text height (used at the end of this method when setting the 
		  // document size on macOS).
		  mLineHeight = g.TextHeight
		  
		  // Starting positions.
		  sx = LeftMarginOffset + LineNumberOffset - ScrollPositionX
		  sy = g.TextHeight
		  
		  Var line As TextLine
		  Var linesDrawn As Integer
		  Var firstLine As Integer
		  Var lastLine As Integer
		  
		  // The lowest possible line to draw is ScrollPosition, so start there.
		  If EnableLineFoldings Then
		    firstline = Lines.GetNumberOfLinesNeededToView(ScrollPosition)
		    lastLine = Lines.Count - 1
		  Else
		    firstLine = ScrollPosition
		    lastLine = Min(Lines.Count - 1, ScrollPosition + MaxVisibleLines)
		  End If
		  
		  Var linesOnScreen As Integer
		  
		  For lineIdx As Integer = firstLine To lastLine
		    linesOnScreen = linesOnScreen + 1
		    
		    // Get the current line.
		    line = Lines.GetLine(lineIdx)
		    If Not line.Visible Then Continue For
		    
		    If _
		      InvalidLines.HasKey(lineIdx) Or _
		      mFullRefresh Or _
		      selection.IsLineIndexInRange(lineIdx) Or _
		      (PreviouslyDrawnSelection <> Nil And PreviouslyDrawnSelection.IsLineIndexInRange(lineIdx)) Then
		      
		      // This line needs to be repainted (invalid), or is a full refresh, or is
		      // part of the previous or current selection.
		      
		      // Clear the background for this line.
		      Var lineBackColor As Color = BackColor
		      
		      If Not UseBackgroundColorForLine(lineIdx, lineBackColor) Then
		        lineBackColor = BackColor
		      End If
		      g.DrawingColor = lineBackColor
		      g.FillRectangle(LineNumberOffset, sy - g.TextHeight, g.Width - LineNumberOffset, TextHeight)
		      
		      // Draw highlighted ranges.
		      // First draw the highlighted ranges.
		      Var ranges() As SyntaxArea.CharSelection = _
		      HighlightedRanges.SelectionsForLine(lineIdx)
		      
		      // Then draw words with a background.
		      line.AppendHighlightedWords(ranges, lineIdx)
		      
		      // Finally draw the selection.
		      ranges.Add(selection)
		      
		      If matchingBlockHighlight <> Nil Then
		        ranges.Add(MatchingBlockHighlight)
		      End If
		      
		      Var x, y, w As Double
		      For Each tmpSelection In ranges
		        If tmpSelection.IsLineIndexInRange(lineIdx) Then
		          // If in selection, highlight the line.
		          If mHasFocus Or Not tmpSelection.LosesFocus Then
		            g.DrawingColor = tmpSelection.SelectionColor
		          Else
		            g.DrawingColor = BackColor.DarkerColor(30, True)
		          End If
		          
		          If lineIdx > tmpSelection.StartLine And lineIdx < tmpSelection.EndLine Then
		            // A fully selected line.
		            g.FillRectangle(LineNumberOffset, sy - g.TextHeight, g.Width - line.VisualIndent(Self.IndentVisually), TextHeight)
		            
		          ElseIf lineIdx = tmpSelection.StartLine And tmpSelection.EndLine <> tmpSelection.StartLine Then
		            // First line.
		            XYAtCharPos(tmpSelection.Offset, lineIdx, x, y)
		            
		            If tmpSelection.Rounded Then
		              g.FillRoundRectangle(x, sy - g.TextHeight, g.Width - x + 10, TextHeight, 8, 8)
		            Else
		              g.FillRectangle(x, sy - g.TextHeight, g.Width - x, TextHeight)
		            End If
		            
		          ElseIf lineIdx = tmpSelection.EndLine And tmpSelection.EndLine <> tmpSelection.StartLine Then
		            // Last line.
		            XYAtCharPos(tmpSelection.Offset + tmpSelection.Length, lineIdx, x, y)
		            
		            If tmpSelection.Rounded Then
		              g.FillRoundRectangle(LineNumberOffset - 10, sy - g.TextHeight, x - LineNumberOffset + 10, TextHeight, 8, 8)
		            Else
		              g.FillRectangle(LineNumberOffset, sy - g.TextHeight, x - LineNumberOffset, TextHeight)
		            End If
		            
		          Else
		            // Small block in line.
		            XYAtCharPos(tmpSelection.Offset, lineIdx, x, y)
		            XYAtCharPos(tmpSelection.Offset + tmpSelection.Length, lineIdx, w, y)
		            
		            If tmpSelection.Rounded Then
		              g.FillRoundRectangle(x, sy - g.TextHeight, w - x, TextHeight, 8, 8)
		            Else
		              g.FillRectangle(x, sy - g.TextHeight, w - x, TextHeight)
		            End If
		          End If
		        End If
		      Next tmpSelection
		      
		      // Paint a line background?
		      PaintBelowLine(lineIdx, g, LineNumberOffset, sy - g.TextHeight, g.Width - LineNumberOffset - 1, TextHeight)
		      
		      // Paint the line.
		      line.Paint(TextStorage, g, sx, sy - (g.TextHeight - g.FontAscent), TextColor, DisplayInvisibleCharacters, SelectionStart, SelectionLength, True, Self.IndentVisually)
		      
		      // Line overlay?
		      PaintAboveLine(lineIdx, g, LineNumberOffset, sy - g.TextHeight, g.Width - LineNumberOffset - 1, TextHeight)
		      
		      // Contents after folded line...
		      If line.Folded Then
		        Var tmp As SyntaxArea.TextLine = Lines.GetLine(Lines.NextBlockEndLine(lineIdx))
		        If tmp <> Nil Then
		          // Make italic and paint after the current line.
		          tmp.Italic = True
		          tmp.Paint(TextStorage, g, sx + line.TotalWidth + SyntaxArea.BlockFoldedTrailImage.Width + 6, sy - (g.TextHeight - g.FontAscent), TextColor, False, SelectionStart, SelectionLength, False, Self.IndentVisually)
		          tmp.Italic = False
		        End If
		      End If
		      
		      // Autocomplete suggestion.
		      If SelectionLength = 0 And lineIdx = CaretLine And TrailingSuggestion <> "" Then
		        g.DrawingColor = SyntaxArea.AdjustColorForDarkMode(&cAAAAAA)
		        Var c As Color = g.DrawingColor
		        If Color.IsDarkMode Then
		          g.DrawingColor = Color.RGB(c.Red + 75, c.Green + 75, c.Blue + 75)
		        End If
		        g.DrawText(trailingSuggestion, AutocompleteSuggestionInsertionX, sy - (g.TextHeight - g.FontAscent))
		      End If
		      
		      // Draw the gutter last so that it overwrites text that was drawn 
		      // into the gutter area when it's horizontally scrolled.
		      If displayLineNumbers Then
		        // The caret line is slightly darker.
		        If EnableLineFoldings Then
		          gg.DrawingColor = GutterBackgroundColor.LighterColor(10, True)
		          gg.FillRectangle(LineNumberOffset - FoldingOffset - 1, sy - g.TextHeight, FoldingOffset, TextHeight)
		        End If
		        If CaretLine = lineIdx Then
		          gg.DrawingColor = GutterBackgroundColor.DarkerColor(20, True)
		          gg.FillRectangle(0, sy - g.TextHeight, LineNumberOffset - 1 - FoldingOffset, TextHeight)
		          gg.Bold = True
		          gg.DrawingColor = SyntaxArea.AdjustColorForDarkMode(Color.Black)
		        Else
		          gg.DrawingColor = GutterBackgroundColor
		          gg.FillRectangle(0, sy - g.TextHeight, LineNumberOffset - 1 - FoldingOffset, TextHeight)
		        End If
		        
		        If DisplayDirtyLines And line.IsDirty Then
		          gg.DrawingColor = DirtyLinesColor
		          gg.FillRectangle(LineNumberOffset - 4, sy - g.TextHeight, 3, TextHeight)
		        End If
		        
		        // Bookmarks?
		        If BookmarkTable.HasKey(lineIdx) Then
		          Var img As Picture = UseBookmarkIconForLine(lineIdx)
		          If img = Nil Then img = BookmarkImage
		          gg.DrawPicture(img, 0, sy - g.TextHeight + (g.TextHeight - img.Height) / 2)
		        End If
		        
		        // Row icon available?
		        If line.Icon <> Nil Then
		          Var icn As Picture = line.Icon
		          gg.DrawPicture(icn, gutterWidth - icn.Width - 2 - FoldingOffset, sy - g.TextHeight + (g.TextHeight - icn.Height) / 2)
		        Else
		          // Line number.
		          gg.DrawingColor = LineNumbersColor
		          If gr = gg Then
		            gg.FontName = LineNumbersTextFont
		            gg.FontSize = LineNumbersFontSize
		          End If
		          gg.DrawText(Str(lineIdx + 1), LineNumberOffset - 2 - gg.TextWidth(Str(lineIdx + 1)) - FoldingOffset, sy - (TextHeight - gg.FontAscent) / 2)
		          If gr = gg Then
		            gg.FontSize = FontSize
		            gg.FontName = TextFont
		          End If
		        End If
		        
		        If EnableLineFoldings And line.IsBlockStart Then
		          If line.Folded Then
		            // Draw a line folded marker.
		            gg.DrawPicture(BlockFoldedImage, LineNumberOffset - BlockFoldedImage.Width - 2, sy - TextHeight + (TextHeight - BlockFoldedImage.Height) / 2 + 1)
		          Else
		            gg.DrawPicture(BlockStartImage, LineNumberOffset - BlockStartImage.Width - 2, sy - TextHeight + (TextHeight - BlockStartImage.Height) / 2 + 1)
		          End If
		        ElseIf EnableLineFoldings And line.IsBlockEnd Then
		          gg.DrawPicture(BlockEndImage, LineNumberOffset - BlockEndImage.Width - 2, sy - TextHeight + (TextHeight - BlockEndImage.Height) / 2 + 1)
		        End If
		        
		        gg.Bold = False
		      End If
		      
		      linesDrawn = linesDrawn + 1
		    End If
		    
		    // Go to the next line.
		    If TextHeight = 0 Then Break
		    sy = sy + TextHeight
		    If sy - g.TextHeight > g.Height Then
		      // Or bail out if we've reached the end of the canvas.
		      Exit For
		    End If
		  Next lineIdx
		  
		  VisibleLineRange.Offset = firstLine
		  VisibleLineRange.Length = linesOnScreen
		  
		  // Clear the rest of the buffer if necessary.
		  sy = sy - g.TextHeight
		  If sy < g.Height Then
		    g.DrawingColor = BackColor
		    g.FillRectangle(gutterWidth, sy, g.Width - gutterWidth, g.Height - sy)
		  End If
		  
		  // Invalid lines are no longer invalid.
		  InvalidLines.RemoveAll
		  mFullRefresh = False
		  PreviouslyDrawnSelection = selection
		  
		  If MatchingBlockHighlight <> Nil Then
		    InvalidateLine(MatchingBlockHighlight.StartLine)
		    MatchingBlockHighlight = Nil
		  End If
		  
		  // Draw the line numbers.
		  If DisplayLineNumbers And gg <> gr Then
		    g.DrawPicture(Gutter, 0, 0)
		  End If
		  
		  // And their frame.
		  If Border Then
		    g.DrawingColor = BorderColor
		    g.DrawRectangle(0, 0, g.Width, g.Height)
		  End If
		  
		  // Now we can draw the back buffer to the screen
		  If mBackBuffer <> Nil Then
		    gr.DrawPicture(mBackBuffer, 0, 0, gr.Width, gr.Height, 0, 0, mBackBuffer.Width, mBackBuffer.Height)
		  End If
		  
		  // Paint the location of the previous/next block character.
		  If BlockBeginPosX >= 0 Then
		    PaintHighlightedBlock(gr)
		    BlockBeginPosX = -1
		    BlockBeginPosY = -1
		  End If
		  
		  // Right margin marker.
		  If DisplayRightMarginMarker And RightMarginAtPixel > 0 Then
		    gr.DrawPicture(RightMarginLineImage, RightMarginAtPixel - ScrollPositionX + LeftMarginOffset + LineNumberOffset, 0, 1, gr.Height, 0, 0, 1, 1)
		  End If
		  
		  // Paint the caret.
		  If DragSource = Nil Then
		    PaintCaret(CaretPos, gr, gutterWidth)
		  Else
		    PaintCaret(DragTextPos, gr, gutterWidth)
		  End If
		  
		  PaintOver(gr, gutterWidth)
		  
		  #If DebugBuild
		    redrawTime = System.Microseconds - redrawTime
		  #EndIf
		  
		  #If TargetMacOS
		    mContentsWidth = mLastLongestLinePixels + LineNumberOffset + RightScrollMargin
		    If EnableLineFoldings Then
		      mContentsHeight = (Lines.Count - Lines.invisibleLines) * mLineHeight
		    Else
		      mContentsHeight = Lines.Count * mLineHeight
		    End If
		    SetDocumentSize(mContentsWidth, mContentsHeight)
		  #EndIf
		  
		  mRedrawEverything = False
		  mRedrawCaret = False
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub EnableBlinker(value As Boolean)
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

	#tag Method, Flags = &h21, Description = 41736B732074686520636C69656E742077696E646F7720666F72206175746F636F6D706C657465206F7074696F6E7320666F72207468652063757272656E7420776F72642E
		Private Function FetchAutocompleteOptions() As Boolean
		  /// Asks the client window for autocomplete options for the current word.
		  
		  mCurrentAutocompleteOptions = Nil
		  
		  // Get the word where the caret is.
		  Var CurrentWordSegment As SyntaxArea.TextSegment = CurrentWord
		  If CurrentWordSegment.Length = 0 Then Return False
		  If CaretPos = CurrentWordSegment.Offset Then
		    // Return false if the cursor is at the beginning of the word.
		    Return False
		  End If
		  
		  // Get the actual word text.
		  Var prefix As String = TextStorage.GetText(CurrentWordSegment.Offset, CurrentWordSegment.Length).Trim
		  If prefix.Length = 0 Or prefix = "." Then Return False
		  
		  // Raise event.
		  mCurrentAutocompleteOptions = RaiseEvent AutocompleteOptionsForPrefix(prefix)
		  
		  If CurrentAutocompleteOptions = Nil Then Return False
		  
		  If CurrentAutocompleteOptions.Options.LastIndex < -1 Then
		    mCurrentAutocompleteOptions = Nil
		    Return False
		  End If
		  
		  CurrentAutocompleteOptions.Prefix = prefix
		  
		  // Get the current path component. This is the last word after the last period in the prefix.
		  // E.g: If the prefix is "one.two.three" then the current component will be "three".
		  Var tmpPath() As String = prefix.Split(".")
		  CurrentAutocompleteOptions.CurrentPathComponent = TmpPath(tmpPath.LastIndex)
		  
		  Return True
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function FoldingOffset() As Integer
		  If Not EnableLineFoldings Then Return 0
		  
		  Return BlockStartImage.Width + 2
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetDoubleClickTimeTicks() As Integer
		  Var doubleClickTime As Integer
		  
		  #If TargetMacOS Then
		    Declare Function GetDblTime Lib "Carbon"() As Integer
		    doubleClickTime = GetDblTime()
		  #EndIf
		  
		  #If TargetWin32 Then
		    Declare Function GetDoubleClickTime Lib "User32.DLL"() As Integer
		    doubleClickTime = GetDoubleClickTime()
		    // doubleClickTime now holds the number of milliseconds. Convert to ticks.
		    doubleClickTime = doubleClickTime / 1000.0 * 60
		  #EndIf
		  
		  #If TargetLinux Then
		    Const libname = "libgtk-3"
		    Soft Declare Function gtk_settings_get_default Lib libname() As Ptr
		    Soft Declare Sub g_object_get Lib libname(Obj As Ptr, first_property_name As CString, ByRef doubleClicktime As Integer, Null As Integer)
		    If Not System.IsFunctionAvailable("gtk_settings_get_default", libname) Then
		      Break
		    Else
		      Var gtkSettings As Ptr = gtk_settings_get_default()
		      g_object_get(gtkSettings, "gtk-double-click-time", doubleClickTime, 0)
		      // doubleClickTime now holds the number of milliseconds. Convert to ticks.
		      doubleClickTime = doubleClickTime / 1000.0 * 60
		    End If
		  #EndIf
		  
		  If doubleClickTime <= 0 Then
		    doubleClickTime = 20 // 20 System.Ticks = 1/3s = 330ms
		  End
		  
		  Return doubleClickTime
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E7320746865207465787420636F6E7461696E656420696E2061206C696E652E
		Function GetLine(index As Integer) As String
		  /// Returns the text contained in a line.
		  
		  Var line As SyntaxArea.TextLine = Lines.GetLine(index)
		  
		  If line = Nil Then Return ""
		  
		  Return TextStorage.GetText(line.Offset, line.Length)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetWord(start As Integer, source As String) As String
		  Var s As String
		  s = source
		  s = s + " "
		  s = s.Middle(0, s.IndexOf(start, " "))
		  s = s.NthField(" ", s.CountFields(" ") -1)
		  Return s.ReplaceLineEndings(EndOfLine).NthField(EndOfLine, 1)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21, Description = 5468652075736572206861732070726573736564207468652064656C657465206F7220666F72776172642064656C657465206B65792E204966206064656C657465576F7264602069732054727565207468656E207468652061646A6163656E7420776F72642077696C6C2062652072656D6F7665642E204F74686572776973652069742072656D6F766573207468652061646A6163656E74206368617261637465722E
		Private Sub HandleDelete(forwardDelete As Boolean, deleteWord As Boolean)
		  /// The user has pressed the delete or forward delete key.
		  /// If `deleteWord` is True then the adjacent word will be removed.
		  /// Otherwise it removes the adjacent character.
		  
		  // Add a new event ID if changed typing, or no event ID, or time
		  // elapsed between events is 3 secs.
		  If Typing Or CurrentEventID = 0 Or System.Ticks > CurrentEventID + (60 * UNDO_EVT_BLOCK_SECS) Then
		    CurrentEventID = System.Ticks
		  End If
		  
		  Typing = False
		  
		  DeleteChars(forwardDelete, deleteWord)
		  
		  UpdateDesiredColumn
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleDoubleClick()
		  // Highlight word(s) after a double click.
		  
		  Var word As New SyntaxArea.TextSegment
		  Var char As String = TextStorage.GetCharAt(CaretPos)
		  If IsWhitespace(char) Then char = TextStorage.GetCharAt(Max(CaretPos - 1, 0))
		  
		  // Check if it's in a placeholder.
		  Var line As SyntaxArea.TextLine = Lines.GetLine(CaretLine)
		  If line <> Nil And line.PlaceholderForOffset(CaretPos + 1) <> Nil Then
		    Word.Offset = CaretPos + 1
		    Word.Length = 0
		    
		  ElseIf IsBlockChar(char) Then
		    // If it's a block character, find the start/end block.
		    Var tmp As String
		    
		    If BLOCK_OPEN_CHARS.IndexOf(char) > -1 Then
		      word.Offset = CaretPos + 1
		      word.Length = NextBlockCharacter(char, CaretPos, tmp) - CaretPos - 1
		      
		    Else
		      word.Offset = PreviousBlockCharacter(char, CaretPos, tmp) + 1
		      word.Length = CaretPos - word.Offset
		    End If
		    
		  ElseIf IsWhitespace(char) Then
		    word.Offset = PreviousNonWhitespace(CaretPos)
		    word.Length = NextNonWhitespace(CaretPos) - word.Offset
		    
		  ElseIf IsAlpha(char) Then
		    word.Offset = previousNonAlpha(CaretPos)
		    word.Length = NextNonAlpha(CaretPos) - word.Offset
		    
		  Else
		    word.Offset = PreviousAlpha(CaretPos)
		    word.Length = NextAlpha(CaretPos) - word.Offset
		  End If
		  
		  ChangeSelection(word.Offset, word.Length, True)
		  
		  Redraw
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21, Description = 48616E646C65732061206D6F7573652064726167206F6E20746865206775747465722E
		Private Sub HandleDragOnGutter(X as integer, Y as integer)
		  /// Handles a mouse drag on the gutter.
		  
		  Var currPos As Integer = CharPosAtXY(x, y)
		  If selectedLine >= 0 And x < LineNumberOffset Then
		    // Drag on the line numbers.
		    Var onLine As Integer = Lines.GetLineNumberForOffset(currPos)
		    Var fromLine, toLine As SyntaxArea.TextLine
		    fromLine = Lines.GetLine(Min(SelectedLine, onLine))
		    toLine = Lines.GetLine(Max(SelectedLine, onLine))
		    
		    ChangeSelection(fromLine.Offset, toLine.Offset + toLine.Length - fromLine.Offset - toline.DelimiterLength)
		    
		  Else
		    ChangeSelection(Min(currPos, CaretPos), Abs(currPos - CaretPos))
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleHorizontalMouseDrag(x As Integer, y As Integer)
		  #Pragma Unused y
		  
		  If x < LineNumberOffset Then
		    ChangeScrollValues(ScrollPositionX + (x - LineNumberOffset), ScrollPosition)
		    
		  ElseIf x > Width Then
		    ChangeScrollValues(ScrollPositionX + (x - Width), ScrollPosition)
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21, Description = 43616C6C65642066726F6D2077697468696E207468652060496E736572745465787460206576656E742E205573656420696E7465726E616C6C7920746F20696E736572742061206368617261637465722E
		Private Sub HandleInsertText(s As String, range As TextRange)
		  /// Called from within the `InsertText` event. Used internally to insert a character.
		  
		  #Pragma Warning "TODO: Handle the range property"
		  
		  // Add a new event ID if changed typing, or no event ID, or time elapsed
		  // between events is 5 secs.
		  If Not Typing Or CurrentEventID = 0 Or _
		    System.Ticks > CurrentEventID + (60 * UNDO_EVT_BLOCK_SECS) Then
		    CurrentEventID = System.Ticks
		  End If
		  Typing = True
		  
		  If Me.SelectionLength > 0 Then
		    PrivateReplace(SelectionStart, Me.SelectionLength, s)
		  Else
		    // See if we need to autocomplete brackets.
		    Var bracketInserted As Boolean
		    If AutoCloseBrackets Then
		      // Scan the possible opening block characters.
		      For i As Integer = 0 To BLOCK_OPEN_CHARS.Length-1
		        If s = BLOCK_OPEN_CHARS.Middle(i, 1) Then
		          // Found, so the closing block MUST be at the same location, in
		          // the BLOCK_CLOSE_CHARS.
		          s = s + BLOCK_CLOSE_CHARS.Middle(i, 1)
		          bracketInserted = True
		          Exit For
		        End If
		      Next i
		    End If
		    Insert(SelectionStart, s)
		    
		    // If autocompleted, move caret one character to the left.
		    If bracketInserted Then CaretPos = CaretPos - 1
		  End If
		  
		  // Autoindent lines?
		  // Check if current (new) entered line needs autoindenting.
		  If AutoIndentNewLines And Not mIndentVisually Then
		    Var thisLine As SyntaxArea.TextLine = Lines.GetLine(CaretLine)
		    If thisLine <> Nil And thisLine.IsBlockEnd Then
		      // Indent this new line.
		      Var state As Variant
		      If PrivateIndentline(CaretLine, False, state) Then
		        InvalidateLine(CaretLine)
		      End If
		    End If
		  End If
		  
		  // Save the screen location of the caret, in case we need to move up/down.
		  UpdateDesiredColumn
		  
		  If MouseOverBlock <> Nil Then
		    CreateMouseOverBlockHighlight(CaretLine)
		  End If
		  
		  // Redraw.
		  IgnoreRepaint = False
		  Redraw
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function HandleKeyDown(key As String) As Boolean
		  #Pragma Warning "Remove once implemented all of CEF's functionality in this method"
		  Raise New UnsupportedOperationException("The HandleKeyDown method is not implemented.")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21, Description = 48616E646C657320746865207072657373696E67206F662074686520746162206B65792E
		Private Sub HandleTabKey()
		  /// Handles the pressing of the tab key.
		  
		  #Pragma Warning "TODO: Handle the tab key"
		  Raise New UnsupportedOperationException("Tab key handling is not yet implemented.")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21, Description = 4F7074696F6E616C6C7920636C6561727320686967686C6967687465642072616E67657320616E6420726169736573207468652060546578744368616E67656460206576656E742E
		Private Sub HandleTextChanged()
		  /// Optionally clears highlighted ranges and raises the `TextChanged` event.
		  
		  If ClearHighlightedRangesOnTextChange Then
		    ClearHighlightedCharacterRanges
		  End If
		  
		  RaiseEvent TextChanged
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleTextDrag(x As Integer, y As Integer)
		  // Save the selection.
		  DragTextSelection = New SyntaxArea.DataRange
		  DragTextSelection.Offset = SelectionStart
		  DragTextSelection.Length = SelectionLength
		  
		  Var drag As Picture = SelectedTextDragImage
		  Var di As DragItem = New DragItem(Self.Window, x, y, drag.Width, drag.Height)
		  
		  di.Text = Me.SelText
		  
		  // Set the dragging source.
		  DragSource = Self
		  di.Drag
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21, Description = 53656C6563746564207468652063757272656E74206C696E652E
		Private Sub HandleTripleClick()
		  /// Selected the current line.
		  
		  Me.SelectLine(CaretLine, True)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleVerticalMouseDrag(x As Integer, y As Integer)
		  #Pragma Unused x
		  
		  // If dragging selection outside visible area.
		  If y < 0 Or y > Height Then
		    
		    Var linesToScroll As Integer
		    
		    If y < 0 Then
		      linesToScroll = y / TextHeight
		      
		    Else
		      linesToScroll = (y - Height) / TextHeight
		    End If
		    
		    // Cap the number of times this method gets called per second (here is 
		    // max 12 calls per second).
		    If System.Ticks > lastDragTicks + 5 Then
		      ChangeScrollValues(ScrollPositionX, ScrollPosition + linesToScroll)
		      LastDragTicks = System.Ticks
		    End If
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Highlight()
		  If mHighlighter = Nil Or mHighlighter.ThreadState = Thread.ThreadStates.NotRunning Then
		    HighlighterTask(True).Start
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21, Description = 46696E647320746865206E65787420636C6F73696E6720626C6F636B2C207374617274696E6720617420606F6666736574602E
		Private Sub HighlightClosingBlock(s As String, offset As Integer)
		  /// Finds the next closing block, starting at `offset`.
		  
		  Var pos As Integer
		  Var closeChar As String
		  pos = NextBlockCharacter(s, offset, closeChar)
		  
		  If pos >= 0 Then
		    If HighlightMatchingBracketsMode = 0 Then
		      // Circle.
		      XYAtCharPos(pos, BlockBeginPosX, BlockBeginPosY)
		    Else
		      Var line As Integer = LineNumAtCharPos(pos)
		      MatchingBlockHighlight = _
		      New SyntaxArea.CharSelection(pos, 1, line, line, BracketHighlightColor)
		      InvalidateLine(line)
		    End If
		    
		    RaiseEvent BlockCharsMatched(s, offset, closeChar, pos)
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function HighLighterTask(createIfMissing As Boolean) As SyntaxArea.LineHighlighter
		  If mHighlighter = Nil And createIfMissing Then
		    mHighlighter = _
		    New SyntaxArea.LineHighlighter(Self, SyntaxDefinition, Self.ModifiedLines, _
		    TextStorage, Lines)
		    Self.RegisterForMessage(mHighlighter)
		  End If
		  
		  Return mHighlighter
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21, Description = 46696E6473207468652070726576696F7573206F70656E696E6720626C6F636B2C207374617274696E67206174206F66667365742E
		Private Sub HighlightOpeningBlock(s As String, offset As Integer)
		  /// Finds the previous opening block, starting at offset.
		  
		  Var pos As Integer
		  Var openingChar As String
		  pos = PreviousBlockCharacter(s, offset, openingChar)
		  
		  If pos >= 0 Then
		    If HighlightMatchingBracketsMode = 0 Then
		      // Circle.
		      XYAtCharPos(pos, BlockBeginPosX, BlockBeginPosY)
		    Else
		      Var line As Integer = LineNumAtCharPos(pos)
		      MatchingBlockHighlight = _
		      New SyntaxArea.CharSelection(pos, 1, line, line, BracketHighlightColor)
		      InvalidateLine(line)
		    End If
		    
		    BlockCharsMatched(openingChar, pos, s, offset)
		  Else
		    // No open block found.
		    // Ignore.
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function IndentStr(indents As Integer) As String
		  If mIndentString = "" Then
		    mIndentString = Chr(9)
		    For i As Integer = 1 To 8
		      mIndentString = mIndentString + mIndentString
		    Next i
		  End If
		  
		  Return mIndentString.Left(indents)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Insert(offset As Integer, s As String)
		  PrivateReplace(offset, 0, s, True)
		  
		End Sub
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

	#tag Method, Flags = &h21, Description = 52657475726E7320547275652069662060736020697320616C7068616E756D657269633F
		Private Function IsAlpha(s As String) As Boolean
		  /// Returns True if `s` is alphanumeric?
		  
		  Return MatchesRegex("\w", s)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21, Description = 52657475726E73205472756520696620606368617260206973206120626C6F636B206368617261637465722E
		Private Function IsBlockChar(char As String) As Boolean
		  /// Returns True if `char` is a block character.
		  
		  If BlockCharsPattern = "" Then
		    // Build the search pattern.
		    For i As Integer = 0 To BLOCK_OPEN_CHARS.Length -1
		      BlockCharsPattern = BlockCharsPattern + "\" + BLOCK_OPEN_CHARS.Middle(i, 1) + "\" + BLOCK_CLOSE_CHARS.Middle(i, 1)
		    Next
		    BlockCharsPattern = "[" + BlockCharsPattern + "]"
		  End If
		  
		  Return MatchesRegex(BlockCharsPattern, char)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsURL(input As String) As Boolean
		  #Pragma BreakOnExceptions False
		  
		  Var search As New RegEx
		  Var matches As New RegExMatch
		  
		  search.SearchPattern = RegEXURL
		  matches = Search.Search(input)
		  
		  If matches = Nil Then Exit Function
		  
		  If matches.SubExpressionCount = 0 Then
		    Return False
		  Else
		    Return True
		  End If
		  
		  Exception err As NilObjectException
		    Return False
		    
		  Exception err As RegExSearchPatternException
		    Return False
		    
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21, Description = 52657475726E7320547275652069662060736020697320636F6E7369646572656420746F20626520776869746573706163652E
		Private Function IsWhitespace(s As String) As Boolean
		  /// Returns True if `s` is considered to be whitespace.
		  
		  Return MatchesRegex("\s", s)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function LeftTrimLines(s As String) As String
		  Var lines() As String = s.ReplaceLineEndings(EndOfLine).Split(EndOfLine)
		  
		  For i As Integer = 0 To lines.LastIndex
		    lines(i) = lines(i).TrimLeft
		  Next i
		  
		  Return String.FromArray(lines, EndOfLine)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LineCount() As Integer
		  Return Lines.Count
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21, Description = 43616C6C656420627920746865206C696E65206D616E616765722C207768656E20746865206C696E65206E756D626572206368616E6765732E
		Private Sub LineCountChanged(newLineCount As Integer)
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

	#tag Method, Flags = &h21
		Private Sub LineHighlighted(lineIndex As Integer)
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

	#tag Method, Flags = &h0
		Function LineNumAtCharPos(offset As Integer) As Integer
		  Return Lines.GetLineNumberForOffset(offset)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21, Description = 456974686572207468652073796D626F6C732068617665206368616E6765642C206F7220746865206C696E6520636F6E7461696E696E67207468656D207761732072656D6F7665642C20736F2072656D6F7665207468656D2066726F6D20746865206C6F63616C207461626C652E
		Private Sub LineSymbolsRemoved(symbols As Dictionary)
		  /// Either the symbols have changed, or the line containing them was removed,
		  /// so remove them from the local table.
		  
		  For Each key As SyntaxArea.TextLine In symbols.Keys
		    If CurrentDocumentSymbols.HasKey(key) Then CurrentDocumentSymbols.Remove(key)
		  Next key
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21, Description = 52657475726E732054727565206966206065787072657373696F6E60206D6174636865732074686520607061747465726E602E
		Private Function MatchesRegex(pattern As String, expression As String) As Boolean
		  /// Returns True if `expression` matches the `pattern`.
		  
		  Var rg As New RegEx
		  
		  rg.SearchPattern = pattern
		  
		  expression = expression.ConvertEncoding(SyntaxArea.InternalEncoding)
		  
		  Var myMatch As RegExMatch = rg.Search(expression)
		  
		  Return myMatch <> Nil
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21, Description = 43616C6C656420627920746865206C696E65206D616E616765722C207768656E20746865726527732061206E6577206C696E652074686174277320746865206C6F6E67657374206C696E652E
		Private Sub MaxLineLengthChanged(longestLineIndex As Integer)
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

	#tag Method, Flags = &h21, Description = 4D6F7665732074686520636172657420646F776E2E
		Private Sub MoveCaretDown(pageDown As Boolean, moveToEnd As Boolean)
		  /// Moves the caret down.
		  
		  CurrentEventID = 0
		  
		  // If there's a selection, move the caret to the end of the selection.
		  If SelectionLength > 0 Then
		    ChangeSelection(SelectionStart + SelectionLength, 0)
		    Return
		  End If
		  
		  Var lineNum As Integer
		  
		  // Find the line number.
		  If SelectionStart < CaretPos Then
		    lineNum = Lines.GetLineNumberForOffset(SelectionStart)
		  Else
		    lineNum = Lines.GetLineNumberForOffset(SelectionStart + SelectionLength)
		  End If
		  
		  // Default to moving one line.
		  Var linesToMove As Integer = 1
		  
		  If moveToEnd Then
		    // Move to the end of the document.
		    linesToMove = Lines.Count - 1 - ScrollPosition
		  ElseIf pageDown Then
		    // Move down a full page.
		    linesToMove = MaxVisibleLines - 1
		  End If
		  
		  Var line As SyntaxArea.TextLine
		  Var offset As Integer
		  // Get the line to move to.
		  lineNum = lineNum + linesToMove
		  If lineNum >= Lines.Count Then
		    // Moving down on the last line - jump to the end of that line.
		    lineNum = Lines.Count - 1
		    line = Lines.GetLine(lineNum)
		    offset = line.offset + line.Length - line.DelimiterLength
		  Else
		    line = Lines.GetLine(lineNum)
		    // Find the offset for the desired screen position.
		    offset = OffsetForXPos(line, CaretDesiredColumn)
		  End If
		  
		  // Actually move the caret.
		  If moveToEnd Then
		    ChangeSelection(TextStorage.Length, 0)
		  Else
		    ChangeSelection(offset, 0)
		  End If
		  
		  // Scroll if necessary.
		  If lineNum > ScrollPosition + VisibleLineRange.Length - 2 Then
		    ChangeScrollValues(ScrollPositionX, lineNum - VisibleLineRange.Length + 2)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub MoveCaretLeft(toStartOfLine As Boolean)
		  CurrentEventID = 0
		  
		  Var pos, charsToMove, lineNum As Integer
		  
		  // If there's an active selection, move CaretPos to start of selection
		  If SelectionLength > 0 Then
		    ChangeSelection(SelectionStart, 0)
		    pos = SelectionStart
		    
		  Else
		    If toStartOfLine Then
		      lineNum = Lines.GetLineNumberForOffset(SelectionStart)
		      charsToMove = SelectionStart - Lines.GetLine(LineNum).Offset
		    Else
		      charsToMove = 1
		    End If
		    
		    ChangeSelection(SelectionStart - charsToMove, 0)
		    pos = CaretPos
		    ViewToCharPos(CaretLine, pos)
		    
		    // Did we just cross a block character?
		    Var char As String = TextStorage.GetCharAt(CaretPos)
		    If IsBlockChar(char) Then
		      // Find the opening/closing character for this block.
		      If BLOCK_CLOSE_CHARS.IndexOf(char) > -1 Then
		        HighlightOpeningBlock(char, CaretPos)
		      Else
		        HighlightClosingBlock(char, CaretPos)
		      End If
		    End If
		  End If
		  
		  UpdateDesiredColumn(CaretPos)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub MoveCaretRight(toEndOfLine As Boolean)
		  CurrentEventID = 0
		  
		  Var pos As Integer
		  
		  // Default to moving one character.
		  Var charsToMove As Integer = 1
		  Var lineNum As Integer
		  
		  If SelectionLength > 0 Then
		    ChangeSelection(SelectionStart + SelectionLength, 0)
		    pos = SelectionStart
		  Else
		    If toEndOfLine Then
		      lineNum = Lines.GetLineNumberForOffset(SelectionStart)
		      
		      charsToMove = Lines.GetLine(lineNum).Offset + _
		      Lines.GetLine(lineNum).Length - SelectionStart - Lines.GetLine(lineNum).DelimiterLength
		    End If
		    
		    Var char As String = TextStorage.GetCharAt(CaretPos)
		    
		    // Check if the next character is a block character.
		    If IsBlockChar(char) Then
		      // Mark it for highlighting.
		      If BLOCK_CLOSE_CHARS.IndexOf(char) > -1 Then
		        HighlightOpeningBlock(char, caretpos)
		      Else
		        HighlightClosingBlock(char, caretpos)
		      End If
		    End If
		    
		    ChangeSelection(SelectionStart + charsToMove, 0)
		    pos = CaretPos
		    ViewToCharPos(CaretLine, pos)
		  End If
		  
		  UpdateDesiredColumn(CaretPos)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21, Description = 4D6F7665732074686520636172657420746F207468652072696768742C206D6F64696679696E67207468652073656C656374696F6E2E
		Private Sub MoveCaretRightAndModifySelection(toEndOfLine As Boolean, toNextWord As Boolean)
		  /// Moves the caret to the right, modifying the selection.
		  
		  // Default moving one character.
		  Var charsToMove As Integer = 1
		  
		  Var pos, lineNum As Integer
		  
		  If SelectionStart < CaretPos Then
		    // Shrink the selection.
		    If toEndOfLine Then
		      lineNum = Lines.GetLineNumberForOffset(SelectionStart)
		      
		      If SelectionStart < Lines.GetLine(lineNum).Offset + Lines.GetLine(lineNum).Length Then
		        Var line As SyntaxArea.TextLine = Lines.GetLine(lineNum)
		        ChangeSelection(line.Offset + line.Length - line.DelimiterLength, CaretPos - line.Offset - line.Length)
		        pos = SelectionStart
		      End If
		      ViewToCharPos(lineNum, SelectionStart)
		      
		    ElseIf toNextWord Then
		      Var nextOffset As Integer = NextNonAlpha(SelectionStart)
		      ChangeSelection(nextOffset, CaretPos - nextOffset)
		      pos = nextOffset
		      ViewToCharPos(pos)
		      
		    Else
		      // Move one place.
		      ChangeSelection(SelectionStart + charsToMove, SelectionLength - charsToMove)
		      pos = SelectionStart
		      ViewToCharPos(pos)
		    End If
		    
		  Else
		    // Expand the selection.
		    If toEndOfLine Then
		      lineNum = lines.GetLineNumberForOffset(SelectionStart + SelectionLength)
		      
		      If SelectionStart + SelectionLength < Lines.GetLine(lineNum).Offset + Lines.GetLine(lineNum).Length Then
		        Var line As SyntaxArea.TextLine = Lines.GetLine(lineNum)
		        ChangeSelection(SelectionStart, line.Offset + line.Length - SelectionStart - line.DelimiterLength)
		        pos = SelectionStart + SelectionLength
		      End If
		      ViewToCharPos(lineNum, SelectionStart + SelectionLength)
		      
		    ElseIf toNextWord Then
		      Var nextOffset As Integer = NextNonAlpha(SelectionStart + SelectionLength)
		      ChangeSelection(nextOffset, CaretPos - nextOffset)
		      pos = nextOffset
		      ViewToCharPos(pos)
		      
		    Else
		      // Single character.
		      ChangeSelection(SelectionStart, SelectionLength + charsToMove)
		      pos = SelectionStart + SelectionLength
		      ViewToCharPos(pos)
		    End If
		  End If
		  
		  UpdateDesiredColumn(CaretPos)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub MoveCaretToNextWordBoundary()
		  Var charsToMove As Integer = NextNonAlpha(SelectionStart) - SelectionStart
		  
		  Var char As String = TextStorage.GetCharAt(CaretPos)
		  
		  // Check if the next character is a block character.
		  If IsBlockChar(char) Then
		    // Mark it for highlight.
		    If BLOCK_CLOSE_CHARS.IndexOf(char) > -1 Then
		      HighlightOpeningBlock(char, CaretPos)
		    Else
		      HighlightClosingBlock(char, CaretPos)
		    End If
		  End If
		  
		  ChangeSelection(SelectionStart + charsToMove, 0)
		  
		  Var pos As Integer = CaretPos
		  
		  ViewToCharPos(CaretLine, pos)
		  
		  UpdateDesiredColumn(CaretPos)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub MoveCaretToPreviousWordBoundary()
		  CurrentEventID = 0
		  
		  Var charsToMove As Integer = SelectionStart - previousNonAlpha(SelectionStart)
		  
		  ChangeSelection(SelectionStart - charsToMove, 0)
		  Var pos As Integer = CaretPos
		  ViewToCharPos(CaretLine, pos)
		  
		  // Did we just cross a block character?
		  Var char As String = TextStorage.GetCharAt(CaretPos)
		  If IsBlockChar(char) Then
		    // Find the opening/closing character for this block.
		    If BLOCK_CLOSE_CHARS.IndexOf(char) > -1 Then
		      HighlightOpeningBlock(char, CaretPos)
		    Else
		      HighlightClosingBlock(char, CaretPos)
		    End If
		  End If
		  
		  UpdateDesiredColumn(CaretPos)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub MoveCaretUp(pageUp As Boolean, moveToStart As Boolean)
		  CurrentEventID = 0
		  
		  // If there's a selection, simply move to start of selection.
		  If SelectionLength > 0 Then
		    ChangeSelection(SelectionStart, 0)
		    Return
		  End If
		  
		  Var lineNum As Integer
		  
		  // Get the starting line number.
		  If SelectionStart < CaretPos Then
		    lineNum = Lines.GetLineNumberForOffset(SelectionStart)
		  Else
		    lineNum = Lines.GetLineNumberForOffset(SelectionStart + SelectionLength)
		  End If
		  
		  // Default moving one line.
		  Var linesToMove As Integer = 1
		  
		  If moveToStart Then
		    // Move to the start of the document.
		    linesToMove = ScrollPosition + MaxVisibleLines
		  ElseIf pageUp Then
		    // Move up a full page.
		    linesToMove = MaxVisibleLines - 1
		  End If
		  
		  Var line As SyntaxArea.TextLine
		  Var offset As Integer
		  
		  lineNum = lineNum - linesToMove
		  If lineNum < 0 Then
		    // Moving up on the first lin -, jump to the begining of line.
		    lineNum = 0
		    line = Lines.GetLine(lineNum)
		    offset = 0
		  Else
		    line = Lines.GetLine(lineNum)
		    offset = OffsetForXPos(line, caretDesiredColumn)
		  End If
		  
		  // Move the caret.
		  ChangeSelection(offset, 0)
		  
		  // Scroll.
		  If lineNum < ScrollPosition Then
		    ChangeScrollValues(ScrollPositionX, lineNum)
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21, Description = 4D6F7665732074686520636172657420646F776E20616E64206D6F646966696573207468652073656C656374696F6E2E
		Private Sub MoveDownAndModifySelection(pageDown As Boolean, moveToEnd As Boolean)
		  /// Moves the caret down and modifies the selection.
		  
		  Var lineNum As Integer
		  
		  // Find the line number.
		  If SelectionStart < CaretPos Then
		    lineNum = Lines.GetLineNumberForOffset(SelectionStart)
		  Else
		    lineNum = Lines.GetLineNumberForOffset(SelectionStart + SelectionLength)
		  End If
		  
		  // Default to moving one line.
		  Var linesToMove As Integer = 1
		  
		  If moveToEnd Then
		    linesToMove = Lines.Count - 1 - ScrollPosition
		  ElseIf pageDown Then
		    linesToMove = MaxVisibleLines - 1
		  End If
		  
		  Var line As SyntaxArea.TextLine
		  Var offset As Integer
		  
		  // Get the line to move to.
		  lineNum = lineNum + linesToMove
		  If lineNum >= Lines.Count Then
		    // Moving down on the last line - jump to the end of that line.
		    lineNum = Lines.Count - 1
		    line = Lines.GetLine(lineNum)
		    offset = line.Offset + line.Length - line.DelimiterLength
		  Else
		    line = Lines.GetLine(lineNum)
		    // Find the offset for the desired screen position.
		    offset = OffsetForXPos(line, CaretDesiredColumn)
		  End If
		  
		  // Extend the selection.
		  ChangeSelection(Min(CaretPos, offset), Abs(offset - CaretPos))
		  
		  // Scroll if necessary.
		  If lineNum > ScrollPosition + VisibleLineRange.length - 2 Then
		    ChangeScrollValues(ScrollPositionX, lineNum - VisibleLineRange.Length + 2)
		  End If
		  
		  IgnoreRepaint = False
		  Redraw
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21, Description = 4D6F76657320746865206361726574206C65667477617264732C206D6F64696679696E67207468652073656C656374696F6E2E
		Private Sub MoveLeftAndModifySelection(toStartOfLine As Boolean, toPreviousWord As Boolean)
		  /// Moves the caret leftwards, modifying the selection.
		  
		  Var pos As Integer
		  
		  // Default to moving one place.
		  Var charsToMove As Integer = 1
		  Var lineNum As Integer
		  
		  // If the end of the selection is after the caret position then shrink the selection.
		  If SelectionStart + SelectionLength > CaretPos Then
		    
		    // Move to start of line.
		    If toStartOfLine Then
		      lineNum = Lines.GetLineNumberForOffset(SelectionStart + SelectionLength)
		      
		      If SelectionStart + SelectionLength > Lines.GetLine(lineNum).Offset Then
		        ChangeSelection(Lines.GetLine(lineNum).Offset, CaretPos - Lines.GetLine(lineNum).Offset)
		        pos = SelectionStart
		        
		      End If
		      
		      ViewToCharPos(lineNum, SelectionStart + SelectionLength)
		      
		    ElseIf toPreviousWord Then
		      Var previous As Integer = PreviousNonAlpha(SelectionStart + SelectionLength)
		      ChangeSelection(previous, CaretPos - previous)
		      pos = previous
		      ViewToCharPos(pos)
		      
		    Else
		      // Move just by one place.
		      ChangeSelection(SelectionStart, SelectionLength - charsToMove)
		      pos = SelectionStart + SelectionLength
		      ViewToCharPos(pos)
		    End If
		    
		  Else
		    // The selection end is at the caret position so expand the selection.
		    If toStartOfLine Then
		      lineNum = Lines.GetLineNumberForOffset(Max(SelectionStart, 0))
		      
		      If SelectionStart > Lines.GetLine(lineNum).Offset Then
		        ChangeSelection(Lines.GetLine(lineNum).Offset, CaretPos - Lines.GetLine(lineNum).Offset)
		        pos = SelectionStart
		      End If
		      
		      ViewToCharPos(lineNum, SelectionStart)
		      
		    ElseIf toPreviousWord Then
		      Var previous As Integer = PreviousNonAlpha(SelectionStart)
		      
		      ChangeSelection(previous, CaretPos - previous)
		      pos = SelectionStart
		      ViewToCharPos(pos)
		      
		    Else
		      // Move one place.
		      ChangeSelection(SelectionStart - charsToMove, SelectionLength + charsToMove)
		      pos = SelectionStart
		      ViewToCharPos(pos)
		    End If
		  End If
		  
		  UpdateDesiredColumn(CaretPos)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21, Description = 4D6F7665732074686520636172657420757020616E64206D6F646966696573207468652073656C656374696F6E2E
		Private Sub MoveUpAndModifySelection(pageUp As Boolean, moveToStart As Boolean)
		  /// Moves the caret up and modifies the selection.
		  
		  Var lineNum As Integer
		  
		  // Get the starting line number.
		  If SelectionStart < CaretPos Then
		    lineNum = Lines.GetLineNumberForOffset(SelectionStart)
		  Else
		    lineNum = Lines.GetLineNumberForOffset(SelectionStart + SelectionLength)
		  End If
		  
		  // Default moving one place.
		  Var linesToMove As Integer = 1
		  
		  If moveToStart Then
		    // Move to the start of the document.
		    linesToMove = ScrollPosition + MaxVisibleLines
		  ElseIf pageUp Then
		    // Move up a full page.
		    linesToMove = MaxVisibleLines - 1
		  End If
		  
		  Var line As SyntaxArea.TextLine
		  Var offset As Integer
		  
		  lineNum = lineNum - linesToMove
		  If lineNum < 0 Then
		    // Moving up on the first line - jump to the begining of the line.
		    lineNum = 0
		    line = lines.getLine(lineNum)
		    offset = 0
		  Else
		    line = Lines.GetLine(LineNum)
		    offset = OffsetForXPos(line, CaretDesiredColumn)
		  End If
		  
		  ChangeSelection(Min(CaretPos, offset), Abs(offset - CaretPos))
		  
		  // Scroll.
		  If lineNum < ScrollPosition Then
		    ChangeScrollValues(ScrollPositionX, lineNum)
		  End If
		  
		  IgnoreRepaint = False
		  Redraw
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21, Description = 46696E647320746865206E65787420616C7068616E756D65726963206368617261637465722C207374617274696E67206174206066726F6D4F6666736574602E
		Private Function NextAlpha(fromOffset As Integer) As Integer
		  /// Finds the next alphanumeric character, starting at `fromOffset`.
		  
		  For i As Integer = fromOffset + 1 To TextStorage.Length - 1
		    Var char As String = TextStorage.GetCharAt(i)
		    If IsAlpha(char) Then Return i
		  Next i
		  
		  Return TextStorage.Length
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21, Description = 46696E647320746865206E65787420626C6F636B206368617261637465722C20666F722074686520676976656E2060666F724368617260206368617261637465722E
		Private Function NextBlockCharacter(forChar As string, offset As Integer, ByRef charToFind As String) As Integer
		  /// Finds the next block character, for the given `forChar` character.
		  
		  #If Not DebugBuild
		    #Pragma DisableBackgroundTasks
		    #Pragma DisableBoundsChecking
		  #EndIf
		  
		  // Find the character that closes `forChar`.
		  charToFind = ""
		  For i As Integer = 0 To BLOCK_OPEN_CHARS.Length -1
		    If forChar = BLOCK_OPEN_CHARS.Middle(i, 1) Then
		      charToFind = BLOCK_CLOSE_CHARS.Middle(i, 1)
		      Exit For
		    End If
		  Next i
		  If charToFind = "" Then Return -1
		  
		  // Handle nested blocks.
		  Var depth As Integer
		  Var char As String
		  
		  Var textToSearch As String = TextStorage.GetText(offset + 1, TextStorage.Length - (offset + 1))
		  textToSearch = textToSearch.ConvertEncoding(SyntaxArea.InternalEncoding)
		  
		  Var scanner As New RegEx
		  scanner.SearchPattern = "\" + forChar + "|\" + charToFind
		  
		  Var match As RegExMatch = scanner.Search(textToSearch)
		  While match <> Nil
		    char = match.SubExpressionString(0)
		    
		    // If it's the character we're looking for, and not nested, then we've found it.
		    If char = charToFind And depth = 0 Then
		      Return textToSearch.LeftBytes(match.SubExpressionStartB(0)).Length + offset + 1
		      
		      // Else, if it's the same character as the input, then we're nesting.
		    ElseIf char = forChar Then
		      depth = depth + 1
		      
		      // If nested, and we found a closing character, decrease nesting count.
		    ElseIf char = charToFind Then
		      depth = depth - 1
		    End If
		    
		    match = scanner.Search
		  Wend
		  
		  Return -1
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21, Description = 46696E647320746865206E65787420636861726163746572206E6F7420696E2074686520676976656E207365742C207374617274696E6720617420706F73206066726F6D4F6666736574602E
		Private Function NextCharacterInSet(fromOffset As Integer, pattern As String = "[^\w\.]") As Integer
		  /// Finds the next character not in the given set, starting at pos `fromOffset`.
		  
		  For i As Integer = fromOffset + 1 To TextStorage.Length - 1
		    Var char As String = TextStorage.GetCharAt(i)
		    If matchesRegex(pattern, char) Then Return i
		  Next i
		  
		  Return TextStorage.Length
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21, Description = 46696E647320746865206E657874206E6F6E2D616C7068616E756D65726963206368617261637465722C207374617274696E67206174206066726F6D4F6666736574602E
		Private Function NextNonAlpha(fromOffset As Integer) As Integer
		  /// Finds the next non-alphanumeric character, starting at `fromOffset`.
		  
		  For i As Integer = fromOffset + 1 To TextStorage.Length - 1
		    Var char As String = TextStorage.GetCharAt(i)
		    If Not IsAlpha(char) Then Return i
		  Next i
		  
		  Return TextStorage.Length
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21, Description = 46696E647320746865206E657874206E6F6E2D77686974657370616365206368617261637465722C207374617274696E67206174206066726F6D4F6666736574602E
		Private Function NextNonWhitespace(fromOffset As Integer, maxOffset As Integer = -1) As Integer
		  /// Finds the next non-whitespace character, starting at `fromOffset`.
		  
		  If maxOffset < 0 Then maxOffset = TextStorage.Length
		  
		  For i As Integer = fromOffset + 1 To maxOffset - 1
		    Var char As String = TextStorage.GetCharAt(i)
		    If Not IsWhitespace(char) Then Return i
		  Next
		  
		  Return maxOffset
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21, Description = 46696E647320746865206F66667365742028636F6C756D6E2920666F72206120676976656E206C696E6520616E6420646573697265642073637265656E20706F736974696F6E202878706F73292E
		Private Function OffsetForXPos(line As SyntaxArea.TextLine, xPos As Integer) As Integer
		  /// Finds the offset (column) for a given line and desired screen position (xpos).
		  
		  #If Not DebugBuild
		    #Pragma DisableBackgroundTasks
		    #Pragma DisableBoundsChecking
		  #EndIf
		  
		  xPos = xPos - line.VisualIndent(Self.IndentVisually)
		  
		  Var offset As Integer = line.length
		  Var lineWidth As Integer
		  xPos = max(0, xPos) // Negative numbers would be in the margin.
		  
		  Var startPos As Integer
		  Var searchWord As SyntaxArea.TextSegment = line.LocalSegmentForXPos(xPos)
		  If searchWord <> Nil Then startPos = searchWord.Offset
		  Var tmp As Picture = TemporaryPicture
		  
		  If searchWord IsA SyntaxArea.TextPlaceholder Then
		    // Width up to placeholder.
		    lineWidth = line.TextWidth(TextStorage, tmp.Graphics, DisplayInvisibleCharacters, startPos)
		    Var placeholderWidth As Double = searchWord.Width
		    
		    If Dragging Then
		      If xPos >= lineWidth + placeholderWidth / 2 Then
		        offset = searchWord.Offset + searchWord.Length
		      Else
		        offset = searchWord.Offset
		      End If
		    Else
		      // Put the offset in the middle of the thing.
		      offset = searchWord.Offset + searchWord.Length / 2
		    End If
		    
		  Else
		    For i As Integer = startPos To line.Length
		      // Scan the chars in the line until we find the right column.
		      lineWidth = line.TextWidth(TextStorage, tmp.Graphics, DisplayInvisibleCharacters, i)
		      
		      If lineWidth >= xPos Then
		        Var matchChar As String = _
		        line.CharToDisplayAt(TextStorage, Max(i - 1, 0), DisplayInvisibleCharacters)
		        If searchWord <> Nil Then
		          tmp.Graphics.Bold = searchWord.Bold
		          tmp.Graphics.Italic = searchWord.Italic
		          tmp.Graphics.Underline = searchWord.Underline
		        End If
		        Var charw As Integer = tmp.Graphics.TextWidth(matchChar)
		        
		        If lineWidth - charw / 2 > xPos Then
		          offset = Max(i - 1, 0)
		        Else
		          offset = i
		        End If
		        Exit For
		      End If
		    Next i
		  End If
		  
		  // Avoid delimiters.
		  offset = line.Offset + Min(offset, line.Length - line.DelimiterLength)
		  
		  Return offset
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function OpeningBlockLineForLine(lineIndex As Integer) As Integer
		  Var temp_value As Integer
		  temp_value = Lines.PreviousBlockStartLine(lineIndex, True)
		  
		  If temp_value <= 0 Then
		    If Lines.GetLine(lineIndex).IsBlockStart Then temp_value = lineIndex
		  End If
		  
		  Return temp_value
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 5363726F6C6C732074686520646F63756D656E7420646F776E206120706167652E20446F6573206E6F74206D6F7665207468652063617265742E
		Sub PageDown()
		  /// Scrolls the document down a page. Does not move the caret.
		  
		  ScrollPosition = Min(Lines.Count, ScrollPosition + MaxVisibleLines)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 5363726F6C6C732074686520646F63756D656E74207570206120706167652E20446F6573206E6F74206D6F7665207468652063617265742E
		Sub PageUp()
		  /// Scrolls the document up a page. Does not move the caret.
		  
		  ScrollPosition = Max(ScrollPosition - MaxVisibleLines, 0)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub PaintCaret(atPos As Integer, g As Graphics, gutterWidth As Integer)
		  #If Not DebugBuild
		    #Pragma DisableBackgroundTasks
		    #Pragma DisableBoundsChecking
		  #EndIf
		  
		  If Not mHasFocus And DragSource = Nil Then Return
		  If SelectionLength > 0 And DragTextSelection = Nil Then Return
		  
		  CaretVisible = Not CaretVisible
		  If CaretVisible Then Return
		  
		  Var xpos, ypos As Double
		  
		  If atPos = CaretPos Then
		    XYAtCharPos(atPos, CaretLine, xpos, ypos)
		  Else
		    XYAtCharPos(atPos, xpos, ypos)
		  End If
		  
		  If xpos < gutterWidth Or ypos < 0 Then Return
		  
		  g.DrawingColor = CaretColor
		  
		  If ThickInsertionPoint Then
		    g.PenSize = 2
		  End If
		  
		  g.DrawLine(xpos - 1, ypos - 1, xpos - 1, ypos - TextHeight + 1)
		  g.PenSize = 1
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21, Description = 5061696E7473206120626C756520636972636C65206F7665722074686520686967686C69676874656420626C6F636B206368617261637465722069662060486967686C696768744D61746368696E67427261636B6574736020697320547275652E
		Private Sub PaintHighlightedBlock(g As Graphics)
		  /// Paints a blue circle over the highlighted block character 
		  /// if `HighlightMatchingBrackets` is True.
		  
		  If Not HighlightMatchingBrackets Then Return
		  
		  g.PenSize = 2
		  g.DrawingColor = SyntaxArea.AdjustColorForDarkMode(&c4444FF)
		  g.DrawOval(blockBeginPosX - 2 - g.TextWidth("(") / 2, blockBeginPosY - g.TextHeight - 1, g.TextHeight + 4, g.TextHeight + 4)
		  g.PenSize = 1
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Paste()
		  Var c As New Clipboard
		  If Not c.TextAvailable Then Return
		  
		  Var t As String = c.Text
		  
		  If IndentVisually Then
		    // trim lines
		    t = LeftTrimLines(t)
		  End If
		  
		  t = t.ReplaceAll(Chr(0), Chr(1))
		  
		  Me.SelText = t
		  
		  InvalidateAllLines
		  
		  Redraw
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21, Description = 46696E6473207468652070726576696F757320616C7068616E756D6572696320636861726163746572207374617274696E67206174206066726F6D4F6666736574602E
		Private Function PreviousAlpha(fromOffset As Integer) As Integer
		  /// Finds the previous alphanumeric character starting at `fromOffset`.
		  
		  For i As Integer = fromOffset - 1 DownTo 1
		    Var char As String = TextStorage.GetCharAt(i - 1)
		    If IsAlpha(char) Then Return i
		  Next i
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function PreviousBlockCharacter(forChar As String, offset As Integer, ByRef charToFind As String) As Integer
		  /// Finds the previous block character.
		  
		  #If Not DebugBuild
		    #Pragma DisableBackgroundTasks
		    #Pragma DisableBoundsChecking
		  #EndIf
		  
		  charToFind = ""
		  
		  // Select the appropriate one.
		  For i As Integer = 0 To BLOCK_CLOSE_CHARS.Length - 1 
		    If forChar = BLOCK_CLOSE_CHARS.Middle(i, 1) Then
		      charToFind = BLOCK_OPEN_CHARS.Middle(i, 1)
		      Exit For
		    End If
		  Next i
		  If charToFind = "" Then Return - 1
		  
		  Var depth As Integer
		  Var char As String
		  
		  Var textToSearch As String = TextStorage.GetText(0, offset)
		  textToSearch = textToSearch.ConvertEncoding(SyntaxArea.InternalEncoding)
		  
		  textToSearch = textToSearch.Reverse
		  
		  Var scanner As New RegEx
		  scanner.SearchPattern = "\" + forChar + "|\" + charToFind
		  
		  Var match As RegExMatch = scanner.Search(textToSearch)
		  
		  // Scan the text.
		  While match <> Nil
		    char = match.SubExpressionString(0)
		    
		    // Found.
		    If char = charToFind And depth = 0 Then
		      Return offset - 1 - textToSearch.LeftBytes(match.SubExpressionStartB(0)).Length
		      
		      // Nest.
		    ElseIf char = forChar Then
		      depth = depth + 1
		      
		      // Un-nest.
		    ElseIf char = charToFind Then
		      depth = depth - 1
		    End If
		    
		    match = scanner.Search
		  Wend
		  
		  Return -1
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21, Description = 46696E64732074686520636861726163746572206E6F7420696E2074686520676976656E207365742E
		Private Function PreviousCharacterInSet(fromOffset As Integer, pattern As String = "[^\w\.]") As Integer
		  /// Finds the character not in the given set.
		  
		  For i As Integer = fromOffset - 1 DownTo 1
		    Var char As String = TextStorage.GetCharAt(i - 1)
		    If matchesRegex(pattern, char) Then Return i
		  Next i
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21, Description = 46696E6473207468652070726576696F7573206C696E652064656C696D6974657220636861726163746572207374617274696E67206174206066726F6D4F6666736574602E
		Private Function PreviousLineDelimiter(fromOffset As Integer) As Integer
		  /// Finds the previous line delimiter character starting at `fromOffset`.
		  
		  For i As Integer = fromOffset - 1 DownTo 1
		    Var char As String = TextStorage.GetCharAt(i-1)
		    If char = LineDelimiter Then Return i
		  Next i
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21, Description = 46696E6473207468652070726576696F7573206E6F6E2D616C7068616E756D6572696320636861726163746572207374617274696E67206174206066726F6D4F6666736574602E
		Private Function PreviousNonAlpha(fromOffset As Integer) As Integer
		  /// Finds the previous non-alphanumeric character starting at `fromOffset`.
		  
		  For i As Integer = fromOffset - 1 DownTo 1
		    Var char As String = TextStorage.GetCharAt(i - 1)
		    If Not IsAlpha(char) Then Return i
		  Next i
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21, Description = 46696E6473207468652070726576696F7573206E6F6E2D7768697465737061636520636861726163746572207374617274696E67206174206066726F6D4F6666736574602E
		Private Function PreviousNonWhitespace(fromOffset As Integer) As Integer
		  /// Finds the previous non-whitespace character starting at `fromOffset`.
		  
		  For i As Integer = fromOffset - 1 DownTo 1
		    Var char As String = TextStorage.GetCharAt(i - 1)
		    If Not IsWhitespace(char) Then Return i
		  Next i
		  
		End Function
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

	#tag Method, Flags = &h0, Description = 54686973206D6574686F64206973207573656420696E7465726E616C6C792062792074686520636F6E74726F6C2C20616E642065787465726E616C6C792062792074686520756E646F206D656368616E69736D2E20596F752073686F756C646E277420757365206974206469726563746C792E20496E737465616420757365206053656C53746172746020616E64206053656C54657874602E
		Sub PrivateRemove(offset As Integer, length As Integer, updateCaret As Boolean = True)
		  /// This method is used internally by the control, and externally by the undo mechanism.
		  /// You shouldn't use it directly. Instead use `SelStart` and `SelText`.
		  
		  // Prevent the LineHighlighter from interfering while we're modifying the lines.
		  Var lock As New SyntaxArea.LinesLock(Self)
		  #Pragma Unused lock
		  
		  If ReadOnly Then
		    Break
		    System.Beep
		    Return
		  End If
		  
		  // Nothing to delete?e
		  If length = 0 Then Return
		  
		  Var undoText As String = TextStorage.GetText(Max(offset, 0), length)
		  Var undoAttrs() As SyntaxArea.TextLineAttributes = _
		  Lines.GetAttributesOfLinesInRange(Max(offset, 0), length)
		  
		  If TextStorage.Remove(offset, length) Then
		    RaiseEvent TextRemoved(offset, undoText)
		    UndoMgr.Push(New SyntaxArea.UndoableDelete(Self, offset, length, undoText, undoAttrs, CaretPos, CurrentEventID))
		    Lines.Remove(offset, length)
		    If updateCaret Then ChangeSelection(SelectionStart - length, 0)
		    Highlight
		    HandleTextChanged
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 54686973206D6574686F64206973207573656420696E7465726E616C6C792062792074686520636F6E74726F6C2C20616E642065787465726E616C6C792062792074686520756E646F206D656368616E69736D2C20796F752073686F756C646E277420757365206974206469726563746C792C2075736520696E73746561642053656C656374696F6E537461727420616E642053656C546578742E
		Sub PrivateReplace(offset As Integer, length As Integer, s As String, alwaysMarkChanged As Boolean = True, eventID As Integer = -1, keepSelection As Boolean = False, beSilent As Boolean = False)
		  /// This method is used internally by the control, and externally by the undo mechanism, 
		  /// you shouldn't use it directly, use instead SelectionStart and SelText.
		  
		  // If keepSelection = False, it means that the selection+caret is reset to the end of 
		  // the replaced text
		  // If keepSelection = True, then the previous selection+caret remains intact, but 
		  // selection pointers get shifted accordingly.
		  
		  If ReadOnly Then
		    System.Beep
		    Return
		  End If
		  
		  // Prevent the LineHighlighter from interfering while we're modifying the lines.
		  Var lock As New SyntaxArea.LinesLock(Self)
		  
		  // Use the default line ending from the line manager if the text is just 
		  // the Return or Enter character.
		  s = s.ReplaceLineEndings(Lines.LineEnding)
		  s = s.ReplaceAll(chr(3), Lines.LineEnding)
		  
		  Var removedText As String = TextStorage.GetText(offset, length)
		  Var removedAttrs() As SyntaxArea.TextLineAttributes = _
		  Lines.GetAttributesOfLinesInRange(offset, length)
		  
		  If eventID < 0 Then eventID = CurrentEventID
		  UndoMgr.Push(New SyntaxArea.UndoableReplace(Self, offset, length, removedText, s, _
		  removedAttrs, CaretPos, eventID))
		  
		  // Modify the buffer and rescan the lines.
		  TextStorage.Replace(offset, length, s)
		  Lines.Replace(offset, length, s, alwaysMarkChanged)
		  
		  If keepSelection Then
		    // We need to adjust the caret and selection if they're inside or past the changed text.
		    // Note: This code has only been tested to work with replacements in a single line
		    // It might not work with multi-line replacements!
		    Var lengthDiff As Integer = s.Length - removedText.Length
		    If lengthDiff <> 0 Then
		      Var minLength As Integer = Min(s.Length, removedText.Length)
		      Var selStart As Integer = mSelectionStart
		      Var selEnd As Integer = selStart + mSelectionLength
		      If selEnd >= offset + minLength Then
		        selEnd = Max(offset, selEnd + lengthDiff)
		      End
		      If selStart >= offset + minLength Then
		        selStart = Max(offset, selStart + lengthDiff)
		      End
		      ChangeSelection(selStart, Max(0, selEnd - selStart))
		    End If
		    
		  Else
		    // Set the caret past the replaced text.
		    ChangeSelection(offset + s.Length, 0)
		  End
		  
		  lock = Nil
		  
		  Highlight
		  
		  If Not UndoMgr.IsUndoing Then
		    // Fire the text changed events.
		    HandleTextChanged
		    If removedText <> "" Then RaiseEvent TextRemoved(offset, removedText)
		    RaiseEvent TextInserted(offset, s)
		    
		    If beSilent Then
		      // In this case we don't want the highlighting of closing elements.
		      Return
		    End If
		    
		    // Is the text a closing element? ] } ) ?
		    If s.Length > 1 Or Not IsBlockChar(s) Or Not HighlightMatchingBrackets Then Return
		    
		    // If so, highlight it.
		    If BLOCK_CLOSE_CHARS.IndexOf(s) > -1 Then
		      HighlightOpeningBlock(s, offset)
		    Else
		      HighlightClosingBlock(s, offset)
		    End If
		  End If
		  
		End Sub
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

	#tag Method, Flags = &h21, Description = 526564726177732074686520656E746972652063616E7661732E
		Private Sub Redraw(forced As Boolean = False)
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

	#tag Method, Flags = &h21
		Private Sub RedrawNow(caller As Timer)
		  #Pragma Unused caller
		  
		  Self.Refresh
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub RedrawThreadSafe()
		  If Thread.Current = Nil Then
		    Self.Refresh
		  Else
		    // We can't issue a repaint from this thread in Xojo, so we need to use a timer for it.
		    If mRedrawTimer = Nil Then
		      mRedrawTimer = New Timer
		      AddHandler mRedrawTimer.Action, AddressOf RedrawNow
		      mRedrawTimer.Period = 0
		    End If
		    mRedrawTimer.RunMode = Timer.RunModes.Single
		  End If
		  
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

	#tag Method, Flags = &h0, Description = 5363726F6C6C7320746F2074686520656E64206F662074686520646F63756D656E742E20446F6573206E6F74206D6F7665207468652063617265742E
		Sub ScrollToEnd()
		  /// Scrolls to the end of the document. Does not move the caret.
		  
		  ScrollPosition = Lines.Count
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 5363726F6C6C7320746F2074686520626567696E6E696E67206F662074686520646F63756D656E742E20446F6573206E6F74206D6F7665207468652063617265742E
		Sub ScrollToHome()
		  /// Scrolls to the beginning of the document. Does not move the caret.
		  
		  ScrollPosition = 0
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SelectAll()
		  ChangeSelection(0, TextStorage.Length)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21, Description = 52657475726E732061205069637475726520726570726573656E746174696F6E206F66207468652073656C65637465642074657874206265696E6720647261676765642E
		Private Function SelectedTextDragImage() As Picture
		  /// Returns a Picture representation of the selected text being dragged.
		  
		  Var s As String = SelText
		  Var selection As String = s.Left(200) + " "
		  If s.Length > 200 Then selection = selection + "..."
		  
		  Var w, h As Integer
		  Var tmp As Picture = TemporaryPicture
		  w = Min(tmp.Graphics.TextWidth(selection + " "), Width)
		  h = tmp.Graphics.TextHeight(selection, w)
		  
		  Var image As Picture = New Picture(w, h, 32)
		  image.Graphics.FontSize = FontSize
		  image.Graphics.FontName = TextFont
		  Image.Graphics.DrawText(selection, 0, Image.Graphics.TextHeight - (Image.Graphics.TextHeight - Image.Graphics.FontAscent), w)
		  
		  Return image
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 53656C656374732074686520676976656E206C696E652E
		Sub SelectLine(lineNumber As Integer, refresh As Boolean = True)
		  /// Selects the given line.
		  
		  If lineNumber < 0 Or lineNumber >= Lines.Count Then
		    Break
		    System.Beep
		    Return
		  End If
		  
		  Var line As SyntaxArea.TextLine = Lines.GetLine(lineNumber)
		  If Not line.Visible Then Lines.RevealLine(lineNumber)
		  ChangeSelection(line.Offset, line.Length - line.DelimiterLength)
		  
		  If refresh Then Redraw
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 5365747320746865207363726F6C6C6261727320746F207573652077697468207468697320656469746F722E20486173206E6F20656666656374206F6E206D61634F53206173206E6174697665207363726F6C6C626172732061726520757365642E
		Sub SetScrollbars(horizontal As DesktopScrollbar, vertical As DesktopScrollbar)
		  /// Sets the scrollbars to use with this editor.
		  /// Has no effect on macOS as native scrollbars are used.
		  
		  #If TargetMacOS
		    Return
		  #EndIf
		  
		  mHorizontalScrollBar = horizontal
		  mVerticalScrollbar = vertical
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub StopHighlighter()
		  If mHighlighter <> Nil Then
		    If mHighlighter.ThreadState <> Thread.ThreadStates.NotRunning Then
		      mHighlighter.Stop
		    End If
		    Lines.LinesLock = Nil
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21, Description = 52657475726E20612074656D706F72617279207069637475726520746861742063616E206265207573656420666F722067726170686963732063616C63756C6174696F6E732C206574632E
		Private Function TemporaryPicture() As Picture
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

	#tag Method, Flags = &h0
		Sub ToggleLineFold(lineIndex As Integer)
		  If Not EnableLineFoldings Then Return
		  
		  Var topLine As Integer = Lines.ToggleLineFolding(lineIndex)
		  If topLine > -1 Then
		    // Check if the caret is in an invisible line.
		    Var line As SyntaxArea.TextLine = Lines.GetLine(Lines.GetLineNumberForOffset(CaretPos))
		    // If it's invisible, move the caret to the folded line.
		    If Not line.Visible Then
		      line = Lines.GetLine(topLine)
		      If line <> Nil Then ChangeSelection(line.Offset, 0)
		    End If
		    InvalidateAllLines
		  Else
		    InvalidateLine(lineIndex)
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21, Description = 5361766573207468652073637265656E20706F736974696F6E206F662074686520676976656E206F66667365742E
		Private Sub UpdateDesiredColumn(pos As Integer = -1)
		  /// Saves the screen position of the given offset.
		  
		  If Lines.Count = 0 Then Return
		  
		  If pos < 0 Then pos = Self.CaretPos
		  mDesiredColumnCharPos = pos
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub UpdateIndentation()
		  If mKeepEntireTextIndented Then
		    // Prevents the LineHighlighter from interfering while we're modifying the lines.
		    Var lock As New SyntaxArea.LinesLock(Self)
		    #Pragma Unused lock
		    
		    Var trimLines As Boolean = Not mIndentVisually
		    Var indentationState As Variant
		    
		    Var lineIdx As Integer = Lines.FirstLineForIndentation
		    
		    While lineIdx < Self.LineCount
		      Var modified As Boolean = PrivateIndentline(lineIdx, trimLines, indentationState)
		      If Not modified Then
		        If lineIdx > Lines.LastLineForIndentation Then
		          // We're done.
		          Exit
		        End If
		      End If
		      If trimLines Then
		        InvalidateLine(lineIdx)
		      End If
		      lineIdx = lineIdx + 1
		    Wend
		    
		    Lines.IndentationFinished
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub ViewToCharPos(charPos As Integer)
		  ViewToCharPos(Lines.GetLineNumberForOffset(CharPos), CharPos)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub ViewToCharPos(charLine As Integer, charPos As Integer)
		  // Move the view to the given character position..
		  
		  Var horizontal, vertical As Integer
		  Var scrollPos As Integer = Self.ScrollPosition
		  If EnableLineFoldings Then scrollPosition = Lines.getNumberOfLinesNeededToView(scrollPos)
		  
		  horizontal = ScrollPositionX
		  vertical = Self.ScrollPosition
		  
		  // Vertical check.
		  If charLine < vertical Then
		    vertical = charLine
		  Else
		    Var visibleLines As Integer = Self.VisibleAndHiddenLines - 1
		    If visibleLines > 0 And(charLine - visibleLines > vertical) Then
		      vertical = charLine - visibleLines
		    End If
		  End If
		  
		  // Horizontal check.
		  Var x, y As Double
		  XYAtCharPos(charPos, charLine, x, y)
		  
		  If x < LineNumberOffset Or x >= Self.Width Then
		    horizontal = ScrollPositionX + x - (Me.Width - RightScrollMargin)
		  End If
		  
		  ChangeScrollValues(horizontal, vertical)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21, Description = 52657475726E7320746865206E756D626572206F662076697369626C65206C696E657320616E642068696464656E206C696E65732E
		Private Function VisibleAndHiddenLines() As Integer
		  /// Returns the number of visible lines and hidden lines.
		  
		  If EnableLineFoldings Then
		    Return Lines.InvisibleLines + MaxVisibleLines
		  Else
		    Return MaxVisibleLines
		  End If
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21, Description = 52657475726E73207468652073637265656E20706F736974696F6E20666F722074686520676976656E206063686172506F73602E
		Private Function XPosForOffset(line As SyntaxArea.TextLine, charPos As Integer) As Single
		  /// Returns the screen position for the given `charPos`.
		  
		  #If Not DebugBuild
		    #Pragma DisableBackgroundTasks
		    #Pragma DisableBoundsChecking
		  #EndIf
		  
		  Var tmp As Picture = TemporaryPicture
		  
		  Var indent As Integer = line.VisualIndent(Self.IndentVisually)
		  
		  Return line.TextWidth(TextStorage, tmp.Graphics, DisplayInvisibleCharacters, _
		  charPos - line.offset) + indent
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub XYAtCharPos(charPos As Integer, ByRef X As Double, ByRef Y As Double)
		  Var lineNumber As Integer
		  lineNumber = lines.GetLineNumberForOffset(charPos)
		  XYAtCharPos(CharPos, LineNumber, x, y)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub XYAtCharPos(charPos As Integer, lineNumber As Integer, ByRef X As Double, ByRef Y As Double)
		  // Finds the screenX and screenY for the given `charPos`.
		  
		  // Y.
		  Var ypos As Integer
		  If EnableLineFoldings Then
		    ypos = (Lines.GetNumberOfVisibleLinesUpToLine(lineNumber) - ScrollPosition) * TextHeight
		  Else
		    ypos = (lineNumber - ScrollPosition) * TextHeight
		  End If
		  
		  // Find the character offset.
		  Var line As SyntaxArea.TextLine = Lines.GetLine(lineNumber)
		  If line = Nil Then Return
		  
		  Var sx As Integer = leftMarginOffset + LineNumberOffset - ScrollPositionX
		  
		  Var xpos As Integer = sx + XPosForOffset(line, charPos)
		  
		  x = xpos
		  y = ypos + TextHeight
		  
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event AutocompleteOptionsForPrefix(prefix As String) As SyntaxArea.AutocompleteOptions
	#tag EndHook

	#tag Hook, Flags = &h0
		Event BlockCharsMatched(blockOpenChar As String, blockOpenOffset As Integer, blockCloseChar As String, blockCloseOffset As Integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ConstructContextualMenu(base As DesktopMenuItem, x As Integer, y As Integer) As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event FocusLost()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event FocusReceived()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event GutterClicked(onLine As Integer, x As Integer, y As Integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event HighlightingComplete()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event HorizontalScrollValueChanged()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event LineCountChanged(newLineCount As Integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event MaxLineLengthChanged(maxLineLengthInPixels As Single)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event MouseDown(x As Integer, y As Integer) As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event MouseExit()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event MouseMove(x As Integer, y As Integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event MouseUp(x As Integer, y As Integer)
	#tag EndHook

	#tag Hook, Flags = &h0, Description = 54686520656469746F72206973206F70656E696E672E
		Event Opening()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event PaintAboveLine(lineIndex As Integer, g As Graphics, x As Integer, y As Integer, w As Integer, h As Integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event PaintBelowLine(lineIndex As Integer, g As Graphics, x As Integer, y As Integer, w As Integer, h As Integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event PaintOver(g As Graphics, gutterWidth As Integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event PlaceholderSelected(placeholderLabel As String, lineIndex As Integer, line As SyntaxArea.TextLine, placeholder As SyntaxArea.TextPlaceholder, doubleClick As Boolean)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ScrollValuesChanged()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event SelectionChanged(line As Integer, column As Integer, length As Integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event TextChanged()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event TextInserted(offset As Integer, s As String)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event TextRemoved(offset As Integer, s As String)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event UseBackgroundColorForLine(lineIndex As Integer, ByRef lineBackgroundColor As Color) As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event UseBookmarkIconForLine(lineIndex As Integer) As Picture
	#tag EndHook

	#tag Hook, Flags = &h0
		Event VerticalScrollValueChanged()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event WordUnderMouse(word As String)
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
			  Return mBackColor
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mBackColor = value
			  InvalidateAllLines
			  Redraw
			  
			End Set
		#tag EndSetter
		BackColor As ColorGroup
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
			    gBlockStartImage = SyntaxArea.LoadMaskedPicture(blockStartMarker)
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

	#tag ComputedProperty, Flags = &h0, Description = 54686520636F6C6F72206F662074686520656469746F72277320626F72646572202869662074686520626F7264657220697320656E61626C6564292E
		#tag Getter
			Get
			  Return mBorderColor
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mBorderColor = value
			  Redraw
			  
			End Set
		#tag EndSetter
		BorderColor As ColorGroup
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0, Description = 54686520636F6C6F7220746F20757365207768656E20686967686C69676874696E6720627261636B6574732E
		#tag Getter
			Get
			  Return mBracketHighlightColor
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mBracketHighlightColor = value
			  
			End Set
		#tag EndSetter
		BracketHighlightColor As ColorGroup
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0, Description = 54686520636F6C6F757220746F2075736520666F72207468652063617265742E
		#tag Getter
			Get
			  Return mCaretColor
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mCaretColor = value
			  Redraw
			  
			End Set
		#tag EndSetter
		CaretColor As ColorGroup
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

	#tag ComputedProperty, Flags = &h0, Description = 54686520636F6C6F757220746F2075736520746F20686967686C696768742022646972747922206C696E65732E
		#tag Getter
			Get
			  Return mDirtyLinesColor
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mDirtyLinesColor = value
			  InvalidateAllLines
			  Redraw
			  
			End Set
		#tag EndSetter
		DirtyLinesColor As ColorGroup
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

	#tag ComputedProperty, Flags = &h0, Description = 54686520636F6C6F757220746F2075736520666F7220746865206775747465722773206261636B67726F756E642E
		#tag Getter
			Get
			  Return mGutterBackgroundColor
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mGutterBackgroundColor = value
			  InvalidateAllLines
			  Redraw
			  
			End Set
		#tag EndSetter
		GutterBackgroundColor As ColorGroup
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0, Description = 54686520636F6C6F7572206F66207468652072696768742068616E6420626F72646572206F6620746865206775747465722E
		#tag Getter
			Get
			  Return mGutterSeparationLineColor
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mGutterSeparationLineColor = value
			  InvalidateAllLines
			  Redraw
			  
			End Set
		#tag EndSetter
		GutterSeparationLineColor As ColorGroup
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

	#tag ComputedProperty, Flags = &h0, Description = 54686520636F6C6F757220746F2075736520666F7220746865206C696E65206E756D626572732E
		#tag Getter
			Get
			  Return mLineNumbersColor
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mLineNumbersColor = value
			  InvalidateAllLines
			  Redraw
			  
			End Set
		#tag EndSetter
		LineNumbersColor As ColorGroup
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
		Private mBackColor As ColorGroup
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mBookmarkTable As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mBorderColor As ColorGroup
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mBracketHighlightColor As ColorGroup
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mCaretBlinker As SyntaxArea.CaretBlinker
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mCaretColor As ColorGroup
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mCaretLine As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mCaretPos As Integer
	#tag EndProperty

	#tag Property, Flags = &h21, Description = 54686520746F74616C20686569676874206F662074686520646F63756D656E747320636F6E74656E742C206C61737420636F6D707574656420696E2044726177436F6E74656E74732E
		Private mContentsHeight As Double
	#tag EndProperty

	#tag Property, Flags = &h21, Description = 546865207769647468206F662074686520646F63756D656E74277320636F6E74656E742C206C61737420636F6D707574656420696E2044726177436F6E74656E74732E
		Private mContentsWidth As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mCurrentAutocompleteOptions As SyntaxArea.AutocompleteOptions
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mDesiredColumnCharPos As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mDirtyLinesColor As ColorGroup
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

	#tag Property, Flags = &h21
		Private mGutterBackgroundColor As ColorGroup
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mGutterSeparationLineColor As ColorGroup
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

	#tag Property, Flags = &h0, Description = 412063616368656420636F7079206F6620746865206C696E65206865696768742C206C61737420636F6D707574656420696E2044726177436F6E74656E74732E
		mLineHeight As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mLineNumberOffset As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mLineNumbersColor As ColorGroup
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
		Private mTextColor As ColorGroup
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mTextFont As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mTextHeight As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mTextSelectionColor As ColorGroup
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

	#tag ComputedProperty, Flags = &h0, Description = 54686520766572746963616C207363726F6C6C20706F736974696F6E2028696E206C696E6573292E
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

	#tag ComputedProperty, Flags = &h0, Description = 546865206E756D626572206F6620706978656C732074686520656469746F7220686173207363726F6C6C656420686F72697A6F6E74616C6C792E
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
			  PrivateReplace(SelectionStart, SelectionLength, value, True)
			  
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
			  
			  RaiseEvent TextChanged
			  
			  Highlight
			  InvalidateAllLines
			  IgnoreRepaint = False
			  LoadingDocument = False
			  Redraw
			  
			End Set
		#tag EndSetter
		Text As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0, Description = 5468652064656661756C74207465787420636F6C6F75722E
		#tag Getter
			Get
			  Return mTextColor
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mTextColor = value
			  InvalidateAllLines
			  Redraw
			  
			End Set
		#tag EndSetter
		TextColor As ColorGroup
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

	#tag ComputedProperty, Flags = &h0, Description = 54686520636F6C6F7572206F662073656C656374656420746578742E
		#tag Getter
			Get
			  If UseSystemTextSelectionColor Then
			    Return Color.HighlightColor
			  Else
			    Return mTextSelectionColor
			  End If
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mTextSelectionColor = value
			  
			End Set
		#tag EndSetter
		TextSelectionColor As ColorGroup
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

	#tag Property, Flags = &h0, Description = 49662054727565207468656E2074686520656469746F722077696C6C20757365207468652073797374656D2773207374616E6461726420746578742073656C656374696F6E20636F6C6F7572207768656E2073656C656374696E6720746578742E2049662046616C73652069742077696C6C2075736520605465787453656C656374696F6E436F6C6F72602E
		UseSystemTextSelectionColor As Boolean = True
	#tag EndProperty

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


	#tag Constant, Name = BLOCK_CLOSE_CHARS, Type = String, Dynamic = False, Default = \")]}", Scope = Private
	#tag EndConstant

	#tag Constant, Name = BLOCK_OPEN_CHARS, Type = String, Dynamic = False, Default = \"([{", Scope = Private
	#tag EndConstant

	#tag Constant, Name = CURRENT_CARET_WORD_DELIMITER_PATTERN, Type = String, Dynamic = False, Default = \"[^\\w\\.]", Scope = Private
	#tag EndConstant

	#tag Constant, Name = DEFAULT_FONT, Type = String, Dynamic = False, Default = \"", Scope = Public, Description = 5468652064656661756C7420666F6E7420746F207573652E
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"Menlo"
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"Consolas"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"System"
	#tag EndConstant

	#tag Constant, Name = DEFAULT_FONTSIZE, Type = Double, Dynamic = False, Default = \"12", Scope = Public, Description = 5468652064656661756C7420666F6E742073697A652E
	#tag EndConstant

	#tag Constant, Name = RegEXURL, Type = String, Dynamic = False, Default = \"(\?x) # FREE SPACING\n(\?i-U) # Case-insensitive\x2C greedy\n\n# Define the prefix\n(\?(DEFINE)(\?<prefix>[A-Z]{3\x2C}://))\n# Define a valid URL character\n(\?(DEFINE)(\?<valid>[A-Z0-9\\-_~:/\?\\#[\\]@!$&\'()*+;\x3D.\x2C%]))\n\n# START\n\\b # Word boundary\n(\?: # Non-capturing group\n(\?<\x3D\\<)(\?&prefix)(\?&valid)+(\?\x3D\\>) # Anything between angle-brackets\n| # OR\n(\?<\x3D\\[)(\?&prefix)(\?&valid)+(\?\x3D\\]) # Anything between square-brackets\n| # OR\n(\?<\x3D\\{)(\?&prefix)(\?&valid)+(\?\x3D\\}) # Anything between curly-brackets\n| # OR\n(\?&prefix)(\?&valid)+(\?<![\\.\x2C]) # Can\'t end on a dot or comma\n) # End non-capturing group", Scope = Private
	#tag EndConstant

	#tag Constant, Name = UNDO_EVT_BLOCK_SECS, Type = Double, Dynamic = False, Default = \"3", Scope = Private
	#tag EndConstant


	#tag ViewBehavior
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
			Name="InitialParent"
			Visible=false
			Group="Position"
			InitialValue=""
			Type="String"
			EditorType=""
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
			Name="AllowFocusRing"
			Visible=true
			Group="Appearance"
			InitialValue="False"
			Type="Boolean"
			EditorType="Boolean"
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
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AutocompleteAppliesStandardCase"
			Visible=true
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
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="BackColor"
			Visible=true
			Group="Behavior"
			InitialValue="&c000000"
			Type="ColorGroup"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Border"
			Visible=true
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="BorderColor"
			Visible=true
			Group="Behavior"
			InitialValue="&c000000"
			Type="ColorGroup"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="BracketHighlightColor"
			Visible=true
			Group="Behavior"
			InitialValue="&c000000"
			Type="ColorGroup"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="CaretColor"
			Visible=true
			Group="Behavior"
			InitialValue="&c000000"
			Type="ColorGroup"
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
			Visible=true
			Group="Behavior"
			InitialValue="&c000000"
			Type="ColorGroup"
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
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="DisplayInvisibleCharacters"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="DisplayLineNumbers"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="DisplayRightMarginMarker"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="EnableAutocomplete"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="EnableLineFoldings"
			Visible=true
			Group="Behavior"
			InitialValue="True"
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
			Visible=true
			Group="Behavior"
			InitialValue="12"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="GutterBackgroundColor"
			Visible=true
			Group="Behavior"
			InitialValue="&c000000"
			Type="ColorGroup"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="GutterSeparationLineColor"
			Visible=true
			Group="Behavior"
			InitialValue="&c000000"
			Type="ColorGroup"
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
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="KeepEntireTextIndented"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LeftMarginOffset"
			Visible=true
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LineNumbersColor"
			Visible=true
			Group="Behavior"
			InitialValue="&c000000"
			Type="ColorGroup"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LineNumbersFontSize"
			Visible=true
			Group="Behavior"
			InitialValue="12"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LineNumbersTextFont"
			Visible=true
			Group="Behavior"
			InitialValue="System"
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
			Visible=true
			Group="Behavior"
			InitialValue="False"
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
			Visible=true
			Group="Behavior"
			InitialValue="&c000000"
			Type="ColorGroup"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextFont"
			Visible=true
			Group="Behavior"
			InitialValue="System"
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
			Visible=true
			Group="Behavior"
			InitialValue="&c000000"
			Type="ColorGroup"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ThickInsertionPoint"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="mLineHeight"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="UseSystemTextSelectionColor"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
