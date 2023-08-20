#tag Class
Protected Class ArrayStorage
Implements IBufferStorage
	#tag Method, Flags = &h0
		Sub Constructor(size as integer)
		  redim Storage(size - 1)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Copy(from as IbufferStorage, fromIndex as integer, localIndex as integer, length as integer)
		  #if not DebugBuild
		    #pragma DisableBackgroundTasks
		    #pragma DisableBoundsChecking
		    
		  #endif
		  
		  if length = 0 then Return
		  var src as ArrayStorage = ArrayStorage(from)
		  
		  var maxLocal, maxSrc as Integer
		  maxLocal = Storage.LastIndex
		  maxSrc = src.Storage.LastIndex
		  
		  for i as Integer = 0 to length - 1
		    if localIndex + i > maxLocal or fromIndex + i > maxSrc then exit for
		    Storage(localIndex + i) = src.Storage(fromIndex + i)
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Size() As integer
		  Return Storage.LastIndex + 1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Size(assigns length as integer)
		  // Part of the IBufferStorage interface.
		  redim Storage(length - 1)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function StringValue(index as integer, length as integer) As string
		  #if not DebugBuild
		    #pragma DisableBackgroundTasks
		    #pragma DisableBoundsChecking
		    
		  #endif
		  
		  if length = 0 then Return ""
		  if index >= Size then Return ""
		  
		  //create a copy of the right size
		  var tmp() as String
		  redim tmp(length - 1)
		  
		  for i as Integer = 0 to length - 1
		    tmp(i) = Storage(i + index)
		  next
		  
		  var ret as String = String.FromArray(tmp, "")
		  
		  if ret.Encoding = nil then
		    break ' must never happen
		  end if
		  
		  return ret.ConvertEncoding(EditFieldGlobals.InternalEncoding)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub StringValue(index as integer, length as integer, assigns value as string)
		  #if not DebugBuild
		    #pragma DisableBackgroundTasks
		    #pragma DisableBoundsChecking
		    
		  #endif
		  
		  if length = 0 then Return
		  if value.Length = 0 then Return
		  
		  var encoding as TextEncoding = value.Encoding
		  if encoding = nil then
		    // we should never get here - it would probably lead to incorreclty encoded text when it's not pure ASCII
		    break
		    encoding = Encodings.SystemDefault
		    value = value.DefineEncoding(encoding)
		  end
		  if encoding.Equals(encodings.UTF16) then
		    // UTF-16 causes problems with certain chars (e.g. "🔍"), so we must
		    // convert it into UTF-8 or UTF-32.
		    value = value.ConvertEncoding(EditFieldGlobals.InternalEncoding)
		  end if
		  
		  //split data into a tmp array
		  var chars() as String = value.Split("")
		  
		  //and copy it
		  for i as Integer = 0 to length - 1
		    Storage(i + index) = chars(i)
		  next
		End Sub
	#tag EndMethod


	#tag Note, Name = Info
		Text storage as an array of strings.
	#tag EndNote


	#tag Property, Flags = &h21
		Private Storage() As string
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
