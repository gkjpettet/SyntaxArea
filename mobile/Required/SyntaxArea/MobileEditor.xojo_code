#tag Class
Protected Class MobileEditor
Implements SyntaxArea.IEditor
	#tag Method, Flags = &h0
		Function CaretPos() As Integer
		  /// Part of the SyntaxArea.IEditor interface.
		  #Pragma Warning  "Don't forget to implement this method!"
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CaretPos(Assigns value As Integer)
		  /// Part of the SyntaxArea.IEditor interface.
		  #Pragma Warning  "Don't forget to implement this method!"
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function EnableLineFolding() As Boolean
		  /// Part of the SyntaxArea.IEditor interface.
		  #Pragma Warning  "Don't forget to implement this method!"
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub EnableLineFolding(Assigns value As Boolean)
		  /// Part of the SyntaxArea.IEditor interface.
		  #Pragma Warning  "Don't forget to implement this method!"
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IndentVisually() As Boolean
		  /// Part of the SyntaxArea.IEditor interface.
		  #Pragma Warning  "Don't forget to implement this method!"
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub IndentVisually(Assigns value As Boolean)
		  /// Part of the SyntaxArea.IEditor interface.
		  #Pragma Warning  "Don't forget to implement this method!"
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Insert(offset As Integer, s As String)
		  /// Part of the SyntaxArea.IEditor interface.
		  #Pragma Warning  "Don't forget to implement this method!"
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub InvalidateLine(index As Integer)
		  /// Part of the SyntaxArea.IEditor interface.
		  #Pragma Warning  "Don't forget to implement this method!"
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MaxVisibleLines() As Integer
		  /// Part of the SyntaxArea.IEditor interface.
		  #Pragma Warning  "Don't forget to implement this method!"
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PrivateLines() As SyntaxArea.LineManager
		  /// Part of the SyntaxArea.IEditor interface.
		  #Pragma Warning  "Don't forget to implement this method!"
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PrivateRemove(offset As Integer, length As Integer, updateCaret As Boolean = True)
		  /// Part of the SyntaxArea.IEditor interface.
		  #Pragma Warning  "Don't forget to implement this method!"
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PrivateReplace(offset As Integer, length As Integer, s As String, alwaysMarkChanged As Boolean = True, eventID As Integer = -1, keepSelection As Boolean = False, beSilent As Boolean = False, undoable As Boolean = True)
		  /// Part of the SyntaxArea.IEditor interface.
		  #Pragma Warning  "Don't forget to implement this method!"
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RedrawCaret()
		  /// Part of the SyntaxArea.IEditor interface.
		  #Pragma Warning  "Don't forget to implement this method!"
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SelectionStart() As Integer
		  /// Part of the SyntaxArea.IEditor interface.
		  #Pragma Warning  "Don't forget to implement this method!"
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SelectionStart(Assigns value As Integer)
		  /// Part of the SyntaxArea.IEditor interface.
		  #Pragma Warning  "Don't forget to implement this method!"
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function StyleForToken(primary As String, fallbackName As String = "") As SyntaxArea.TokenStyle
		  /// Part of the SyntaxArea.IEditor interface.
		  #Pragma Warning  "Don't forget to implement this method!"
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TextColor() As Color
		  /// Part of the SyntaxArea.IEditor interface.
		  #Pragma Warning  "Don't forget to implement this method!"
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TextColor(Assigns c As Color)
		  /// Part of the SyntaxArea.IEditor interface.
		  #Pragma Warning  "Don't forget to implement this method!"
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TextLength() As Integer
		  /// Part of the SyntaxArea.IEditor interface.
		  #Pragma Warning  "Don't forget to implement this method!"
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function VisibleLineRange() As SyntaxArea.DataRange
		  /// Part of the SyntaxArea.IEditor interface.
		  #Pragma Warning  "Don't forget to implement this method!"
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub VisibleLineRange(Assigns value As SyntaxArea.DataRange)
		  /// Part of the SyntaxArea.IEditor interface.
		  #Pragma Warning  "Don't forget to implement this method!"
		  
		  
		End Sub
	#tag EndMethod


End Class
#tag EndClass
