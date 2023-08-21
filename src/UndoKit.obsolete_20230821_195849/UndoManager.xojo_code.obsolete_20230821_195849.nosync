#tag Class
Protected Class UndoManager
	#tag Method, Flags = &h1
		Protected Sub AddActionToRedoStack(action As UndoKit.UndoableAction)
		  RedoStack.Add(action)
		  undoStackIndex = undoStackIndex - 1
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub AddActionToUndoStack(action As UndoKit.UndoableAction)
		  UndoStack.Add(action)
		  undoStackIndex = undoStackIndex + 1
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  mEnabled = True
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsDirty() As Boolean
		  Return UndoStackIndex <> 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsUndoing() As boolean
		  Return Undoing
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Push(action As UndoKit.UndoableAction)
		  If Undoing Or Not mEnabled Then Return
		  If action = Nil Then Return
		  
		  AddActionToUndoStack(action)
		  
		  RedoStack.ResizeTo(-1)
		  
		  App.RefreshMenuBar
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Redo()
		  If Not CanRedo Then Return
		  
		  Var id As Integer = RedoStack(RedoStack.LastIndex).EventID
		  
		  Redo(id)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Redo(id As Integer)
		  If Not CanRedo Then Return
		  
		  Var match As Boolean
		  Do
		    match = False
		    undoing = True
		    
		    If id = RedoStack(RedoStack.LastIndex).EventID Then
		      Var action As UndoKit.UndoableAction = RedoStack.Pop
		      AddActionToUndoStack(action)
		      
		      action.Redo
		      match = True
		    End If
		    
		    undoing = False
		  Loop Until id = 0 Or Not CanRedo Or Not match
		  
		  App.RefreshMenuBar
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Reset()
		  UndoStack.ResizeTo(-1)
		  RedoStack.ResizeTo(-1)
		  UndoStackIndex = 0
		  Undoing = False
		  App.RefreshMenuBar
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ResetDirtyFlag()
		  UndoStackIndex = 0
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Undo()
		  If Not CanUndo Then Return
		  Var id As Integer = UndoStack(UndoStack.LastIndex).EventID
		  Undo(id)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Undo(ID As Integer)
		  If Not CanUndo Then Return
		  
		  Var match As Boolean
		  Do
		    match = False
		    undoing = True
		    
		    If id = UndoStack(UndoStack.LastIndex).EventID Then
		      Var action As UndoKit.UndoableAction = UndoStack.Pop
		      AddActionToRedoStack(action)
		      
		      action.Undo
		      match = True
		    End If
		    
		    Undoing = False
		  Loop Until id = 0 Or Not CanUndo Or Not match
		  
		  App.RefreshMenuBar
		  
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mEnabled And RedoStack.LastIndex > -1
			End Get
		#tag EndGetter
		CanRedo As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mEnabled And UndoStack.LastIndex > -1
			End Get
		#tag EndGetter
		CanUndo As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mEnabled
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mEnabled = value
			End Set
		#tag EndSetter
		Enabled As Boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mEnabled As Boolean
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected RedoStack() As UndoKit.UndoableAction
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected Undoing As Boolean
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected UndoStack() As UndoKit.UndoableAction
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected UndoStackIndex As Integer
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="CanRedo"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="CanUndo"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Enabled"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
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
