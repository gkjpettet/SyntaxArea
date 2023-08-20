#tag DesktopWindow
Begin DesktopContainer CustomScrollableEditField
   AllowAutoDeactivate=   True
   AllowFocus      =   True
   AllowFocusRing  =   True
   AllowTabs       =   False
   Backdrop        =   0
   BackgroundColor =   &cFFFFFF00
   Composite       =   False
   Composited      =   False
   DefaultLocation =   2
   Enabled         =   True
   FullScreen      =   False
   HasBackgroundColor=   False
   HasCloseButton  =   True
   HasFullScreenButton=   False
   HasMaximizeButton=   True
   HasMinimizeButton=   True
   Height          =   118
   ImplicitInstance=   True
   Index           =   -2147483648
   InitialParent   =   ""
   Left            =   32
   LockBottom      =   False
   LockLeft        =   False
   LockRight       =   False
   LockTop         =   False
   MacProcID       =   0
   MaximumHeight   =   32000
   MaximumWidth    =   32000
   MenuBar         =   ""
   MenuBarVisible  =   False
   MinimumHeight   =   64
   MinimumWidth    =   64
   Resizeable      =   True
   TabIndex        =   0
   TabPanelIndex   =   0
   TabStop         =   False
   Title           =   "Untitled"
   Tooltip         =   ""
   Top             =   32
   Transparent     =   True
   Type            =   0
   Visible         =   True
   Width           =   208
   Begin CustomEditField contentField
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   True
      AllowTabs       =   False
      AutoCloseBrackets=   False
      AutocompleteAppliesStandardCase=   True
      AutoCompleteDone=   True
      AutoIndentNewLines=   True
      BackColor       =   &cFFFFFF00
      Backdrop        =   0
      Border          =   True
      BorderColor     =   &c88888800
      BracketHighlightColor=   &cFFFF0000
      CaretColor      =   &c00000000
      CaretLine       =   0
      CaretPos        =   0
      ClearHighlightedRangesOnTextChange=   True
      DirtyLinesColor =   &cFF999900
      disableReset    =   False
      DisplayDirtyLines=   True
      DisplayInvisibleCharacters=   False
      DisplayLineNumbers=   True
      DisplayRightMarginMarker=   False
      EnableAutocomplete=   True
      Enabled         =   True
      EnableLineFoldings=   False
      enableLineFoldingSetting=   False
      FontSize        =   0
      GutterBackgroundColor=   &cEEEEEE00
      GutterSeparationLineColor=   &c88888800
      GutterWidth     =   0
      Height          =   102
      HighlightBlocksOnMouseOverGutter=   True
      HighlightMatchingBrackets=   True
      HighlightMatchingBracketsMode=   0
      ignoreRepaint   =   False
      IndentPixels    =   16
      IndentVisually  =   False
      Index           =   -2147483648
      InitialParent   =   ""
      KeepEntireTextIndented=   False
      Left            =   0
      leftMarginOffset=   4
      LineNumbersColor=   &c88888800
      LineNumbersFontSize=   9
      LineNumbersTextFont=   "System"
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      MaxVisibleLines =   0
      ReadOnly        =   False
      RightMarginAtPixel=   0
      RightScrollMargin=   150
      Scope           =   0
      ScrollPosition  =   0
      ScrollPositionX =   0
      selLength       =   0
      selStart        =   0
      SelText         =   ""
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      TabWidth        =   0
      Text            =   ""
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextHeight      =   0.0
      TextLength      =   0
      TextSelectionColor=   &c00000000
      ThickInsertionPoint=   True
      Tooltip         =   ""
      Top             =   0
      Transparent     =   True
      Visible         =   True
      Width           =   192
   End
   Begin DesktopScrollbar vScrollBar
      Active          =   False
      AllowAutoDeactivate=   True
      AllowFocus      =   True
      AllowLiveScrolling=   False
      AllowTabStop    =   True
      Enabled         =   True
      Height          =   102
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   192
      LineStep        =   1
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      MaximumValue    =   100
      MinimumValue    =   0
      PageStep        =   20
      PanelIndex      =   0
      Scope           =   2
      TabIndex        =   5
      TabPanelIndex   =   0
      Tooltip         =   ""
      Top             =   0
      Transparent     =   True
      Value           =   0
      Visible         =   True
      Width           =   16
      _mIndex         =   0
      _mInitialParent =   ""
      _mName          =   ""
      _mPanelIndex    =   0
   End
   Begin DesktopScrollbar hScrollBar
      Active          =   False
      AllowAutoDeactivate=   True
      AllowFocus      =   True
      AllowLiveScrolling=   False
      AllowTabStop    =   True
      Enabled         =   True
      Height          =   16
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   0
      LineStep        =   1
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      MaximumValue    =   100
      MinimumValue    =   0
      PageStep        =   20
      PanelIndex      =   0
      Scope           =   2
      TabIndex        =   6
      TabPanelIndex   =   0
      Tooltip         =   ""
      Top             =   102
      Transparent     =   True
      Value           =   0
      Visible         =   True
      Width           =   192
      _mIndex         =   0
      _mInitialParent =   ""
      _mName          =   ""
      _mPanelIndex    =   0
   End
   Begin Timer SelChangeDeferrer
      Enabled         =   True
      Index           =   -2147483648
      InitialParent   =   ""
      LockedInPosition=   False
      Period          =   0
      RunMode         =   0
      Scope           =   0
      TabPanelIndex   =   0
   End
End
#tag EndDesktopWindow

#tag WindowCode
	#tag Event
		Sub Closing()
		  '
		End Sub
	#tag EndEvent

	#tag Event
		Function ConstructContextualMenu(base As DesktopMenuItem, x As Integer, y As Integer) As Boolean
		  #pragma unused base
		  #pragma unused x
		  #pragma unused y
		  '
		End Function
	#tag EndEvent

	#tag Event
		Function ContextualMenuItemSelected(selectedItem As DesktopMenuItem) As Boolean
		  #pragma unused selectedItem
		  '
		End Function
	#tag EndEvent

	#tag Event
		Function DragEnter(obj As DragItem, action As DragItem.Types) As Boolean
		  #pragma unused obj
		  #pragma unused action
		  '
		End Function
	#tag EndEvent

	#tag Event
		Sub DragExit(obj As DragItem, action As DragItem.Types)
		  #pragma unused obj
		  #pragma unused action
		  
		  '
		End Sub
	#tag EndEvent

	#tag Event
		Function DragOver(x As Integer, y As Integer, obj As DragItem, action As DragItem.Types) As Boolean
		  #pragma unused x
		  #pragma unused y
		  #pragma unused obj
		  #pragma unused action
		  '
		End Function
	#tag EndEvent

	#tag Event
		Sub DropObject(obj As DragItem, action As DragItem.Types)
		  #pragma unused obj
		  #pragma unused action
		  '
		End Sub
	#tag EndEvent

	#tag Event
		Sub FocusLost()
		  break
		End Sub
	#tag EndEvent

	#tag Event
		Sub FocusReceived()
		  break
		End Sub
	#tag EndEvent

	#tag Event
		Function KeyDown(key As String) As Boolean
		  #pragma unused key
		  '
		End Function
	#tag EndEvent

	#tag Event
		Sub KeyUp(key As String)
		  #pragma unused key
		  '
		End Sub
	#tag EndEvent

	#tag Event
		Function MouseDown(x As Integer, y As Integer) As Boolean
		  #pragma unused x
		  #pragma unused y
		  '
		End Function
	#tag EndEvent

	#tag Event
		Sub MouseDrag(x As Integer, y As Integer)
		  #pragma unused x
		  #pragma unused y
		  '
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseEnter()
		  '
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseExit()
		  '
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseMove(x As Integer, y As Integer)
		  #pragma unused x
		  #pragma unused y
		  '
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseUp(x As Integer, y As Integer)
		  #pragma unused x
		  #pragma unused y
		  '
		End Sub
	#tag EndEvent

	#tag Event
		Function MouseWheel(x As Integer, y As Integer, deltaX As Integer, deltaY As Integer) As Boolean
		  #pragma unused x
		  #pragma unused y
		  #pragma unused DeltaX
		  #pragma unused DeltaY
		  '
		End Function
	#tag EndEvent

	#tag Event
		Sub Opening()
		  '
		End Sub
	#tag EndEvent

	#tag Event
		Sub Paint(g As Graphics, areas() As Rect)
		  #pragma unused g
		  #pragma unused areas
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Resized()
		  '
		End Sub
	#tag EndEvent

	#tag Event
		Sub Resizing()
		  '
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub AddBookmark(lineIndex as integer)
		  contentField.AddBookmark(lineIndex)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AppendText(text as string)
		  contentField.AppendText(text)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CanRedo() As boolean
		  Return contentField.CanRedo
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CanUndo() As boolean
		  Return contentField.CanUndo
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CaretSymbol() As documentSymbol
		  Return contentField.CaretSymbol
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CharPosAtLineNum(lineNumber as integer) As integer
		  Return  contentField.CharPosAtLineNum(lineNumber)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CharPosAtXY(X as integer, Y as integer) As integer
		  Return contentField.CharPosAtXY(x,y)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ClearBookmark(lineIndex as integer)
		  contentField.ClearBookmark(lineIndex)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ClearBookmarks()
		  contentField.ClearBookmarks
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ClearDirtyLines()
		  contentField.ClearDirtyLines
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ClearHighlightedCharacterRanges()
		  contentField.ClearHighlightedCharacterRanges
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ClearLineIcons()
		  contentField.ClearLineIcons
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Copy()
		  contentField.Copy
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CustomEditFieldPrinter(printerGraphics as graphics) As CustomEditFieldPrinter
		  Return contentField.CustomEditFieldPrinter(printerGraphics)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DocumentSymbols() As DocumentSymbol()
		  Return contentField.DocumentSymbols
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function drawFocusRing(ringVisible as Boolean = true, windowGraphics As Graphics) As Boolean
		  #Pragma Unused windowGraphics
		  #Pragma Unused ringVisible
		  
		  #if TargetCarbon
		    
		    declare function QDBeginCGContext lib "Carbon" (port as Int32, ByRef contextPtr as Int32) as Integer
		    declare sub CGContextSynchronize lib "Carbon" (context as Int32)
		    declare function QDEndCGContext lib "Carbon" (port as Int32, ByRef context as Int32) as Integer
		    
		    dim context, grafPort as Int32
		    dim res as Integer
		    
		    dim meTop, meLeft as Integer
		    meTop = me.Top
		    meLeft = me.Left
		    dim container as DesktopUIControl = me.Parent
		    while container <> nil
		      meTop = meTop + container.Top
		      meLeft = meLeft + container.Left
		      container = container.Parent
		    wend
		    
		    // We have to open a new drawing context because otherwise we might get our drawings clipped
		    // or we might draw into the wrong window
		    dim w as Window = me.Window
		    while w isA DesktopContainer
		      w = DesktopContainer(w).Window
		    wend
		    grafPort = w.Graphics.Handle(Graphics.HandleTypeCGrafPtr)
		    res = QDBeginCGContext (grafPort, context)
		    if res = 0 then
		      // Now draw the ring
		      declare function DrawThemeFocusRect lib "Carbon" (inRect as Ptr, DrawRing as Boolean) as Integer
		      dim mb as new MemoryBlock(8)
		      mb.Short(0) = meTop
		      mb.Short(2) = meLeft
		      mb.Short(4) = meTop+me.Height
		      mb.Short(6) = meLeft+me.Width
		      call DrawThemeFocusRect (mb, ringVisible)
		      // Close the drawing context again
		      if grafPort <> 0 then
		        CGContextSynchronize context
		        call QDEndCGContext (grafPort, context)
		      end if
		    end
		    if res <> 0 then break
		    return res = 0
		    
		  #elseif TargetCocoa
		    
		    
		  #else
		    
		    // Draw something with RB's own functions
		    // ...
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Find(what as string, ignoreCase as boolean, wrap as boolean, redraw as boolean = true, startPos as integer = - 1) As integer
		  Return contentField.Find(what, ignoreCase, wrap, redraw, startPos)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub FoldAllLines()
		  contentField.FoldAllLines
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub FoldBlockAtCaretPos()
		  contentField.FoldBlockAtCaretPos
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetLine(index as integer) As string
		  Return contentField.GetLine(index)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HasFocus() As Boolean
		  return mHasFocus and CustomEditField.CurrentFocusedField = contentField
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub HighlightCharacterRange(offset as integer, length as integer, withColor as color, rounded as boolean = false)
		  contentField.HighlightCharacterRange(offset, length, withColor, rounded)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Insert(offset as integer, text as string)
		  contentField.Insert(offset, text)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub InvalidateAllLines()
		  contentField.InvalidateAllLines
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub InvalidateLine(index as integer)
		  contentField.InvalidateLine(index)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsDirty() As boolean
		  Return contentField.IsDirty
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LineCount() As integer
		  Return contentField.LineCount
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LineIcon(index as integer) As picture
		  Return contentField.LineIcon(index)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LineIcon(index as integer, assigns value as picture)
		  contentField.LineIcon(index) = value
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LineNumAtCharPos(offset as integer) As integer
		  Return contentField.LineNumAtCharPos(offset)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Paste()
		  contentField.Paste
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Redo()
		  contentField.Redo
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Redraw()
		  contentField.Redraw
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ReHighlight()
		  contentField.ReHighlight
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ReindentText()
		  contentField.ReindentText
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ReindentText(fromLine as Integer, toLine as integer)
		  contentField.ReindentText(fromLine, toLine)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ResetUndo()
		  contentField.ResetUndo
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ResetUndoDirtyFlag()
		  contentField.ResetUndoDirtyFlag
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Save(toFile as folderItem, fileType as string = "Text", encoding as textencoding = nil) As boolean
		  return contentField.Save(toFile, FileType, Encoding)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Save(toFile as folderItem, encoding as textencoding) As boolean
		  Return contentField.save(toFile, "Text", encoding)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SelectAll()
		  contentField.SelectAll
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SelectLine(lineNumber as integer, refresh as boolean = true)
		  contentField.SelectLine(lineNumber, refresh)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub SetDefaults()
		  contentField.BackColor = &cffffff
		  contentField.Border = true
		  contentField.BorderColor = &c888888
		  contentField.CaretColor = &c000000
		  contentField.DirtyLinesColor = &cFF9999
		  contentField.DisplayDirtyLines = true
		  contentField.DisplayLineNumbers = true
		  contentField.DisplayRightMarginMarker = false
		  contentField.GutterBackgroundColor = &cEEEEEE
		  contentField.GutterSeparationLineColor = &C888888
		  contentField.LeftMarginOffset = 4
		  contentField.LineNumbersColor = &c888888
		  contentField.RightMarginAtPixel = 0
		  contentField.TextColor = &c000000
		  contentField.TextFont = ""
		  contentField.FontSize = 0
		  contentField.TextSelectionColor = &c000000
		  contentField.ThickInsertionPoint = true
		  contentField.AutoCloseBrackets = False
		  contentField.AutocompleteAppliesStandardCase = true
		  contentField.AutoIndentNewLines = true
		  contentField.ClearHighlightedRangesOnTextChange = true
		  contentField.DisplayInvisibleCharacters = False
		  contentField.EnableAutocomplete = true
		  contentField.EnableLineFoldings = False
		  contentField.HighlightMatchingBrackets = true
		  contentField.HighlightMatchingBracketsMode = 0
		  contentField.BracketHighlightColor = &cFFFF00
		  contentField.LineNumbersTextFont = "System"
		  contentField.LineNumbersFontSize = 9
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetFocus()
		  contentField.SetFocus
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SymbolAtLine(index as integer) As documentSymbol
		  Return contentField.SymbolAtLine(index)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SymbolCount() As integer
		  Return contentField.SymbolCount
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TheEditField() As CustomEditField
		  return contentField
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ToggleLineFold(lineIndex as integer)
		  contentField.ToggleLineFold(lineIndex)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TopInWindow() As Integer
		  // Helper function in place of "Top". Useful when this is embedded inside a DesktopContainer
		  
		  dim n as Integer = self.Top
		  dim w as DesktopWindow
		  w = me.Window
		  while w isA DesktopContainer
		    n = n + w.Top
		    w = DesktopContainer(w).Window
		  wend
		  return n
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Undo()
		  contentField.Undo
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UnfoldAllLines()
		  contentField.UnfoldAllLines
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateFocusRing(windowGraphics As Graphics)
		  if me.AllowFocusRing and mHasFocus then
		    mHadFocusRing = me.drawFocusRing(windowGraphics)
		  elseif mHadFocusRing then
		    // We need to make sure the focus ring gets erased.
		    'Window.RefreshRect me.Left-8, me.Top-8, me.Width+16, me.Height+16
		    mHadFocusRing = false
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function VerticalOffset(line_0 as Integer, findTop as Boolean) As Integer
		  dim x, y, charPos as Double
		  if line_0 >= 0 then
		    charPos = contentField.CharPosAtLineNum (line_0)
		    if charPos < 0 then
		      // we are looking for the point past the last line
		      charPos = contentField.CharPosAtLineNum (contentField.LineCount-1)
		      if charPos < 0 then return 0
		      contentField.XYAtCharPos (charPos, x, y)
		      return y
		    else
		      contentField.XYAtCharPos (charPos, x, y)
		      if findTop then
		        return y - contentField.TextHeight
		      else
		        return y - 1
		      end
		    end
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub XYAtCharPos(charPos as integer, byref X as Double, byref Y as Double)
		  contentField.XYAtCharPos(CharPos, x, y)
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event AutocompleteOptionsForPrefix(prefix as string) As AutocompleteOptions
	#tag EndHook

	#tag Hook, Flags = &h0
		Event BlockCharsMatched(blockOpenChar as string, blockOpenOffset as Integer, blockCloseChar as string, blockCloseOffset as Integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Close()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ConstructContextualMenu(base as DesktopMenuItem, x as integer, y as integer) As boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ContextualMenuAction(hititem as DesktopMenuItem)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event DragExit(obj as DragItem, action as Integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event EnableMenuItems()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event GotFocus()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event GutterClicked(onLine as integer, x as integer, y as integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event HighlightingComplete()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event HorizontalScrollValueChanged()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event KeyDown(key as String) As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event KeyUp(key as String)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event LineCountChanged(newLineCount as integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event LostFocus()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event MaxLineLengthChanged(maxLineLengthInPixels as single)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event MouseDown(X as integer, Y as integer) As boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event MouseEnter()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event MouseExit()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event MouseMove(X as integer, Y as integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event MouseUp(x as integer, y as integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Open()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event PaintAboveLine(lineIndex as integer, g as graphics, x as integer, y as integer, w as integer, h as integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event PaintBelowLine(lineIndex as integer, g as graphics, x as integer, y as integer, w as integer, h as integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event PaintOver(g as Graphics, gutterWidth as Integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event PlaceholderSelected(lineIndex as integer, placeholderLabel as String)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ScrollValuesChanged()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event SelChanged()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ShouldDisplaySuggestionWindowAtPos(ByRef x as Integer, ByRef y as Integer) As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ShouldTriggerAutocomplete(Key as string, hasAutocompleteOptions as boolean) As boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event TextChanged()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event TextInserted(offset as integer, text as String)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event TextRemoved(offset as integer, text as String)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event UseBackgroundColorForLine(lineIndex as integer, byref lineBackgroundColor as color) As boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event UseBookmarkIconForLine(lineIndex as integer) As Picture
	#tag EndHook

	#tag Hook, Flags = &h0
		Event VerticalScrollValueChanged()
	#tag EndHook


	#tag Note, Name = About
		This is a drop-in class for a scrollable CustomEditField.
		
		It includes the Scrollbars so that you do not have to add them yourself,
		making it easier to replace an existing edit control (EditField, TextArea)
		with a CustomEditField.
		
		It may be that some methods that CustomEditField are missing here. This
		might happen if CustomEditField gets new functions and we forget to add
		them here, too. Simply add them yourself, and possibly notify Alex of this
		so he can fix this for everyone.
		
		If you want to access the edit field of this container from the outside, use
		the "TheEditField" function.
		
		Note: Due to limitations in RB or the IDE, you will need to set all the default
		property values in code. See the "SetDefaults" method for that.
		
		Authors: Thomas Tempelmann and Alex Restrepo
	#tag EndNote

	#tag Note, Name = Showing a Focus Ring
		As of v.1.8, to show a Focus Ring around the CustomScrollableEditField, you must set the 
		UseFocusRing property to True, and you must call UpdateFocusRing from the 
		parent Window's Paint event with the parent Window's Graphics property.
		
		Also, this only works in Mac Carbon builds, not in Cocoa, yet.
		
		The Window's Paint event should look something like this:
		
		Sub Paint (g As Graphics, areas() As REALbasic.Rect)
		  //
		  // Whatever other painting the Window should do.
		  //
		  MyCustomScrollableEditField1.UpdateFocusRing(g)
		  MyCustomScrollableEditField2.UpdateFocusRing(g)
		  // ... and so on
		End Sub
	#tag EndNote


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return contentField.AutoCloseBrackets
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  contentField.AutoCloseBrackets = value
			End Set
		#tag EndSetter
		AutoCloseBrackets As boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return contentField.AutocompleteAppliesStandardCase
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  contentField.AutocompleteAppliesStandardCase = value
			End Set
		#tag EndSetter
		AutocompleteAppliesStandardCase As boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return contentField.AutoIndentNewLines
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  contentField.AutoIndentNewLines = value
			End Set
		#tag EndSetter
		AutoIndentNewLines As boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return contentField.Border
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  contentField.Border = value
			End Set
		#tag EndSetter
		Border As boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return contentField.BorderColor
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  contentField.BorderColor = value
			End Set
		#tag EndSetter
		BorderColor As color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return contentField.CaretColor
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  contentField.CaretColor = value
			End Set
		#tag EndSetter
		CaretColor As color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return contentField.CaretPos
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  contentField.CaretPos = value
			End Set
		#tag EndSetter
		CaretPos As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return contentField.ClearHighlightedRangesOnTextChange
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  contentField.ClearHighlightedRangesOnTextChange = value
			End Set
		#tag EndSetter
		ClearHighlightedRangesOnTextChange As boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return contentField.DirtyLinesColor
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  contentField.DirtyLinesColor = value
			End Set
		#tag EndSetter
		DirtyLinesColor As color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return contentField.DisplayDirtyLines
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  contentField.DisplayDirtyLines = value
			End Set
		#tag EndSetter
		DisplayDirtyLines As boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return contentField.DisplayInvisibleCharacters
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  contentField.DisplayInvisibleCharacters = value
			End Set
		#tag EndSetter
		DisplayInvisibleCharacters As boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return contentField.DisplayLineNumbers
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  contentField.DisplayLineNumbers = value
			End Set
		#tag EndSetter
		DisplayLineNumbers As boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return contentField.DisplayRightMarginMarker
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  contentField.DisplayRightMarginMarker = value
			End Set
		#tag EndSetter
		DisplayRightMarginMarker As boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return contentField.EnableAutocomplete
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  contentField.EnableAutocomplete = value
			End Set
		#tag EndSetter
		EnableAutocomplete As boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return contentField.EnableLineFoldings
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  contentField.EnableLineFoldings = value
			End Set
		#tag EndSetter
		EnableLineFoldings As boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return contentField.FontSize
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  contentField.FontSize = value
			End Set
		#tag EndSetter
		FontSize As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return contentField.GutterBackgroundColor
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  contentField.GutterBackgroundColor = value
			End Set
		#tag EndSetter
		GutterBackgroundColor As color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return contentField.GutterSeparationLineColor
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  contentField.GutterSeparationLineColor = value
			End Set
		#tag EndSetter
		GutterSeparationLineColor As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return contentField.GutterWidth
			End Get
		#tag EndGetter
		GutterWidth As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return contentField.HighlightMatchingBrackets
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  contentField.HighlightMatchingBrackets = value
			End Set
		#tag EndSetter
		HighlightMatchingBrackets As boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return contentField.HighlightMatchingBracketsMode
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  contentField.HighlightMatchingBracketsMode = value
			End Set
		#tag EndSetter
		HighlightMatchingBracketsMode As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return contentField.LeftMarginOffset
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  contentField.LeftMarginOffset = value
			End Set
		#tag EndSetter
		LeftMarginOffset As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return contentField.LineNumbersColor
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  contentField.LineNumbersColor = value
			End Set
		#tag EndSetter
		LineNumbersColor As color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return contentField.LineNumbersFontSize
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  contentField.LineNumbersFontSize = value
			End Set
		#tag EndSetter
		LineNumbersFontSize As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return contentField.LineNumbersTextFont
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  contentField.LineNumbersTextFont = value
			End Set
		#tag EndSetter
		LineNumbersTextFont As string
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return contentField.MaxVisibleLines
			End Get
		#tag EndGetter
		MaxVisibleLines As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mHadFocusRing As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mHasFocus As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mSettingSelection As Boolean
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return contentField.RightScrollMargin
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  contentField.RightScrollMargin = value
			End Set
		#tag EndSetter
		RighScrollMargin As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return contentField.RightMarginAtPixel
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  contentField.RightMarginAtPixel = value
			End Set
		#tag EndSetter
		RightMarginAtPixel As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return contentField.ScrollPosition
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  contentField.ScrollPosition = value
			End Set
		#tag EndSetter
		ScrollPosition As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return contentField.ScrollPositionX
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  contentField.ScrollPositionX = value
			End Set
		#tag EndSetter
		ScrollPositionX As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return contentField.SelLength
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mSettingSelection = true // necessary to avoid
			  contentField.SelLength = value
			  mSettingSelection = false
			End Set
		#tag EndSetter
		SelLength As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return contentField.SelStart
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mSettingSelection = true
			  contentField.SelStart = value
			  mSettingSelection = false
			End Set
		#tag EndSetter
		SelStart As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return contentField.SelText
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  contentField.SelText = value
			End Set
		#tag EndSetter
		SelText As string
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return contentField.SyntaxDefinition
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  contentField.SyntaxDefinition = value
			End Set
		#tag EndSetter
		SyntaxDefinition As HighlightDefinition
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return contentField.TabWidth
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  contentField.TabWidth = value
			End Set
		#tag EndSetter
		TabWidth As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return contentField.Text
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  contentField.Text = value
			End Set
		#tag EndSetter
		Text As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return contentField.TextColor
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  contentField.TextColor = value
			End Set
		#tag EndSetter
		TextColor As color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return contentField.TextFont
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  contentField.TextFont = value
			End Set
		#tag EndSetter
		TextFont As string
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return contentField.TextHeight
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  contentField.TextHeight = value
			End Set
		#tag EndSetter
		TextHeight As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return contentField.TextLength
			End Get
		#tag EndGetter
		TextLength As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return contentField.TextSelectionColor
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  contentField.TextSelectionColor = value
			End Set
		#tag EndSetter
		TextSelectionColor As color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return contentField.ThickInsertionPoint
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  contentField.ThickInsertionPoint = value
			End Set
		#tag EndSetter
		ThickInsertionPoint As boolean
	#tag EndComputedProperty


#tag EndWindowCode

#tag Events contentField
	#tag Event
		Sub TextChanged()
		  TextChanged()
		End Sub
	#tag EndEvent
	#tag Event
		Sub SelChanged(line as integer, column as integer, length as integer)
		  #pragma unused line
		  #pragma unused column
		  #pragma unused length
		  
		  if mSettingSelection then
		    // not sure if this needs to be called at all when we're setting the selection explicitly, but at least
		    // we must not defer it then because it'll cause trouble in SourceCodeView.handleSourceChange
		    // because that method couldn't prevent repeated (usually recursive) calls to itself then.
		    RaiseEvent SelChanged()
		  else
		    // We postpone the SelChange event so that, if there's also a TextChange,
		    // we pass on the SelChange after the TextChange
		    SelChangeDeferrer.RunMode = Timer.RunModes.Single
		  end if
		End Sub
	#tag EndEvent
	#tag Event
		Function UseBackgroundColorForLine(lineIndex as integer, byref lineBackgroundColor as color) As boolean
		  Return UseBackgroundColorForLine(lineIndex, lineBackgroundColor)
		End Function
	#tag EndEvent
	#tag Event
		Function KeyDown(key as string) As boolean
		  return KeyDown (key)
		End Function
	#tag EndEvent
	#tag Event
		Function AutocompleteOptionsForPrefix(prefix as string) As AutocompleteOptions
		  Return AutocompleteOptionsForPrefix(prefix)
		End Function
	#tag EndEvent
	#tag Event
		Function ConstructContextualMenu(base as Desktopmenuitem, x as integer, y as integer) As boolean
		  Return ConstructContextualMenu(base, x, y)
		End Function
	#tag EndEvent
	#tag Event
		Sub HighlightingComplete()
		  HighlightingComplete
		End Sub
	#tag EndEvent
	#tag Event
		Sub LineCountChanged(newLineCount as integer)
		  LineCountChanged(newLineCount)
		End Sub
	#tag EndEvent
	#tag Event
		Sub MaxLineLengthChanged(maxLineLengthInPixels as single)
		  MaxLineLengthChanged(maxLineLengthInPixels)
		End Sub
	#tag EndEvent
	#tag Event
		Function MouseDown(X as integer, Y as integer) As boolean
		  Return MouseDown(x,y)
		End Function
	#tag EndEvent
	#tag Event
		Sub MouseMove(X as integer, Y as integer)
		  MouseMove(x,y)
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseUp(x as integer, y as integer)
		  MouseUp(x,y)
		End Sub
	#tag EndEvent
	#tag Event
		Sub ScrollValuesChanged()
		  ScrollValuesChanged
		End Sub
	#tag EndEvent
	#tag Event
		Function ShouldTriggerAutocomplete(Key as string, hasAutocompleteOptions as boolean) As boolean
		  Return ShouldTriggerAutocomplete(key, hasAutocompleteOptions)
		End Function
	#tag EndEvent
	#tag Event
		Sub TextInserted(offset as integer, text as String)
		  TextInserted(offset, text)
		End Sub
	#tag EndEvent
	#tag Event
		Sub TextRemoved(offset as integer, text as String)
		  TextRemoved(offset, text)
		End Sub
	#tag EndEvent
	#tag Event
		Function ContextualMenuItemSelected(selectedItem As DesktopMenuItem) As Boolean
		  ContextualMenuAction(selectedItem)
		  
		  
		End Function
	#tag EndEvent
	#tag Event
		Sub PaintAboveLine(lineIndex as integer, g as graphics, x as integer, y as integer, w as integer, h as integer)
		  PaintAboveLine(lineIndex, g, x, y, w, h)
		End Sub
	#tag EndEvent
	#tag Event
		Sub PaintBelowLine(lineIndex as integer, g as graphics, x as integer, y as integer, w as integer, h as integer)
		  PaintBelowLine(lineIndex, g, x, y, w, h)
		End Sub
	#tag EndEvent
	#tag Event
		Sub PaintOver(g as Graphics, gutterWidth as Integer)
		  PaintOver(g, gutterWidth)
		End Sub
	#tag EndEvent
	#tag Event
		Sub VerticalScrollValueChanged()
		  VerticalScrollValueChanged
		End Sub
	#tag EndEvent
	#tag Event
		Sub HorizontalScrollValueChanged()
		  HorizontalScrollValueChanged
		End Sub
	#tag EndEvent
	#tag Event
		Function UseBookmarkIconForLine(lineIndex as integer) As Picture
		  Return UseBookmarkIconForLine(lineIndex)
		End Function
	#tag EndEvent
	#tag Event
		Sub GutterClicked(onLine as integer, x as integer, y as integer)
		  GutterClicked(onLine, x, y)
		End Sub
	#tag EndEvent
	#tag Event
		Sub BlockCharsMatched(blockOpenChar as string, blockOpenOffset as Integer, blockCloseChar as string, blockCloseOffset as Integer)
		  BlockCharsMatched(blockOpenChar, blockOpenOffset, blockCloseChar, blockCloseOffset)
		End Sub
	#tag EndEvent
	#tag Event
		Sub PlaceholderSelected(placeholderLabel as String, lineIndex as integer, line as textLine, placeholder as textPlaceholder, doubleClick as Boolean)
		  #pragma unused line
		  #pragma unused placeholder
		  #pragma unused doubleClick
		  
		  PlaceholderSelected(lineIndex, placeholderLabel)
		End Sub
	#tag EndEvent
	#tag Event
		Sub DragExit(obj As DragItem, action As DragItem.Types)
		  //COMMENTED OUT
		  
		  //DragExit obj, action
		  
		  #Pragma Unused obj
		  #Pragma Unused action
		End Sub
	#tag EndEvent
	#tag Event
		Sub KeyUp(key As String)
		  KeyUp (key)
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  MouseEnter
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  MouseExit
		End Sub
	#tag EndEvent
	#tag Event
		Function ShouldDisplaySuggestionWindowAtPos(byref X as Integer, byref Y as Integer) As Boolean
		  return ShouldDisplaySuggestionWindowAtPos (x, y)
		End Function
	#tag EndEvent
	#tag Event
		Sub Close()
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub GotFocus()
		  self.mHasFocus = true
		  GotFocus()
		  
		  //COMMENTED OUT
		  '#if RBVersion < 2014.01 // I don't really know when Invalidate was introduced
		  'self.TrueWindow.Refresh
		  '#else
		  'self.TrueWindow.Invalidate
		  self.Refresh()
		  '#endif
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub LostFocus()
		  self.mHasFocus = false
		  
		  //COMMENTED OUT
		  '#if RBVersion < 2014.01 // I don't really know when Invalidate was introduced
		  'self.TrueWindow.Refresh
		  '#else
		  'self.TrueWindow.Invalidate
		  self.Refresh()
		  '#endif
		  LostFocus()
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  contentField.SetScrollbars hScrollBar, vScrollBar
		  self.SetDefaults
		  Open()
		End Sub
	#tag EndEvent
	#tag Event
		Sub EnableMenuItems()
		  EnableMenuItems()
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events vScrollBar
	#tag Event
		Sub ValueChanged()
		  contentField.ScrollPosition = me.Value
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events hScrollBar
	#tag Event
		Sub ValueChanged()
		  contentField.ScrollPositionX = me.Value
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events SelChangeDeferrer
	#tag Event
		Sub Action()
		  RaiseEvent SelChanged
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="Composited"
		Visible=true
		Group="Windows Behavior"
		InitialValue="False"
		Type="Boolean"
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
		Name="AllowAutoDeactivate"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Tooltip"
		Visible=true
		Group="Appearance"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="AllowFocusRing"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="BackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="&hFFFFFF"
		Type="ColorGroup"
		EditorType="ColorGroup"
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasBackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="AllowFocus"
		Visible=true
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="AllowTabs"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
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
		Name="Width"
		Visible=true
		Group="Size"
		InitialValue="300"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Size"
		InitialValue="300"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="InitialParent"
		Visible=false
		Group="Position"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Left"
		Visible=true
		Group="Position"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Top"
		Visible=true
		Group="Position"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockLeft"
		Visible=true
		Group="Position"
		InitialValue=""
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockTop"
		Visible=true
		Group="Position"
		InitialValue=""
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockRight"
		Visible=true
		Group="Position"
		InitialValue=""
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockBottom"
		Visible=true
		Group="Position"
		InitialValue=""
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabPanelIndex"
		Visible=false
		Group="Position"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabIndex"
		Visible=true
		Group="Position"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabStop"
		Visible=true
		Group="Position"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Enabled"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Background"
		InitialValue=""
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Transparent"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="AutoCloseBrackets"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="AutocompleteAppliesStandardCase"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="AutoIndentNewLines"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Border"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="BorderColor"
		Visible=false
		Group="Behavior"
		InitialValue="&c000000"
		Type="color"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="CaretColor"
		Visible=false
		Group="Behavior"
		InitialValue="&c000000"
		Type="color"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="CaretPos"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="ClearHighlightedRangesOnTextChange"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="DirtyLinesColor"
		Visible=false
		Group="Behavior"
		InitialValue="&c000000"
		Type="color"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="DisplayDirtyLines"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="DisplayInvisibleCharacters"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="DisplayLineNumbers"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="DisplayRightMarginMarker"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="EnableAutocomplete"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="EnableLineFoldings"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="GutterBackgroundColor"
		Visible=false
		Group="Behavior"
		InitialValue="&c000000"
		Type="color"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="GutterSeparationLineColor"
		Visible=false
		Group="Behavior"
		InitialValue="&c000000"
		Type="Color"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="GutterWidth"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HighlightMatchingBrackets"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HighlightMatchingBracketsMode"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LeftMarginOffset"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LineNumbersColor"
		Visible=false
		Group="Behavior"
		InitialValue="&c000000"
		Type="color"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LineNumbersTextFont"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="string"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="LineNumbersFontSize"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaxVisibleLines"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="RighScrollMargin"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="RightMarginAtPixel"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="ScrollPosition"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="ScrollPositionX"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="SelLength"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="SelStart"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="SelText"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="string"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabWidth"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Text"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="TextColor"
		Visible=false
		Group="Behavior"
		InitialValue="&c000000"
		Type="color"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="TextFont"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="string"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="TextHeight"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="TextLength"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="TextSelectionColor"
		Visible=false
		Group="Behavior"
		InitialValue="&c000000"
		Type="color"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="FontSize"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="ThickInsertionPoint"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="boolean"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
