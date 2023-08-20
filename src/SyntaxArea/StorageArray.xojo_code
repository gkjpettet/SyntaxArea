#tag Class
Protected Class StorageArray
Implements IBufferStorage
	#tag Method, Flags = &h0
		Sub Constructor(size as integer)
		  Storage.ResizeTo(size - 1)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 436F706965732061206C656E677468206F6620746578742066726F6D2060736F757263656020746F2074686973206275666665722E
		Sub Copy(source As SyntaxArea.IBufferStorage, fromIndex As Integer, localIndex As Integer, length As Integer)
		  /// Copies a length of text from `source` to this buffer.
		  ///
		  /// Part of the IBufferStorage interface.
		  
		  #If Not DebugBuild
		    #Pragma DisableBackgroundTasks
		    #Pragma DisableBoundsChecking
		  #EndIf
		  
		  If length = 0 Then Return
		  
		  Var src As SyntaxArea.StorageArray = SyntaxArea.StorageArray(source)
		  
		  Var maxLocal As Integer = Storage.LastIndex
		  Var maxSrc As Integer = src.Storage.LastIndex
		  
		  Var iLimit As Integer = length - 1
		  For i As Integer = 0 To iLimit
		    If localIndex + i > maxLocal or fromIndex + i > maxSrc Then Exit
		    Storage(localIndex + i) = src.Storage(fromIndex + i)
		  Next i
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E73207468652073697A65206F6620746869732073746F72616765206275666665722E
		Function Size() As Integer
		  /// Returns the size of this storage buffer.
		  ///
		  /// Part of the IBufferStorage interface.
		  
		  Return Storage.LastIndex + 1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 53657473207468652073697A65206F6620746869732073746F72616765206275666665722E
		Sub Size(Assigns length As Integer)
		  /// Sets the size of this storage buffer.
		  ///
		  /// Part of the IBufferStorage interface.
		  
		  Storage.ResizeTo(length - 1)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E732074686520737472696E672076616C7565206F6620746865206461746120626567696E6E696E672061742060696E6465786020666F7220606C656E6774686020636861726163746572732E
		Function StringValue(index As Integer, length As Integer) As String
		  /// Returns the string value of the data beginning at `index` for `length` characters.
		  ///
		  /// Part of the IBufferStorage interface.
		  
		  #If Not DebugBuild
		    #Pragma DisableBackgroundTasks
		    #Pragma DisableBoundsChecking
		  #EndIf
		  
		  If length = 0 Then Return ""
		  If index >= Size Then Return ""
		  
		  // Create a copy of the correct size.
		  Var tmp() As String
		  tmp.ResizeTo(length - 1)
		  
		  Var iLimit As Integer = length - 1
		  For i As Integer = 0 To iLimit
		    tmp(i) = Storage(i + index)
		  Next i
		  
		  Var ret As String = String.FromArray(tmp, "")
		  
		  If ret.Encoding = Nil Then
		    // Should never happen...
		    Raise New UnsupportedFormatException("A Nil encoding was encountered whilst attempting to return the string " + _
		    "value from a StorageArray.")
		  End If
		  
		  Return ret.ConvertEncoding(SyntaxArea.InternalEncoding)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 41737369676E7320616E2061726561206F66207468652073746F7261676520746F207468652070617373656420537472696E672076616C75652E
		Sub StringValue(index As Integer, length As Integer, Assigns value As String)
		  /// Assigns an area of the storage to the passed String value.
		  ///
		  /// Part of the IBufferStorage interface.
		  
		  #If Not DebugBuild
		    #Pragma DisableBackgroundTasks
		    #Pragma DisableBoundsChecking
		  #EndIf
		  
		  If length = 0 Then Return
		  If value.Length = 0 Then Return
		  
		  Var encoding As TextEncoding = value.Encoding
		  If encoding = Nil Then
		    // Should never happen...
		    Raise New UnsupportedFormatException("A Nil encoding was encountered whilst trying to assign a string value " + _
		    "to a StorageArray.")
		  End
		  
		  If encoding.Equals(encodings.UTF16) Then
		    // UTF-16 causes problems with certain chars (e.g. "🔍"), so we must
		    // convert it into UTF-8 or UTF-32.
		    value = value.ConvertEncoding(SyntaxArea.InternalEncoding)
		  End If
		  
		  // Split the data into a temporary array.
		  Var chars() As String = value.Split("")
		  
		  // Copy it.
		  Var iLimit As Integer = length - 1
		  For i As Integer = 0 To iLimit
		    Storage(i + index) = chars(i)
		  Next i
		  
		End Sub
	#tag EndMethod


	#tag Note, Name = About
		Unicode-savvy.
		Less efficient than `SyntaxArea.StorageMemoryBlock` so that data structure should be preferred.
		Works on Linux whereas (according to the original CEF documentation) `StorageMemoryBlock` may not.
	#tag EndNote


	#tag Property, Flags = &h1
		Protected Storage() As String
	#tag EndProperty


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
End Class
#tag EndClass
