#tag Module
Protected Module SyntaxArea
	#tag ComputedProperty, Flags = &h1, Description = 54686520656E636F64696E67207573656420696E7465726E616C6C792062792053796E746178417265612E
		#tag Getter
			Get
			  // We must use either UTF-32 or UTF-8 but never UTF-16
			  // because some chars (e.g. "🔍") in UTF-16 return 2 for their
			  // Length, which is incorrect and causes errors with this code.
			  Return Encodings.UTF8
			  
			End Get
		#tag EndGetter
		Protected InternalEncoding As TextEncoding
	#tag EndComputedProperty


	#tag Constant, Name = DebugIndentation, Type = Boolean, Dynamic = False, Default = \"False", Scope = Protected, Description = 53657420746F205472756520696620796F7527726520747279696E6720746F20646562756720696E64656E746174696F6E206973737565732E
	#tag EndConstant

	#tag Constant, Name = TextStorageType, Type = Double, Dynamic = False, Default = \"SyntaxArea.TEXT_STORAGE_MEMORYBLOCK", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = TEXT_STORAGE_ARRAY, Type = Double, Dynamic = False, Default = \"1", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = TEXT_STORAGE_MEMORYBLOCK, Type = Double, Dynamic = False, Default = \"0", Scope = Protected
	#tag EndConstant


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
End Module
#tag EndModule
