#tag Class
Protected Class PaTrieNode
	#tag Method, Flags = &h0
		Function addKey(key as string, data as variant = nil) As PaTrieNode
		  #pragma DisableBackgroundTasks
		  
		  if key = "" then
		    //overwrite data
		    self.Data = data
		    
		    //if this node was marked as non-terminal, mark it as terminal
		    self.intermediateNode = False
		    
		    //but it's me!
		    Return self
		  end if
		  
		  //if no children, just add a new one with the key
		  if SubNodes.LastIndex < 0 then
		    Return AppendNewNode(key, data)
		  end if
		  
		  //there's at least one subnode
		  //find the best match for the key
		  dim bestIndex as Integer = -1
		  dim bestLength, currentLength as Integer
		  for i as Integer = 0 to SubNodes.LastIndex
		    currentLength = SubNodes(i).Key.longestCommonPrefixIndex(key)
		    if currentLength > bestLength then
		      bestLength = currentLength
		      bestIndex = i
		    end if
		  next
		  
		  //if no suitable children found, just add the node
		  if bestIndex < 0 then
		    Return AppendNewNode(key, data)
		    
		  end if
		  
		  dim matchNode as PaTrieNode = SubNodes(bestIndex)
		  
		  if bestLength = matchNode.Key.Length then
		    //current node is a perfect prefix for the key
		    //remove prefix and recurse
		    key = key.Middle(bestLength , key.Length - bestLength)
		    Return matchNode.AddKey(key, data)
		  end if
		  
		  //key and node share a common prefix
		  //split current node and add both prefixes
		  return matchNode.SplitNode(key, data, bestLength)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function appendNewNode(withKey as string, andData as variant) As PaTrieNode
		  dim newNode as new PaTrieNode
		  newNode.Key = withKey
		  newNode.Data = andData
		  SubNodes.Add newNode
		  keys.Add withKey.Left(1)
		  sortedNodes = False
		  Return newNode
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function findNode(key as string, byref path as string) As PaTrieNode
		  #pragma DisableBackgroundTasks
		  #pragma DisableBoundsChecking
		  
		  if key = "" then Return self
		  if SubNodes.LastIndex < 0 then Return Nil
		  
		  dim prefixLength as Integer
		  dim bestMatch as Integer = -1
		  dim bestLength as Integer
		  
		  //find the best match
		  for i as Integer = 0 to SubNodes.LastIndex
		    prefixLength = SubNodes(i).Key.longestCommonPrefixIndex(key)
		    if prefixLength > bestLength then
		      bestLength = prefixLength
		      bestMatch = i
		    end if
		  next
		  
		  //no match found
		  if bestMatch < 0 then Return nil
		  
		  //check if key is contained in SubNode's key, if not, it can't be a match!
		  dim compareLength as Integer = min(key.Length, SubNodes(bestMatch).key.Length)
		  if key.left(compareLength) <> SubNodes(bestMatch).Key.left(compareLength) then Return nil
		  
		  //continue search among subnodes
		  key = key.Middle(bestLength , key.Length - bestLength)
		  path = path + self.Key
		  Return SubNodes(bestMatch).findNode(key, path)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function splitNode(key as string, data as variant, prefixLength as integer) As PaTrieNode
		  dim common as String = self.Key.Middle(0, prefixLength)
		  
		  '//copy trailing key from current node to a new one
		  dim SubNodesCopy() as PaTrieNode
		  dim keysCopy() as String
		  ReDim SubNodesCopy(self.SubNodes.LastIndex)
		  ReDim keysCopy(self.SubNodes.LastIndex)
		  for i as Integer = 0 to self.SubNodes.LastIndex
		    SubNodesCopy(i) = self.SubNodes(i)
		    keysCopy(i) = keys(i)
		  next
		  ReDim SubNodes(-1)
		  ReDim keys(-1)
		  
		  dim node1 as PaTrieNode = AppendNewNode(self.Key.Middle(prefixLength, self.Key.Length - prefixLength), self.Data)
		  node1.SubNodes = SubNodesCopy
		  node1.keys = keysCopy
		  node1.intermediateNode = self.intermediateNode
		  node1.KeyMembers = self.KeyMembers
		  self.KeyMembers = nil
		  
		  //trailing key from new key to new node
		  dim node2 as PaTrieNode = AppendNewNode(key.Middle(prefixLength , key.Length - prefixLength), data)
		  
		  self.Key = common
		  self.Data = nil
		  self.intermediateNode = true
		  
		  Return node2
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub subnodePaths(path as string, where() as string)
		  #pragma DisableBackgroundTasks
		  #pragma DisableBoundsChecking
		  
		  if not sortedNodes then
		    keys.SortWith(SubNodes)
		    sortedNodes = true
		  end if
		  
		  if not intermediateNode then
		    if path + key <> "" then _
		    where.Add path+key
		  end if
		  
		  for i as Integer = 0 to SubNodes.LastIndex
		    SubNodes(i).subnodePaths(path+key, where)
		  Next
		End Sub
	#tag EndMethod


	#tag Note, Name = Code adapted from
		Code adapted from:
		http://www.codeproject.com/KB/cs/iptocountry.aspx
		
		I made some modifications (such as keypaths) and simplified the code.
	#tag EndNote


	#tag Property, Flags = &h0
		Data As Variant
	#tag EndProperty

	#tag Property, Flags = &h21
		Private intermediateNode As boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		Key As String
	#tag EndProperty

	#tag Property, Flags = &h0
		KeyMembers As Patrie
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Keys() As string
	#tag EndProperty

	#tag Property, Flags = &h21
		Private sortedNodes As boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		SubNodes() As PaTrieNode
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
			Name="Key"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
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
