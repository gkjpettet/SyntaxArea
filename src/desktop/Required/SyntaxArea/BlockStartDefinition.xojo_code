#tag Class
Protected Class BlockStartDefinition
	#tag Method, Flags = &h0
		Sub Constructor(scanner As RegEx, data As BlockStartData, blockName As String = "")
		  Self.Scanner = scanner
		  Self.Data = data
		  Self.Name = blockName
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		Data As BlockStartData
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 4F7074696F6E616C206E616D6520666F72207468697320626C6F636B2E
		Name As String
	#tag EndProperty

	#tag Property, Flags = &h0
		Scanner As RegEx
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
