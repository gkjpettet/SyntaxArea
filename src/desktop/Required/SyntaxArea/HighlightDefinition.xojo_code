#tag Class
Protected Class HighlightDefinition
	#tag Method, Flags = &h21, Description = 41646473206120626C616E6B20737061636520636F6E746578742C20746869732077696C6C20746F6B656E69736520737472696E67732E
		Private Sub AddBlankSpaceContext()
		  /// Adds a blank space context, this will tokenise strings.
		  
		  Var blankSpaceContext As New SyntaxArea.HighlightContext(Self.Owner, False, False, Self)
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
		  LineContinuationDef = New Dictionary
		  ContextsToSelfReference = New Dictionary
		  BlockEndDef = New Dictionary
		  BlockStartDef = New Dictionary
		  
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

	#tag Method, Flags = &h0, Description = 4C6F61647320612073796E74617820646566696E6974696F6E20544F4D4C2066696C652E204D617920726169736520616E2060496E76616C6964417267756D656E74457863657074696F6E602E
		Shared Function FromTOMLFile(f As FolderItem, owner As SyntaxArea.IEditor) As SyntaxArea.HighlightDefinition
		  /// Loads a syntax definition TOML file.
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
		  
		  Var toml As String
		  Try
		    Var tin As TextInputStream = TextInputStream.Open(f)
		    toml = tin.ReadAll
		    tin.Close
		  Catch e As IOException
		    Raise New InvalidArgumentException("Unable to read the TOML contents of the definition file (" + _
		    e.Message + ").")
		  End Try
		  
		  Var def As New SyntaxArea.HighlightDefinition(owner)
		  Try
		    def.LoadFromTOML(toml)
		  Catch e As RuntimeException
		    Raise New InvalidArgumentException("Invalid syntax definition file: " + e.Message)
		  End Try
		  
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

	#tag Method, Flags = &h0, Description = 52657475726E7320547275652069662069742773206120626C6F636B20656E642C206E657720737461746520616E6420746865206D6174636865642072756C65
		Function IsBlockEnd(lineText As String, stateIn As String, ByRef stateOut As String, ByRef ruleOut As RegEx) As Boolean
		  /// Returns True if it's a block end, new state and the matched rule
		  
		  stateOut = stateIn
		  
		  If Not BlockEndDef.HasKey(stateIn) Then Return False
		  
		  Var blockEndDefs() As BlockEndDefinition = BlockEndDef.Value(stateIn)
		  
		  For Each endDef As BlockEndDefinition In blockEndDefs
		    If endDef.Scanner.Search(lineText) <> Nil Then
		      If endDef.Data.State.ChangeState Then
		        stateOut = endDef.Data.State.NewState
		      End If
		      ruleOut = endDef.Data.BlockStartRegex
		      Return True
		    End If
		  Next endDef
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E732074686520696E64656E742076616C75652C20746865206E657720737461746520616E6420746865206D6174636865642072756C652E
		Function IsBlockStart(lineText As String, stateIn As String, ByRef stateOut As String, ByRef ruleOut As RegEx) As Integer
		  /// Returns the indent value, the new state and the matched rule.
		  
		  stateOut = stateIn
		  
		  If Not BlockStartDef.HasKey(stateIn) Then Return 0
		  
		  Var blockStartDefs() As BlockStartDefinition = BlockStartDef.Value(stateIn)
		  
		  For Each bsd As BlockStartDefinition In BlockStartDefs
		    If bsd.Scanner.Search(lineText) <> Nil Then
		      If bsd.Data.State.ChangeState Then
		        stateOut = bsd.Data.State.NewState
		      End If
		      ruleOut = bsd.Scanner
		      Return bsd.Data.Indent
		    End If
		  Next bsd
		  
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

	#tag Method, Flags = &h0, Description = 4C6F616473206120544F4D4C20646566696E6974696F6E2066696C652E204D61792072616973652061206052756E74696D65457863657074696F6E602E
		Sub LoadFromTOML(data As FolderItem)
		  /// Loads a TOML definition file.
		  /// May raise a `RuntimeException`.
		  
		  If data = Nil Then
		    Raise New InvalidArgumentException("Cannot load definition file (file is Nil).")
		  End If
		  
		  Var tis As TextInputStream
		  Try
		    tis = TextInputStream.Open(data)
		    Var toml As String = tis.ReadAll(Encodings.UTF8)
		    LoadFromTOML(toml)
		    tis.Close
		  Catch e1 As IOException
		    Raise New InvalidArgumentException("Cannot open the syntax definition file for reading.")
		  End Try
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 4C6F616473206120544F4D4C2073796E74617820646566696E6974696F6E2E2052616973657320612072756E74696D6520657863657074696F6E20696620756E61626C6520746F206C6F61642074686520646566696E6974696F6E2E
		Sub LoadFromTOML(toml As String)
		  /// Loads a TOML syntax definition.
		  /// Raises a runtime exception if unable to load the definition.
		  
		  Var data As Dictionary = ParseTOML(toml)
		  
		  // Check the engine version key is present and valid.
		  If Not data.HasKey("engineVersion") Then
		    Raise New InvalidArgumentException("Missing definition `engineVersion` key.")
		  End If
		  Var requiredVersion As SyntaxArea.SemanticVersion
		  Try
		    requiredVersion = New SyntaxArea.SemanticVersion(data.Value("engineVersion").StringValue)
		  Catch e As RuntimeException
		    Raise New InvalidArgumentException("Invalid version format for `engineVersion`. " + _
		    "Expected a semantic version string: " + e.Message)
		  End Try
		  
		  // If a definition version has been provided, assert it is in the correct format.
		  If data.HasKey("definitionVersion") Then
		    Var defVersion As String = data.Value("definitionVersion").StringValue
		    Try
		      Self.Version = New SyntaxArea.SemanticVersion(defVersion)
		    Catch e As RuntimeException
		      Raise New InvalidArgumentException("If a `definitionVersion` key is provided " + _
		      "then it must be a semantic version string: " + e.Message)
		    End Try
		  End If
		  
		  // Is this definition compatible with the current engine version?
		  If requiredVersion > EngineVersion Then
		    Raise New UnsupportedOperationException("This definition requires SyntaxArea " + _
		    "highlight engine version " + requiredVersion.ToString + " (current engine version is " + EngineVersion.ToString + ").")
		  End If
		  
		  // Definition name.
		  If Not data.HasKey("name") Then
		    Raise New InvalidArgumentException("Missing definition `name` key.")
		  Else
		    Self.Name = data.Value("name")
		  End If
		  
		  // If this definition supports code blocks then data should contain a dictionary called `blocks`.
		  Try
		    If data.HasKey("blocks") And data.Value("blocks") IsA Dictionary _
		      And Dictionary(data.Value("blocks")).KeyCount > 0 Then
		      // A language may have several types of code block. The `block` dictionary keys are the names
		      // of those different block types and each value is a dictionary.
		      Var blocks As Dictionary = data.Value("blocks")
		      For Each entry As DictionaryEntry In blocks
		        ParseTOMLBlock(entry.Key, entry.Value)
		      Next entry
		    End If
		  Catch e As RuntimeException
		    Raise New InvalidArgumentException("An error occurred whilst parsing the definition's blocks: " + _
		    e.Message)
		  End Try
		  
		  // Line continuation marker?
		  If data.HasKey("lineContinuationMarker") And data.Value("lineContinuationMarker") IsA Dictionary Then
		    ParseLineContinuationMarkerTable(data)
		  End If
		  
		  // Optional symbols.
		  Try
		    If data.HasKey("symbols") And data.Value("symbols") IsA Dictionary And _
		      Dictionary(data.Value("symbols")).KeyCount > 0 Then
		      // A language may define several types of symbol. The `symbols` dictionary keys are the names
		      // of those symbols and each value is a dictionary.
		      Var symbols As Dictionary = data.Value("symbols")
		      For Each entry As DictionaryEntry In symbols
		        ParseTOMLSymbol(entry.Key, entry.Value)
		      Next entry
		    End If
		  Catch e As RuntimeException
		    Raise New InvalidArgumentException("An error occurred whilst parsing the definition's symbols: " + _
		    e.Message)
		  End Try
		  
		  // Contexts.
		  If data.HasKey("contexts") And data.Value("contexts") IsA Dictionary Then
		    Var contexts As Dictionary = data.Value("contexts")
		    
		    // Determine the case sensitivity for the definition overall.
		    Self.CaseSensitive = contexts.Lookup("caseSensitive", False)
		    
		    // Parse the contexts.
		    For Each entry As DictionaryEntry In contexts
		      If entry.Value IsA Dictionary Then
		        Var context As New SyntaxArea.HighlightContext(Self.Owner, Self.CaseSensitive, Self)
		        context.LoadFromTOML(entry.Key, entry.Value, False, "")
		        AddContext(context)
		      End If
		    Next entry
		    
		    If SubContexts.Count = 0 Then
		      Raise New InvalidArgumentException("Expected at least one context within the `contexts` table.")
		    End If
		  End If
		  
		  // Placeholders. These are very similar to contexts except they can't have subcontexts.
		  If data.HasKey("placeholders") And data.Value("placeholders") IsA Dictionary Then
		    
		    Var placeholders As Dictionary = data.Value("placeholders")
		    For Each entry As DictionaryEntry In placeholders
		      If entry.Value IsA Dictionary Then
		        Var placeholder As New SyntaxArea.HighlightContext(Self.Owner, False, False, Self)
		        placeholder.LoadFromTOML(entry.Key, entry.Value, True, "")
		        AddContext(placeholder)
		      End If
		    Next entry
		  End If
		  
		  // Add a blank space context.
		  Self.AddBlankSpaceContext
		  
		  // Finalise self references.
		  If ContextsToSelfReference.KeyCount > 0 Then
		    For Each entry As DictionaryEntry In ContextsToSelfReference
		      Var hc As HighlightContext = entry.Key
		      For Each c As SyntaxArea.HighlightContext In Self.Contexts
		        hc.AddSubContext(c)
		      Next c
		    Next entry
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21, Description = 5061727365732061206C696E6520636F6E74696E756174696F6E206D61726B657220544F4D4C207461626C652E
		Private Sub ParseLineContinuationMarkerTable(data As Dictionary)
		  /// Parses a line continuation marker TOML table.
		  
		  Var lcm As Dictionary = data.Value("lineContinuationMarker")
		  Var lcmRegEx As New RegEx
		  If Not lcm.HasKey("regex") Then
		    Raise New InvalidArgumentException("The `lineContinuation` table is missing the required " + _
		    "`regex` key.")
		  Else
		    lcmRegEx.SearchPattern = lcm.Value("regex")
		  End If
		  If Not lcm.HasKey("indent") Then
		    Raise New InvalidArgumentException("The `lineContinuation` table is missing the required " + _
		    "`indent` key.")
		  Else
		    LineContinuationDef.Value(lcmRegEx) = lcm.Value("indent").IntegerValue
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21, Description = 50617273657320626C6F636B20544F4D4C206461746120746F206120626C6F636B20646566696E6974696F6E2E204D617920726169736520616E2060496E76616C6964417267756D656E74457863657074696F6E602E
		Private Sub ParseTOMLBlock(blockName As String, blockData As Dictionary)
		  /// Parses block TOML data to a block definition.
		  /// May raise an `InvalidArgumentException`.
		  ///
		  /// `blockData` format:
		  /// Required keys:
		  /// - start:  Regex string to find the start of the block.
		  /// - end:    Regex string to find the end of the block.
		  /// - indent: Integer telling the editor how much to indent a block by.
		  ///
		  /// Optional keys:
		  /// - startState:     String.
		  /// - endState:       String.
		  /// - startCondition: String.
		  /// - endCondition:   String.
		  ///
		  /// About states and conditions.
		  /// Since I ported SyntaxArea from CustomEditField, I'm not completely sure what they do. I think
		  /// when the engine encounters a block with a startState then it stores that the engine is in that
		  /// state. If endCondition matches the current state then I think the current state is set to endState.
		  
		  // Assert the required keys are present.
		  If Not blockData.HasKey("start") Then
		    Raise New InvalidArgumentException("The `" + blockName + "` block is missing the `start` key.")
		  End If
		  If Not blockData.HasKey("end") Then
		    Raise New InvalidArgumentException("The `" + blockName + "` block is missing the `end` key.")
		  End If
		  If Not blockData.HasKey("indent") Then
		    Raise New InvalidArgumentException("The `" + blockName + "` block is missing the `indent` key.")
		  End If
		  
		  Var indent As Integer = blockData.Value("indent")
		  
		  // Block start.
		  Var blockStartRegEx As New RegEx
		  blockStartRegEx.SearchPattern = blockData.Value("start")
		  Var startState As String = blockData.Lookup("startState", "")
		  Var startCondition As String = blockData.Lookup("startCondition", "")
		  Var startBlockState As New BlockState(startState <> "", startState)
		  Var bsd As New BlockStartData(indent, startBlockState)
		  
		  // Get the block start defs array (if there is one) or create an empty array.
		  Var blockStartDefs() As BlockStartDefinition
		  Var v1 As Variant = BlockStartDef.Lookup(startCondition, Nil)
		  If v1.IsArray Then blockStartDefs = v1 
		  
		  // Add the new start definition.
		  blockStartDefs.Add(New BlockStartDefinition(blockStartRegEx, bsd, blockName))
		  
		  // Re-assign all the start definitions back.
		  BlockStartDef.Value(startCondition) = blockStartDefs
		  
		  // Block end.
		  Var blockEndRegEx As New RegEx
		  blockEndRegEx.SearchPattern = blockData.Value("end")
		  Var endState As String = blockData.Lookup("endState", "")
		  Var endCondition As String = blockData.Lookup("endCondition", "")
		  Var endBlockState As New BlockState(endState <> "", endState)
		  Var bed As New BlockEndData(blockStartRegEx, endBlockState)
		  
		  // Get the block end defs array (if there is one) or create an empty array.
		  Var blockEndDefs() As BlockEndDefinition
		  Var v2 As Variant = BlockEndDef.Lookup(endCondition, Nil)
		  If v2.IsArray Then blockEndDefs = v2 
		  
		  // Add the new end definition.
		  blockEndDefs.Add(New BlockEndDefinition(blockEndRegEx, bed, blockName))
		  
		  // Re-assign all the end definitions back.
		  BlockEndDef.Value(endCondition) = blockEndDefs
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21, Description = 5061727365732073796D626F6C20544F4D4C206461746120746F20612073796D626F6C20646566696E6974696F6E2E204D617920726169736520616E2060496E76616C6964417267756D656E74457863657074696F6E602E
		Private Sub ParseTOMLSymbol(type As String, data As Dictionary)
		  /// Parses symbol TOML data to a symbol definition.
		  /// May raise an `InvalidArgumentException`.
		  ///
		  /// `data` format:
		  /// Required keys:
		  /// - regex: Regex string to find the symbol
		  ///
		  /// Optional keys:
		  /// - lTrim: Optional string to trim from the left of the symbol's value.
		  /// - rTrim: Optional string to trim from the right of the symbol's value.
		  
		  Var symbol As New SyntaxArea.SymbolsDefinition
		  
		  symbol.Type = type
		  
		  // Required regex.
		  If Not data.HasKey("regex") Then
		    Raise New InvalidArgumentException("The `" + type + _
		    "` symbol table is missing the required `regex` key.")
		  Else
		    symbol.EntryRegex = data.Value("regex")
		  End If
		  
		  // Optional ltrim and rtrim keys.
		  If data.HasKey("lTrim") Then
		    symbol.LTrim = data.Value("lTrim").StringValue
		  End If
		  If data.HasKey("rTrim") Then
		    symbol.RTrim = data.Value("rTrim").StringValue
		  End If
		  
		  AddSymbol(symbol)
		  
		End Sub
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
		  Return BlockStartDef.KeyCount > 0 And BlockEndDef.KeyCount > 0
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
		Contains the rules of how to Highlight the contents of the text field.
		A definition is composed of one or more HighlightContexts
		
		Methods:
		Highlight(text as string, style as styledText): highlights the provided text using the provided styledtext object.
		LoadFromTOML(data as string): loads a HighlightDefinition stored in a TOML string
		LoadFromTOML(data as folderItem): loads a HighlightDefinition stored in a TOML file
		
		 
		Properties:
		CaseSensitive: gets or sets if the contained syntax is case-sensitive
		DefaultColor: gets or sets the default color for the text
		Name: the name of the definition (ie: Wren or Xojo)
		
	#tag EndNote

	#tag Note, Name = Block Data Proposal
		--------------------
		Current
		--------------------
		BlockStartDef
		Key = condition (String)
		Value = Pair array:
		Regex : Pair of (indent as Integer, Pair of (changeState as Boolean : newState as String))
		--------------------
		
		BlockStartDef proposal:
		Key = condition (String), Value = BlockStartDefinition()
		
		BlockStartData
		- Indent: Integer
		- State: BlockState
		
		BlockStartDefinition
		- Scanner: RegEx
		- Data: BlockStartData()
		
		
		--------------------
		Current
		--------------------
		BlockEndDef
		Key = condition (String)
		Value = Pair array
		RegEx : Pair(block start RegEx, Pair(changeStateBoolean : newStateString))
		--------------------
		
		BlockEndDef proposal:
		Key = condition, Value = BlockEndDefinition()
		
		BlockEndDefinition
		- Scanner: RegEx
		- Data: BlockEndData()
		
		BlockEndData
		- BlockStartRegex : RegEx
		- State: BlockState
		
		BlockState
		- ChangeState: Boolean
		- NewState: String
	#tag EndNote


	#tag Property, Flags = &h21, Description = 4B6579203D20636F6E646974696F6E2C2056616C7565203D20426C6F636B456E64446566696E6974696F6E2829
		Private BlockEndDef As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h21, Description = 4B6579203D20636F6E646974696F6E2028537472696E67292C2056616C7565203D20426C6F636B5374617274446566696E6974696F6E2829
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

	#tag Property, Flags = &h0, Description = 436F6E7461696E7320636F6E746578747320746861742068617665207265666572656E63656420746869732073796E74617820646566696E6974696F6E20696E207468656972206F776E20646566696E6974696F6E2E205768656E2066696E616C6973696E6720746869732073796E74617820646566696E6974696F6E2077652077696C6C206E65656420746F2061646420616C6C206F66207468697320646566696E6974696F6E7320636F6E746578747320746F2065616368206F662074686520686967686C6967687420636F6E746578747320696E20746869732064696374696F6E6172792E204B6579203D20486967686C69676874436F6E746578742C2056616C7565203D204E696C20286E6F742075736564292E
		ContextsToSelfReference As Dictionary
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return Owner.TextColor
			End Get
		#tag EndGetter
		DefaultColor As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0, Description = 5468652063757272656E742076657273696F6E206F662074686520686967686C69676874696E6720656E67696E652E
		#tag Getter
			Get
			  Static ver As New SyntaxArea.SemanticVersion(MAJOR_VERSION, MINOR_VERSION, PATCH_VERSION)
			  
			  Return ver
			  
			End Get
		#tag EndGetter
		Shared EngineVersion As SyntaxArea.SemanticVersion
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

	#tag Property, Flags = &h0, Description = 5468697320646566696E6974696F6E27732076657273696F6E2E
		Version As SyntaxArea.SemanticVersion
	#tag EndProperty


	#tag Constant, Name = MAJOR_VERSION, Type = Double, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = MINOR_VERSION, Type = Double, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant

	#tag Constant, Name = PATCH_VERSION, Type = Double, Dynamic = False, Default = \"0", Scope = Public
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
