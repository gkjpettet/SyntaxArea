#tag Class
Protected Class TokenStyle
	#tag Method, Flags = &h0
		Sub Constructor()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(textColor As Color, bold As Boolean = False, italic As Boolean = False, underline As Boolean = False, backColor As Color = &c0, hasBackColor As Boolean = False)
		  Self.TextColor = textColor
		  Self.Bold = bold
		  Self.Italic = italic
		  Self.Underline = underline
		  Self.BackColor = backColor
		  Self.HasBackColor = hasBackColor
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 437265617465732061206E657720746F6B656E207374796C652066726F6D20612064696374696F6E6172792E20546865206C61796F7574206F66207468652064696374696F6E6172792073686F756C64206D61746368207468617420697320637265617465642062792070617273696E67204A534F4E2066726F6D2060546F6B656E5374796C652E546F4A534F4E2829602E
		Shared Function FromDictionary(d As Dictionary) As SyntaxArea.TokenStyle
		  /// Creates a new token style from a dictionary.
		  /// The layout of the dictionary should match that is created by parsing JSON from `TokenStyle.ToJSON()`.
		  
		  Var style As New SyntaxArea.TokenStyle
		  
		  style.TextColor = d.Lookup("textColor", Color.Black)
		  style.BackColor = d.Lookup("backColor", Color.Black)
		  style.HasBackColor = d.Lookup("hasBackColor", False)
		  style.Bold = d.Lookup("bold", False)
		  style.Italic = d.Lookup("italic", False)
		  style.Underline = d.Lookup("underline", False)
		  
		  Return style
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E73206120546F6B656E5374796C652066726F6D20697473204A534F4E20726570726573656E746174696F6E2E
		Shared Function FromJSON(json As String) As SyntaxArea.TokenStyle
		  /// Returns a TokenStyle from its JSON representation.
		  ///
		  /// All keys are optional.
		  ///
		  /// ```json
		  /// {
		  /// "textColor" : COLOR,
		  /// "backColor" : COLOR,
		  /// "hasBackColor" : BOOLEAN,
		  /// "bold" : BOOLEAN,
		  /// "italic" : BOOLEAN,
		  /// "underline" : BOOLEAN
		  /// }
		  /// ```
		  
		  Var d As Dictionary
		  Try
		    d = ParseJSON(json)
		  Catch e As JSONException
		    Raise New InvalidArgumentException("Invalid JSON: " + e.Message)
		  End Try
		  
		  Var style As New SyntaxArea.TokenStyle
		  
		  style.TextColor = d.Lookup("textColor", Color.Black)
		  style.BackColor = d.Lookup("backColor", Color.Black)
		  style.HasBackColor = d.Lookup("hasBackColor", False)
		  style.Bold = d.Lookup("bold", False)
		  style.Italic = d.Lookup("italic", False)
		  style.Underline = d.Lookup("underline", False)
		  
		  Return style
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E7320612064696374696F6E61727920726570726573656E746174696F6E206F662074686973207374796C6520666F72207573652077697468204A534F4E2073657269616C69736174696F6E2E
		Function ToDictionary() As Dictionary
		  /// Returns a dictionary representation of this style for use with JSON serialisation.
		  
		  Var d As New Dictionary
		  
		  d.Value("textColor") = TextColor
		  d.Value("backColor") = BackColor
		  d.Value("hasBackColor") = HasBackColor
		  d.Value("bold") = Bold
		  d.Value("italic") = Italic
		  d.Value("underline") = Underline
		  
		  Return d
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E732061204A534F4E206F626A65637420726570726573656E746174696F6E206F66207468697320746F6B656E207374796C652E
		Function ToJSON() As String
		  /// Returns a JSON object representation of this token style.
		  ///
		  ///
		  /// ```json
		  /// {
		  /// "textColor" : COLOR,
		  /// "backColor" : COLOR,
		  /// "hasBackColor" : BOOLEAN,
		  /// "bold" : BOOLEAN,
		  /// "italic" : BOOLEAN,
		  /// "underline" : BOOLEAN
		  /// }
		  /// ```
		  
		  Var json As New Dictionary( _
		  "textColor" : Self.TextColor.ToString, _
		  "backColor" : Self.BackColor.ToString, _
		  "hasBackColor" : HasBackColor, _
		  "bold" : Self.Bold, _
		  "italic" : Self.Italic, _
		  "underline" : Self.Underline _
		  )
		  
		  Return GenerateJSON(json)
		  
		End Function
	#tag EndMethod


	#tag Note, Name = About
		Represents a visual style for a token. 
		
		Tokens are defined within a highlight definition.
		
		The editor maintains a dictionary of token names mapped to styles. These are defined within an editor's theme.
		
		The editor also has a "default" token style that is used for non-matched text and for tokens in the definition
		that specify a token name but a matching style is not defined within the editor's token styles.
		
	#tag EndNote


	#tag Property, Flags = &h0, Description = 5468697320746F6B656E2773206261636B67726F756E6420636F6C6F75722E
		BackColor As Color
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 49662054727565207468656E207468697320746F6B656E2077696C6C20626520626F6C642E
		Bold As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 49662054727565207468656E207468697320746F6B656E2077696C6C207573652069747320737065636966696564206261636B67726F756E6420636F6C6F75722E
		HasBackColor As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 49662054727565207468656E207468697320746F6B656E2077696C6C206265206974616C6963697365642E
		Italic As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 5468697320746F6B656E2773207465787420636F6C6F75722E
		TextColor As Color
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
		#tag ViewProperty
			Name="BackColor"
			Visible=false
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Bold"
			Visible=false
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Italic"
			Visible=false
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
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
			Name="Underline"
			Visible=false
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="HasBackColor"
			Visible=false
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
