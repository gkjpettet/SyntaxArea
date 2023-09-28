#tag Class
Protected Class UndoableDelete
Implements UndoKit.UndoableAction
	#tag Method, Flags = &h0
		Sub Constructor(field As SyntaxArea.IEditor, offset As Integer, length As Integer, s As String, attrs() As SyntaxArea.TextLineAttributes, oldCaretPos As Integer, ID As Integer, description As String)
		  Reference = New WeakRef(field)
		  Self.Offset = offset
		  Self.Length = length
		  Self.Text = s
		  Self.Attrs = attrs
		  Self.OldCaretPos = oldCaretPos
		  EventID = ID
		  mDescription = description
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 5468697320616374696F6E2773206465736372697074696F6E2E
		Function Description() As String
		  /// This action's description.
		  ///
		  /// Part of the `UndoKit.UndoableAction` interface.
		  
		  Return mDescription
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 53657473207468697320616374696F6E2773206465736372697074696F6E2E
		Sub Description(Assigns s As String)
		  /// Sets this action's description.
		  ///
		  /// Part of the `UndoKit.UndoableAction` interface.
		  
		  mDescription = s
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function EventID() As Integer
		  /// Part of the UndoKit.UndoableAction interface.
		  
		  Return EventDesc
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub EventID(Assigns value As Integer)
		  /// Part of the UndoKit.UndoableAction interface.
		  
		  EventDesc = value
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Redo()
		  /// Part of the UndoKit.UndoableAction interface.
		  
		  If Owner = Nil Then Return
		  Owner.PrivateRemove(Offset, Text.Length)
		  Owner.SelectionStart = Min(Owner.TextLength, Max(0, Owner.CaretPos))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Undo()
		  /// Part of the UndoKit.UndoableAction interface.
		  
		  If Owner = Nil Then Return
		  Owner.Insert(Offset, Text)
		  Owner.PrivateLines.SetAttributesOfLinesInRange(Offset, Length, Attrs)
		  Owner.SelectionStart = Min(Owner.TextLength, Max(0, oldCaretPos))
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected Attrs() As SyntaxArea.TextLineAttributes
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected EventDesc As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected Length As integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mDescription As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected Offset As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected OldCaretPos As Integer
	#tag EndProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  If Me.Reference <> Nil Then
			    Return SyntaxArea.IEditor(Me.Reference.Value)
			  Else
			    Return Nil
			  End If
			  
			End Get
		#tag EndGetter
		Protected Owner As SyntaxArea.IEditor
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
