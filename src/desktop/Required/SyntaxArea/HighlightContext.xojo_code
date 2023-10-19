#tag Class
Protected Class HighlightContext
	#tag Method, Flags = &h0
		Sub AddKeyword(keyword As String)
		  If keyword = "" Then Return
		  
		  keywords.Add(keyword)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub AddRegEx(newRegEx As String)
		  If newRegEx = "" Then Return
		  
		  Regexes.Add(newRegEx)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub AddSubContext(entry As SyntaxArea.HighlightContext)
		  If entry = Nil Then Return
		  
		  entry.ParentContext = Self
		  entry.Owner = Self.Owner
		  
		  SubContexts.Add(entry)
		  
		  SubExpressionCount = SubExpressionCount + 1
		  SubExpressionIndex.Add(SubExpressionCount)
		  
		  // Clear the caches, just in case.
		  mSubContextPattern = ""
		  mContextPattern = ""
		  
		  // Add the pattern to the search string.
		  If mSearchPattern <> "" Then mSearchPattern = mSearchPattern + "|"
		  mSearchPattern = mSearchPattern + "(" + entry.ContextSearchPattern + ")"
		  FixSubExpressionCount(entry.ContextSearchPattern)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 417070656E6473207468697320636F6E7465787420746F2074686520706172656E7420584D4C206E6F64652E20546869732069732075736564207768656E206578706F7274696E6720612073796E74617820646566696E6974696F6E20617320616E20584D4C2066696C652E
		Sub AppendToXMLNode(parent As XmlNode, depth As Integer = 2)
		  /// Appends this context to the parent XML node.
		  /// This is used when exporting a syntax definition as an XML file.
		  
		  Var xdoc As XmlDocument
		  Var node, context As XmlNode
		  
		  xdoc = parent.OwnerDocument
		  context = parent.AppendChild(xdoc.CreateElement("highlightContext"))
		  
		  // Name.
		  context.SetAttribute("name", Name)
		  
		  // Enabled.
		  If Not Enabled Then
		    context.SetAttribute("enabled", "false")
		  End If
		  
		  // Start regex?
		  If StartRegEx <> "" Then
		    node = context.AppendChild(xdoc.CreateElement("startRegEx"))
		    node.AppendChild(xdoc.CreateTextNode(StartRegEx))
		    IndentNode(node, depth + 1)
		  End If
		  
		  // End regex?
		  If EndRegEx <> "" Then
		    node = context.AppendChild(xdoc.CreateElement("endRegEx"))
		    node.AppendChild(xdoc.CreateTextNode(EndRegEx))
		    IndentNode(node, depth + 1)
		  End If
		  
		  // Entry regex?
		  If EntryRegEx <> "" Then
		    node = context.AppendChild(xdoc.CreateElement("entryRegEx"))
		    node.AppendChild(xdoc.CreateTextNode(EntryRegEx))
		    IndentNode(node, depth + 1)
		  End If
		  
		  // Keywords.
		  If keywords.LastIndex > -1 Then
		    node = context.AppendChild(xdoc.CreateElement("keywords"))
		    Var tmp As String
		    Var kw As XmlNode
		    For Each tmp In keywords
		      kw = node.AppendChild(xdoc.CreateElement("string"))
		      kw.AppendChild(xdoc.CreateTextNode(tmp))
		      IndentNode(kw, depth + 2)
		    Next
		    IndentNode(node, depth + 1, True)
		  End If
		  
		  // Regexes.
		  If Regexes.LastIndex > -1 Then
		    node = context.AppendChild(xdoc.CreateElement("regExes"))
		    Var tmp As String
		    Var kw As XmlNode
		    For Each tmp In Regexes
		      kw = node.AppendChild(xdoc.CreateElement("string"))
		      kw.AppendChild(xdoc.CreateTextNode(tmp))
		      IndentNode(kw, depth + 2)
		    Next
		    IndentNode(node, depth + 1, True)
		  End If
		  
		  // Finally subcontexts, if any.
		  Var subContext As SyntaxArea.HighlightContext
		  For Each subContext In SubContexts
		    If subContext.Name = "fieldwhitespace" Or subContext.isPlaceholder Then Continue For
		    subContext.appendToXMLNode(context, depth + 1)
		  Next subContext
		  
		  IndentNode(context, depth, True)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(owner As SyntaxArea.IEditor, caseSensitive As Boolean, createBlank As Boolean = True)
		  Self.Owner = owner
		  
		  mScanner = New RegEx
		  mScanner.Options.DotMatchAll = True
		  mScanner.Options.CaseSensitive = caseSensitive
		  
		  mEnabled = True
		  
		  // Whitespace tokeniser?
		  If createBlank Then
		    Var blankSpaceContext As New SyntaxArea.HighlightContext(Self.Owner, False, False)
		    blankSpaceContext.EntryRegEx = "([ ]|\t|\x0A|(?:\x0D\x0A?))" '"([\s])"
		    blankSpaceContext.Name = "fieldwhitespace"
		    AddSubContext(blankSpaceContext)
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Contexts() As SyntaxArea.HighlightContext()
		  Var current, tmp() As SyntaxArea.HighlightContext
		  
		  For Each current In SubContexts
		    If current.Name <> "fieldwhitespace" And current.Enabled Then tmp.Add(current)
		  Next current
		  
		  Return tmp
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E7320746865207265676578207061747465726E20666F72207468697320636F6E746578742E
		Function ContextSearchPattern() As String
		  /// Returns the regex pattern for this context.
		  
		  // If there's a StartRegEx then the pattern is the StartRegEx, the same goes 
		  // with the EntryRegEx
		  If StartRegEx <> "" Then Return StartRegEx
		  If entryRegEx <> "" Then Return entryRegEx
		  
		  // Otherwise if there's a cached version of the regex, return it.
		  If mContextPattern <> "" Then Return mContextPattern
		  
		  // Finally, build the pattern using the keywords, regexes and subcontexts 
		  // (these are exclusive).
		  // Check for keywords.
		  Var keyword As String
		  If keywords.LastIndex > -1 Then
		    mContextPattern = "\b("
		    For Each keyword In keywords
		      mContextPattern = mContextPattern + keyword + "|"
		    Next keyword
		    mContextPattern = mContextPattern.Left(mContextPattern.Length-1) + ")\b"
		    Return mContextPattern
		  End If
		  
		  // Otherwise check for regexes.
		  Var aRegEx As String
		  If regexes.LastIndex > -1 Then
		    mContextPattern = "("
		    For Each aRegEx In regexes
		      mContextPattern = mContextPattern + aRegEx + "|"
		    Next aRegEx
		    mContextPattern = mContextPattern.Left(mContextPattern.Length-1) + ")"
		    Return mContextPattern
		  End If
		  
		  // We seem never to get here...
		  mContextPattern = SubContextPattern
		  Return mContextPattern
		  
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
		  
		  For i As Integer = 0 To pattern.Length - 1
		    Select Case pattern.Middle(i, 1)
		    Case "\"
		      escaped = True
		      prevBracket = False
		    Case "("
		      Var nextChar As String = pattern.Middle(i + 1, 1)
		      If Not inCharClass And Not escaped And nextChar <> "?" Then
		        SubExpressionCount = SubExpressionCount + 1
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

	#tag Method, Flags = &h0, Description = 486967686C6967687473207468697320636F6E746578742E
		Function Highlight(s As String, subExpression As String, position As Integer, positionB As Integer, scanner As Regex, tokens() As SyntaxArea.TextSegment, placeholders() As SyntaxArea.TextPlaceholder) As Boolean
		  /// Highlights this context.
		  
		  #Pragma DisableBackgroundTasks
		  
		  Var match As RegExMatch
		  Var scanNextLine As Boolean = False
		  
		  // If there's a start and end regexes we need to find the EndRegEx.
		  If StartRegEx.Trim <> "" And mEndRegEx <> Nil Then
		    // Find end...
		    Var oldPattern As String = scanner.SearchPattern
		    scanner.SearchPattern = EndRegEx
		    match = scanner.Search(s, positionB + subExpression.Bytes)
		    scanner.SearchPattern = oldPattern
		    
		    // Find the subExpression.
		    If match <> Nil Then
		      subExpression = s.LeftBytes(match.SubExpressionStartB(0) + match.SubExpressionString(0).Bytes)
		      subExpression = subExpression.Right(subExpression.Length - position)
		    Else
		      // No match? We'll use the rest of the string.
		      subExpression = s.Right(s.Length - position)
		      scanner.SearchStartPosition = s.Bytes
		      scanNextLine = True
		    End If
		  End If
		  
		  Var entry As SyntaxArea.HighlightContext
		  Var substring As String
		  Var startPos, startPosB, charPos, charPosB As Integer
		  
		  Var style As SyntaxArea.TokenStyle
		  If Self.Name = "fieldwhitespace" And ParentContext <> Nil Then
		    style = Owner.StyleForToken(ParentContext.Name)
		  Else
		    style = Owner.StyleForToken(Self.Name, Self.Fallback)
		  End If
		  
		  // Scan subcontexts.
		  substring = mSearchPattern
		  If substring = "" Then
		    // Highlight subExpression.
		    Select Case subExpression
		    Case " "
		      tokens.Add(New SyntaxArea.TextSegment(position, 1, _
		      SyntaxArea.TextSegment.TYPE_SPACE, style.TextColor, style.BackColor, style.Bold, style.Italic, style.Underline, style.HasBackColor))
		      
		    Case Chr(9)
		      tokens.Add(New SyntaxArea.TextSegment(position, 1, _
		      SyntaxArea.TextSegment.TYPE_TAB, style.TextColor, style.BackColor, style.Bold, style.Italic, style.Underline, style.HasBackColor))
		      
		    Case Chr(10), Chr(13), Chr(13) + Chr(10)
		      tokens.Add(New SyntaxArea.TextSegment(position, subExpression.Length, _
		      SyntaxArea.TextSegment.TYPE_EOL, style.TextColor, style.BackColor, style.Bold, style.Italic, style.Underline, style.HasBackColor))
		      
		    Else
		      If subExpression.Length > 0 Then _
		      tokens.Add(New SyntaxArea.TextSegment(position, subExpression.Length, _
		      SyntaxArea.TextSegment.TYPE_WORD, style.TextColor, style.BackColor, style.Bold, style.Italic, style.Underline, style.HasBackColor))
		    End Select
		    
		  Else
		    If mScanner.SearchPattern <> substring Then
		      If mScanner.SearchPattern <> "" Then Break // This should get set only once!
		      mScanner.SearchPattern = substring
		    End If
		    match = mScanner.Search(subExpression)
		    
		    While match <> Nil
		      substring = match.SubExpressionString(0)
		      
		      // Determine which token was matched.
		      Var tknIndex As Integer
		      For i As Integer = 1 To match.SubExpressionCount - 1
		        If match.SubExpressionString(i) = substring Then
		          tknIndex = subExpressionIndex.IndexOf(i)
		          Exit
		        End
		      Next i
		      
		      If tknIndex < 0 Then //definition can't handle source!
		        Exit While
		      End If
		      
		      charPos = subExpression.LeftBytes(match.SubExpressionStartB(0)).Length
		      charPosB = match.SubExpressionStartB(0)
		      
		      If charPos - startPos > 0 Then _
		      tokens.Add(New SyntaxArea.TextSegment(startPos + position, charPos - startPos, _
		      SyntaxArea.TextSegment.TYPE_WORD, style.TextColor, style.BackColor, style.Bold, style.Italic, style.Underline, style.HasBackColor))
		      
		      startPos = charPos
		      startPosB = charPosB
		      
		      entry = subContexts(tknIndex)
		      
		      Var entryStyle As SyntaxArea.TokenStyle = Owner.StyleForToken(entry.Name)
		      
		      // Forward execution to subcontext...
		      If entry <> Nil And Not entry.isPlaceholder Then
		        Call entry.Highlight(subExpression, substring, position + startPos, positionB + startPosB, mScanner, tokens, placeholders)
		        startPos = subExpression.LeftBytes(mScanner.SearchStartPosition).Length
		        startPosB = mScanner.SearchStartPosition
		        
		      ElseIf entry <> Nil And entry.IsPlaceholder Then
		        Var label As String = match.SubExpressionString(match.SubExpressionCount - 1)
		        Var tmp As Integer = s.LeftBytes(match.SubExpressionStartB(match.SubExpressionCount - 1)).Length
		        
		        Var placeholder As New SyntaxArea.TextPlaceholder(startPos + position, _
		        substring.Length, tmp + position, label.Length, entryStyle.TextColor, _
		        entryStyle.BackColor, entryStyle.Bold, entryStyle.Italic, entryStyle.Underline, entryStyle.HasBackColor)
		        tokens.Add(placeholder)
		        placeholders.Add(placeholder)
		        
		        startPos = subExpression.LeftBytes(mScanner.SearchStartPosition).Length
		        startPosB = mScanner.SearchStartPosition
		      End If
		      match = mScanner.Search
		    Wend
		    
		    If subExpression.Length - startPos > 0 Then _
		    tokens.Add(New SyntaxArea.TextSegment(startPos + position, _
		    subExpression.Length - startPos, TextSegment.TYPE_WORD, style.TextColor, _
		    style.BackColor, style.Bold, style.Italic, style.Underline, style.HasBackColor))
		  End If
		  
		  Return scanNextLine
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub IndentNode(node As XmlNode, level As Integer, indentCloseTag As Boolean = False)
		  Var i As Integer
		  Var s As String
		  s = EndOfLine
		  For i = 1 To level
		    // Append a tab.
		    s = s + Chr(9)
		  Next i
		  
		  node.Parent.Insert(node.OwnerDocument.CreateTextNode(s), node)
		  
		  If indentCloseTag Then
		    node.AppendChild(node.OwnerDocument.CreateTextNode(s))
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ListKeywords(storage() As String)
		  // Add mine.
		  For Each keyword As String In keywords
		    storage.Add(keyword)
		  Next keyword
		  
		  // Then subs..
		  For i As Integer = 0 To SubContexts.LastIndex
		    SubContexts(i).ListKeywords(storage)
		  Next i
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 4C6F6164732074686520636F6E74657874206F7574206F6620616E20584D4C206E6F64652E
		Sub LoadFromXmlNode(node As XmlNode)
		  /// Loads the context out of an XML node.
		  
		  Var tmp As String
		  
		  // Context name.
		  Name = node.GetAttribute("name")
		  
		  // Case sensitivity override?
		  If node.GetAttribute("caseSensitive") <> "" Then
		    mScanner.Options.CaseSensitive = YN2Bool(node.GetAttribute("caseSensitive"))
		  End If
		  
		  // Fallback style name,
		  Fallback = node.GetAttribute("fallback")
		  
		  // Enabled?
		  tmp = node.GetAttribute("enabled")
		  Enabled = tmp <> "false"
		  
		  // Is this highlight context defined externally? That is, do we need to 
		  // ask the code editor's host app for a matching syntax definition file?
		  If node.GetAttribute("extension") <> "" Then
		    Var extension As SyntaxArea.HighlightDefinition = _
		    Owner.RaiseRequestDefinitionExtension(node.GetAttribute("extension"))
		    If extension <> Nil Then
		      // Copy all of the extension definition's contexts into this context.
		      For Each extensionContext As SyntaxArea.HighlightContext In extension.Contexts
		        AddSubContext(extensionContext)
		      Next extensionContext
		    End If
		  End If
		  
		  Var i, j As Integer
		  Var subNode As XmlNode
		  Var subContext As SyntaxArea.HighlightContext
		  
		  For i = 0 To node.ChildCount-1
		    subNode = node.Child(i)
		    Select Case subNode.Name
		    Case "startRegEx"
		      StartRegEx = subNode.FirstChild.Value
		    Case "endRegEx"
		      EndRegEx = subNode.FirstChild.Value
		    Case "entryRegEx"
		      EntryRegEx = subNode.FirstChild.Value
		    Case "keywords"
		      For j = 0 To subNode.ChildCount-1
		        If Not subNode.Child(j) IsA XmlComment Then
		          // Add only if it's not a comment.
		          AddKeyword(subNode.Child(j).FirstChild.Value)
		        End If
		      Next
		    Case "regExes"
		      For j = 0 To subNode.ChildCount-1
		        If Not subNode.Child(j) IsA XmlComment Then _
		        AddRegEx(subNode.Child(j).FirstChild.Value)
		      Next
		    Case "highlightContext"
		      subContext = New HighlightContext(Self.Owner, mScanner.Options.CaseSensitive)
		      subContext.loadFromXmlNode(subNode)
		      AddSubContext(subContext)
		    End Select
		  Next i
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function SubContextPattern() As String
		  If mSubContextPattern = "" Then
		    // Get the regex for the subContexts.
		    If SubContexts.LastIndex >= 0 Then
		      Var s As String = "("
		      For Each current As SyntaxArea.HighlightContext In SubContexts
		        s = s + current.ContextSearchPattern + "|"
		      Next current
		      
		      s = s.Left(s.Length-1) + ")"
		      mSubContextPattern = s
		    End If
		  End If
		  
		  Return mSubContextPattern
		  
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
		
		HighlightContext
		By Alex Restrepo
		send comments, suggestions, fixes to alexrestrepo@mac.com
		
		A little experiment on SyntaxHighlighting
		Contains the rules of how to Highlight a Context within a HighlightDefinition
		A context is composed of ONE of the following:
		- a start and end regexes, everything inside the start and end regexes is part of the context, 
		  this is a full match regex (subexpression 0)
		- an EntryRegEx, specifies the regular expression to match the whole context (ie: an html tag), the first subexpression 
		  of the expression is used (subexpression 1)
		- keywords, one or more keywords that need to be Highlighted, you can have multiple keyword contexts with different 
		  highlight colors. (array of strings)
		- regexes, one or more regular expressions that define variations of the same context (ie: in java #include or #package), 
		  subexpression 1 is used for each entry.
		
		Methods:
		addKeyword(keyword as String): adds the keyword to the keywords array
		
		addRegEx(newRegEx as String): adds the newRegEx to the regexes array
		
		addSubContext(context as HighlightContext): adds the context as a subcontext of this one, for example: properties within 
		xml tags
		
		appendToXMLNode(parent as xmlNode, depth as integer = 2): appends this context to the parent xml node as an xml node, 
		this is done when exporting the parent definition as an xml.
		
		Constructor(caseSensitive as Boolean): the constructor sets the case sensitiviness of the context.
		
		contextRegEx as string: returns the composed regular expression with all the contents of the context, if the context 
		has StartRegEx and EndRegEx, the contextRegEx is the StartRegEx
		
		Highlight(text as string, style as styledText, subExpression as string, position as integer, scanner as regex): Highlights the 
		subexpression, text is the text of the parent context, position is the position of the first character of the subexpression in the context.
		
		loadFromXmlNode(node as XmlNode): loads the context from the xmlNode.
		
		Properties:
		StartRegEx: the regular expression that defines the start of the context (ie: in java, /* for multiline comments)
		EndRegEx: the regular expression that marks the end of the context (ie: */)
		EntryRegEx: the regular expression that defines the context, ie: an xml tag: (<[^>]*>)
		HighlightColor: the HighlightColor for the context
		Name: the name of the Context, ie: "Tags"
		
		
		Open source under the creative commons license.
		Use in whatever way you like... at your own risk :P
		let me know if you find it useful.
		If you decide to use it in your projects, please give me credit in your about window or documentation, thanks.
	#tag EndNote


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mEnabled
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mEnabled = value
			End Set
		#tag EndSetter
		Enabled As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mEndRegex <> Nil Then
			    Return mEndRegex.SearchPattern
			  End If
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If value = "" Then
			    mEndRegex = Nil
			  Else
			    mEndRegex = New RegEx
			    mEndRegex.Options.DotMatchAll = True
			    mEndRegex.SearchPattern = value
			  End If
			  
			End Set
		#tag EndSetter
		EndRegEx As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mEntryRegex
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mEntryRegex = value
			End Set
		#tag EndSetter
		EntryRegEx As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0, Description = 546865206E616D65206F6620746865207374796C6520746F2075736520666F72207468697320636F6E746578742069662074686520656469746F7220646F65736E277420646566696E652061207374796C652074686174206D6174636865732074686520636F6E74657874277320604E616D65602070726F70657274792E
		#tag Getter
			Get
			  Return mFallback
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mFallback = value
			End Set
		#tag EndSetter
		Fallback As String
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		IsPlaceholder As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Keywords() As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mContextPattern As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mEnabled As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mEndRegex As RegEx
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mEntryRegex As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mFallback As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mName As String
	#tag EndProperty

	#tag Property, Flags = &h21, Description = 41207765616B207265666572656E636520746F20746865206F776E696E6720686967686C6967687420646566696E6974696F6E2E
		Private mOwner As WeakRef
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mParentContext As WeakRef
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mPlaceholderContextDef As SyntaxArea.HighlightContext
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mScanner As Regex
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mSearchPattern As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mStartRegex As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mSubContextPattern As String
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0, Description = 5468697320636F6E746578742773206E616D652E
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

	#tag ComputedProperty, Flags = &h0, Description = 54686520686967686C6967687420646566696E6974696F6E207468697320636F6E746578742062656C6F6E677320746F2E
		#tag Getter
			Get
			  If mOwner = Nil Or mOwner.Value = Nil Then
			    Return Nil
			  Else
			    Return SyntaxArea.IEditor(mOwner.Value)
			  End If
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If value = Nil Then
			    Return
			  Else
			    mOwner = New WeakRef(value)
			  End If
			  
			End Set
		#tag EndSetter
		Owner As SyntaxArea.IEditor
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0, Description = 41207765616B207265666572656E636520746F207468697320636F6E74657874277320706172656E74206F72204E696C2069662074686572652069736E2774206F6E652E
		#tag Getter
			Get
			  If mParentContext = Nil Or mParentContext.Value = Nil Then
			    Return Nil
			  Else
			    Return SyntaxArea.HighlightContext(mParentContext.Value)
			  End If
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If value = Nil Then
			    mParentContext = Nil
			  Else
			    mParentContext = New WeakRef(value)
			  End If
			  
			End Set
		#tag EndSetter
		ParentContext As SyntaxArea.HighlightContext
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mPlaceholderContextDef
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  // If already set, bail out.
			  If mPlaceholderContextDef <> Nil Then Return
			  
			  mPlaceholderContextDef = value
			  Self.AddSubContext(value)
			  
			  For Each subcontext As SyntaxArea.HighlightContext In SubContexts
			    If subContext <> value Then subContext.PlaceholderContextDef = value
			  Next subcontext
			  
			End Set
		#tag EndSetter
		PlaceholderContextDef As SyntaxArea.HighlightContext
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private Regexes() As String
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mStartRegex
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mStartRegex = value
			End Set
		#tag EndSetter
		StartRegEx As string
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private SubContexts() As SyntaxArea.HighlightContext
	#tag EndProperty

	#tag Property, Flags = &h21
		Private SubExpressionCount As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private SubExpressionIndex() As Integer
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Enabled"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="EndRegEx"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="entryRegEx"
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
			Name="IsPlaceholder"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
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
			Name="StartRegEx"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
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
			Name="Fallback"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
