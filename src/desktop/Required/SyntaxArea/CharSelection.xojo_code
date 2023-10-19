#tag Class
Protected Class CharSelection
Inherits DataRange
	#tag CompatibilityFlags = ( TargetConsole and ( Target32Bit or Target64Bit ) ) or ( TargetWeb and ( Target32Bit or Target64Bit ) ) or ( TargetDesktop and ( Target32Bit or Target64Bit ) ) or ( TargetIOS and ( Target64Bit ) ) or ( TargetAndroid and ( Target64Bit ) )
	#tag Method, Flags = &h0
		Sub Constructor(offset As Integer, length As Integer, startLine As Integer, endLine As Integer, selectionColor As Color)
		  Super.Constructor(offset, length)
		  Self.StartLine = startLine
		  Self.EndLine = endLine
		  Self.SelectionColor = selectionColor
		  
		  Self.LosesFocus = True
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsLineIndexInRange(lineIndex As Integer) As Boolean
		  Return lineIndex >= Self.StartLine And lineIndex <= Self.EndLine
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 44657465726D696E7320696620746869732073656C656374696F6E206F7665726C617073206073656C656374696F6E602E2052657475726E73206F6E65206F6620746865206053796E746178417265612E4368617253656C656374696F6E6020636F6E7374616E74732E
		Function OverlapsSelection(selection As SyntaxArea.CharSelection) As Integer
		  /// Determins if this selection overlaps `selection`.
		  /// Returns one of the `SyntaxArea.CharSelection` constants.
		  
		  If Self.Offset = selection.Offset And Self.Length = selection.Length Then
		    Return OVERLAP_SAME
		  End If
		  
		  If selection.InRange(Self.Offset) And Self.EndOffset = selection.EndOffset Then
		    Return OVERLAP_WITHIN_AT_START
		  End If
		  
		  If Self.Offset = selection.Offset And selection.InRange(Self.EndOffset) Then
		    Return OVERLAP_WITHIN_AT_END
		  End If
		  
		  If InRange(selection.Offset) And Not InRange(selection.EndOffset) Then
		    // Head is in self.
		    Return OVERLAP_END
		  End If
		  
		  If selection.InRange(Self.Offset) And Not selection.InRange(Self.EndOffset) Then
		    // The tail of `selection` is within self.
		    Return OVERLAP_START
		  End If
		  
		  If selection.InRange(Self.Offset) And selection.InRange(Self.EndOffset) Then
		    // self is within `selection`.
		    Return OVERLAP_WITHIN
		  End If
		  
		  If Self.InRange(selection.Offset) And Self.InRange(selection.EndOffset) Then
		    Return OVERLAP_CONTAINS
		  End If
		  
		  Return OVERLAP_NONE
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		EndLine As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		LosesFocus As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		Rounded As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		SelectionColor As Color
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
			Type="Boolean"
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
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="SelectionColor"
			Visible=false
			Group="Behavior"
			InitialValue="&h000000"
			Type="Color"
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
