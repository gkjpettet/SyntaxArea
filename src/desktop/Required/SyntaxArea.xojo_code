#tag Module
Protected Module SyntaxArea
	#tag Method, Flags = &h1, Description = 52657475726E732061206461726B206D6F6465206571756976616C656E7420636F6C6F7220666F722060636020696620776527726520696E206461726B206D6F64652E20417373756D65732061206C69676874206D6F646520636F6C6F7572206973207061737365642E
		Protected Function AdjustColorForDarkMode(c As Color) As Color
		  /// Returns a dark mode equivalent color for `c` if we're in dark mode.
		  /// Assumes a light mode colour is passed.
		  
		  #If RBVersion >= 2019.02
		    #If AppSupportsDarkMode
		      If Color.IsDarkMode Then
		        If c = Color.White Then
		          c = Color.FillColor
		        ElseIf c = Color.Black Then
		          c = Color.TextColor
		        Else
		          // Make light colors darker and vice versa.
		          c = InvertedModeColor(c)
		        End If
		      End If
		    #EndIf
		  #EndIf
		  
		  Return c
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E732061206461726B657220636F6C6F757220666F722074686520676976656E20436F6C6F722E
		Function DarkerColor(Extends forColor As Color, offset As Integer, adjustForDarkMode As Boolean) As Color
		  /// Returns a darker colour for the given Color.
		  
		  If adjustForDarkMode And Color.IsDarkMode Then
		    Return Color.RGB(Min(forColor.Red + offset, 255), Min(forColor.Green + offset, 255), Min(forColor.Blue + offset, 255))
		  Else
		    Return Color.RGB(Max(forColor.Red - offset, 0), Max(forColor.Green - offset, 0), Max(forColor.Blue - offset, 0))
		  End If
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E732061206461726B657220636F6C6F757220666F722074686520676976656E20436F6C6F7247726F75702E
		Function DarkerColor(Extends forColor As ColorGroup, offset As Integer, adjustForDarkMode As Boolean) As Color
		  /// Returns a darker colour for the given ColorGroup.
		  
		  Var c As Color = forColor
		  
		  If adjustForDarkMode And Color.IsDarkMode Then
		    Return Color.RGB(Min(c.Red + offset, 255), Min(c.Green + offset, 255), Min(c.Blue + offset, 255))
		  Else
		    Return Color.RGB(Max(c.Red - offset, 0), Max(c.Green - offset, 0), Max(c.Blue - offset, 0))
		  End If
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E7320616E20696E7665727465642076657273696F6E206F66207468652070617373656420636F6C6F75722E
		Function InvertColor(Extends c As Color) As color
		  /// Returns an inverted version of the passed colour.
		  
		  Return Color.RGB(255 - c.Red, 255 - c.Green, 255 - c.Blue)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1, Description = 4D616B6573206C6967687420636F6C6F757273206461726B657220616E6420766963652076657273612E
		Protected Function InvertedModeColor(c As Color) As Color
		  /// Makes light colours darker and vice versa.
		  
		  #If RBVersion >= 2019.02
		    #If AppSupportsDarkMode
		      If c = Color.Black Then
		        c = Color.White
		      ElseIf c = Color.White Then
		        c = Color.Black
		      Else
		        // This brightness inversion is based on trial-and-error...
		        Var lum As Double = Luminence(c)
		        If lum > 0.6 Then
		          c = LerpColor(c, Color.RGB(0, 0, 0), lum * 0.7)
		        Else
		          c = LerpColor(c, &cFFFFFF, (1 - lum) * 0.7)
		        End If
		      End If
		    #EndIf
		  #EndIf
		  
		  Return c
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function Lerp(start As Double, ende As Double, amt As Double) As Double
		  Var diff As Double = ende - start
		  Var adj As Double = diff * amt
		  
		  Return start + adj
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21, Description = 4C657270732066726F6D206F6E6520636F6C6F757220746F20616E6F746865722E
		Private Function LerpColor(fromCol As Color, toCol As Color, amount As Double) As Color
		  /// Lerps from one colour to another.
		  ///
		  /// https://stackoverflow.com/a/2690026/43615
		  
		  Var sr As Double = fromCol.Red
		  Var sg As Double = fromCol.Green
		  Var sb As Double = fromCol.Blue
		  Var er As Double = toCol.Red
		  Var eg As Double = toCol.Green
		  Var eb As Double = toCol.Blue
		  
		  Return Color.RGB(Lerp(sr, er, amount), Lerp(sg, eg, amount), Lerp(sb, eb, amount))
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E732061206C69676874657220636F6C6F757220666F722074686520676976656E20436F6C6F722E
		Function LighterColor(Extends forColor As Color, offset As Integer, adjustForDarkMode As Boolean) As Color
		  /// Returns a lighter colour for the given Color.
		  
		  If adjustForDarkMode And Color.IsDarkMode Then
		    // Lighter.
		    Return Color.RGB(Max(forColor.Red - offset, 0), Max(forColor.green - offset, 0), _
		    Max(forColor.Blue - offset, 0))
		  Else
		    Return Color.RGB(Min(forColor.Red + offset, 255), Min(forColor.green + offset, 255), _
		    Min(forColor.Blue + offset, 255))
		  End If
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E732061206C69676874657220636F6C6F757220666F722074686520676976656E20436F6C6F7247726F75702E
		Function LighterColor(Extends forColor As ColorGroup, offset As Integer, adjustForDarkMode As Boolean) As Color
		  /// Returns a lighter colour for the given ColorGroup.
		  
		  Var c As Color = forColor
		  
		  If adjustForDarkMode And Color.IsDarkMode Then
		    // Lighter.
		    Return Color.RGB(Max(c.Red - offset, 0), Max(c.green - offset, 0), _
		    Max(c.Blue - offset, 0))
		  Else
		    Return Color.RGB(Min(c.Red + offset, 255), Min(c.green + offset, 255), _
		    Min(c.Blue + offset, 255))
		  End If
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 46696E647320746865206C6F6E6765737420636F6D6D6F6E20707265666978206265747765656E2074776F20737472696E67732E
		Function LongestCommonPrefixIndex(Extends source As String, target As String) As Integer
		  /// Finds the longest common prefix between two strings.
		  
		  #Pragma DisableBackgroundTasks
		  #Pragma DisableBoundsChecking
		  
		  Var n As Integer = Min(source.Length, target.Length)
		  Var i As Integer
		  For i = 0 To n -1
		    Var mainSource As String = source.Middle(i, 1)
		    Var mainTarget As String = target.Middle(i, 1)
		    If mainSource <> mainTarget Then Exit For
		  Next i
		  
		  Return i
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21, Description = 52657475726E7320746865206C756D696E656E6365206F66206120636F6C6F75722E
		Private Function Luminence(c As Color) As Double
		  /// Returns the luminence of a colour.
		  
		  Var r As Double = c.Red
		  Var g As Double = c.Green
		  Var b As Double = c.Blue
		  
		  Return (r + r + b + g + g + g) / 6 / 255 // https://stackoverflow.com/a/596241/43615
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 5265676973746572732061206D65737361676520726563656976657220666F722061207370656369666963206D65737361676520747970652E
		Sub RegisterForMessage(Extends theReceiver As SyntaxArea.MessageReceiver, messageType As Variant)
		  /// Registers a message receiver for a specific message type.
		  
		  If MessageCentre.ReceiversForType = Nil Then
		    MessageCentre.ReceiversForType = New Dictionary
		  End If
		  
		  // Get the dictionary of receivers for this message type or create a temporary one.
		  Var d As Dictionary
		  If MessageCentre.ReceiversForType.HasKey(messageType) Then
		    d = MessageCentre.ReceiversForType.Value(messageType)
		  Else
		    d = New Dictionary
		    MessageCentre.ReceiversForType.Value(messageType) = d
		  End If
		  
		  // Store this receiver as a key in the dictionary. The value is ignored.
		  d.Value(theReceiver) = False
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Reverse(Extends s As String) As String
		  // Returns `s` with the characters in reverse order.
		  ///
		  /// From Joe Strout's StringUtils module.
		  
		  If s.Length < 2 Then Return s
		  
		  #If Not DebugBuild
		    #Pragma DisableBackgroundTasks
		    #Pragma DisableBoundsChecking
		  #EndIf
		  
		  Var characters() As String = s.Split("")
		  Var leftIndex As Integer = 0
		  Var rightIndex As Integer = characters.LastIndex
		  While leftIndex < rightIndex
		    Var temp As String = characters(leftIndex)
		    characters(leftIndex) = characters(rightIndex)
		    characters(rightIndex) = temp
		    leftIndex = leftIndex + 1
		    rightIndex = rightIndex - 1
		  Wend
		  
		  Return String.FromArray(characters, "")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 556E726567697374657273206120726563656976657220666F72206120706172746963756C6172206D65737361676520747970652E20546869732077696C6C2073746F7020746865206D6573736167652063656E7472652066726F6D2073656E64696E67206D65737361676573206F662074686973207479706520746F2074686520726563656976657220696E20746865206675747572652E
		Sub UnregisterForMessage(Extends theReceiver As SyntaxArea.MessageReceiver, messageType As Variant)
		  /// Unregisters a receiver for a particular message type. This will stop the message 
		  /// centre from sending messages of this type to the receiver in the future.
		  
		  // No receivers?
		  If MessageCentre.ReceiversForType = Nil Then Return
		  
		  // No such message?
		  If Not MessageCentre.ReceiversForType.HasKey(messageType) Then Return
		  
		  // Remove receiver.
		  Var receivers As Dictionary = MessageCentre.ReceiversForType.Value(messageType)
		  
		  // If our list of receivers for this message type contains this receiver then we
		  // need to remove it.
		  If Not receivers.HasKey(theReceiver) Then
		    Return
		  Else
		    receivers.Remove(theReceiver)
		  End If
		  
		  // If there are no longer any receivers registered for this message type
		  // we can remove the type from our dictionary.
		  If receivers.KeyCount = 0 Then MessageCentre.ReceiversForType.Remove(messageType)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 556E72656769737465727320612072656365697665722066726F6D20616C6C206D6573736167652074797065732E
		Sub UnregisterReceiver(Extends theReceiver As SyntaxArea.MessageReceiver)
		  /// Unregisters a receiver from all message types.
		  
		  // No receivers?
		  If MessageCentre.ReceiversForType = Nil Then Return
		  
		  // Find the object within our registered receivers.
		  Var receivers As Dictionary
		  Var typesToRemove() As Variant
		  Var type As Variant
		  
		  For i As Integer = 0 To MessageCentre.ReceiversForType.KeyCount - 1
		    // Message type.
		    type = MessageCentre.ReceiversForType.Key(i)
		    
		    // Get the receivers for this message type.
		    receivers = MessageCentre.ReceiversForType.Value(type)
		    
		    If Not receivers.HasKey(theReceiver) Then Continue For
		    
		    receivers.Remove(theReceiver)
		    
		    If receivers.KeyCount = 0 Then typesToRemove.Add(type)
		  Next i
		  
		  // Remove any message types that no longer have any receivers listening.
		  For Each type In typesToRemove
		    If MessageCentre.ReceiversForType.HasKey(type) Then MessageCentre.ReceiversForType.Remove(Type)
		  Next type
		  
		End Sub
	#tag EndMethod


	#tag Note, Name = Changes
		: -it - 19/10/23:ial release.
		------------
		1.0.1
		-----
		: 24/ -/24:
		1.0.2-----------
		Fixed a bug that would cause a NilObjectException if the editor was empty.
		-----
		Fixed - 25/1/24: a bug in `ViewToCharPos()` that caused very poor typing performance 
		if `E-----------ditor.EnableLineFolding` was False.
		
	#tag EndNote


	#tag ComputedProperty, Flags = &h1, Description = 54686520656E636F64696E67207573656420696E7465726E616C6C792062792053796E746178417265612E
		#tag Getter
			Get
			  // We must use either UTF-32 or UTF-8 but never UTF-16
			  // because some chars (e.g. "🔍") in UTF-16 return 2 for their
			  // Length, which is incorrect and causes errors with this code.
			  Return Encodings.UTF8
			  
			End Get
		#tag EndGetter
		Protected InternalEncoding As TextEncoding
	#tag EndComputedProperty


	#tag Constant, Name = DebugIndentation, Type = Boolean, Dynamic = False, Default = \"False", Scope = Protected, Description = 53657420746F205472756520696620796F7527726520747279696E6720746F20646562756720696E64656E746174696F6E206973737565732E
	#tag EndConstant

	#tag Constant, Name = TextStorageType, Type = Double, Dynamic = False, Default = \"SyntaxArea.TEXT_STORAGE_MEMORYBLOCK", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = TEXT_STORAGE_ARRAY, Type = Double, Dynamic = False, Default = \"1", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = TEXT_STORAGE_MEMORYBLOCK, Type = Double, Dynamic = False, Default = \"0", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = Version, Type = String, Dynamic = False, Default = \"1.1.2", Scope = Protected
	#tag EndConstant


	#tag Enum, Name = AutocompleteCombos, Flags = &h0, Description = 5468652061636365707461626C65206B657920636F6D62696E6174696F6E7320666F722074726967676572696E67206175746F636F6D706C6574696F6E2E
		CtrlSpace
		Tab
	#tag EndEnum

	#tag Enum, Name = BracketsHighlightModes, Flags = &h0, Description = 54686520646966666572656E74207761797320627261636B6574732063616E20626520686967686C6967687465642062792074686520656469746F722E
		Circle
		Highlight
	#tag EndEnum


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
End Module
#tag EndModule
