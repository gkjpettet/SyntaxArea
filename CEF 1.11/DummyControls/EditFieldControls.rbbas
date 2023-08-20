#tag Class
Protected Class EditFieldControls
Inherits canvas
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  #pragma unused y
		  if x < SelectionInfoWidth or x > SelectionInfoWidth + SymbolsWidth then Return False
		  
		  Return showSymbolMenu
		End Function
	#tag EndEvent

	#tag Event
		Sub Open()
		  me.DoubleBuffer = TargetWin32 // avoids flicker on Windows
		  me.EraseBackground = false
		End Sub
	#tag EndEvent

	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  #pragma unused areas
		  
		  Repaint(g)
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h1
		Protected Function ImageForSymbol(type as string) As picture
		  dim tmp as Picture = New Picture (11,11,16)
		  
		  select case type
		  case "class"
		    tmp.Graphics.ForeColor = EditFieldGlobals.AdjustColorForDarkMode (&c9393C0)
		  case "method"
		    tmp.Graphics.ForeColor = EditFieldGlobals.AdjustColorForDarkMode (&c82A3D5)
		  else
		    tmp.Graphics.ForeColor = EditFieldGlobals.AdjustColorForDarkMode (&c888888)
		  end select
		  
		  tmp.Graphics.FillRect 0,0,tmp.Width,tmp.Height
		  
		  tmp.Graphics.ForeColor = EditFieldGlobals.AdjustColorForDarkMode (&cffffff)
		  
		  tmp.Graphics.TextFont = "arial"
		  tmp.Graphics.TextSize = 10
		  
		  tmp.Graphics.DrawString type.Mid(1,1), (tmp.Graphics.Width - tmp.Graphics.StringWidth(type.mid(1,1))) / 2, (tmp.Graphics.Height + tmp.Graphics.TextAscent)/2 - 1
		  
		  Return tmp
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub repaint(g as graphics)
		  'gradient(g)
		  ' This does not play well with Dark Mode: g.DrawPicture plasticBack, 0, 0, g.Width, g.Height, 0, 0, plasticBack.Width, plasticBack.Height
		  
		  g.TextFont = "System"
		  g.TextSize = 10
		  
		  dim col1 as Color = EditFieldGlobals.AdjustColorForDarkMode (&c444444)
		  dim col2 as Color = EditFieldGlobals.AdjustColorForDarkMode (&cCCCCCC)
		  
		  g.ForeColor = col1
		  g.DrawString TextSelectionInfo, 5, (g.Height + g.TextAscent)/2 - 1
		  
		  SelectionInfoWidth = g.StringWidth(TextSelectionInfo) + 10
		  
		  if mKnobPict = nil then mKnobPict = EditFieldGlobals.LoadMaskedPicture(knobImage)
		  SymbolsWidth = g.StringWidth(text) + 10 + mKnobPict.width + 5
		  
		  dim symbolPict as Picture
		  if currentSymbol <> nil then
		    SymbolPict = ImageForSymbol(currentSymbol.Type)
		    SymbolsWidth = SymbolsWidth + SymbolPict.width + 2
		    g.DrawPicture SymbolPict, SelectionInfoWidth + 5, (g.Height - SymbolPict.height) / 2
		    g.DrawString Text, SelectionInfoWidth + 5 + symbolPict.width + 4, (g.Height + g.TextAscent)/2 - 1
		  else
		    g.DrawString Text, SelectionInfoWidth + 5, (g.Height + g.TextAscent)/2 - 1
		  end if
		  g.DrawPicture mKnobPict, SelectionInfoWidth + SymbolsWidth - mKnobPict.width - 5, (g.Height - mKnobPict.Height)/2 + 1
		  
		  g.ForeColor = col2
		  g.DrawLine SelectionInfoWidth, 0, SelectionInfoWidth, g.Height
		  g.DrawLine SelectionInfoWidth + SymbolsWidth, 0, SelectionInfoWidth + SymbolsWidth, g.Height
		  
		  g.ForeColor = col1
		  g.DrawRect 0,-1,g.Width,g.Height + 2
		  dim txt as String = "CEF Version: "+EditFieldGlobals.CEF_VERSION
		  g.DrawString txt, g.Width - g.StringWidth(txt) - 2, (g.Height + g.TextAscent)/2 - 1
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function showSymbolMenu() As boolean
		  dim symbols() as DocumentSymbol = GetSymbols
		  if symbols is nil or UBound(symbols) < 0 then Return False
		  
		  dim SymbolOffsets() as Integer
		  
		  dim symbol as DocumentSymbol
		  
		  for each symbol in symbols
		    SymbolOffsets.Append Symbol.Offset
		  next
		  
		  dim menu as new MenuItem
		  
		  //sort by offset
		  SymbolOffsets.SortWith(Symbols)
		  
		  dim entry as MenuItem
		  dim indent as String
		  for each Symbol in Symbols
		    if Symbol.Type = "Method" then
		      indent = "    "
		    else
		      indent = ""
		    end if
		    entry = new MenuItem(indent + Symbol.Name)
		    entry.Tag = Symbol
		    
		    if currentSymbol <> nil then
		      entry.Checked = Symbol.Offset = currentSymbol.Offset
		    end if
		    
		    entry.Icon = ImageForSymbol(Symbol.Type)
		    menu.Append(entry)
		  next
		  
		  dim container as Window
		  dim locx, locy as integer
		  
		  //find the window where this control is...
		  //since the control can be deeeeeeep whithin container controls...
		  locx=me.Left+SelectionInfoWidth
		  locy=me.top
		  
		  Container=me.Window
		  while true
		    locx=locx+Container.Left
		    locy=locy+Container.top
		    if container isa ContainerControl then
		      Container=ContainerControl(Container).Window
		    elseif Container isa Window then
		      Exit
		    end if
		  Wend
		  
		  menu = menu.PopUp(locx, locy)
		  if menu = nil then Return true
		  currentSymbol = menu.Tag
		  SymbolSelected(currentSymbol)
		  
		  return true
		End Function
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event GetSymbols() As DocumentSymbol()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event SymbolSelected(symbol as DocumentSymbol)
	#tag EndHook


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mCurrentsymbol
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mCurrentsymbol = value
			  self.Invalidate
			End Set
		#tag EndSetter
		currentSymbol As documentSymbol
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mCurrentsymbol As documentSymbol
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mKnobPict As Picture
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mTextselectioninfo As string = "1:0"
	#tag EndProperty

	#tag Property, Flags = &h21
		Private SelectionInfoWidth As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private SymbolsWidth As Integer
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  if currentSymbol = nil then Return "<No selected symbol>"
			  
			  Return currentSymbol.Name
			End Get
		#tag EndGetter
		Text As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mTextselectioninfo
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mTextselectioninfo = value
			  self.Invalidate
			End Set
		#tag EndSetter
		TextSelectionInfo As string
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="AcceptFocus"
			Visible=true
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AcceptTabs"
			Visible=true
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AutoDeactivate"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Backdrop"
			Visible=true
			Group="Appearance"
			Type="Picture"
			EditorType="Picture"
			InheritedFrom="canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DoubleBuffer"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			InheritedFrom="canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Enabled"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="EraseBackground"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
			InheritedFrom="canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HelpTag"
			Visible=true
			Group="Appearance"
			Type="String"
			EditorType="MultiLineEditor"
			InheritedFrom="canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			Type="Integer"
			InheritedFrom="canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="InitialParent"
			InheritedFrom="canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			Type="Integer"
			InheritedFrom="canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockBottom"
			Visible=true
			Group="Position"
			Type="Boolean"
			InheritedFrom="canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockLeft"
			Visible=true
			Group="Position"
			Type="Boolean"
			InheritedFrom="canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockRight"
			Visible=true
			Group="Position"
			Type="Boolean"
			InheritedFrom="canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockTop"
			Visible=true
			Group="Position"
			Type="Boolean"
			InheritedFrom="canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
			InheritedFrom="canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InheritedFrom="canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabIndex"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			InheritedFrom="canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabPanelIndex"
			Group="Position"
			InitialValue="0"
			Type="Integer"
			InheritedFrom="canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabStop"
			Visible=true
			Group="Position"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Text"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextSelectionInfo"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			Type="Integer"
			InheritedFrom="canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="UseFocusRing"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Visible"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Width"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
			InheritedFrom="canvas"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
