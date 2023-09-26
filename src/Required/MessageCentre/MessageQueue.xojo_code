#tag Class
Protected Class MessageQueue
Inherits Timer
	#tag CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit)) or  (TargetIOS and (Target64Bit)) or  (TargetAndroid and (Target64Bit))
	#tag Event
		Sub Action()
		  /// Sends the next queued message.
		  
		  If Queue.LastIndex < 0 Then Return
		  
		  Var msg As MessageCentre.Message
		  msg = Queue(0)
		  Queue.RemoveAt(0)
		  
		  MessageCentre.SendMessage(msg)
		  
		  // If the queue is not empty, keep the timer running.
		  If Queue.LastIndex >= 0 Then
		    Me.RunMode = Timer.RunModes.Single
		  Else
		    Me.RunMode = Timer.RunModes.Off
		  End If
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0, Description = 416464732061206D65737361676520746F207468652071756575652E
		Sub AddMessage(m As MessageCentre.Message)
		  /// Adds a message to the queue.
		  
		  Queue.Add(m)
		  
		  If Me.RunMode = Timer.RunModes.Off Then
		    Me.RunMode = Timer.RunModes.Single
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor()
		  Me.RunMode = Timer.RunModes.Off
		  
		  // Delivers as soon as possible, after the current event.
		  Me.Period = 0
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 46696E647320746865206669727374206D65737361676520696E207468652071756575652074686174206D617463686573207468652070617373656420706172616D65746572732E2052657475726E73204E696C206966206E6F206D61746368696E67206D65737361676520697320666F756E642E
		Function FindMessageInQueue(type As Variant, infoKey As Variant, infoValue As Variant) As MessageCentre.Message
		  /// Finds the first message in the queue that matches the passed parameters.
		  /// Returns Nil if no matching message is found.
		  
		  For Each m As MessageCentre.Message In Queue
		    If m.MessageType = type And m.Info(infoKey) = infoValue Then
		      Return m
		    End If
		  Next m
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21, Description = 546865206D6573736167657320746F2073656E642E20546865206C6F7765737420696E646578206D6573736167652069732073656E742066697273742E
		Private Queue(-1) As MessageCentre.Message
	#tag EndProperty


	#tag ViewBehavior
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
		#tag ViewProperty
			Name="Enabled"
			Visible=false
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="RunMode"
			Visible=true
			Group="Behavior"
			InitialValue="2"
			Type="RunModes"
			EditorType="Enum"
			#tag EnumValues
				"0 - Off"
				"1 - Single"
				"2 - Multiple"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue=""
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
			Name="Period"
			Visible=true
			Group="Behavior"
			InitialValue="1000"
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
	#tag EndViewBehavior
End Class
#tag EndClass
