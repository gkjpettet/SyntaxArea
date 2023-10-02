#tag Class
Protected Class LinesLock
	#tag Method, Flags = &h0, Description = 41637175697265732061206C6F636B206F6E20746865206C696E65206D616E616765722E
		Sub Constructor(editor As SyntaxArea.IEditor)
		  /// Acquires a lock on the line manager.
		  
		  Var lineMgr As SyntaxArea.LineManager = editor.PrivateLines
		  
		  If lineMgr.LinesLock = Nil Then
		    lineMgr.LinesLock = New CriticalSection
		  End If
		  
		  lineMgr.LinesLock.Enter
		  
		  mLineMgr = lineMgr
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21, Description = 52656C6561736520746865206C6F636B2E
		Private Sub Destructor()
		  /// Release the lock.
		  
		  If mLineMgr <> Nil Then
		    mLineMgr.LinesLock.Leave
		  End If
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mLineMgr As SyntaxArea.LineManager
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
