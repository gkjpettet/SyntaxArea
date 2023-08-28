#tag DesktopWindow
Begin DesktopWindow SuggestionWindow
   Backdrop        =   0
   BackgroundColor =   &cFFFFFF00
   Composite       =   False
   DefaultLocation =   0
   FullScreen      =   False
   HasBackgroundColor=   False
   HasCloseButton  =   False
   HasFullScreenButton=   False
   HasMaximizeButton=   False
   HasMinimizeButton=   False
   Height          =   300
   ImplicitInstance=   True
   MacProcID       =   1040
   MaximumHeight   =   32000
   MaximumWidth    =   32000
   MenuBar         =   0
   MenuBarVisible  =   True
   MinimumHeight   =   64
   MinimumWidth    =   64
   Resizeable      =   False
   Title           =   ""
   Type            =   3
   Visible         =   True
   Width           =   120
   Begin DesktopListBox OptionList
      AllowAutoDeactivate=   True
      AllowAutoHideScrollbars=   True
      AllowExpandableRows=   False
      AllowFocusRing  =   True
      AllowResizableColumns=   False
      AllowRowDragging=   False
      AllowRowReordering=   False
      Bold            =   False
      ColumnCount     =   1
      ColumnWidths    =   ""
      DefaultRowHeight=   16
      DropIndicatorVisible=   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   11.0
      FontUnit        =   0
      GridLineStyle   =   0
      HasBorder       =   True
      HasHeader       =   False
      HasHorizontalScrollbar=   False
      HasVerticalScrollbar=   True
      HeadingIndex    =   -1
      Height          =   300
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      RequiresSelection=   False
      RowSelectionType=   0
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   0
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   120
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin Timer Timer1
      Enabled         =   True
      Index           =   -2147483648
      LockedInPosition=   False
      Period          =   10
      RunMode         =   0
      Scope           =   0
      TabPanelIndex   =   0
   End
End
#tag EndDesktopWindow

#tag WindowCode
	#tag Event
		Sub Opening()
		  #If TargetWindows
		    Const WS_BORDER = &H800000
		    ChangeWindowStyle(Self, WS_BORDER, False)
		    
		    Const WS_CAPTION = &h00C00000
		    ChangeWindowStyle(Self, WS_CAPTION, False)
		  #EndIf
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21, Description = 43616E63656C2074686520616374696F6E2E
		Private Sub Cancel(requestFocus As Boolean)
		  /// Cancel the action.
		  
		  If OptionSubmitted Then Return
		  
		  OptionSubmitted = True
		  
		  Var msg As New MessageCentre.Message(Self, Self)
		  msg.AddInfo(1, SyntaxArea.Messages.AutocompleteCancelled)
		  msg.AddInfo(2, requestFocus)
		  MessageCentre.SendMessage(msg)
		  
		  StartTimer
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ChangeWindowStyle(w As DesktopWindow, flag As Integer, set As Boolean)
		  #Pragma Unused set
		  #If TargetWindows
		    Var oldFlags, newFlags, styleFlags As Integer
		    
		    Const SWP_NOSIZE = &H1
		    Const SWP_NOMOVE = &H2
		    Const SWP_NOZORDER = &H4
		    Const SWP_FRAMECHANGED = &H20
		    Const GWL_STYLE = -16
		    
		    Declare Function GetWindowLong Lib "user32" Alias "GetWindowLongA"(hwnd As Ptr, _
		    nIndex As Integer) As Integer
		    Declare Function SetWindowLong Lib "user32" Alias "SetWindowLongA"(hwnd As Ptr, _
		    nIndex As Integer, dwNewLong As Integer) As Integer
		    Declare Function SetWindowPos Lib "user32"(hwnd As Ptr, hWndInstertAfter As Integer, _
		    x As Integer, y As Integer, cx As Integer, cy As Integer, flags As Integer) As Integer
		    
		    oldFlags = GetWindowLong(w.Handle, GWL_STYLE)
		    
		    If Not set Then
		      newFlags = BitwiseAnd(oldFlags, Bitwise.OnesComplement(flag))
		    Else
		      newFlags = BitwiseOr(oldFlags, flag)
		    End
		    
		    styleFlags = SetWindowLong(w.Handle, GWL_STYLE, newFlags)
		    styleFlags = SetWindowPos(w.Handle, 0, 0, 0, 0, 0, SWP_NOMOVE + _
		    SWP_NOSIZE + SWP_NOZORDER + SWP_FRAMECHANGED)
		  #else
		    #Pragma Unused w
		    #Pragma Unused flag
		  #EndIf
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21, Description = 4C6F616420746865206F7074696F6E732E
		Private Sub LoadSuggestions(options() As String)
		  /// Load the options.
		  
		  OptionList.RemoveAllRows()
		  
		  For Each option As String In options
		    OptionList.AddRow(option)
		    Static p As New Picture(1, 1, 32)
		    Var neededWidth As Integer = p.Graphics.TextWidth(option)
		    If neededWidth > Self.Width Then
		      // Auto-expand to fit the options.
		      Self.Width = neededWidth + 10
		    End If
		  Next option
		  
		  If OptionList.RowCount > 0 Then OptionList.SelectedRowIndex = 0
		  
		  Me.Height = Min(OptionList.RowCount * OptionList.DefaultRowHeight + 4, Screen(0).Height / 2)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 47657420746865206F7074696F6E732E
		Sub Show(left As Integer, top As Integer)
		  /// Get the options.
		  
		  Var options As SyntaxArea.AutocompleteOptions
		  
		  Var msg As New MessageCentre.Message(Self, Self)
		  msg.AddInfo(1, SyntaxArea.Messages.CurrentAutocompleteOptions)
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
		  
		  Super.Show
		  OptionList.SetFocus
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21, Description = 54686973206973206120776F726B61726F756E6420746F20636C6F7365207468652077696E646F7720776974686F7574206372617368696E672E20446F6E2774206B6E6F77207768792E
		Private Sub StartTimer()
		  /// This is a workaround to close the window without crashing. Don't know why.
		  
		  Timer1.RunMode = Timer.RunModes.Single
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21, Description = 5375626D6974207468652073656C6563746564206F7074696F6E2E
		Private Sub Submit(what As String = "")
		  /// Submit the selected option.
		  
		  If OptionSubmitted Then Return
		  
		  OptionSubmitted = True
		  
		  Var option As String
		  If what = "" Then
		    option = OptionList.SelectedRowValue
		  Else
		    option = what
		  End If
		  
		  Var msg As New MessageCentre.Message(Self, Self)
		  msg.AddInfo(1, SyntaxArea.Messages.SuggestionWindowOptionSelected)
		  msg.AddInfo(2, option)
		  MessageCentre.SendMessage(msg)
		  
		  StartTimer
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private OptionSubmitted As Boolean
	#tag EndProperty


#tag EndWindowCode

#tag Events OptionList
	#tag Event
		Function CellPressed(row As Integer, column As Integer, x As Integer, y As Integer) As Boolean
		  #Pragma Unused x
		  #Pragma Unused y
		  
		  Submit(Me.CellTextAt(row, column))
		  
		End Function
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
		    
		    Var msg As New MessageCentre.Message(Self, Self)
		    Msg.AddInfo(1, SyntaxArea.Messages.SuggestionWindowKeyDown)
		    msg.AddInfo(2, key)
		    MessageCentre.sendMessage(Msg)
		    
		    // Key down message.
		    msg = New MessageCentre.Message(Self, Self)
		    msg.AddInfo(1, SyntaxArea.Messages.CurrentAutocompleteOptions)
		    MessageCentre.SendMessage(msg)
		    
		    // `msg` should have the options now.
		    options = msg.Info(3)
		    
		    If options = Nil Then
		      Cancel(True)
		      Return True
		    End If
		    
		    LoadSuggestions(options.Options)
		    If optionList.RowCount = 0 Then Cancel(True)
		  End Select
		  
		  Return True
		  
		End Function
	#tag EndEvent
	#tag Event
		Sub FocusLost()
		  Cancel(False)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Timer1
	#tag Event
		Sub Action()
		  Self.Close
		End Sub
	#tag EndEvent
#tag EndEvents
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
		Name="Interfaces"
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
		Name="Width"
		Visible=true
		Group="Size"
		InitialValue="600"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Size"
		InitialValue="400"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimumWidth"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimumHeight"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximumWidth"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximumHeight"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Type"
		Visible=true
		Group="Frame"
		InitialValue="0"
		Type="Types"
		EditorType="Enum"
		#tag EnumValues
			"0 - Document"
			"1 - Movable Modal"
			"2 - Modal Dialog"
			"3 - Floating Window"
			"4 - Plain Box"
			"5 - Shadowed Box"
			"6 - Rounded Window"
			"7 - Global Floating Window"
			"8 - Sheet Window"
			"9 - Modeless Dialog"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Frame"
		InitialValue="Untitled"
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasCloseButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasMaximizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasMinimizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasFullScreenButton"
		Visible=true
		Group="Frame"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Resizeable"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Composite"
		Visible=false
		Group="OS X (Carbon)"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MacProcID"
		Visible=false
		Group="OS X (Carbon)"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreen"
		Visible=false
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="DefaultLocation"
		Visible=true
		Group="Behavior"
		InitialValue="2"
		Type="Locations"
		EditorType="Enum"
		#tag EnumValues
			"0 - Default"
			"1 - Parent Window"
			"2 - Main Screen"
			"3 - Parent Window Screen"
			"4 - Stagger"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="ImplicitInstance"
		Visible=true
		Group="Windows Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasBackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="BackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="&cFFFFFF"
		Type="ColorGroup"
		EditorType="ColorGroup"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Background"
		InitialValue=""
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBar"
		Visible=true
		Group="Menus"
		InitialValue=""
		Type="DesktopMenuBar"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBarVisible"
		Visible=true
		Group="Deprecated"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
