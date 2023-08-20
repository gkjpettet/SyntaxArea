#tag Class
Protected Class TextLine
Inherits SyntaxArea.TextSegment
	#tag CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit)) or  (TargetIOS and (Target64Bit)) or  (TargetAndroid and (Target64Bit))
	#tag Event
		Sub LengthChanged()
		  IsDirty = true
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21, Description = 417070656E6473206120776F726420746F2074686973206C696E652E
		Private Sub AddWord(word As SyntaxArea.TextSegment)
		  /// Appends a word to this line.
		  
		  If word.Length = 0 Then Return
		  
		  Words.Add(word)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 49662061206C696E65206765747320757064617465642C2061206E657720546578744C696E65206F626A656374206973206F6674656E20637265617465642E205468656E2074686973206D6574686F642069732063616C6C656420736F207468617420757365722D7365747461626C652070726F706572746965732063616E2062652063617272696564206F7665722E
		Sub AdoptLine(from As SyntaxArea.TextLine)
		  /// If a line gets updated, a new TextLine object is often created.
		  /// Then this method is called so that user-settable properties can
		  /// be carried over.
		  
		  mLineAttributes = from.mLineAttributes
		  
		  mIndentationStateIn = from.mIndentationStateIn
		  mIndentationStateOut = from.mIndentationStateOut
		  mChangedIndentState = from.mChangedIndentState
		  mIsBlkStart = from.mIsBlkStart
		  mIsBlkEnd = from.mIsBlkEnd
		  mBlockIndent = from.mBlockIndent
		  mBlockStartRule = from.mBlockStartRule
		  mBlockEndRule = from.mBlockEndRule
		  IsContinuedFromLine = from.IsContinuedFromLine
		  
		  InvalidateWords()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AppendHighlightedWords(storage() As SyntaxArea.CharSelection, lineIndex As Integer)
		  For Each word As SyntaxArea.TextSegment In words
		    If word.HasBackgroundColor Then
		      Var tmp As New SyntaxArea.CharSelection(Self.Offset + word.Offset, word.Length, lineIndex, lineIndex, word.BackgroundColor)
		      storage.Add(tmp)
		    End If
		  Next word
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function BlockEndRule() As Object
		  Return mBlockEndRule
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function BlockStartRule() As Object
		  Return mBlockStartRule
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ChangedIndentStateAndReset() As Boolean
		  Var b As Boolean = mChangedIndentState
		  
		  mChangedIndentState = False
		  
		  Return b
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CharToDisplayAt(buffer As SyntaxArea.Gapbuffer, index As Integer, displayInvisible As Boolean) As String
		  Var theChar As String = buffer.GetCharAt(Self.Offset + index)
		  
		  Select Case theChar
		  Case " "
		    Return " "
		    
		  Case Chr(9)
		    Return TABCHAR
		    
		  Case Chr(10), Chr(13)
		    If displayInvisible Then
		      Return VISIBLE_EOL_CHAR
		    Else
		      Return ""
		    End If
		    
		  Else
		    Return theChar
		  End Select
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(offset As Integer, length As Integer, delimiterLength As Integer, tabWidth As Integer, indent As Integer, lineContIdx As Integer)
		  Visible = True
		  Folded = False
		  mLineAttributes = New SyntaxArea.TextLineAttributes
		  Super.Constructor(offset, length)
		  Self.DelimiterLength = delimiterLength
		  Self.TabWidth = tabWidth
		  Self.Indent = indent
		  Self.IsContinuedFromLine = lineContIdx
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetAttributes() As SyntaxArea.TextLineAttributes
		  Return mLineAttributes
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HasPlaceholders() As Boolean
		  Return Placeholders.LastIndex > -1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Highlight(definition As SyntaxArea.Highlightdefinition, storage As SyntaxArea.GapBuffer, forcedContext As SyntaxArea.Highlightcontext = Nil, defaultColor As Color = &c0) As SyntaxArea.Highlightcontext
		  #Pragma DisableBackgroundTasks
		  
		  Words.ResizeTo(-1)
		  Placeholders.ResizeTo(-1)
		  LineSymbols = Nil
		  Highlighted = False
		  
		  If Me.Length = 0 Then Return Nil
		  
		  If definition = Nil Then
		    ParseLine(storage, defaultColor)
		    Return Nil
		  End If
		  
		  Var myText As String = storage.GetText(offset, length)
		  
		  // Run the highlighter, using this line as input and adding an extra EOL to make sure 
		  // the definition matches EOLs.
		  Context = definition.Highlight(myText + chr(13), Words, Placeholders, forcedContext)
		  
		  // As we added an extra eol, remove it.
		  Call Words.Pop
		  
		  LineSymbols = definition.ScanSymbols(myText)
		  
		  // If the highlighter returned a non-Nil context, we need to inform the Highlight thread, 
		  // so it highlights the next line with the current context.
		  highlighted = True
		  Return Context
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52656D6F76657320616C6C20776F7264732066726F6D2074686973206C696E652E
		Sub InvalidateWords()
		  /// Removes all words from this line.
		  
		  Words.ResizeTo(-1)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsBlockEnd(forRule As Object = Nil) As Boolean
		  Return mIsBlkEnd And(forRule = Nil Or forRule = mBlockEndRule)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsBlockStart(forRule As Object = Nil) As Boolean
		  Return mIsBlkStart And mBlockIndent <> 0 And(forRule = Nil Or forRule = mBlockStartRule)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LocalSegmentForXPos(xpos As Integer) As SyntaxArea.TextSegment
		  #If Not DebugBuild
		    #Pragma DisableBackgroundTasks
		    #Pragma DisableBoundsChecking
		  #EndIf
		  
		  Var sum As Single
		  Var word As SyntaxArea.TextSegment
		  For Each word In Words
		    If xpos >= sum And xpos <= sum + Word.Width Then
		      Exit For
		    End If
		    sum = sum + Word.width
		  Next word
		  
		  If word = Nil Then Return Nil
		  
		  // The desired x position is within `word`.
		  Return word
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function NextPlaceholderFromOffset(offset As Integer) As SyntaxArea.TextPlaceholder
		  If Not Self.HasPlaceholders Then Return Nil
		  
		  For Each placeholder As SyntaxArea.TextPlaceholder In Placeholders
		    If Placeholder.Offset + Self.Offset > offset Then Return placeholder
		  Next placeholder
		  
		  Return Nil
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 44726177732074686973206C696E652E
		Sub Paint(storage As SyntaxArea.GapBuffer, g As Graphics, x As Double, y As Double, defaultColor As Color, displayInvisible As Boolean, selStart As Integer, selLength As Integer, showLeadingSpace As Boolean, indentVisually As Boolean)
		  /// Draws this line.
		  
		  #If Not DebugBuild
		    #Pragma DisableBackgroundTasks
		    #Pragma DisableBoundsChecking
		  #EndIf
		  
		  // If there are no words in this line, we need to at least quick-parse it 
		  // so we can display it.
		  If Words.LastIndex < 0 And Length > 0 Then
		    ParseLine(storage, defaultColor)
		  End If
		  
		  If indentVisually Then x = Self.Indent + x
		  
		  Width = 0
		  Var TheText As String
		  Var word As SyntaxArea.TextSegment
		  Var wordFound As Boolean
		  Var darkerHighlightColor As Color = Color.HighlightColor.DarkerColor(50, True)
		  
		  // Paint the tokens.
		  For i As Integer = 0 To Words.LastIndex
		    word = Words(i)
		    g.DrawingColor = darkerHighlightColor
		    
		    Var selfWordOfs As Integer = word.Offset + Self.Offset
		    
		    If word.TYPE = TYPE_SPACE Then
		      TheText = " "
		      If Not showLeadingSpace And Not wordFound Then Continue For
		      
		    ElseIf Word.TYPE = TYPE_TAB Then
		      TheText = TABCHAR
		      If Not showLeadingSpace And Not wordFound Then Continue For
		      
		    ElseIf Word.TYPE = TYPE_EOL Then
		      If displayInvisible Then
		        TheText = VISIBLE_EOL_CHAR
		      Else
		        TheText = ""
		      End If
		      If Not showLeadingSpace And Not wordFound Then Continue For
		      
		    ElseIf word.TYPE = TYPE_PLACEHOLDER Then
		      wordFound = True
		      // Determine the highlight colour
		      If highlighted Then
		        g.DrawingColor = SyntaxArea.AdjustColorForDarkMode(word.TextColor)
		      Else
		        g.DrawingColor = defaultColor
		      End If
		      
		      // `Graphics.DrawText()` can't handle UTF-32 (on OSX, at least)...
		      TheText = storage.GetText(SyntaxArea.TextPlaceholder(word).TextRange.Offset + offset, SyntaxArea.TextPlaceholder(word).TextRange.Length).ConvertEncoding(Encodings.UTF8)
		      TheText = PLACEHOLDER_PADDING_STRING + TheText + PLACEHOLDER_PADDING_STRING
		      
		    Else
		      wordFound = True
		      // Determine the highlight colour.
		      If highlighted Then
		        g.DrawingColor = SyntaxArea.AdjustColorForDarkMode(word.TextColor)
		      Else
		        g.DrawingColor = defaultColor
		      End If
		      TheText = storage.GetText(selfWordOfs, word.Length)
		      
		      #If SyntaxArea.Replace00With01
		        // Convert Chr(1), which we use for original NUL chars, to a "NUL" character for display.
		        TheText = TheText.ReplaceAll(Chr(1), "␀")
		      #else
		        TheText = TheText.ReplaceAll(Chr(0), "␀")
		      #EndIf
		    End If
		    
		    g.Bold = Word.Bold Or bold
		    g.Underline = Word.Underline Or underline
		    g.Italic = word.Italic Or italic
		    
		    // Cache the width.
		    If word.LastFont <> g.FontName Or word.LastSize <> g.FontSize Or showInvisible <> displayInvisible Then
		      word.Width = -1
		    End If
		    If word.Width < 0 Then
		      word.Width = g.TextWidth(TheText)
		    End If
		    
		    // Draw the text.
		    If(word.Type = TYPE_WORD Or word.Type = TYPE_PLACEHOLDER Or displayInvisible) And x + word.Width >= 0 And x < g.Width And y >= 0 And y <= g.Height + g.TextHeight Then
		      If Word.TYPE = TYPE_TAB Then
		        // A hack to make the visible character the same width as the tab.
		        TheText = VISIBLE_TAB_CHAR
		      ElseIf Word.TYPE = TYPE_SPACE Then
		        TheText = VISIBLE_SPACE_CHAR
		      End If
		      
		      If word.TYPE = TYPE_PLACEHOLDER Then
		        Var oldc As Color = g.DrawingColor
		        Var colorOffset As Integer = 0
		        
		        // Make the colour darker if the placeholder is in selection.
		        If selfWordOfs >= selStart And selfWordOfs + Word.Length <= selStart + selLength Then
		          colorOffset = 50
		          oldc = oldc.InvertColor
		        End If
		        
		        Var baseCol As Color = SyntaxArea.TextPlaceholder(word).PlaceholderBackgroundColor
		        g.DrawingColor = baseCol.DarkerColor(colorOffset, True)
		        g.FillRoundRectangle(x, y - g.FontAscent, word.Width, g.TextHeight + 1, g.TextHeight, g.TextHeight)
		        
		        g.DrawingColor = baseCol.DarkerColor(30, True).DarkerColor(colorOffset, True)
		        g.DrawRoundRectangle(x, y - g.FontAscent, word.Width, g.TextHeight + 1, g.TextHeight, g.TextHeight)
		        
		        g.DrawingColor = oldc
		      End If
		      
		      #If TargetMacOS
		        // Draw the word normally
		        g.DrawText(TheText, x, y)
		        
		      #Else
		        // On Windows and Linux, selection colours are usually rather dark, which
		        // in turn requires the text to be shown in white when it's selected.
		        If _
		          selLength > 0 And _
		          (selStart < selfWordOfs + word.Length) And _ // Does the selection start before end of this word?
		          (selStart + selLength > selfWordOfs) Then // Does the selection end after start of this word?
		          // if part of the text is selected, we need to split it up into the selected and unselected part,
		          // and draw them in different colors
		          
		          Var l1, l2, l3 As Integer
		          Var t1, t2, t3 As String
		          Var w As Double
		          Var normalColor As Color = g.DrawingColor
		          
		          // The part before the selection.
		          l1 = Max(0, selStart - selfWordOfs)
		          
		          // The part inside the selection.
		          l2 = selLength - Max(0, selfWordOfs - selStart)
		          
		          // The part after the selection.
		          l3 = word.Length - (l1 + l2)
		          
		          t1 = TheText.Left(l1)
		          t2 = TheText.Middle(l1, l2)
		          t3 = TheText.Middle(l1 + l2)
		          
		          If t1 <> "" Then
		            g.DrawText(t1, x, y)
		            w = g.TextWidth(t1)
		          End If
		          
		          g.DrawingColor = SyntaxArea.AdjustColorForDarkMode(&cFFFFFF)
		          g.DrawText(t2, x + w, y)
		          
		          If t3 <> "" Then
		            w = g.TextWidth(t1 + t2)
		            g.DrawingColor = normalColor
		            g.DrawText(t3, x + w, y)
		          End If
		          
		        Else
		          // Draw the word normally.
		          g.DrawText(TheText, x, y)
		        End If
		      #EndIf
		      
		    End If
		    
		    x = x + word.Width
		    width = width + Word.Width
		    word.LastFont = g.FontName
		    word.LastSize = g.FontSize
		  Next
		  
		  // Ellipsis image.
		  If folded Then
		    Var img As Picture = SyntaxArea.BlockFoldedTrailImage
		    g.DrawPicture(img, x + 3, y - g.FontAscent + (g.TextHeight - img.Height) / 2 + 1)
		  End If
		  
		  showInvisible = displayInvisible
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub ParseLine(buffer as gapBuffer, defaultColor as color)
		  //quick parses a line, splitting it using spaces and tabs
		  // http://support.realsoftware.com/listarchives/gettingstarted/2005-05/msg00157.html
		  
		  redim Words(-1)
		  var TheText as String = buffer.getText(offset, length)
		  if TheText.Encoding <> nil then TheText = TheText.ConvertEncoding(EditFieldGlobals.InternalEncoding)
		  
		  static scanner as new RegEx ' let's make this static to avoid hard crashes on OS X with RB 2012r2.1
		  
		  scanner.SearchPattern = "[ ]|\t|\x0A|(?:\x0D\x0A?)"
		  
		  var match as RegExMatch
		  var offset, length, subStart as Integer
		  var char as String
		  
		  #if DebugBuild
		    var tmp as String
		  #endif
		  
		  match = scanner.Search(TheText)
		  while match <> nil
		    subStart = TheText.LeftBytes(match.SubExpressionStartB(0)).Length
		    
		    length = substart - offset
		    //everything from last position up to this whitespace
		    addWord new TextSegment(offset, length, TextSegment.TYPE_WORD, defaultColor)
		    #if DebugBuild
		      tmp = buffer.getText(offset + self.offset, length)
		    #endif
		    offset = substart + match.SubExpressionString(0).Length
		    
		    //sort out the whitespace
		    char = match.SubExpressionString(0)
		    #if DebugBuild
		      tmp = char
		      tmp = buffer.getText(substart + self.offset, match.SubExpressionString(0).Length)
		    #endif
		    
		    select case char
		    case chr(9) //tab
		      addWord new TextSegment(substart, match.SubExpressionString(0).Length, TextSegment.TYPE_TAB, defaultColor)
		    case " "//space
		      addWord new TextSegment(substart, match.SubExpressionString(0).Length, TextSegment.TYPE_SPACE, defaultColor)
		    case chr(10), chr(13), chr(13) + chr(10)//eol
		      addWord new TextSegment(substart, match.SubExpressionString(0).Length, TextSegment.TYPE_EOL, defaultColor)
		    end select
		    
		    match = scanner.Search
		  wend
		  
		  //add any trailing text
		  if offset<  TheText.Length then
		    addWord new TextSegment(offset, TheText.Length - offset, TextSegment.TYPE_WORD, defaultColor)
		    #if DebugBuild
		      tmp = TheText.Middle(offset)
		    #endif
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PlaceholderForOffset(offset as Integer) As TextPlaceholder
		  for each placeholder as TextPlaceholder in Placeholders
		    if Placeholder.inRange(offset - self.offset) then Return Placeholder
		  next
		  Return nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PrinterPaint(storage as gapBuffer, g as graphics, x as double, y as double, w as integer, defaultColor as color, displayInvisible as boolean, wrap as boolean, indentVisually as Boolean) As integer
		  //draws this line
		  #if not DebugBuild
		    #pragma DisableBackgroundTasks
		    #pragma DisableBoundsChecking
		    
		  #endif
		  
		  var ox, lines as Integer
		  ox = x
		  lines = 1
		  
		  //if there are no words in this line, we need to at least quick-parse it so we can display it.
		  if Words.LastIndex < 0 and length > 0 then
		    ParseLine(storage, defaultColor)
		  end if
		  
		  var words() as TextSegment
		  
		  width = 0
		  var text as String
		  var word as TextSegment
		  
		  //make copies of tokens, in case we need to split
		  for each word in self.words
		    words.Add word.Clone
		  next
		  
		  //paint tokens
		  for i as Integer = 0 to words.LastIndex
		    Word = words(i)
		    g.DrawingColor = Color.HighlightColor.darkerColor(50, false)
		    
		    if word.TYPE = TYPE_SPACE then
		      text = " "
		      
		    ElseIf Word.TYPE = TYPE_TAB then
		      text = TABCHAR
		      
		    elseif Word.TYPE = TYPE_EOL then
		      if displayInvisible then
		        text = VISIBLEEOLCHAR
		      else
		        text = ""
		      end if
		      
		    elseif word.TYPE = TYPE_PLACEHOLDER then
		      //Highlight color
		      if highlighted then
		        g.DrawingColor = word.textColor
		      else
		        g.DrawingColor = defaultColor
		      end if
		      text = PlaceholderPaddingString + storage.getText(TextPlaceholder(word).textRange.offset + offset, TextPlaceholder(word).textRange.length) + PlaceholderPaddingString
		      
		    else
		      //Highlight color
		      if highlighted then
		        g.DrawingColor = word.textColor
		      else
		        g.DrawingColor = defaultColor
		      end if
		      text = storage.getText(word.offset + offset, word.length)
		    end if
		    
		    g.Bold = Word.bold or bold
		    g.Underline = Word.underline or underline
		    g.Italic = word.italic or italic
		    
		    //cache width
		    if word.lastFont <> g.FontName or word.lastSize <> g.FontSize or showInvisible <> displayInvisible then
		      word.width = -1
		    end if
		    if word.width < 0 then
		      word.width = g.TextWidth(text)
		    end if
		    
		    //text wrap
		    if x + word.width > ox + w then
		      //split word?
		      if Word.width > w then
		        var idx as Integer
		        for idx = 1 to word.length
		          if g.TextWidth(storage.getText(word.offset + offset, idx)) >= w then exit for
		        next
		        idx = idx - 1
		        var tmp as TextSegment = word.SplitAtLength(idx)
		        if wrap then words.AddAt i + 1, tmp
		        i = i - 1
		        Continue for
		      elseif wrap then
		        y = y + g.TextHeight
		        x = ox
		        lines = lines + 1
		      else //just clip
		        Return lines
		      end if
		    end if
		    
		    //draw background, if any
		    if word.hasBackgroundColor and word.Type <> word.TYPE_EOL then
		      var oc as Color = g.DrawingColor
		      g.DrawingColor = word.backgroundColor
		      g.FillRectangle Ceiling(x), y - g.FontAscent, Ceiling(word.width), g.TextHeight + 1
		      g.DrawingColor = oc
		    end if
		    
		    //draw txt
		    if (word.Type = TYPE_WORD or word.Type = TYPE_PLACEHOLDER or displayInvisible) and x + word.width >= 0 and  x < g.Width and y >= 0 and y <= g.Height + g.TextHeight  then
		      if Word.TYPE = TYPE_TAB then
		        Text = VISIBLETABCHAR //a small hack to make the visible char the same width as the tab
		      ElseIf Word.TYPE = TYPE_SPACE then
		        text = VISIBLESPACECHAR
		      end if
		      
		      if word.TYPE = TYPE_PLACEHOLDER then
		        var oldc as color = g.DrawingColor
		        g.DrawingColor = TextPlaceholder(word).placeholderBackgroundColor
		        g.FillRoundRectangle x, y - g.FontAscent, word.width, g.TextHeight + 1, g.TextHeight, g.TextHeight
		        
		        g.DrawingColor = TextPlaceholder(word).placeholderBackgroundColor.darkerColor(30, false)
		        g.DrawRoundRectangle x, y - g.FontAscent, word.width, g.TextHeight + 1, g.TextHeight, g.TextHeight
		        g.DrawingColor = oldc
		      end if
		      
		      var x2 as Integer = x
		      if indentVisually then
		        x2 = self.indent + x2
		      end if
		      g.DrawText text, x2, y
		    end if
		    
		    x = x + word.Width
		    width = width + Word.width
		    word.lastFont = g.FontName
		    word.lastSize = g.FontSize
		  next
		  
		  showInvisible = displayInvisible
		  Return lines
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setAttributes(attr as TextLineAttributes)
		  mLineAttributes = attr
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TabWidth(assigns value as integer)
		  TABCHAR = ""
		  for i as Integer = 1 to value
		    TABCHAR = TABCHAR + " "
		  next
		  
		  var word as TextSegment
		  for each Word in words
		    word.width = -1
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TextWidth(buffer as gapBuffer, g as graphics, displayInvisible as boolean, length as integer = - 1) As Single
		  #if not DebugBuild
		    #pragma DisableBackgroundTasks
		    #pragma DisableBoundsChecking
		    
		  #endif
		  
		  //gets the text to be displayed by this line.
		  if length = 0 then Return 0
		  if length < 0 then
		    length = self.length
		    
		    if self.lastFont <> g.FontName or self.lastSize <> g.FontSize then width = 0
		    if TotalWidth > 0 then Return TotalWidth
		  end if
		  
		  self.lastFont = g.FontName
		  self.lastSize = g.FontSize
		  
		  //unparsed? return the raw text
		  if words.LastIndex < 0 then
		    ParseLine(buffer, &c00)
		    if words.LastIndex < 0 then
		      Return g.TextWidth(buffer.getText(self.offset, self.length).ConvertEncoding(Encodings.UTF8)) ' StringWidth can't handle UTF-32 (on OSX, at least)
		    end if
		  end if
		  
		  var ret as Single
		  var word as TextSegment
		  var charsToRead as Integer
		  var text as String
		  var u as Integer = words.LastIndex
		  
		  for i as integer = 0 to u
		    Word = words(i)
		    
		    charsToRead = word.length
		    select case word.TYPE
		    case TextSegment.TYPE_SPACE
		      text = " "
		      
		    case TextSegment.TYPE_TAB
		      text = TABCHAR
		      
		    case TextSegment.TYPE_EOL
		      if displayInvisible then
		        text = " "
		      else
		        text = ""
		      end if
		      
		    case TextSegment.TYPE_PLACEHOLDER
		      text = PlaceholderPaddingString + buffer.getText(TextPlaceholder(word).textRange.offset + offset, TextPlaceholder(word).textRange.length) + PlaceholderPaddingString
		      
		    else
		      //find out the number of chars to read in the current token
		      if word.offset + word.length > length then
		        'charsToRead = word.length
		        'else
		        charsToRead = length - word.offset
		      end if
		      
		      text = buffer.getText(word.offset + self.offset, charsToRead)
		    end select
		    
		    if word.lastFont <> g.FontName or word.lastSize <> g.FontSize then
		      word.width = -1
		    end if
		    
		    if word.width < 0 or charsToRead < word.length then
		      //measure
		      g.Bold = word.bold
		      g.Italic = Word.italic
		      g.Underline = Word.underline
		      ret = ret + g.TextWidth(text.ConvertEncoding(Encodings.UTF8)) ' StringWidth can't handle UTF-32 (on OSX, at least)
		    else
		      ret = ret + word.width
		    end if
		    
		    word.lastFont = g.FontName
		    word.lastSize = g.FontSize
		    if word.offset + Word.length >= length then exit for
		  next
		  
		  Return ret
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TotalWidth() As integer
		  Return width
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateIndentationState(definition as highlightdefinition, prevIndentationState as String, myText as String)
		  // TODO: Maybe optimize this so that it doesn't need to perform the Regex checks
		  // every time. E.g, if neither the mIndentationState nor the text changed, then
		  // there's no need to update.
		  // However, how to I tell if the text has changed? I shouldn't buffer each line here, that might
		  // be wasteful.
		  
		  if mIndentationStateIn <> prevIndentationState then
		    mIndentationStateIn = prevIndentationState
		    mIndentationStateOut = prevIndentationState
		    mChangedIndentState = true
		  end
		  
		  if me.length = 0 then
		    mBlockIndent = 0
		    mIsBlkStart = false
		    mIsBlkEnd = false
		    mBlockStartRule = nil
		    mBlockEndRule = nil
		    Return
		  end
		  
		  var newState as String
		  mBlockIndent = definition.isBlockStart(myText, mIndentationStateIn, newState, mBlockStartRule)
		  if newState <> mIndentationStateOut then
		    mIndentationStateOut = newState
		    mChangedIndentState = true
		  end
		  
		  mIsBlkEnd = definition.isBlockEnd(myText, newState, newState, mBlockEndRule)
		  if newState <> mIndentationStateOut then
		    mIndentationStateOut = newState
		    mChangedIndentState = true
		  end
		  
		  mIsBlkStart = mBlockIndent <> 0
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function VisualIndent(isIndentedVisually as Boolean) As Integer
		  if isIndentedVisually then
		    return self.indent
		  end if
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mBlockIndent
			End Get
		#tag EndGetter
		BlockIndentation As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		Context As SyntaxArea.HighlightContext
	#tag EndProperty

	#tag Property, Flags = &h0
		DelimiterLength As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		Folded As Boolean
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected Highlighted As Boolean
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mLineAttributes.Icon
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mLineAttributes.Icon = value
			End Set
		#tag EndSetter
		Icon As Picture
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mIndent
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If value < 0 Then
			    Raise New UnsupportedOperationException("Cannot set a line's indent to < 0.")
			  End If
			  
			  mIndent = value
			  NeedsIndentation = False
			  
			End Set
		#tag EndSetter
		Indent As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mIndentationStateIn
			End Get
		#tag EndGetter
		IndentationStateIn As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mIndentationStateOut
			End Get
		#tag EndGetter
		IndentationStateOut As String
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		IsContinuedFromLine As Integer = -1
	#tag EndProperty

	#tag Property, Flags = &h0
		IsDirty As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		LineSymbols As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h0
		Lock As CriticalSection
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mBlockEndRule As Object
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mBlockIndent As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mBlockStartRule As Object
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mChangedIndentState As Boolean = True
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mIndent As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mIndentationStateIn As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mIndentationStateOut As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mIsBlkEnd As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mIsBlkStart As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21, Description = 486F6C64732076616C75657320746861742062656C6F6E6720746F2061206C696E6520617320746865207573657220736565732069742C20616E640A61726520636F6E74726F6C6C65642062792074686520636F6465207573696E67207468697320656469746F7220726174686572207468616E2076616C756573207468617420617265206E65656465640A666F722074686520656469746F722773206D616E6167656D656E742E20452E673A207468652069636F6E20746861742063616E2062652061737369676E656420746F2061206C696E652E
		#tag Note
			Holds values that belong to a line as the user sees it, and
			are controlled by the code using this editor rather than values that are needed
			for the editor's management.
			
			An example of this is the icon that can be assigned to a line.
		#tag EndNote
		Private mLineAttributes As TextLineAttributes
	#tag EndProperty

	#tag Property, Flags = &h0
		NeedsIndentation As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Placeholders() As TextPlaceholder
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return Width
			End Get
		#tag EndGetter
		ScreenWidth As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h1
		Protected ShowInvisible As Boolean
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected TABCHAR As String
	#tag EndProperty

	#tag Property, Flags = &h0
		Visible As Boolean
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected Words() As SyntaxArea.TextSegment
	#tag EndProperty


	#tag Constant, Name = PLACEHOLDER_PADDING_STRING, Type = String, Dynamic = False, Default = \"  ", Scope = Private
	#tag EndConstant

	#tag Constant, Name = VISIBLE_EOL_CHAR, Type = String, Dynamic = False, Default = \"\xC2\xB6", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = VISIBLE_SPACE_CHAR, Type = String, Dynamic = False, Default = \"\xC2\xB7", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = VISIBLE_TAB_CHAR, Type = String, Dynamic = False, Default = \"", Scope = Protected
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"\xE2\x9E\x9D"
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"\xC2\xBB"
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="BlockIndentation"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="DelimiterLength"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Folded"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Icon"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Picture"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Indent"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="IndentationStateIn"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IndentationStateOut"
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
			InitialValue="-2147483648"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsContinuedFromLine"
			Visible=false
			Group="Behavior"
			InitialValue="-1"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsDirty"
			Visible=false
			Group="Behavior"
			InitialValue="false"
			Type="boolean"
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
			Name="NeedsIndentation"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ScreenWidth"
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
		#tag ViewProperty
			Name="Visible"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="boolean"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
