#tag DesktopWindow
Begin DesktopWindow FindWindow
   Backdrop        =   0
   BackgroundColor =   &cFFFFFF00
   Composite       =   True
   DefaultLocation =   0
   FullScreen      =   False
   HasBackgroundColor=   False
   HasCloseButton  =   True
   HasFullScreenButton=   False
   HasMaximizeButton=   False
   HasMinimizeButton=   False
   Height          =   154
   ImplicitInstance=   True
   MacProcID       =   0
   MaximumHeight   =   32000
   MaximumWidth    =   32000
   MenuBar         =   0
   MenuBarVisible  =   True
   MinimumHeight   =   64
   MinimumWidth    =   64
   Resizeable      =   False
   Title           =   "Find"
   Type            =   0
   Visible         =   True
   Width           =   527
   Begin DesktopLabel StaticText1
      AllowAutoDeactivate=   True
      Bold            =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   18
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Find:"
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   14
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   100
   End
   Begin DesktopLabel StaticText2
      AllowAutoDeactivate=   True
      Bold            =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   18
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Replace With:"
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   46
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   100
   End
   Begin DesktopComboBox txtToFind
      AllowAutoComplete=   False
      AllowAutoDeactivate=   True
      AllowFocusRing  =   True
      Bold            =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Hint            =   ""
      Index           =   -2147483648
      InitialValue    =   ""
      Italic          =   False
      Left            =   123
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      SelectedRowIndex=   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   15
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   384
   End
   Begin DesktopComboBox txtToReplace
      AllowAutoComplete=   False
      AllowAutoDeactivate=   True
      AllowFocusRing  =   True
      Bold            =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Hint            =   ""
      Index           =   -2147483648
      InitialValue    =   ""
      Italic          =   False
      Left            =   123
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      SelectedRowIndex=   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   47
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   384
   End
   Begin DesktopCheckBox ignoreCase
      AllowAutoDeactivate=   True
      Bold            =   False
      Caption         =   "Ignore Case"
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   123
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   79
      Transparent     =   True
      Underline       =   False
      Value           =   True
      Visible         =   True
      VisualState     =   0
      Width           =   100
   End
   Begin DesktopCheckBox wrapAround
      AllowAutoDeactivate=   True
      Bold            =   False
      Caption         =   "Wrap Around"
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   235
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   79
      Transparent     =   True
      Underline       =   False
      Value           =   True
      Visible         =   True
      VisualState     =   0
      Width           =   110
   End
   Begin DesktopButton btnReplaceAll
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "Replace All"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   100
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   114
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   93
   End
   Begin DesktopButton btnReplace
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "Replace"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   205
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   114
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin DesktopButton btnReplaceAndFind
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "Replace && Find"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   297
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   8
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   114
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   118
   End
   Begin DesktopButton btnNext
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "Next"
      Default         =   True
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   427
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   9
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   114
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin DesktopLabel results
      AllowAutoDeactivate=   True
      Bold            =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   357
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   10
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlignment   =   0
      TextColor       =   &c88888800
      Tooltip         =   ""
      Top             =   79
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   150
   End
End
#tag EndDesktopWindow

#tag WindowCode
	#tag Event
		Sub Closing()
		  lastLeft = me.Left
		  lastTop = me.top
		  CurrentFindWindow = nil
		End Sub
	#tag EndEvent

	#tag Event
		Function KeyDown(key As String) As Boolean
		  if Key = Chr(3) or Key = Chr(13) then
		    btnNext.Press
		    return true
		  end if
		End Function
	#tag EndEvent

	#tag Event
		Sub Opening()
		  if findTerms = nil then
		    findTerms = new Dictionary
		  end if
		  
		  if replaceTerms = nil then
		    replaceTerms = new Dictionary
		  end if
		  
		  CurrentFindWindow = self
		  txtToFind.Text = lastSearchTerm
		  txtToReplace.text = lastReplaceTerm
		  wrapAround.Value = lastWrapAroundValue
		  ignoreCase.Value = lastIgnoreCaseValue
		  if lastLeft >= 0 then me.Left = lastLeft
		  if lastTop >=0 then me.Top = lastTop
		  
		  for i as Integer = 0 to findTerms.KeyCount - 1
		    txtToFind.AddRow findTerms.Key(i).StringValue
		  next
		  
		  for i as Integer = 0 to replaceTerms.KeyCount - 1
		    txtToReplace.AddRow replaceTerms.Key(i).StringValue
		  next
		End Sub
	#tag EndEvent


	#tag MenuHandler
		Function FileClose() As Boolean Handles FileClose.Action
		  self.Close
		  Return True
		  
		End Function
	#tag EndMenuHandler


	#tag Method, Flags = &h1
		Protected Shared Sub addFindTerm()
		  if findTerms = nil then
		    findTerms = new Dictionary
		  end if
		  
		  if findTerms.HasKey(lastSearchTerm) then Return
		  
		  findTerms.Value(lastSearchTerm) = nil
		  if CurrentFindWindow <> nil then
		    CurrentFindWindow.txtToFind.AddRow lastSearchTerm
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Shared Sub addReplaceTerm()
		  if replaceTerms = nil then
		    replaceTerms = new Dictionary
		  end if
		  
		  if replaceTerms.HasKey(lastReplaceTerm) then Return
		  
		  replaceTerms.Value(lastReplaceTerm) = nil
		  
		  if CurrentFindWindow <> nil then
		    CurrentFindWindow.txtToReplace.AddRow lastReplaceTerm
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function findNext() As boolean
		  if CurrentFindWindow <> nil then
		    CurrentFindWindow.results.Text = ""
		    lastIgnoreCaseValue = CurrentFindWindow.ignoreCase.Value
		    lastWrapAroundValue = CurrentFindWindow.wrapAround.Value
		  end if
		  
		  if CurrentFindWindow <> nil and CurrentFindWindow.txtToFind.Text = "" then
		    System.Beep
		    Return false
		  end if
		  
		  Return findNext(lastIgnoreCaseValue, lastWrapAroundValue, true, -1)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Shared Function findNext(ignoreCase as boolean, wrapAround as boolean, redraw as boolean, startPos as integer) As boolean
		  var Target as CustomEditField = CustomEditField.CurrentFocusedField
		  if Target = nil then Return false
		  
		  addFindTerm
		  if Target.Find(lastSearchTerm, ignoreCase, wrapAround, redraw, startPos) > -1 then Return true
		  
		  System.Beep
		  if CurrentFindWindow <> nil then
		    CurrentFindWindow.results.Text = "Not Found"
		  end if
		  Return False
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Sub replace()
		  if CurrentFindWindow <> nil then
		    CurrentFindWindow.results.Text = ""
		    lastIgnoreCaseValue = CurrentFindWindow.ignoreCase.Value
		    lastWrapAroundValue = CurrentFindWindow.wrapAround.Value
		  end if
		  
		  var Target as CustomEditField = CustomEditField.CurrentFocusedField
		  if Target = nil then Return
		  
		  addReplaceTerm
		  Target.SelText = lastReplaceTerm
		  Target.Redraw
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Shared Sub replaceAll()
		  var Target as CustomEditField = CustomEditField.CurrentFocusedField
		  if Target = nil then Return
		  
		  var count as Integer
		  var eventID as Integer = System.Ticks // -> grouped undo
		  
		  addFindTerm
		  addReplaceTerm
		  Target.ignoreRepaint = true
		  var startPos as Integer = 0 //start at begining of file
		  while findNext(lastIgnoreCaseValue, false, false, startPos) //WITHOUT wrapping, since this could lead to an infinite loop if replacement contains find term.
		    Target.private_replace(Target.SelectionStart, Target.SelectionLength, lastReplaceTerm, true, eventID)
		    count = count + 1
		    startPos = Target.CaretPos //update startPos
		  wend
		  Target.ignoreRepaint = false
		  Target.Redraw
		  
		  if Count > 1 and CurrentFindWindow <> nil then
		    CurrentFindWindow.results.Text = str(Count) + " Replaced"
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Sub replaceAndFind()
		  replace
		  call findNext
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected Shared CurrentFindWindow As FindWindow
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected Shared findTerms As dictionary
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected Shared lastIgnoreCaseValue As Boolean = true
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected Shared lastLeft As Integer = -1
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected Shared lastReplaceTerm As string
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected Shared lastSearchTerm As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected Shared lastTop As Integer = -1
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected Shared lastWrapAroundValue As Boolean = true
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected Shared replaceTerms As dictionary
	#tag EndProperty


#tag EndWindowCode

#tag Events txtToFind
	#tag Event
		Sub TextChanged()
		  lastSearchTerm = me.Text
		End Sub
	#tag EndEvent
	#tag Event
		Function KeyDown(key As String) As Boolean
		  if Key = Chr(3) or Key = Chr(13) then
		    btnNext.Press
		    return true
		  end if
		End Function
	#tag EndEvent
	#tag Event
		Sub Opening()
		  #if TargetLinux then
		    me.Height = 26
		  #endif
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events txtToReplace
	#tag Event
		Sub TextChanged()
		  lastReplaceTerm = me.text
		End Sub
	#tag EndEvent
	#tag Event
		Function KeyDown(key As String) As Boolean
		  if Key = Chr(3) or Key = Chr(13) then
		    btnNext.Press
		    return true
		  end if
		End Function
	#tag EndEvent
	#tag Event
		Sub Opening()
		  #if TargetLinux then
		    me.Height = 26
		  #endif
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ignoreCase
	#tag Event
		Sub ValueChanged()
		  lastIgnoreCaseValue = me.Value
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events wrapAround
	#tag Event
		Sub ValueChanged()
		  lastWrapAroundValue = me.Value
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnReplaceAll
	#tag Event
		Sub Pressed()
		  replaceAll
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnReplace
	#tag Event
		Sub Pressed()
		  replace
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnReplaceAndFind
	#tag Event
		Sub Pressed()
		  replaceAndFind
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnNext
	#tag Event
		Sub Pressed()
		  call findNext
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
