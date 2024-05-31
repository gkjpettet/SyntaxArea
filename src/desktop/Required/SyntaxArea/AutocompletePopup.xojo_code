#tag Class
Protected Class AutocompletePopup
Inherits DesktopListBox
	#tag CompatibilityFlags = ( TargetDesktop and ( Target32Bit or Target64Bit ) )
	#tag Event
		Function CellPressed(row As Integer, column As Integer, x As Integer, y As Integer) As Boolean
		  // The user has pressed on a suggestion option.
		  
		  #Pragma Unused x
		  #Pragma Unused y
		  
		  // Submit the chosen option.
		  Submit(Me.CellTextAt(row, column))
		  
		  Return True
		End Function
	#tag EndEvent

	#tag Event
		Sub FocusLost()
		  /// The suggestion popup has lost the focus. We therefore need to cancel the operation.
		  
		  Cancel(False)
		End Sub
	#tag EndEvent

	#tag Event
		Function KeyDown(key As String) As Boolean
		  Select Case Asc(key)
		  Case 27, 8, 127 // Esc, backspace, delete.
		    Cancel(True)
		    
		  Case 9, 13, 3, 32 // Tab, CR, end of text, space
		    Submit
		    
		  Case 28, 29, 30, 31 // File separator, group separator, record separator, unit separator.
		    Return False
		    
		  Else
		    Var options As SyntaxArea.AutocompleteOptions
		    
		    Var msg As New SyntaxArea.Message(Self, Self)
		    Msg.AddInfo(Messages.MessageType, SyntaxArea.Messages.SuggestionWindowKeyDown)
		    msg.AddInfo(2, key)
		    MessageCentre.sendMessage(Msg)
		    
		    // Key down message.
		    msg = New SyntaxArea.Message(Self, Self)
		    msg.AddInfo(Messages.MessageType, SyntaxArea.Messages.CurrentAutocompleteOptions)
		    MessageCentre.SendMessage(msg)
		    
		    // `msg` should have the options now.
		    options = msg.Info(3)
		    
		    If options = Nil Then
		      Cancel(True)
		      Return True
		    End If
		    
		    LoadSuggestions(options.Options)
		    If Me.RowCount = 0 Then Cancel(True)
		  End Select
		  
		  Return True
		  
		End Function
	#tag EndEvent

	#tag Event
		Function PaintCellBackground(g As Graphics, row As Integer, column As Integer) As Boolean
		  #Pragma Unused column
		  
		  If Me.SelectedRowIndex = row Then
		    g.DrawingColor = Owner.TextSelectionColor
		  Else
		    g.DrawingColor = Owner.SuggestionPopupBackColor
		  End If
		  
		  g.FillRectangle(0, 0, g.Width, g.Height)
		  
		  Return True
		End Function
	#tag EndEvent

	#tag Event
		Function PaintCellText(g as Graphics, row as Integer, column as Integer, x as Integer, y as Integer) As Boolean
		  #Pragma Unused column
		  
		  If Me.SelectedRowIndex = row Then
		    g.DrawingColor = Owner.SuggestionPopupSelectedTextColor
		  Else
		    g.DrawingColor = Owner.SuggestionPopupTextColor
		  End If
		  
		  If row <= Me.LastRowIndex Then
		    g.DrawText(Me.RowAt(row).CellTextAt(0), x, y)
		  End If
		  
		  Return True
		  
		End Function
	#tag EndEvent


	#tag Method, Flags = &h21, Description = 43616E63656C2074686520616374696F6E2E
		Private Sub Cancel(requestFocus As Boolean)
		  /// Cancel the action.
		  
		  If OptionSubmitted Then Return
		  
		  OptionSubmitted = True
		  
		  Var msg As New SyntaxArea.Message(Self, Self)
		  msg.AddInfo(Messages.MessageType, SyntaxArea.Messages.AutocompleteCancelled)
		  msg.AddInfo(2, requestFocus)
		  MessageCentre.SendMessage(msg)
		  
		  Me.Visible = False
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(owningEditor As SyntaxArea.Editor)
		  Super.Constructor
		  
		  mOwner = New WeakRef(owningEditor)
		  
		  // Force a rebuild of our temporary scrachpad picture.
		  ScaleFactorChanged
		  
		  // Since this control is added to the view hierarchy with `DesktopWindow.AddControl`, 
		  // no properties are set by default so we need to initialise them ALL here.
		  // The size properties will be set each time in `LoadSuggestions`.
		  Me.Height = 0
		  Me.Width = 0
		  Me.DefaultRowHeight = 20
		  Me.ColumnCount = 1
		  Me.FontName = Owner.FontName
		  Me.FontSize = Owner.FontSize
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21, Description = 4C6F616420746865206F7074696F6E7320616E64207365742074686520776964746820616E6420686569676874206F662074686520706F7075702E
		Private Sub LoadSuggestions(options() As String)
		  /// Load the options and set the width and height of the popup.
		  
		  Me.RemoveAllRows()
		  
		  For Each option As String In options
		    Me.AddRow(option)
		    mTempPicture.Graphics.FontSize = Owner.FontSize
		    mTempPicture.Graphics.FontName = Owner.FontName
		    Var neededWidth As Integer = mTempPicture.Graphics.TextWidth(option)
		    If neededWidth > Self.Width Then
		      // Expand to fit the options.
		      Self.Width = neededWidth + 10
		    End If
		  Next option
		  
		  Me.Height = Min(Me.RowCount * Me.DefaultRowHeight, 20 * Me.DefaultRowHeight)
		  
		  // Always ensure the first option is visible and selected.
		  If Me.RowCount > 0 Then Me.SelectedRowIndex = 0
		  Me.ScrollPosition = 0
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 546865207363616C6520666163746F72206F662074686520646973706C6179207468697320706F707570277320656469746F72206973206F6E206A757374206368616E6765642E205765206E65656420746F207265637265617465206F75722074656D706F726172792070696374757265207573656420666F722077696474682063616C63756C6174696F6E732E
		Sub ScaleFactorChanged()
		  /// The scale factor of the display this popup's editor is on just changed.
		  /// We need to recreate our temporary picture used for width calculations.
		  
		  If Owner <> Nil And Owner.Window <> Nil Then
		    mTempPicture = Owner.Window.BitmapForCaching(1, 1)
		  Else
		    mTempPicture = New Picture(1, 1)
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 53686F772074686520706F7075702061742074686520706173736564206C6F636174696F6E202872656C617469766520746F2074686520706172656E7420656469746F7220636F6E74726F6C292E
		Sub Show(left As Integer, top As Integer)
		  /// Show the popup at the passed location (relative to the parent editor control).
		  
		  Me.Visible = True
		  
		  OptionSubmitted = False
		  
		  Var options As SyntaxArea.AutocompleteOptions
		  
		  Var msg As New SyntaxArea.Message(Self, Self)
		  msg.AddInfo(Messages.MessageType, SyntaxArea.Messages.CurrentAutocompleteOptions)
		  MessageCentre.SendMessage(msg)
		  options = msg.Info(3)
		  
		  If options = Nil Then Return
		  
		  // Load the suggestions.
		  LoadSuggestions(options.Options)
		  
		  Me.Left = left
		  Me.Top = top
		  
		  If Me.Top + Me.Height > Screen(0).Height Then
		    Me.Top = Screen(0).Height - Me.Height
		  End If
		  
		  Me.SetFocus
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21, Description = 5375626D6974207468652073656C6563746564206F7074696F6E2E
		Private Sub Submit(what As String = "")
		  /// Submit the selected option.
		  
		  If OptionSubmitted Then Return
		  
		  OptionSubmitted = True
		  
		  Var option As String
		  If what = "" Then
		    option = Me.SelectedRowText
		  Else
		    option = what
		  End If
		  
		  Var msg As New SyntaxArea.Message(Self, Self)
		  msg.AddInfo(Messages.MessageType, SyntaxArea.Messages.SuggestionWindowOptionSelected)
		  msg.AddInfo(2, option)
		  MessageCentre.SendMessage(msg)
		  
		  Me.Visible = False
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mOwner As WeakRef
	#tag EndProperty

	#tag Property, Flags = &h21, Description = 55736564207768656E2063616C63756C6174696E6720746865207769647468206F662074686520706F7075702E
		Private mTempPicture As Picture
	#tag EndProperty

	#tag Property, Flags = &h21
		Private OptionSubmitted As Boolean
	#tag EndProperty

	#tag ComputedProperty, Flags = &h21
		#tag Getter
			Get
			  If mOwner = Nil Or mOwner.Value = Nil Then
			    Return Nil
			  Else
			    Return SyntaxArea.Editor(mOwner.Value)
			  End If
			  
			End Get
		#tag EndGetter
		Private Owner As SyntaxArea.Editor
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue=""
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
			Name="Left"
			Visible=true
			Group="Position"
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
		#tag ViewProperty
			Name="Width"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockLeft"
			Visible=true
			Group="Position"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockTop"
			Visible=true
			Group="Position"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockRight"
			Visible=true
			Group="Position"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockBottom"
			Visible=true
			Group="Position"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabIndex"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabPanelIndex"
			Visible=false
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabStop"
			Visible=true
			Group="Position"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="_ScrollOffset"
			Visible=false
			Group="Appearance"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="_ScrollWidth"
			Visible=false
			Group="Appearance"
			InitialValue="-1"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowAutoDeactivate"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="HasBorder"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ColumnCount"
			Visible=true
			Group="Appearance"
			InitialValue="1"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ColumnWidths"
			Visible=true
			Group="Appearance"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DefaultRowHeight"
			Visible=true
			Group="Appearance"
			InitialValue="-1"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Enabled"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="GridLineStyle"
			Visible=true
			Group="Appearance"
			InitialValue="0"
			Type="GridLineStyles"
			EditorType="Enum"
			#tag EnumValues
				"0 - None"
				"1 - Horizontal"
				"2 - Vertical"
				"3 - Both"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="HasHeader"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="HeadingIndex"
			Visible=true
			Group="Appearance"
			InitialValue="-1"
			Type="Integer"
			EditorType=""
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
			Name="InitialValue"
			Visible=true
			Group="Appearance"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HasHorizontalScrollbar"
			Visible=true
			Group="Appearance"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="HasVerticalScrollbar"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="DropIndicatorVisible"
			Visible=true
			Group="Appearance"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Transparent"
			Visible=true
			Group="Appearance"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowFocusRing"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Visible"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Bold"
			Visible=true
			Group="Font"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Italic"
			Visible=true
			Group="Font"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="FontName"
			Visible=true
			Group="Font"
			InitialValue="System"
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="FontSize"
			Visible=true
			Group="Font"
			InitialValue="0"
			Type="Single"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="FontUnit"
			Visible=true
			Group="Font"
			InitialValue="0"
			Type="FontUnits"
			EditorType="Enum"
			#tag EnumValues
				"0 - Default"
				"1 - Pixel"
				"2 - Point"
				"3 - Inch"
				"4 - Millimeter"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="Underline"
			Visible=true
			Group="Font"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowAutoHideScrollbars"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowResizableColumns"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowRowDragging"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowRowReordering"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowExpandableRows"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="RequiresSelection"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="RowSelectionType"
			Visible=true
			Group="Behavior"
			InitialValue="0"
			Type="RowSelectionTypes"
			EditorType="Enum"
			#tag EnumValues
				"0 - Single"
				"1 - Multiple"
			#tag EndEnumValues
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
