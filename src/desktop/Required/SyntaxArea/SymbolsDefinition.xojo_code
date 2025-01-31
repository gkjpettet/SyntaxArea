#tag Class
Protected Class SymbolsDefinition
	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mRegex
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mRegex = value
			End Set
		#tag EndSetter
		EntryRegex As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0, Description = 5468697320737472696E672077696C6C206265206C656674207472696D6D65642066726F6D207468652073796D626F6C2773206E616D652E
		#tag Getter
			Get
			  Return mLTrim
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mLTrim = value
			End Set
		#tag EndSetter
		LTrim As String
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mLTrim As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mRegex As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mRTrim As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mType As String
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0, Description = 5468697320737472696E672077696C6C206265207269676874207472696D6D65642066726F6D207468652073796D626F6C2773206E616D652E
		#tag Getter
			Get
			  Return mRTrim
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mRTrim = value
			End Set
		#tag EndSetter
		RTrim As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mType
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mType = value
			End Set
		#tag EndSetter
		Type As String
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="EntryRegex"
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
			InitialValue="2147483648"
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
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LTrim"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="RTrim"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
