#tag Module
Protected Module MessageCentre
	#tag Method, Flags = &h1
		Protected Function IsMessageInQueue(type As Variant, matchInfoKey As Variant, matchInfoValue As Variant) As Boolean
		  If Queue <> Nil Then
		    Return Queue.FindMessageInQueue(type, matchInfoKey, matchInfoValue) <> Nil
		  End If
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function MessageInQueue(type As Variant, matchInfoKey As Variant, matchInfoValue As Variant) As MessageCentre.Message
		  If Queue <> Nil Then
		    Return Queue.FindMessageInQueue(type, matchInfoKey, matchInfoValue)
		  End If
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub QueueMessage(theMessage As MessageCentre.Message)
		  If Messages = Nil Then Return
		  If theMessage = Nil Then Return
		  
		  If Queue = Nil Then Queue = New MessageCentre.MessageQueue
		  
		  Queue.AddMessage(theMessage)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 5265676973746572732061206D65737361676520726563656976657220666F722061207370656369666963206D65737361676520747970652E
		Sub RegisterForMessage(Extends theReceiver As MessageCentre.MessageReceiver, messageType As Variant)
		  /// Registers a message receiver for a specific message type.
		  
		  If Messages = Nil Then
		    Messages = New Dictionary
		  End If
		  
		  Var tmp As Dictionary
		  
		  If Messages.HasKey(messageType) Then
		    tmp = Messages.Value(messageType)
		  Else
		    tmp = New Dictionary
		    Messages.Value(messageType) = tmp
		  End If
		  
		  tmp.Value(theReceiver) = False
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub SendMessage(theMessage As MessageCentre.Message)
		  #Pragma DisableBackgroundTasks
		  #Pragma DisableBoundsChecking
		  
		  If Messages = Nil Then Return
		  
		  Var type As Variant = theMessage.MessageType
		  
		  // No receivers for message.
		  If Not Messages.HasKey(type) Then Return
		  
		  Var receivers As Dictionary
		  
		  // Send to all receivers.
		  receivers = Messages.value(type)
		  
		  For Each receiver As MessageCentre.MessageReceiver In receivers.Keys
		    receiver.ReceiveMessage(theMessage)
		  Next receiver
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UnregisterForMessage(Extends theReceiver As MessageCentre.MessageReceiver, messageType As Variant)
		  If Messages = Nil Then Return // No receivers.
		  
		  // No such message.
		  If Not Messages.HasKey(messageType) Then Return
		  
		  // Remove receiver.
		  Var receivers As Dictionary
		  receivers = Messages.Value(messageType)
		  
		  If Not receivers.HasKey(theReceiver) Then Return
		  
		  receivers.Remove(theReceiver)
		  If receivers.KeyCount = 0 Then Messages.Remove(messageType)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UnregisterReceiver(Extends theReceiver As MessageCentre.MessageReceiver)
		  If Messages = Nil Then Return // No receivers.
		  
		  // Find the object within our registered receivers.
		  Var receivers As Dictionary
		  Var typesToRemove() As Variant
		  Var type As Variant
		  
		  For item As Integer = 0 To Messages.KeyCount - 1
		    // Message type.
		    type = Messages.Key(item)
		    
		    // Receivers.
		    receivers = Messages.Value(type)
		    
		    If Not receivers.HasKey(theReceiver) Then Continue For
		    
		    receivers.Remove(theReceiver)
		    
		    If receivers.KeyCount = 0 Then typesToRemove.Add(type)
		  Next item
		  
		  For Each type In typesToRemove
		    If Messages.HasKey(type) Then Messages.Remove(Type)
		  Next type
		  
		End Sub
	#tag EndMethod


	#tag Note, Name = Info
		Based on the article "Implementing a MessageCenter Module" by Charles Yeomans.
		Available in RealBasic Developer 3.6.
		
	#tag EndNote


	#tag Property, Flags = &h21
		Private Messages As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Queue As MessageCentre.MessageQueue
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
