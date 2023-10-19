#tag Interface
Protected Interface UndoableAction
	#tag Method, Flags = &h0, Description = 41206465736372697074696F6E206F66207468697320616374696F6E2E
		Function Description() As String
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 5365747320746865206465736372697074696F6E206F66207468697320616374696F6E2E
		Sub Description(Assigns s As String)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function EventID() As Integer
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub EventID(Assigns value As Integer)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Redo()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Undo()
		  
		End Sub
	#tag EndMethod


	#tag ViewBehavior
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
End Interface
#tag EndInterface
