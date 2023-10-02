#tag Class
Protected Class LineHighlighter
Inherits Thread
	#tag CompatibilityFlags = ( TargetConsole and ( Target32Bit or Target64Bit ) ) or ( TargetWeb and ( Target32Bit or Target64Bit ) ) or ( TargetDesktop and ( Target32Bit or Target64Bit ) ) or ( TargetIOS and ( Target64Bit ) ) or ( TargetAndroid and ( Target64Bit ) )
	#tag Event
		Sub Run()
		  Var owner As SyntaxArea.IEditor = Self.Owner
		  If owner = Nil Then Return
		  
		  Var lock As SyntaxArea.LinesLock
		  If Not owner.IndentVisually Then
		    lock = New SyntaxArea.LinesLock(owner)
		  End If
		  
		  Do
		    ProcessVisibleLines
		    ProcessDirtyLines
		    If changedLines.RangeCount = 0 Then Exit
		  Loop
		  
		  HighlightingDone
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Constructor(owner As SyntaxArea.IEditor, definition As SyntaxArea.HighlightDefinition, changedLines As SyntaxArea.ModifiedLineRangeManager, buffer As SyntaxArea.GapBuffer, lines As SyntaxArea.LineManager)
		  Self.Definition = definition
		  Self.ChangedLines = changedLines
		  Self.Buffer = buffer
		  Self.mLines = New WeakRef(lines)
		  Self.mOwner = New WeakRef(owner)
		  Self.Priority = Thread.HighPriority
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DoneWithScreenLines()
		  If Not MessageCentre.IsMessageInQueue(Self, Messages.MessageType, Messages.ScreenLinesHighlighted) Then
		    Var msg As New MessageCentre.Message(Self, Self)
		    msg.AddInfo(Messages.MessageType, Messages.ScreenLinesHighlighted)
		    MessageCentre.sendMessage(msg)
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HighlightingDone()
		  If Not MessageCentre.IsMessageInQueue(Self, Messages.MessageType, Messages.HighlightDone) Then
		    Var msg As New MessageCentre.Message(Self, Self)
		    msg.AddInfo(Messages.MessageType, Messages.HighlightDone)
		    MessageCentre.QueueMessage(msg)
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub HighlightLine(index As Integer)
		  #Pragma DisableBackgroundTasks
		  
		  Var lock As New SyntaxArea.LinesLock(Owner)
		  #Pragma Unused lock
		  
		  Var line, previous, nextLine As SyntaxArea.TextLine
		  Var context, previousContext As SyntaxArea.HighlightContext
		  Var processed As Integer
		  
		  Var lineFoldingsEnabled As Boolean = Owner.EnableLineFolding
		  
		  Var lines As LineManager = SyntaxArea.LineManager(mLines.Value)
		  
		  // Get the line.
		  line = lines.GetLine(index)
		  
		  // The line can be Nil if it's no longer in the document.
		  If line = Nil Then Return
		  
		  // Get the context of the previous line.
		  previous = lines.GetLine(index - 1)
		  If previous <> Nil Then
		    context = previous.Context
		  End If
		  
		  previousContext = line.Context
		  context = line.Highlight(Definition, Buffer, context)
		  
		  // Restore fold markers.
		  // If the line is a blockStart, or if it was and it's folded, check the fold markers.
		  If lineFoldingsEnabled And(line.IsBlockStart Or (line.Folded And Not line.IsBlockStart)) Then
		    nextLine = lines.GetLine(lines.NextBlockEndLine(index, True))
		    If nextLine <> Nil And((line.Folded <> Not nextLine.Visible) Or _
		      (line.Folded And Not line.IsBlockStart)) Then
		      // If we got to this point, it's because it's a startblock in an invalid state.
		      Call lines.ToggleLineFolding(index)
		    End If
		  End If
		  
		  LineHighlighted(index)
		  processed = processed + 1
		  
		  If context <> Nil Then
		    // Scan next.
		    Do
		      index = index + 1
		      line = lines.GetLine(index)
		      If line = Nil Then Exit Do
		      If line.Context = context Then Continue
		      context = line.Highlight(Definition, Buffer, context)
		      processed = processed + 1
		      LineHighlighted(index)
		    Loop Until context = Nil
		    
		    // Add final line.
		    line = lines.GetLine(index + 1)
		    If line <> Nil Then
		      Owner.InvalidateLine(index + 1)
		      Call ChangedLines.AddRange(index + 1, 1) // It will be highlighted in a future pass.
		    End If
		    
		    // If the ontext changed.
		  ElseIf previousContext <> context Then
		    
		    index = index + 1
		    line = lines.GetLine(index)
		    While line <> Nil And line.Context = previousContext
		      context = line.Highlight(Definition, Buffer, context)
		      processed = processed + 1
		      LineHighlighted(index)
		      index = index + 1
		      line = lines.GetLine(index)
		    Wend
		    
		    // Final line.
		    If line <> Nil Then
		      Call ChangedLines.AddRange(index, 1)
		      Owner.InvalidateLine(index)
		    End If
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub LineHighlighted(index As Integer)
		  Var msg As New MessageCentre.Message(Self, Self)
		  msg.AddInfo(Messages.MessageType, Messages.LineHighlighted)
		  msg.AddInfo(2, index)
		  MessageCentre.SendMessage(msg)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ProcessDirtyLines()
		  Do
		    Var lock As SyntaxArea.LinesLock
		    
		    Try
		      lock = New SyntaxArea.LinesLock(Owner)
		      
		      Var lineIdx As Integer
		      
		      If Not changedLines.RemoveNextLine(lineIdx) Then
		        Exit Do
		      End If
		      
		      HighlightLine(lineIdx)
		      
		    Exception exc As ThreadEndException
		      lock = Nil
		      Return
		    End Try
		  Loop
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ProcessVisibleLines()
		  Var lock As New SyntaxArea.LinesLock(Owner)
		  
		  Try
		    Var needsRefresh As Boolean
		    
		    Var startLine As Integer = Owner.VisibleLineRange.Offset
		    Var endLine As Integer = Max(Owner.MaxVisibleLines, Owner.VisibleLineRange.length) - startLine + 1
		    
		    For lineIdx As Integer = startLine To endLine
		      If ChangedLines.RemoveLine(lineIdx) Then
		        // This is a dirty line that needs processing.
		        HighlightLine(lineIdx)
		        needsRefresh = True
		      End If
		    Next lineIdx
		    
		    If needsRefresh Then
		      DoneWithScreenLines
		    End If
		    
		  Exception exc As ThreadEndException
		    lock = Nil
		    Return
		  End Try
		  
		End Sub
	#tag EndMethod


	#tag Note, Name = About
		This class relies on ModifiedLineRangeManager to rememmber which lines have already been modified.
		Modified lines get added to it, and this class fetches lines from it, thereby 
		removing them from the ModifiedLineRangeManager. This avoids duplicate handling 
		unless a line gets changed again afterwards.
	#tag EndNote


	#tag Property, Flags = &h1
		Protected Buffer As SyntaxArea.GapBuffer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected ChangedLines As SyntaxArea.ModifiedLineRangeManager
	#tag EndProperty

	#tag Property, Flags = &h0
		Definition As SyntaxArea.HighlightDefinition
	#tag EndProperty

	#tag Property, Flags = &h1
		#tag Note
			LineManager
		#tag EndNote
		Protected mLines As WeakRef
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mOwner As WeakRef
	#tag EndProperty

	#tag ComputedProperty, Flags = &h21
		#tag Getter
			Get
			  If mOwner <> Nil Then
			    Return SyntaxArea.IEditor(mOwner.Value)
			  Else
			    // Stop the thread, since the owner is no longer valid.
			    Self.Stop
			    Return Nil
			  End If
			  
			End Get
		#tag EndGetter
		Private Owner As SyntaxArea.IEditor
	#tag EndComputedProperty


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
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Priority"
			Visible=true
			Group="Behavior"
			InitialValue="5"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="StackSize"
			Visible=true
			Group="Behavior"
			InitialValue="0"
			Type="UInteger"
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
	#tag EndViewBehavior
End Class
#tag EndClass
