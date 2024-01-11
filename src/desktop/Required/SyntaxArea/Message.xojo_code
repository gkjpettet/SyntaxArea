#tag Class
Protected Class Message
Inherits Dictionary
	#tag CompatibilityFlags = ( TargetConsole and ( Target32Bit or Target64Bit ) ) or ( TargetWeb and ( Target32Bit or Target64Bit ) ) or ( TargetDesktop and ( Target32Bit or Target64Bit ) ) or ( TargetIOS and ( Target64Bit ) ) or ( TargetAndroid and ( Target64Bit ) )
	#tag Method, Flags = &h0, Description = 4164647320696E666F726D6174696F6E2061732061206B65792D76616C7565207061697220746F20746865206D6573736167652E
		Sub AddInfo(key As Variant, info As Variant)
		  /// Adds information as a key-value pair to the message.
		  
		  Self.Value(key) = info
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(type As Variant, sender As Object)
		  Self.Type = type
		  MessageSender = sender
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E732074686520696E666F726D6174696F6E2073746F72656420696E2074686973206D65737361676520666F72206120676976656E206B65792E
		Function Info(key As Variant) As Variant
		  /// Returns the information stored in this message for a given key.
		  
		  Return Self.Lookup(key, Nil)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E7320746865206E756D626572206F66206B65792D76616C756520696E666F726D6174696F6E20706169727320696E2074686973206D6573736167652E
		Function InfoCount() As Integer
		  /// Returns the number of key-value information pairs in this message.
		  
		  Return Self.KeyCount
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 54686973206D65737361676527732061726269747261727920747970652E
		Function MessageType() As Variant
		  /// This message's arbitrary type.
		  
		  Return Self.Type
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 546865206F626A65637420746861742073656E742074686973206D6573736167652E
		Function Sender() As Object
		  /// The object that sent this message.
		  
		  Return MessageSender
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E73206120737472696E6720726570726573656E746174696F6E206F662074686973206D6573736167652E
		Function ToString() As String
		  /// Returns a string representation of this message.
		  
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
