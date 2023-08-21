#tag Module
Protected Module SyntaxArea
	#tag Method, Flags = &h1, Description = 52657475726E732061206461726B206D6F6465206571756976616C656E7420636F6C6F7220666F722060636020696620776527726520696E206461726B206D6F64652E20417373756D65732061206C69676874206D6F646520636F6C6F7572206973207061737365642E
		Protected Function AdjustColorForDarkMode(c As Color) As Color
		  /// Returns a dark mode equivalent color for `c` if we're in dark mode.
		  /// Assumes a light mode colour is passed.
		  
		  #Pragma Warning "REFACTOR: Remove this when we have migrated to ColorGroups"
		  
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

	#tag Method, Flags = &h0, Description = 52657475726E732061206461726B657220636F6C6F757220666F722074686520676976656E20636F6C6F75722E
		Function DarkerColor(Extends forColor As Color, offset As Integer, adjustForDarkMode As Boolean) As Color
		  /// Returns a darker colour for the given colour.
		  
		  If adjustForDarkMode And Color.IsDarkMode Then
		    Return Color.RGB(Min(forColor.Red + offset, 255), Min(forColor.Green + offset, 255), Min(forColor.Blue + offset, 255))
		  Else
		    Return Color.RGB(Max(forColor.Red - offset, 0), Max(forColor.Green - offset, 0), Max(forColor.Blue - offset, 0))
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

	#tag Method, Flags = &h1
		Protected Function LoadMaskedPicture(image As Picture) As Picture
		  /// Internally used when drawing block folded markers.
		  
		  #Pragma Warning "TODO: Can this be removed if we use Retina image sets?"
		  ' Need to move away from required bundled images.
		  
		  If image = Nil Then Return Nil
		  
		  Var newPic As Picture = New Picture(image.Width / 2, Image.Height)
		  newPic.Graphics.DrawPicture(image, 0, 0)
		  
		  Return newPic
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

	#tag Method, Flags = &h1, Description = 52657475726E732054727565206966207765206E65656420746F20737570706F7274206461726B206D6F64652E
		Protected Function SupportsDarkMode() As Boolean
		  /// Returns True if we need to support dark mode.
		  
		  #If RBVersion >= 2019.02
		    #If AppSupportsDarkMode
		      Return True
		    #EndIf
		  #EndIf
		  
		  Return False
		  
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  If mBlocktrailImage = Nil Then
			    #Pragma Warning "TODO: Remove the need for a bundled image"
			    mBlocktrailImage = SyntaxArea.LoadMaskedPicture(blockFoldedTrailMarker)
			  End If
			  
			  Return mBlocktrailImage
			End Get
		#tag EndGetter
		Protected BlockFoldedTrailImage As Picture
	#tag EndComputedProperty

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

	#tag Property, Flags = &h21
		Private mBlocktrailImage As Picture
	#tag EndProperty


	#tag Constant, Name = DebugIndentation, Type = Boolean, Dynamic = False, Default = \"False", Scope = Protected, Description = 53657420746F205472756520696620796F7527726520747279696E6720746F20646562756720696E64656E746174696F6E206973737565732E
	#tag EndConstant

	#tag Constant, Name = TextStorageType, Type = Double, Dynamic = False, Default = \"SyntaxArea.TEXT_STORAGE_MEMORYBLOCK", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = TEXT_STORAGE_ARRAY, Type = Double, Dynamic = False, Default = \"1", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = TEXT_STORAGE_MEMORYBLOCK, Type = Double, Dynamic = False, Default = \"0", Scope = Protected
	#tag EndConstant


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
