#tag Class
Protected Class SymbolsDefinition
	#tag Method, Flags = &h0, Description = 417070656E6473207468697320636F6E7465787420746F2074686520706172656E7420584D4C206E6F64652E20746869732069732075736564207768656E206578706F7274696E6720612073796E74617820646566696E6974696F6E20617320616E20584D4C2066696C652E
		Sub AppendToXMLNode(parent As XmlNode, depth As Integer = 2)
		  /// Appends this context to the parent XML node.
		  /// this is used when exporting a syntax definition as an XML file.
		  
		  Var xdoc As XmlDocument
		  Var node, context As XmlNode
		  
		  xdoc = parent.OwnerDocument
		  context = parent.AppendChild(xdoc.CreateElement("symbol"))
		  
		  // Name.
		  context.SetAttribute("type", type)
		  
		  // Entry regex?
		  If EntryRegex <> "" Then
		    node = context.AppendChild(xdoc.CreateElement("entryRegEx"))
		    node.AppendChild(xdoc.CreateTextNode(EntryRegEx))
		    IndentNode(node, depth + 1)
		  End If
		  
		  IndentNode(context, depth, True)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub IndentNode(node As XmlNode, level As Integer, indentCloseTag As Boolean = False)
		  Var s As String = EndOfLine
		  
		  For i As Integer = 1 To level
		    // Append a tab.
		    s = s + Chr(9)
		  Next i
		  
		  node.Parent.Insert(node.OwnerDocument.CreateTextNode(s), node)
		  
		  If indentCloseTag Then
		    node.AppendChild(node.OwnerDocument.CreateTextNode(s))
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 4C6F6164732074686520636F6E74657874206F7574206F6620616E20584D4C206E6F64652E
		Sub LoadFromXmlNode(node As XmlNode)
		  /// Loads the context out of an XML node.
		  
		  // Type.
		  Type = node.GetAttribute("type")
		  
		  // Should we optionally trim any characters from symbols after the regex match?
		  LTrim = node.GetAttribute("lTrim")
		  RTrim = node.GetAttribute("rTrim")
		  
		  Var subNode As XmlNode
		  
		  For i As Integer = 0 To node.ChildCount-1
		    subNode = node.Child(i)
		    Select Case subNode.Name
		    Case "entryRegEx"
		      EntryRegex = subNode.FirstChild.Value
		    End Select
		  Next i
		  
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mRegex
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mRegex = value
			End Set
		#tag EndSetter
		EntryRegex As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0, Description = 5468697320737472696E672077696C6C206265206C656674207472696D6D65642066726F6D207468652073796D626F6C2773206E616D652E
		#tag Getter
			Get
			  Return mLTrim
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mLTrim = value
			End Set
		#tag EndSetter
		LTrim As String
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mLTrim As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mRegex As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mRTrim As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mType As String
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0, Description = 5468697320737472696E672077696C6C206265207269676874207472696D6D65642066726F6D207468652073796D626F6C2773206E616D652E
		#tag Getter
			Get
			  Return mRTrim
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mRTrim = value
			End Set
		#tag EndSetter
		RTrim As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mType
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mType = value
			End Set
		#tag EndSetter
		Type As String
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="EntryRegex"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
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
		#tag ViewProperty
			Name="Type"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LTrim"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="RTrim"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
