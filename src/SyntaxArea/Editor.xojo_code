#tag Class
Protected Class Editor
Inherits SyntaxArea.NSScrollViewCanvas
Implements MessageCentre.MessageReceiver
	#tag CompatibilityFlags = ( TargetDesktop and ( Target32Bit or Target64Bit ) )
	#tag Event , Description = 5468652063616E766173206973206F70656E696E672E
		Sub Opening()
		  mBlockBeginPosX = -1
		  
		  IgnoreRepaint = True
		  RaiseEvent Opening
		  
		  If TextFont = "" Then TextFont = DEFAULT_FONT
		  If LineNumbersTextFont = "" Then LineNumbersTextFont = DEFAULT_FONT
		  If FontSize = 0 Then FontSize = DEFAULT_FONTSIZE
		  
		  Me.MouseCursor = System.Cursors.IBeam
		  mCursorIsIBeam = True
		  
		  CalculateMaxVerticalSB
		  CalculateMaxHorizontalSB
		  
		  Me.AcceptTextDrop
		  Me.AcceptRawDataDrop("objectID")
		  
		  EnableBlinker(mHasFocus And SelectionLength = 0)
		  ignoreRepaint = False
		  
		  If TextSelectionColor = Nil Then TextSelectionColor = Color.HighlightColor
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21, Description = 43616C63756C6174657320746865206D6178696D756D20686F72697A6F6E74616C207363726F6C6C6261722076616C75652E
		Private Sub CalculateMaxHorizontalSB()
		  /// Calculates the maximum horizontal scrollbar value.
		  
		  If mHorizontalScrollbar = Nil Then Return
		  
		  Var contentWidth As Integer = mLastLongestLinePixels + LineNumberOffset + RightScrollMargin
		  Var n As Integer = Self.Width
		  Var max As Integer = contentWidth - n
		  If max <= 0 Then
		    max = 0
		    n = 0
		  End
		  
		  mHorizontalScrollBar.Enabled = max > 0
		  mHorizontalScrollBar.MaximumValue = max
		  mHorizontalScrollBar.PageStep = n
		  mHorizontalScrollBar.LineStep = 8
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21, Description = 43616C63756C6174657320746865206D6178696D756D20766572746963616C207363726F6C6C6261722076616C75652E
		Private Sub CalculateMaxVerticalSB()
		  /// Calculates the maximum vertical scrollbar value.
		  
		  If mVerticalScrollbar = Nil Then Return
		  
		  If EnableLineFoldings Then
		    mVerticalScrollbar.MaximumValue = Lines.Count - Lines.invisibleLines - MaxVisibleLines
		  Else
		    mVerticalScrollbar.MaximumValue = Lines.Count - MaxVisibleLines
		  End If
		  
		  // Update the pageStep so a page jump is always the number of visible lines or a page.
		  mVerticalScrollbar.PageStep = MaxVisibleLines - 1
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21, Description = 4368616E676573207468652063757272656E742073656C656374696F6E2E
		Private Sub ChangeSelection(selStart As Integer, selLength As Integer, viaDoubleClick As Boolean = False)
		  /// Changes the current selection.
		  
		  #Pragma Warning "TODO: Implement!"
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21, Description = 456E61626C6573206F722064697361626C65732074686520636172657420626C696E6B65722E
		Private Sub EnableBlinker(value As Boolean)
		  /// Enables or disables the caret blinker.
		  
		  If mCaretBlinker = Nil Then Return
		  
		  If value And Not ReadOnly Then
		    If DebugBuild And SyntaxArea.DebugIndentation Then
		      // Prevent repeated `DrawContents()` calls when debugging.
		      mCaretBlinker.RunMode = Timer.RunModes.Off
		    Else
		      mCaretBlinker.RunMode = Timer.RunModes.Multiple
		    End If
		    mCaretVisible = True
		  Else
		    mCaretBlinker.RunMode = Timer.RunModes.Off
		    mCaretVisible = False
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 4D61726B7320616C6C206C696E657320666F7220726564726177696E672E
		Sub InvalidateAllLines()
		  /// Marks all lines for redrawing.
		  
		  InvalidateLine(-1)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 496E76616C69646174657320286D61726B7320666F7220726564726177696E67292074686520676976656E206C696E652E20496620696E646578203C2030207468656E20696E76616C69646174657320616C6C206C696E65732E
		Sub InvalidateLine(index As Integer)
		  /// Invalidates (marks for redrawing) the given line.
		  /// If index < 0 then invalidates all lines.
		  
		  mFullRefresh = index < 0 or mFullRefresh
		  InvalidLines.Value(index) = True
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21, Description = 43616C6C656420627920746865206C696E65206D616E616765722C207768656E20746865726527732061206E6577206C696E652074686174277320746865206C6F6E67657374206C696E652E
		Private Sub MaxLineLengthChanged(longestLineIndex As Integer)
		  /// Called by the line manager, when there's a new line that's the longest line.
		  
		  #If Not DebugBuild
		    #Pragma DisableBackgroundTasks
		    #Pragma DisableBoundsChecking
		  #EndIf
		  
		  If longestLineIndex < 0 Then Return
		  
		  // OPTIMISE: Consider getting the screen width by reading all the word lengths in this line.
		  Var maxLine As SyntaxArea.TextLine = Lines.GetLine(longestLineIndex)
		  If maxline = Nil Or Abs(maxLine.length - mLastLongestLineLength) < 2 Then Return
		  
		  // Cache the length.
		  mLastLongestLineLength = maxLine.length
		  
		  // Measure the string in pixels.
		  Var tmp As Picture = TemporaryPicture
		  Var maxLength As Single = maxLine.TextWidth(TextStorage, tmp.Graphics, DisplayInvisibleCharacters)
		  If maxLength = mLastLongestLinePixels Then Return
		  
		  mLastLongestLinePixels = maxLength
		  
		  // Raise our custom event.
		  RaiseEvent MaxLineLengthChanged(mLastLongestLinePixels)
		  
		  // Handle the horizontal scrollbar.
		  CalculateMaxHorizontalSB
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ReceiveMessage(theMessage As MessageCentre.Message)
		  /// Part of the MessageCentre.MessageReceiver interface.
		  
		  #Pragma Warning "TODO: Implement!"
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 526564726177732074686520656E746972652063616E7661732E
		Sub Redraw(forced as Boolean = False)
		  /// Redraws the entire canvas.
		  
		  #Pragma Warning "TODO: Implement!"
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52656472617773207468652063617265742E
		Sub RedrawCaret()
		  /// Redraws the caret.
		  ///
		  /// Called by `CaretBlinker`.
		  
		  #Pragma Warning "TODO: Implement!"
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21, Description = 52657475726E7320612074656D706F726172792070696374757265206F626A6563742077697468207468652063757272656E742054657874466F6E7420616E6420466F6E7453697A6520746861742063616E206265207573656420666F722067726170686963616C2063616C63756C6174696F6E732E
		Private Function TemporaryPicture() As Picture
		  /// Returns a temporary picture object with the current TextFont and FontSize that can be used for graphical calculations.
		  
		  If mTempPicture = Nil Then mTempPicture = New Picture(2, 2)
		  
		  mTempPicture.Graphics.FontName = TextFont
		  mTempPicture.Graphics.FontSize = FontSize
		  
		  mTempPicture.Graphics.Bold = False
		  mTempPicture.Graphics.Italic = False
		  mTempPicture.Graphics.Underline = False
		  
		  Return mTempPicture
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub UpdateDesiredColumn(pos As Integer = -1)
		  // Saves the screen position of the given character offset.
		  
		  If Lines.Count = 0 Then Return
		  
		  If pos < 0 Then pos = CaretPos
		  
		  mDesiredColumnCharPos = pos
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0, Description = 546865206C656E677468206F6620746865206C6F6E67657374206C696E6520686173206368616E6765642E
		Event MaxLineLengthChanged(maxLineLengthInPixels As Single)
	#tag EndHook

	#tag Hook, Flags = &h0, Description = 54686520656469746F72206973206F70656E696E672E
		Event Opening()
	#tag EndHook


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

	#tag ComputedProperty, Flags = &h0, Description = 54686520706F736974696F6E206F66207468652063617265742E
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

	#tag ComputedProperty, Flags = &h0, Description = 49662054727565207468656E20696E76697369626C6520636861726163746572732028652E672E207370616365732C2072657475726E732C20657463292077696C6C20626520647261776E2E
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

	#tag ComputedProperty, Flags = &h0, Description = 49662054727565207468656E206C696E65206E756D626572732077696C6C20626520646973706C617965642E
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
			  return mEnablelinefoldings
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If mEnablelinefoldings And Not value Then Lines.UnfoldAll
			  mEnableLineFoldings = value
			  mLineNumberOffset = 0
			  UpdateDesiredColumn
			  InvalidateAllLines
			  Redraw
			  
			End Set
		#tag EndSetter
		EnableLineFoldings As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0, Description = 5468652063757272656E7420666F6E742073697A652E
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
			  
			  mlastLongestLineLength = 0
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
		Private FullRefresh As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Shared gBlockStartImage As Picture
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0, Description = 49662054727565207468656E2074686520656469746F722077696C6C2069676E6F726520746865206E6578742063616C6C20746F207265647261772E
		#tag Getter
			Get
			  Return mIgnoreRepaintCount > 0
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  // Sets a counter so every True is balanced with a False.
			  
			  // Make sure it's never negative.
			  If mIgnoreRepaintCount < 0 Then mIgnoreRepaintCount = 0
			  
			  If value Then
			    mIgnoreRepaintCount = mIgnoreRepaintCount + 1
			  ElseIf mIgnoreRepaintCount > 0 Then
			    mIgnoreRepaintCount = mIgnoreRepaintCount - 1
			  End If
			  
			End Set
		#tag EndSetter
		IgnoreRepaint As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h21, Description = 4B6579203D206C696E6520696E6465782C2056616C7565203D20426F6F6C65616E
		#tag Getter
			Get
			  If mInvalidlines = Nil Then mInvalidlines = New Dictionary
			  
			  Return mInvalidlines
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mInvalidlines = value
			End Set
		#tag EndSetter
		Private InvalidLines As Dictionary
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If Not DisplayLineNumbers Then Return 0
			  
			  If mLineNumberOffset = 0 Then
			    Var tmp As Picture = TemporaryPicture
			    tmp.Graphics.FontName = LineNumbersTextFont
			    tmp.Graphics.FontSize = LineNumbersFontSize
			    tmp.Graphics.Bold = True
			    mLineNumberOffset = tmp.Graphics.TextWidth(str(Lines.Count)) + 10
			    
			    If EnableLineFoldings Then
			      mLineNumberOffset = LineNumberOffset + blockStartImage.Width + 2
			    End If
			  End If
			  
			  Return mlineNumberOffset
			  
			End Get
		#tag EndGetter
		LineNumberOffset As Integer
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
			  mLineNumberOffset = 0
			  InvalidateAllLines
			  Redraw
			End Set
		#tag EndSetter
		LineNumbersFontSize As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0, Description = 546865206C696E65206E756D626572207465787420666F6E742E
		#tag Getter
			Get
			  Return mLineNumbersTextFont
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mLineNumbersTextFont = value
			  mLineNumberOffset = 0
			  InvalidateAllLines
			  Redraw
			End Set
		#tag EndSetter
		LineNumbersTextFont As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1, Description = 54686520656469746F722773206C696E65206D616E616765722E
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

	#tag ComputedProperty, Flags = &h0, Description = 546865206E756D626572206F66206C696E657320746861742063616E20666974206F6E746F207468652063616E7661732E
		#tag Note
			Careful:
			This returns just the number of rows that fit into the Canvas.
			This is not the same as the number of text lines that may be appearing in
			the Canvas if line folding is used! Get that value from `Self.VisibleAndHiddenLines()`.
		#tag EndNote
		#tag Getter
			Get
			  // Check to prevent a `ThreadAccessingUIException` when called from a thread.
			  If Thread.Current = Nil Then
			    mMaxVisibleLines = Min(Me.Height / TextHeight, Lines.Count)
			  End
			  
			  Return mMaxVisibleLines
			  
			End Get
		#tag EndGetter
		MaxVisibleLines As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mBlockBeginPosX As Double = -1
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mCaretBlinker As CaretBlinker
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mCaretPos As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mCaretVisible As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21, Description = 5472756520696620746865206D6F75736520637572736F722069732074686520494265616D2E
		Private mCursorIsIBeam As Boolean = True
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mDesiredColumnCharPos As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mDisplayInvisibleCharacters As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mDisplayLineNumbers As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mEnableLineFoldings As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mFontSize As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mFullRefresh As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mHasFocus As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mHorizontalScrollbar As DesktopScrollbar
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mIgnoreRepaintCount As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mIndentString As String
	#tag EndProperty

	#tag Property, Flags = &h21, Description = 4B6579203D206C696E6520696E6465782C2056616C7565203D20426F6F6C65616E
		Private mInvalidlines As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mLastLongestLineLength As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mLastLongestLinePixels As Single
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mLineNumberOffset As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mLineNumbersFontSize As Integer = 9
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mLineNumbersTextFont As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mLines As SyntaxArea.LineManager
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mMaxVisibleLines As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mReadOnly As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mSelectionLength As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mSelectionStart As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mTabWidth As Integer = 4
	#tag EndProperty

	#tag Property, Flags = &h21, Description = 41206361636865642074656D706F7261727920706963747572652074686174206973207573656420696E7465726E616C6C7920666F722067726170686963732063616C63756C6174696F6E732E
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
		Private mVerticalScrollbar As DesktopScrollbar
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0, Description = 57686574686572206F72206E6F742074686520656469746F722069732072656164206F6E6C792E
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

	#tag Property, Flags = &h0
		RightScrollMargin As Integer = 150
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0, Description = 546865206E756D626572206F662073656C656374656420636861726163746572732E
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

	#tag ComputedProperty, Flags = &h0, Description = 54686520706F736974696F6E206F662074686520696E73657274696F6E20706F696E742E
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

	#tag ComputedProperty, Flags = &h0, Description = 5468652077696474682028696E20636F6C756D6E7329206F662061207461622E
		#tag Getter
			Get
			  Return mTabwidth
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If value <= 0 Then value = 1
			  
			  mIndentString = ""
			  mTabWidth = value
			  Lines.TabWidth = value
			  UpdateDesiredColumn
			  InvalidateAllLines
			  Redraw
			End Set
		#tag EndSetter
		TabWidth As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0, Description = 5468652063757272656E7420656469746F7220666F6E742E
		#tag Getter
			Get
			  Return mTextFont
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If value = mTextFont Then Return
			  
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
			    mTextHeight = TemporaryPicture.Graphics.TextHeight
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

	#tag Property, Flags = &h0, Description = 54686520746578742073656C656374696F6E20636F6C6F75722E
		TextSelectionColor As ColorGroup
	#tag EndProperty

	#tag ComputedProperty, Flags = &h1, Description = 54686520746578742073746F7261676520666F72207468697320656469746F722E
		#tag Getter
			Get
			  If mTextStorage = Nil Then
			    // Create a new gap buffer...
			    mTextStorage = New SyntaxArea.GapBuffer
			    
			    // and blinker timer.
			    mCaretBlinker = New CaretBlinker(Self)
			  End If
			  
			  Return mTextStorage
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mTextstorage = value
			End Set
		#tag EndSetter
		Protected TextStorage As SyntaxArea.GapBuffer
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
			Name="IgnoreRepaint"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
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
			Name="FontSize"
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
			Name="TextSelectionColor"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="ColorGroup"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LineNumberOffset"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
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
			Name="LineNumbersTextFont"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
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
			Name="MaxVisibleLines"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
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
			Name="DisplayInvisibleCharacters"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
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
			Name="TabWidth"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
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
	#tag EndViewBehavior
End Class
#tag EndClass
