#tag Class
Protected Class CharSelectionManager
	#tag Method, Flags = &h0
		Function AddSelection(selection As SyntaxArea.CharSelection) As SyntaxArea.CharSelection
		  If selection.Length = 0 Then Return Nil
		  
		  Var tmpSelection As SyntaxArea.CharSelection
		  Var overlapResult As Integer
		  
		  For i As Integer = 0 To Selections.LastIndex
		    tmpSelection = Selections(i)
		    overlapResult = tmpSelection.OverlapsSelection(selection)
		    
		    If overlapResult <> SyntaxArea.CharSelection.OVERLAP_NONE Then
		      Var newOffset As Integer
		      
		      If tmpSelection.SelectionColor = selection.SelectionColor Then
		        
		        Var newLength, newStartLine, newEndLine As Integer
		        
		        // Merge selections if colours are the same.
		        newOffset = Min(tmpSelection.Offset, selection.Offset)
		        newLength = Max(tmpSelection.Offset + tmpSelection.Length, selection.Offset + selection.Length) - newOffset
		        newStartLine = Min(tmpSelection.StartLine, selection.StartLine)
		        newEndLine = Max(tmpSelection.EndLine, Selection.EndLine)
		        
		        selection.StartLine = newStartLine
		        selection.EndLine = newEndLine
		        selection.Offset = newOffset
		        selection.Length = newLength
		        
		        Selections.RemoveAt(i)
		        i = i - 1
		        
		      Else
		        Select Case overlapResult
		        Case SyntaxArea.CharSelection.OVERLAP_END, SyntaxArea.CharSelection.OVERLAP_CONTAINS
		          // Add the remaining range to the range arrays for further sub-splitting or 
		          // merging down the line.
		          Var tmp As New SyntaxArea.CharSelection(selection.Offset, tmpSelection.Offset + tmpSelection.Length - selection.Offset, selection.StartLine, tmpSelection.EndLine, tmpSelection.SelectionColor)
		          tmp.LosesFocus = tmpSelection.LosesFocus
		          tmp.Rounded = tmpSelection.Rounded
		          Selections.Add(tmp)
		          
		          // Split tmpSelection at end and merge the end with selection.
		          tmpSelection.Length = Selection.Offset - tmpSelection.Offset
		          tmpSelection.EndLine = Selection.StartLine
		          
		        Case SyntaxArea.CharSelection.OVERLAP_START
		          newOffset = selection.Offset + selection.Length
		          tmpSelection.Length = tmpSelection.Offset + tmpSelection.Length - newOffset
		          tmpSelection.Offset = newOffset
		          tmpSelection.StartLine = selection.EndLine
		          
		        Else
		          //new selection totally swallows the old.
		          Selections.RemoveAt(i)
		          i = i - 1
		        End Select
		      End If
		    End If
		  Next i
		  
		  Selections.Add(selection)
		  mSelectionCount = Selections.LastIndex + 1
		  
		  Return selection
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Clear()
		  Selections.ResizeTo(-1)
		  mSelectionCount = 0
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SelectionsForLine(lineIndex As Integer) As SyntaxArea.CharSelection()
		  Var result() As SyntaxArea.CharSelection
		  
		  For Each selection As SyntaxArea.CharSelection In Selections
		    If selection.IsLineIndexInRange(lineIndex) Then
		      result.Add(selection)
		    End If
		  Next
		  
		  Return result
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mSelectionCount As Integer
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mSelectionCount
			End Get
		#tag EndGetter
		SelectionCount As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h1
		Protected Selections() As SyntaxArea.CharSelection
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="2147483648"
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
			Name="SelectionCount"
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
