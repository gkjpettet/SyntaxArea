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

	#tag Method, Flags = &h0
		Sub AddSubContext(entry As SyntaxArea.HighlightContext)
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

	#tag Method, Flags = &h0
		Sub Constructor(owner As SyntaxArea.IEditor, caseSensitive As Boolean, createBlank As Boolean = True, owningSyntax As HighlightDefinition)
		  Self.Owner = owner
		  
		  If owningSyntax = Nil Then
		    Raise New InvalidArgumentException("A highlight context must be owned by a syntax definition.")
		  Else
		    mMySyntax = New WeakRef(owningSyntax)
		  End If
		  
		  mScanner = New RegEx
		  mScanner.Options.DotMatchAll = True
		  mScanner.Options.CaseSensitive = caseSensitive
		  
		  mEnabled = True
		  
		  // Whitespace tokeniser?
		  If createBlank Then
		    Var blankSpaceContext As New SyntaxArea.HighlightContext(Self.Owner, False, False, owningSyntax)
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

	#tag Method, Flags = &h0, Description = 506172736573206120636F6E7465787420544F4D4C207461626C6520616E6420696E697469616C69736573207468697320486967686C69676874436F6E746578742077697468207468617420646174612E204D617920726169736520616E2060496E76616C6964417267756D656E74457863657074696F6E602E
		Sub LoadFromTOML(contextName As String, data As Dictionary, isPlaceholder As Boolean, parentFallback As String)
		  /// Parses a context TOML table and initialises this HighlightContext with that data. 
		  /// May raise an `InvalidArgumentException`.
		  ///
		  /// `data` format:
		  /// Either:
		  /// `regex`: Regex string that defines this entire context.
		  /// **or both**:
		  /// `start`: Regex string that defines the start of this context
		  /// `end`: Regex string that defines the end of this context
		  /// **or**:
		  /// `keywords`: An array of strings to match.
		  ///
		  /// Optional keys:
		  /// - fallback: The name of the style to fall back to if the theme doesn't support a style 
		  ///             named `contextName`.
		  /// May contain additional subcontext tables, the key to which is the context's name.
		  
		  // We need to track which keys have been dealt with so we know which keys at the end are assumed
		  // to be subcontexts.
		  Var handledKeys() As String
		  
		  // Context name.
		  Name = contextName
		  
		  // Placeholder?
		  Self.IsPlaceholder = isPlaceholder
		  
		  // Case sensitivity override?
		  If data.HasKey("caseSensitive") Then
		    mScanner.Options.CaseSensitive = data.Value("caseSensitive").BooleanValue
		    handledKeys.Add("caseSensitive")
		  End If
		  
		  // Fallback style name,
		  If data.HasKey("fallback") Then
		    Fallback = data.Value("fallback")
		    handledKeys.Add("fallback")
		  Else
		    Fallback = parentFallback
		  End If
		  
		  // Enabled?
		  If data.HasKey("enabled") Then
		    Enabled = data.Value("enabled")
		    handledKeys.Add("enabled")
		  Else
		    Enabled = True
		  End If
		  
		  If Not isPlaceholder Then
		    // Is this highlight context defined externally? That is, do we need to 
		    // ask the code editor's host app for a matching syntax definition file?
		    If data.HasKey("extension") And Owner.EnableDefinitionExtensions Then
		      #Pragma Warning "BUG: The extension system now seems to not work at all and was buggy before!"
		      If data.Value("extension") = MySyntax.Name Then
		        // We will add this completed definition's contexts into this context once this
		        // definition is finalised to prevent a stackoverflow error due to runaway recursion.
		        MySyntax.ContextsToSelfReference.Value(Self) = Nil
		      Else
		        Var extension As SyntaxArea.HighlightDefinition = _
		        Owner.RaiseRequestDefinitionExtension(data.Value("extension"))
		        If extension <> Nil Then
		          // Copy all of the extension definition's contexts into this context.
		          For Each extensionContext As SyntaxArea.HighlightContext In extension.Contexts
		            AddSubContext(extensionContext)
		          Next extensionContext
		        End If
		      End If
		      handledKeys.Add("extension")
		    End If
		  End If
		  
		  // Single regex?
		  If data.HasKey("regex") Then
		    // Assert that `start`, `end` and `keywords` are absent.
		    If data.HasKey("start") Or data.HasKey("end") Or data.HasKey("keywords") Then
		      Raise New InvalidArgumentException("The TOML table `" + contextName  + "` has the " + _
		      " `regex` key. Unexpected `start`, `end` or `keywords` key.")
		    End If
		    EntryRegEx = data.Value("regex")
		    handledKeys.Add("regex")
		  End If
		  
		  // Start and end regexes?
		  If data.HasKey("start") Then
		    // Must have an `end` key.
		    If Not data.HasKey("end") Then
		      Raise New InvalidArgumentException("The TOML table for `" + contextName + "` is missing " + _
		      "the `end` key.")
		    End If
		    
		    // Assert it doesn't also have a `regex` and/or `keywords` key.
		    If data.HasKey("regex") Or data.HasKey("keywords") Then
		      Raise New InvalidArgumentException("The TOML table `" + contextName  + "` has the " + _
		      " `start` key. Unexpected `regex` and/or `keywords` key.")
		    End If
		    
		    StartRegEx = data.Value("start")
		    EndRegEx = data.Value("end")
		    
		    handledKeys.Add("start")
		    handledKeys.Add("end")
		  End If
		  
		  // Keywords?
		  If data.HasKey("keywords") Then
		    // Assert that `start`, `end` and `regex` are absent.
		    If data.HasKey("start") Or data.HasKey("end") Or data.HasKey("regex") Then
		      Raise New InvalidArgumentException("The TOML table `" + contextName  + "` has the " + _
		      " `keywords` key. Unexpected `start`, `end` or `regex` key.")
		    End If
		    
		    // `keywords` should be a string array.
		    Var keywordsValue As Variant = data.Value("keywords")
		    If Not keywordsValue.IsArray Then
		      Raise New InvalidArgumentException("Expected a string array as the value of the" + _
		      " `keywords` key in the `" + contextName + "` context definition.")
		    End If
		    Var keywords() As Variant = keywordsValue
		    For Each keywordVariant As Variant In keywords
		      AddKeyword(keywordVariant.StringValue)
		    Next keywordVariant
		    
		    handledKeys.Add("keywords")
		  End If
		  
		  // Specific regex patterns?
		  If data.HasKey("regexes") Then
		    // `regexes` should be a string array.
		    Var regexesValue As Variant = data.Value("regexes")
		    If Not regexesValue.IsArray Then
		      Raise New InvalidArgumentException("Expected a string array as the value of the" + _
		      " `regexes` key in the `" + contextName + "` context definition.")
		    End If
		    Var regexStrings() As Variant = regexesValue
		    For Each regexVariant As Variant In regexStrings
		      AddRegEx(regexVariant.StringValue)
		    Next regexVariant
		    
		    handledKeys.Add("regexes")
		  End If
		  
		  // Add optional subcontexts so long as this isn't a placeholder.
		  If Not isPlaceholder Then
		    // Any other keys not already dealt with are assumed to be the names of subcontexts.
		    // Their values should be context tables like this one.
		    For Each key As String In data.Keys
		      // Only keys not already handled are assumed to be subcontexts.
		      If handledKeys.IndexOf(key) > -1 Then Continue
		      Var subContextName As String = key
		      
		      If data.Value(key) IsA Dictionary Then
		        Var subContext As New HighlightContext(Self.Owner, mScanner.Options.CaseSensitive, MySyntax)
		        subContext.LoadFromTOML(subContextName, data.Value(subContextName), False, Self.Fallback)
		        AddSubContext(subContext)
		      End If
		    Next key
		  End If
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
		
		Constructor(caseSensitive as Boolean): the constructor sets the case sensitiviness of the context.
		
		contextRegEx as string: returns the composed regular expression with all the contents of the context, if the context 
		has StartRegEx and EndRegEx, the contextRegEx is the StartRegEx
		
		Highlight(text as string, style as styledText, subExpression as string, position as integer, scanner as regex): Highlights the 
		subexpression, text is the text of the parent context, position is the position of the first character of the subexpression in the context.
		
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
		Private mMySyntax As WeakRef
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

	#tag ComputedProperty, Flags = &h0, Description = 41207765616B207265666572656E636520746F207468697320636F6E746578742773206F776E696E672073796E74617820646566696E6974696F6E2E
		#tag Getter
			Get
			  If mMySyntax = Nil Or mMySyntax.Value = Nil Then
			    Return Nil
			  Else
			    Return HighlightDefinition(mMySyntax.Value)
			  End If
			  
			End Get
		#tag EndGetter
		MySyntax As HighlightDefinition
	#tag EndComputedProperty

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
