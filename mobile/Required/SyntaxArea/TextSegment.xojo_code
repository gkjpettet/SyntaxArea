#tag Class
Protected Class TextSegment
Inherits SyntaxArea.DataRange
	#tag CompatibilityFlags = ( TargetConsole and ( Target32Bit or Target64Bit ) ) or ( TargetWeb and ( Target32Bit or Target64Bit ) ) or ( TargetDesktop and ( Target32Bit or Target64Bit ) ) or ( TargetIOS and ( Target64Bit ) ) or ( TargetAndroid and ( Target64Bit ) )
	#tag Method, Flags = &h0, Description = 52657475726E73206120636C6F6E65206F6620746869732074657874207365676D656E742E
		Function Clone() As SyntaxArea.TextSegment
		  /// Returns a clone of this text segment.
		  
		  Var tmp As New SyntaxArea.TextSegment
		  tmp.BackgroundColor = Self.BackgroundColor
		  tmp.Bold = Self.Bold
		  tmp.HasBackgroundColor = Self.HasBackgroundColor
		  tmp.Italic = Self.Italic
		  tmp.LastFont = Self.LastFont
		  tmp.LastSize = Self.LastSize
		  tmp.TextColor = Self.TextColor
		  tmp.Type = Self.Type
		  tmp.Underline = Self.Underline
		  tmp.Width = Self.Width
		  tmp.Offset = Self.Offset
		  tmp.Length = Self.Length
		  
		  Return tmp
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  Constructor(0, 0, 0)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(offset As Integer, length As Integer, type As Integer, highlightColor As Color = &c0, backgroundColor As Color = &c0, bold As Boolean = False, italic As Boolean = False, underline As Boolean = False, hasBackgroundColor As Boolean = False)
		  Super.Constructor(offset, length)
		  Self.Type = type
		  Self.TextColor = highlightColor
		  Self.BackgroundColor = backgroundColor
		  Self.HasBackgroundColor = hasBackgroundColor
		  Self.Bold = bold
		  Self.Italic = italic
		  Self.Underline = underline
		  Self.Width = -1
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SplitAtLength(length As Integer) As SyntaxArea.TextSegment
		  Var tmp As SyntaxArea.TextSegment = Clone
		  tmp.Offset = tmp.Offset + length
		  tmp.Length = Self.Length - length
		  tmp.Width = -1
		  Self.Length = length
		  Self.Width = -1
		  
		  Return tmp
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		BackgroundColor As Color
	#tag EndProperty

	#tag Property, Flags = &h0
		Bold As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		HasBackgroundColor As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h0
		ID As String
	#tag EndProperty

	#tag Property, Flags = &h0
		Italic As Boolean
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected LastFont As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected LastSize As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		TextColor As Color
	#tag EndProperty

	#tag Property, Flags = &h0
		Type As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		Underline As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		Width As Double
	#tag EndProperty


	#tag Constant, Name = TYPE_EOL, Type = Double, Dynamic = False, Default = \"3", Scope = Public
	#tag EndConstant

	#tag Constant, Name = TYPE_PLACEHOLDER, Type = Double, Dynamic = False, Default = \"4", Scope = Public
	#tag EndConstant

	#tag Constant, Name = TYPE_SPACE, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = TYPE_TAB, Type = Double, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = TYPE_WORD, Type = Double, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="BackgroundColor"
			Visible=false
			Group="Behavior"
			InitialValue="&h000000"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Bold"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="HasBackgroundColor"
			Visible=false
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ID"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
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
			Name="Italic"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
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
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Type"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Underline"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Width"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Double"
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
	#tag EndViewBehavior
End Class
#tag EndClass
