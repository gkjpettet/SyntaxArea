#tag Class
Protected Class CharSelection
Inherits DataRange
	#tag Method, Flags = &h0
		Sub Constructor(offset as integer, length as integer, startLine as integer, endLine as integer, selectionColor as color)
		  // Calling the overridden superclass constructor.
		  // Note that this may need modifications if there are multiple constructor choices.
		  // Possible constructor calls:
		  // Constructor(offset as integer, length as integer) -- From DataRange
		  // Constructor() -- From DataRange
		  Super.Constructor(offset, length)
		  self.StartLine = StartLine
		  self.EndLine = EndLine
		  self.SelectionColor = SelectionColor
		  
		  LosesFocus = True
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsLineIndexInRange(lineIndex as integer) As boolean
		  Return lineIndex >= self.StartLine and lineIndex <= self.EndLine
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function OverlapsSelection(selection as charSelection) As integer
		  if self.offset = selection.offset and self.length = Selection.length then Return OVERLAP_SAME
		  
		  if selection.inRange(self.offset) and self.EndOffset = selection.EndOffset then
		    Return OVERLAP_WITHIN_AT_START
		  end if
		  
		  if self.offset = selection.offset and selection.inRange(self.EndOffset) then
		    Return OVERLAP_WITHIN_AT_END
		  end if
		  
		  if inRange(selection.offset) and not inRange(selection.EndOffset) then //head in self
		    return OVERLAP_END
		  end if
		  
		  if selection.inRange(self.offset) and not selection.inRange(self.EndOffset) then //tail of Selection is within self
		    Return OVERLAP_START
		  end if
		  
		  if selection.inRange(self.offset) and selection.inRange(self.EndOffset) then //self within selection
		    Return OVERLAP_WITHIN
		  end if
		  
		  if self.inRange(selection.offset) and self.inRange(selection.EndOffset) then
		    Return OVERLAP_CONTAINS
		  end if
		  
		  
		  Return OVERLAP_NONE
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		EndLine As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		LosesFocus As boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		Rounded As boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		SelectionColor As color
	#tag EndProperty

	#tag Property, Flags = &h0
		StartLine As Integer
	#tag EndProperty


	#tag Constant, Name = OVERLAP_CONTAINS, Type = Double, Dynamic = False, Default = \"5", Scope = Public
	#tag EndConstant

	#tag Constant, Name = OVERLAP_END, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = OVERLAP_NONE, Type = Double, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant

	#tag Constant, Name = OVERLAP_SAME, Type = Double, Dynamic = False, Default = \"7", Scope = Public
	#tag EndConstant

	#tag Constant, Name = OVERLAP_START, Type = Double, Dynamic = False, Default = \"4", Scope = Public
	#tag EndConstant

	#tag Constant, Name = OVERLAP_WITHIN, Type = Double, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = OVERLAP_WITHIN_AT_END, Type = Double, Dynamic = False, Default = \"6", Scope = Public
	#tag EndConstant

	#tag Constant, Name = OVERLAP_WITHIN_AT_START, Type = Double, Dynamic = False, Default = \"3", Scope = Public
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="DebugDescription"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="EndOffset"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="length"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="offset"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="EndLine"
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
			Name="LosesFocus"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="boolean"
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
			Name="Rounded"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="SelectionColor"
			Visible=false
			Group="Behavior"
			InitialValue="&h000000"
			Type="color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="StartLine"
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
