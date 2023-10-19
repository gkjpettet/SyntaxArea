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

	#tag Method, Flags = &h0, Description = 52657475726E7320547275652069662074686572652061726520756E646F61626C6520616374696F6E7320617661696C61626C652E
		Function IsDirty() As Boolean
		  /// Returns True if there are undoable actions available.
		  
		  Return UndoStackIndex <> 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E7320547275652069662074686520756E646F206D616E616765722069732063757272656E746C7920756E646F696E6720736F6D657468696E672E
		Function IsUndoing() As boolean
		  /// Returns True if the undo manager is currently undoing something.
		  
		  Return Undoing
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 5075736865732061206E657720756E646F61626C6520616374696F6E20746F2074686520737461636B2E
		Sub Push(action As UndoKit.UndoableAction)
		  /// Pushes a new undoable action to the stack.
		  
		  If Undoing Or Not mEnabled Then Return
		  If action = Nil Then Return
		  
		  AddActionToUndoStack(action)
		  
		  RedoStack.ResizeTo(-1)
		  
		  #If TargetDesktop
		    App.RefreshMenuBar
		  #EndIf
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 5265646F657320746865206C61737420616374696F6E2E
		Sub Redo()
		  /// Redoes the last action.
		  
		  If Not CanRedo Then Return
		  
		  Var id As Integer = RedoStack(RedoStack.LastIndex).EventID
		  
		  Redo(id)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 5265646F65732074686520616374696F6E207769746820746865207370656369666965642049442E
		Sub Redo(id As Integer)
		  /// Redoes the action with the specified id.
		  
		  If Not CanRedo Then Return
		  
		  Var match As Boolean
		  Do
		    match = False
		    Undoing = True
		    
		    If id = RedoStack(RedoStack.LastIndex).EventID Then
		      Var action As UndoKit.UndoableAction = RedoStack.Pop
		      AddActionToUndoStack(action)
		      
		      action.Redo
		      match = True
		    End If
		    
		    undoing = False
		  Loop Until id = 0 Or Not CanRedo Or Not match
		  
		  #If TargetDesktop
		    App.RefreshMenuBar
		  #EndIf
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 436C656172732074686520756E646F206D616E616765722E
		Sub Reset()
		  /// Clears the undo manager.
		  
		  UndoStack.ResizeTo(-1)
		  RedoStack.ResizeTo(-1)
		  UndoStackIndex = 0
		  Undoing = False
		  
		  #If TargetDesktop
		    App.RefreshMenuBar
		  #EndIf
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ResetDirtyFlag()
		  UndoStackIndex = 0
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 556E646F657320746865206C61737420616374696F6E2E
		Sub Undo()
		  /// Undoes the last action.
		  
		  If Not CanUndo Then Return
		  
		  Var id As Integer = UndoStack(UndoStack.LastIndex).EventID
		  Undo(id)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 556E646F65732074686520616374696F6E207769746820746865207370656369666965642069642E
		Sub Undo(id As Integer)
		  /// Undoes the action with the specified id.
		  
		  If Not CanUndo Then Return
		  
		  Var match As Boolean
		  Do
		    match = False
		    Undoing = True
		    
		    If id = UndoStack(UndoStack.LastIndex).EventID Then
		      Var action As UndoKit.UndoableAction = UndoStack.Pop
		      AddActionToRedoStack(action)
		      
		      action.Undo
		      match = True
		    End If
		    
		    Undoing = False
		  Loop Until id = 0 Or Not CanUndo Or Not match
		  
		  #If TargetDesktop
		    App.RefreshMenuBar
		  #EndIf
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

	#tag ComputedProperty, Flags = &h0, Description = 52657475726E7320746865206E657874207265646F20616374696F6E206F72204E696C206966207468657265206973206E6F6E652E
		#tag Getter
			Get
			  If CanRedo Then
			    Return RedoStack(RedoStack.LastIndex)
			  Else
			    Return Nil
			  End If
			  
			End Get
		#tag EndGetter
		NextRedo As UndoKit.UndoableAction
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0, Description = 52657475726E7320746865206E65787420756E646F20616374696F6E206F72204E696C206966207468657265206973206E6F6E652E
		#tag Getter
			Get
			  If CanUndo Then
			    Return UndoStack(UndoStack.LastIndex)
			  Else
			    Return Nil
			  End If
			  
			End Get
		#tag EndGetter
		NextUndo As UndoKit.UndoableAction
	#tag EndComputedProperty

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
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="CanUndo"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
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
