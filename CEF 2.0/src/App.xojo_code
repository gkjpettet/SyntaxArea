#tag Class
Protected Class App
Inherits DesktopApplication
	#tag Event
		Sub DocumentCreated()
		  self.AllowAutoQuit = true
		End Sub
	#tag EndEvent

	#tag Event
		Sub Opening()
		  #if TargetLinux
		    // Adjust control and font sizes on Linux. See the About note in the modGTK3 module
		    modGTK3.initGtkEntryFix  // adjusts the char-widths property of GtkEntry to be 0
		    modGTK3.initGtkWidgetHeightFix // adjusts all controls to be at least their minimum height
		    modGTK3.InitGlobalGTK3Style  // various CSS tweaks to override theme CSS
		  #endif
		End Sub
	#tag EndEvent

	#tag Event
		Function UnhandledException(error As RuntimeException) As Boolean
		  var md As New MessageDialog
		  var trimmedStack() As String
		  trimmedStack = error.Stack
		  // Prepare the error dialog
		  md.Message = "Oops??"
		  md.Explanation = error.Message + EndOfLine + EndOfLine + _
		  "Please send this information to the developer." + EndOfLine + _
		  String.FromArray( trimmedStack, EndOfLine )
		  md.ActionButton.Caption = "Quit"
		  md.CancelButton.Caption = "Continue"
		  md.CancelButton.Visible = True
		  // if the user decided to quit, rather than tempt fate,
		  // we should quit.
		  If md.ShowModal = md.ActionButton Then
		    Quit
		  End If
		  
		  Return true
		End Function
	#tag EndEvent


	#tag MenuHandler
		Function FileNewWIndow() As Boolean Handles FileNewWIndow.Action
		  var win as new DemoWindow
		  win.Show
		  Return True
		  
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function FileOpenFile() As Boolean Handles FileOpenFile.Action
		  var file as FolderItem = FolderItem.ShowOpenFileDialog("")
		  if file = nil then Return true
		  
		  var stream as BinaryStream = BinaryStream.Open(file)
		  if stream = nil then Return true
		  
		  var tmp as new MemoryBlock(stream.Length)
		  tmp.StringValue(0, stream.Length) = stream.Read(stream.Length)
		  stream.Close
		  
		  var encoding as TextEncoding = DemoWindow.GuessEncoding(tmp.StringValue(0, tmp.size))
		  
		  if encoding <> nil and not encoding.Equals(Encodings.UTF16) and not encoding.Equals(Encodings.UTF8) then encoding = nil
		  
		  var w as new DemoWindow
		  w.TestField.Text = tmp.StringValue(0, tmp.Size).defineEncoding(encoding)
		  'w.TestField.ClearDirtyLines
		  w.Show
		  
		  Return True
		  
		End Function
	#tag EndMenuHandler


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  var f as FolderItem = App.ExecutableFile.Parent
			  
			  #if TargetMacOS
			    
			    while f.Name <> "Contents"
			      f = f.Parent
			    wend
			    f = f.Child("Resources")
			    
			  #else
			    
			    var parent as FolderItem = f
			    f = parent.Child("Resources")
			    if not f.Exists then
			      var appName as string = App.ExecutableFile.Name
			      if appName.Right(4) = ".exe" then
			        appName = appName.Left(appName.Length - 4)
			      end if
			      f = parent.Child(appName + " Resources")
			    end if
			    
			    if not f.Exists then
			      f = nil
			    end if
			    
			  #endif
			  
			  return f
			  
			End Get
		#tag EndGetter
		ResourcesFolder As FolderItem
	#tag EndComputedProperty


	#tag Constant, Name = AppName, Type = String, Dynamic = False, Default = \"CustomEditField Demo", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kEditClear, Type = String, Dynamic = False, Default = \"&Delete", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"&Delete"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"&Delete"
	#tag EndConstant

	#tag Constant, Name = kFileQuit, Type = String, Dynamic = False, Default = \"&Quit", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"E&xit"
	#tag EndConstant

	#tag Constant, Name = kFileQuitShortcut, Type = String, Dynamic = False, Default = \"", Scope = Public
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"Cmd+Q"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"Ctrl+Q"
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=false
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=false
			Group="ID"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=false
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=false
			Group="Position"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=false
			Group="Position"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowAutoQuit"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowHiDPI"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="BugVersion"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Copyright"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Description"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LastWindowIndex"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="MajorVersion"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="MinorVersion"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="NonReleaseVersion"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="RegionCode"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="StageCode"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Version"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="_CurrentEventTime"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
