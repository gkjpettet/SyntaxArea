#tag Class
Protected Class LifeTimer
	#tag Method, Flags = &h0
		Sub Constructor(name as String)
		  if DebugBuild or LogToFile then
		    mName = name
		    Debugging.DebugLog "<"+mName+"> Entered"+EndOfLine
		    mTime = System.Microseconds
		    Debugging.Depth = Debugging.Depth + 1
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Destructor()
		  if DebugBuild or LogToFile then
		    dim t as Double = System.Microseconds - mTime
		    Debugging.Depth = Debugging.Depth - 1
		    Debugging.DebugLog "<"+mName+"> "+Str(t/1000,"#.####")+"ms"+EndOfLine
		  end if
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mName As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mTime As Double
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
