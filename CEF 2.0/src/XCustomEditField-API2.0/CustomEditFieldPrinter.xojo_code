#tag Class
Protected Class CustomEditFieldPrinter
	#tag Method, Flags = &h0
		Sub Constructor(g as graphics, textStorage as gapBuffer, lines as linemanager, defaultColor as color, displayInvisible as boolean, indentVisually as Boolean)
		  self.g = g
		  self.TextStorage = TextStorage
		  self.lines = lines
		  self.defaultColor = defaultColor
		  self.displayInvisible = displayInvisible
		  self.indentVisually = indentVisually
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DrawBlock(x as integer, y as integer, width as integer, height as integer, lineRange as dataRange, wrap as boolean = false, lineNumbers as boolean = false) As integer
		  if g = nil then Return -1
		  
		  var minLine, maxLine as Integer
		  if lineRange = nil then //paint all
		    minLine = 0
		    maxLine = lines.Count - 1
		  else
		    minLine = lineRange.offset
		    maxLine = lineRange.offset + lineRange.length
		  end if
		  
		  var currentLine as TextLine
		  var sx, sy, lineNumOffset as Integer
		  
		  sx = x
		  sy = y + g.TextHeight - (g.TextHeight - g.FontAscent)
		  
		  if lineNumbers then
		    lineNumOffset = g.TextWidth(str(maxLine)+".") + 4
		  end if
		  
		  var linesUsed as Integer
		  
		  for i as Integer = minLine to maxLine
		    currentLine = lines.getLine(i)
		    if currentLine = nil then Continue for
		    
		    linesUsed = currentLine.PrinterPaint(TextStorage, g, sx + lineNumOffset, sy, width - lineNumOffset, defaultColor, displayInvisible, wrap, self.indentVisually)
		    
		    if lineNumbers then
		      g.DrawingColor = &c888888
		      g.DrawText str(i+1), sx + lineNumOffset - g.TextWidth(str(i+1)+".") - 2, sy
		      
		      g.DrawingColor = &cCCCCCC
		      g.DrawLine sx + lineNumOffset - 2, sy - g.FontAscent, sx + lineNumOffset - 2, sy - g.FontAscent + (g.TextHeight * linesUsed)
		    end if
		    
		    sy = sy + g.TextHeight * linesUsed
		    
		    if sy > y + height or sy > g.Height then Return i
		  next
		  
		  Return maxLine
		End Function
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected defaultColor As color
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected displayInvisible As boolean
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected g As graphics
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected indentVisually As Boolean
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected lines As linemanager
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected TextStorage As gapBuffer
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
