#tag Class
Protected Class EditorTheme
	#tag Method, Flags = &h0, Description = 437265617465732061206E6577207468656D6520696E7374616E63652E
		Sub Constructor()
		  /// Creates a new theme instance.
		  
		  TokenStyles = New Dictionary
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E7320612064656661756C74206461726B207468656D652E
		Shared Function DefaultDark() As SyntaxArea.EditorTheme
		  /// Returns a default dark theme.
		  
		  Var theme As New SyntaxArea.EditorTheme
		  
		  // =================
		  // Editor colours.
		  // =================
		  theme.BackColor = Color.Black
		  theme.BlockFoldedColor = Color.Orange
		  theme.BlockFoldedEllipsisColor = Color.LightGray
		  theme.BlockFoldMarkerColor = Color.DarkGray
		  theme.BookmarkColor = Color.Blue
		  theme.BracketHighlightColor = Color.Blue
		  theme.CaretColor = Color.White
		  theme.DirtyLinesColor = Color.Yellow
		  theme.GutterBackColor = Color.Black
		  theme.GutterBorderColor = Color.White
		  theme.LineNumbersColor = Color.White
		  theme.VerticalRulerColor =Color.DarkGray
		  theme.SuggestionPopupBackColor = Color.Black
		  theme.SuggestionPopupSelectedTextColor = Color.White
		  theme.SuggestionPopupTextColor = Color.White
		  theme.TextColor = Color.White
		  theme.TextSelectionColor = Color.HighlightColor
		  
		  // =================
		  // Tokens
		  // =================
		  // Default.
		  theme.DefaultTokenStyle = New SyntaxArea.TokenStyle(&cDBE5F1)
		  
		  // Comments.
		  theme.TokenStyles.Value("comment") = New SyntaxArea.TokenStyle(&c798BA1, False, True)
		  
		  // Keywords.
		  theme.TokenStyles.Value("keyword") = New SyntaxArea.TokenStyle(&c78B1F9)
		  
		  // Numbers.
		  theme.TokenStyles.Value("number") = New SyntaxArea.TokenStyle(&cE4CE88)
		  
		  // Strings.
		  theme.TokenStyles.Value("string") = New SyntaxArea.TokenStyle(&cEF8F84)
		  
		  // Types.
		  theme.TokenStyles.Value("type") = New SyntaxArea.TokenStyle(&cC8C8C8)
		  
		  // Identifiers.
		  theme.TokenStyles.Value("identifier") = New SyntaxArea.TokenStyle(&cDBE5F1)
		  theme.TokenStyles.Value("uppercaseIndentifier") = New SyntaxArea.TokenStyle(&c71E5E7)
		  theme.TokenStyles.Value("lowercaseIdentifier") = New SyntaxArea.TokenStyle(&c73E5AF)
		  
		  // Directives.
		  theme.TokenStyles.Value("directive") = New SyntaxArea.TokenStyle(&c945200)
		  
		  // Placeholders.
		  theme.TokenStyles.Value("placeholder") = New SyntaxArea.TokenStyle(Color.White, True, False, False, &c3379F7)
		  
		  Return theme
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E7320612064656661756C74206C69676874207468656D652E
		Shared Function DefaultLight() As SyntaxArea.EditorTheme
		  /// Returns a default light theme.
		  
		  Var theme As New SyntaxArea.EditorTheme
		  
		  // =================
		  // Editor colours.
		  // =================
		  theme.BackColor = Color.White
		  theme.BlockFoldedColor = Color.Orange
		  theme.BlockFoldedEllipsisColor = Color.LightGray
		  theme.BlockFoldMarkerColor = Color.DarkGray
		  theme.BookmarkColor = Color.Blue
		  theme.BracketHighlightColor = Color.Blue
		  theme.CaretColor = Color.Black
		  theme.DirtyLinesColor = Color.Yellow
		  theme.GutterBackColor = Color.White
		  theme.GutterBorderColor = Color.Black
		  theme.LineNumbersColor = Color.Black
		  theme.VerticalRulerColor = Color.LightGray
		  theme.SuggestionPopupBackColor = Color.White
		  theme.SuggestionPopupSelectedTextColor = Color.Black
		  theme.SuggestionPopupTextColor = Color.Black
		  theme.TextColor = Color.Black
		  theme.TextSelectionColor = Color.HighlightColor
		  
		  // =================
		  // Tokens
		  // =================
		  // Default.
		  theme.DefaultTokenStyle = New SyntaxArea.TokenStyle(&c262627)
		  
		  // Comments.
		  theme.TokenStyles.Value("comment") = New SyntaxArea.TokenStyle(&c737373, False, True)
		  
		  // Keywords.
		  theme.TokenStyles.Value("keyword") = New SyntaxArea.TokenStyle(&c255BB2)
		  
		  // Numbers.
		  theme.TokenStyles.Value("number") = New SyntaxArea.TokenStyle(&cC43B64)
		  
		  // Strings.
		  theme.TokenStyles.Value("string") = New SyntaxArea.TokenStyle(&cBC391D)
		  
		  // Types.
		  theme.TokenStyles.Value("type") = New SyntaxArea.TokenStyle(&c262626)
		  
		  // Identifiers.
		  theme.TokenStyles.Value("identifier") = New SyntaxArea.TokenStyle(&c262627)
		  theme.TokenStyles.Value("uppercaseIndentifier") = New SyntaxArea.TokenStyle(&c40822E)
		  theme.TokenStyles.Value("lowercaseIdentifier") = New SyntaxArea.TokenStyle(&c337172)
		  
		  // Directives.
		  theme.TokenStyles.Value("directive") = New SyntaxArea.TokenStyle(&c945200)
		  
		  // Placeholders.
		  theme.TokenStyles.Value("placeholder") = New SyntaxArea.TokenStyle(Color.White, True, False, False, &c3379F7)
		  
		  Return theme
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0, Description = 546865206261636B67726F756E6420636F6C6F7572206F662074686520656469746F722E
		BackColor As Color
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 54686520636F6C6F7572206F662074686520747269616E676C6520696E6469636174696E67206120666F6C64656420626C6F636B20696E20746865206775747465722E
		BlockFoldedColor As Color
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 54686520636F6C6F757220746F2075736520666F722074686520656C6C697073697320696E6469636174696E67206120626C6F636B20697320666F6C6465642E
		BlockFoldedEllipsisColor As Color
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 54686520636F6C6F7572206F662074686520747269616E676C6520666F7220626C6F636B20737461727420616E6420626C6F636B20656E64206D61726B6572732E
		BlockFoldMarkerColor As Color
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 54686520636F6C6F757220746F2075736520666F7220626F6F6B6D61726B732E
		BookmarkColor As Color
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 54686520636F6C6F7572207573656420746F20686967686C6967687420627261636B6574732E
		BracketHighlightColor As Color
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 546865206361726574277320636F6C6F75722E
		CaretColor As Color
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return TokenStyles.Value("*default")
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If value <> Nil Then
			    TokenStyles.Value("*default") = value
			  End If
			  
			End Set
		#tag EndSetter
		DefaultTokenStyle As SyntaxArea.TokenStyle
	#tag EndComputedProperty

	#tag Property, Flags = &h0, Description = 54686520636F6C6F757220746F2075736520746F20696E6469636174652061206469727479206C696E652E
		DirtyLinesColor As Color
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 546865206261636B67726F756E6420636F6C6F7572206F6620746865206775747465722E
		GutterBackColor As Color
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 54686520636F6C6F7572206F66207468652072696768742068616E6420626F72646572206F6620746865206775747465722E
		GutterBorderColor As Color
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 54686520636F6C6F757220746F2075736520666F7220746865206C696E65206E756D626572732E
		LineNumbersColor As Color
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 546865206261636B67726F756E6420636F6C6F7572206F6620746865206175746F636F6D706C6574696F6E2073756767657374696F6E20706F7075702E
		SuggestionPopupBackColor As Color
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 546865206261636B67726F756E6420636F6C6F7572206F66207468652073656C6563746564206974656D20696E20746865206175746F636F6D706C6574696F6E2073756767657374696F6E20706F7075702E
		SuggestionPopupSelectedTextColor As Color
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 546865207465787420636F6C6F757220666F72206F7074696F6E7320696E20746865206175746F636F6D706C6574696F6E2073756767657374696F6E20706F7075702E
		SuggestionPopupTextColor As Color
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 5468652064656661756C7420636F6C6F7572206F66207465787420696E2074686520656469746F722E
		TextColor As Color
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 54686520636F6C6F757220746F2075736520666F722073656C656374696F6E20696E2074686520656469746F722E
		TextSelectionColor As Color
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 4B6579203D20746F6B656E206E616D652028537472696E67292C2056616C7565203D2053796E746178417265612E546F6B656E5374796C652E
		TokenStyles As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 49662054727565207468656E20746865206261636B67726F756E6420636F6C6F7572206F66207468652061726561206F662074686520677574746572207768657265206C696E6520666F6C64696E67732061726520646973706C617965642077696C6C206265206C6967687465722E
		UseLighterLineFoldingBackColor As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 54686520636F6C6F757220746F2075736520666F7220746865206F7074696F6E616C20726967687420766572746963616C2072756C65722E
		VerticalRulerColor As Color
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
			InitialValue="&c000000"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="BlockFoldedColor"
			Visible=false
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="BlockFoldedEllipsisColor"
			Visible=false
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="BlockFoldMarkerColor"
			Visible=false
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="BracketHighlightColor"
			Visible=false
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="BookmarkColor"
			Visible=false
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="CaretColor"
			Visible=false
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="DirtyLinesColor"
			Visible=false
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="GutterBorderColor"
			Visible=false
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="GutterBackColor"
			Visible=false
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LineNumbersColor"
			Visible=false
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="VerticalRulerColor"
			Visible=false
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="SuggestionPopupBackColor"
			Visible=false
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="SuggestionPopupSelectedTextColor"
			Visible=false
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="SuggestionPopupTextColor"
			Visible=false
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextColor"
			Visible=false
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextSelectionColor"
			Visible=false
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
			EditorType=""
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
