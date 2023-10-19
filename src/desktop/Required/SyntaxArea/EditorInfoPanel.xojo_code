#tag Class
Protected Class EditorInfoPanel
Inherits DesktopCanvas
	#tag CompatibilityFlags = ( TargetDesktop and ( Target32Bit or Target64Bit ) )
	#tag Event
		Function MouseDown(x As Integer, y As Integer) As Boolean
		  If SymbolHitBounds.Contains(x, y) Then
		    Return ShowSymbolMenu
		  Else
		    Return False
		  End If
		  // 
		  // If x < SelectionInfoWidth Or x > SelectionInfoWidth + SymbolsWidth Then Return False
		  // 
		  // Return ShowSymbolMenu
		  
		End Function
	#tag EndEvent

	#tag Event
		Sub Paint(g As Graphics, areas() As Rect)
		  #Pragma Unused areas
		  
		  Repaint(g)
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Repaint(g As Graphics)
		  // Background.
		  g.DrawingColor = BackColor
		  g.FillRectangle(0, 0, g.Width, g.Height)
		  
		  g.FontName = FontName
		  g.FontSize = FontSize
		  
		  Const HPADDING = 5
		  
		  // Compute the width of the current symbol name or placeholder text.
		  Var symbolW As Integer = g.TextWidth(Self.Text)
		  
		  // Compute the cursor string.
		  Var cursorText As String = SelectionStartLine.ToString + ":" + SelectionStart.ToString + _
		  If(SelectionLength > 0, "(" + SelectionLength.ToString + ")", "")
		  
		  // Compute the width of the cursor string.
		  Var cursorW As Integer = g.TextWidth(cursorText)
		  
		  // Compute the text baseline.
		  Var y As Double = (g.Height + g.FontAscent) / 2 - 1
		  
		  // Compute the x coordinate of the left edge of the cursor text.
		  Var cursorX As Double = g.Width - HPADDING - cursorW
		  
		  g.DrawingColor = TextColor
		  
		  // Draw the cursor info.
		  g.DrawText(cursorText, cursorX, y)
		  
		  // Compute the left edge of the symbol name.
		  Var symbolX As Double = cursorX - (2 * HPADDING) - symbolW
		  
		  // Draw the symbol name.
		  g.DrawText(Self.Text, symbolX, y)
		  
		  // Draw vertical bars either side of the symbol name.
		  g.DrawingColor = TextColor
		  g.DrawLine(symbolX - HPADDING, 0, symbolX - HPADDING, g.Height) // Left.
		  g.DrawLine(cursorX - HPADDING, 0, cursorX - HPADDING, g.Height) // Right.
		  
		  // Compute the hit bounds for the symbol name.
		  SymbolHitBounds = New Rect(symbolX - HPADDING, 0, symbolW + (2 * HPADDING), g.Height)
		  
		  // Borders.
		  If HasTopBorder Then
		    g.DrawingColor = TopBorderColor
		    g.DrawLine(0, 0, g.Width, 0)
		  End If
		  If HasBottomBorder Then
		    g.DrawingColor = BottomBorderColor
		    g.DrawLine(0, g.Height - 1, g.Width, g.Height - 1)
		  End If
		  If HasLeftBorder Then
		    g.DrawingColor = LeftBorderColor
		    g.DrawLine(0, 0, 0, g.Height)
		  End If
		  If HasRightBorder Then
		    g.DrawingColor = RightBorderColor
		    g.DrawLine(g.Width - 1, 0, g.Width - 1, g.Height)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function ShowSymbolMenu() As Boolean
		  // Request the available symbols.
		  Var symbols() As SyntaxArea.DocumentSymbol = GetSymbols
		  
		  // If there are no symbols then there's nothing to do.
		  If symbols Is Nil Or symbols.LastIndex < 0 Then Return False
		  
		  // Get the offsets of the symbols.
		  Var symbolOffsets() As Integer
		  For Each symbol As SyntaxArea.DocumentSymbol In symbols
		    symbolOffsets.Add(symbol.Offset)
		  Next symbol
		  
		  // Sort the symbols by offset.
		  symbolOffsets.SortWith(symbols)
		  
		  // Construct the menu to display.
		  // Each menu entry's title will be the symbol name and it's tag the document symbol.
		  Var menu As New DesktopMenuItem
		  Var entry As DesktopMenuItem
		  For Each symbol As SyntaxArea.DocumentSymbol In symbols
		    entry = New DesktopMenuItem(symbol.Name)
		    entry.Tag = symbol
		    
		    If CurrentSymbol <> Nil Then
		      entry.HasCheckMark = symbol.Offset = currentSymbol.Offset
		    End If
		    
		    menu.AddMenu(entry)
		  Next symbol
		  
		  // Find the window where this control is since the control can be buried within container controls.
		  Var container As DesktopWindow
		  Var locx, locy As Integer
		  locx = SymbolHitBounds.Left
		  locy = Me.Top + SymbolHitBounds.Top
		  container = Me.Window
		  While True
		    locx = locx + Container.Left
		    locy = locy + Container.Top
		    If container IsA DesktopContainer Then
		      container = DesktopContainer(container).Window
		    ElseIf container IsA DesktopWindow Then
		      Exit
		    End If
		  Wend
		  
		  // Present the menu.
		  menu = menu.PopUp(locx, locy)
		  If menu = Nil Then Return True
		  
		  // Set the current symbol to the selected symbol.
		  currentSymbol = menu.Tag
		  RaiseEvent SymbolSelected(currentSymbol)
		  
		  Return True
		  
		End Function
	#tag EndMethod


	#tag Hook, Flags = &h0, Description = 54686520636F6E74726F6C2069732072657175657374696E6720616E206172726179206F6620646F63756D656E742073796D626F6C7320746F20646973706C61792E
		Event GetSymbols() As SyntaxArea.DocumentSymbol()
	#tag EndHook

	#tag Hook, Flags = &h0, Description = 412073796D626F6C207761732073656C656374656420696E2074686520636F6E74726F6C2E
		Event SymbolSelected(symbol as SyntaxArea.DocumentSymbol)
	#tag EndHook


	#tag ComputedProperty, Flags = &h0, Description = 546865206261636B67726F756E6420636F6C6F75722E
		#tag Getter
			Get
			  Return mBackColor
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mBackColor = value
			  Self.Refresh
			  
			End Set
		#tag EndSetter
		BackColor As ColorGroup
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0, Description = 54686520636F6C6F7572206F6620746865206F7074696F6E616C20626F74746F6D20626F726465722E
		#tag Getter
			Get
			  Return mBottomBorderColor
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mBottomBorderColor = value
			  Self.Refresh
			  
			End Set
		#tag EndSetter
		BottomBorderColor As ColorGroup
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mCurrentSymbol
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mCurrentsymbol = value
			  Self.Refresh
			End Set
		#tag EndSetter
		CurrentSymbol As SyntaxArea.DocumentSymbol
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0, Description = 546865206E616D65206F662074686520666F6E7420746F2075736520696E2074686520636F6E74726F6C2E
		#tag Getter
			Get
			  Return mFontName
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mFontName = value
			  Self.Refresh
			  
			End Set
		#tag EndSetter
		FontName As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0, Description = 5468652073697A65206F662074686520666F6E7420746F2075736520696E2074686520636F6E74726F6C2E
		#tag Getter
			Get
			  Return mFontSize
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mFontSize = value
			  Self.Refresh
			  
			End Set
		#tag EndSetter
		FontSize As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0, Description = 49662054727565207468656E206120626F726465722077696C6C20626520647261776E20616C6F6E672074686520626F74746F6D20656467652E
		#tag Getter
			Get
			  Return mHasBottomBorder
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mHasBottomBorder = value
			  Self.Refresh
			  
			End Set
		#tag EndSetter
		HasBottomBorder As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0, Description = 49662054727565207468656E206120626F726465722077696C6C20626520647261776E20616C6F6E6720746865206C65667420656467652E
		#tag Getter
			Get
			  Return mHasLeftBorder
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mHasLeftBorder = value
			  Self.Refresh
			  
			End Set
		#tag EndSetter
		HasLeftBorder As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0, Description = 49662054727565207468656E206120626F726465722077696C6C20626520647261776E20616C6F6E672074686520726967687420656467652E
		#tag Getter
			Get
			  Return mHasRightBorder
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mHasRightBorder = value
			  Self.Refresh
			  
			End Set
		#tag EndSetter
		HasRightBorder As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0, Description = 49662054727565207468656E206120626F726465722077696C6C20626520647261776E20616C6F6E672074686520746F7020656467652E
		#tag Getter
			Get
			  Return mHasTopBorder
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mHasTopBorder = value
			  Self.Refresh
			  
			End Set
		#tag EndSetter
		HasTopBorder As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0, Description = 54686520636F6C6F7572206F6620746865206F7074696F6E616C206C65667420626F726465722E
		#tag Getter
			Get
			  Return mLeftBorderColor
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mLeftBorderColor = value
			  Self.Refresh
			  
			End Set
		#tag EndSetter
		LeftBorderColor As ColorGroup
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mBackColor As ColorGroup
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mBottomBorderColor As ColorGroup
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mCurrentSymbol As SyntaxArea.DocumentSymbol
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mFontName As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mFontSize As Integer = 10
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mHasBottomBorder As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mHasLeftBorder As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mHasRightBorder As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mHasTopBorder As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mLeftBorderColor As ColorGroup
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mRightBorderColor As ColorGroup
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mSelectionLength As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mSelectionStart As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mSelectionStartLine As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mTextColor As ColorGroup
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mTopBorderColor As ColorGroup
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0, Description = 54686520636F6C6F7572206F6620746865206F7074696F6E616C20726967687420626F726465722E
		#tag Getter
			Get
			  Return mRightBorderColor
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mRightBorderColor = value
			  Self.Refresh
			  
			End Set
		#tag EndSetter
		RightBorderColor As ColorGroup
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0, Description = 546865206C656E6774682028696E206368617261637465727329206F66207468652063757272656E742073656C656374696F6E20696E2074686520656469746F722E
		#tag Getter
			Get
			  Return mSelectionLength
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mSelectionLength = value
			  Self.Refresh
			  
			End Set
		#tag EndSetter
		SelectionLength As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0, Description = 54686520636F6C756D6E2074686174207468652063757272656E7420656469746F722073656C656374696F6E207374617274732061742E
		#tag Getter
			Get
			  Return mSelectionStart
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mSelectionStart = value
			  Self.Refresh
			  
			End Set
		#tag EndSetter
		SelectionStart As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0, Description = 546865206C696E6520696E2074686520656469746F722074686174207468652073656C656374696F6E207374617274732061742E
		#tag Getter
			Get
			  Return mSelectionStartLine
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mSelectionStartLine = value
			  Self.Refresh
			  
			End Set
		#tag EndSetter
		SelectionStartLine As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h21, Description = 54686520626F756E64696E6720626F782074686520666F72207468652073796D626F6C206E616D652E
		Private SymbolHitBounds As Rect
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0, Description = 546865207465787420746F20646973706C617920696E207468652073796D626F6C20617265612E
		#tag Getter
			Get
			  If currentSymbol = Nil Then Return "<No selected symbol>"
			  
			  Return currentSymbol.Name
			End Get
		#tag EndGetter
		Text As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0, Description = 54686520636F6C6F757220746F2075736520666F72207465787420696E2074686520636F6E74726F6C2E
		#tag Getter
			Get
			  Return mTextColor
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mTextColor = value
			  Self.Refresh
			  
			End Set
		#tag EndSetter
		TextColor As ColorGroup
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0, Description = 54686520636F6C6F7572206F6620746865206F7074696F6E616C20746F7020626F726465722E
		#tag Getter
			Get
			  Return mTopBorderColor
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mTopBorderColor = value
			  Self.Refresh
			  
			End Set
		#tag EndSetter
		TopBorderColor As ColorGroup
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
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
			Name="Height"
			Visible=true
			Group="Position"
			InitialValue="18"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockBottom"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockLeft"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockRight"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockTop"
			Visible=true
			Group="Position"
			InitialValue=""
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
			Name="TabStop"
			Visible=true
			Group="Position"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Width"
			Visible=true
			Group="Position"
			InitialValue="250"
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
			Name="Tooltip"
			Visible=true
			Group="Appearance"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowFocusRing"
			Visible=true
			Group="Appearance"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Backdrop"
			Visible=true
			Group="Appearance"
			InitialValue=""
			Type="Picture"
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
			Name="Visible"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="HasTopBorder"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="HasBottomBorder"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="HasLeftBorder"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="HasRightBorder"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="BackColor"
			Visible=true
			Group="Appearance"
			InitialValue=""
			Type="ColorGroup"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="FontName"
			Visible=true
			Group="Appearance"
			InitialValue="SmallSystem"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="FontSize"
			Visible=true
			Group="Appearance"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TopBorderColor"
			Visible=true
			Group="Appearance"
			InitialValue=""
			Type="ColorGroup"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="BottomBorderColor"
			Visible=true
			Group="Appearance"
			InitialValue=""
			Type="ColorGroup"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LeftBorderColor"
			Visible=true
			Group="Appearance"
			InitialValue=""
			Type="ColorGroup"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="RightBorderColor"
			Visible=true
			Group="Appearance"
			InitialValue=""
			Type="ColorGroup"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowFocus"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowTabs"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Transparent"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
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
			Name="SelectionStartLine"
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
			Name="SelectionLength"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextColor"
			Visible=true
			Group="Behavior"
			InitialValue=""
			Type="ColorGroup"
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
	#tag EndViewBehavior
End Class
#tag EndClass
