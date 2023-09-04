#tag Class
Protected Class EditorTheme
	#tag Method, Flags = &h0, Description = 437265617465732061206E6577207468656D6520696E7374616E6365207769746820736F6D6520726561736F6E61626C652064656661756C74732E
		Sub Constructor()
		  /// Creates a new theme instance with some reasonable defaults.
		  
		  BackColor = New ColorGroup(Color.White, Color.Black)
		  BlockFoldedColor = New ColorGroup(Color.Orange, Color.Orange)
		  BlockFoldedEllipsisColor = New ColorGroup(Color.LightGray, Color.LightGray)
		  BlockFoldMarkerColor = New ColorGroup(Color.DarkGray, Color.DarkGray)
		  BookmarkColor = New ColorGroup(Color.Blue, Color.Blue)
		  BracketHighlightColor = New ColorGroup(Color.Blue, Color.Blue)
		  CaretColor = New ColorGroup(Color.Black, Color.White)
		  DirtyLinesColor = New ColorGroup(Color.Yellow, Color.Yellow)
		  GutterBackColor = New ColorGroup(Color.White, Color.Black)
		  GutterSeparationLineColor = New ColorGroup(Color.Black, Color.White)
		  LineNumbersColor = New ColorGroup(Color.Black, Color.White)
		  VerticalRulerColor = New ColorGroup(Color.LightGray, Color.DarkGray)
		  SuggestionPopupBackColor = New ColorGroup(Color.White, Color.Black)
		  SuggestionPopupSelectedColor = Color.HighlightColor
		  SuggestionPopupTextColor = New ColorGroup(Color.Black, Color.White)
		  TextColor = New ColorGroup(Color.Black, Color.White)
		  TextSelectionColor = Color.HighlightColor
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0, Description = 546865206261636B67726F756E6420636F6C6F7572206F662074686520656469746F722E
		BackColor As ColorGroup
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 54686520636F6C6F7572206F662074686520747269616E676C6520696E6469636174696E67206120666F6C64656420626C6F636B20696E20746865206775747465722E
		BlockFoldedColor As ColorGroup
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 54686520636F6C6F757220746F2075736520666F722074686520656C6C697073697320696E6469636174696E67206120626C6F636B20697320666F6C6465642E
		BlockFoldedEllipsisColor As ColorGroup
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 54686520636F6C6F7572206F662074686520747269616E676C6520666F7220626C6F636B20737461727420616E6420626C6F636B20656E64206D61726B6572732E
		BlockFoldMarkerColor As ColorGroup
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 54686520636F6C6F757220746F2075736520666F7220626F6F6B6D61726B732E
		BookmarkColor As ColorGroup
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 54686520636F6C6F7572207573656420746F20686967686C6967687420627261636B6574732E
		BracketHighlightColor As ColorGroup
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 546865206361726574277320636F6C6F75722E
		CaretColor As ColorGroup
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 54686520636F6C6F757220746F2075736520746F20696E6469636174652061206469727479206C696E652E
		DirtyLinesColor As ColorGroup
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 54686520666F6E7420746F2075736520666F722074686520656469746F7220636F6E74656E74732E
		FontName As String
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 5468652073697A65206F66207468652074657874206F662074686520656469746F72277320636F6E74656E74732E
		FontSize As Integer = SyntaxArea.Editor.DEFAULT_FONT_SIZE
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 546865206261636B67726F756E6420636F6C6F7572206F6620746865206775747465722E
		GutterBackColor As ColorGroup
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 54686520636F6C6F7572206F66207468652072696768742068616E6420626F72646572206F6620746865206775747465722E
		GutterSeparationLineColor As ColorGroup
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 54686520636F6C6F757220746F2075736520666F7220746865206C696E65206E756D626572732E
		LineNumbersColor As ColorGroup
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 54686520666F6E7420746F2075736520666F72206C696E65206E756D626572732E
		LineNumbersFontName As String
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 5468652073697A6520746F2075736520666F72206C696E65206E756D626572732E20466F72206265737420726573756C74732C20757365207468652073616D65206F7220736D616C6C6572207468616E2074686520656469746F72277320466F6E7453697A652E
		LineNumbersFontSize As Integer = SyntaxArea.Editor.DEFAULT_LINE_NUMBERS_FONT_SIZE
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 546865206261636B67726F756E6420636F6C6F7572206F6620746865206175746F636F6D706C6574696F6E2073756767657374696F6E20706F7075702E
		SuggestionPopupBackColor As ColorGroup
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 546865206261636B67726F756E6420636F6C6F7572206F66207468652073656C6563746564206974656D20696E20746865206175746F636F6D706C6574696F6E2073756767657374696F6E20706F7075702E
		SuggestionPopupSelectedColor As ColorGroup
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 546865207465787420636F6C6F757220666F72206F7074696F6E7320696E20746865206175746F636F6D706C6574696F6E2073756767657374696F6E20706F7075702E
		SuggestionPopupTextColor As ColorGroup
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 5468652064656661756C7420636F6C6F7572206F66207465787420696E2074686520656469746F722E
		TextColor As ColorGroup
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 54686520636F6C6F757220746F2075736520666F722073656C656374696F6E20696E2074686520656469746F722E
		TextSelectionColor As ColorGroup
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 49662054727565207468656E20746865206261636B67726F756E6420636F6C6F7572206F66207468652061726561206F662074686520677574746572207768657265206C696E6520666F6C64696E67732061726520646973706C617965642077696C6C206265206C6967687465722E
		UseLighterLineFoldingBackColor As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 54686520636F6C6F757220746F2075736520666F7220746865206F7074696F6E616C20726967687420766572746963616C2072756C65722E
		VerticalRulerColor As ColorGroup
	#tag EndProperty


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
			InitialValue="-2147483648"
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
			Name="BackColor"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="ColorGroup"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="BlockFoldedColor"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="ColorGroup"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="BlockFoldedEllipsisColor"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="ColorGroup"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="BlockFoldMarkerColor"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="ColorGroup"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="BracketHighlightColor"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="ColorGroup"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="BookmarkColor"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="ColorGroup"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="CaretColor"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="ColorGroup"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="DirtyLinesColor"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="ColorGroup"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="GutterSeparationLineColor"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="ColorGroup"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="GutterBackColor"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="ColorGroup"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LineNumbersColor"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="ColorGroup"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="VerticalRulerColor"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="ColorGroup"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="SuggestionPopupBackColor"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="ColorGroup"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="SuggestionPopupSelectedColor"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="ColorGroup"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="SuggestionPopupTextColor"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="ColorGroup"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextColor"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="ColorGroup"
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
			Name="FontName"
			Visible=false
			Group="Behavior"
			InitialValue="System"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="FontSize"
			Visible=false
			Group="Behavior"
			InitialValue="12"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LineNumbersFontSize"
			Visible=false
			Group="Behavior"
			InitialValue="12"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LineNumbersFontName"
			Visible=false
			Group="Behavior"
			InitialValue="System"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="UseLighterLineFoldingBackColor"
			Visible=false
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
