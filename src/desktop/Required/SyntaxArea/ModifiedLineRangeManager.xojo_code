#tag Class
Protected Class ModifiedLineRangeManager
	#tag Method, Flags = &h0
		Sub AddRange(newStart As Integer, newLength As Integer)
		  If newLength = 0 Then Return
		  
		  mLock.Enter
		  
		  Var newEnd As Integer = newStart + newLength
		  
		  // Cut the new range down to the space that's not already occupied by the existing ranges.
		  Var i As Integer
		  For i = 0 To mRanges.LastIndex
		    Var thisRange As SyntaxArea.DataRange = mRanges(i)
		    
		    If thisRange.Offset > newEnd Then
		      // There are no ranges before the new one -> add new range to end of array.
		      Exit
		    End If
		    
		    If thisRange.EndOffset < newStart Then Continue
		    
		    // There is an overlap (newStart <= this range's end).
		    // Find more ranges that touch the new range
		    Var nextRange As SyntaxArea.DataRange
		    Var k As Integer = i
		    While k < mRanges.LastIndex
		      nextRange = mRanges(k + 1)
		      If nextRange.EndOffset <= newEnd Then
		        // Remove this range entirely.
		        mRanges.RemoveAt(k + 1)
		        nextRange = Nil
		      ElseIf nextRange.Offset <= newStart Then
		        // This range can be merged with the new range.
		        Exit While
		      Else
		        k = k + 1
		      End If
		    Wend
		    
		    // Cut the new range.
		    If thisRange.Offset <= newStart Then
		      If thisRange.EndOffset >= newEnd Then
		        // All covered - we're done.
		      Else
		        // Extend thisRange to end of new range.
		        thisRange.Length = newEnd - thisRange.Offset
		        If nextRange <> Nil And thisRange.EndOffset >= nextRange.Offset Then
		          // thisRange reaches into next range -> merge them.
		          thisRange.Length = nextRange.EndOffset - thisRange.Offset
		          mRanges.RemoveAt(k)
		        Else
		          // We're done.
		        End If
		      End If
		      
		    Else
		      // thisRange.offset > newStart
		      // Adjust the start of thisRange.
		      Var added As Integer = thisRange.Offset - newStart
		      thisRange.Offset = thisRange.Offset - added
		      thisRange.Length = thisRange.Length + added
		      
		      // Adjust the end of thisRange.
		      If thisRange.EndOffset < newEnd Then
		        thisRange.Length = newEnd - thisRange.Offset
		        If nextRange <> Nil And thisRange.EndOffset >= nextRange.Offset Then
		          // thisRange reaches into next range -> merge them.
		          thisRange.Length = nextRange.EndOffset - thisRange.Offset
		          mRanges.RemoveAt(k)
		        End If
		      End If
		    End If
		    
		    mLock.Leave
		    
		    Return
		  Next i
		  
		  mRanges.AddAt(i, New SyntaxArea.DataRange(newStart, newEnd - newStart))
		  
		  mLock.Leave
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Clear()
		  mRanges.ResizeTo(-1)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  mLock = new CriticalSection
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RemoveLine(offset As Integer) As Boolean
		  mLock.Enter
		  
		  For i As Integer = 0 To mRanges.LastIndex
		    Var thisRange As SyntaxArea.DataRange = mRanges(i)
		    
		    If thisRange.Offset > offset Then
		      // Not found.
		      Exit
		    End If
		    
		    If thisRange.EndOffset <= offset Then
		      Continue
		    End If
		    
		    // Found - now cut it out.
		    If offset = thisRange.Offset Then
		      // Head cut.
		      thisRange.Length = thisRange.Length - 1
		      thisRange.Offset = offset + 1
		      If thisRange.Length = 0 Then
		        mRanges.RemoveAt(i)
		      End If
		      
		    ElseIf offset = thisRange.EndOffset -1 Then
		      // Tail cut.
		      thisRange.Length = thisRange.Length - 1
		      If thisRange.Length = 0 Then
		        mRanges.RemoveAt(i)
		      End If
		      
		    Else
		      // Centre cut.
		      mRanges.AddAt(i + 1, New SyntaxArea.DataRange(offset + 1, thisRange.EndOffset - offset-1))
		      thisRange.Length = offset - thisRange.Offset
		    End If
		    
		    mLock.Leave
		    
		    Return True
		  Next i
		  
		  mLock.Leave
		  
		  Return False
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RemoveNextLine(ByRef lineIdx As Integer) As Boolean
		  If mRanges.LastIndex < 0 Then Return False
		  
		  mLock.Enter
		  
		  Var firstRange As SyntaxArea.DataRange = mRanges(0)
		  lineIdx = firstRange.Offset
		  If Not RemoveLine(lineIdx) Then
		    Break // Internal error!
		  End If
		  
		  mLock.Leave
		  
		  Return True
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mLock As CriticalSection
	#tag EndProperty

	#tag Property, Flags = &h21
		#tag Note
			This array is sorted by `DataRange.Offset`, no overlaps allowed.
		#tag EndNote
		Private mRanges() As SyntaxArea.DataRange
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mRanges.LastIndex + 1
			End Get
		#tag EndGetter
		RangeCount As Integer
	#tag EndComputedProperty


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
			Name="RangeCount"
			Visible=false
			Group="Behavior"
			InitialValue="0"
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
