#tag Class
Protected Class DataRange
	#tag Method, Flags = &h0
		Sub Constructor()
		  Constructor(0, 0)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(offset As Integer, length As Integer)
		  mOffset = offset
		  mLength = length
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function InRange(offset As Integer) As Boolean
		  Return offset >= mOffset And offset < mOffset + mLength
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function OverlapsOrTouchesRange(other As SyntaxArea.DataRange) As Boolean
		  Return Self.Offset <= other.EndOffset And other.Offset <= Self.EndOffset
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function OverlapsRange(other As SyntaxArea.DataRange) As Boolean
		  Return Self.Offset < other.EndOffset And other.Offset < Self.EndOffset
		End Function
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event LengthChanged()
	#tag EndHook


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return "[" + mOffset.ToString + "," + EndOffset.ToString + "["
			  
			End Get
		#tag EndGetter
		DebugDescription As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return Offset + Length
			End Get
		#tag EndGetter
		EndOffset As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mLength
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If mLength = value Then Return
			  mLength = value
			  LengthChanged
			End Set
		#tag EndSetter
		Length As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mLength As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mOffset As Integer
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mOffset
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mOffset = value
			  
			End Set
		#tag EndSetter
		Offset As Integer
	#tag EndComputedProperty


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
			Name="length"
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
			Name="offset"
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
