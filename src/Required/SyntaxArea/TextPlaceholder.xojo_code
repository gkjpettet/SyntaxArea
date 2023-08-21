#tag Class
Protected Class TextPlaceholder
Inherits SyntaxArea.TextSegment
	#tag CompatibilityFlags = ( TargetConsole and ( Target32Bit or Target64Bit ) ) or ( TargetWeb and ( Target32Bit or Target64Bit ) ) or ( TargetDesktop and ( Target32Bit or Target64Bit ) ) or ( TargetIOS and ( Target64Bit ) ) or ( TargetAndroid and ( Target64Bit ) )
	#tag Method, Flags = &h0, Description = 52657475726E73206120636C6F6E65206F662074686973207465787420706C616365686F6C6465722E
		Function Clone() As textsegment
		  /// Returns a clone of this text placeholder.
		  
		  Var tmp As New SyntaxArea.TextPlaceholder(Offset, Length, TextRange.Offset, TextRange.Length, Self.TextColor, BackgroundColor, Bold, Italic, Underline)
		  tmp.LastFont = Self.LastFont
		  tmp.LastSize = Self.LastSize
		  tmp.Type = Self.Type
		  tmp.width = Self.Width
		  tmp.PlaceholderBackgroundColor = Self.PlaceholderBackgroundColor
		  
		  Return tmp
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(offset as integer, length as integer, labelOffset as integer, labelLength as Integer, highlightColor as color, backgroundColor as color, bold as boolean = false, italic as boolean = false, underline as boolean = false)
		  Super.Constructor(offset, length, TextSegment.TYPE_PLACEHOLDER, highlightColor, Color.Black, bold, italic, underline)
		  
		  Self.PlaceholderBackgroundColor = backgroundColor
		  If Self.PlaceholderBackgroundColor = Color.Black Then
		    Self.PlaceholderBackgroundColor = &ce9effa
		  End If
		  
		  TextRange = New SyntaxArea.DataRange(labelOffset, labelLength)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function InRange(offset As Integer) As Boolean
		  Return offset > Self.Offset And offset < Self.Offset + Self.Length
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		PlaceholderBackgroundColor As Color
	#tag EndProperty

	#tag Property, Flags = &h0
		TextRange As SyntaxArea.DataRange
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="DebugDescription"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="EndOffset"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="length"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="offset"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
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
			InitialValue=""
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
			Name="Italic"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextColor"
			Visible=false
			Group="Behavior"
			InitialValue="&h000000"
			Type="Color"
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
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
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
			Name="PlaceholderBackgroundColor"
			Visible=false
			Group="Behavior"
			InitialValue="&h000000"
			Type="Color"
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
	#tag EndViewBehavior
End Class
#tag EndClass
