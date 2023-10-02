#tag Class
Protected Class GapBuffer
	#tag Method, Flags = &h1, Description = 4173736572747320746861742060696E646578602069732077697468696E20626F756E64732E
		Protected Sub CheckBounds(index As Integer)
		  /// Asserts that `index` is within bounds.
		  
		  If index < 0 Or index > Length Then
		    Var e As New OutOfBoundsException
		    e.Message = "Tried to access the buffer at invalid index." + EndOfLine + "Logic length = " + _
		    Length.ToString + ", index = " + index.ToString
		    Raise e
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 437265617465732061206E657720676170206275666665722E
		Sub Constructor()
		  /// Creates a new gap buffer.
		  
		  Buffer = GetBufferStorage(0)
		  GapStart = 0
		  GapEnd = 0
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1, Description = 456E73757265732074686572652773206174206C6561737420606D696E52657175697265644C656E677468602073706163657320617661696C61626C6520696E20746865206275666665722E
		Protected Sub EnsureBufferSize(minRequiredLength As Integer)
		  /// Ensures there's at least `minRequiredLength` spaces available in the buffer.
		  
		  #If Not DebugBuild
		    #Pragma DisableBackgroundTasks
		    #Pragma DisableBoundsChecking
		  #EndIf
		  
		  Var newbuffer As IBufferStorage
		  Var delta As Integer
		  
		  If GapLength < minRequiredLength Or GapLength < MIN_GAP_SIZE Then
		    // The gap is too small. Resize the buffer.
		    delta = Max(minRequiredLength, MAX_GAP_SIZE) - GapLength
		    newbuffer = GetBufferStorage(buffer.Size + delta)
		    
		  ElseIf GapLength > MAX_GAP_SIZE Then
		    // The gap is too big.
		    delta = Max(minRequiredLength, MIN_GAP_SIZE) - GapLength
		    newbuffer = GetBufferStorage(buffer.Size + delta)
		    
		  Else
		    // No need to resize.
		    Return
		  End If
		  
		  // Copy the contents to the new buffer.
		  newbuffer.Copy(Buffer, 0, 0, GapStart)
		  newbuffer.Copy(Buffer, GapEnd, newbuffer.Size - (Buffer.Size - GapEnd), Buffer.Size - GapEnd)
		  Buffer = newbuffer
		  GapEnd = GapEnd + delta
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1, Description = 52657475726E732061206E65772067617020627566666572206F662074686520646573697265642073697A652E205468652074797065206F662073746F726167652072657475726E65642069732064657465726D696E6564206279207468652076616C7565206F66206053796E746178417265612E5465787453746F7261676554797065602E
		Protected Function GetBufferStorage(size As Integer) As SyntaxArea.IBufferStorage
		  /// Returns a new gap buffer of the desired size.
		  /// The type of storage returned is determined by the value of `SyntaxArea.TextStorageType`.
		  
		  #If SyntaxArea.TextStorageType = SyntaxArea.TEXT_STORAGE_ARRAY Then
		    Return New SyntaxArea.StorageArray(size)
		  #Else
		    Return New SyntaxArea.StorageMemoryBlock(size)
		  #EndIf
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E73207468652063686172616374657220617420606F6666736574602E
		Function GetCharAt(offset As Integer) As String
		  /// Returns the character at `offset`.
		  
		  // If offset before the gap...
		  If offset < GapStart Then
		    Return Buffer.StringValue(offset, 1)
		  End If
		  
		  // Else offset it by length.
		  Return Buffer.StringValue(offset + GapLength, 1)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E7320746865207465787420626567696E6E696E672061742060696E6465786020666F7220606C656E6774686020636861726163746572732E
		Function GetText(index As Integer, length As Integer) As String
		  /// Returns the text beginning at `index` for `length` characters.
		  
		  #If Not DebugBuild
		    #Pragma DisableBackgroundTasks
		    #Pragma DisableBoundsChecking
		  #EndIf
		  
		  If length <= 0 Or Self.Length = 0 Then Return ""
		  
		  CheckBounds(index)
		  
		  Var delta As Integer = index + length
		  
		  // Is all the text before the gap?
		  If delta < gapStart Then
		    Return Buffer.StringValue(index, length)
		  End If
		  
		  // Is all the text after the gap?
		  If index > gapStart Then
		    Return Buffer.StringValue(index + GapLength, length)
		  End If
		  
		  // Must be text before and after the gap.
		  Var result As SyntaxArea.IBufferStorage = GetBufferStorage(length)
		  result.Copy(Buffer, index, 0, GapStart - index)
		  result.Copy(Buffer, GapEnd, GapStart - index, delta - GapStart)
		  
		  Return result.StringValue(0, result.Size)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 496E7365727473206073602061742060696E646578602E
		Sub Insert(index As Integer, s As String)
		  /// Inserts `s` at `index`.
		  
		  Replace(index, 0, s)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1, Description = 4D6F766573207468652067617020746F206120646966666572656E7420706C6163652077697468696E2074686520627566666572202860696E64657860292E
		Protected Sub PlaceGap(index As Integer)
		  /// Moves the gap to a different place within the buffer (`index`).
		  
		  #If Not DebugBuild
		    #Pragma DisableBackgroundTasks
		    #Pragma DisableBoundsChecking
		  #EndIf
		  
		  If index = GapStart And GapLength > 0 Then Return
		  
		  Var newbuffer As SyntaxArea.IBufferStorage = Buffer
		  
		  // Empty?
		  If buffer.Size = 0 Then Return
		  
		  // Are we moving before the current gap?
		  If index < gapStart Then
		    // How many items to move?
		    Var count As Integer = GapStart - index
		    
		    // Move the items.
		    newbuffer.StringValue(index + GapLength, count) = Buffer.StringValue(index, count)
		    GapStart = GapStart - count
		    GapEnd = GapEnd - count
		    
		  Else
		    // We're moving after the current gap start.
		    
		    // How many items to move?
		    Var count As Integer = index - GapStart
		    
		    If count > 0 Then
		      // Move the items.
		      newbuffer.StringValue(GapStart, count) = Buffer.StringValue(GapEnd, count)
		      GapStart = GapStart + count
		      GapEnd = GapEnd + count
		    End If
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52656D6F76657320606C656E67746860206368617261637465727320626567696E6E696E672061742060696E646578602066726F6D207468652073746F726167652E2052657475726E732054727565206966207375636365737366756C2E
		Function Remove(index As Integer, length As Integer) As Boolean
		  /// Removes `length` characters beginning at `index` from the storage.
		  /// Returns True if successful.
		  
		  If index < 0 Or index > Self.Length Or Self.Length = 0 Then Return False
		  
		  Replace(index, length, "")
		  
		  Return True
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 5265706C6163657320606C656E67746860206368617261637465727320626567696E6E696E672061742060696E646578602077697468206073602E
		Sub Replace(index As Integer, length As Integer, s As String)
		  /// Replaces `length` characters beginning at `index` with `s`.
		  
		  s = s.ConvertEncoding(SyntaxArea.InternalEncoding) ' make sure it's not in UTF-16
		  
		  CheckBounds(index)
		  
		  PlaceGap(index)
		  
		  Var minLengthRequired As Integer = s.Length
		  EnsureBufferSize(minLengthRequired)
		  
		  // Replace characters by moving them INTO the gap.
		  GapEnd = GapEnd + length
		  
		  // Add the text.
		  Buffer.StringValue(index, s.Length) = s
		  GapStart = GapStart + s.Length
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 53657473207468652074657874206F6620746869732073746F7261676520746F206073602E
		Sub SetText(s As String)
		  /// Sets the text of this storage to `s`.
		  
		  // Text without encoding cannot be converted and will fail in `SyntaxArea.StorageMemoryBlock.StringValue()`.
		  If s.Encoding = Nil Then
		    Raise New UnsupportedFormatException("Attempted to set the text value of a GapBuffer but the text has no encoding.")
		  End If
		  
		  // Ensure we use the correct encoding.
		  s = s.ConvertEncoding(SyntaxArea.InternalEncoding)
		  
		  Buffer.Size = s.Length
		  Buffer.StringValue(0, s.Length) = s
		  GapStart = s.Length / 2
		  GapEnd = GapStart
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected Buffer As SyntaxArea.IBufferStorage
	#tag EndProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Return mGapEnd
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If value > buffer.Size Then value = buffer.Size
			  
			  mGapEnd = value
			End Set
		#tag EndSetter
		Protected GapEnd As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return GapEnd - GapStart
			End Get
		#tag EndGetter
		GapLength As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h1
		Protected GapStart As Integer
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return buffer.Size - GapLength
			End Get
		#tag EndGetter
		Length As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mGapEnd As Integer
	#tag EndProperty


	#tag Constant, Name = MAX_GAP_SIZE, Type = Double, Dynamic = False, Default = \"256", Scope = Private
	#tag EndConstant

	#tag Constant, Name = MIN_GAP_SIZE, Type = Double, Dynamic = False, Default = \"32", Scope = Private
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="GapLength"
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
			Name="Length"
			Visible=false
			Group="Behavior"
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
