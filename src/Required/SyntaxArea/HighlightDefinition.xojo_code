#tag Class
Protected Class HighlightDefinition
	#tag Method, Flags = &h21, Description = 41646473206120626C616E6B20737061636520636F6E746578742C20746869732077696C6C20746F6B656E69736520737472696E67732E
		Private Sub AddBlankSpaceContext()
		  /// Adds a blank space context, this will tokenise strings.
		  
		  Var blankSpaceContext As New SyntaxArea.HighlightContext(Self.Owner, False, False)
		  blankSpaceContext.EntryRegEx = "([ ]|\t|\x0A|(?:\x0D\x0A?))"
		  blankSpaceContext.Name = "fieldwhitespace"
		  
		  AddContext(blankSpaceContext)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub AddContext(context As SyntaxArea.HighlightContext)
		  If context = Nil Then Return
		  
		  context.Owner = Self.Owner
		  
		  SubContexts.Add(context)
		  
		  If context <> PlaceholderContextDef Then
		    context.PlaceholderContextDef = PlaceholderContextDef
		  End If
		  
		  SubExpressionCount = SubExpressionCount + 1
		  SubExpressionIndex.Add(SubExpressionCount)
		  
		  FixSubExpressionCount(context.ContextSearchPattern)
		  
		  RefreshSearchString
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub AddSymbol(symbol As SyntaxArea.SymbolsDefinition)
		  If symbol = Nil Then Return
		  
		  Symbols.Add(symbol)
		  
		  symbolCount = symbolCount + 1
		  symbolIndex.Add(symbolCount)
		  
		  // Add the pattern to the search string.
		  If SymbolPattern <> "" Then SymbolPattern = SymbolPattern + "|"
		  SymbolPattern = SymbolPattern + "(" + symbol.EntryRegex + ")"
		  FixSymbolCount(symbol.EntryRegex)
		  
		  // Update the prepared regex for symbolPattern.
		  mSymbolRegex.SearchPattern = SymbolPattern
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21, Description = 52657475726E7320227965732220666F72205472756520616E6420226E6F2220666F722046616C73652E
		Private Function Bool2YN(value As Boolean) As String
		  /// Returns "yes" for True and "no" for False.
		  
		  If value Then Return "yes"
		  
		  Return "no"
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(owner As SyntaxArea.IEditor)
		  Self.Owner = owner
		  mContextRegex = New RegEx
		  mContextRegex.Options.DotMatchAll = True
		  mSymbolRegex = New RegEx
		  BlockEndDef = New Dictionary
		  BlockStartDef = New Dictionary
		  LineContinuationDef = New Dictionary
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ContextEnabled(name As String) As Boolean
		  For Each current As SyntaxArea.HighlightContext In SubContexts
		    If current.Name = name Then
		      Return current.Enabled
		    End If
		  Next current
		  
		  // Not found. This shouldn't happen.
		  Raise New InvalidArgumentException("Could not find a context named `" + name + "` in " + _
		  "highlight definition.")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ContextEnabled(name As String, Assigns ena As Boolean)
		  For Each current As SyntaxArea.HighlightContext In SubContexts
		    If current.Name = name Then
		      If current.Enabled <> ena Then
		        current.Enabled = ena
		        RefreshSearchString
		      End If
		      
		      Return
		    End If
		  Next current
		  
		  // Not found. This shouldn't happen.
		  Raise New InvalidArgumentException("Could not find a context named `" + name + "` in " + _
		  "highlight definition.")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Contexts() As SyntaxArea.HighlightContext()
		  Var tmp() As SyntaxArea.HighlightContext
		  
		  For Each current As SyntaxArea.HighlightContext In SubContexts
		    If current.Name <> "fieldwhitespace" And current.Enabled Then tmp.Add(current)
		  Next current
		  
		  Return tmp
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21, Description = 44657465726D696E6573207468652073756265787072657373696F6E20636F756E742E
		Private Sub FixSubExpressionCount(pattern As String)
		  /// Determines the subexpression count.
		  ///
		  /// This method is original from Nick Lockwood:
		  /// http://www.charcoaldesign.co.uk/oss#tokenizer
		  /// It speeds up the matching of the matched regex.
		  
		  Var escaped, inCharClass, prevBracket As Boolean = False
		  
		  For i As Integer = 0 To pattern.Length -1
		    Select Case pattern.Middle(i, 1)
		    Case "\"
		      escaped = True
		      prevBracket = False
		    Case "("
		      Var nextChar As String = pattern.Middle(i + 1, 1)
		      If Not inCharClass And Not escaped And nextChar <> "?" Then 
		        Self.subExpressionCount = Self.subExpressionCount + 1
		      End If
		      prevBracket = False
		      escaped = False
		    Case "["
		      If inCharClass Or escaped Then
		        prevBracket = False
		        escaped = False
		      Else
		        inCharClass = True
		        prevBracket = True
		      End
		    Case "]"
		      If Not prevBracket Then inCharClass = False
		      prevBracket = False
		    Else
		      prevBracket = False
		      escaped = False
		    End
		  Next i
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub FixSymbolCount(pattern As String)
		  /// Determines the subexpression count.
		  ///
		  /// This method is original from Nick Lockwood:
		  /// http://www.charcoaldesign.co.uk/oss#tokenizer
		  /// It speeds up the matching of the matched regex.
		  
		  Var escaped, inCharClass, prevBracket As Boolean = False
		  
		  For i As Integer = 0 To pattern.Length -1
		    Select Case pattern.Middle(i, 1)
		    Case "\"
		      escaped = True
		      prevBracket = False
		    Case "("
		      Var nextChar As String = pattern.Middle(i + 1, 1)
		      If Not inCharClass And Not escaped And nextChar <> "?" Then symbolCount = symbolCount + 1
		      prevBracket = False
		      escaped = False
		    Case "["
		      If inCharClass Or escaped Then
		        prevBracket = False
		        escaped = False
		      Else
		        inCharClass = True
		        prevBracket = True
		      End
		    Case "]"
		      If Not prevBracket Then inCharClass = False
		      prevBracket = False
		    Else
		      prevBracket = False
		      escaped = False
		    End
		  Next i
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 4C6F61647320612073796E74617820646566696E6974696F6E20584D4C2066696C652E204D617920726169736520616E2060496E76616C6964417267756D656E74457863657074696F6E602E
		Shared Function FromFile(f As FolderItem, owner As SyntaxArea.IEditor) As SyntaxArea.HighlightDefinition
		  /// Loads a syntax definition XML file.
		  /// May raise an `InvalidArgumentException`.
		  
		  If f = Nil Or Not f.Exists Then
		    Raise New InvalidArgumentException("Cannot load a non-existent definition file.")
		  End If
		  
		  If f.IsFolder Then
		    Raise New InvalidArgumentException("Expected a definition file instead got a folder.")
		  End If
		  
		  If owner = Nil Then
		    Raise New InvalidArgumentException("The owning editor cannot be Nil.")
		  End If
		  
		  Var xml As String
		  Try
		    Var tin As TextInputStream = TextInputStream.Open(f)
		    xml = tin.ReadAll
		    tin.Close
		  Catch e As IOException
		    Raise New InvalidArgumentException("Unable to read the contents of the definition file (" + _
		    e.Message + ").")
		  End Try
		  
		  Var def As New SyntaxArea.HighlightDefinition(owner)
		  If Not def.LoadFromXml(xml) Then
		    Raise New InvalidArgumentException("Invalid syntax definition file.")
		  End If
		  
		  Return def
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Highlight(s As String, tokens() As SyntaxArea.TextSegment, placeholders() As SyntaxArea.TextPlaceholder, forceMatch As SyntaxArea.HighlightContext = Nil) As SyntaxArea.HighlightContext
		  #Pragma DisableBackgroundTasks
		  
		  Var match As RegExMatch
		  Var subExpression As String
		  Var context As SyntaxArea.HighlightContext
		  Var startPos, startPosB As Integer
		  Var openContext As SyntaxArea.HighlightContext
		  
		  If s.Encoding <> Nil Then s = s.ConvertEncoding(SyntaxArea.InternalEncoding)
		  
		  Var style As SyntaxArea.TokenStyle
		  
		  If forceMatch = Nil Then
		    // Perform the initial search.
		    match = mContextRegex.Search(s)
		  End If
		  
		  Var charPos, charPosB As Integer
		  While forceMatch <> Nil Or match <> Nil
		    If match = Nil Then
		      subExpression = ""
		    Else
		      subExpression = match.SubExpressionString(0)
		    End If
		    
		    // Determine which token was matched.
		    If forceMatch <> Nil Then
		      context = forceMatch
		      forceMatch = Nil
		    Else
		      Var tknIndex As Integer = -1
		      For i As Integer = 1 To match.SubExpressionCount - 1
		        If match.SubExpressionString(i) = subExpression Then
		          tknIndex = SubExpressionIndex.IndexOf(i)
		          If tknIndex >= 0 Then
		            context = SubContexts(tknIndex)
		            If Not context.Enabled Then
		              Raise New RuntimeException("The mContextRegex may not contain disabled contexts.")
		            End If
		          End If
		          Exit
		        End If
		      Next i
		      
		      style = Owner.StyleForToken(context.Name)
		      
		      If tknIndex < 0 Then
		        // The definition can't handle source!?
		        Exit While
		      End If
		    End If
		    
		    // Find the actual character position within the string, since SubExpressionStartB 
		    // returns the byte position, and if you have multi-byte strings you get an 
		    // offsetted highlight.
		    If match = Nil Then
		      charPos = 0
		    Else
		      charPos = s.LeftBytes(match.SubExpressionStartB(0)).Length
		      charposB = match.SubExpressionStartB(0)
		    End If
		    
		    // Highlight everything up to this point with the default color.
		    If charPos - startPos > 0 Then
		      tokens.Add(New SyntaxArea.TextSegment(startPos, charPos - startPos, SyntaxArea.TextSegment.TYPE_WORD, DefaultColor))
		    End If
		    
		    startPos = charPos
		    startPosB = charPosB
		    
		    // Forward execution to the context for any further processing.
		    If context <> Nil And Not context.IsPlaceholder Then
		      If context.Highlight(s, subExpression, startPos, startPosB, mContextRegex, tokens, placeholders) Then
		        openContext = context
		      End If
		      startPos = s.LeftBytes(mContextRegex.SearchStartPosition).Length
		      startPosB = mContextRegex.SearchStartPosition
		      
		    ElseIf context <> Nil And context.IsPlaceholder Then
		      Var label As String = match.SubExpressionString(match.SubExpressionCount - 1)
		      Var tmp As Integer = s.LeftBytes(match.SubExpressionStartB(match.SubExpressionCount - 1)).Length
		      Var placeholder As New SyntaxArea.TextPlaceholder(startPos, subExpression.Length, tmp, label.Length, style.TextColor, _
		      style.BackColor, style.Bold, style.Italic, style.Underline, style.HasBackColor)
		      tokens.Add(placeholder)
		      placeholders.Add(placeholder)
		      
		      startPos = s.LeftBytes(mContextRegex.SearchStartPosition).Length
		      startPosB = mContextRegex.SearchStartPosition
		    End If
		    
		    // Search again.
		    match = mContextRegex.Search
		  Wend
		  
		  // Highlight the rest of the text with the default color.
		  If s.Length - startPos > 0 Then
		    tokens.Add(New SyntaxArea.TextSegment(startPos, s.Length - startPos, SyntaxArea.TextSegment.TYPE_WORD, DefaultColor))
		  End If
		  
		  Return openContext
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub IndentNode(node As XmlNode, level As Integer, indentCloseTag As Boolean = False)
		  Var ss As String // NOTE: This was static in the original CEF code. Relevant?
		  
		  If ss = "" Then
		    ss = EndOfLine
		    For i As Integer = 1 To 20
		      // Append a tab.
		      ss = ss + Chr(9)
		    Next i
		  End If
		  
		  Var s As String = ss.Left(level + 1)
		  
		  node.Parent.Insert(node.OwnerDocument.CreateTextNode(s), node)
		  
		  If indentCloseTag Then
		    node.AppendChild(node.OwnerDocument.CreateTextNode(s))
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E7320547275652069662069742773206120626C6F636B20656E642C206E657720737461746520616E6420746865206D6174636865642072756C6520286F70617175652C206F6E6C792075736566756C20666F72206D61746368696E672077697468204973426C6F636B537461727427732072657475726E65642076616C7565292E
		Function IsBlockEnd(lineText As String, stateIn As String, ByRef stateOut As String, ByRef ruleOut As Object) As Boolean
		  /// Returns True if it's a block end, new state and the matched rule
		  /// (opaque, only useful for matching with IsBlockStart's returned value).
		  
		  stateOut = stateIn
		  
		  Var v As Variant = BlockEndDef.Lookup(stateIn, Nil)
		  If v.IsArray Then
		    Var ps() As Pair = v
		    For Each p As Pair In ps
		      If p <> Nil Then
		        Var scanner As RegEx = p.Left
		        If scanner.Search(lineText) <> Nil Then
		          Var ruleAndState As Pair = p.Right
		          Var state As Pair = ruleAndState.Right
		          If state.Left.BooleanValue Then
		            // Change state.
		            stateOut = state.Right
		          End
		          ruleOut = ruleAndState.Left
		          Return True
		        End If
		      End If
		    Next p
		  End If
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E732074686520696E64656E742076616C75652C20746865206E657720737461746520616E6420746865206D6174636865642072756C652E
		Function IsBlockStart(lineText As String, stateIn As String, ByRef stateOut As String, ByRef ruleOut As Object) As Integer
		  /// Returns the indent value, the new state and the matched rule.
		  /// 
		  /// Opaque, only useful for matching with IsBlockEnd's returned value.
		  
		  stateOut = stateIn
		  
		  Var v As Variant = BlockStartDef.Lookup(stateIn, Nil)
		  If v.IsArray Then
		    Var ps() As Pair = v
		    For Each p As Pair In ps
		      If p <> Nil Then
		        Var scanner As RegEx = p.Left
		        If scanner.Search(lineText) <> Nil Then
		          Var indentAndState As Pair = p.Right
		          Var state As Pair = indentAndState.Right
		          If state.Left.BooleanValue Then
		            // Change state.
		            stateOut = state.Right
		          End If
		          ruleOut = scanner
		          Return indentAndState.Left
		        End If
		      End If
		    Next p
		  End If
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E732074686520696E64656E742076616C75652E
		Function IsLineContinuation(lineText As String) As Integer
		  /// Returns the indent value.
		  
		  If LineContinuationDef.KeyCount = 0 Then Return 0
		  
		  Var scanner As RegEx = LineContinuationDef.Key(0)
		  
		  If scanner.Search(lineText) <> Nil Then
		    Return LineContinuationDef.Value(scanner)
		  End If
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21, Description = 4765747320616C6C20746865206B6579776F726420737472696E677320696E207468697320646566696E6974696F6E2E
		Private Function Keywords() As String()
		  /// Gets all the keyword strings in this definition.
		  
		  Var tmp() As String
		  
		  For i As Integer = 0 To SubContexts.LastIndex
		    SubContexts(i).ListKeywords(tmp)
		  Next i
		  
		  tmp.Sort
		  
		  Return tmp
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E732074686520626C6F636B20696E64656E746174696F6E206F66207468652066697273742064656661756C742073746174652E
		Function LineContinuationIndent() As Integer
		  /// Returns the block indentation of the first default state.
		  
		  Var ps() As Pair = BlockStartDef.Lookup("", Nil)
		  
		  If Not (ps Is Nil) Then
		    Var p As Pair = ps(0)
		    Var indentAndState As Pair = p.Right
		    Return indentAndState.Left
		  End If
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LoadFromXml(data As FolderItem) As Boolean
		  If data = Nil Then Return False
		  
		  Var tis As TextInputStream = TextInputStream.Open(data)
		  If tis = Nil Then Return False
		  
		  Var xml As String = tis.ReadAll(Encodings.UTF8)
		  tis.Close
		  
		  Return LoadFromXml(xml)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 4C6F61647320616E20584D4C2073796E74617820646566696E6974696F6E2E
		Function LoadFromXml(data As String) As Boolean
		  /// Loads an XML syntax definition.
		  
		  Var xml As XmlDocument
		  Var root, node As XMLNode
		  Var context As SyntaxArea.HighlightContext
		  Var symbol As SyntaxArea.SymbolsDefinition
		  Var i, j As Integer
		  
		  Try
		    xml = New XmlDocument
		    xml.LoadXml(data)
		    
		    root = xml.Child(0)
		    If root.Name <> "highlightDefinition" Then
		      Return False
		    End If
		    If Val(root.GetAttribute("version")) > VERSION Then
		      Return False
		    End If
		    
		    Var lastStartRule As Object
		    
		    For i = 0 To root.ChildCount - 1
		      node = root.Child(i)
		      Select Case node.Name
		      Case "name"
		        // Syntax name.
		        Name = node.FirstChild.Value
		        
		      Case "blockStartMarker"
		        If lastStartRule <> Nil Then
		          // Error: There's still an unfinished start rule open.
		          Return False
		        End
		        Var newstate As XmlAttribute = node.GetAttributeNode("newstate")
		        Var newstateValue As String
		        If newstate <> Nil Then newstateValue = newstate.Value
		        Var cond As String = node.GetAttribute("condition")
		        Var values() As Pair
		        Var v As Variant = BlockStartDef.Lookup(cond, Nil)
		        If Not v.IsArray Then
		          BlockStartDef.Value(cond) = values
		        Else
		          values = v
		        End If
		        Var re As New RegEx
		        re.SearchPattern = node.FirstChild.Value
		        values.Add(re : (node.GetAttribute("indent").Val : (newstate <> Nil : newstateValue)))
		        lastStartRule = re
		        
		      Case "blockEndMarker"
		        If lastStartRule = Nil Then
		          // Error: End rule without start rule.
		          Return False
		        End
		        Var newstate As XmlAttribute = node.GetAttributeNode("newstate")
		        Var newstateValue As String
		        If newstate <> Nil Then newstateValue = newstate.Value
		        Var cond As String = node.GetAttribute("condition")
		        Var values() As Pair
		        Var v As Variant = BlockEndDef.Lookup(cond, Nil)
		        If Not v.IsArray Then
		          BlockEndDef.Value(cond) = values
		        Else
		          values = v
		        End If
		        Var re As New RegEx
		        re.SearchPattern = node.FirstChild.Value
		        values.Add(re : (lastStartRule : (newstate <> Nil : newstateValue)))
		        lastStartRule = Nil
		        
		      Case "lineContinuationMarker"
		        // `indent` is the number of indentations.
		        Var re As New RegEx
		        re.SearchPattern = node.FirstChild.Value
		        LineContinuationDef.Value(re) = Val(node.GetAttribute("indent"))
		        
		      Case "symbols"
		        For j = 0 To node.ChildCount - 1
		          Var child As XmlNode = node.Child(j)
		          If child.Name = "symbol" Then
		            symbol = New SyntaxArea.SymbolsDefinition
		            symbol.loadFromXmlNode(child)
		            AddSymbol(symbol)
		          End If
		        Next j
		        
		      Case "placeholders"
		        PlaceholderContextDef = New SyntaxArea.HighlightContext(Self.Owner, False, False)
		        PlaceholderContextDef.EntryRegEx = node.FirstChild.Value
		        PlaceholderContextDef.IsPlaceholder = True
		        PlaceholderContextDef.Name = "placeholder"
		        
		        // Enabled?
		        Var tmp As String
		        tmp = node.GetAttribute("enabled")
		        placeholderContextDef.Enabled = tmp <> "false"
		        
		        Self.AddContext(PlaceholderContextDef)
		        
		      Case "contexts"
		        // Contexts.
		        CaseSensitive = YN2Bool(node.GetAttribute("caseSensitive"))
		        For j = 0 To node.ChildCount-1
		          context = New SyntaxArea.HighlightContext(Self.Owner, CaseSensitive)
		          context.LoadFromXmlNode(node.Child(j))
		          AddContext(context)
		        Next j
		      End Select
		    Next i
		    
		    // Add a blank space context.
		    Self.AddBlankSpaceContext
		    
		    Return True
		  Catch e As RuntimeException
		    Return False
		  End Try
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21, Description = 4275696C6473207468652073656172636820737472696E672066726F6D20616C6C20636F6E74657874732E
		Private Sub RefreshSearchString()
		  /// Builds the search string from all contexts.
		  
		  Var patterns() As String
		  
		  For Each c As SyntaxArea.HighlightContext In SubContexts
		    If c.Enabled Then
		      patterns.Add("(" + c.ContextSearchPattern + ")")
		    End If
		  Next c
		  
		  mContextRegex.SearchPattern = String.FromArray(patterns, "|")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 53617665732074686520646566696E6974696F6E20746F206066696C656020617320584D4C2E
		Function SaveAsXml(file As FolderItem) As Boolean
		  /// Saves the definition to `file` as XML.
		  
		  If file = Nil Then Return False
		  
		  Try
		    Var tos As TextOutputStream = TextOutputStream.Create(file)
		    tos.Write(ToXML)
		    tos.Close
		    Return True
		  Catch
		    Return False
		  End Try
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 53696D706C652073796D626F6C207363616E2E
		Function ScanSymbols(forText As String) As Dictionary
		  /// Simple symbol scan.
		  
		  If mSymbolRegex = Nil Then Return Nil
		  
		  If forText.Encoding <> Nil Then forText = forText.ConvertEncoding(Encodings.UTF8)
		  
		  Var match As RegExMatch
		  Var symbol As String
		  Var pos As Integer
		  Var local As New Dictionary
		  Var tknIndex As Integer
		  Var symbolDef As SyntaxArea.SymbolsDefinition
		  
		  match = mSymbolRegex.Search(forText)
		  While match <> Nil
		    symbol = match.SubExpressionString(0)
		    
		    pos = forText.LeftBytes(match.SubExpressionStartB(0)).Length
		    
		    For i As Integer = 1 To match.SubExpressionCount - 1
		      If match.SubExpressionString(i) = symbol Then
		        tknIndex = SymbolIndex.IndexOf(i)
		        Exit
		      End If
		    Next i
		    
		    If tknIndex < 0 Or tknIndex > Symbols.LastIndex Then
		      // The definition can't handle source!?
		      Exit While
		    End If
		    
		    symbolDef = Symbols(tknIndex)
		    
		    // Strip spaces.
		    symbol = symbol.Trim
		    
		    // Do we need to trim any specific characters from the symbol?
		    If symbol.Length > 0 Then
		      If symbolDef.LTrim <> "" Then
		        symbol = symbol.TrimLeft(symbolDef.LTrim)
		      End If
		      If symbolDef.RTrim <> "" Then
		        symbol = symbol.TrimRight(symbolDef.RTrim)
		      End If
		    End If
		    
		    If symbol <> "" Then
		      local.Value(symbol) = New SyntaxArea.DocumentSymbol(symbol, pos, symbolDef.Type)
		    End If
		    
		    match = mSymbolRegex.Search
		  Wend
		  
		  If local.KeyCount = 0 Then Return Nil
		  
		  Return local
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SupportsCodeBlocks() As Boolean
		  Return BlockStartDef.KeyCount > 0 and BlockEndDef.KeyCount > 0
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E73207468697320646566696E6974696F6E20617320584D4C2E
		Function ToXML() As String
		  /// Returns this definition as XML.
		  
		  Var xml As XmlDocument
		  Var root, node As XMLNode
		  Var context As SyntaxArea.HighlightContext
		  Var Symbol As SyntaxArea.SymbolsDefinition
		  
		  xml = New XmlDocument
		  
		  // Root.
		  root = xml.AppendChild(xml.CreateElement("highlightDefinition"))
		  root.SetAttribute("version", Str(VERSION, "#.0"))
		  
		  // Name.
		  node = root.AppendChild(xml.CreateElement("name"))
		  node.AppendChild(xml.CreateTextNode(name))
		  IndentNode(node, 1)
		  
		  // Block markers.
		  For Each cond As String In BlockStartDef.Keys
		    Var ps() As Pair = BlockStartDef.Value(cond)
		    For Each p As Pair In ps
		      // p.Left: RegEx with SearchPattern
		      // p.Right: Pair of indent and state
		      node = root.AppendChild(xml.CreateElement("blockStartMarker"))
		      node.AppendChild(xml.CreateTextNode(RegEx(p.Left.ObjectValue).SearchPattern))
		      If cond <> "" Then
		        node.SetAttribute("condition", cond)
		      End If
		      Var indentAndState As Pair = p.Right
		      node.SetAttribute("indent", Str(indentAndState.Left, "#"))
		      Var state As Pair = indentAndState.Right
		      If state.Left.BooleanValue Then
		        node.SetAttribute("newstate", state.Right)
		      End If
		      IndentNode(node, 1)
		    Next p
		  Next cond
		  
		  For Each cond As String In BlockEndDef.Keys
		    Var ps() As Pair = BlockEndDef.Value(cond)
		    For Each p As Pair In ps
		      // p.Left: RegEx with SearchPattern
		      // p.Right: Pair of (rule_ref, Pair of (indent, state))
		      node = root.AppendChild(xml.CreateElement("blockEndMarker"))
		      node.AppendChild(xml.CreateTextNode(RegEx(p.Left.ObjectValue).SearchPattern))
		      If cond <> "" Then
		        node.SetAttribute("condition", cond)
		      End If
		      Var state As Pair = Pair(p.Right).Right
		      If state.Left.BooleanValue Then
		        node.SetAttribute("newstate", state.Right)
		      End If
		      IndentNode(node, 1)
		    Next p
		  Next cond
		  
		  For Each key As RegEx In LineContinuationDef.Keys
		    node = root.AppendChild(xml.CreateElement("lineContinuationMarker"))
		    node.AppendChild(xml.CreateTextNode(key.SearchPattern))
		    node.SetAttribute("indent", Str(lineContinuationDef.Value(key), "#"))
		    IndentNode(node, 1)
		  Next key
		  
		  node = root.AppendChild(xml.CreateElement("symbols"))
		  For Each symbol In Symbols
		    symbol.appendToXMLNode(node)
		  Next symbol
		  IndentNode(node, 1, True)
		  
		  If PlaceholderContextDef <> Nil Then
		    node = root.AppendChild(xml.CreateElement("placeholders"))
		    
		    // Enabled.
		    If Not PlaceholderContextDef.Enabled Then
		      node.SetAttribute("enabled", "false")
		    End If
		    
		    node.AppendChild(xml.CreateTextNode(PlaceholderContextDef.EntryRegEx))
		    
		    IndentNode(node, 1, False)
		  End If
		  
		  node = root.AppendChild(xml.CreateElement("contexts"))
		  node.SetAttribute("caseSensitive", Bool2YN(caseSensitive))
		  
		  // Process contexts.
		  For Each context In subContexts
		    If context.Name = "fieldwhitespace" Or context.IsPlaceholder Then Continue For
		    context.appendToXMLNode(node)
		  Next context
		  
		  IndentNode(node, 1, True)
		  IndentNode(root, 0, True)
		  
		  Return xml.ToString
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21, Description = 52657475726E732054727565206966206076616C7565602069732022796573222C206F74686572776973652072657475726E732046616C73652E
		Private Function YN2Bool(value As String) As Boolean
		  /// Returns True if `value` is "yes", otherwise returns False.
		  
		  If value = "yes" Then Return True
		  
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


	#tag Property, Flags = &h21, Description = 4B6579203D20636F6E646974696F6E2C2056616C7565203D204172726179206F662050616972206F66202872656765782C2050616972206F66202872656765785F6F665F626C6F636B53746172742C2050616972206F6620286368616E6765537461746520617320426F6F6C65616E203A206E6577537461746520617320537472696E6729292E
		Private BlockEndDef As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h21, Description = 4B6579203D20636F6E646974696F6E2C2056616C7565203D204172726179206F662050616972206F66202872656765782C2050616972206F662028696E64656E7420617320496E74656765722C2050616972206F6620286368616E6765537461746520617320426F6F6C65616E203A206E6577537461746520617320537472696E6729292E
		Private BlockStartDef As Dictionary
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mCaseSensitive
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mCaseSensitive = value
			  mContextRegex.Options.CaseSensitive = value
			End Set
		#tag EndSetter
		CaseSensitive As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return Owner.TextColor
			End Get
		#tag EndGetter
		DefaultColor As Color
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private LineContinuationDef As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mCaseSensitive As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mContextRegex As RegEx
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mName As String
	#tag EndProperty

	#tag Property, Flags = &h21, Description = 41207765616B207265666572656E636520746F207468697320646566696E6974696F6E2773206F776E696E6720656469746F722E
		Private mOwner As WeakRef
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mSymbolRegex As RegEx
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mName
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mName = value
			End Set
		#tag EndSetter
		Name As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0, Description = 54686520656469746F722074686174206F776E73207468697320646566696E6974696F6E2E
		#tag Getter
			Get
			  If mOwner = Nil Or mOwner.Value = Nil Then
			    Return Nil
			  Else
			    Return SyntaxArea.Editor(mOwner.Value)
			  End If
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If value <> Nil Then
			    mOwner = New WeakRef(value)
			  End If
			  
			End Set
		#tag EndSetter
		Owner As SyntaxArea.IEditor
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private PlaceholderContextDef As SyntaxArea.HighlightContext
	#tag EndProperty

	#tag Property, Flags = &h21
		Private SubContexts() As SyntaxArea.HighlightContext
	#tag EndProperty

	#tag Property, Flags = &h21
		Private SubExpressionCount As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private SubExpressionIndex() As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private SymbolCount As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private SymbolIndex() As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private SymbolPattern As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Symbols() As SyntaxArea.SymbolsDefinition
	#tag EndProperty


	#tag Constant, Name = VERSION, Type = Double, Dynamic = False, Default = \"1.1", Scope = Public
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="CaseSensitive"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="DefaultColor"
			Visible=false
			Group="Behavior"
			InitialValue="&h000000"
			Type="Color"
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
