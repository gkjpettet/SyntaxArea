#tag Class
Protected Class TokenStyle
	#tag Method, Flags = &h0
		Sub Constructor(textColor As ColorGroup, bold As Boolean = False, italic As Boolean = False, underline As Boolean = False, backColor As ColorGroup = Nil)
		  Self.TextColor = textColor
		  Self.Bold = bold
		  Self.Italic = italic
		  Self.Underline = underline
		  Self.BackColor = If(backColor = Nil, New ColorGroup(&c000001, &c000001), backColor)
		  
		End Sub
	#tag EndMethod


	#tag Note, Name = About
		Represents a visual style for a token. 
		
		Tokens are defined within a highlight definition.
		
		The editor maintains a dictionary of token names mapped to styles. These are defined within an editor's theme.
		
		The editor also has a "default" token style that is used for non-matched text and for tokens in the definition
		that specify a token name but a matching style is not defined within the editor's token styles.
		
	#tag EndNote


	#tag Property, Flags = &h0, Description = 5468697320746F6B656E2773206261636B67726F756E6420636F6C6F75722E
		BackColor As ColorGroup
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 49662054727565207468656E207468697320746F6B656E2077696C6C20626520626F6C642E
		Bold As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 49662054727565207468656E207468697320746F6B656E2077696C6C206265206974616C6963697365642E
		Italic As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 5468697320746F6B656E2773207465787420636F6C6F75722E
		TextColor As ColorGroup
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 49662054727565207468656E207468697320746F6B656E2077696C6C20626520756E6465726C696E65642E
		Underline As Boolean = False
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
	#tag EndViewBehavior
End Class
#tag EndClass
