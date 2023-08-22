#tag Class
Protected Class UndoableReplace
Implements UndoKit.UndoableAction
	#tag Method, Flags = &h0
		Sub Constructor(editor As SyntaxArea.Editor, offset As Integer, length As Integer, originalText As String, text As String, attrs() As SyntaxArea.TextLineAttributes, oldCaretPos As Integer, id As Integer)
		  Reference = New WeakRef(editor)
		  Self.Offset = offset
		  Self.Length = length
		  Self.OriginalText = originalText
		  Self.Text = text
		  Self.Attrs = attrs
		  Self.OldCaretPos = oldCaretPos
		  EventID = id
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 50617274206F662074686520556E646F4B69742E556E646F61626C65416374696F6E20696E746572666163652E
		Function EventID() As Integer
		  /// Part of the UndoKit.UndoableAction interface.
		  
		  Return EventDesc
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 50617274206F662074686520556E646F4B69742E556E646F61626C65416374696F6E20696E746572666163652E
		Sub EventID(Assigns value As Integer)
		  /// Part of the UndoKit.UndoableAction interface.
		  
		  EventDesc = value
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Redo()
		  If Owner = Nil Then Return
		  Owner.PrivateReplace(Offset, OriginalText.Length, Text, True)
		  Owner.SelectionStart = Min(Owner.TextLength, Max(0, Owner.CaretPos))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Undo()
		  If Owner = Nil Then Return
		  Owner.PrivateReplace(Offset, Text.Length, OriginalText, True)
		  Owner.PrivateLines.SetAttributesOfLinesInRange(Offset, Length, Attrs)
		  Owner.SelectionStart = Min(Owner.TextLength, Max(0, OldCaretPos))
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected Attrs() As SyntaxArea.TextLineAttributes
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected EventDesc As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected Length As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected Offset As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected OldCaretPos As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected OriginalText As String
	#tag EndProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  If Me.Reference <> Nil Then
			    Return SyntaxArea.Editor(Me.Reference.Value)
			  Else
			    Return Nil
			  End If
			  
			End Get
		#tag EndGetter
		Protected Owner As SyntaxArea.Editor
	#tag EndComputedProperty

	#tag Property, Flags = &h1
		Protected Reference As WeakRef
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected Text As String
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