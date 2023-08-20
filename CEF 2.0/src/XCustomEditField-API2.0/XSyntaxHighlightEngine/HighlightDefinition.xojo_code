#tag Class
Protected Class HighlightDefinition
	#tag Method, Flags = &h21
		Private Sub addBlankSpaceContext()
		  // Add a blank space context, this will tokenize strings.
		  var blankSpaceContext as new HighlightContext(false)
		  blankSpaceContext.EntryRegEx = "([ ]|\t|\x0A|(?:\x0D\x0A?))" // instead of: "([\s])"
		  blankSpaceContext.Name = "fieldwhitespace"
		  addContext(blankSpaceContext)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub addContext(context as HighlightContext)
		  if Context=nil then Return
		  subContexts.Add(Context)
		  
		  if Context <> PlaceholderContextDef then
		    context.PlaceholderContextDef = PlaceholderContextDef
		  end if
		  
		  subExpressionCount = subExpressionCount + 1
		  subExpressionIndex.Add subExpressionCount
		  
		  fixSubExpressionCount (context.ContextSearchPattern)
		  
		  refreshSearchString
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub addSymbol(symbol as symbolsDefinition)
		  if Symbol = nil then Return
		  Symbols.Add Symbol
		  
		  symbolCount = symbolCount + 1
		  symbolIndex.Add symbolCount
		  
		  // add pattern to search string
		  if symbolPattern <> "" then symbolPattern = symbolPattern + "|"
		  symbolPattern = symbolPattern + "(" + symbol.EntryRegex + ")"
		  fixSymbolCount(symbol.EntryRegex)
		  
		  // update prepared regex for symbolPattern
		  mSymbolRegex.SearchPattern = symbolPattern
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function bool2YN(value as boolean) As string
		  if value then Return "yes"
		  Return "no"
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function ColorToText(c as Color) As String
		  var v as Variant = c
		  
		  var cc as String = "0000000" + Hex(v.IntegerValue)
		  
		  return cc.Right( 6 ) // aIntegerValue doesn't include a Color's transparency, so we're safe here
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(fixIssue40 as Boolean = true)
		  //init regex scanner
		  mContextRegex = new RegEx
		  mContextRegex.Options.DotMatchAll=true
		  
		  mSymbolRegex = new RegEx
		  
		  // We used to add a blank space context here, for tokenizing strings.
		  // It's been move to the end of the LoadFromXml code so that it
		  // comes last, not first, in order to give other rules a chance to
		  // include whitespace in their regex checks. See issue #40.
		  // If you find that this causes problems, you can pass false to this constructor to get
		  // the behavior from before v1.11.0
		  mFixIssue40 = fixIssue40
		  if not mFixIssue40 then
		    // Add a blank space context, this will tokenize strings.
		    self.addBlankSpaceContext()
		  end if
		  
		  blockEndDef = new Dictionary
		  blockStartDef = new Dictionary
		  lineContinuationDef = new Dictionary
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ContextEnabled(name as String) As Boolean
		  for each current as HighlightContext in subContexts
		    if current.Name = name then
		      return current.Enabled
		    end if
		  next
		  ' not found?
		  break
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ContextEnabled(name as String, assigns ena as Boolean)
		  for each current as HighlightContext in subContexts
		    if current.Name = name then
		      if current.Enabled <> ena then
		        current.Enabled = ena
		        refreshSearchString
		      end if
		      return
		    end if
		  next
		  ' not found?
		  break
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Contexts() As highlightcontext()
		  var tmp() as HighlightContext
		  
		  for each current as HighlightContext in subContexts
		    if current.Name <> "fieldwhitespace" and current.Enabled then tmp.Add current
		  next
		  
		  Return tmp
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub fixSubExpressionCount(pattern as string)
		  // determine subexpression count
		  // This method is original from Nick Lockwood: http://www.charcoaldesign.co.uk/oss#tokenizer
		  // It speeds up the matching of the matched regex.
		  var escaped, inCharClass, prevBracket as Boolean = false
		  escaped = false
		  for i as integer = 0 to pattern.Length -1
		    select case pattern.Middle(i,1)
		    case "\"
		      escaped = true
		      prevBracket = false
		    case "("
		      var nextChar as String = pattern.Middle(i+1,1)
		      if not inCharClass and not escaped and nextChar <> "?" then self.subExpressionCount = self.subExpressionCount + 1
		      prevBracket = false
		      escaped = false
		    case "["
		      if inCharClass or escaped then
		        prevBracket = false
		        escaped = false
		      else
		        inCharClass = true
		        prevBracket = true
		      end
		    case "]"
		      if not prevBracket then inCharClass = false
		      prevBracket = false
		    else
		      prevBracket = false
		      escaped = false
		    end
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub fixSymbolCount(pattern as string)
		  // determine subexpression count
		  // This method is original from Nick Lockwood: http://www.charcoaldesign.co.uk/oss#tokenizer
		  // It speeds up the matching of the matched regex.
		  var escaped, inCharClass, prevBracket as Boolean = false
		  escaped = false
		  for i as integer = 0 to pattern.Length -1
		    select case pattern.Middle(i,1)
		    case "\"
		      escaped = true
		      prevBracket = false
		    case "("
		      var nextChar as String = pattern.Middle(i+1,1)
		      if not inCharClass and not escaped and nextChar <> "?" then symbolCount = symbolCount + 1
		      prevBracket = false
		      escaped = false
		    case "["
		      if inCharClass or escaped then
		        prevBracket = false
		        escaped = false
		      else
		        inCharClass = true
		        prevBracket = true
		      end
		    case "]"
		      if not prevBracket then inCharClass = false
		      prevBracket = false
		    else
		      prevBracket = false
		      escaped = false
		    end
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Highlight(TheText as string, tokens() as textsegment, placeholders() as textplaceholder, forceMatch as highlightContext = nil) As highlightcontext
		  #pragma DisableBackgroundTasks
		  
		  
		  #if DebugBuild and EditFieldGlobals.DebugTiming
		    var runtimer as new Debugging.AccumulationTimer(CurrentMethodName)
		  #endif
		  
		  var match as RegExMatch
		  var subExpression as String
		  var context as HighlightContext
		  var startPos, startPosB as Integer
		  var openContext as HighlightContext
		  
		  if TheText.Encoding <> nil then TheText = TheText.ConvertEncoding(EditFieldGlobals.InternalEncoding)
		  
		  if forceMatch = nil then
		    // perform the initial search
		    match = mContextRegex.Search(TheText)
		  end if
		  
		  var charPos, charPosB as Integer
		  while forceMatch <> nil or match<>nil
		    if match = nil Then
		      subExpression = ""
		    else
		      subExpression = match.SubExpressionString(0)
		    end if
		    
		    // determine which token was matched
		    if forceMatch <> nil then
		      context = forceMatch
		      forceMatch = nil
		    else
		      var tknIndex as integer = -1
		      for i as integer = 1 to match.SubExpressionCount - 1
		        if match.SubExpressionString(i) = subExpression then
		          tknIndex = subExpressionIndex.IndexOf(i)
		          if tknIndex >= 0 then
		            context = subContexts(tknIndex)
		            if not context.Enabled then
		              break ' must not happen - the mContextRegex may not contain disabled contexts
		            end if
		          end if
		          exit
		        end
		      next
		      
		      if tknIndex < 0 then //definition can't handle source!?
		        exit while
		      end if
		    end if
		    
		    //find the actual character position within the string, since SubExpressionStartB returns the byte position,
		    //and if you have multi-byte strings you get an offsetted highlight.
		    if match = nil then
		      charPos = 0
		    else
		      charPos = TheText.LeftBytes(match.SubExpressionStartB(0)).Length
		      charposB = match.SubExpressionStartB(0)
		    end if
		    
		    //Highlight everything up to this point with the default color.
		    if charPos - startPos > 0 then
		      tokens.Add(new TextSegment(startPos, charPos-startPos, TextSegment.TYPE_WORD, DefaultColor))
		    end if
		    
		    startPos = charPos
		    startPosB = charPosB
		    
		    //forward execution to the context for any further processing.
		    if context <> nil and not context.isPlaceholder then
		      if context.Highlight(TheText, subExpression, startPos, startPosB, mContextRegex, tokens, placeholders) then
		        openContext = context
		      end if
		      startPos = TheText.LeftBytes(mContextRegex.SearchStartPosition).Length
		      startPosB = mContextRegex.SearchStartPosition
		      
		    ElseIf context <> nil and context.isPlaceholder then
		      var label as String = match.SubExpressionString(match.SubExpressionCount - 1)
		      var tmp as Integer = TheText.LeftBytes(match.SubExpressionStartB(match.SubExpressionCount - 1)).Length
		      var placeholder as new TextPlaceholder(startPos, subExpression.Length, tmp, label.Length, context.HighlightColor, context.BackgroundColor, context.Bold, context.Italic, context.Underline)
		      tokens.Add(placeholder)
		      placeholders.Add(placeholder)
		      
		      startPos = TheText.LeftBytes(mContextRegex.SearchStartPosition).Length
		      startPosB = mContextRegex.SearchStartPosition
		    end if
		    
		    //and search again
		    match = mContextRegex.Search
		  wend
		  
		  //Highlight the rest of the text with the default color.
		  if TheText.Length - startPos > 0 then
		    tokens.Add(new TextSegment(startPos, TheText.Length - startPos, TextSegment.TYPE_WORD, DefaultColor))
		  end if
		  
		  Return openContext
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub IndentNode(node As XmlNode, level As Integer, indentCloseTag As Boolean = False)
		  static ss As String
		  if ss = "" then
		    ss = EndOfLine
		    For i as Integer = 1 To 20
		      ss = ss + Chr(9) // Tab
		    Next
		  end if
		  var s as String = ss.Left(level+1)
		  node.Parent.Insert(node.OwnerDocument.CreateTextNode(s), node)
		  If indentCloseTag Then
		    node.AppendChild(node.OwnerDocument.CreateTextNode(s))
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsBlockEnd(lineText as string, stateIn as String, ByRef stateOut as String, ByRef ruleOut as Object) As Boolean
		  // returns true if it's a block end, new state and the matched rule (opaque, only useful for matching with IsBlockStart's returned value)
		  
		  stateOut = stateIn
		  
		  #if DebugBuild and EditFieldGlobals.DebugTiming
		    var runtimer as new Debugging.AccumulationTimer(CurrentMethodName)
		  #endif
		  
		  var v as Variant = blockEndDef.Lookup (stateIn, nil)
		  if v.IsArray then
		    var ps() as Pair = v
		    for each p as Pair in ps
		      if p <> nil then
		        var scanner as RegEx = p.Left
		        if scanner.Search(lineText) <> nil then
		          var ruleAndState as Pair = p.Right
		          var state as Pair = ruleAndState.Right
		          if state.Left.BooleanValue then
		            // change state
		            stateOut = state.Right
		          end
		          ruleOut = ruleAndState.Left
		          return true
		        end
		      end if
		    next
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsBlockStart(lineText as string, stateIn as String, ByRef stateOut as String, ByRef ruleOut as Object) As Integer
		  // returns indent value, new state and the matched rule (opaque, only useful for matching with IsBlockEnd's returned value)
		  
		  #if DebugBuild and EditFieldGlobals.DebugTiming
		    var runtimer as new Debugging.AccumulationTimer(CurrentMethodName)
		  #endif
		  
		  stateOut = stateIn
		  
		  var v as Variant = blockStartDef.Lookup (stateIn, nil)
		  if v.IsArray then
		    var ps() as Pair = v
		    for each p as Pair in ps
		      if p <> nil then
		        var scanner as RegEx = p.Left
		        if scanner.Search(lineText) <> nil then
		          var indentAndState as Pair = p.Right
		          var state as Pair = indentAndState.Right
		          if state.Left.BooleanValue then
		            // change state
		            stateOut = state.Right
		          end
		          ruleOut = scanner
		          return indentAndState.Left
		        end
		      end if
		    next
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsLineContinuation(lineText as string) As Integer
		  // returns indent value
		  
		  #if DebugBuild and EditFieldGlobals.DebugTiming
		    var runtimer as new Debugging.AccumulationTimer(CurrentMethodName)
		  #endif
		  
		  if lineContinuationDef.KeyCount = 0 then Return 0
		  
		  var scanner as RegEx = lineContinuationDef.Key(0)
		  
		  if scanner.Search(lineText) <> nil then
		    Return lineContinuationDef.Value(scanner)
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function Keywords() As string()
		  //get all the keyword strings in this definition.
		  var tmp() as String
		  for i as Integer = 0 to subContexts.LastIndex
		    subContexts(i).ListKeywords(tmp)
		  next
		  
		  tmp.Sort
		  Return tmp
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LineContinuationIndent() As Integer
		  // returns the block indentation of the first default state
		  
		  var ps() as Pair = blockStartDef.Lookup ("", nil)
		  if not (ps is nil) then
		    var p as Pair = ps(0)
		    var indentAndState as Pair = p.Right
		    return indentAndState.Left
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LoadFromXml(data as folderItem) As boolean
		  if data=nil then Return False
		  
		  //read a file...
		  var tis as TextInputStream=TextInputStream.Open(data)
		  if tis=nil then Return False
		  
		  var xml as String=tis.ReadAll(Encodings.UTF8)
		  tis.Close
		  
		  Return loadFromXml(xml)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LoadFromXml(data as string) As boolean
		  var xml as XmlDocument
		  var root, node as XMLNode
		  var context as HighlightContext
		  var Symbol as SymbolsDefinition
		  var i, j as Integer
		  
		  //load a xml syntax definition.
		  try
		    xml=new XmlDocument
		    xml.LoadXml(data)
		    
		    root=xml.Child(0)
		    //doc check
		    if root.Name<>"highlightDefinition" then
		      break
		      Return False
		    end if
		    if val(root.GetAttribute("version")) > version then
		      break
		      Return False
		    end if
		    
		    var lastStartRule as Object
		    
		    for i=0 to root.ChildCount-1
		      node=root.Child(i)
		      select case node.Name
		      case "name"
		        //syntax name
		        Name=node.FirstChild.Value
		        
		      case "blockStartMarker"
		        if lastStartRule <> nil then
		          // Error: There's still an unfinished start rule open
		          break
		          return false
		        end
		        var newstate as XmlAttribute = node.GetAttributeNode("newstate")
		        var newstateValue as String
		        if newstate <> nil then newstateValue = newstate.Value
		        var cond as String = node.GetAttribute("condition")
		        var values() as Pair
		        var v as Variant = blockStartDef.Lookup(cond, nil)
		        if not v.IsArray then
		          blockStartDef.Value(cond) = values
		        else
		          values = v
		        end if
		        var re as new RegEx
		        re.SearchPattern = node.FirstChild.Value
		        values.Add re : (node.GetAttribute("indent").Val : (newstate <> nil : newstateValue))
		        lastStartRule = re
		        
		      case "blockEndMarker"
		        if lastStartRule = nil then
		          // Error: End rule without start rule
		          break
		          return false
		        end
		        var newstate as XmlAttribute = node.GetAttributeNode("newstate")
		        var newstateValue as String
		        if newstate <> nil then newstateValue = newstate.Value
		        var cond as String = node.GetAttribute("condition")
		        var values() as Pair
		        var v as Variant = blockEndDef.Lookup(cond, nil)
		        if not v.IsArray then
		          blockEndDef.Value(cond) = values
		        else
		          values = v
		        end if
		        var re as new RegEx
		        re.SearchPattern = node.FirstChild.Value
		        values.Add re : (lastStartRule : (newstate <> nil : newstateValue))
		        lastStartRule = nil
		        
		      case "lineContinuationMarker"
		        //indent is the number of indentations.
		        var re as new RegEx
		        re.SearchPattern = node.FirstChild.Value
		        lineContinuationDef.Value(re) = val(node.GetAttribute("indent"))
		        
		      case "symbols"
		        for j = 0 to node.ChildCount - 1
		          var child as XmlNode = node.Child(j)
		          if child.Name = "symbol" then
		            Symbol = new SymbolsDefinition
		            Symbol.loadFromXmlNode(child)
		            addSymbol(Symbol)
		          end if
		        next
		        
		      case "placeholders"
		        placeholderContextDef = new HighlightContext(False, False)
		        placeholderContextDef.EntryRegEx = node.FirstChild.Value
		        placeholderContextDef.isPlaceholder = true
		        placeholderContextDef.Name = "Placeholders"
		        
		        var tmpObj as Variant
		        if node.GetAttribute("highlightColor") <> "" then
		          tmpObj = "&h" + node.GetAttribute("highlightColor").Middle(0)
		          PlaceholderContextDef.HighlightColor = tmpObj.ColorValue
		        end if
		        
		        if node.GetAttribute("backgroundColor") <> "" then
		          tmpObj = "&h" + node.GetAttribute("backgroundColor").Middle(0)
		          PlaceholderContextDef.BackgroundColor = tmpObj.ColorValue
		        end if
		        
		        var tmp as String
		        
		        //Bold
		        tmp = node.GetAttribute("bold")
		        if tmp <> "" then placeholderContextDef.Bold = tmp = "true"
		        
		        //Italic
		        tmp = node.GetAttribute("italic")
		        if tmp <> "" then placeholderContextDef.Italic = tmp = "true"
		        
		        //Underline
		        tmp = node.GetAttribute("underline")
		        if tmp <> "" then placeholderContextDef.Underline = tmp = "true"
		        
		        //Enabled
		        tmp = node.GetAttribute("enabled")
		        placeholderContextDef.Enabled = tmp <> "false"
		        
		        self.addContext placeholderContextDef
		        
		      case "contexts"
		        //contexts
		        var tmpObj as Variant
		        tmpObj = "&h" + node.GetAttribute("defaultColor").Middle(0)
		        defaultColor=tmpObj.ColorValue
		        caseSensitive = YN2Bool(node.GetAttribute("caseSensitive"))
		        for j=0 to node.ChildCount-1
		          Context=new HighlightContext(caseSensitive)
		          Context.loadFromXmlNode(node.Child(j))
		          addContext(Context)
		        next
		      end select
		    Next
		    
		    if mFixIssue40 then
		      // Add a blank space context, this will tokenize strings.
		      // (This used to be in the Constructor - now we add it last for better Markdown support, see issue #40)
		      self.addBlankSpaceContext()
		    end if
		    
		    Return true
		  Catch
		    break
		    Return False
		  end try
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub refreshSearchString()
		  // build search string from all contexts
		  
		  var patterns() as String
		  for each c as HighlightContext in subContexts
		    if c.Enabled then
		      patterns.Add "(" + c.ContextSearchPattern + ")"
		    end if
		  next
		  
		  mContextRegex.SearchPattern = String.FromArray(patterns, "|")
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SaveAsXml(file as folderItem) As boolean
		  if file=nil then Return False
		  
		  //save definition as an xml
		  try
		    var tos as TextOutputStream = TextOutputStream.Create(file)
		    tos.Write(toXml)
		    tos.Close
		    
		    Return true
		  catch
		    Return False
		  end try
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ScanSymbols(forText as string) As dictionary
		  //simple symbol scan
		  
		  if mSymbolRegex = nil then Return nil
		  
		  if forText.Encoding <> nil then forText = forText.ConvertEncoding(Encodings.UTF8)
		  
		  var match as RegExMatch
		  var symbol as String
		  var pos as integer
		  var local as new Dictionary
		  var tknIndex as integer
		  var symbolDef as SymbolsDefinition
		  
		  match = mSymbolRegex.Search(forText)
		  while match <> nil
		    Symbol = match.SubExpressionString(0)
		    pos = forText.LeftBytes(match.SubExpressionStartB(0)).Length
		    
		    for i as integer = 1 to match.SubExpressionCount - 1
		      if match.SubExpressionString(i) = symbol then
		        tknIndex = symbolIndex.IndexOf(i)
		        exit
		      end
		    next
		    
		    if tknIndex < 0 or tknIndex > Symbols.LastIndex then //definition can't handle source!?
		      exit while
		    end if
		    
		    symbolDef = Symbols(tknIndex)
		    
		    Symbol = Symbol.Trim //strip spaces
		    if Symbol <> "" then
		      local.Value(Symbol) = new DocumentSymbol(Symbol, pos, symbolDef.Type)
		    end if
		    
		    match = mSymbolRegex.Search
		  wend
		  
		  if local.KeyCount = 0 then Return nil
		  Return local
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SupportsCodeBlocks() As boolean
		  Return blockStartDef.KeyCount > 0 and blockEndDef.KeyCount > 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ToXML() As string
		  var xml as XmlDocument
		  var root, node as XMLNode
		  var context as HighlightContext
		  var Symbol as SymbolsDefinition
		  
		  xml = New XmlDocument
		  
		  //root
		  root = xml.AppendChild(xml.CreateElement("highlightDefinition"))
		  root.SetAttribute("version",Str(version,"#.0"))
		  
		  //name
		  node = root.AppendChild(xml.CreateElement("name"))
		  node.AppendChild(xml.CreateTextNode(name))
		  IndentNode(node,1)
		  
		  //block markers
		  for each cond as String in blockStartDef.Keys
		    var ps() as Pair = blockStartDef.Value(cond)
		    for each p as Pair in ps
		      // p.Left: RegEx with SearchPattern
		      // p.Right: Pair of indent and state
		      node = root.AppendChild(xml.CreateElement("blockStartMarker"))
		      node.AppendChild(xml.CreateTextNode(RegEx(p.Left.ObjectValue).SearchPattern))
		      if cond <> "" then
		        node.SetAttribute("condition", cond)
		      end if
		      var indentAndState as Pair = p.Right
		      node.SetAttribute("indent", Str(indentAndState.Left, "#"))
		      var state as Pair = indentAndState.Right
		      if state.Left.BooleanValue then
		        node.SetAttribute("newstate", state.Right)
		      end if
		      IndentNode(node,1)
		    next
		  next
		  for each cond as String in blockEndDef.Keys
		    var ps() as Pair = blockEndDef.Value(cond)
		    for each p as Pair in ps
		      // p.Left: RegEx with SearchPattern
		      // p.Right: Pair of (rule_ref, Pair of (indent, state))
		      node = root.AppendChild(xml.CreateElement("blockEndMarker"))
		      node.AppendChild(xml.CreateTextNode(RegEx(p.Left.ObjectValue).SearchPattern))
		      if cond <> "" then
		        node.SetAttribute("condition", cond)
		      end if
		      var state as Pair = Pair(p.Right).Right
		      if state.Left.BooleanValue then
		        node.SetAttribute("newstate", state.Right)
		      end if
		      IndentNode(node,1)
		    next
		  next
		  
		  for each key as RegEx in lineContinuationDef.Keys
		    node = root.AppendChild(xml.CreateElement("lineContinuationMarker"))
		    node.AppendChild(xml.CreateTextNode(key.SearchPattern))
		    node.SetAttribute("indent", Str(lineContinuationDef.Value(key), "#"))
		    IndentNode(node,1)
		  next
		  
		  node = root.AppendChild(xml.CreateElement("symbols"))
		  for each Symbol in Symbols
		    Symbol.appendToXMLNode(node)
		  next
		  IndentNode(node,1, true)
		  
		  if PlaceholderContextDef <> nil then
		    node = root.AppendChild(xml.CreateElement("placeholders"))
		    
		    //HighlightColor
		    node.SetAttribute("highlightColor","#"+ColorToText(Color.HighlightColor))
		    
		    //BackgroundColor
		    if PlaceholderContextDef.HasBackgroundColor then
		      node.SetAttribute("backgroundColor","#"+ColorToText(PlaceholderContextDef.BackgroundColor))
		    end if
		    
		    //bold
		    if PlaceholderContextDef.Bold then
		      node.SetAttribute("bold", "true")
		    end if
		    //italic
		    if PlaceholderContextDef.Italic then
		      node.SetAttribute("italic", "true")
		    end if
		    //Underline
		    if PlaceholderContextDef.Underline then
		      node.SetAttribute("underline", "true")
		    end if
		    
		    //Enabled
		    if not PlaceholderContextDef.Enabled then
		      node.SetAttribute("enabled", "false")
		    end if
		    
		    node.AppendChild(xml.CreateTextNode(PlaceholderContextDef.EntryRegEx))
		    
		    IndentNode(node,1, false)
		  end if
		  
		  node = root.AppendChild(xml.CreateElement("contexts"))
		  node.SetAttribute("defaultColor","#"+ColorToText(defaultColor))
		  node.SetAttribute("caseSensitive",bool2YN(caseSensitive))
		  
		  //process contexts
		  for Each Context in subContexts
		    if Context.Name = "fieldwhitespace" or context.isPlaceholder then Continue for
		    
		    Context.appendToXMLNode(node)
		  next
		  
		  IndentNode(node,1, true)
		  IndentNode(root,0, true)
		  
		  Return xml.ToString
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function YN2Bool(value as string) As boolean
		  if value="yes" then Return true
		  Return False
		End Function
	#tag EndMethod


	#tag Note, Name = About
		Info
		
		HighlightDefinition
		By Alex Restrepo
		send comments, suggestions, fixes to alexrestrepo@mac.com
		
		A little experiment on SyntaxHighlighting
		Contains the rules of how to Highlight the contents of the EditField.
		A definition is composed of one or more HighlightContexts
		
		Methods:
		Highlight(text as string, style as styledText): highlights the provided text using the provided styledtext object.
		LoadFromXml(data as string): loads a HighlightDefinition stored in a xml string
		LoadFromXml(data as folderItem): loads a HighlightDefinition stored in a xml file
		SaveAsXml(file as folderitem): saves the HighlightDefinition as an xml file.
		 
		Properties:
		CaseSensitive: gets or sets if the contained syntax is case-sensitive
		DefaultColor: gets or sets the default color for the text
		Name: the name of the definition (ie: Xml or REALbasic)
		
		
		Open source under the creative commons license.
		Use in whatever way you like... at your own risk :P
		let me know if you find it useful.
		If you decide to use it in your projects, please give me credit in your about window or documentation, thanks.
	#tag EndNote


	#tag Property, Flags = &h21
		#tag Note
			Key: condition
			Value: Array of Pair of (regex, Pair of (regex_of_blockStart, Pair of (changeState as Boolean : newState as String))
		#tag EndNote
		Private blockEndDef As dictionary
	#tag EndProperty

	#tag Property, Flags = &h21
		#tag Note
			Key: condition
			Value: Array of Pair of (regex, Pair of (indent as Integer, Pair of (changeState as Boolean : newState as String))
		#tag EndNote
		Private blockStartDef As dictionary
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return _caseSensitive
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  _caseSensitive = value
			  mContextRegex.Options.CaseSensitive = value
			End Set
		#tag EndSetter
		CaseSensitive As boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return _defaultColor
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  _defaultColor=value
			End Set
		#tag EndSetter
		DefaultColor As color
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private lineContinuationDef As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mContextRegex As RegEx
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mFixIssue40 As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mSymbolRegex As RegEx
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return _name
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  _name=value
			End Set
		#tag EndSetter
		Name As string
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private PlaceholderContextDef As HighlightContext
	#tag EndProperty

	#tag Property, Flags = &h21
		Private subContexts() As HighlightContext
	#tag EndProperty

	#tag Property, Flags = &h21
		Private subExpressionCount As integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private subExpressionIndex() As integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private symbolCount As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private symbolIndex() As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private symbolPattern As string
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Symbols() As SymbolsDefinition
	#tag EndProperty

	#tag Property, Flags = &h21
		Private _caseSensitive As boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private _defaultColor As color
	#tag EndProperty

	#tag Property, Flags = &h21
		Private _name As string
	#tag EndProperty


	#tag Constant, Name = version, Type = Double, Dynamic = False, Default = \"1.4", Scope = Public
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="caseSensitive"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="defaultColor"
			Visible=false
			Group="Behavior"
			InitialValue="&h000000"
			Type="color"
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
