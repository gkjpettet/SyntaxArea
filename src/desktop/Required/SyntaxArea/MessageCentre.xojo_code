#tag Class
Protected Class MessageCentre
	#tag Method, Flags = &h0, Description = 52657475726E7320547275652069662061206D657373616765206D61746368696E67207468652070617373656420706172616D657465727320697320666F756E6420696E207468652071756575652E
		Shared Function IsMessageInQueue(type As Variant, infoKey As Variant, infoValue As Variant) As Boolean
		  /// Returns True if a message matching the passed parameters is found in the queue.
		  
		  If Queue <> Nil Then
		    Return Queue.FindMessageInQueue(type, infoKey, infoValue) <> Nil
		  End If
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 49662061206D657373616765206D61746368696E67207468652070617373656420706172616D657465727320697320666F756E6420696E207468652071756575652069742069732072657475726E65642E204F74686572776973652C204E696C2069732072657475726E65642E
		Shared Function MessageInQueue(type As Variant, matchInfoKey As Variant, matchInfoValue As Variant) As Message
		  /// If a message matching the passed parameters is found in the queue it is returned.
		  /// Otherwise, Nil is returned.
		  
		  If Queue <> Nil Then
		    Return Queue.FindMessageInQueue(type, matchInfoKey, matchInfoValue)
		  End If
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 5175657565732061206D65737361676520666F722064697370617463682E
		Shared Sub QueueMessage(m As Message)
		  /// Queues a message for dispatch.
		  
		  // If there are no receivers registered then bail.
		  If ReceiversForType = Nil Then Return
		  
		  // Sanity check.
		  If m = Nil Then Return
		  
		  If Queue = Nil Then Queue = New SyntaxArea.MessageQueue
		  
		  Queue.AddMessage(m)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 53656E64732074686520706173736564206D65737361676520696D6D6564696174656C792E
		Shared Sub SendMessage(m As Message)
		  /// Sends the passed message immediately.
		  
		  #Pragma DisableBackgroundTasks
		  #Pragma DisableBoundsChecking
		  
		  If ReceiversForType = Nil Then Return
		  
		  Var type As Variant = m.MessageType
		  
		  // Ensure there are receivers registered for a message of this type.
		  If Not ReceiversForType.HasKey(type) Then Return
		  
		  // Get the receivers for this message type.
		  Var receivers As Dictionary = ReceiversForType.value(type)
		  
		  // Send to all receivers of this type.
		  For Each receiver As SyntaxArea.MessageReceiver In receivers.Keys
		    receiver.ReceiveMessage(m)
		  Next receiver
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21, Description = 546865207175657565206F66206D6573736167657320746F2073656E642E204C6F77657220696E646578206D65737361676573206172652073656E742066697273742E
		Private Shared Queue As MessageQueue
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 412064696374696F6E617279206F6620726563656976657273207265676973746572656420746F2072656365697665206D65737361676573206F66206120706172746963756C617220747970652E204B6579203D206D65737361676520747970652C2056616C7565203D2044696374696F6E6172792E205468652056616C756527732064696374696F6E6172792773206B65797320617265207468652061637475616C207265636569766572206F626A656374732E
		Shared ReceiversForType As Dictionary
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
