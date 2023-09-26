#tag Module
Protected Module MessageCentre
	#tag Method, Flags = &h1, Description = 52657475726E7320547275652069662061206D657373616765206D61746368696E67207468652070617373656420706172616D657465727320697320666F756E6420696E207468652071756575652E
		Protected Function IsMessageInQueue(type As Variant, infoKey As Variant, infoValue As Variant) As Boolean
		  /// Returns True if a message matching the passed parameters is found in the queue.
		  
		  If Queue <> Nil Then
		    Return Queue.FindMessageInQueue(type, infoKey, infoValue) <> Nil
		  End If
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1, Description = 49662061206D657373616765206D61746368696E67207468652070617373656420706172616D657465727320697320666F756E6420696E207468652071756575652069742069732072657475726E65642E204F74686572776973652C204E696C2069732072657475726E65642E
		Protected Function MessageInQueue(type As Variant, matchInfoKey As Variant, matchInfoValue As Variant) As MessageCentre.Message
		  /// If a message matching the passed parameters is found in the queue it is returned.
		  /// Otherwise, Nil is returned.
		  
		  If Queue <> Nil Then
		    Return Queue.FindMessageInQueue(type, matchInfoKey, matchInfoValue)
		  End If
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1, Description = 5175657565732061206D65737361676520666F722064697370617463682E
		Protected Sub QueueMessage(m As MessageCentre.Message)
		  /// Queues a message for dispatch.
		  
		  // If there are no receivers registered then bail.
		  If ReceiversForType = Nil Then Return
		  
		  // Sanity check.
		  If m = Nil Then Return
		  
		  If Queue = Nil Then Queue = New MessageCentre.MessageQueue
		  
		  Queue.AddMessage(m)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 5265676973746572732061206D65737361676520726563656976657220666F722061207370656369666963206D65737361676520747970652E
		Sub RegisterForMessage(Extends theReceiver As MessageCentre.MessageReceiver, messageType As Variant)
		  /// Registers a message receiver for a specific message type.
		  
		  If ReceiversForType = Nil Then
		    ReceiversForType = New Dictionary
		  End If
		  
		  // Get the dictionary of receivers for this message type or create a temporary one.
		  Var d As Dictionary
		  If ReceiversForType.HasKey(messageType) Then
		    d = ReceiversForType.Value(messageType)
		  Else
		    d = New Dictionary
		    ReceiversForType.Value(messageType) = d
		  End If
		  
		  // Store this receiver as a key in the dictionary. The value is ignored.
		  d.Value(theReceiver) = False
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1, Description = 53656E64732074686520706173736564206D65737361676520696D6D6564696174656C792E
		Protected Sub SendMessage(m As MessageCentre.Message)
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
		  For Each receiver As MessageCentre.MessageReceiver In receivers.Keys
		    receiver.ReceiveMessage(m)
		  Next receiver
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 556E726567697374657273206120726563656976657220666F72206120706172746963756C6172206D65737361676520747970652E20546869732077696C6C2073746F7020746865206D6573736167652063656E7472652066726F6D2073656E64696E67206D65737361676573206F662074686973207479706520746F2074686520726563656976657220696E20746865206675747572652E
		Sub UnregisterForMessage(Extends theReceiver As MessageCentre.MessageReceiver, messageType As Variant)
		  /// Unregisters a receiver for a particular message type. This will stop the message 
		  /// centre from sending messages of this type to the receiver in the future.
		  
		  // No receivers?
		  If ReceiversForType = Nil Then Return
		  
		  // No such message?
		  If Not ReceiversForType.HasKey(messageType) Then Return
		  
		  // Remove receiver.
		  Var receivers As Dictionary = ReceiversForType.Value(messageType)
		  
		  // If our list of receivers for this message type contains this receiver then we
		  // need to remove it.
		  If Not receivers.HasKey(theReceiver) Then
		    Return
		  Else
		    receivers.Remove(theReceiver)
		  End If
		  
		  // If there are no longer any receivers registered for this message type
		  // we can remove the type from our dictionary.
		  If receivers.KeyCount = 0 Then ReceiversForType.Remove(messageType)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 556E72656769737465727320612072656365697665722066726F6D20616C6C206D6573736167652074797065732E
		Sub UnregisterReceiver(Extends theReceiver As MessageCentre.MessageReceiver)
		  /// Unregisters a receiver from all message types.
		  
		  // No receivers?
		  If ReceiversForType = Nil Then Return
		  
		  // Find the object within our registered receivers.
		  Var receivers As Dictionary
		  Var typesToRemove() As Variant
		  Var type As Variant
		  
		  For i As Integer = 0 To ReceiversForType.KeyCount - 1
		    // Message type.
		    type = ReceiversForType.Key(i)
		    
		    // Get the receivers for this message type.
		    receivers = ReceiversForType.Value(type)
		    
		    If Not receivers.HasKey(theReceiver) Then Continue For
		    
		    receivers.Remove(theReceiver)
		    
		    If receivers.KeyCount = 0 Then typesToRemove.Add(type)
		  Next i
		  
		  // Remove any message types that no longer have any receivers listening.
		  For Each type In typesToRemove
		    If ReceiversForType.HasKey(type) Then ReceiversForType.Remove(Type)
		  Next type
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21, Description = 546865207175657565206F66206D6573736167657320746F2073656E642E204C6F77657220696E646578206D65737361676573206172652073656E742066697273742E
		Private Queue As MessageCentre.MessageQueue
	#tag EndProperty

	#tag Property, Flags = &h21, Description = 412064696374696F6E617279206F6620726563656976657273207265676973746572656420746F2072656365697665206D65737361676573206F66206120706172746963756C617220747970652E204B6579203D206D65737361676520747970652C2056616C7565203D2044696374696F6E6172792E205468652056616C756527732064696374696F6E6172792773206B65797320617265207468652061637475616C207265636569766572206F626A656374732E
		Private ReceiversForType As Dictionary
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
End Module
#tag EndModule
