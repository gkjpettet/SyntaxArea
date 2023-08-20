#tag Class
Protected Class PaTrie
	#tag Method, Flags = &h0
		Function addKey(key as string, data as variant = nil) As PatrieNode
		  if key = "" then Return nil
		  
		  if key.Encoding = nil then
		    key = key.DefineEncoding(Encodings.UTF8)
		  end if
		  
		  var tmpNode as PaTrieNode
		  var index as Integer = key.IndexOf(".")
		  
		  //if there's no path component to the key...
		  if index = -1 then
		    Return root.addKey(Key, data)
		  end if
		  
		  //now, if there is, find the parent node
		  var keyPath as String = key.Left(index)
		  var searchPath as String
		  
		  tmpNode = root.findNode(keyPath, searchPath)
		  if tmpNode = nil then
		    //if not found, add the node
		    tmpNode = root.addKey(keyPath)
		  end if
		  
		  //strip the path from the key, and add it.
		  if tmpNode.KeyMembers = nil then tmpNode.KeyMembers = new PaTrie
		  return tmpNode.KeyMembers.addKey(key.Right(key.Length - (index+1)), data)
		  
		  
		  
		  
		  
		  ///working///
		  
		  
		  'if key = "" then Return nil
		  '
		  'if key.Encoding = nil then
		  'key = key.DefineEncoding(Encodings.UTF8)
		  'end if
		  '
		  'var tmpNode as PaTrieNode
		  'var index as Integer = key.InStr(".")
		  '
		  '//var index as Integer = key.IndexOf(".")
		  '
		  '//if there's no path component to the key...
		  'if index = 0 then
		  'Return root.addKey(Key, data)
		  'end if
		  '
		  '//now, if there is, find the parent node
		  'var keyPath as String = key.Left(index - 1)
		  'var searchPath as String
		  '
		  'tmpNode = root.findNode(keyPath, searchPath)
		  'if tmpNode = nil then
		  '//if not found, add the node
		  'tmpNode = root.addKey(keyPath)
		  'end if
		  '
		  '//strip the path from the key, and add it.
		  'if tmpNode.KeyMembers = nil then tmpNode.KeyMembers = new PaTrie
		  'return tmpNode.KeyMembers.addKey(key.Right(key.Len - index), data)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  root = new PaTrieNode
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function wordsForPrefix(key as string, byref longestCommonPrefix as string) As string()
		  #pragma DisableBackgroundTasks
		  #pragma DisableBoundsChecking
		  
		  var result() as String
		  
		  var searchPath as String
		  var node as PaTrieNode
		  var index as Integer = key.IndexOf(".")
		  
		  //no path
		  if index = -1 then
		    node = root.findNode(key, searchPath)
		    if node = nil then Return result
		    
		    //node IS the longestCommonPrefix
		    longestCommonPrefix = searchPath + node.Key
		    node.subnodePaths(searchPath, result)
		    Return result
		  end if
		  
		  //extract path and continue search.
		  var keyPath as String = key.Left(index)
		  node = root.findNode(keyPath, searchPath)
		  if node = nil then Return result
		  
		  //if searchPath + node.key <> keyPath then keyPath is a valid prefix for the node, but it's not the node!
		  if searchPath + node.Key <> keyPath then Return result
		  
		  if node.KeyMembers = nil then Return result
		  Return node.KeyMembers.wordsForPrefix(key.Right(key.Length - (index+1)), longestCommonPrefix)
		  
		  
		  
		  
		  //working
		  
		  '#pragma DisableBackgroundTasks
		  '#pragma DisableBoundsChecking
		  '
		  'var result() as String
		  '
		  'var searchPath as String
		  'var node as PaTrieNode
		  'var index as Integer = key.InStr(".")
		  '
		  '//no path
		  'if index = 0 then
		  'node = root.findNode(key, searchPath)
		  'if node = nil then Return result
		  '
		  '//node IS the longestCommonPrefix
		  'longestCommonPrefix = searchPath + node.Key
		  'node.subnodePaths(searchPath, result)
		  'Return result
		  'end if
		  '
		  '//extract path and continue search.
		  'var keyPath as String = key.Left(index - 1)
		  'node = root.findNode(keyPath, searchPath)
		  'if node = nil then Return result
		  '
		  '//if searchPath + node.key <> keyPath then keyPath is a valid prefix for the node, but it's not the node!
		  'if searchPath + node.Key <> keyPath then Return result
		  '
		  'if node.KeyMembers = nil then Return result
		  'Return node.KeyMembers.wordsForPrefix(key.Right(key.Len - index), longestCommonPrefix)
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private Root As patrienode
	#tag EndProperty


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
