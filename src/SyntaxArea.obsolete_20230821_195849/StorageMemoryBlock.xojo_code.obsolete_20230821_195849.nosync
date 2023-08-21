#tag Class
Protected Class StorageMemoryBlock
Implements IBufferStorage
	#tag Method, Flags = &h0
		Sub Constructor(size as integer)
		  Storage = New MemoryBlock(size * BYTES_PER_CHAR)
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
		  
		  // Indexes and length all have to be multiplied by BYTES_PER_CHAR.
		  fromIndex = fromIndex * BYTES_PER_CHAR
		  localIndex = localIndex * BYTES_PER_CHAR
		  length = length * BYTES_PER_CHAR
		  
		  // Quick exit if nothing to copy...
		  If source.Size = 0 Or length = 0 Then Return
		  
		  Var src As SyntaxArea.StorageMemoryBlock = SyntaxArea.StorageMemoryBlock(source)
		  Storage.StringValue(localIndex, Min(length, Storage.Size - localIndex)) = _
		  src.Storage.StringValue(fromIndex, Min(length, src.Size * BYTES_PER_CHAR - fromIndex))
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E73207468652073697A65206F6620746869732073746F72616765206275666665722E
		Function Size() As Integer
		  /// Returns the size of this storage buffer.
		  ///
		  /// Part of the IBufferStorage interface.
		  
		  Return Storage.Size / BYTES_PER_CHAR
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 53657473207468652073697A65206F6620746869732073746F72616765206275666665722E
		Sub Size(Assigns length As Integer)
		  /// Sets the size of this storage buffer.
		  ///
		  /// Part of the IBufferStorage interface.
		  
		  Storage.Size = length * BYTES_PER_CHAR
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E732074686520737472696E672076616C7565206F6620746865206461746120626567696E6E696E672061742060696E6465786020666F7220606C656E6774686020636861726163746572732E
		Function StringValue(index As Integer, length As Integer) As String
		  /// Returns the string value of the data beginning at `index` for `length` characters.
		  ///
		  /// Part of the IBufferStorage interface.
		  
		  If length = 0 Then Return ""
		  If index >= Size Then Return ""
		  
		  index = index * BYTES_PER_CHAR
		  length = length * BYTES_PER_CHAR
		  
		  Var res As String = Storage.StringValue(index, Min(length, Storage.Size - index)).DefineEncoding(Encodings.UTF32)
		  
		  Return res.ConvertEncoding(SyntaxArea.InternalEncoding)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 41737369676E7320616E2061726561206F66207468652073746F7261676520746F207468652070617373656420537472696E672076616C75652E
		Sub StringValue(index As Integer, length As Integer, Assigns value As String)
		  /// Assigns an area of the storage to the passed String value.
		  ///
		  /// Part of the IBufferStorage interface.
		  
		  If length = 0 Then Return
		  
		  // Make sure nobody changes this.
		  #If BYTES_PER_CHAR <> 4
		    Raise New UnsupportedOperationException("BYTES_PER_CHAR must equal 4")
		  #EndIf
		  
		  // We need to store the data in UTF-32 format.
		  Var newVal As String = value
		  If newVal.Encoding <> Encodings.UTF32 Then
		    newVal = value.ConvertEncoding(Encodings.UTF32)
		  End If
		  
		  index = index * BYTES_PER_CHAR
		  length = length * BYTES_PER_CHAR
		  
		  If newVal.Bytes <> length Then
		    Var d As MemoryBlock = newVal
		    If d.UInt32Value(0) = &h0000FEFF or d.UInt32Value(0) = &hFFFE0000 Then
		      // Remove the byte order mark (BOM).
		      newVal = d.StringValue(4, d.Size - 4)
		    End If
		    
		    If newVal.Bytes <> length Then
		      // This would happen with UTF-16 chars that occupy two 16 bit words.
		      // For example, "🔍" has Length=2 in UTF-16, but has Length=1 in UTF-32 and in UTF-8.
		      // Since we cannot handle this, this must never happen, i.e. the caller may never
		      // handle UTF-16 encoded Strings. If it does, it's an internal bug.
		      Raise New UnsupportedFormatException("UTF-16 encoded strings are not supported.")
		    End If
		  End If
		  
		  Storage.StringValue(index, length) = newVal
		  
		End Sub
	#tag EndMethod


	#tag Note, Name = About
		Unicode-savvy.
		Should be more efficient than `SyntaxArea.StorageArray`.
		May not work correctly on Linux (according to the original CEF documentation). For now, `SyntaxArea.StorageArray` is
		recommended on that platform.
	#tag EndNote


	#tag Property, Flags = &h1
		Protected Storage As MemoryBlock
	#tag EndProperty


	#tag Constant, Name = BYTES_PER_CHAR, Type = Double, Dynamic = False, Default = \"4", Scope = Private
	#tag EndConstant


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
