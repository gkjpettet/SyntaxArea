#tag DesktopWindow
Begin DesktopWindow SyntaxColors
   Backdrop        =   0
   BackgroundColor =   &cFFFFFF00
   Composite       =   False
   DefaultLocation =   0
   FullScreen      =   False
   HasBackgroundColor=   False
   HasCloseButton  =   True
   HasFullScreenButton=   False
   HasMaximizeButton=   False
   HasMinimizeButton=   False
   Height          =   300
   ImplicitInstance=   True
   MacProcID       =   0
   MaximumHeight   =   32000
   MaximumWidth    =   32000
   MenuBar         =   0
   MenuBarVisible  =   True
   MinimumHeight   =   64
   MinimumWidth    =   64
   Resizeable      =   False
   Title           =   "Untitled"
   Type            =   8
   Visible         =   True
   Width           =   278
   Begin DesktopListBox definitionColors
      AllowAutoDeactivate=   True
      AllowAutoHideScrollbars=   True
      AllowExpandableRows=   True
      AllowFocusRing  =   True
      AllowResizableColumns=   False
      AllowRowDragging=   False
      AllowRowReordering=   False
      Bold            =   False
      ColumnCount     =   6
      ColumnWidths    =   "*,40,40,24,24,24"
      DefaultRowHeight=   24
      DropIndicatorVisible=   False
      Enabled         =   True
      FontName        =   "SmallSystem"
      FontSize        =   0.0
      FontUnit        =   0
      GridLineStyle   =   0
      HasBorder       =   True
      HasHeader       =   True
      HasHorizontalScrollbar=   False
      HasVerticalScrollbar=   False
      HeadingIndex    =   -1
      Height          =   248
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Context Name	Color	Back	B	I	U"
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
      Width           =   278
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin DesktopButton btnOk
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "Ok"
      Default         =   False
      Enabled         =   True
      FontName        =   "SmallSystem"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   145
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   260
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin Timer sizeTimer
      Enabled         =   True
      Index           =   -2147483648
      InitialParent   =   ""
      LockedInPosition=   False
      Period          =   5
      RunMode         =   0
      Scope           =   0
      TabPanelIndex   =   0
   End
   Begin DesktopButton btnSave
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "Save XML"
      Default         =   False
      Enabled         =   True
      FontName        =   "SmallSystem"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   53
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   260
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
End
#tag EndDesktopWindow

#tag WindowCode
	#tag Method, Flags = &h0
		Function show(definition as highlightdefinition) As boolean
		  self.definition = definition
		  showDefinition
		  me.Title = definition.Name
		  Super.ShowModal
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub ShowContexts(contexts() as highlightcontext, showPlaceholders as Boolean)
		  var subContext as HighlightContext
		  
		  for each subContext in Contexts
		    if subContext.isPlaceholder and not showPlaceholders then Continue for
		    
		    var subContexts() as HighlightContext = subContext.contexts
		    if subContexts.LastIndex > - 1 and not subContexts(0).isPlaceholder then
		      definitionColors.AddExpandableRow subContext.Name
		      
		    else
		      definitionColors.AddRow subContext.Name
		      
		    end if
		    
		    definitionColors.CellTagAt(definitionColors.LastRowIndex, 0) = subContext
		    definitionColors.CellCheckBoxValueAt(definitionColors.LastRowIndex, 3) = subContext.Bold
		    definitionColors.CellCheckBoxValueAt(definitionColors.LastRowIndex, 4) = subContext.Italic
		    definitionColors.CellCheckBoxValueAt(definitionColors.LastRowIndex, 5) = subContext.Underline
		    definitionColors.RowExpandedAt(definitionColors.LastRowIndex) = true //expand all!
		  next
		  
		  Height = (definitionColors.RowCount + 1) * definitionColors.DefaultRowHeight + 52
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub showDefinition()
		  ShowContexts(definition.Contexts, true)
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected definition As highlightdefinition
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected result As boolean
	#tag EndProperty


#tag EndWindowCode

#tag Events definitionColors
	#tag Event
		Sub RowExpanded(row As Integer)
		  var selectedContext as HighlightContext
		  
		  selectedContext = me.CellTagAt(row, 0)
		  ShowContexts(selectedContext.Contexts, false)
		End Sub
	#tag EndEvent
	#tag Event
		Sub Opening()
		  me.ColumnTypeAt(3) = DesktopListBox.CellTypes.CheckBox
		  me.ColumnTypeAt(4) = DesktopListBox.CellTypes.CheckBox
		  me.ColumnTypeAt(5) = DesktopListBox.CellTypes.CheckBox
		End Sub
	#tag EndEvent
	#tag Event
		Function PaintCellBackground(g As Graphics, row As Integer, column As Integer) As Boolean
		  if row >= me.RowCount then Return False
		  
		  var context as HighlightContext = me.CellTagAt(row, 0)
		  
		  select case column
		  case 1
		    g.DrawingColor = EditFieldGlobals.AdjustColorForDarkMode (Context.HighlightColor)
		    g.FillRectangle (g.Width - 18)/2, 2, 20, 20
		    g.DrawingColor = EditFieldGlobals.AdjustColorForDarkMode (&c0)
		    g.DrawRectangle (g.Width - 18)/2, 2, 20, 20
		    
		    Return true
		  case 2
		    if context.HasBackgroundColor then
		      g.DrawingColor = EditFieldGlobals.AdjustColorForDarkMode (Context.BackgroundColor)
		      g.FillRectangle (g.Width - 18)/2, 2, 20, 20
		    else
		      g.DrawLine (g.Width - 18)/2, 2, (g.Width - 18)/2 + 19, 21
		    end if
		    g.DrawingColor = EditFieldGlobals.AdjustColorForDarkMode (&c0)
		    g.DrawRectangle (g.Width - 18)/2, 2, 20, 20
		    
		    Return true
		  end select
		  
		End Function
	#tag EndEvent
	#tag Event
		Sub CellAction(row As Integer, column As Integer)
		  var context as HighlightContext = me.CellTagAt(row, 0)
		  
		  if Context = nil then Return
		  select case column
		  case 3 'b
		    Context.Bold = me.CellCheckBoxValueAt(row, column)
		  case 4 'i
		    Context.Italic = me.CellCheckBoxValueAt(row, column)
		  case 5 'u
		    Context.Underline = me.CellCheckBoxValueAt(row, column)
		  end select
		  result = true
		End Sub
	#tag EndEvent
	#tag Event
		Function CellPressed(row As Integer, column As Integer, x As Integer, y As Integer) As Boolean
		  #pragma unused x
		  #pragma unused y
		  #pragma unused row
		  
		  var context as HighlightContext = me.CellTagAt(row, 0)
		  if context = nil then Return true
		  
		  var newColor as color
		  select case column
		  case 1 'fore
		    newColor = context.HighlightColor
		    if Color.SelectedFromDialog(newColor, context.Name + " highlight color") then
		      context.HighlightColor = newColor
		      result = true
		    end if
		  case 2 'back
		    newColor = context.BackgroundColor
		    if Color.SelectedFromDialog(newColor, context.Name + " back color") then
		      context.BackgroundColor = newColor
		      result = true
		    end if
		    
		  end select
		End Function
	#tag EndEvent
	#tag Event
		Sub RowCollapsed(row As Integer)
		  #pragma unused row
		  sizeTimer.RunMode = timer.RunModes.Single
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnOk
	#tag Event
		Sub Pressed()
		  Close
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events sizeTimer
	#tag Event
		Sub Action()
		  Height = (definitionColors.RowCount + 1) * definitionColors.DefaultRowHeight + 52
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnSave
	#tag Event
		Sub Pressed()
		  var file as FolderItem = FolderItem.ShowSaveFileDialog("Text", definition.Name+"_sdef.xml")
		  if file = nil then Return
		  
		  if not definition.saveAsXml(file) Then
		    MessageBox "Error saving"
		  end if
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
