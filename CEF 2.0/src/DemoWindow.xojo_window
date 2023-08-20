#tag DesktopWindow
Begin DesktopWindow DemoWindow
   Backdrop        =   0
   BackgroundColor =   &cFFFFFF00
   Composite       =   True
   DefaultLocation =   0
   FullScreen      =   False
   HasBackgroundColor=   False
   HasCloseButton  =   True
   HasFullScreenButton=   False
   HasMaximizeButton=   True
   HasMinimizeButton=   True
   Height          =   606
   ImplicitInstance=   True
   MacProcID       =   0
   MaximumHeight   =   32000
   MaximumWidth    =   32000
   MenuBar         =   1061007404
   MenuBarVisible  =   True
   MinimumHeight   =   560
   MinimumWidth    =   500
   Resizeable      =   True
   Title           =   "Custom EditField - Xojo API 2.0+ ONLY"
   Type            =   0
   Visible         =   True
   Width           =   847
   Begin DesktopScrollbar verticalSB
      Active          =   False
      AllowAutoDeactivate=   True
      AllowFocus      =   True
      AllowLiveScrolling=   True
      AllowTabStop    =   True
      Enabled         =   True
      Height          =   590
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   466
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
      TabIndex        =   0
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
   Begin DesktopScrollbar horizontalSB
      Active          =   False
      AllowAutoDeactivate=   True
      AllowFocus      =   True
      AllowLiveScrolling=   True
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
      MaximumValue    =   0
      MinimumValue    =   0
      PageStep        =   20
      PanelIndex      =   0
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      Tooltip         =   ""
      Top             =   590
      Transparent     =   True
      Value           =   0
      Visible         =   True
      Width           =   466
      _mIndex         =   0
      _mInitialParent =   ""
      _mName          =   ""
      _mPanelIndex    =   0
   End
   Begin CustomEditField TestField
      AllowAutoDeactivate=   True
      AllowFocus      =   True
      AllowFocusRing  =   False
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
      ClearHighlightedRangesOnTextChange=   False
      DirtyLinesColor =   &cFF999900
      disableReset    =   False
      DisplayDirtyLines=   True
      DisplayInvisibleCharacters=   False
      DisplayLineNumbers=   True
      DisplayRightMarginMarker=   True
      EnableAutocomplete=   True
      Enabled         =   True
      EnableLineFoldings=   False
      enableLineFoldingSetting=   False
      FontSize        =   0
      GutterBackgroundColor=   &cEEEEEE00
      GutterSeparationLineColor=   &c88888800
      GutterWidth     =   0
      Height          =   574
      HighlightBlocksOnMouseOverGutter=   True
      HighlightMatchingBrackets=   True
      HighlightMatchingBracketsMode=   0
      ignoreRepaint   =   False
      IndentPixels    =   16
      IndentVisually  =   True
      Index           =   -2147483648
      InitialParent   =   ""
      KeepEntireTextIndented=   True
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
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TabWidth        =   4
      Text            =   ""
      TextColor       =   &c00000000
      TextFont        =   "smallSystem"
      TextHeight      =   0.0
      TextLength      =   0
      TextSelectionColor=   &c00000000
      ThickInsertionPoint=   True
      Tooltip         =   ""
      Top             =   16
      Transparent     =   True
      Visible         =   True
      Width           =   466
   End
   Begin DesktopCheckBox CheckBox1
      AllowAutoDeactivate=   True
      Bold            =   False
      Caption         =   "Display Line Numbers"
      Enabled         =   True
      FontName        =   "SmallSystem"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   501
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   394
      Transparent     =   True
      Underline       =   False
      Value           =   True
      Visible         =   True
      VisualState     =   1
      Width           =   153
   End
   Begin DesktopLabel StaticText2
      AllowAutoDeactivate=   True
      Bold            =   False
      Enabled         =   True
      FontName        =   "SmallSystem"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   514
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Font:"
      TextAlignment   =   3
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   14
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   38
   End
   Begin DesktopPopupMenu textFont
      AllowAutoDeactivate=   True
      Bold            =   False
      Enabled         =   True
      FontName        =   "SmallSystem"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   564
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      SelectedRowIndex=   0
      TabIndex        =   8
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   14
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   137
   End
   Begin DesktopLabel StaticText3
      AllowAutoDeactivate=   True
      Bold            =   False
      Enabled         =   True
      FontName        =   "SmallSystem"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   713
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   9
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Size:"
      TextAlignment   =   3
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   14
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   30
   End
   Begin DesktopPopupMenu FontSize
      AllowAutoDeactivate=   True
      Bold            =   False
      Enabled         =   True
      FontName        =   "SmallSystem"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "0\r8\r9\r10\r11\r12\r13\r14\r16\r18\r20\r24\r30\r36\r72"
      Italic          =   False
      Left            =   755
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      SelectedRowIndex=   0
      TabIndex        =   10
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   14
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   52
   End
   Begin DesktopTextField EditField2
      AllowAutoDeactivate=   True
      AllowFocusRing  =   True
      AllowSpellChecking=   False
      AllowTabs       =   False
      BackgroundColor =   &cFFFFFF00
      Bold            =   False
      Enabled         =   True
      FontName        =   "SmallSystem"
      FontSize        =   0.0
      FontUnit        =   0
      Format          =   ""
      HasBorder       =   True
      Height          =   22
      Hint            =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   576
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      MaximumCharactersAllowed=   0
      Password        =   False
      ReadOnly        =   False
      Scope           =   0
      TabIndex        =   11
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   418
      Transparent     =   True
      Underline       =   False
      ValidationMask  =   "####"
      Visible         =   True
      Width           =   80
   End
   Begin DesktopLabel StaticText4
      AllowAutoDeactivate=   True
      Bold            =   False
      Enabled         =   True
      FontName        =   "SmallSystem"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   501
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   12
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Go to line:"
      TextAlignment   =   3
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   419
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   69
   End
   Begin DesktopCheckBox CheckBox2
      AllowAutoDeactivate=   True
      Bold            =   False
      Caption         =   "Enable autocomplete"
      Enabled         =   True
      FontName        =   "SmallSystem"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   501
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   13
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   472
      Transparent     =   True
      Underline       =   False
      Value           =   True
      Visible         =   True
      VisualState     =   1
      Width           =   142
   End
   Begin DesktopSlider Slider1
      AllowAutoDeactivate=   True
      AllowLiveScrolling=   True
      Enabled         =   True
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   502
      LineStep        =   1
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      MaximumValue    =   100
      MinimumValue    =   0
      PageStep        =   20
      Scope           =   0
      TabIndex        =   14
      TabPanelIndex   =   0
      TabStop         =   True
      TickMarkStyle   =   0
      Tooltip         =   ""
      Top             =   216
      Transparent     =   True
      Value           =   0
      Visible         =   True
      Width           =   196
   End
   Begin DesktopLabel marginLbl
      AllowAutoDeactivate=   True
      Bold            =   False
      Enabled         =   True
      FontName        =   "SmallSystem"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   708
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   15
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Left Margin: 4px"
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   214
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   104
   End
   Begin DesktopLabel StaticText5
      AllowAutoDeactivate=   True
      Bold            =   False
      Enabled         =   True
      FontName        =   "SmallSystem"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   27
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   634
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Multiline       =   True
      Scope           =   0
      Selectable      =   False
      TabIndex        =   16
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Default Non-Syntax Text Color:"
      TextAlignment   =   3
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   72
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   172
   End
   Begin ColorPicker textColor
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   True
      AllowTabs       =   False
      Backdrop        =   0
      Enabled         =   True
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   810
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      SelectedColor   =   &c00000000
      TabIndex        =   17
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   72
      Transparent     =   True
      Visible         =   True
      Width           =   20
   End
   Begin DesktopCheckBox CheckBox3
      AllowAutoDeactivate=   True
      Bold            =   False
      Caption         =   "Border"
      Enabled         =   True
      FontName        =   "SmallSystem"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   501
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   18
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   320
      Transparent     =   True
      Underline       =   False
      Value           =   True
      Visible         =   True
      VisualState     =   1
      Width           =   81
   End
   Begin DesktopLabel StaticText6
      AllowAutoDeactivate=   True
      Bold            =   False
      Enabled         =   True
      FontName        =   "SmallSystem"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   501
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   20
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Border Color: "
      TextAlignment   =   3
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   72
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   96
   End
   Begin ColorPicker fieldbackColor
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   True
      AllowTabs       =   False
      Backdrop        =   0
      Enabled         =   True
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   602
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      SelectedColor   =   &c00000000
      TabIndex        =   21
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   100
      Transparent     =   True
      Visible         =   True
      Width           =   20
   End
   Begin DesktopLabel StaticText7
      AllowAutoDeactivate=   True
      Bold            =   False
      Enabled         =   True
      FontName        =   "SmallSystem"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   501
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   22
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Back Color: "
      TextAlignment   =   3
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   100
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   96
   End
   Begin ColorPicker lineNums
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   True
      AllowTabs       =   False
      Backdrop        =   0
      Enabled         =   True
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   810
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      SelectedColor   =   &c00000000
      TabIndex        =   23
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   100
      Transparent     =   True
      Visible         =   True
      Width           =   20
   End
   Begin DesktopLabel StaticText8
      AllowAutoDeactivate=   True
      Bold            =   False
      Enabled         =   True
      FontName        =   "SmallSystem"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   685
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   24
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Line Numbers Color:"
      TextAlignment   =   3
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   100
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   121
   End
   Begin DesktopLabel StaticText9
      AllowAutoDeactivate=   True
      Bold            =   False
      Enabled         =   True
      FontName        =   "SmallSystem"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   501
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   26
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Caret Color: "
      TextAlignment   =   3
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   128
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   96
   End
   Begin ColorPicker gutterColor
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   True
      AllowTabs       =   False
      Backdrop        =   0
      Enabled         =   True
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   810
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      SelectedColor   =   &c00000000
      TabIndex        =   27
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   128
      Transparent     =   True
      Visible         =   True
      Width           =   20
   End
   Begin ColorPicker gutterSepColor
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   True
      AllowTabs       =   False
      Backdrop        =   0
      Enabled         =   True
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   810
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      SelectedColor   =   &c00000000
      TabIndex        =   29
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   156
      Transparent     =   True
      Visible         =   True
      Width           =   20
   End
   Begin DesktopLabel StaticText11
      AllowAutoDeactivate=   True
      Bold            =   False
      Enabled         =   True
      FontName        =   "SmallSystem"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   665
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   30
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Gutter Separation Color:"
      TextAlignment   =   3
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   156
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   141
   End
   Begin DesktopPopupMenu syntax
      AllowAutoDeactivate=   True
      Bold            =   False
      Enabled         =   True
      FontName        =   "SmallSystem"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   564
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      SelectedRowIndex=   0
      TabIndex        =   31
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   42
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   137
   End
   Begin DesktopLabel StaticText12
      AllowAutoDeactivate=   True
      Bold            =   False
      Enabled         =   True
      FontName        =   "SmallSystem"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   501
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   32
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Syntax:"
      TextAlignment   =   3
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   42
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   51
   End
   Begin DesktopCheckBox InvisibleChk
      AllowAutoDeactivate=   True
      Bold            =   False
      Caption         =   "Display Invisible Chars"
      Enabled         =   True
      FontName        =   "SmallSystem"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   501
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   33
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   368
      Transparent     =   True
      Underline       =   False
      Value           =   False
      Visible         =   True
      VisualState     =   0
      Width           =   155
   End
   Begin DesktopCheckBox CheckBox5
      AllowAutoDeactivate=   True
      Bold            =   False
      Caption         =   "Highlight matching brackets"
      Enabled         =   True
      FontName        =   "SmallSystem"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   501
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   34
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   246
      Transparent     =   True
      Underline       =   False
      Value           =   False
      Visible         =   True
      VisualState     =   0
      Width           =   181
   End
   Begin DesktopCheckBox CheckBox7
      AllowAutoDeactivate=   True
      Bold            =   False
      Caption         =   "Automatically close brackets"
      Enabled         =   True
      FontName        =   "SmallSystem"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   501
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   34
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   271
      Transparent     =   True
      Underline       =   False
      Value           =   False
      Visible         =   True
      VisualState     =   0
      Width           =   181
   End
   Begin DesktopListBox autocompleteWordsList
      AllowAutoDeactivate=   True
      AllowAutoHideScrollbars=   True
      AllowExpandableRows=   False
      AllowFocusRing  =   True
      AllowResizableColumns=   False
      AllowRowDragging=   False
      AllowRowReordering=   False
      Bold            =   False
      ColumnCount     =   1
      ColumnWidths    =   ""
      DefaultRowHeight=   -1
      DropIndicatorVisible=   False
      Enabled         =   True
      FontName        =   "SmallSystem"
      FontSize        =   0.0
      FontUnit        =   0
      GridLineStyle   =   0
      HasBorder       =   True
      HasHeader       =   True
      HasHorizontalScrollbar=   False
      HasVerticalScrollbar=   True
      HeadingIndex    =   -1
      Height          =   98
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Autocomplete Words"
      Italic          =   False
      Left            =   501
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      RequiresSelection=   False
      RowSelectionType=   0
      Scope           =   0
      TabIndex        =   35
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   492
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   214
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin DesktopButton PushButton1
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "Add LineIcon(0)"
      Default         =   False
      Enabled         =   True
      FontName        =   "SmallSystem"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   501
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   38
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   445
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   100
   End
   Begin DesktopCheckBox CheckBox8
      AllowAutoDeactivate=   True
      Bold            =   False
      Caption         =   "Thick Insertion Point"
      Enabled         =   True
      FontName        =   "SmallSystem"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   501
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   39
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   185
      Transparent     =   True
      Underline       =   False
      Value           =   False
      Visible         =   True
      VisualState     =   0
      Width           =   142
   End
   Begin DesktopCheckBox enableFoldings
      AllowAutoDeactivate=   True
      Bold            =   False
      Caption         =   "Enable Line Foldings"
      Enabled         =   True
      FontName        =   "SmallSystem"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   501
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   40
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   344
      Transparent     =   True
      Underline       =   False
      Value           =   False
      Visible         =   True
      VisualState     =   0
      Width           =   142
   End
   Begin DesktopButton btnSyntaxColors
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "Colors..."
      Default         =   False
      Enabled         =   True
      FontName        =   "SmallSystem"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   727
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   41
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   40
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin DesktopLabel StaticText10
      AllowAutoDeactivate=   True
      Bold            =   False
      Enabled         =   True
      FontName        =   "SmallSystem"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   685
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   28
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Gutter Back Color:"
      TextAlignment   =   3
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   128
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   121
   End
   Begin ColorPicker caretColor
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   True
      AllowTabs       =   False
      Backdrop        =   0
      Enabled         =   True
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   602
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      SelectedColor   =   &c00000000
      TabIndex        =   25
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   128
      Transparent     =   True
      Visible         =   True
      Width           =   20
   End
   Begin DesktopCheckBox CheckBox9
      AllowAutoDeactivate=   True
      Bold            =   False
      Caption         =   "Display Right Margin Line at:"
      Enabled         =   True
      FontName        =   "SmallSystem"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   501
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   42
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   296
      Transparent     =   True
      Underline       =   False
      Value           =   True
      Visible         =   True
      VisualState     =   1
      Width           =   181
   End
   Begin DesktopTextField EditField4
      AllowAutoDeactivate=   True
      AllowFocusRing  =   True
      AllowSpellChecking=   False
      AllowTabs       =   False
      BackgroundColor =   &cFFFFFF00
      Bold            =   False
      Enabled         =   True
      FontName        =   "SmallSystem"
      FontSize        =   0.0
      FontUnit        =   0
      Format          =   ""
      HasBorder       =   True
      Height          =   22
      Hint            =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   685
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      MaximumCharactersAllowed=   0
      Password        =   False
      ReadOnly        =   False
      Scope           =   0
      TabIndex        =   43
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   295
      Transparent     =   True
      Underline       =   False
      ValidationMask  =   "###"
      Visible         =   True
      Width           =   38
   End
   Begin DesktopLabel StaticText14
      AllowAutoDeactivate=   True
      Bold            =   False
      Enabled         =   True
      FontName        =   "SmallSystem"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   727
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   44
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "px (0 for default)"
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   296
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   100
   End
   Begin EditFieldControls fieldInfo
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   True
      AllowTabs       =   False
      Backdrop        =   0
      Enabled         =   True
      Height          =   16
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   44
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextSelectionInfo=   ""
      Tooltip         =   ""
      Top             =   0
      Transparent     =   True
      Visible         =   True
      Width           =   466
   End
   Begin ColorPicker dirtyLinesColor
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   True
      AllowTabs       =   False
      Backdrop        =   0
      Enabled         =   True
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   602
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      SelectedColor   =   &c00000000
      TabIndex        =   45
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   156
      Transparent     =   True
      Visible         =   True
      Width           =   20
   End
   Begin DesktopCheckBox CheckBox10
      AllowAutoDeactivate=   True
      Bold            =   False
      Caption         =   "Dirty Lines?"
      Enabled         =   True
      FontName        =   "SmallSystem"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   501
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   46
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   156
      Transparent     =   True
      Underline       =   False
      Value           =   True
      Visible         =   True
      VisualState     =   1
      Width           =   96
   End
   Begin ColorPicker textSelectionColor
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   True
      AllowTabs       =   False
      Backdrop        =   0
      Enabled         =   True
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   810
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      SelectedColor   =   &c00000000
      TabIndex        =   47
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   184
      Transparent     =   True
      Visible         =   True
      Width           =   20
   End
   Begin DesktopLabel StaticText15
      AllowAutoDeactivate=   True
      Bold            =   False
      Enabled         =   True
      FontName        =   "SmallSystem"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   665
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   48
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Text Selection Color"
      TextAlignment   =   3
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   184
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   141
   End
   Begin TestToolbar TestToolbar1
      Enabled         =   True
      Index           =   -2147483648
      InitialParent   =   ""
      LockedInPosition=   False
      Scope           =   0
      TabPanelIndex   =   0
      Visible         =   True
   End
   Begin DesktopCheckBox CheckBox11
      AllowAutoDeactivate=   True
      Bold            =   False
      Caption         =   "Apply standard case"
      Enabled         =   True
      FontName        =   "SmallSystem"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   649
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   49
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   472
      Transparent     =   True
      Underline       =   False
      Value           =   True
      Visible         =   True
      VisualState     =   1
      Width           =   161
   End
   Begin DesktopPopupMenu HighlightMatchingMode
      AllowAutoDeactivate=   True
      Bold            =   False
      Enabled         =   True
      FontName        =   "SmallSystem"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Circle\rHighlight"
      Italic          =   False
      Left            =   685
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      SelectedRowIndex=   0
      TabIndex        =   50
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   247
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   85
   End
   Begin ColorPicker bracketHighlightColor
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   True
      AllowTabs       =   False
      Backdrop        =   0
      Enabled         =   True
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   774
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      SelectedColor   =   &c00000000
      TabIndex        =   51
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   247
      Transparent     =   True
      Visible         =   False
      Width           =   20
   End
   Begin DesktopListBox bookmarks
      AllowAutoDeactivate=   True
      AllowAutoHideScrollbars=   True
      AllowExpandableRows=   False
      AllowFocusRing  =   True
      AllowResizableColumns=   False
      AllowRowDragging=   False
      AllowRowReordering=   False
      Bold            =   False
      ColumnCount     =   1
      ColumnWidths    =   ""
      DefaultRowHeight=   -1
      DropIndicatorVisible=   False
      Enabled         =   True
      FontName        =   "SmallSystem"
      FontSize        =   0.0
      FontUnit        =   0
      GridLineStyle   =   0
      HasBorder       =   True
      HasHeader       =   True
      HasHorizontalScrollbar=   False
      HasVerticalScrollbar=   True
      HeadingIndex    =   -1
      Height          =   97
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Bookmarks"
      Italic          =   False
      Left            =   727
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      RequiresSelection=   False
      RowSelectionType=   0
      Scope           =   0
      TabIndex        =   52
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   492
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   100
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin ColorPicker frameColor
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   True
      AllowTabs       =   False
      Backdrop        =   0
      Enabled         =   True
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   602
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      SelectedColor   =   &c00000000
      TabIndex        =   55
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   72
      Transparent     =   True
      Visible         =   True
      Width           =   20
   End
   Begin Timer keepFocusInTextfieldTimer
      Enabled         =   True
      Index           =   -2147483648
      LockedInPosition=   False
      Period          =   500
      RunMode         =   2
      Scope           =   0
      TabPanelIndex   =   0
   End
   Begin DesktopGroupBox GroupBox1
      AllowAutoDeactivate=   True
      Bold            =   False
      Caption         =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   111
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   670
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Scope           =   0
      TabIndex        =   62
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   328
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   158
      Begin DesktopCheckBox CheckBox6
         AllowAutoDeactivate=   True
         Bold            =   False
         Caption         =   "Autoindent new lines"
         Enabled         =   True
         FontName        =   "SmallSystem"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         Index           =   -2147483648
         InitialParent   =   "GroupBox1"
         Italic          =   False
         Left            =   676
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   0
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   336
         Transparent     =   True
         Underline       =   False
         Value           =   False
         Visible         =   True
         VisualState     =   0
         Width           =   142
      End
      Begin DesktopCheckBox VisualindentChk
         AllowAutoDeactivate=   True
         Bold            =   False
         Caption         =   "Indent visually only"
         Enabled         =   True
         FontName        =   "SmallSystem"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         Index           =   -2147483648
         InitialParent   =   "GroupBox1"
         Italic          =   False
         Left            =   676
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   1
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   360
         Transparent     =   True
         Underline       =   False
         Value           =   False
         Visible         =   True
         VisualState     =   0
         Width           =   142
      End
      Begin DesktopCheckBox KeepEntireTextIndentedChk
         AllowAutoDeactivate=   True
         Bold            =   False
         Caption         =   "Keep fully indented"
         Enabled         =   True
         FontName        =   "SmallSystem"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         Index           =   -2147483648
         InitialParent   =   "GroupBox1"
         Italic          =   False
         Left            =   676
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   2
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   383
         Transparent     =   True
         Underline       =   False
         Value           =   False
         Visible         =   True
         VisualState     =   0
         Width           =   142
      End
      Begin DesktopTextField EditField3
         AllowAutoDeactivate=   True
         AllowFocusRing  =   True
         AllowSpellChecking=   False
         AllowTabs       =   False
         BackgroundColor =   &cFFFFFF00
         Bold            =   False
         Enabled         =   True
         FontName        =   "SmallSystem"
         FontSize        =   0.0
         FontUnit        =   0
         Format          =   ""
         HasBorder       =   True
         Height          =   22
         Hint            =   ""
         Index           =   -2147483648
         InitialParent   =   "GroupBox1"
         Italic          =   False
         Left            =   676
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         MaximumCharactersAllowed=   0
         Password        =   False
         ReadOnly        =   False
         Scope           =   0
         TabIndex        =   3
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   ""
         TextAlignment   =   0
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   407
         Transparent     =   True
         Underline       =   False
         ValidationMask  =   "##"
         Visible         =   True
         Width           =   28
      End
      Begin DesktopLabel StaticText13
         AllowAutoDeactivate=   True
         Bold            =   False
         Enabled         =   True
         FontName        =   "SmallSystem"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         Index           =   -2147483648
         InitialParent   =   "GroupBox1"
         Italic          =   False
         Left            =   711
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   4
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "Spaces per Tab"
         TextAlignment   =   0
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   407
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   88
      End
   End
   Begin DesktopButton Button1
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "Clear Highlights"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   22
      Index           =   -2147483648
      Italic          =   False
      Left            =   710
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   63
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   452
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   120
   End
End
#tag EndDesktopWindow

#tag WindowCode
	#tag Event
		Sub MenuBarSelected()
		  //enable/disable undo/redo menus.
		  EditUndo.Enabled = TestField.CanUndo
		  EditRedo.Enabled = TestField.CanRedo
		End Sub
	#tag EndEvent

	#tag Event
		Function MouseDown(x As Integer, y As Integer) As Boolean
		  #pragma unused X
		  #pragma unused Y
		  
		  // this is just a cheap trick to cause a redraw for debugging
		  testField.Redraw
		  
		  #if DebugBuild
		    Debugging.DebugLog Debugging.AccumulationResult
		    Debugging.AccumulationClear
		  #endif
		End Function
	#tag EndEvent

	#tag Event
		Sub Opening()
		  Self.Top = 70
		  Self.Left = 30
		  
		  // Assign text to the CustomEditField
		  if false then
		    TestField.Text = defaultTextMD
		    syntax.SelectedRowIndex = markdownSyntaxIdx
		  elseif true then
		    TestField.Text = defaultTextRB
		    syntax.SelectedRowIndex = realbasicSyntaxIdx
		  else
		    TestField.Text = defaultTextJava
		    syntax.SelectedRowIndex = javaSyntaxIdx
		  end if
		  
		  // Note: If you handle large text, e.g. more than a few 100 lines, and if you also want to use
		  // indentation, then the syntax definition should be set to nil before setting the new text,
		  //
		  
		  TestField.ReindentText // cleans up indentations, removing any leading blanks from the lines
		  TestField.ResetUndo // needed so that the Reindentation doesn't become an undoable action
		  SetWindowModified(false)
		  
		  // Add a few row icons at random lines.
		  'rowicondata.Transparent = 1
		  'markerdata.Transparent = 1
		  testField.LineIcon(rnd * testField.MaxVisibleLines) = rowicondata
		  testField.LineIcon(rnd * testField.LineCount) = rowicondata
		  testField.LineIcon(rnd * testField.LineCount) = rowicondata
		  testField.LineIcon(rnd * testField.MaxVisibleLines) = markerdata
		  testField.LineIcon(rnd * testField.LineCount) = markerdata
		  testField.LineIcon(rnd * testField.LineCount) = markerdata
		  
		End Sub
	#tag EndEvent


	#tag MenuHandler
		Function EditRedo() As Boolean Handles EditRedo.Action
		  TestField.Redo
		  Return True
		  
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function EditUndo() As Boolean Handles EditUndo.Action
		  TestField.Undo
		  Return True
		  
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function ExtrasFoldAllLines() As Boolean Handles ExtrasFoldAllLines.Action
		  TestField.FoldAllLines
		  Return True
		  
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function ExtrasFoldCurrentBlock() As Boolean Handles ExtrasFoldCurrentBlock.Action
		  TestField.FoldBlockAtCaretPos
		  Return True
		  
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function ExtrasSelectNextPlaceholder() As Boolean Handles ExtrasSelectNextPlaceholder.Action
		  TestField.SelectNextPlaceholder
		  Return True
		  
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function ExtrasUnfoldAllLines() As Boolean Handles ExtrasUnfoldAllLines.Action
		  TestField.UnfoldAllLines
		  Return True
		  
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function FileClose() As Boolean Handles FileClose.Action
		  self.Close
		  Return True
		  
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function FilePageSetup() As Boolean Handles FilePageSetup.Action
		  dim ps as new PrinterSetup
		  if PrinterSetupString <> "" then ps.Settings = PrinterSetupString
		  
		  if ps.ShowPageSetupDialog then
		    PrinterSetupString = ps.Settings
		    TestField.RightMarginAtPixel = ps.Width
		  end if
		  
		  Return True
		  
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function FilePrint() As Boolean Handles FilePrint.Action
		  print
		  Return True
		  
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function FileSave() As Boolean Handles FileSave.Action
		  dim file as FolderItem
		  file = FolderItem.ShowSaveFileDialog("Text", "MyFile.txt")
		  if file = nil then Return true
		  
		  if TestField.Save(file, "Text", encodings.UTF8) then
		    SetWindowModified(TestField.IsDirty)
		    Return true
		  end if
		  Return False
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function FindFind() As Boolean Handles FindFind.Action
		  FindWindow.Show
		  Return True
		  
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function FindFindNext() As Boolean Handles FindFindNext.Action
		  call FindWindow.findNext
		  Return True
		  
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function FindReplace() As Boolean Handles FindReplace.Action
		  FindWindow.replace
		  Return True
		  
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function FindReplaceFindNext() As Boolean Handles FindReplaceFindNext.Action
		  FindWindow.replaceAndFind
		  Return True
		  
		End Function
	#tag EndMenuHandler


	#tag Method, Flags = &h0
		Shared Function GuessEncoding(s As String) As TextEncoding
		  // Guess what text encoding the text in the given string is in.
		  // This ignores the encoding set on the string, and guesses
		  // one of the following:
		  //
		  //   * UTF-32
		  //   * UTF-16
		  //   * UTF-8
		  //   * Encodings.SystemDefault
		  //
		  // Written by Joe Strout, slightly modernized by Thomas Tempelmann
		  
		  #pragma DisableBackgroundTasks
		  #pragma DisableBoundsChecking
		  
		  static isBigEndian, endianChecked As Boolean
		  if not endianChecked then
		    Dim temp As String = Encodings.UTF16.Chr( &hFEFF )
		    isBigEndian = (( temp.MiddleBytes( 0, 1 ).AscByte ) = &hFE)
		    endianChecked = true
		  end if
		  
		  // check for a BOM
		  Dim b0 As Integer = s.MiddleBytes( 0, 1 ).AscByte
		  Dim b1 As Integer =  s.MiddleBytes( 1, 1 ) .AscByte
		  Dim b2 As Integer =  s.MiddleBytes( 2, 1 ) .AscByte
		  Dim b3 As Integer =  s.MiddleBytes( 3, 1 ) .AscByte
		  if b0=0 and b1=0 and b2=&hFE and b3=&hFF then
		    // UTF-32, big-endian
		    if isBigEndian then
		      #if RBVersion >= 2012.02
		        return Encodings.UTF32
		      #else
		        return Encodings.UCS4
		      #endif
		    else
		      return Encodings.UTF32BE
		    end if
		  elseif b0=&hFF and b1=&hFE and b2=0 and b3=0 and s.Bytes >= 4 then
		    // UTF-32, little-endian
		    if isBigEndian then
		      return Encodings.UTF32LE
		    else
		      #if RBVersion >= 2012.02
		        return Encodings.UTF32
		      #else
		        return Encodings.UCS4
		      #endif
		    end if
		  elseif b0=&hFE and b1=&hFF then
		    // UTF-16, big-endian
		    if isBigEndian then
		      return Encodings.UTF16
		    else
		      return Encodings.UTF16BE
		    end if
		  elseif b0=&hFF and b1=&hFE then
		    // UTF-16, little-endian
		    if isBigEndian then
		      return Encodings.UTF16LE
		    else
		      return Encodings.UTF16
		    end if
		  elseif b0=&hEF and b1=&hBB and b1=&hBF then
		    // UTF-8 (ah, a sensible encoding where endianness doesn't matter!)
		    return Encodings.UTF8
		  end if
		  
		  // no BOM; see if it's entirely ASCII.
		  Dim m As MemoryBlock = s
		  Dim i, maxi As Integer = s.Bytes - 1
		  for i = 0 to maxi
		    if m.Byte(i) > 127 then exit
		  next
		  if i > maxi then return Encodings.ASCII
		  
		  // Not ASCII; check for a high incidence of nulls every other byte,
		  // which suggests UTF-16 (at least in Roman text).
		  Dim nulls(1) As Integer  // null count in even (0) and odd (1) bytes
		  for i = 0 to maxi
		    if m.Byte(i) = 0 then
		      nulls(i mod 2) = nulls(i mod 2) + 1
		    end if
		  next
		  if nulls(0) > nulls(1)*2 and nulls(0) > maxi\2 then
		    // UTF-16, big-endian
		    if isBigEndian then
		      return Encodings.UTF16
		    else
		      return Encodings.UTF16BE
		    end if
		  elseif nulls(1) > nulls(0)*2 and nulls(1) > maxi\2 then
		    // UTF-16, little-endian
		    if isBigEndian then
		      return Encodings.UTF16LE
		    else
		      return Encodings.UTF16
		    end if
		  end if
		  
		  // it's not ASCII; check for illegal UTF-8 characters.
		  // See Table 3.1B, "Legal UTF-8 Byte Sequences",
		  // at <http://unicode.org/versions/corrigendum1.html>
		  Dim b As Byte
		  for i = 0 to maxi
		    select case m.Byte(i)
		    case &h00 to &h7F
		      // single-byte character; just continue
		    case &hC2 to &hDF
		      // one additional byte
		      if i+1 > maxi then exit for
		      b = m.Byte(i+1)
		      if b < &h80 or b > &hBF then exit for
		      i = i+1
		    case &hE0
		      // two additional bytes
		      if i+2 > maxi then exit for
		      b = m.Byte(i+1)
		      if b < &hA0 or b > &hBF then exit for
		      b = m.Byte(i+2)
		      if b < &h80 or b > &hBF then exit for
		      i = i+2
		    case &hE1 to &hEF
		      // two additional bytes
		      if i+2 > maxi then exit for
		      b = m.Byte(i+1)
		      if b < &h80 or b > &hBF then exit for
		      b = m.Byte(i+2)
		      if b < &h80 or b > &hBF then exit for
		      i = i+2
		    case &hF0
		      // three additional bytes
		      if i+3 > maxi then exit for
		      b = m.Byte(i+1)
		      if b < &h90 or b > &hBF then exit for
		      b = m.Byte(i+2)
		      if b < &h80 or b > &hBF then exit for
		      b = m.Byte(i+3)
		      if b < &h80 or b > &hBF then exit for
		      i = i+3
		    case &hF1 to &hF3
		      // three additional bytes
		      if i+3 > maxi then exit for
		      b = m.Byte(i+1)
		      if b < &h80 or b > &hBF then exit for
		      b = m.Byte(i+2)
		      if b < &h80 or b > &hBF then exit for
		      b = m.Byte(i+3)
		      if b < &h80 or b > &hBF then exit for
		      i = i+3
		    case &hF4
		      // three additional bytes
		      if i+3 > maxi then exit for
		      b = m.Byte(i+1)
		      if b < &h80 or b > &h8F then exit for
		      b = m.Byte(i+2)
		      if b < &h80 or b > &hBF then exit for
		      b = m.Byte(i+3)
		      if b < &h80 or b > &hBF then exit for
		      i = i+3
		    else
		      exit for
		    end select
		  next i
		  if i > maxi then return Encodings.UTF8  // no illegal UTF-8 sequences, so that's probably what it is
		  
		  // If not valid UTF-8, then let's just guess the system default.
		  return Encodings.SystemDefault
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub print()
		  dim ps as new PrinterSetup
		  
		  //if the user changed the settings using page setup, set those.
		  if PrinterSetupString <> "" then _
		  ps.Settings = PrinterSetupString
		  
		  //get graphics context
		  dim g as Graphics = ps.ShowPrinterDialog
		  if g = nil then Return
		  
		  //now, get printer object from editfield.
		  dim fieldPrinter as CustomEditFieldPrinter = TestField.CustomEditFieldPrinter(g)
		  
		  //range to print.
		  dim maxLine as Integer = TestField.LineCount - 1
		  dim range as DataRange = new DataRange(0, maxLine)
		  
		  //change these if you want to play with different block sizes...
		  dim left, top, maxw, maxh as Integer
		  left = ps.Left
		  top = ps.Top
		  maxw = ps.Width
		  maxh = ps.Height
		  
		  dim wrap as Boolean = true //wrap text?
		  
		  //print...
		  //drawBlock returns the last printed line, so you can recalculate the next lines to print.
		  g.DrawingColor = &ccccccc
		  g.DrawRectangle left, top, maxw, maxh
		  dim lastPrintedLine as Integer = fieldPrinter.DrawBlock(left, top, maxw, maxh, range, wrap, TestField.DisplayLineNumbers)
		  while lastPrintedLine < maxLine
		    //recalculate range...
		    range.offset = lastPrintedLine + 1
		    range.length = maxLine - range.offset
		    
		    //get next page
		    g.NextPage
		    
		    //and print next block.
		    g.DrawingColor = &ccccccc
		    g.DrawRectangle left, top, maxw, maxh
		    lastPrintedLine = fieldPrinter.DrawBlock(left, top, maxw, maxh, range, wrap, TestField.DisplayLineNumbers)
		  wend
		  
		  g.NextPage
		  g.DrawText "Now, with different block settings....", 10, g.TextHeight
		  
		  //do it again with different settings.
		  //try these
		  left = ps.Width / 2 - 200
		  top = ps.Height / 2 - 200
		  maxw = 400
		  maxh = 400
		  
		  range = new DataRange(0, maxLine) //reset range
		  
		  g.DrawingColor = &ccccccc
		  g.DrawRectangle left, top, maxw, maxh
		  lastPrintedLine = fieldPrinter.DrawBlock(left, top, maxw, maxh, range, wrap, TestField.DisplayLineNumbers)
		  while lastPrintedLine < maxLine
		    //recalculate range...
		    range.offset = lastPrintedLine + 1
		    range.length = maxLine - range.offset
		    
		    //get next page
		    g.NextPage
		    
		    //and print next block.
		    g.DrawingColor = &ccccccc
		    g.DrawRectangle left, top, maxw, maxh
		    lastPrintedLine = fieldPrinter.DrawBlock(left, top, maxw, maxh, range, wrap, TestField.DisplayLineNumbers)
		  wend
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub reloadBookmarks()
		  bookmarks.RemoveAllRows
		  
		  bookmarkIndexes = TestField.BookmarkList
		  for i as Integer = 0 to bookmarkIndexes.LastIndex
		    bookmarks.AddRow "Lineindex: "+str(bookmarkIndexes(i))
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SetWindowModified(b as boolean)
		  // Added 11/15/2001 by Jarvis Badgley
		  // Modified 2/3/2002 by Kevin Ballard
		  
		  #if RBVersion < 2013.0 then
		    
		    dim w as Window=self
		    Dim osErr As Integer
		    dim v as variant
		    
		    #if TargetMacOS then
		      #if TargetCarbon or TargetCocoa then
		        Declare Function SetWindowModified Lib "Carbon" (window As WindowPtr, modified As Integer) As Integer
		      #else
		        Declare Function SetWindowModified Lib "WindowsLib" (window As WindowPtr, modified As Integer) As Integer
		      #endif // TargetCarbon
		      
		      v=b
		      osErr=SetWindowModified(w,v)
		    #endif // TargetMacOS
		    
		  #else // Xojo
		    
		    // Added 11/2/2017 by Kem Tekinay
		    
		    self.Changed = b
		    
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub toggleBookmark()
		  if TestField.LineHasBookmark(TestField.CaretLine) then
		    TestField.ClearBookmark(TestField.CaretLine)
		  else
		    TestField.AddBookmark(TestField.CaretLine)
		  end if
		  
		  reloadBookmarks
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected BookmarkButtonIndex As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected bookmarkIndexes() As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private javaSyntaxIdx As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected lastLine As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private markdownSyntaxIdx As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected MyAutocomplete As patrie
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected PrinterSetupString As string
	#tag EndProperty

	#tag Property, Flags = &h21
		Private realbasicSyntaxIdx As Integer
	#tag EndProperty


	#tag Constant, Name = autocompleteWords, Type = String, Dynamic = False, Default = \"someKey someOtherKey someKey.subKey1 someKey.subKey2 someKey.subKey1.final someKey.subKey1.key someKey.subKey1.key.1 someKey.subKey1.key.1.2.3.4.5.6 a ability able about above absence absolutely academic accept access accident accompany according account achieve achievement acid acquire across act action active activity actual actually add addition additional address administration admit adopt adult advance advantage advice advise affair affect afford afraid after afternoon afterwards again against age agency agent ago agree agreement ahead aid aim air aircraft all allow almost alone along already alright also alternative although always among amongst amount an analysis ancient and animal announce annual another answer any anybody anyone anything anyway apart apparent apparently appeal appear appearance application apply appoint appointment approach appropriate approve area argue argument arise arm army around arrange arrangement arrive art article artist as ask aspect assembly assess assessment asset associate association assume assumption at atmosphere attach attack attempt attend attention attitude attract attractive audience author authority available average avoid award aware away aye baby back background bad bag balance ball band bank bar base basic basis battle be bear beat beautiful because become bed bedroom before begin beginning behaviour behind belief believe belong below beneath benefit beside best better between beyond big bill bind bird birth bit black block blood bloody blow blue board boat body bone book border both bottle bottom box boy brain branch break breath bridge brief bright bring broad brother budget build building burn bus business busy but buy by cabinet call campaign can candidate capable capacity capital car card care career careful carefully carry case cash cat catch category cause cell central centre century certain certainly chain chair chairman challenge chance change channel chapter character characteristic charge cheap check chemical chief child choice choose church circle circumstance citizen city civil claim class clean clear clearly client climb close closely clothes club coal code coffee cold colleague collect collection college colour combination combine come comment commercial commission commit commitment committee common communication community company compare comparison competition complete completely complex component computer concentrate concentration concept concern concerned conclude conclusion condition conduct conference confidence confirm conflict congress connect connection consequence conservative consider considerable consideration consist constant construction consumer contact contain content context continue contract contrast contribute contribution control convention conversation copy corner corporate correct cos cost could council count country county couple course court cover create creation credit crime criminal crisis criterion critical criticism cross crowd cry cultural culture cup current currently curriculum customer cut damage danger dangerous dark data date daughter day dead deal death debate debt decade decide decision declare deep defence defendant define definition degree deliver demand democratic demonstrate deny department depend deputy derive describe description design desire desk despite destroy detail detailed determine develop development device die difference different difficult difficulty dinner direct direction directly director disappear discipline discover discuss discussion disease display distance distinction distribution district divide division do doctor document dog domestic door double doubt down draw drawing dream dress drink drive driver drop drug dry due during duty each ear early earn earth easily east easy eat economic economy edge editor education educational effect effective effectively effort egg either elderly election element else elsewhere emerge emphasis employ employee employer employment empty enable encourage end enemy energy engine engineering enjoy enough enough ensure enter enterprise entire entirely entitle entry environment environmental equal equally equipment error escape especially essential establish establishment estate estimate even evening event eventually ever every everybody everyone everything evidence exactly examination examine example excellent except exchange executive exercise exhibition exist existence existing expect expectation expenditure expense expensive experience experiment expert explain explanation explore express expression extend extent external extra extremely eye face facility fact factor factory fail failure fair fairly faith fall familiar family famous far farm farmer fashion fast father favour fear feature fee feel feeling female few field fight figure file fill film final finally finance financial find finding fine finger finish fire firm first fish fit fix flat flight floor flow flower fly focus follow following food foot football for force foreign forest forget form formal former forward foundation free freedom frequently fresh friend from front fruit fuel full fully function fund funny further future gain game garden gas gate gather general generally generate generation gentleman get girl give glass go goal god gold good government grant great green grey ground group grow growing growth guest guide gun hair half hall hand handle hang happen happy hard hardly hate have he head health hear heart heat heavy hell help hence her here herself hide high highly hill him himself his historical history hit hold hole holiday home hope horse hospital hot hotel hour house household housing how however huge human hurt husband i idea identify if ignore illustrate image imagine immediate immediately impact implication imply importance important impose impossible impression improve improvement in incident include including income increase increased increasingly indeed independent index indicate individual industrial industry influence inform information initial initiative injury inside insist instance instead institute instruction instrument insurance intend intention interest interested interesting internal international interpretation interview into introduce introduction investigate investigation investment invite involve iron island issue it item its itself job join joint journey judge jump just justice keep key kid kill kind king kitchen knee know knowledge labour lack lady land language large largely last last late later latter laugh launch law lawyer lay lead leader leadership leading leaf league lean learn least leave left leg legal legislation length less let letter level liability liberal library lie life lift light like likely limit limited line link lip list listen literature little live living loan local location long look lord lose loss lot love lovely low lunch machine magazine main mainly maintain major majority make male man manage management manager manner many map mark mark market market marriage married marry mass master match match material matter may maybe me meal mean meaning means meanwhile measure mechanism media medical meet meeting member membership memory mental mention merely message metal method middle might mile military milk mind mine minister ministry minute miss mistake model modern module moment money month more morning most mother motion motor mountain mouth move movement much murder museum music must my myself name narrow nation national natural nature near nearly necessarily necessary neck need negotiation neighbour neither network never nevertheless new news newspaper next nice night no no-one nobody nod noise none nor normal normally north northern nose not note nothing notice notion now nuclear number nurse object objective observation observe obtain obvious obviously occasion occur odd of off offence offer office officer official often oil okay old on once one only onto open operate operation opinion opportunity opposition option or order ordinary organisation organise organization origin original other otherwise ought our ourselves out outcome output outside over overall own owner package page pain paint painting pair panel paper parent park parliament part particular particularly partly partner party pass passage past path patient pattern pay payment peace pension people per percent perfect perform performance perhaps period permanent person personal persuade phase phone photograph physical pick picture piece place plan planning plant plastic plate play player please pleasure plenty plus pocket point police policy political politics pool poor popular population position positive possibility possible possibly post potential pound power powerful practical practice prefer prepare presence present president press pressure pretty prevent previous previously price primary prime principle priority prison prisoner private probably problem procedure process produce product production professional profit program programme progress project promise promote proper properly property proportion propose proposal prospect protect protection prove provide provided provision pub public publication publish pull pupil purpose push put quality quarter question quick quickly quiet quite race radio railway rain raise range rapidly rare rate rather reach reaction read reader reading ready real realise reality realize really reason reasonable recall receive recent recently recognise recognition recognize recommend record recover red reduce reduction refer reference reflect reform refuse regard region regional regular regulation reject relate relation relationship relative relatively release relevant relief religion religious rely remain remember remind remove repeat replace reply report represent representation representative request require requirement research resource respect respond response responsibility responsible rest restaurant result retain return reveal revenue review revolution rich ride right ring rise risk river road rock role roll roof room round route row royal rule run rural safe safety sale same sample satisfy save say scale scene scheme school science scientific scientist score screen sea search season seat second secondary secretary section sector secure security see seek seem select selection sell send senior sense sentence separate sequence series serious seriously servant serve service session set settle settlement several severe sex sexual shake shall shape share she sheet ship shoe shoot shop short shot should shoulder shout show shut side sight sign signal significance significant silence similar simple simply since sing single sir sister sit site situation size skill skin sky sleep slightly slip slow slowly small smile so social society soft software soil soldier solicitor solution some somebody someone something sometimes somewhat somewhere son song soon sorry sort sound source south southern space speak speaker special species specific speech speed spend spirit sport spot spread spring staff stage stand standard star start state statement station status stay steal step stick still stock stone stop store story straight strange strategy street strength strike strong strongly structure student studio study stuff style subject substantial succeed success successful such suddenly suffer sufficient suggest suggestion suitable sum summer sun supply support suppose sure surely surface surprise surround survey survive switch system table take talk tall tape target task tax tea teach teacher teaching team tear technical technique technology telephone television tell temperature tend term terms terrible test text than thank thanks that the theatre their them theme themselves then theory there therefore these they thin thing think this those though thought threat threaten through throughout throw thus ticket time tiny title to today together tomorrow tone tonight too tool tooth top total totally touch tour towards town track trade tradition traditional traffic train training transfer transport travel treat treatment treaty tree trend trial trip troop trouble true trust truth try turn twice type typical unable under understand understanding undertake unemployment unfortunately union unit united university unless unlikely until up upon upper urban us use used useful user usual usually value variation variety various vary vast vehicle version very via victim victory video view village violence vision visit visitor vital voice volume vote vote wage wait walk wall want war warm warn wash watch water wave way we weak weapon wear weather week weekend weight welcome welfare well west western what whatever when where whereas whether which while whilst white who whole whom whose why wide widely wife wild will win wind window wine wing winner winter wish with withdraw within without woman wonder wonderful wood word work worker working works world worry worth would write writer writing wrong yard yeah year yes yesterday yet you young your yourself youth superlongwordtocheckautosizingofoptionswindow", Scope = Private
	#tag EndConstant

	#tag Constant, Name = defaultTextJava, Type = String, Dynamic = False, Default = \"/*************************************************************************\r *  Compilation:  javac QuickSort.java\r *  Execution:    java QuickSort N\r *\r *  Generate N random real numbers between 0 and 1 and quicksort them.\r *\r *  On average\x2C this quicksort algorithm runs in time proportional to\r *  N log N\x2C independent of the input distribution. The algorithm\r *  guards against the worst-case by randomly shuffling the elements\r *  before sorting. In addition\x2C it uses Sedgewick\'s partitioning\r *  method which stops on equal keys. This protects against cases\r *  that make many textbook implementations\x2C even randomized ones\x2C\r *  go quadratic (e.g.\x2C all keys are the same).\r *   *************************************************************************/\r\rpackage HighlightTests;\rimport java.lang.Math;\r\r//code from http://www.cs.princeton.edu/introcs/42sort/QuickSort.java.html\r\rpublic class QuickSort {\r    private static long comparisons \x3D 0;\r    private static long exchanges   \x3D 0;\r\r   /***********************************************************************\r    *  Quicksort code from Sedgewick 7.1\x2C 7.2.\r    ***********************************************************************/\r    public static void quicksort(double[] <#a#>) {\r        shuffle(a);                        // to guard against worst-case\r        quicksort(a\x2C 0\x2C a.length - 1);\r    }\r\r    // quicksort a[left] to a[right]\r    public static void quicksort(double[] <#a#>\x2C int <#left#>\x2C int <#right#>) {\r        if (right <\x3D left) return;\r        int i \x3D partition(a\x2C left\x2C right);\r        quicksort(a\x2C left\x2C i-1);\r        quicksort(a\x2C i+1\x2C right);\r    }\r\r    // partition a[left] to a[right]\x2C assumes left < right\r    private static int partition(double[] <#a#>\x2C int <#left#>\x2C int <#right#>) {\r        int i \x3D left - 1;\r        int j \x3D right;\r        while (true) {\r            while (less(a[++i]\x2C a[right]))      // find item on left to swap\r                ;                               // a[right] acts as sentinel\r            while (less(a[right]\x2C a[--j]))      // find item on right to swap\r                if (j \x3D\x3D left) break;           // don\'t go out-of-bounds\r            if (i >\x3D j) break;                  // check if pointers cross\r            exch(a\x2C i\x2C j);                      // swap two elements into place\r        }\r        exch(a\x2C i\x2C right);                      // swap with partition element\r        return i;\r    }\r\r    // is x < y \?\r    private static boolean less(double <#x#>\x2C double <#y#>) {\r        comparisons++;\r        return (x < y);\r    }\r\r    // exchange a[i] and a[j]\r    private static void exch(double[] <#a#>\x2C int <#i#>\x2C int <#j#>) {\r        exchanges++;\r        double swap \x3D a[i];\r        a[i] \x3D a[j];\r        a[j] \x3D swap;\r    }\r\r    // shuffle the array a[]\r    private static void shuffle(double[] <#a#>) {\r        int N \x3D a.length;\r        for (int i \x3D 0; i < N; i++) {\r            int r \x3D i + (int) (Math.random() * (N-i));   // between i and N-1\r            exch(a\x2C i\x2C r);\r        }\r    }\r\r    // test client\r    public static void main(String[] args) {\r        int N \x3D Integer.parseInt(args[0]);\r\r        // generate N random real numbers between 0 and 1\r        long start \x3D System.currentTimeMillis();\r        double[] a \x3D new double[N];\r        for (int i \x3D 0; i < N; i++)\r            a[i] \x3D Math.random();\r        long stop \x3D System.currentTimeMillis();\r        double elapsed \x3D (stop - start) / 1000.0;\r        System.out.println(\"Generating input:  \" + elapsed + \" seconds\");\r\r        // sort them\r        start \x3D System.currentTimeMillis();\r        quicksort(a);\r        stop \x3D System.currentTimeMillis();\r        elapsed \x3D (stop - start) / 1000.0;\r        System.out.println(\"Quicksort:   \" + elapsed + \" seconds\");\r\r        // print statistics\r        System.out.println(\"Comparisons: \" + comparisons);\r        System.out.println(\"Exchanges:   \" + exchanges);\r    }\r}", Scope = Private
	#tag EndConstant

	#tag Constant, Name = defaultTextMD, Type = String, Dynamic = False, Default = \"normal __bold__ end", Scope = Private
	#tag EndConstant

	#tag Constant, Name = defaultTextRB, Type = String, Dynamic = False, Default = \"module m1\rclass c1\rsub s1\r\'if x then\rend \' <- should be indented one more level\rend sub\rend class\rend module\r\rPrivate Interface Sorter\rFunction Compare(left as Integer\x2C right as Integer) As Integer\r Sub Swap(idx1 as Integer\x2C idx2 as Integer)\r\tEnd Interface\r\rsub test\rselect case x\rcase 1\rfoo()\relse\rbar()\rend select\r\r  dim line as TextLine \x3D lines.getLine (lineIndex)\rif line \x3D \"\xF0\x9F\x94\x8D\" then break\r  if line \x3D nil then\r    return true // true because it may just be an empty line\x2C and that doesn\'t mean we can stop the outer loop\x2C or am I (TT) wrong\?\r  end\r\rsharedfunction\rpropertyCount \x3D propertyCount + 1\r\r  if true then beep\r\rif true then \' just a comment\relse\r  if a then\r  elseif b then\r  else\r  end\rend\r\rselectWord \' should not be confused with \"select\"\r\r  if true and _\r    not false _\r    then\r  #if true\r    beep\r  #elseif true\r    beep\r  #else\r    beep\r  #endif\r  end\r  if SyntaxDefinition \x3D nil then\r    line.indent \x3D 0\r    Return false\r  end\r  \r  dim modified as Boolean\r  dim previousLine as TextLine\x2C addIndentation as String\r  \r  // Determine the indentation level\r  dim currTextUntrimmed as String \x3D TextStorage.getText(line.offset\x2C line.length)\r  // we need to remove the EOL char at the end of the line as it could fool our leading whitespace detection if the entire line is whitespace\r  dim eol as String \x3D self.LineDelimiter\r  if currTextUntrimmed.Right(eol.Len) \x3D eol then\r    currTextUntrimmed \x3D currTextUntrimmed.Left(currTextUntrimmed.Len-eol.Len)\r  end if\r  dim currTextTrimmed as String \x3D currTextUntrimmed.LTrim\r  dim currLeadingSpaces as Integer \x3D currTextUntrimmed.Len - currTextTrimmed.Len\r  dim origLeadingSpaces as Integer \x3D currLeadingSpaces\r  \r  if ltrimLine and currLeadingSpaces > 0 then\r    // Discard leading spaces from current line\r    if mIndentVisually then\r      // remove now because we\'ll not add new spaces\r      \r      if CurrentEventID <\x3D 0 then\r        // This must not happen - the caller must ensure that the EventID is set to System.Ticks\r        // before he starts any modification that invokes this method\r        break\r        CurrentEventID \x3D System.Ticks\r      end if\r      \r      // now remove the leading spaces\r      Replace_private (line.offset\x2C origLeadingSpaces\x2C \"\"\x2C CurrentEventID\x2C true\x2C true)\r      line \x3D lines.getLine(lineIndex)\r      currLeadingSpaces \x3D 0\r      currTextUntrimmed \x3D currTextTrimmed\r      modified \x3D true\r    end if\r  end\r  \r  // The block end test needs to be performed first because the block start test would give wrong results for block ends\r  if SyntaxDefinition.isBlockEnd(currTextTrimmed) then\r    // use indentation of previous block start\r    \r    dim blockStartIdx as Integer \x3D lines.previousBlockStartLine(lineIndex)\r    previousLine \x3D lines.getLine(blockStartIdx)\r    if mIndentVisually then\r      // Indent by drawing the lines at a further offset\x2C based on the TextLine.indent property\r      dim newIndent as Integer\r      if previousLine <> nil then\r        // take the block start\'s indent value\r        newIndent \x3D previousLine.indent\r      else\r        // if there\'s no block start to find\x2C let\'s zero the indent level\r        newIndent \x3D 0\r      end if\r      if newIndent <> line.indent then\r        line.indent \x3D newIndent\r        modified \x3D true\r      end\r      return modified\r    else\r      // Indent by spaces/tabs in the line\x2C which we\'ll handle below\r    end\r    \r  else\r    // check if the previous line is a block start -> then we increase the indentation in the current line\r    \r    dim indentationIncrease as Integer\x2C prevTxt as String\r    \r    previousLine \x3D lines.getLine(lineIndex - 1)\r    if previousLine <> nil then\r      prevTxt \x3D TextStorage.getText(previousLine.offset\x2C previousLine.length)\r      indentationIncrease \x3D SyntaxDefinition.isBlockStart (prevTxt)\r    end\r    \r    if mIndentVisually then\r      // Indent by drawing the lines at a further offset\x2C based on the TextLine.indent property\r      dim newIndent as Integer\r      if previousLine <> nil then\r        newIndent \x3D previousLine.indent + indentationIncrease * IndentPixels\r      else\r        newIndent \x3D 0\r      end\r      if newIndent <> line.indent then\r        line.indent \x3D newIndent\r        modified \x3D true\r      end\r      return modified\r    else\r      // Indent by inserting spaces into the line\r      addIndentation \x3D indentStr (indentationIncrease)\r    end\r  end\r  \r  // Indent by inserting spaces into the line (which are now in \'addIndentation\')\r  \r  line.indent \x3D 0 // reset this value to avoid effects we\'re not prepared for\r  \r  dim currIndent as String \x3D currTextUntrimmed.Left(currLeadingSpaces)\r  \r  dim prevIdentation as String\r  if previousLine <> nil then\r    // get leading non-whitespace chars from previous line\r    dim firstCharPos as Integer \x3D nextNonWhitespace(previousLine.offset - 1\x2C _\r    previousLine.offset + previousLine.length - previousLine.delimiterLength)\r    prevIdentation \x3D TextStorage.getText(previousLine.offset\x2C firstCharPos - previousLine.offset)\r  end if\r  \r  dim newIndentation as String \x3D prevIdentation + addIndentation\r  dim newIndentLen as Integer \x3D newIndentation.Len\r  \r  dim theText as String\x2C moveCaret as Integer\r  if ltrimLine then\r    // Discard leading spaces from current line\r    theText \x3D newIndentation\r  else\r    // Keep leading spaces in current line\r    theText \x3D newIndentation + currIndent\r  end if\r  \r  if theText <> currIndent then\r    \r    if CurrentEventID <\x3D 0 then\r      // This must not happen - the caller must ensure that the EventID is set to Ticks\r      // before he starts any modification that invokes this method\r      break\r      CurrentEventID \x3D Ticks\r    end if\r    \r    Replace_private (line.offset\x2C origLeadingSpaces\x2C theText\x2C CurrentEventID\x2C true\x2C true)\r    modified \x3D true\r  end\r  \r  return modified\rend test", Scope = Private
	#tag EndConstant


#tag EndWindowCode

#tag Events verticalSB
	#tag Event
		Sub ValueChanged()
		  testField.ScrollPosition = me.Value
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events horizontalSB
	#tag Event
		Sub ValueChanged()
		  testField.ScrollPositionx = me.Value
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events TestField
	#tag Event
		Sub Open()
		  //set the scrollbars
		  me.setScrollbars(horizontalSB, verticalSB)
		  
		  //add a set of dummy autocomplete words.
		  dim tmp() as String = autocompleteWords.Split
		  dim word as String
		  
		  MyAutocomplete = new PaTrie
		  dim Words as new Dictionary
		  
		  dim trimmed as String
		  for each word in tmp
		    trimmed = word.Trim
		    if words.HasKey(trimmed) then
		      Continue
		    end if
		    call MyAutocomplete.addKey(trimmed)
		    autocompleteWordsList.AddRow(trimmed)
		    words.Value(trimmed) = true
		  next
		  
		  TestField.ClearDirtyLines
		  
		End Sub
	#tag EndEvent
	#tag Event
		Function AutocompleteOptionsForPrefix(prefix as string) As AutocompleteOptions
		  //you can replace this with your own Autocomplete engine...
		  dim options as new AutocompleteOptions
		  dim commonPrefix as String
		  
		  //prefix is the word that triggered these Autocomplete options
		  options.Prefix = prefix
		  
		  //options is the array that holds the different Autocomplete options for this word (prefix)
		  options.Options = MyAutocomplete.wordsForPrefix(prefix, commonPrefix)
		  
		  //the longest common prefix of the different options
		  options.LongestCommonPrefix = commonPrefix
		  
		  Return options
		End Function
	#tag EndEvent
	#tag Event
		Function ShouldTriggerAutocomplete(Key as string, hasAutocompleteOptions as boolean) As boolean
		  'Return Keyboard.AsyncKeyDown(53) //to use ESC (xcode, mail, coda...)
		  Return key = chr(9) and hasAutocompleteOptions and not Keyboard.OptionKey//to use tab, if there are options
		  'Return Keyboard.AsyncControlKey and Keyboard.AsyncKeyDown(49) //to use ctrl-space as in visual studio
		  'Return false 'no autocomplete, ever
		End Function
	#tag EndEvent
	#tag Event
		Sub SelChanged(line as integer, column as integer, length as integer)
		  dim tmp as String = str(line)+":"+str(column)
		  if length > 0 then tmp = tmp + " ("+str(length)+")"
		  
		  fieldInfo.TextSelectionInfo = tmp
		  
		  if lastLine <> line and TestField.SymbolCount > 0 then
		    fieldInfo.currentSymbol = TestField.CaretSymbol
		  end if
		  lastLine = line
		End Sub
	#tag EndEvent
	#tag Event
		Sub HighlightingComplete()
		  if TestField.SymbolCount = 0 then fieldInfo.currentSymbol = nil
		End Sub
	#tag EndEvent
	#tag Event
		Sub TextChanged()
		  SetWindowModified(me.IsDirty)
		End Sub
	#tag EndEvent
	#tag Event
		Function UseBackgroundColorForLine(lineIndex as integer, byref lineBackgroundColor as color) As boolean
		  //Return false //remove this to have lines with alternate colors as background.
		  
		  //highlight the currentLine.
		  if lineIndex = me.CaretLine then
		    lineBackgroundColor = EditFieldGlobals.AdjustColorForDarkMode (&cFFFEE4) //light yellow
		    Return true
		  end if
		  
		  Return true //remove this to go back to alternating blue-white lines
		  
		  //alternate backgrounds...
		  if lineIndex mod 2 <> 0 then Return False
		  
		  lineBackgroundColor = EditFieldGlobals.AdjustColorForDarkMode (Color.RGB(237,243,255)) //faint blue
		  Return true
		End Function
	#tag EndEvent
	#tag Event
		Sub PaintBelowLine(lineIndex as integer, g as graphics, x as integer, y as integer, w as integer, h as integer)
		  if lineIndex <> me.CaretLine then Return
		  
		  g.DrawingColor = EditFieldGlobals.AdjustColorForDarkMode (&CCCCCCC)
		  g.DrawLine x, y + h - 1, x + w, y + h - 1
		  g.DrawLine x, y , x + w, y
		End Sub
	#tag EndEvent
	#tag Event
		Sub GutterClicked(onLine as integer, x as integer, y as integer)
		  #pragma unused onLine
		  #pragma unused x
		  #pragma unused y
		  if x < 10 then
		    toggleBookmark
		  end if
		End Sub
	#tag EndEvent
	#tag Event
		Sub PlaceholderSelected(placeholderLabel as String, lineIndex as integer, line as textLine, placeholder as textPlaceholder, doubleClick as Boolean)
		  #pragma unused placeholderLabel
		  #pragma unused lineIndex
		  #pragma unused line
		  #pragma unused placeholder
		  #pragma unused doubleClick
		  //I guess you could use placeholders as buttons somehow here...
		  'if doubleClick then
		  'me.SelText = placeholderLabel
		  'me.SelStart = line.offset + placeholder.offset
		  'me.SelLength = placeholderLabel.len
		  'end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events CheckBox1
	#tag Event
		Sub ValueChanged()
		  testField.DisplayLineNumbers = me.Value
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events textFont
	#tag Event
		Sub Opening()
		  me.AddRow "System"
		  me.AddRow "SmallSystem"
		  
		  for i as Integer = 0 to system.FontCount - 1
		    me.AddRow System.FontAt(i)
		    if System.FontAt(i) = testField.TextFont then me.SelectedRowIndex = i + 2
		  next
		  
		  if me.SelectedRowIndex < 0 then me.SelectedRowIndex = 1
		End Sub
	#tag EndEvent
	#tag Event
		Sub SelectionChanged(item As DesktopMenuItem)
		  #Pragma Unused item
		  testField.TextFont = me.SelectedRowValue
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events FontSize
	#tag Event
		Sub Opening()
		  for i as integer = 0 to me.SelectedRowIndex - 1
		    if me.RowValueAt(i) = str(testField.FontSize) then
		      me.SelectedRowIndex = i
		      Return
		    end if
		  next
		End Sub
	#tag EndEvent
	#tag Event
		Sub SelectionChanged(item As DesktopMenuItem)
		  #Pragma Unused item
		  
		  testField.FontSize = val(me.SelectedRowValue)
		  TestField.LineNumbersFontSize = val(me.SelectedRowValue)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events EditField2
	#tag Event
		Function KeyDown(key As String) As Boolean
		  if key = chr(13) or key = chr(3) then
		    dim line as Integer = val(me.Text) - 1
		    #if true
		      // Move cursor to start of that line:
		      testField.SelStart = testField.LineOffset (line)
		    #else
		      // This selects the entire line:
		      testField.SelectLine(line)
		    #endif
		    testField.SetFocus
		    return true
		  end if
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events CheckBox2
	#tag Event
		Sub ValueChanged()
		  testField.EnableAutocomplete = me.Value
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Slider1
	#tag Event
		Sub ValueChanged()
		  testField.LeftMarginOffset = me.Value
		  marginLbl.Text = "Left Margin: "+str(me.Value)+"px"
		End Sub
	#tag EndEvent
	#tag Event
		Sub Opening()
		  me.Value = TestField.LeftMarginOffset
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events textColor
	#tag Event
		Sub Opening()
		  me.SelectedColor = testField.TextColor
		End Sub
	#tag EndEvent
	#tag Event
		Sub ColorChanged()
		  testField.TextColor = me.SelectedColor
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events CheckBox3
	#tag Event
		Sub ValueChanged()
		  testField.Border = me.Value
		End Sub
	#tag EndEvent
	#tag Event
		Sub Opening()
		  me.Value = TestField.Border
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events fieldbackColor
	#tag Event
		Sub Opening()
		  me.SelectedColor = testField.BackColor
		End Sub
	#tag EndEvent
	#tag Event
		Sub ColorChanged()
		  testField.BackColor = me.SelectedColor
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events lineNums
	#tag Event
		Sub Opening()
		  me.SelectedColor = testField.LineNumbersColor
		End Sub
	#tag EndEvent
	#tag Event
		Sub ColorChanged()
		  testField.LineNumbersColor = me.SelectedColor
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events gutterColor
	#tag Event
		Sub Opening()
		  me.SelectedColor = testField.GutterBackgroundColor
		End Sub
	#tag EndEvent
	#tag Event
		Sub ColorChanged()
		  testField.GutterBackgroundColor = me.SelectedColor
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events gutterSepColor
	#tag Event
		Sub Opening()
		  me.SelectedColor = testField.GutterSeparationLineColor
		End Sub
	#tag EndEvent
	#tag Event
		Sub ColorChanged()
		  testField.GutterSeparationLineColor = me.SelectedColor
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events syntax
	#tag Event
		Sub Opening()
		  // Load the syntax definitions from the local "Definitions" folder
		  
		  me.AddRow "None"
		  me.RowTagAt(me.LastAddedRowIndex) = nil
		  
		  dim defsFolder as FolderItem = SpecialFolder.Resource("definitions")
		  
		  for i as Integer = 0 to defsFolder.Count - 1
		    dim f as FolderItem = defsFolder.ChildAt(i)
		    if f <> nil and f.Name.Right(4) = ".xml" then
		      dim def as new HighlightDefinition
		      if def.loadFromXml(f) then
		        if def.Name = "java" then
		          javaSyntaxIdx = me.RowCount
		        elseif def.Name = "REALbasic" then
		          realbasicSyntaxIdx = me.RowCount
		        elseif def.Name = "Markdown" then
		          markdownSyntaxIdx = me.RowCount
		        end if
		        me.AddRow def.Name
		        me.RowTagAt(me.LastRowIndex) = def
		      end if
		    end if
		  next
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub SelectionChanged(item As DesktopMenuItem)
		  #Pragma Unused item
		  
		  if me.SelectedRowIndex < 0 then Return
		  
		  dim SyntaxDefinition as HighlightDefinition = me.RowTagAt(me.SelectedRowIndex)
		  
		  btnSyntaxColors.Enabled = SyntaxDefinition <> nil
		  
		  if testField.SyntaxDefinition = SyntaxDefinition then Return
		  testField.SyntaxDefinition = SyntaxDefinition
		  
		  TestField.EnableLineFoldings = SyntaxDefinition <> nil and SyntaxDefinition.SupportsCodeBlocks
		  enableFoldings.Value = TestField.EnableLineFoldings
		  
		  TestField.SetFocus
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events InvisibleChk
	#tag Event
		Sub ValueChanged()
		  testField.DisplayInvisibleCharacters = me.Value
		End Sub
	#tag EndEvent
	#tag Event
		Sub Opening()
		  me.Value = TestField.DisplayInvisibleCharacters
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events CheckBox5
	#tag Event
		Sub ValueChanged()
		  testField.HighlightMatchingBrackets = me.Value
		  HighlightMatchingMode.Enabled = me.Value
		End Sub
	#tag EndEvent
	#tag Event
		Sub Opening()
		  me.Value = TestField.HighlightMatchingBrackets
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events CheckBox7
	#tag Event
		Sub ValueChanged()
		  testField.AutoCloseBrackets = me.Value
		End Sub
	#tag EndEvent
	#tag Event
		Sub Opening()
		  me.Value = TestField.AutoCloseBrackets
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PushButton1
	#tag Event
		Sub Pressed()
		  if TestField.LineIcon(0) <> nil then
		    TestField.LineIcon(0) = nil
		  else
		    TestField.LineIcon(0) = markerdata
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events CheckBox8
	#tag Event
		Sub ValueChanged()
		  testField.ThickInsertionPoint = me.Value
		End Sub
	#tag EndEvent
	#tag Event
		Sub Opening()
		  me.Value = TestField.ThickInsertionPoint
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events enableFoldings
	#tag Event
		Sub ValueChanged()
		  testField.EnableLineFoldings = me.Value
		End Sub
	#tag EndEvent
	#tag Event
		Sub Opening()
		  me.Value = TestField.EnableLineFoldings
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnSyntaxColors
	#tag Event
		Sub Pressed()
		  dim sc as new SyntaxColors
		  if sc.Show(TestField.SyntaxDefinition) then TestField.ReHighlight
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events caretColor
	#tag Event
		Sub Opening()
		  me.SelectedColor = testField.CaretColor
		End Sub
	#tag EndEvent
	#tag Event
		Sub ColorChanged()
		  testField.CaretColor = me.SelectedColor
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events CheckBox9
	#tag Event
		Sub ValueChanged()
		  TestField.DisplayRightMarginMarker = me.Value
		  EditField4.Enabled = me.Value
		End Sub
	#tag EndEvent
	#tag Event
		Sub Opening()
		  me.Value = TestField.DisplayRightMarginMarker
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events EditField4
	#tag Event
		Function KeyDown(key As String) As Boolean
		  if key = chr(13) then
		    testField.RightMarginAtPixel = val(me.Text)
		  end if
		End Function
	#tag EndEvent
	#tag Event
		Sub Opening()
		  me.Text = str(TestField.RightMarginAtPixel)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events fieldInfo
	#tag Event
		Sub SymbolSelected(symbol as DocumentSymbol)
		  if Symbol = nil then Return
		  TestField.SelectLine(TestField.LineNumAtCharPos(symbol.Offset))
		End Sub
	#tag EndEvent
	#tag Event
		Function GetSymbols() As DocumentSymbol()
		  Return TestField.DocumentSymbols
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events dirtyLinesColor
	#tag Event
		Sub Opening()
		  me.SelectedColor = testField.DirtyLinesColor
		End Sub
	#tag EndEvent
	#tag Event
		Sub ColorChanged()
		  testField.DirtyLinesColor = me.SelectedColor
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events CheckBox10
	#tag Event
		Sub ValueChanged()
		  testField.DisplayDirtyLines = me.Value
		End Sub
	#tag EndEvent
	#tag Event
		Sub Opening()
		  me.Value = TestField.DisplayDirtyLines
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events textSelectionColor
	#tag Event
		Sub Opening()
		  me.SelectedColor = testField.TextSelectionColor
		End Sub
	#tag EndEvent
	#tag Event
		Sub ColorChanged()
		  testField.TextSelectionColor = me.SelectedColor
		  if me.SelectedColor = &c000000 then
		    me.SelectedColor = TestField.TextSelectionColor
		    me.Refresh(False)
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events TestToolbar1
	#tag Event
		Sub Pressed(item As DesktopToolbarItem)
		  select case item.Name
		  case "highlights"
		    TestField.ClearHighlightedCharacterRanges
		    
		    TestField.HighlightCharacterRange(79, 11, &c9999FF, true) //compilation
		    TestField.HighlightCharacterRange(93, 5, &c9999FF, true) //javac
		    TestField.HighlightCharacterRange(137, 9, &c9999FF, true) //quicksort
		    TestField.HighlightCharacterRange(167, 6, &c9999FF, true) //random
		    
		    //and a bunch of random ones...
		    for i as Integer = 1 to 100
		      TestField.HighlightCharacterRange( rnd * TestField.TextLength, rnd * 10, &c99FF99)
		    next
		    
		  case "reindent"
		    TestField.ReindentText
		    
		  case "AddBookmark"
		    toggleBookmark
		    
		  case "ClearBookmarks"
		    TestField.ClearBookmarks
		    reloadBookmarks
		    
		  case "TimeRefresh"
		    // Test the performance of setting and indenting the text
		    dim txt as String = TestField.Text
		    TestField.Text = ""
		    Debugging.AccumulationClear
		    dim startTime as Double = System.Microseconds
		    TestField.Text = txt
		    dim mid1Time as Double = System.Microseconds
		    TestField.ReindentText()
		    dim mid2Time as Double = System.Microseconds
		    while TestField.HighLighterTaskBusy
		      ' wait
		    wend
		    dim endTime as Double = System.Microseconds
		    dim msg as String = "This took "+Format((endTime-startTime)/1000, "#")+"ms" + EndOfLine + EndOfLine + _
		    "(SetText took "+Format((mid1Time-startTime)/1000, "#")+"ms"+")"+ EndOfLine + _
		    "(Indent took "+Format((mid2Time-mid1Time)/1000, "#")+"ms"+")"
		    Debugging.DebugLog Debugging.AccumulationResult
		    Debugging.AccumulationClear
		    MessageBox msg
		    
		  end select
		  
		  TestField.Redraw
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events CheckBox11
	#tag Event
		Sub ValueChanged()
		  testField.AutocompleteAppliesStandardCase = me.Value
		End Sub
	#tag EndEvent
	#tag Event
		Sub Opening()
		  me.Value = TestField.AutocompleteAppliesStandardCase
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events HighlightMatchingMode
	#tag Event
		Sub Opening()
		  me.SelectedRowIndex = TestField.HighlightMatchingBracketsMode
		End Sub
	#tag EndEvent
	#tag Event
		Sub SelectionChanged(item As DesktopMenuItem)
		  #Pragma Unused item
		  bracketHighlightColor.visible = CheckBox5.Value
		  TestField.HighlightMatchingBracketsMode = me.SelectedRowIndex
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events bracketHighlightColor
	#tag Event
		Sub Opening()
		  me.SelectedColor = testField.BracketHighlightColor
		End Sub
	#tag EndEvent
	#tag Event
		Sub ColorChanged()
		  testField.BracketHighlightColor = me.SelectedColor
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events bookmarks
	#tag Event
		Sub SelectionChanged()
		  if me.SelectedRowIndex < 0 then Return
		  
		  TestField.SelectLine(bookmarkIndexes(me.SelectedRowIndex))
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events frameColor
	#tag Event
		Sub Opening()
		  me.SelectedColor = testField.BorderColor
		End Sub
	#tag EndEvent
	#tag Event
		Sub ColorChanged()
		  testField.BorderColor = me.SelectedColor
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events keepFocusInTextfieldTimer
	#tag Event
		Sub Action()
		  // On Windows and Linux clicking on any of the checkbox controls will take away the focus
		  // from the textField, which is rather irritating. Therefore, this Timer will set the focus back
		  // regularly.
		  // This isn't perfect, though, as we cannot do it this way for PopupMenus, for instance, because
		  // then this code would close them as soon as the user clicks on them to open their menu.
		  // Therefore, this is just a cheap hack to keep the focus on the text as much as possible.
		  
		  #if TargetMacOS
		    // not needed on OSX
		    me.Mode = Timer.ModeOff
		    return
		  #endif
		  
		  dim focusCtrl as DesktopUIControl = self.Focus
		  if focusCtrl isA DesktopCheckBox or focusCtrl isA DesktopButton or focusCtrl isA DesktopListbox then
		    // set the focus back to the textField
		    TestField.SetFocus
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events CheckBox6
	#tag Event
		Sub ValueChanged()
		  testField.AutoIndentNewLines = me.Value
		End Sub
	#tag EndEvent
	#tag Event
		Sub Opening()
		  me.Value = TestField.AutoIndentNewLines
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events VisualindentChk
	#tag Event
		Sub ValueChanged()
		  testField.IndentVisually = me.Value
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub Opening()
		  me.Value = TestField.IndentVisually
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events KeepEntireTextIndentedChk
	#tag Event
		Sub ValueChanged()
		  testField.KeepEntireTextIndented = me.Value
		End Sub
	#tag EndEvent
	#tag Event
		Sub Opening()
		  me.Value = TestField.KeepEntireTextIndented
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events EditField3
	#tag Event
		Function KeyDown(key As String) As Boolean
		  if key = chr(13) then
		    testField.TabWidth = val(me.Text)
		  end if
		End Function
	#tag EndEvent
	#tag Event
		Sub Opening()
		  me.Text = str(TestField.TabWidth)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Button1
	#tag Event
		Sub Pressed()
		  TestField.ClearHighlightedCharacterRanges()
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
		Visible=false
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
		Group="Windows Behavior"
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
