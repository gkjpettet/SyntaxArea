#tag Class
Protected Class Message
Inherits Dictionary
	#tag CompatibilityFlags = ( TargetConsole and ( Target32Bit or Target64Bit ) ) or ( TargetWeb and ( Target32Bit or Target64Bit ) ) or ( TargetDesktop and ( Target32Bit or Target64Bit ) ) or ( TargetIOS and ( Target64Bit ) ) or ( TargetAndroid and ( Target64Bit ) )
	#tag Method, Flags = &h0, Description = 4164647320696E666F20746F20746865206D65737361676520696E2061206B65792F646174612066617368696F6E2E
		Sub AddInfo(key As variant, info As Variant)
		  /// Adds info to the message in a key/data fashion.
		  
		  Self.Value(key) = info
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(type As Variant, sender As Object)
		  Self.Type = type
		  MessageSender = sender
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E732074686520696E666F20666F72206120676976656E206B65792E
		Function Info(key As Variant) As Variant
		  /// Returns the info for a given key.
		  
		  Return Self.Lookup(key, Nil)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function InfoCount() As Integer
		  Return Self.KeyCount
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MessageType() As Variant
		  Return Self.Type
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Sender() As Object
		  Return MessageSender
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ToString() As String
		  Var tmp As String = "Type: " + messageType + EndOfLine
		  
		  For Each key As String In Keys
		    tmp = tmp + key + ": " + Self.Value(key).StringValue + EndOfLine
		  Next
		  
		  Return tmp
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected MessageSender As Object
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected Type As Variant
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="KeyCount"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="BinCount"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
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
End Class
#tag EndClass
