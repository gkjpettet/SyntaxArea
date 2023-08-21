#tag Interface
Protected Interface IBufferStorage
	#tag Method, Flags = &h0, Description = 436F706965732061206C656E677468206F6620746578742066726F6D2060736F757263656020746F2074686973206275666665722E
		Sub Copy(source As SyntaxArea.IBufferStorage, fromIndex As Integer, localIndex As Integer, length As Integer)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E73207468652073697A65206F6620746869732073746F72616765206275666665722E
		Function Size() As Integer
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 53657473207468652073697A65206F6620746869732073746F72616765206275666665722E
		Sub Size(Assigns length As Integer)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E732074686520737472696E672076616C7565206F6620746865206461746120626567696E6E696E672061742060696E6465786020666F7220606C656E6774686020636861726163746572732E
		Function StringValue(index As Integer, length As Integer) As String
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 41737369676E7320616E2061726561206F66207468652073746F7261676520746F207468652070617373656420537472696E672076616C75652E
		Sub StringValue(index As Integer, length As Integer, Assigns value As String)
		  
		End Sub
	#tag EndMethod


	#tag Note, Name = About
		The SyntaxArea.GapBuffer class can be backed by any storage buffer that implements this interface.
		
	#tag EndNote


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
