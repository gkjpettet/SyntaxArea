#tag Class
Protected Class UndoManager
	#tag Method, Flags = &h1
		Protected Sub addActionToRedoStack(action as UndoableAction)
		  RedoStack.Add action
		  undoStackIndex = undoStackIndex - 1
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub addActionToUndoStack(action as UndoableAction)
		  UndoStack.Add action
		  undoStackIndex = undoStackIndex + 1
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  mEnabled = true
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsDirty() As boolean
		  Return undoStackIndex <> 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsUndoing() As boolean
		  Return undoing
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Push(action as UndoableAction)
		  if undoing or not mEnabled then Return
		  if action = nil then Return
		  addActionToUndoStack(action)
		  
		  redim RedoStack(-1)
		  App.RefreshMenuBar()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Redo()
		  if not CanRedo then Return
		  var ID as Integer = RedoStack(RedoStack.LastIndex).EventID
		  redo(ID)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Redo(id as integer)
		  if not CanRedo then Return
		  
		  var match as Boolean
		  do
		    match = false
		    undoing = true
		    
		    if id = RedoStack(RedoStack.LastIndex).EventID then
		      var action as UndoableAction = RedoStack.Pop
		      addActionToUndoStack(action)
		      
		      action.Redo
		      match = true
		    end if
		    
		    undoing = False
		  loop until id = 0 or not CanRedo or not match
		  
		  App.RefreshMenuBar()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Reset()
		  redim UndoStack(-1)
		  redim RedoStack(-1)
		  undoStackIndex = 0
		  undoing = False
		  App.RefreshMenuBar()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ResetDirtyFlag()
		  undoStackIndex = 0
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Undo()
		  if not CanUndo then Return
		  var ID as Integer = UndoStack(UndoStack.LastIndex).EventID
		  Undo(ID)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Undo(ID as integer)
		  if not CanUndo then Return
		  
		  var match as Boolean
		  do
		    match = false
		    undoing = true
		    
		    if id = UndoStack(UndoStack.LastIndex).EventID then
		      var action as UndoableAction = UndoStack.Pop
		      addActionToRedoStack(action)
		      
		      action.Undo
		      match = true
		    end if
		    
		    undoing = False
		  loop until id = 0 or not CanUndo or not match
		  
		  App.RefreshMenuBar()
		  
		End Sub
	#tag EndMethod


	#tag Note, Name = About
		Part of CustomEditField
	#tag EndNote


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mEnabled and RedoStack.LastIndex > -1
			End Get
		#tag EndGetter
		CanRedo As boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mEnabled and UndoStack.LastIndex > -1
			End Get
		#tag EndGetter
		CanUndo As boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mEnabled
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
		Protected RedoStack() As UndoableAction
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected undoing As boolean
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected UndoStack() As UndoableAction
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected undoStackIndex As Integer
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
