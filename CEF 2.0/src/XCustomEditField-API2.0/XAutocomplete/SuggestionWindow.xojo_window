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
   Begin DesktopListBox optionList
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
		  #if TargetWin32
		    Const WS_BORDER = &H800000
		    ChangeWindowStyle( self, WS_BORDER, false )
		    
		    Const WS_CAPTION = &h00C00000
		    ChangeWindowStyle( self, WS_CAPTION, false )
		  #endif
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Sub cancel(requestFocus as boolean)
		  //cancel action
		  if optionSubmitted then Return
		  optionSubmitted = true
		  
		  dim msg as new Message(self, self)
		  msg.addInfo(1, AutocompleteCancelledMsg)
		  msg.addInfo(2, requestFocus)
		  MessageCenter.sendMessage(msg)
		  
		  StartTimer
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ChangeWindowStyle(w as DesktopWindow, flag as Integer, set as Boolean)
		  #pragma unused set
		  #if TargetWin32
		    Dim oldFlags as Integer
		    Dim newFlags as Integer
		    Dim styleFlags As Integer
		    
		    Const SWP_NOSIZE = &H1
		    Const SWP_NOMOVE = &H2
		    Const SWP_NOZORDER = &H4
		    Const SWP_FRAMECHANGED = &H20
		    
		    Const GWL_STYLE = -16
		    
		    Declare Function GetWindowLong Lib "user32" Alias "GetWindowLongA" (hwnd As ptr,  _
		    nIndex As Integer) As Integer
		    Declare Function SetWindowLong Lib "user32" Alias "SetWindowLongA" (hwnd As ptr, _
		    nIndex As Integer, dwNewLong As Integer) As Integer
		    Declare Function SetWindowPos Lib "user32" (hwnd as ptr, hWndInstertAfter as Integer, _
		    x as Integer, y as Integer, cx as Integer, cy as Integer, flags as Integer) as Integer
		    
		    oldFlags = GetWindowLong(w.Handle, GWL_STYLE)
		    
		    if not set then
		      newFlags = BitwiseAnd( oldFlags, Bitwise.OnesComplement( flag ) )
		    else
		      newFlags = BitwiseOr( oldFlags, flag )
		    end
		    
		    
		    styleFlags = SetWindowLong( w.Handle, GWL_STYLE, newFlags )
		    styleFlags = SetWindowPos( w.Handle, 0, 0, 0, 0, 0, SWP_NOMOVE +_
		    SWP_NOSIZE + SWP_NOZORDER + SWP_FRAMECHANGED )
		  #else
		    #pragma unused w
		    #pragma unused flag
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub loadSuggestions(options() as string)
		  //load options
		  optionList.RemoveAllRows()
		  
		  dim option as String
		  for each option in options
		    optionList.AddRow option
		    static p as new Picture(1, 1, 32)
		    dim neededWidth as integer = p.Graphics.TextWidth(option)
		    if neededWidth > self.Width then  //auto-expand to fit the options. Thanks to Dr Gerard Hammond
		      self.Width = neededWidth + 10
		    end
		  next
		  if optionList.RowCount > 0 then _
		  optionList.SelectedRowIndex = 0
		  
		  me.Height = min(optionList.RowCount * optionList.DefaultRowHeight + 4, Screen(0).Height/2)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub show(left as integer, top as integer)
		  //get options
		  dim options as AutocompleteOptions
		  dim msg as new Message(self, self)
		  msg.addInfo(1, CurrentAutocompleteOptionsMsg)
		  MessageCenter.sendMessage(msg)
		  options = msg.Info(3)
		  
		  if options = nil then Return
		  
		  //load suggestions
		  loadSuggestions(options.Options)
		  
		  me.Left = Left
		  me.Top = top
		  
		  if me.top + me.Height > Screen(0).Height then
		    me.Top = Screen(0).Height - me.Height
		  end if
		  
		  Super.Show
		  'super.SetFocus
		  optionList.SetFocus
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub StartTimer()
		  //this is a workaround to close the window without crashing, don't know why
		  timer1.RunMode = timer.RunModes.Single
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub submit(what as string = "")
		  //submit selected option
		  if optionSubmitted then Return
		  optionSubmitted = true
		  
		  dim option as String
		  if what ="" then
		    option = optionList.SelectedRowValue
		  else
		    option = what
		  end if
		  
		  dim msg as new Message(self, self)
		  msg.addInfo(1, OptionSelectedMsg)
		  msg.addInfo(2, Option)
		  MessageCenter.sendMessage(msg)
		  
		  StartTimer
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private optionSubmitted As boolean
	#tag EndProperty


	#tag Constant, Name = AutocompleteCancelledMsg, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = CurrentAutocompleteOptionsMsg, Type = Double, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = KeyDownMsg, Type = Double, Dynamic = False, Default = \"3", Scope = Public
	#tag EndConstant

	#tag Constant, Name = OptionSelectedMsg, Type = Double, Dynamic = False, Default = \"4", Scope = Public
	#tag EndConstant


#tag EndWindowCode

#tag Events optionList
	#tag Event
		Function CellPressed(row As Integer, column As Integer, x As Integer, y As Integer) As Boolean
		  #pragma unused x
		  #pragma unused y
		  
		  submit(me.CellTextAt(row,column))
		End Function
	#tag EndEvent
	#tag Event
		Function KeyDown(key As String) As Boolean
		  'MessageBox str(asc(key))
		  select case asc(key)
		  case 27, 8, 127
		    cancel(true)
		    
		  case 9, 13, 3, 32
		    submit
		    
		  case 28, 29, 30, 31
		    Return False
		    
		  else
		    dim options as AutocompleteOptions
		    
		    dim msg as new Message(self, self)
		    Msg.addInfo(1, KeyDownMsg)
		    msg.addInfo(2, key)
		    MessageCenter.sendMessage(Msg)
		    
		    //KeyDownMsg
		    msg = new Message(self, self)
		    msg.addInfo(1, CurrentAutocompleteOptionsMsg)
		    MessageCenter.sendMessage(msg)
		    //msg should have the options now
		    options = msg.Info(3)
		    
		    if options = nil then
		      cancel(true)
		      Return true
		    end if
		    
		    loadSuggestions(options.Options)
		    if optionList.RowCount = 0 then cancel(true)
		  end select
		  Return true
		End Function
	#tag EndEvent
	#tag Event
		Sub FocusLost()
		  cancel(False)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Timer1
	#tag Event
		Sub Action()
		  self.Close
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
