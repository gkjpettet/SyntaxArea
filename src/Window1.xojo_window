#tag DesktopWindow
Begin DesktopWindow Window1
   Backdrop        =   0
   BackgroundColor =   &cFFFFFF
   Composite       =   False
   DefaultLocation =   2
   FullScreen      =   False
   HasBackgroundColor=   False
   HasCloseButton  =   True
   HasFullScreenButton=   False
   HasMaximizeButton=   True
   HasMinimizeButton=   True
   Height          =   644
   ImplicitInstance=   True
   MacProcID       =   0
   MaximumHeight   =   32000
   MaximumWidth    =   32000
   MenuBar         =   186054655
   MenuBarVisible  =   False
   MinimumHeight   =   64
   MinimumWidth    =   64
   Resizeable      =   True
   Title           =   "SyntaxArea Demo"
   Type            =   0
   Visible         =   True
   Width           =   1094
   Begin DesktopPagePanel Panel
      AllowAutoDeactivate=   True
      Enabled         =   True
      Height          =   644
      Index           =   -2147483648
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      PanelCount      =   1
      Panels          =   ""
      Scope           =   0
      SelectedPanelIndex=   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   False
      Tooltip         =   ""
      Top             =   0
      Transparent     =   False
      Value           =   0
      Visible         =   True
      Width           =   755
      Begin DesktopScrollbar HorizontalScrollBar
         Active          =   False
         AllowAutoDeactivate=   True
         AllowFocus      =   True
         AllowLiveScrolling=   True
         AllowTabStop    =   True
         Enabled         =   True
         Height          =   16
         Index           =   -2147483648
         InitialParent   =   "Panel"
         Left            =   0
         LineStep        =   1
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   False
         MaximumValue    =   0
         MinimumValue    =   0
         PageStep        =   20
         PanelIndex      =   0
         Scope           =   0
         TabIndex        =   1
         TabPanelIndex   =   1
         Tooltip         =   ""
         Top             =   628
         Transparent     =   True
         Value           =   0
         Visible         =   True
         Width           =   739
         _mIndex         =   0
         _mInitialParent =   ""
         _mName          =   ""
         _mPanelIndex    =   0
      End
      Begin DesktopScrollbar VerticalScrollBar
         Active          =   False
         AllowAutoDeactivate=   True
         AllowFocus      =   True
         AllowLiveScrolling=   True
         AllowTabStop    =   True
         Enabled         =   True
         Height          =   628
         Index           =   -2147483648
         InitialParent   =   "Panel"
         Left            =   739
         LineStep        =   1
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         MaximumValue    =   0
         MinimumValue    =   0
         PageStep        =   20
         PanelIndex      =   0
         Scope           =   0
         TabIndex        =   2
         TabPanelIndex   =   1
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
      Begin SyntaxArea.Editor CodeEditor
         AllowFocusRing  =   False
         AutoCloseBrackets=   False
         AutocompleteAppliesStandardCase=   True
         AutocompleteCombo=   1
         AutoCompleteDone=   True
         AutoDeactivate  =   True
         AutoIndentNewLines=   True
         BackColor       =   &cFFFFFF00
         BlockFoldedColor=   &cFF930000
         BlockFoldedEllipsisColor=   &cC0C0C000
         BlockFoldMarkerColor=   &c92929200
         Border          =   True
         BorderColor     =   &c00000000
         BracketHighlightColor=   &c76D6FF00
         CaretColor      =   &c00000000
         CaretLine       =   0
         CaretPos        =   0
         ClearHighlightedRangesOnTextChange=   True
         DirtyLinesColor =   &cFFD47900
         DisableReset    =   False
         DisplayDirtyLines=   True
         DisplayInvisibleCharacters=   False
         DisplayLineNumbers=   True
         DisplayRightMarginMarker=   False
         EnableAutocomplete=   True
         Enabled         =   True
         EnableLineFoldings=   True
         EnableLineFoldingSetting=   False
         FontSize        =   13
         GutterBackgroundColor=   &cD6D6D600
         GutterSeparationLineColor=   &c00000000
         GutterWidth     =   0
         Height          =   628
         HighlightBlocksOnMouseOverGutter=   False
         HighlightMatchingBrackets=   True
         HighlightMatchingBracketsMode=   0
         IgnoreRepaint   =   False
         IndentPixels    =   16
         IndentVisually  =   True
         Index           =   -2147483648
         InitialParent   =   "Panel"
         KeepEntireTextIndented=   True
         Left            =   0
         LeftMarginOffset=   0
         LineHeight      =   0.0
         LineNumbersColor=   &c00000000
         LineNumbersFontSize=   12
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
         SelectionLength =   0
         SelectionStart  =   0
         SelText         =   ""
         TabIndex        =   0
         TabPanelIndex   =   1
         TabStop         =   True
         TabWidth        =   0
         Text            =   ""
         TextColor       =   &c00000000
         TextFont        =   "Source Code Pro"
         TextHeight      =   0.0
         TextLength      =   0
         TextSelectionColor=   &cD783FF00
         ThickInsertionPoint=   False
         Tooltip         =   ""
         Top             =   0
         UseSystemTextSelectionColor=   True
         Visible         =   True
         Width           =   739
      End
   End
   Begin DesktopButton ButtonAddIcon
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "Add Icon (0)"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      Italic          =   False
      Left            =   767
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   20
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   134
   End
   Begin DesktopButton ButtonToggleBookmark
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "Toggle Bookmark"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      Italic          =   False
      Left            =   767
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   52
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   134
   End
End
#tag EndDesktopWindow

#tag WindowCode
	#tag Event
		Sub Opening()
		  Var defFile As FolderItem = SpecialFolder.Resource("Xojo.xml")
		  Var syntaxDefinition As New SyntaxArea.HighlightDefinition
		  Call syntaxDefinition.LoadFromXml(defFile)
		  
		  CodeEditor.SyntaxDefinition = syntaxDefinition
		  
		  CodeEditor.EnableLineFoldings = syntaxDefinition.SupportsCodeBlocks
		  
		  CodeEditor.SetFocus
		  
		End Sub
	#tag EndEvent


	#tag Constant, Name = DEMO_XOJO_CODE, Type = String, Dynamic = False, Default = \"#If Not DebugBuild\n#Pragma DisableBackgroundTasks\n#EndIf\n\n// Make sure we\'re not updating while the LineHighlighter is busy.\nVar lock As New SyntaxArea.LinesLock(Self)\n#Pragma Unused lock\n\nSelf.UpdateIndentation\n\nIf Not mRedrawEverything And Not mRedrawCaret Then\nmRedrawEverything \x3D True\nEnd If\n\nIf gr.Height <\x3D 0 Or gr.Width <\x3D 0 Then\n// There is nothing to draw.\nReturn\nEnd If\n\n// Check our back buffer to make sure we\'ve got one that we can draw to.\n// If we don\'t have a back buffer\x2C then we need to create one.\n// If our size is different than our back buffer\x2C then we need to create a new one.\nVar realign As Boolean\nrealign \x3D (mBackBuffer \x3D Nil) Or (gr.Width <> mBackBuffer.Width) Or _\n(gr.Height <> mBackBuffer.Height)\n\n// macOS already double buffers for us so we don\'t need a back buffer.\nVar createBackBuffers As Boolean \x3D Not TargetMacOS\n\nIf realign Then\nIf createBackBuffers Then\n// Create a double buffer.\nmBackBuffer \x3D parentWindow.BitmapForCaching(gr.Width\x2C gr.Height)\nEnd If\nCalculateMaxHorizontalSB\nCalculateMaxVerticalSB\nInvalidateAllLines\nmRedrawEverything \x3D True\nEnd If\n\n// Get a graphics context to draw onto.\nVar g As Graphics\nIf mBackBuffer \x3D Nil Then\n// Draw directly into the Canvas graphics (required for Retina support)\ng \x3D gr\nElse\n// Draw first into a separate graphics buffer which is then painted into the \n// Canvas at the end.\ng \x3D mBackBuffer.Graphics\nEnd If\n\nIf mRedrawCaret And Not mRedrawEverything Then\nmRedrawEverything \x3D True\nEnd If\n\n#If DebugBuild\nRedrawTime \x3D System.Microseconds\n#EndIf\n\nVar sx\x2C sy As Double\nVar gg As Graphics // For the gutter (left frame showing line numbers).\nVar gutterWidth As Integer \x3D LineNumberOffset\n\n// Line numbers.\nIf Self.displayLineNumbers Then\n// Create the line numbers picture if needed.\nIf Not createBackBuffers Then\n// Draw the gutter directly into the canvas graphics object (Retina requirement).\ngg \x3D gr\nElse\n// Use a separate graphics buffer for the gutter.\nIf Gutter \x3D Nil Or Gutter.Height <> g.Height Or gutter.Width <> gutterWidth Then\nGutter \x3D parentWindow.BitmapForCaching(gutterWidth\x2C g.Height)\ngg \x3D gutter.Graphics\ngg.FontName \x3D LineNumbersTextFont\ngg.FontSize \x3D LineNumbersFontSize\nElse\ngg \x3D gutter.Graphics\nEnd If\nEnd If\n  \n// Repaint the gutter background if needed.\nIf mfullRefresh Or LastDrawnTopLine <> ScrollPosition Then\ngg.DrawingColor \x3D GutterBackgroundColor.LighterColor(10\x2C True)\ngg.FillRectangle LineNumberOffset - FoldingOffset\x2C 0\x2C FoldingOffset\x2C g.Height\ngg.DrawingColor \x3D GutterBackgroundColor\ngg.FillRectangle 0\x2C 0\x2C gutterWidth - FoldingOffset\x2C g.Height\ngg.DrawingColor \x3D GutterSeparationLineColor\ngg.DrawLine(LineNumberOffset - 1\x2C 0\x2C LineNumberOffset - 1\x2C g.Height)\nLastDrawnTopLine \x3D ScrollPosition\nEnd If\nEnd If\n\n// Paint the selection and get its range.\nVar selection As New SyntaxArea.CharSelection(-1\x2C -1\x2C -1\x2C -1\x2C TextSelectionColor)\nVar tmpSelection As SyntaxArea.CharSelection\n\n// Get the selection range.\nIf SelectionLength > 0 Then\nselection.offset \x3D SelectionStart\nselection.length \x3D SelectionLength\nselection.StartLine \x3D Lines.GetLineNumberForOffset(SelectionStart)\nselection.EndLine \x3D Lines.GetLineNumberForOffset(SelectionStart + SelectionLength)\nEnd If\n\n// Set the text properties.\ng.FontSize \x3D FontSize\ng.FontName \x3D TextFont\nIf g <> gr Then\ngr.FontSize \x3D FontSize\ngr.FontName \x3D TextFont\nEnd If\n\n// Starting positions.\nsx \x3D LeftMarginOffset + LineNumberOffset - ScrollPositionX\nsy \x3D g.TextHeight\n\nVar line As TextLine\nVar linesDrawn As Integer\nVar firstLine As Integer\nVar lastLine As Integer\n\n// The lowest possible line to draw is ScrollPosition\x2C so start there.\nIf EnableLineFoldings Then\nfirstline \x3D Lines.GetNumberOfLinesNeededToView(ScrollPosition)\nlastLine \x3D Lines.Count - 1\nElse\nfirstLine \x3D ScrollPosition\nlastLine \x3D Min(Lines.Count - 1\x2C ScrollPosition + MaxVisibleLines)\nEnd If\n\nVar linesOnScreen As Integer\n\nFor lineIdx As Integer \x3D firstLine To lastLine\nlinesOnScreen \x3D linesOnScreen + 1\n\n// Get the current line.\nline \x3D Lines.GetLine(lineIdx)\nIf Not line.Visible Then Continue For\n\nIf _\nInvalidLines.HasKey(lineIdx) Or _\nmFullRefresh Or _\nselection.IsLineIndexInRange(lineIdx) Or _\n(PreviouslyDrawnSelection <> Nil And PreviouslyDrawnSelection.IsLineIndexInRange(lineIdx)) Then\n\n// This line needs to be repainted (invalid)\x2C or is a full refresh\x2C or is\n// part of the previous or current selection.\n\n// Clear the background for this line.\nVar lineBackColor As Color \x3D BackColor\n\nIf Not UseBackgroundColorForLine(lineIdx\x2C lineBackColor) Then\nlineBackColor \x3D BackColor\nEnd If\ng.DrawingColor \x3D lineBackColor\ng.FillRectangle(LineNumberOffset\x2C sy - g.TextHeight\x2C g.Width - LineNumberOffset\x2C TextHeight)\n\n// Draw highlighted ranges.\n// First draw the highlighted ranges.\nVar ranges() As SyntaxArea.CharSelection \x3D _\nHighlightedRanges.SelectionsForLine(lineIdx)\n\n// Then draw words with a background.\nline.AppendHighlightedWords(ranges\x2C lineIdx)\n\n// Finally draw the selection.\nranges.Add(selection)\n\nIf matchingBlockHighlight <> Nil Then\nranges.Add(MatchingBlockHighlight)\nEnd If\n\nVar x\x2C y\x2C w As Double\nFor Each tmpSelection In ranges\n If tmpSelection.IsLineIndexInRange(lineIdx) Then\n// If in selection\x2C highlight the line.\nIf mHasFocus Or Not tmpSelection.LosesFocus Then\ng.DrawingColor \x3D tmpSelection.SelectionColor\nElse\ng.DrawingColor \x3D BackColor.DarkerColor(30\x2C True)\nEnd If\n\nIf lineIdx > tmpSelection.StartLine And lineIdx < tmpSelection.EndLine Then\n// A fully selected line.\ng.FillRectangle(LineNumberOffset\x2C sy - g.TextHeight\x2C g.Width - line.VisualIndent(Self.IndentVisually)\x2C TextHeight)\n\nElseIf lineIdx \x3D tmpSelection.StartLine And tmpSelection.EndLine <> tmpSelection.StartLine Then\n// First line.\nXYAtCharPos(tmpSelection.Offset\x2C lineIdx\x2C x\x2C y)\n\nIf tmpSelection.Rounded Then\ng.FillRoundRectangle(x\x2C sy - g.TextHeight\x2C g.Width - x + 10\x2C TextHeight\x2C 8\x2C 8)\nElse\ng.FillRectangle(x\x2C sy - g.TextHeight\x2C g.Width - x\x2C TextHeight)\nEnd If\n\nElseIf lineIdx \x3D tmpSelection.EndLine And tmpSelection.EndLine <> tmpSelection.StartLine Then\n// Last line.\nXYAtCharPos(tmpSelection.Offset + tmpSelection.Length\x2C lineIdx\x2C x\x2C y)\n\nIf tmpSelection.Rounded Then\ng.FillRoundRectangle(LineNumberOffset - 10\x2C sy - g.TextHeight\x2C x - LineNumberOffset + 10\x2C TextHeight\x2C 8\x2C 8)\nElse\ng.FillRectangle(LineNumberOffset\x2C sy - g.TextHeight\x2C x - LineNumberOffset\x2C TextHeight)\nEnd If\n\nElse\n// Small block in line.\nXYAtCharPos(tmpSelection.Offset\x2C lineIdx\x2C x\x2C y)\nXYAtCharPos(tmpSelection.Offset + tmpSelection.Length\x2C lineIdx\x2C w\x2C y)\n\nIf tmpSelection.Rounded Then\ng.FillRoundRectangle(x\x2C sy - g.TextHeight\x2C w - x\x2C TextHeight\x2C 8\x2C 8)\nElse\ng.FillRectangle(x\x2C sy - g.TextHeight\x2C w - x\x2C TextHeight)\nEnd If\nEnd If\nEnd If\nNext tmpSelection\n\n// Paint a line background\?\nPaintBelowLine(lineIdx\x2C g\x2C LineNumberOffset\x2C sy - g.TextHeight\x2C g.Width - LineNumberOffset - 1\x2C TextHeight)\n\n// Paint the line.\nline.Paint(TextStorage\x2C g\x2C sx\x2C sy - (g.TextHeight - g.FontAscent)\x2C TextColor\x2C DisplayInvisibleCharacters\x2C SelectionStart\x2C SelectionLength\x2C True\x2C Self.IndentVisually)\n\n// Line overlay\?\nPaintAboveLine(lineIdx\x2C g\x2C LineNumberOffset\x2C sy - g.TextHeight\x2C g.Width - LineNumberOffset - 1\x2C TextHeight)\n\n// Contents after folded line...\nIf line.Folded Then\nVar tmp As SyntaxArea.TextLine \x3D Lines.GetLine(Lines.NextBlockEndLine(lineIdx))\nIf tmp <> Nil Then\n// Make italic and paint after the current line.\ntmp.Italic \x3D True\ntmp.Paint(TextStorage\x2C g\x2C sx + line.TotalWidth + SyntaxArea.BlockFoldedTrailImage.Width + 6\x2C sy - (g.TextHeight - g.FontAscent)\x2C TextColor\x2C False\x2C SelectionStart\x2C SelectionLength\x2C False\x2C Self.IndentVisually)\ntmp.Italic \x3D False\nEnd If\nEnd If\n\n// Autocomplete suggestion.\nIf SelectionLength \x3D 0 And lineIdx \x3D CaretLine And TrailingSuggestion <> \"\" Then\ng.DrawingColor \x3D SyntaxArea.AdjustColorForDarkMode(&cAAAAAA)\nVar c As Color \x3D g.DrawingColor\nIf Color.IsDarkMode Then\ng.DrawingColor \x3D Color.RGB(c.Red + 75\x2C c.Green + 75\x2C c.Blue + 75)\nEnd If\ng.DrawText(trailingSuggestion\x2C AutocompleteSuggestionInsertionX\x2C sy - (g.TextHeight - g.FontAscent))\nEnd If\n\n// Draw the gutter last so that it overwrites text that was drawn \n// into the gutter area when it\'s horizontally scrolled.\nIf displayLineNumbers Then\n// The caret line is slightly darker.\nIf EnableLineFoldings Then\ngg.DrawingColor \x3D GutterBackgroundColor.LighterColor(10\x2C True)\ngg.FillRectangle(LineNumberOffset - FoldingOffset - 1\x2C sy - g.TextHeight\x2C FoldingOffset\x2C TextHeight)\nEnd If\nIf CaretLine \x3D lineIdx Then\ngg.DrawingColor \x3D GutterBackgroundColor.DarkerColor(20\x2C True)\ngg.FillRectangle(0\x2C sy - g.TextHeight\x2C LineNumberOffset - 1 - FoldingOffset\x2C TextHeight)\ngg.Bold \x3D True\ngg.DrawingColor \x3D SyntaxArea.AdjustColorForDarkMode(Color.Black)\nElse\ngg.DrawingColor \x3D GutterBackgroundColor\ngg.FillRectangle(0\x2C sy - g.TextHeight\x2C LineNumberOffset - 1 - FoldingOffset\x2C TextHeight)\nEnd If\n\nIf DisplayDirtyLines And line.IsDirty Then\ngg.DrawingColor \x3D DirtyLinesColor\ngg.FillRectangle(LineNumberOffset - 4\x2C sy - g.TextHeight\x2C 3\x2C TextHeight)\nEnd If\n\n// Bookmarks\?\nIf BookmarkTable.HasKey(lineIdx) Then\nVar img As Picture \x3D UseBookmarkIconForLine(lineIdx)\nIf img \x3D Nil Then img \x3D BookmarkImage\ngg.DrawPicture(img\x2C 0\x2C sy - g.TextHeight + (g.TextHeight - img.Height) / 2)\nEnd If\n\n// Row icon available\?\nIf line.Icon <> Nil Then\nVar icn As Picture \x3D line.Icon\ngg.DrawPicture(icn\x2C gutterWidth - icn.Width - 2 - FoldingOffset\x2C sy - g.TextHeight + (g.TextHeight - icn.Height) / 2)\nElse\n// Line number.\ngg.DrawingColor \x3D LineNumbersColor\nIf gr \x3D gg Then\ngg.FontName \x3D LineNumbersTextFont\ngg.FontSize \x3D LineNumbersFontSize\nEnd If\ngg.DrawText(Str(lineIdx + 1)\x2C LineNumberOffset - 2 - gg.TextWidth(Str(lineIdx + 1)) - FoldingOffset\x2C sy - (TextHeight - gg.FontAscent) / 2)\nIf gr \x3D gg Then\ngg.FontSize \x3D FontSize\ngg.FontName \x3D TextFont\nEnd If\nEnd If\n\nIf EnableLineFoldings And line.IsBlockStart Then\nIf line.Folded Then\n// Draw a line folded marker.\ngg.DrawPicture(BlockFoldedImage\x2C LineNumberOffset - BlockFoldedImage.Width - 2\x2C sy - TextHeight + (TextHeight - BlockFoldedImage.Height) / 2 + 1)\nElse\ngg.DrawPicture(BlockStartImage\x2C LineNumberOffset - BlockStartImage.Width - 2\x2C sy - TextHeight + (TextHeight - BlockStartImage.Height) / 2 + 1)\nEnd If\nElseIf EnableLineFoldings And line.IsBlockEnd Then\ngg.DrawPicture(BlockEndImage\x2C LineNumberOffset - BlockEndImage.Width - 2\x2C sy - TextHeight + (TextHeight - BlockEndImage.Height) / 2 + 1)\nEnd If\n\ngg.Bold \x3D False\nEnd If\n\nlinesDrawn \x3D linesDrawn + 1\nEnd If\n\n// Go to the next line.\nIf TextHeight \x3D 0 Then Break\nsy \x3D sy + TextHeight\nIf sy - g.TextHeight > g.Height Then\n// Or bail out if we\'ve reached the end of the canvas.\nExit For\nEnd If\nNext lineIdx\n\nVisibleLineRange.Offset \x3D firstLine\nVisibleLineRange.Length \x3D linesOnScreen\n\n// Clear the rest of the buffer if necessary.\nsy \x3D sy - g.TextHeight\nIf sy < g.Height Then\ng.DrawingColor \x3D BackColor\ng.FillRectangle(gutterWidth\x2C sy\x2C g.Width - gutterWidth\x2C g.Height - sy)\nEnd If\n\n// Invalid lines are no longer invalid.\nInvalidLines.RemoveAll\nmFullRefresh \x3D False\nPreviouslyDrawnSelection \x3D selection\n\nIf MatchingBlockHighlight <> Nil Then\nInvalidateLine(MatchingBlockHighlight.StartLine)\nMatchingBlockHighlight \x3D Nil\nEnd If\n\n// Draw the line numbers.\nIf DisplayLineNumbers And gg <> gr Then\ng.DrawPicture(Gutter\x2C 0\x2C 0)\nEnd If\n\n// And their frame.\nIf Border Then\ng.DrawingColor \x3D BorderColor\ng.DrawRectangle(0\x2C 0\x2C g.Width\x2C g.Height)\nEnd If\n\n// Now we can draw the back buffer to the screen\nIf mBackBuffer <> Nil Then\ngr.DrawPicture(mBackBuffer\x2C 0\x2C 0\x2C gr.Width\x2C gr.Height\x2C 0\x2C 0\x2C mBackBuffer.Width\x2C mBackBuffer.Height)\nEnd If\n\n// Paint the location of the previous/next block character.\nIf BlockBeginPosX >\x3D 0 Then\nPaintHighlightedBlock(gr)\nBlockBeginPosX \x3D -1\nBlockBeginPosY \x3D -1\nEnd If\n\n// Right margin marker.\nIf DisplayRightMarginMarker And RightMarginAtPixel > 0 Then\ngr.DrawPicture(RightMarginLineImage\x2C RightMarginAtPixel - ScrollPositionX + LeftMarginOffset + LineNumberOffset\x2C 0\x2C 1\x2C gr.Height\x2C 0\x2C 0\x2C 1\x2C 1)\nEnd If\n\n// Paint the caret.\nIf DragSource \x3D Nil Then\nPaintCaret(CaretPos\x2C gr\x2C gutterWidth)\nElse\nPaintCaret(DragTextPos\x2C gr\x2C gutterWidth)\nEnd If\n\nPaintOver(gr\x2C gutterWidth)\n\n#If DebugBuild\nredrawTime \x3D System.Microseconds - redrawTime\n#EndIf\n\nmRedrawEverything \x3D False\nmRedrawCaret \x3D False", Scope = Protected
	#tag EndConstant


#tag EndWindowCode

#tag Events HorizontalScrollBar
	#tag Event
		Sub ValueChanged()
		  CodeEditor.ScrollPositionX = Me.Value
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events VerticalScrollBar
	#tag Event
		Sub ValueChanged()
		  CodeEditor.ScrollPosition = Me.Value
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events CodeEditor
	#tag Event , Description = 54686520656469746F72206973206F70656E696E672E
		Sub Opening()
		  // Set the scrollbars on Windows and Linux (they are native on macOS).
		  
		  #If TargetMacOS
		    HorizontalScrollBar.Visible = False
		    VerticalScrollBar.Visible = False
		    CodeEditor.Width = CodeEditor.Width + VerticalScrollBar.Width
		    CodeEditor.Height = CodeEditor.Height + HorizontalScrollBar.Height
		    
		  #Else
		    Me.SetScrollbars(HorizontalScrollBar, VerticalScrollBar)
		  #EndIf
		  
		  Me.Text = DEMO_XOJO_CODE
		  
		  CodeEditor.BackColor = New ColorGroup(Color.White, Color.Black)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ButtonAddIcon
	#tag Event
		Sub Pressed()
		  // Adds a line icon to line 0.
		  Var p As Picture = Window1.BitmapForCaching(10, CodeEditor.LineHeight)
		  p.Graphics.DrawingColor = Color.Purple
		  p.Graphics.FillRectangle(0, 0, p.Graphics.Width, p.Graphics.Height)
		  CodeEditor.LineIcon(0) = p
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ButtonToggleBookmark
	#tag Event
		Sub Pressed()
		  // Toggles the bookmark for the line the caret is on.
		  CodeEditor.ToggleBookmark(CodeEditor.CaretLine)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="Name"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Interfaces"
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
		InitialValue="600"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Size"
		InitialValue="400"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimumWidth"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimumHeight"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximumWidth"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximumHeight"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Type"
		Visible=true
		Group="Frame"
		InitialValue="0"
		Type="Types"
		EditorType="Enum"
		#tag EnumValues
			"0 - Document"
			"1 - Movable Modal"
			"2 - Modal Dialog"
			"3 - Floating Window"
			"4 - Plain Box"
			"5 - Shadowed Box"
			"6 - Rounded Window"
			"7 - Global Floating Window"
			"8 - Sheet Window"
			"9 - Modeless Dialog"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Frame"
		InitialValue="Untitled"
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasCloseButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasMaximizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasMinimizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasFullScreenButton"
		Visible=true
		Group="Frame"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Resizeable"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Composite"
		Visible=false
		Group="OS X (Carbon)"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MacProcID"
		Visible=false
		Group="OS X (Carbon)"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreen"
		Visible=true
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="DefaultLocation"
		Visible=true
		Group="Behavior"
		InitialValue="2"
		Type="Locations"
		EditorType="Enum"
		#tag EnumValues
			"0 - Default"
			"1 - Parent Window"
			"2 - Main Screen"
			"3 - Parent Window Screen"
			"4 - Stagger"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="ImplicitInstance"
		Visible=true
		Group="Window Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
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
		Name="BackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="&cFFFFFF"
		Type="ColorGroup"
		EditorType="ColorGroup"
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
		Name="MenuBar"
		Visible=true
		Group="Menus"
		InitialValue=""
		Type="DesktopMenuBar"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBarVisible"
		Visible=true
		Group="Deprecated"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
