#tag Class
Protected Class MessageQueue
Inherits Timer
	#tag CompatibilityFlags = ( TargetConsole and ( Target32Bit or Target64Bit ) ) or ( TargetWeb and ( Target32Bit or Target64Bit ) ) or ( TargetDesktop and ( Target32Bit or Target64Bit ) ) or ( TargetIOS and ( Target64Bit ) ) or ( TargetAndroid and ( Target64Bit ) )
	#tag Event
		Sub Action()
		  // Send the next queued message.
		  
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


	#tag Method, Flags = &h0
		Sub AddMessage(theMessage As MessageCentre.Message)
		  Queue.Add(theMessage)
		  
		  If Me.RunMode = Timer.RunModes.Off Then
		    Me.RunMode = Timer.RunModes.Single
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor()
		  Me.RunMode = Timer.RunModes.Off
		  Me.Period = 0 // Delivers as soon as possible, after the current event.
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FindMessageInQueue(type As Variant, matchInfoKey As Variant, matchInfoValue As Variant) As MessageCentre.Message
		  For Each m As MessageCentre.Message In Queue
		    If m.MessageType = type And m.Info(matchInfoKey) = matchInfoValue Then
		      Return m
		    End If
		  Next m
		  
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
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
