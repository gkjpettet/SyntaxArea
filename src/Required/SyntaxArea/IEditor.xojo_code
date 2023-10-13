#tag Interface
Protected Interface IEditor
	#tag Method, Flags = &h0, Description = 52657475726E732074686520706F736974696F6E206F66207468652063617265742E
		Function CaretPos() As Integer
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 536574732074686520706F736974696F6E206F662074686520636172657420696E2074686520656469746F722E
		Sub CaretPos(Assigns value As Integer)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function EnableLineFolding() As Boolean
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub EnableLineFolding(Assigns value As Boolean)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IndentVisually() As Boolean
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub IndentVisually(Assigns value As Boolean)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 496E736572747320746578742060736020617420606F6666736574602E
		Sub Insert(offset As Integer, s As String)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 496E76616C6964617465732074686520676976656E206C696E6520286D61726B7320697420666F722072652D64726177696E67292E2049662060696E64657860203C2030207468656E20612066756C6C20726566726573682077696C6C206F636375722E
		Sub InvalidateLine(index As Integer)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E7320746865206E756D626572206F6620726F777320746861742066697420696E746F207468652043616E7661732E
		Function MaxVisibleLines() As Integer
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 496E7465726E616C20757365206F6E6C792E2052657475726E732074686520656469746F722773206C696E65206D616E616765722E
		Function PrivateLines() As SyntaxArea.LineManager
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 54686973206D6574686F64206973207573656420696E7465726E616C6C792062792074686520636F6E74726F6C2C20616E642065787465726E616C6C792062792074686520756E646F206D656368616E69736D2E20596F752073686F756C646E277420757365206974206469726563746C792E20496E737465616420757365206053656C53746172746020616E64206053656C656374696F6E54657874602E
		Sub PrivateRemove(offset As Integer, length As Integer, updateCaret As Boolean = True)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 54686973206D6574686F64206973207573656420696E7465726E616C6C792062792074686520636F6E74726F6C2C20616E642065787465726E616C6C792062792074686520756E646F206D656368616E69736D2C20796F752073686F756C646E277420757365206974206469726563746C792C2075736520696E73746561642053656C656374696F6E537461727420616E642053656C656374696F6E546578742E
		Sub PrivateReplace(offset As Integer, length As Integer, s As String, alwaysMarkChanged As Boolean = True, eventID As Integer = -1, keepSelection As Boolean = False, beSilent As Boolean = False, undoable As Boolean = True)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 496E7465726E616C206D6574686F642063616C6C656420627920486967686C69676874446566696E6974696F6E732074686174206172652072657175657374696E6720612073796E74617820646566696E6974696F6E20657874656E73696F6E206E616D656420606E616D65602E
		Function RaiseRequestDefinitionExtension(name As String) As SyntaxArea.HighlightDefinition
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 54686520656469746F722073686F756C6420726564726177207468652063617265742E
		Sub RedrawCaret()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E7320746865207374617274206F66207468652063757272656E742073656C656374696F6E2E
		Function SelectionStart() As Integer
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 5365747320746865207374617274206F66207468652073656C656374696F6E2E
		Sub SelectionStart(Assigns value As Integer)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E7320746865207374796C6520746F2075736520666F7220746865206E616D656420746F6B656E2E20466972737420747269657320746F2066696E642061207374796C65206E616D656420607072696D617279602E204966207468617420646F65736E2774206578697374207468656E206C6F6F6B7320666F722061207374796C65206E616D6564206066616C6C6261636B602E204966206E6F206D61746368696E67207374796C6520657869737473207468656E207468652064656661756C74207374796C652069732072657475726E65642E
		Function StyleForToken(primary As String, fallbackName As String = "") As SyntaxArea.TokenStyle
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E732074686520656469746F7227732064656661756C74207465787420636F6C6F75722E
		Function TextColor() As Color
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 53657473207468652064656661756C74207465787420636F6C6F757220666F722074686520656469746F722E
		Sub TextColor(Assigns c As Color)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E7320746865206C656E677468206F6620746865207465787420696E207468697320656469746F722E
		Function TextLength() As Integer
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function VisibleLineRange() As SyntaxArea.DataRange
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub VisibleLineRange(Assigns value As SyntaxArea.DataRange)
		  
		End Sub
	#tag EndMethod


	#tag Note, Name = About
		This interface stipulates the required methods that a SyntaxArea code editor must implement.
		It exists to allow us to share code between desktop and mobile platforms since most classes (like the 
		line highlighter, syntax definitions, etc) are cross platform but the actual canvas editors are platform-specific.
		
		
	#tag EndNote


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
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
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
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
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Interface
#tag EndInterface
