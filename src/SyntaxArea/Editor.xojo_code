#tag Class
Protected Class Editor
Inherits SyntaxArea.NSScrollViewCanvas
Implements MessageCentre.MessageReceiver
	#tag CompatibilityFlags = (TargetDesktop and (Target32Bit or Target64Bit))
	#tag Hook, Flags = &h0, Description = 54686520656469746F72206973206F70656E696E672E
		Event Opening()
	#tag EndHook


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
			  #Pragma Warning "TODO: Remove this dependency on a bundled image"
			  
			  If gBlockstartimage = Nil Then
			    gBlockstartimage = SyntaxArea.LoadMaskedPicture(blockStartMarker)
			  End If
			  
			  Return gBlockstartimage
			End Get
		#tag EndGetter
		Protected Shared BlockStartImage As Picture
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

	#tag Property, Flags = &h1
		Protected CurrentSuggestionWindow As SyntaxArea.SuggestionWindow
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
		Private Shared gBlockStartImage As Picture
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
		Private mUndoMgr As SyntaxArea.UndoManager
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
			    Var tmpPrinter As New SyntaxArea.PrinterSetup
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
			    mUndoMgr = New SyntaxArea.UndoManager
			  End If
			  
			  Return mUndoMgr
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mUndoMgr = value
			End Set
		#tag EndSetter
		UndoMgr As SyntaxArea.UndoManager
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
	#tag EndViewBehavior
End Class
#tag EndClass
