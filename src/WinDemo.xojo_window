#tag DesktopWindow
Begin DesktopWindow WinDemo
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
   Height          =   692
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
   Width           =   1168
   Begin DesktopPagePanel Panel
      AllowAutoDeactivate=   True
      Enabled         =   True
      Height          =   692
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
      Width           =   788
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
         Top             =   658
         Transparent     =   True
         Value           =   0
         Visible         =   True
         Width           =   772
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
         Height          =   658
         Index           =   -2147483648
         InitialParent   =   "Panel"
         Left            =   772
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
      Begin SyntaxArea.EditorInfoPanel Info
         AllowAutoDeactivate=   True
         AllowFocus      =   False
         AllowFocusRing  =   False
         AllowTabs       =   False
         BackColor       =   &c00000000
         Backdrop        =   0
         BottomBorderColor=   &c00000000
         Enabled         =   True
         FontName        =   "SmallSystem"
         FontSize        =   0
         HasBottomBorder =   False
         HasLeftBorder   =   False
         HasRightBorder  =   True
         HasTopBorder    =   True
         Height          =   18
         Index           =   -2147483648
         InitialParent   =   "Panel"
         Left            =   0
         LeftBorderColor =   &c00000000
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   False
         RightBorderColor=   &c00000000
         Scope           =   1
         SelectionLength =   0
         SelectionStart  =   0
         SelectionStartLine=   0
         TabIndex        =   3
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   ""
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   674
         TopBorderColor  =   &c00000000
         Transparent     =   True
         Visible         =   True
         Width           =   788
      End
      Begin SyntaxArea.Editor CodeEditor
         AllowFocusRing  =   False
         AutoCloseBrackets=   False
         AutocompleteAppliesStandardCase=   False
         AutocompleteCombo=   1
         AutoDeactivate  =   True
         AutoIndentNewLines=   True
         BackColor       =   &cFFFFFF00
         BlockFoldedColor=   &cFF930000
         BlockFoldedEllipsisColor=   &cC0C0C000
         BlockFoldMarkerColor=   &c92929200
         BookmarkColor   =   &c0096FF00
         BorderColor     =   &c00000000
         BracketHighlightColor=   &c76D6FF00
         CaretColor      =   &c00000000
         CaretLine       =   0
         ClearHighlightedRangesOnTextChange=   True
         DirtyLinesColor =   &cFFD47900
         DisableReset    =   False
         DisplayDirtyLines=   False
         DisplayGutter   =   True
         DisplayInvisibleCharacters=   False
         DisplayVerticalRuler=   False
         EnableAutocomplete=   True
         Enabled         =   True
         FontName        =   ""
         FontSize        =   0
         GutterBackColor =   &c91919100
         GutterBorderColor=   &c00000000
         GutterWidth     =   0
         HasBottomBorder =   False
         HasLeftBorder   =   True
         HasRightBorder  =   True
         HasTopBorder    =   True
         Height          =   658
         HighlightBlocksOnMouseOverGutter=   False
         HighlightMatchingBrackets=   True
         HighlightMatchingBracketsMode=   0
         IgnoreRepaint   =   False
         IndentPixels    =   16
         Index           =   -2147483648
         InitialParent   =   "Panel"
         InvisibleCharacterColor=   &c00000000
         KeepEntireTextIndented=   True
         Left            =   0
         LeftMarginOffset=   5
         LineHeight      =   0.0
         LineNumbersColor=   &c00000000
         LineNumbersFontName=   ""
         LineNumbersFontSize=   0
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         ReadOnly        =   False
         RightMarginAtPixel=   0
         RightScrollMargin=   150
         Scope           =   0
         ScrollPosition  =   0
         ScrollPositionX =   0
         SelectionLength =   0
         SelectionText   =   ""
         SuggestionPopupBackColor=   &cFFFFFF00
         SuggestionPopupSelectedTextColor=   &c00000000
         SuggestionPopupTextColor=   &c00000000
         TabIndex        =   0
         TabPanelIndex   =   1
         TabStop         =   True
         TabWidth        =   0
         Text            =   ""
         TextHeight      =   0.0
         TextSelectionColor=   &cD783FF00
         ThickInsertionPoint=   False
         Tooltip         =   ""
         Top             =   0
         UseLighterLineFoldingBackColor=   False
         UseSystemTextSelectionColor=   True
         VerticalRulerColor=   &c00000000
         VerticalRulerPosition=   80
         Visible         =   True
         Width           =   772
      End
   End
   Begin DesktopPopupMenu PopupFontName
      AllowAutoDeactivate=   True
      Bold            =   False
      Enabled         =   True
      FontName        =   "SmallSystem"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialValue    =   ""
      Italic          =   False
      Left            =   886
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      SelectedRowIndex=   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   12
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   135
   End
   Begin DesktopLabel LabelFontName
      AllowAutoDeactivate=   True
      Bold            =   False
      Enabled         =   True
      FontName        =   "SmallSystem"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      Italic          =   False
      Left            =   816
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Font"
      TextAlignment   =   3
      TextColor       =   &c000000
      Tooltip         =   ""
      Top             =   12
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   58
   End
   Begin DesktopLabel LabelFontSize
      AllowAutoDeactivate=   True
      Bold            =   False
      Enabled         =   True
      FontName        =   "SmallSystem"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      Italic          =   False
      Left            =   1041
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Size"
      TextAlignment   =   3
      TextColor       =   &c000000
      Tooltip         =   ""
      Top             =   12
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   38
   End
   Begin DesktopTextField FontSize
      AllowAutoDeactivate=   True
      AllowFocusRing  =   True
      AllowSpellChecking=   False
      AllowTabs       =   False
      BackgroundColor =   &cFFFFFF
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
      Italic          =   False
      Left            =   1091
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      MaximumCharactersAllowed=   2
      Password        =   False
      ReadOnly        =   False
      Scope           =   0
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlignment   =   0
      TextColor       =   &c000000
      Tooltip         =   ""
      Top             =   12
      Transparent     =   False
      Underline       =   False
      ValidationMask  =   "##"
      Visible         =   True
      Width           =   32
   End
   Begin DesktopPopupMenu PopupLineNumFontName
      AllowAutoDeactivate=   True
      Bold            =   False
      Enabled         =   True
      FontName        =   "SmallSystem"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialValue    =   ""
      Italic          =   False
      Left            =   886
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      SelectedRowIndex=   0
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   37
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   135
   End
   Begin DesktopLabel LabelLineNumFontName
      AllowAutoDeactivate=   True
      Bold            =   False
      Enabled         =   True
      FontName        =   "SmallSystem"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      Italic          =   False
      Left            =   800
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Gutter Font"
      TextAlignment   =   3
      TextColor       =   &c000000
      Tooltip         =   ""
      Top             =   37
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   74
   End
   Begin DesktopLabel LabelLineNumFontSize
      AllowAutoDeactivate=   True
      Bold            =   False
      Enabled         =   True
      FontName        =   "SmallSystem"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      Italic          =   False
      Left            =   1041
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
      Text            =   "Size"
      TextAlignment   =   3
      TextColor       =   &c000000
      Tooltip         =   ""
      Top             =   37
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   38
   End
   Begin DesktopTextField LineNumFontSize
      AllowAutoDeactivate=   True
      AllowFocusRing  =   True
      AllowSpellChecking=   False
      AllowTabs       =   False
      BackgroundColor =   &cFFFFFF
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
      Italic          =   False
      Left            =   1091
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      MaximumCharactersAllowed=   2
      Password        =   False
      ReadOnly        =   False
      Scope           =   0
      TabIndex        =   8
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlignment   =   0
      TextColor       =   &c000000
      Tooltip         =   ""
      Top             =   37
      Transparent     =   False
      Underline       =   False
      ValidationMask  =   "##"
      Visible         =   True
      Width           =   32
   End
   Begin DesktopCheckBox CheckBoxTopBorder
      AllowAutoDeactivate=   True
      Bold            =   False
      Caption         =   "Top Border"
      Enabled         =   True
      FontName        =   "SmallSystem"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      Italic          =   False
      Left            =   800
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   9
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   69
      Transparent     =   False
      Underline       =   False
      Value           =   False
      Visible         =   True
      VisualState     =   1
      Width           =   107
   End
   Begin DesktopCheckBox CheckBoxBottomBorder
      AllowAutoDeactivate=   True
      Bold            =   False
      Caption         =   "Bottom Border"
      Enabled         =   True
      FontName        =   "SmallSystem"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      Italic          =   False
      Left            =   800
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   10
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   90
      Transparent     =   False
      Underline       =   False
      Value           =   False
      Visible         =   True
      VisualState     =   1
      Width           =   107
   End
   Begin DesktopCheckBox CheckBoxLeftBorder
      AllowAutoDeactivate=   True
      Bold            =   False
      Caption         =   "Left Border"
      Enabled         =   True
      FontName        =   "SmallSystem"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      Italic          =   False
      Left            =   800
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   11
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   111
      Transparent     =   False
      Underline       =   False
      Value           =   False
      Visible         =   True
      VisualState     =   1
      Width           =   107
   End
   Begin DesktopCheckBox CheckBoxRightBorder
      AllowAutoDeactivate=   True
      Bold            =   False
      Caption         =   "Right Border"
      Enabled         =   True
      FontName        =   "SmallSystem"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      Italic          =   False
      Left            =   800
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   12
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   132
      Transparent     =   False
      Underline       =   False
      Value           =   False
      Visible         =   True
      VisualState     =   1
      Width           =   107
   End
   Begin DesktopCheckBox CheckBoxVerticalRuler
      AllowAutoDeactivate=   True
      Bold            =   False
      Caption         =   "Display Vertical Ruler At"
      Enabled         =   True
      FontName        =   "SmallSystem"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      Italic          =   False
      Left            =   919
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
      Top             =   69
      Transparent     =   False
      Underline       =   False
      Value           =   False
      Visible         =   True
      VisualState     =   1
      Width           =   157
   End
   Begin DesktopTextField VerticalRulerAt
      AllowAutoDeactivate=   True
      AllowFocusRing  =   True
      AllowSpellChecking=   False
      AllowTabs       =   False
      BackgroundColor =   &cFFFFFF
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
      Italic          =   False
      Left            =   1091
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      MaximumCharactersAllowed=   2
      Password        =   False
      ReadOnly        =   False
      Scope           =   0
      TabIndex        =   15
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlignment   =   0
      TextColor       =   &c000000
      Tooltip         =   ""
      Top             =   69
      Transparent     =   False
      Underline       =   False
      ValidationMask  =   "##"
      Visible         =   True
      Width           =   32
   End
   Begin DesktopCheckBox CheckBoxDisplayGutter
      AllowAutoDeactivate=   True
      Bold            =   False
      Caption         =   "Display Gutter"
      Enabled         =   True
      FontName        =   "SmallSystem"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      Italic          =   False
      Left            =   919
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   16
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   90
      Transparent     =   False
      Underline       =   False
      Value           =   False
      Visible         =   True
      VisualState     =   1
      Width           =   110
   End
   Begin ColorPicker VerticalRulerColor
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   True
      AllowTabs       =   False
      Backdrop        =   0
      Enabled         =   True
      Height          =   18
      Index           =   -2147483648
      Left            =   1135
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
      Top             =   71
      Transparent     =   True
      Visible         =   True
      Width           =   18
   End
   Begin DesktopLabel Label1
      AllowAutoDeactivate=   True
      Bold            =   False
      Enabled         =   True
      FontName        =   "SmallSystem"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      Italic          =   False
      Left            =   919
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   18
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Gutter Colour"
      TextAlignment   =   0
      TextColor       =   &c000000
      Tooltip         =   ""
      Top             =   111
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   83
   End
   Begin ColorPicker GutterColor
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   True
      AllowTabs       =   False
      Backdrop        =   0
      Enabled         =   True
      Height          =   18
      Index           =   -2147483648
      Left            =   1027
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      SelectedColor   =   &c00000000
      TabIndex        =   19
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   111
      Transparent     =   True
      Visible         =   True
      Width           =   18
   End
   Begin DesktopLabel LabelGutterBorder
      AllowAutoDeactivate=   True
      Bold            =   False
      Enabled         =   True
      FontName        =   "SmallSystem"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      Italic          =   False
      Left            =   919
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
      Text            =   "Gutter Border"
      TextAlignment   =   0
      TextColor       =   &c000000
      Tooltip         =   ""
      Top             =   132
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   83
   End
   Begin ColorPicker GutterBorder
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   True
      AllowTabs       =   False
      Backdrop        =   0
      Enabled         =   True
      Height          =   18
      Index           =   -2147483648
      Left            =   1027
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
      Top             =   132
      Transparent     =   True
      Visible         =   True
      Width           =   18
   End
   Begin ColorPicker LineNumColor
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   True
      AllowTabs       =   False
      Backdrop        =   0
      Enabled         =   True
      Height          =   18
      Index           =   -2147483648
      Left            =   1031
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
      Top             =   37
      Transparent     =   True
      Visible         =   True
      Width           =   18
   End
   Begin ColorPicker DefaultTextColor
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   True
      AllowTabs       =   False
      Backdrop        =   0
      Enabled         =   True
      Height          =   18
      Index           =   -2147483648
      Left            =   1031
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      SelectedColor   =   &c00000000
      TabIndex        =   24
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   12
      Transparent     =   True
      Visible         =   True
      Width           =   18
   End
   Begin DesktopLabel LabelBackColor
      AllowAutoDeactivate=   True
      Bold            =   False
      Enabled         =   True
      FontName        =   "SmallSystem"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      Italic          =   False
      Left            =   800
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   25
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Back Colour"
      TextAlignment   =   0
      TextColor       =   &c000000
      Tooltip         =   ""
      Top             =   153
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   83
   End
   Begin ColorPicker BackColor
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   True
      AllowTabs       =   False
      Backdrop        =   0
      Enabled         =   True
      Height          =   18
      Index           =   -2147483648
      Left            =   893
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      SelectedColor   =   &c00000000
      TabIndex        =   26
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   153
      Transparent     =   True
      Visible         =   True
      Width           =   18
   End
   Begin DesktopLabel LabelCaretColor
      AllowAutoDeactivate=   True
      Bold            =   False
      Enabled         =   True
      FontName        =   "SmallSystem"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      Italic          =   False
      Left            =   919
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   27
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Caret Colour"
      TextAlignment   =   0
      TextColor       =   &c000000
      Tooltip         =   ""
      Top             =   153
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   83
   End
   Begin ColorPicker CaretColor
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   True
      AllowTabs       =   False
      Backdrop        =   0
      Enabled         =   True
      Height          =   18
      Index           =   -2147483648
      Left            =   1027
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      SelectedColor   =   &c00000000
      TabIndex        =   28
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   153
      Transparent     =   True
      Visible         =   True
      Width           =   18
   End
   Begin DesktopCheckBox CheckBoxThickInsertionPoint
      AllowAutoDeactivate=   True
      Bold            =   False
      Caption         =   "Thick Insertion Point"
      Enabled         =   True
      FontName        =   "SmallSystem"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      Italic          =   False
      Left            =   800
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   29
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   303
      Transparent     =   False
      Underline       =   False
      Value           =   False
      Visible         =   True
      VisualState     =   1
      Width           =   143
   End
   Begin DesktopCheckBox CheckBoxDisplayDirtyLines
      AllowAutoDeactivate=   True
      Bold            =   False
      Caption         =   "Display Dirty Lines"
      Enabled         =   True
      FontName        =   "SmallSystem"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      Italic          =   False
      Left            =   800
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   30
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   324
      Transparent     =   False
      Underline       =   False
      Value           =   False
      Visible         =   True
      VisualState     =   1
      Width           =   143
   End
   Begin DesktopLabel LabelDirtyLinesColor
      AllowAutoDeactivate=   True
      Bold            =   False
      Enabled         =   True
      FontName        =   "SmallSystem"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      Italic          =   False
      Left            =   941
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   31
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Dirty Lines Colour"
      TextAlignment   =   0
      TextColor       =   &c000000
      Tooltip         =   ""
      Top             =   324
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   103
   End
   Begin ColorPicker DirtyLinesColor
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   True
      AllowTabs       =   False
      Backdrop        =   0
      Enabled         =   True
      Height          =   18
      Index           =   -2147483648
      Left            =   1049
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      SelectedColor   =   &c00000000
      TabIndex        =   32
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   325
      Transparent     =   True
      Visible         =   True
      Width           =   18
   End
   Begin DesktopCheckBox CheckBoxHighlightMatchingBrackets
      AllowAutoDeactivate=   True
      Bold            =   False
      Caption         =   "Highlight Matching Brackets"
      Enabled         =   True
      FontName        =   "SmallSystem"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      Italic          =   False
      Left            =   800
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
      Top             =   345
      Transparent     =   False
      Underline       =   False
      Value           =   False
      Visible         =   True
      VisualState     =   1
      Width           =   179
   End
   Begin DesktopPopupMenu PopupBracketHighlightingMode
      AllowAutoDeactivate=   True
      Bold            =   False
      Enabled         =   True
      FontName        =   "SmallSystem"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialValue    =   ""
      Italic          =   False
      Left            =   988
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      SelectedRowIndex=   0
      TabIndex        =   34
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   345
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   92
   End
   Begin ColorPicker BracketHighlightColor
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   True
      AllowTabs       =   False
      Backdrop        =   0
      Enabled         =   True
      Height          =   18
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   1091
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      SelectedColor   =   &c00000000
      TabIndex        =   35
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   346
      Transparent     =   True
      Visible         =   True
      Width           =   18
   End
   Begin DesktopCheckBox CheckBoxAutoCloseBrackets
      AllowAutoDeactivate=   True
      Bold            =   False
      Caption         =   "Auto Close Brackets"
      Enabled         =   True
      FontName        =   "SmallSystem"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      Italic          =   False
      Left            =   800
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   36
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   366
      Transparent     =   False
      Underline       =   False
      Value           =   False
      Visible         =   True
      VisualState     =   1
      Width           =   143
   End
   Begin DesktopCheckBox CheckBoxEnableLineFolding
      AllowAutoDeactivate=   True
      Bold            =   False
      Caption         =   "Enable Line Folding"
      Enabled         =   True
      FontName        =   "SmallSystem"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      Italic          =   False
      Left            =   800
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   37
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   387
      Transparent     =   False
      Underline       =   False
      Value           =   False
      Visible         =   True
      VisualState     =   1
      Width           =   143
   End
   Begin DesktopCheckBox CheckBoxDisplayInvisibleCharacters
      AllowAutoDeactivate=   True
      Bold            =   False
      Caption         =   "Display Invisible Characters"
      Enabled         =   True
      FontName        =   "SmallSystem"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      Italic          =   False
      Left            =   800
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   38
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   408
      Transparent     =   False
      Underline       =   False
      Value           =   False
      Visible         =   True
      VisualState     =   1
      Width           =   179
   End
   Begin DesktopCheckBox CheckBoxEnableAutocomplete
      AllowAutoDeactivate=   True
      Bold            =   False
      Caption         =   "Enable Autocomplete"
      Enabled         =   True
      FontName        =   "SmallSystem"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      Italic          =   False
      Left            =   800
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
      Top             =   429
      Transparent     =   False
      Underline       =   False
      Value           =   False
      Visible         =   True
      VisualState     =   1
      Width           =   179
   End
   Begin ColorPicker SelectedSuggestionTextColor
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   True
      AllowTabs       =   False
      Backdrop        =   0
      Enabled         =   True
      Height          =   18
      Index           =   -2147483648
      Left            =   979
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      SelectedColor   =   &c00000000
      TabIndex        =   40
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   473
      Transparent     =   True
      Visible         =   True
      Width           =   18
   End
   Begin DesktopLabel LabelSuggestionSelectionTextColor
      AllowAutoDeactivate=   True
      Bold            =   False
      Enabled         =   True
      FontName        =   "SmallSystem"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      Italic          =   False
      Left            =   800
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   41
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Selected Suggestion Text Colour"
      TextAlignment   =   0
      TextColor       =   &c000000
      Tooltip         =   ""
      Top             =   473
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   176
   End
   Begin DesktopLabel LabelSuggestionColor
      AllowAutoDeactivate=   True
      Bold            =   False
      Enabled         =   True
      FontName        =   "SmallSystem"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      Italic          =   False
      Left            =   800
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   42
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Suggestion Colour"
      TextAlignment   =   0
      TextColor       =   &c000000
      Tooltip         =   ""
      Top             =   450
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   157
   End
   Begin ColorPicker SuggestionColor
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   True
      AllowTabs       =   False
      Backdrop        =   0
      Enabled         =   True
      Height          =   18
      Index           =   -2147483648
      Left            =   979
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      SelectedColor   =   &c00000000
      TabIndex        =   43
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   451
      Transparent     =   True
      Visible         =   True
      Width           =   18
   End
   Begin DesktopLabel LabelSuggestionPopupBackColor
      AllowAutoDeactivate=   True
      Bold            =   False
      Enabled         =   True
      FontName        =   "SmallSystem"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      Italic          =   False
      Left            =   800
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
      Text            =   "Suggestion Popup Back Colour"
      TextAlignment   =   0
      TextColor       =   &c000000
      Tooltip         =   ""
      Top             =   494
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   167
   End
   Begin ColorPicker SuggestionPopupBackColor
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   True
      AllowTabs       =   False
      Backdrop        =   0
      Enabled         =   True
      Height          =   18
      Index           =   -2147483648
      Left            =   979
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
      Top             =   495
      Transparent     =   True
      Visible         =   True
      Width           =   18
   End
   Begin ColorPicker SelectionColor
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   True
      AllowTabs       =   False
      Backdrop        =   0
      Enabled         =   True
      Height          =   18
      Index           =   -2147483648
      Left            =   895
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      SelectedColor   =   &c00000000
      TabIndex        =   46
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   281
      Transparent     =   True
      Visible         =   True
      Width           =   18
   End
   Begin DesktopLabel LabelSelectionColor
      AllowAutoDeactivate=   True
      Bold            =   False
      Enabled         =   True
      FontName        =   "SmallSystem"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      Italic          =   False
      Left            =   800
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   47
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Selection Colour"
      TextAlignment   =   0
      TextColor       =   &c000000
      Tooltip         =   ""
      Top             =   280
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   92
   End
   Begin DesktopCheckBox CheckBoxUseSystemTextSelectionColor
      AllowAutoDeactivate=   True
      Bold            =   False
      Caption         =   "Use System Selection Colour"
      Enabled         =   True
      FontName        =   "SmallSystem"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      Italic          =   False
      Left            =   919
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   48
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   280
      Transparent     =   False
      Underline       =   False
      Value           =   False
      Visible         =   True
      VisualState     =   1
      Width           =   183
   End
   Begin DesktopLabel LabelDefinition
      AllowAutoDeactivate=   True
      Bold            =   False
      Enabled         =   True
      FontName        =   "SmallSystem"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      Italic          =   False
      Left            =   800
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   49
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Definition"
      TextAlignment   =   3
      TextColor       =   &c000000
      Tooltip         =   ""
      Top             =   526
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   74
   End
   Begin DesktopPopupMenu PopupDefinition
      AllowAutoDeactivate=   True
      Bold            =   False
      Enabled         =   True
      FontName        =   "SmallSystem"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialValue    =   ""
      Italic          =   False
      Left            =   886
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
      Top             =   526
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   127
   End
   Begin DesktopLabel LabelDefinitionDetail
      AllowAutoDeactivate=   True
      Bold            =   False
      Enabled         =   True
      FontName        =   "SmallSystem"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      Italic          =   False
      Left            =   800
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   51
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Select a built-in syntax definition or load your own."
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   547
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   281
   End
   Begin DesktopButton ButtonLoadDefinition
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "Load Definition..."
      Default         =   False
      Enabled         =   True
      FontName        =   "SmallSystem"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      Italic          =   False
      Left            =   1020
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   52
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   526
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   121
   End
   Begin DesktopLabel LabelExampleText
      AllowAutoDeactivate=   True
      Bold            =   False
      Enabled         =   True
      FontName        =   "SmallSystem"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      Italic          =   False
      Left            =   800
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   53
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Example Text"
      TextAlignment   =   3
      TextColor       =   &c000000
      Tooltip         =   ""
      Top             =   579
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   74
   End
   Begin DesktopPopupMenu PopupExampleText
      AllowAutoDeactivate=   True
      Bold            =   False
      Enabled         =   True
      FontName        =   "SmallSystem"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialValue    =   ""
      Italic          =   False
      Left            =   886
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      SelectedRowIndex=   0
      TabIndex        =   54
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   579
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   127
   End
   Begin DesktopLabel LabelBorderColor
      AllowAutoDeactivate=   True
      Bold            =   False
      Enabled         =   True
      FontName        =   "SmallSystem"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      Italic          =   False
      Left            =   800
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   55
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Border Colour"
      TextAlignment   =   0
      TextColor       =   &c000000
      Tooltip         =   ""
      Top             =   175
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   83
   End
   Begin ColorPicker BorderColor
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   True
      AllowTabs       =   False
      Backdrop        =   0
      Enabled         =   True
      Height          =   18
      Index           =   -2147483648
      Left            =   893
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      SelectedColor   =   &c00000000
      TabIndex        =   56
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   175
      Transparent     =   True
      Visible         =   True
      Width           =   18
   End
   Begin DesktopLabel LabelInfoTopBorderColor
      AllowAutoDeactivate=   True
      Bold            =   False
      Enabled         =   True
      FontName        =   "SmallSystem"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      Italic          =   False
      Left            =   937
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   57
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Info Top Border Colour"
      TextAlignment   =   0
      TextColor       =   &c000000
      Tooltip         =   ""
      Top             =   196
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   135
   End
   Begin ColorPicker InfoTopBorderColor
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   True
      AllowTabs       =   False
      Backdrop        =   0
      Enabled         =   True
      Height          =   18
      Index           =   -2147483648
      Left            =   1087
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      SelectedColor   =   &c00000000
      TabIndex        =   58
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   196
      Transparent     =   True
      Visible         =   True
      Width           =   18
   End
   Begin DesktopCheckBox CheckBoxInfoBottomBorder
      AllowAutoDeactivate=   True
      Bold            =   False
      Caption         =   "Info Bottom Border"
      Enabled         =   True
      FontName        =   "SmallSystem"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      Italic          =   False
      Left            =   800
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   59
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   217
      Transparent     =   False
      Underline       =   False
      Value           =   False
      Visible         =   True
      VisualState     =   0
      Width           =   129
   End
   Begin DesktopCheckBox CheckBoxInfoLeftBorder
      AllowAutoDeactivate=   True
      Bold            =   False
      Caption         =   "Info Left Border"
      Enabled         =   True
      FontName        =   "SmallSystem"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      Italic          =   False
      Left            =   800
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   60
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   238
      Transparent     =   False
      Underline       =   False
      Value           =   False
      Visible         =   True
      VisualState     =   0
      Width           =   129
   End
   Begin DesktopCheckBox CheckBoxInfoRightBorder
      AllowAutoDeactivate=   True
      Bold            =   False
      Caption         =   "Info Right Border"
      Enabled         =   True
      FontName        =   "SmallSystem"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      Italic          =   False
      Left            =   800
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   61
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   259
      Transparent     =   False
      Underline       =   False
      Value           =   False
      Visible         =   True
      VisualState     =   1
      Width           =   129
   End
   Begin DesktopCheckBox CheckBoxInfoTopBorder
      AllowAutoDeactivate=   True
      Bold            =   False
      Caption         =   "Info Top Border"
      Enabled         =   True
      FontName        =   "SmallSystem"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      Italic          =   False
      Left            =   800
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   62
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   196
      Transparent     =   False
      Underline       =   False
      Value           =   False
      Visible         =   True
      VisualState     =   1
      Width           =   129
   End
   Begin ColorPicker InfoBottomBorderColor
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   True
      AllowTabs       =   False
      Backdrop        =   0
      Enabled         =   True
      Height          =   18
      Index           =   -2147483648
      Left            =   1087
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      SelectedColor   =   &c00000000
      TabIndex        =   63
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   217
      Transparent     =   True
      Visible         =   True
      Width           =   18
   End
   Begin DesktopLabel LabelInfoBottomBorderColor
      AllowAutoDeactivate=   True
      Bold            =   False
      Enabled         =   True
      FontName        =   "SmallSystem"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      Italic          =   False
      Left            =   937
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   64
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Info Bottom Border Colour"
      TextAlignment   =   0
      TextColor       =   &c000000
      Tooltip         =   ""
      Top             =   217
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   145
   End
   Begin DesktopLabel LabelInfoLeftBorderColor
      AllowAutoDeactivate=   True
      Bold            =   False
      Enabled         =   True
      FontName        =   "SmallSystem"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      Italic          =   False
      Left            =   937
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   65
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Info Left Border Colour"
      TextAlignment   =   0
      TextColor       =   &c000000
      Tooltip         =   ""
      Top             =   238
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   135
   End
   Begin DesktopLabel LabelInfoRightBorderColor
      AllowAutoDeactivate=   True
      Bold            =   False
      Enabled         =   True
      FontName        =   "SmallSystem"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      Italic          =   False
      Left            =   937
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   66
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Info Right Border Colour"
      TextAlignment   =   0
      TextColor       =   &c000000
      Tooltip         =   ""
      Top             =   259
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   145
   End
   Begin ColorPicker InfoRightBorderColor
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   True
      AllowTabs       =   False
      Backdrop        =   0
      Enabled         =   True
      Height          =   18
      Index           =   -2147483648
      Left            =   1087
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      SelectedColor   =   &c00000000
      TabIndex        =   67
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   259
      Transparent     =   True
      Visible         =   True
      Width           =   18
   End
   Begin ColorPicker InfoLeftBorderColor
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   True
      AllowTabs       =   False
      Backdrop        =   0
      Enabled         =   True
      Height          =   18
      Index           =   -2147483648
      Left            =   1087
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      SelectedColor   =   &c00000000
      TabIndex        =   68
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   238
      Transparent     =   True
      Visible         =   True
      Width           =   18
   End
   Begin DesktopButton ButtonLoadTheme
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "Load Theme..."
      Default         =   False
      Enabled         =   True
      FontName        =   "SmallSystem"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      Italic          =   False
      Left            =   1020
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   69
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   611
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   121
   End
   Begin DesktopLabel LabelTheme
      AllowAutoDeactivate=   True
      Bold            =   False
      Enabled         =   True
      FontName        =   "SmallSystem"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      Italic          =   False
      Left            =   800
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   70
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Theme"
      TextAlignment   =   3
      TextColor       =   &c000000
      Tooltip         =   ""
      Top             =   611
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   74
   End
   Begin DesktopLabel LabelThemeDetail
      AllowAutoDeactivate=   True
      Bold            =   False
      Enabled         =   True
      FontName        =   "SmallSystem"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      Italic          =   False
      Left            =   800
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   71
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Select a built-in theme or load your own."
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   632
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   281
   End
   Begin DesktopPopupMenu PopupTheme
      AllowAutoDeactivate=   True
      Bold            =   False
      Enabled         =   True
      FontName        =   "SmallSystem"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialValue    =   ""
      Italic          =   False
      Left            =   886
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      SelectedRowIndex=   0
      TabIndex        =   72
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   611
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   127
   End
   Begin DesktopButton ButtonExportTheme
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "Export Theme..."
      Default         =   False
      Enabled         =   True
      FontName        =   "SmallSystem"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      Italic          =   False
      Left            =   1020
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   73
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   643
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   121
   End
End
#tag EndDesktopWindow

#tag WindowCode
	#tag Event
		Sub MenuBarSelected()
		  // Undo.
		  EditUndo.Enabled = App.UndoManager.CanUndo
		  If App.UndoManager.CanUndo Then
		    Var action As UndoKit.UndoableAction = App.UndoManager.NextUndo
		    EditUndo.Text = "Undo" + If(action.Description = "", "", " " + action.Description)
		  Else
		    EditUndo.Text = "Undo"
		  End If
		  
		  // Redo.
		  EditRedo.Enabled = App.UndoManager.CanRedo
		  If App.UndoManager.CanRedo Then
		    Var action As UndoKit.UndoableAction = App.UndoManager.NextRedo
		    EditRedo.Text = "Redo" + If(action.Description = "", "", " " + action.Description)
		  Else
		    EditRedo.Text = "Redo"
		  End If
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Opening()
		  // Enable line foldings if the definition supports them.
		  CodeEditor.EnableLineFolding = CodeEditor.SyntaxDefinition.SupportsCodeBlocks
		  
		  // Give the editor a bottom border on Windows.
		  #If TargetMacOS
		    CodeEditor.HasBottomBorder = False
		  #Else
		    CodeEditor.HasBottomBorder = True
		  #EndIf
		  
		  // Setup up our simple demonstration autocomplete engine.
		  InitialiseAutocompleteEngine
		  
		  // Manually call the `AppearanceChanged` event which will load the correct theme.
		  AppearanceChanged(True)
		  
		  // Initialise the info panel border separately.
		  InfoTopBorderColor.SelectedColor = CodeEditor.BorderColor
		  InfoBottomBorderColor.SelectedColor = CodeEditor.BorderColor
		  InfoLeftBorderColor.SelectedColor = CodeEditor.BorderColor
		  InfoRightBorderColor.SelectedColor = CodeEditor.BorderColor
		  
		  // Force the editor to update to reflect all these changes.
		  CodeEditor.MarkAllLinesAsChanged
		  
		  // Clear the undo manager since we don't want the user to be able to undo the example text insertion.
		  App.UndoManager.Reset
		  
		  // Ensure the editor has the focus.
		  CodeEditor.SetFocus
		  
		  mFinishedInitialising = True
		  
		End Sub
	#tag EndEvent


	#tag MenuHandler
		Function CodeFoldingFoldAll() As Boolean Handles CodeFoldingFoldAll.Action
		  CodeEditor.FoldAll
		  
		  Return True
		  
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function CodeFoldingFoldCurrentBlock() As Boolean Handles CodeFoldingFoldCurrentBlock.Action
		  CodeEditor.FoldBlockAtCaretPosition
		  
		  Return True
		  
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function CodeFoldingUnfoldAll() As Boolean Handles CodeFoldingUnfoldAll.Action
		  CodeEditor.UnfoldAll
		  
		  Return True
		  
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function EditRedo() As Boolean Handles EditRedo.Action
		  If CodeEditor.CanRedo Then CodeEditor.Redo
		  
		  Return True
		  
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function EditUndo() As Boolean Handles EditUndo.Action
		  If CodeEditor.CanUndo Then CodeEditor.Undo
		  
		  Return True
		  
		End Function
	#tag EndMenuHandler


	#tag Method, Flags = &h0, Description = 54686520617070277320617070656172616E636520686173206368616E6765642028652E672E206120737769746368206265747765656E206C696768742F6461726B206D6F6465292E
		Sub AppearanceChanged(alsoInitialiseControls As Boolean = False)
		  /// The app's appearance has changed (e.g. a switch between light/dark mode).
		  ///
		  /// We'll switch the current theme to one of the bundled ones. Note that this will 
		  /// undo any changes the user has made to the current colour scheme.
		  
		  If Color.IsDarkMode Then
		    // Get the correct bundled theme.
		    Var themeFile As FolderItem = SpecialFolder.Resource("Nova Dark.json")
		    Var theme As SyntaxArea.EditorTheme = SyntaxArea.EditorTheme.FromFile(themeFile)
		    CodeEditor.LoadTheme(theme)
		  Else
		    Var themeFile As FolderItem = SpecialFolder.Resource("Nova Light.json")
		    Var theme As SyntaxArea.EditorTheme = SyntaxArea.EditorTheme.FromFile(themeFile)
		    CodeEditor.LoadTheme(theme)
		  End If
		  
		  If alsoInitialiseControls Then
		    InitialiseControls
		  Else
		    // The controls have already been initialised but they need updating.
		    UpdateControls
		  End If
		  
		  // Force the editor to update and re-highlight.
		  CodeEditor.MarkAllLinesAsChanged
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub InitialiseAutocompleteEngine()
		  /// Initialises our basic autocomplete engine for Xojo keywords.
		  ///
		  /// You'll likely want to create a better one...
		  
		  MyAutocompleteEngine = New AutocompleteEngine(False)
		  
		  MyAutocompleteEngine.AddOption("#Else")
		  MyAutocompleteEngine.AddOption("#ElseIf")
		  MyAutocompleteEngine.AddOption("#End")
		  MyAutocompleteEngine.AddOption("#If")
		  MyAutocompleteEngine.AddOption("#Pragma")
		  MyAutocompleteEngine.AddOption("AddHandler")
		  MyAutocompleteEngine.AddOption("AddressOf")
		  MyAutocompleteEngine.AddOption("And")
		  MyAutocompleteEngine.AddOption("Array")
		  MyAutocompleteEngine.AddOption("As")
		  MyAutocompleteEngine.AddOption("Assigns")
		  MyAutocompleteEngine.AddOption("Break")
		  MyAutocompleteEngine.AddOption("ByRef")
		  MyAutocompleteEngine.AddOption("ByVal")
		  MyAutocompleteEngine.AddOption("Call")
		  MyAutocompleteEngine.AddOption("Case")
		  MyAutocompleteEngine.AddOption("Class")
		  MyAutocompleteEngine.AddOption("Const")
		  MyAutocompleteEngine.AddOption("Continue")
		  MyAutocompleteEngine.AddOption("CType")
		  MyAutocompleteEngine.AddOption("Declare")
		  MyAutocompleteEngine.AddOption("Delegate")
		  MyAutocompleteEngine.AddOption("Dim")
		  MyAutocompleteEngine.AddOption("Do")
		  MyAutocompleteEngine.AddOption("DownTo")
		  MyAutocompleteEngine.AddOption("Each")
		  MyAutocompleteEngine.AddOption("Else")
		  MyAutocompleteEngine.AddOption("ElseIf")
		  MyAutocompleteEngine.AddOption("End")
		  MyAutocompleteEngine.AddOption("Enum")
		  MyAutocompleteEngine.AddOption("Event")
		  MyAutocompleteEngine.AddOption("Exception")
		  MyAutocompleteEngine.AddOption("Exit")
		  MyAutocompleteEngine.AddOption("Extends")
		  MyAutocompleteEngine.AddOption("False")
		  MyAutocompleteEngine.AddOption("Finally")
		  MyAutocompleteEngine.AddOption("For")
		  MyAutocompleteEngine.AddOption("Function")
		  MyAutocompleteEngine.AddOption("Global")
		  MyAutocompleteEngine.AddOption("Goto")
		  MyAutocompleteEngine.AddOption("If")
		  MyAutocompleteEngine.AddOption("Implements")
		  MyAutocompleteEngine.AddOption("In")
		  MyAutocompleteEngine.AddOption("Inherits")
		  MyAutocompleteEngine.AddOption("Interface")
		  MyAutocompleteEngine.AddOption("Is")
		  MyAutocompleteEngine.AddOption("IsA")
		  MyAutocompleteEngine.AddOption("Lib")
		  MyAutocompleteEngine.AddOption("Loop")
		  MyAutocompleteEngine.AddOption("Me")
		  MyAutocompleteEngine.AddOption("Mod")
		  MyAutocompleteEngine.AddOption("Module")
		  MyAutocompleteEngine.AddOption("New")
		  MyAutocompleteEngine.AddOption("Next")
		  MyAutocompleteEngine.AddOption("Nil")
		  MyAutocompleteEngine.AddOption("Not")
		  MyAutocompleteEngine.AddOption("Object")
		  MyAutocompleteEngine.AddOption("Optional")
		  MyAutocompleteEngine.AddOption("Or")
		  MyAutocompleteEngine.AddOption("ParamArray")
		  MyAutocompleteEngine.AddOption("Private")
		  MyAutocompleteEngine.AddOption("Property")
		  MyAutocompleteEngine.AddOption("Protected")
		  MyAutocompleteEngine.AddOption("Public")
		  MyAutocompleteEngine.AddOption("Raise")
		  MyAutocompleteEngine.AddOption("RaiseEvent")
		  MyAutocompleteEngine.AddOption("Redim")
		  MyAutocompleteEngine.AddOption("Rem")
		  MyAutocompleteEngine.AddOption("RemoveHandler")
		  MyAutocompleteEngine.AddOption("Return")
		  MyAutocompleteEngine.AddOption("Select")
		  MyAutocompleteEngine.AddOption("Self")
		  MyAutocompleteEngine.AddOption("Shared")
		  MyAutocompleteEngine.AddOption("Static")
		  MyAutocompleteEngine.AddOption("Step")
		  MyAutocompleteEngine.AddOption("Structure")
		  MyAutocompleteEngine.AddOption("Sub")
		  MyAutocompleteEngine.AddOption("Super")
		  MyAutocompleteEngine.AddOption("Then")
		  MyAutocompleteEngine.AddOption("To")
		  MyAutocompleteEngine.AddOption("Try")
		  MyAutocompleteEngine.AddOption("Until")
		  MyAutocompleteEngine.AddOption("Using")
		  MyAutocompleteEngine.AddOption("Var")
		  MyAutocompleteEngine.AddOption("WeakAddressOf")
		  MyAutocompleteEngine.AddOption("Wend")
		  MyAutocompleteEngine.AddOption("With")
		  MyAutocompleteEngine.AddOption("Xor")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21, Description = 496E697469616C6973657320616C6C206F662074686520636F6E74726F6C7320746F206D617463682074686520696E697469616C2073657474696E6773206F662074686520636F646520656469746F722E
		Private Sub InitialiseControls()
		  /// Initialises all of the controls to match the initial settings of the code editor.
		  
		  // Font name.
		  For i As Integer = 0 to PopupFontName.LastRowIndex
		    If PopupFontName.RowValueAt(i) = CodeEditor.FontName Then
		      PopupFontName.SelectedRowIndex = i
		      Exit
		    End If
		  Next i
		  
		  // Font size and default colour.
		  FontSize.Text = CodeEditor.FontSize.ToString
		  DefaultTextColor.SelectedColor = CodeEditor.TextColor
		  
		  // Line numbers font name.
		  For i As Integer = 0 to PopupFontName.LastRowIndex
		    If PopupLineNumFontName.RowValueAt(i) = CodeEditor.LineNumbersFontName Then
		      PopupLineNumFontName.SelectedRowIndex = i
		      Exit
		    End If
		  Next i
		  
		  // Line number font size and colour.
		  LineNumFontSize.Text = CodeEditor.LineNumbersFontSize.ToString
		  LineNumColor.SelectedColor = CodeEditor.LineNumbersColor
		  
		  // Borders.
		  CheckBoxTopBorder.Value = CodeEditor.HasTopBorder
		  CheckBoxBottomBorder.Value = CodeEditor.HasBottomBorder
		  CheckBoxLeftBorder.Value = CodeEditor.HasLeftBorder
		  CheckBoxRightBorder.Value = CodeEditor.HasRightBorder
		  BorderColor.SelectedColor = CodeEditor.BorderColor
		  
		  // Ruler.
		  CheckBoxVerticalRuler.Value = CodeEditor.DisplayVerticalRuler
		  VerticalRulerAt.Text = CodeEditor.VerticalRulerPosition.ToString
		  VerticalRulerColor.SelectedColor = CodeEditor.VerticalRulerColor
		  
		  // Gutter.
		  CheckBoxDisplayGutter.Value = CodeEditor.DisplayGutter
		  GutterColor.SelectedColor = CodeEditor.GutterBackColor
		  GutterBorder.SelectedColor = CodeEditor.GutterBorderColor
		  
		  // Editor background colour.
		  BackColor.SelectedColor = CodeEditor.BackColor
		  
		  // Caret.
		  CaretColor.SelectedColor = CodeEditor.CaretColor
		  CheckBoxThickInsertionPoint.Value = CodeEditor.ThickInsertionPoint
		  
		  // Dirty lines.
		  CheckBoxDisplayDirtyLines.Value = CodeEditor.DisplayDirtyLines
		  DirtyLinesColor.SelectedColor = CodeEditor.DirtyLinesColor
		  
		  // Brackets.
		  CheckBoxHighlightMatchingBrackets.Value = CodeEditor.HighlightMatchingBrackets
		  BracketHighlightColor.SelectedColor = CodeEditor.BracketHighlightColor
		  CheckBoxAutoCloseBrackets.Value = CodeEditor.AutoCloseBrackets
		  
		  // Line folding.
		  CheckBoxEnableLineFolding.Value = CodeEditor.EnableLineFolding
		  
		  // Invisible characters.
		  CheckBoxDisplayInvisibleCharacters.Value = CodeEditor.DisplayInvisibleCharacters
		  
		  // Text selection colour.
		  SelectionColor.SelectedColor = CodeEditor.TextSelectionColor
		  CheckBoxUseSystemTextSelectionColor.Value = CodeEditor.UseSystemTextSelectionColor
		  
		  // Autocomplete.
		  CheckBoxEnableAutocomplete.Value = CodeEditor.EnableAutocomplete
		  SuggestionColor.SelectedColor = CodeEditor.SuggestionPopupTextColor
		  SelectedSuggestionTextColor.SelectedColor = CodeEditor.SuggestionPopupSelectedTextColor
		  SuggestionPopupBackColor.SelectedColor = CodeEditor.SuggestionPopupBackColor
		  
		  // Syntax definition.
		  For i As Integer = 0 To PopupDefinition.LastRowIndex
		    If PopupDefinition.RowValueAt(i) = CodeEditor.SyntaxDefinition.Name Then
		      PopupDefinition.SelectedRowIndex = i
		      Exit
		    End If
		  Next i
		  
		  // Themes.
		  PopupTheme.SelectedRowIndex = -1
		  For i As Integer = 0 To PopupTheme.LastRowIndex
		    If Color.IsDarkMode And PopupTheme.RowValueAt(i) = "Nova Dark" Then
		      PopupTheme.SelectedRowIndex = i
		      Exit
		    ElseIf Not Color.IsDarkMode And PopupTheme.RowValueAt(i) = "Nova Light" Then
		      PopupTheme.SelectedRowIndex = i
		      Exit
		    End If
		  Next i
		  
		  // ===========
		  // Info panel.
		  // ===========
		  InfoTopBorderColor.SelectedColor = DefaultTextColor.SelectedColor
		  Info.TopBorderColor = InfoTopBorderColor.SelectedColor
		  CheckBoxInfoTopBorder.Value = Info.HasTopBorder
		  Info.BottomBorderColor = InfoBottomBorderColor.SelectedColor
		  CheckBoxInfoBottomBorder.Value = Info.HasBottomBorder
		  Info.LeftBorderColor = InfoLeftBorderColor.SelectedColor
		  CheckBoxInfoLeftBorder.Value = Info.HasLeftBorder
		  Info.RightBorderColor = InfoRightBorderColor.SelectedColor
		  CheckBoxInfoRightBorder.Value = Info.HasRightBorder
		  Info.TextColor = DefaultTextColor.SelectedColor
		  Info.BackColor = BackColor.SelectedColor
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21, Description = 5570646174657320616C6C206F662074686520636F6E74726F6C7320746F206D61746368207468652073657474696E6773206F662074686520636F646520656469746F722E
		Private Sub UpdateControls()
		  /// Updates all of the controls to match the settings of the code editor.
		  
		  // Default text colour.
		  DefaultTextColor.SelectedColor = CodeEditor.TextColor
		  
		  // Line number colour.
		  LineNumColor.SelectedColor = CodeEditor.LineNumbersColor
		  
		  // Editor border colour.
		  BorderColor.SelectedColor = CodeEditor.BorderColor
		  
		  // Vertical ruler.
		  VerticalRulerColor.SelectedColor = CodeEditor.VerticalRulerColor
		  
		  // Gutter.
		  GutterColor.SelectedColor = CodeEditor.GutterBackColor
		  GutterBorder.SelectedColor = CodeEditor.GutterBorderColor
		  
		  // Editor background colour.
		  BackColor.SelectedColor = CodeEditor.BackColor
		  
		  // Caret.
		  CaretColor.SelectedColor = CodeEditor.CaretColor
		  
		  // Dirty lines.
		  DirtyLinesColor.SelectedColor = CodeEditor.DirtyLinesColor
		  
		  // Brackets.
		  BracketHighlightColor.SelectedColor = CodeEditor.BracketHighlightColor
		  
		  // Text selection colour.
		  SelectionColor.SelectedColor = CodeEditor.TextSelectionColor
		  
		  // Autocomplete.
		  SuggestionColor.SelectedColor = CodeEditor.SuggestionPopupTextColor
		  SelectedSuggestionTextColor.SelectedColor = CodeEditor.SuggestionPopupSelectedTextColor
		  SuggestionPopupBackColor.SelectedColor = CodeEditor.SuggestionPopupBackColor
		  
		  // Since this method is called when something changes, it's possible that the 
		  // syntax definition changed. In that case, check that the definition still
		  // supports code blocks.
		  CheckBoxEnableLineFolding.Value = _
		  CheckBoxEnableLineFolding.Value And CodeEditor.SyntaxDefinition.SupportsCodeBlocks
		  
		  // ===========
		  // Info panel.
		  // ===========
		  InfoTopBorderColor.SelectedColor = DefaultTextColor.SelectedColor
		  Info.TopBorderColor = InfoTopBorderColor.SelectedColor
		  Info.BottomBorderColor = InfoBottomBorderColor.SelectedColor
		  Info.LeftBorderColor = InfoLeftBorderColor.SelectedColor
		  Info.RightBorderColor = InfoRightBorderColor.SelectedColor
		  Info.TextColor = DefaultTextColor.SelectedColor
		  Info.BackColor = BackColor.SelectedColor
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21, Description = 4361636865732074686520696E646578206F6620746865206C696E65207468617420776173206C61737420616666656374656420627920612073656C656374696F6E206368616E676564206576656E742E
		Private LastSelectionChangedLine As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mFinishedInitialising As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h0
		MyAutocompleteEngine As AutocompleteEngine
	#tag EndProperty


	#tag Constant, Name = EXAMPLE_C, Type = String, Dynamic = False, Default = \"#include \"rv.h\"\n\n#include <assert.h>\n#include <stdarg.h>\n#include <string.h>\n\n#define RV_RESET_VEC 0x80000000 /* CPU reset vector */\n\n#if RV_VERBOSE\n#include <stdio.h>\n#define rv_dbg printf\n#else\nvoid rv_dbg(const char *fmt\x2C ...) {\n  (void)fmt;\n  return;\n}\n#endif\n\nvoid rv_init(rv *cpu\x2C void *user\x2C rv_load_cb load_cb\x2C rv_store_cb store_cb) {\n  cpu->user \x3D user;\n  cpu->load_cb \x3D load_cb;\n  cpu->store_cb \x3D store_cb;\n  cpu->pc \x3D RV_RESET_VEC;\n  memset(cpu->r\x2C 0\x2C sizeof(cpu->r));\n  memset(&cpu->csrs\x2C 0\x2C sizeof(cpu->csrs));\n}\n\nrv_res rv_lb(rv *cpu\x2C rv_u32 addr\x2C rv_u8 *data) { /* load byte */\n  return cpu->load_cb(cpu->user\x2C addr\x2C data);\n}\n\nrv_res rv_lh(rv *cpu\x2C rv_u32 addr\x2C rv_u16 *data) { /* load half */\n  return rv_lb(cpu\x2C addr\x2C (rv_u8 *)data) ||\n         rv_lb(cpu\x2C addr + 1\x2C ((rv_u8 *)data) + 1);\n}\n\nrv_res rv_lw(rv *cpu\x2C rv_u32 addr\x2C rv_u32 *data) { /* load word */\n  return rv_lh(cpu\x2C addr\x2C (rv_u16 *)data) ||\n         rv_lh(cpu\x2C addr + 2\x2C ((rv_u16 *)data) + 1);\n}\n\nrv_res rv_sb(rv *cpu\x2C rv_u32 addr\x2C rv_u8 data) { /* store byte */\n  return cpu->store_cb(cpu->user\x2C addr\x2C data);\n}\n\nrv_res rv_sh(rv *cpu\x2C rv_u32 addr\x2C rv_u16 data) { /* store half */\n  return rv_sb(cpu\x2C addr\x2C data & 0xFF) || rv_sb(cpu\x2C addr + 1\x2C data >> 8);\n}\n\nrv_res rv_sw(rv *cpu\x2C rv_u32 addr\x2C rv_u32 data) { /* store word */\n  return rv_sh(cpu\x2C addr\x2C data & 0xFFFF) || rv_sh(cpu\x2C addr + 2\x2C data >> 16);\n}\n\nrv_u32 rv_signext(rv_u32 x\x2C rv_u32 h) { /* sign-extend x from h\'th bit */\n  return (0 - (x >> h)) << h | x;\n}\n\n#define RV_SBIT 0x80000000                  /* sign bit */\n#define rv_sgn(x) (!!((rv_u32)(x)&RV_SBIT)) /* extract sign */\n\n/* compute overflow */\n#define rv_ovf(a\x2C b\x2C y) ((((a) ^ (b)) & RV_SBIT) && (((y) ^ (a)) & RV_SBIT))\n\n#define rv_bf(i\x2C h\x2C l)                                                         \\\n  (((i) >> (l)) & ((1 << ((h) - (l) + 1)) - 1))    /* extract bit field */\n#define rv_b(i\x2C l) rv_bf(i\x2C l\x2C l)                  /* extract bit */\n#define rv_tb(i\x2C l\x2C o) (rv_b(i\x2C l) << (o))         /* translate bit */\n#define rv_tbf(i\x2C h\x2C l\x2C o) (rv_bf(i\x2C h\x2C l) << (o)) /* translate bit field */\n\n/* instruction field macros */\n#define rv_ioph(i) rv_bf(i\x2C 6\x2C 5)                     /* [h]i bits of opcode */\n#define rv_iopl(i) rv_bf(i\x2C 4\x2C 2)                     /* [l]o bits of opcode */\n#define rv_if3(i) rv_bf(i\x2C 14\x2C 12)                    /* funct3 */\n#define rv_if7(i) rv_bf(i\x2C 31\x2C 25)                    /* funct7 */\n#define rv_ird(i) rv_bf(i\x2C 11\x2C 7)                     /* rd */\n#define rv_irs1(i) rv_bf(i\x2C 19\x2C 15)                   /* rs1 */\n#define rv_irs2(i) rv_bf(i\x2C 24\x2C 20)                   /* rs2 */\n#define rv_iimm_i(i) rv_signext(rv_bf(i\x2C 31\x2C 20)\x2C 11) /* imm. for I-type */\n#define rv_iimm_iu(i) rv_bf(i\x2C 31\x2C 20) /* zero-ext\'d. imm. for I-type */\n#define rv_iimm_s(i)                                                           \\\n  (rv_signext(rv_tbf(i\x2C 31\x2C 25\x2C 5)\x2C 11) | rv_tbf(i\x2C 30\x2C 25\x2C 5) |               \\\n   rv_bf(i\x2C 11\x2C 7))                        /* imm. for S-type */\n#define rv_iimm_u(i) rv_tbf(i\x2C 31\x2C 12\x2C 12) /* imm. for U-type */\n#define rv_iimm_b(i)                                                           \\\n  (rv_signext(rv_tb(i\x2C 31\x2C 12)\x2C 12) | rv_tb(i\x2C 7\x2C 11) | rv_tbf(i\x2C 30\x2C 25\x2C 5) | \\\n   rv_tbf(i\x2C 11\x2C 8\x2C 1)) /* imm. for B-type */\n#define rv_iimm_j(i)                                                           \\\n  (rv_signext(rv_tb(i\x2C 31\x2C 20)\x2C 20) | rv_tbf(i\x2C 19\x2C 12\x2C 12) |                  \\\n   rv_tb(i\x2C 20\x2C 11) | rv_tbf(i\x2C 30\x2C 21\x2C 1))     /* imm. for J-type */\n#define rv_isz(i) (rv_bf(i\x2C 1\x2C 0) \x3D\x3D 3 \? 4 : 2) /* instruction size */\n\nrv_u32 rv_lr(rv *cpu\x2C rv_u8 i) { /* load register */\n  return cpu->r[i];\n}\n\nvoid rv_sr(rv *cpu\x2C rv_u8 i\x2C rv_u32 v) { /* store register */\n  cpu->r[i] \x3D i \? v : 0;\n}\n\nrv_res rv_csr(rv *cpu\x2C rv_u32 csr\x2C rv_u32 v\x2C int w\x2C rv_u32 *out) { /* csr op */\n  rv_u32 *y /* output */\x2C mask \x3D (rv_u32)-1; /* all ones */\n  if (csr \x3D\x3D 0xF14) {                        /*C mhartid */\n    y \x3D &cpu->csrs.mhartid\x2C mask \x3D 0;\n  } else if (csr \x3D\x3D 0x305) { /*C mtvec */\n    y \x3D &cpu->csrs.mtvec;\n  } else if (csr \x3D\x3D 0x304) { /*C mie */\n    y \x3D &cpu->csrs.mie;\n  } else if (csr \x3D\x3D 0x300) { /*C mstatus */\n    y \x3D &cpu->csrs.mstatus\x2C mask \x3D 0x807FF615;\n  } else if (csr \x3D\x3D 0x310) { /*C mstatush */\n    y \x3D &cpu->csrs.mstatush\x2C mask \x3D 0x00000030;\n  } else if (csr \x3D\x3D 0x341) { /*C mepc */\n    y \x3D &cpu->csrs.mepc;\n  } else if (csr \x3D\x3D 0x342) { /*C mcause */\n    y \x3D &cpu->csrs.mcause;\n  } else\n    return RV_BAD;\n  *out \x3D *y;\n  if (w && !mask) /* attempt to write to read-only reg */\n    return RV_BAD;\n  if (w) /* write relevant bits in v to p */\n    *y \x3D (*y & ~mask) | (v & mask);\n  return RV_OK;\n}\n\nrv_res rv_scsr(rv *cpu\x2C rv_u32 csr\x2C rv_u32 v\x2C rv_u32 *out) { /* store csr */\n  rv_dbg(\"(SCSR) %04X <- %08X\\n\"\x2C csr\x2C v);\n  return rv_csr(cpu\x2C csr\x2C v\x2C 1 /* write */\x2C out);\n}\n\nrv_res rv_lcsr(rv *cpu\x2C rv_u32 csr\x2C rv_u32 *out) { /* load csr */\n  rv_dbg(\"(LCSR) %04X\\n\"\x2C csr);\n  return rv_csr(cpu\x2C csr\x2C 0\x2C 0 /* read */\x2C out);\n}\n\nrv_u32 rv_except(rv *cpu\x2C rv_u32 cause) { /* set exception state */\n  /* if mtvec[0]\x2C return 4 * cause + mtvec\x2C otherwise just return mtvec */\n  cpu->pc \x3D ~(~cpu->csrs.mtvec | 1) + 4 * (cause - 1) * (cpu->csrs.mtvec & 1);\n  return cause;\n}\n\n#ifdef RVM\n\n#define rvm_lo(w) ((w) & (rv_u32)0xFFFFU) /* low 16 bits of 32-bit word */\n#define rvm_hi(w) ((w) >> 16)             /* high 16 bits of 32-bit word */\n\nrv_u32 rvm_ahh(rv_u32 a\x2C rv_u32 b\x2C rv_u32 cin\x2C rv_u32 *cout) { /* adc 16 bit */\n  rv_u32 sum \x3D a + b + cin; /* cin must be less than 2. */\n  *cout \x3D rvm_hi(sum);\n  return rvm_lo(sum);\n}\n\nrv_u32 rvm_mhh(rv_u32 a\x2C rv_u32 b\x2C rv_u32 *cout) { /* mul 16 bit */\n  rv_u32 prod \x3D a * b;\n  *cout \x3D rvm_hi(prod);\n  return rvm_lo(prod);\n}\n\nrv_u32 rvm(rv_u32 a\x2C rv_u32 b\x2C rv_u32 *hi) { /* 32 x 32 -> 64 bit multiply */\n  rv_u32 al \x3D rvm_lo(a)\x2C ah \x3D rvm_hi(a)\x2C bl \x3D rvm_lo(b)\x2C bh \x3D rvm_hi(b);\n  rv_u32 qh\x2C ql \x3D rvm_mhh(al\x2C bl\x2C &qh);    /* qh\x2C ql \x3D al * bl      */\n  rv_u32 rh\x2C rl \x3D rvm_mhh(al\x2C bh\x2C &rh);    /* rh\x2C rl \x3D al * bh      */\n  rv_u32 sh\x2C sl \x3D rvm_mhh(ah\x2C bl\x2C &sh);    /* sh\x2C sl \x3D ah * bl      */\n  rv_u32 th\x2C tl \x3D rvm_mhh(ah\x2C bh\x2C &th);    /* th\x2C tl \x3D ah * bh      */\n  rv_u32 mc\x2C m \x3D rvm_ahh(rl\x2C sl\x2C 0\x2C &mc);  /*  m\x2C nc \x3D rl + sl      */\n  rv_u32 nc\x2C n \x3D rvm_ahh(rh\x2C sh\x2C mc\x2C &nc); /*  n\x2C nc \x3D rh + sh + nc */\n  rv_u32 x \x3D ql;                           /*  x\x2C 0  \x3D ql           */\n  rv_u32 yc\x2C y \x3D rvm_ahh(m\x2C qh\x2C 0\x2C &yc);   /*  y\x2C yc \x3D qh + m       */\n  rv_u32 zc\x2C z \x3D rvm_ahh(n\x2C tl\x2C yc\x2C &zc);  /*  z\x2C zc \x3D tl + n  + yc */\n  rv_u32 wc\x2C w \x3D rvm_ahh(th\x2C nc\x2C zc\x2C &wc); /*  w\x2C 0  \x3D th + nc + zc */\n  *hi \x3D z | (w << 16);                     /* hi \x3D (w\x2C z)           */\n  return x | (y << 16);                    /* lo \x3D (y\x2C x)           */\n}\n\n#endif\n\n#ifdef RVC\n#define rvc_op(c) rv_bf(c\x2C 1\x2C 0)           /* c. op */\n#define rvc_f3(c) rv_bf(c\x2C 15\x2C 13)         /* c. funct3 */\n#define rvc_rp(r) ((r) + 8)                /* c. r\' register offsetter */\n#define rvc_ird(c) rv_bf(c\x2C 11\x2C 7)         /* c. ci-format rd/rs1  */\n#define rvc_irpl(c) rvc_rp(rv_bf(c\x2C 4\x2C 2)) /* c. rd\'/rs2\' (bits 4-2) */\n#define rvc_irph(c) rvc_rp(rv_bf(c\x2C 9\x2C 7)) /* c. rd\'/rs1\' (bits 9-7) */\n#define rvc_imm_ciw(c)                     /* CIW imm. for c.addi4spn */       \\\n  (rv_tbf(c\x2C 10\x2C 7\x2C 6) | rv_tbf(c\x2C 12\x2C 11\x2C 4) | rv_tb(c\x2C 6\x2C 3) | rv_tb(c\x2C 5\x2C 2))\n#define rvc_imm_cl(c) /* CL imm. for c.lw/c.sw */                              \\\n  (rv_tb(c\x2C 5\x2C 6) | rv_tbf(c\x2C 12\x2C 10\x2C 3) | rv_tb(c\x2C 6\x2C 2))\n#define rvc_imm_ci(c) /* CI imm. for c.addi/c.li/c.lui */                      \\\n  (rv_signext(rv_tb(c\x2C 12\x2C 5)\x2C 5) | rv_bf(c\x2C 6\x2C 2))\n#define rvc_imm_ci_b(c) /* CI imm. for c.addi16sp */                           \\\n  (rv_signext(rv_tb(c\x2C 12\x2C 9)\x2C 9) | rv_tbf(c\x2C 4\x2C 3\x2C 7) | rv_tb(c\x2C 5\x2C 6) |      \\\n   rv_tb(c\x2C 2\x2C 5) | rv_tb(c\x2C 6\x2C 4))\n#define rvc_imm_ci_c(c) /* CI imm. for c.lwsp */                               \\\n  (rv_tbf(c\x2C 3\x2C 2\x2C 6) | rv_tb(c\x2C 12\x2C 5) | rv_tbf(c\x2C 6\x2C 4\x2C 2))\n#define rvc_imm_cj(c) /* CJ imm. for c.jalr/c.j */                             \\\n  (rv_signext(rv_tb(c\x2C 12\x2C 11)\x2C 11) | rv_tb(c\x2C 8\x2C 10) | rv_tbf(c\x2C 10\x2C 9\x2C 8) |  \\\n   rv_tb(c\x2C 6\x2C 7) | rv_tb(c\x2C 7\x2C 6) | rv_tb(c\x2C 2\x2C 5) | rv_tb(c\x2C 11\x2C 4) |        \\\n   rv_tbf(c\x2C 5\x2C 3\x2C 1))\n#define rvc_imm_cb(c) /* CB imm. for c.beqz/c.bnez */                          \\\n  (rv_signext(rv_tb(c\x2C 12\x2C 8)\x2C 8) | rv_tbf(c\x2C 6\x2C 5\x2C 6) | rv_tb(c\x2C 2\x2C 5) |      \\\n   rv_tbf(c\x2C 11\x2C 10\x2C 3) | rv_tbf(c\x2C 4\x2C 3\x2C 1))\n#define rvc_imm_css(c) /* CSS imm. for c.swsp */                               \\\n  (rv_tbf(c\x2C 8\x2C 7\x2C 6) | rv_tbf(c\x2C 12\x2C 9\x2C 2))\n\n/* macros to make all uncompressed instruction types */\n#define rv_i_i(op\x2C f3\x2C rd\x2C rs1\x2C imm) /* I-type */                              \\\n  ((imm) << 20 | (rs1) << 15 | (f3) << 12 | (rd) << 7 | (op) << 2 | 3)\n#define rv_i_s(op\x2C f3\x2C rs1\x2C rs2\x2C imm) /* S-type */                             \\\n  (rv_bf(imm\x2C 11\x2C 5) << 25 | (rs2) << 20 | (rs1) << 15 | (f3) << 12 |          \\\n   rv_bf(imm\x2C 4\x2C 0) << 7 | (op) << 2 | 3)\n#define rv_i_u(op\x2C rd\x2C imm) /* U-type */                                       \\\n  ((imm) << 12 | (rd) << 7 | (op) << 2 | 3)\n#define rv_i_r(op\x2C f3\x2C rd\x2C rs1\x2C rs2\x2C f7) /* R-type */                          \\\n  ((f7) << 25 | (rs2) << 20 | (rs1) << 15 | (f3) << 12 | (rd) << 7 |           \\\n   (op) << 2 | 3)\n#define rv_i_j(op\x2C rd\x2C imm) /* J-type */                                       \\\n  (rv_b(imm\x2C 20) << 31 | rv_bf(imm\x2C 10\x2C 1) << 21 | rv_b(imm\x2C 11) << 20 |       \\\n   rv_bf(imm\x2C 19\x2C 12) << 12 | (rd) << 7 | (op) << 2 | 3)\n#define rv_i_b(op\x2C f3\x2C rs1\x2C rs2\x2C imm) /* B-type */                             \\\n  (rv_b(imm\x2C 12) << 31 | rv_bf(imm\x2C 10\x2C 5) << 25 | (rs2) << 20 | (rs1) << 15 | \\\n   (f3) << 12 | rv_bf(imm\x2C 4\x2C 1) << 8 | rv_b(imm\x2C 11) << 7 | (op) << 2 | 3)\n\nrv_u32 rvc_inst(rv_u32 c) { /* decompress instruction */\n  if (rvc_op(c) \x3D\x3D 0) {\n    if (rvc_f3(c) \x3D\x3D 0 && c !\x3D 0) { /* c.addi4spn -> addi rd\'\x2C x2\x2C nzuimm */\n      return rv_i_i(4\x2C 0\x2C rvc_irpl(c)\x2C 2\x2C rvc_imm_ciw(c));\n    } else if (c \x3D\x3D 0) { /* illegal */\n      return 0;\n    } else if (rvc_f3(c) \x3D\x3D 2) { /*I c.lw -> lw rd\'\x2C offset(rs1\') */\n      return rv_i_i(0\x2C 2\x2C rvc_irpl(c)\x2C rvc_irph(c)\x2C rvc_imm_cl(c));\n    } else if (rvc_f3(c) \x3D\x3D 6) { /*I c.sw -> sw rs2\'\x2C offset(rs1\') */\n      return rv_i_s(8\x2C 2\x2C rvc_irph(c)\x2C rvc_irpl(c)\x2C rvc_imm_cl(c));\n    } else { /* illegal */\n      return 0;\n    }\n  } else if (rvc_op(c) \x3D\x3D 1) {\n    if (rvc_f3(c) \x3D\x3D 0) { /*I c.addi -> addi rd\x2C rd\x2C nzimm */\n      return rv_i_i(4\x2C 0\x2C rvc_ird(c)\x2C rvc_ird(c)\x2C rvc_imm_ci(c));\n    } else if (rvc_f3(c) \x3D\x3D 1) { /*I c.jal -> jal x1\x2C offset */\n      return rv_i_j(27\x2C 1\x2C rvc_imm_cj(c));\n    } else if (rvc_f3(c) \x3D\x3D 2) { /*I c.li -> addi rd\x2C x0\x2C imm */\n      return rv_i_i(4\x2C 0\x2C rvc_ird(c)\x2C 0\x2C rvc_imm_ci(c));\n    } else if (rvc_f3(c) \x3D\x3D 3) { /* 01/011: LUI/ADDI16SP */\n      if (rvc_ird(c) \x3D\x3D 2) {     /*I c.addi16sp -> addi x2\x2C x2\x2C nzimm */\n        return rv_i_i(4\x2C 0\x2C 2\x2C 2\x2C rvc_imm_ci_b(c));\n      } else if (rvc_ird(c) !\x3D 0) { /*I c.lui -> lui rd\x2C nzimm */\n        return rv_i_u(13\x2C rvc_ird(c)\x2C rvc_imm_ci(c));\n      } else { /* illegal */\n        return 0;\n      }\n    } else if (rvc_f3(c) \x3D\x3D 4) {   /* 01/100: MISC-ALU */\n      if (rv_bf(c\x2C 11\x2C 10) \x3D\x3D 0) { /*I c.srli -> srli rd\'\x2C rd\'\x2C shamt */\n        return rv_i_r(4\x2C 5\x2C rvc_irph(c)\x2C rvc_irph(c)\x2C rvc_imm_ci(c) & 0x1F\x2C 0);\n      } else if (rv_bf(c\x2C 11\x2C 10) \x3D\x3D 1) { /*I c.srai -> srai rd\'\x2C rd\'\x2C shamt */\n        return rv_i_r(4\x2C 5\x2C rvc_irph(c)\x2C rvc_irph(c)\x2C rvc_imm_ci(c) & 0x1F\x2C 32);\n      } else if (rv_bf(c\x2C 11\x2C 10) \x3D\x3D 2) { /*I c.andi -> andi rd\'\x2C rd\'\x2C imm */\n        return rv_i_i(4\x2C 7\x2C rvc_irph(c)\x2C rvc_irph(c)\x2C rvc_imm_ci(c));\n      } else if (rv_bf(c\x2C 11\x2C 10) \x3D\x3D 3) {\n        if (rv_bf(c\x2C 6\x2C 5) \x3D\x3D 0) { /*I c.sub -> sub rd\'\x2C rd\'\x2C rs2\' */\n          return rv_i_r(12\x2C 0\x2C rvc_irph(c)\x2C rvc_irph(c)\x2C rvc_irpl(c)\x2C 32);\n        } else if (rv_bf(c\x2C 6\x2C 5) \x3D\x3D 1) { /*I c.xor -> xor rd\'\x2C rd\'\x2C rs2\' */\n          return rv_i_r(12\x2C 4\x2C rvc_irph(c)\x2C rvc_irph(c)\x2C rvc_irpl(c)\x2C 0);\n        } else if (rv_bf(c\x2C 6\x2C 5) \x3D\x3D 2) { /*I c.or -> or rd\'\x2C rd\'\x2C rs2\' */\n          return rv_i_r(12\x2C 6\x2C rvc_irph(c)\x2C rvc_irph(c)\x2C rvc_irpl(c)\x2C 0);\n        } else if (rv_bf(c\x2C 6\x2C 5) \x3D\x3D 3) { /*I c.and -> and rd\'\x2C rd\'\x2C rs2\' */\n          return rv_i_r(12\x2C 7\x2C rvc_irph(c)\x2C rvc_irph(c)\x2C rvc_irpl(c)\x2C 0);\n        } else { /* illegal */\n          return 0;\n        }\n      } else { /* illegal */\n        return 0;\n      }\n    } else if (rvc_f3(c) \x3D\x3D 5) { /*I c.j -> jal x0\x2C offset */\n      return rv_i_j(27\x2C 0\x2C rvc_imm_cj(c));\n    } else if (rvc_f3(c) \x3D\x3D 6) { /*I c.beqz -> beq rs1\' x0\x2C offset */\n      return rv_i_b(24\x2C 0\x2C rvc_irph(c)\x2C 0\x2C rvc_imm_cb(c));\n    } else if (rvc_f3(c) \x3D\x3D 7) { /*I c.bnez -> bne rs1\' x0\x2C offset */\n      return rv_i_b(24\x2C 1\x2C rvc_irph(c)\x2C 0\x2C rvc_imm_cb(c));\n    } else { /* illegal */\n      return 0;\n    }\n  } else if (rvc_op(c) \x3D\x3D 2) {\n    if (rvc_f3(c) \x3D\x3D 0) { /*I c.slli -> slli rd\x2C rd\x2C shamt */\n      return rv_i_r(4\x2C 1\x2C rvc_ird(c)\x2C rvc_ird(c)\x2C rvc_imm_ci(c) & 0x1F\x2C 0);\n    } else if (rvc_f3(c) \x3D\x3D 2) { /*I c.lwsp -> lw rd\x2C offset(x2) */\n      return rv_i_i(0\x2C 2\x2C rvc_ird(c)\x2C 2\x2C rvc_imm_ci_c(c));\n    } else if (rvc_f3(c) \x3D\x3D 4 && !rv_b(c\x2C 12) && !rv_bf(c\x2C 6\x2C 2)) {\n      /*I c.jr -> jalr x0\x2C 0(rs1) */\n      return rv_i_i(25\x2C 0\x2C 0\x2C rvc_ird(c)\x2C 0);\n    } else if (rvc_f3(c) \x3D\x3D 4 && !rv_b(c\x2C 12)) { /*I c.mv -> add rd\x2C x0\x2C rs2 */\n      return rv_i_r(12\x2C 0\x2C rvc_ird(c)\x2C 0\x2C rv_bf(c\x2C 6\x2C 2)\x2C 0);\n    } else if (rvc_f3(c) \x3D\x3D 4 && rv_b(c\x2C 12) && rvc_ird(c) &&\n               !rv_bf(c\x2C 6\x2C 2)) { /*I c.jalr -> jalr x1\x2C 0(rs1) */\n      return rv_i_i(25\x2C 0\x2C 1\x2C rvc_ird(c)\x2C 0);\n    } else if (rvc_f3(c) \x3D\x3D 4 && rv_b(c\x2C 12) && rvc_ird(c) &&\n               rv_bf(c\x2C 6\x2C 2)) { /*I c.add -> add rd\x2C rd\x2C rs2 */\n      return rv_i_r(12\x2C 0\x2C rvc_ird(c)\x2C rvc_ird(c)\x2C rv_bf(c\x2C 6\x2C 2)\x2C 0);\n    } else if (rvc_f3(c) \x3D\x3D 6) { /*I c.swsp -> sw rs2\x2C offset(x2) */\n      return rv_i_s(8\x2C 2\x2C 2\x2C rv_bf(c\x2C 6\x2C 2)\x2C rvc_imm_css(c));\n    } else { /* illegal */\n      return 0;\n    }\n  } else { /* illegal */\n    return 0;\n  }\n}\n#endif /* RVC */\n\nrv_u32 rv_step(rv *cpu) {                  /* single step */\n  rv_u32 i\x2C err \x3D rv_lw(cpu\x2C cpu->pc\x2C &i); /* fetch instruction into i */\n  if (err)\n    rv_dbg(\"(IF) %08X -> fault\\n\"\x2C cpu->pc);\n  else\n    rv_dbg(\"(IF) %08X -> %08X\\n\"\x2C cpu->pc\x2C i);\n  if (err)\n    return rv_except(cpu\x2C RV_EIFAULT);\n  cpu->next_pc \x3D cpu->pc + rv_isz(i);\n#if RVC\n  if (rv_isz(i) !\x3D 4)         /* if it\'s a compressed instruction... */\n    i \x3D rvc_inst(i & 0xFFFF); /* decompress it */\n#endif\n  if (rv_iopl(i) \x3D\x3D 0) {\n    if (rv_ioph(i) \x3D\x3D 0) { /*Q 00/000: LOAD */\n      rv_u32 addr \x3D rv_lr(cpu\x2C rv_irs1(i)) + rv_iimm_i(i);\n      rv_u32 v;     /* loaded value */\n      rv_u16 tmp16; /* temporary for 16-bit loads */\n      rv_u8 tmp8;   /* temporary for  8-bit loads */\n      rv_dbg(\"(L%.2s) %08X -> \"\x2C\n             (const char *)\"b\\0h\\0w\\0XXbuhuXXXX\" + 2 * rv_if3(i)\x2C addr);\n      if (rv_if3(i) \x3D\x3D 0) { /*I lb */\n        err \x3D rv_lb(cpu\x2C addr\x2C &tmp8);\n        v \x3D rv_signext((rv_u32)tmp8\x2C 7);\n      } else if (rv_if3(i) \x3D\x3D 1) { /*I lh */\n        err \x3D rv_lh(cpu\x2C addr\x2C &tmp16);\n        v \x3D rv_signext((rv_u32)tmp16\x2C 15);\n      } else if (rv_if3(i) \x3D\x3D 2) { /*I lw */\n        err \x3D rv_lw(cpu\x2C addr\x2C &v);\n      } else if (rv_if3(i) \x3D\x3D 4) { /*I lbu */\n        err \x3D rv_lb(cpu\x2C addr\x2C &tmp8);\n        v \x3D (rv_u32)tmp8;\n      } else if (rv_if3(i) \x3D\x3D 5) { /*I lhu */\n        err \x3D rv_lh(cpu\x2C addr\x2C &tmp16);\n        v \x3D (rv_u32)tmp16;\n      } else\n        return rv_except(cpu\x2C RV_EILL);\n      if (err)\n        rv_dbg(\"fault\\n\");\n      else\n        rv_dbg(\"%08X\\n\"\x2C v);\n      if (err)\n        return rv_except(cpu\x2C RV_ELFAULT);\n      else\n        rv_sr(cpu\x2C rv_ird(i)\x2C v);\n    } else if (rv_ioph(i) \x3D\x3D 1) { /*Q 01/000: STORE */\n      rv_u32 addr \x3D rv_lr(cpu\x2C rv_irs1(i)) + rv_iimm_s(i);\n      rv_dbg(\"(S%.2s) %08X <- %08X\"\x2C\n             (char *)\"b\\0h\\0w\\0XXXXXXXXXX\" + 2 * rv_if3(i)\x2C addr\x2C\n             rv_lr(cpu\x2C rv_irs2(i)));\n      if (rv_if3(i) \x3D\x3D 0) { /*I sb */\n        err \x3D rv_sb(cpu\x2C addr\x2C rv_lr(cpu\x2C rv_irs2(i)) & 0xFF);\n      } else if (rv_if3(i) \x3D\x3D 1) { /*I sh */\n        err \x3D rv_sh(cpu\x2C addr\x2C rv_lr(cpu\x2C rv_irs2(i)) & 0xFFFF);\n      } else if (rv_if3(i) \x3D\x3D 2) { /*I sw */\n        err \x3D rv_sw(cpu\x2C addr\x2C rv_lr(cpu\x2C rv_irs2(i)));\n      } else\n        return rv_except(cpu\x2C RV_EILL);\n      rv_dbg(err \? \"-> fault\\n\" : \"\\n\");\n      if (err)\n        return rv_except(cpu\x2C RV_ESFAULT);\n    } else if (rv_ioph(i) \x3D\x3D 3) { /*Q 11/000: BRANCH */\n      rv_u32 a \x3D rv_lr(cpu\x2C rv_irs1(i))\x2C b \x3D rv_lr(cpu\x2C rv_irs2(i));\n      rv_u32 y \x3D a - b; /* comparison value */\n      rv_u32 zero \x3D !y\x2C sgn \x3D rv_sgn(y)\x2C ovf \x3D rv_ovf(a\x2C b\x2C y)\x2C carry \x3D y > a;\n      rv_u32 targ \x3D cpu->pc + rv_iimm_b(i);   /* computed branch target */\n      if ((rv_if3(i) \x3D\x3D 0 && zero) ||         /*I beq */\n          (rv_if3(i) \x3D\x3D 1 && !zero) ||        /*I bne */\n          (rv_if3(i) \x3D\x3D 4 && (sgn !\x3D ovf)) || /*I blt */\n          (rv_if3(i) \x3D\x3D 5 && (sgn \x3D\x3D ovf)) || /*I bge */\n          (rv_if3(i) \x3D\x3D 6 && carry) ||        /*I bltu */\n          (rv_if3(i) \x3D\x3D 7 && !carry)          /*I bgtu */\n      ) {\n        cpu->next_pc \x3D targ; /* take branch */\n      } else if (rv_if3(i) \x3D\x3D 2 || rv_if3(i) \x3D\x3D 3)\n        return rv_except(cpu\x2C RV_EILL);\n      /* default: don\'t take branch */\n    } else\n      return rv_except(cpu\x2C RV_EILL);\n  } else if (rv_iopl(i) \x3D\x3D 1) {\n    if (rv_ioph(i) \x3D\x3D 3 && rv_if3(i) \x3D\x3D 0) { /*Q 11/001: JALR */\n      rv_u32 target \x3D (rv_lr(cpu\x2C rv_irs1(i)) + rv_iimm_i(i)); /*I jalr */\n      rv_sr(cpu\x2C rv_ird(i)\x2C cpu->next_pc);\n      cpu->next_pc \x3D target & (~(rv_u32)1); /* target is two-byte aligned */\n    } else\n      return rv_except(cpu\x2C RV_EILL);\n  } else if (rv_iopl(i) \x3D\x3D 3) {\n    if (rv_ioph(i) \x3D\x3D 0) {            /*Q 00/011: MISC-MEM */\n      if (rv_if3(i) \x3D\x3D 0) {           /*I fence */\n        rv_u32 fm \x3D rv_bf(i\x2C 31\x2C 28); /* extract fm field */\n        if (fm && fm !\x3D 8)\n          return rv_except(cpu\x2C RV_EILL); /* fm must be 0/8\x2C others reserved */\n      } else if (rv_if3(i) \x3D\x3D 1) {        /*I fence.i */\n      } else\n        return rv_except(cpu\x2C RV_EILL);\n    } else if (rv_ioph(i) \x3D\x3D 3) {          /*Q 11/011: JAL */\n      rv_sr(cpu\x2C rv_ird(i)\x2C cpu->next_pc); /*I jal */\n      cpu->next_pc \x3D cpu->pc + rv_iimm_j(i);\n    } else\n      return rv_except(cpu\x2C RV_EILL);\n  } else if (rv_iopl(i) \x3D\x3D 4) { /* ALU section */\n    if (rv_ioph(i) \x3D\x3D 0 ||      /*Q 00/100: OP-IMM */\n        rv_ioph(i) \x3D\x3D 1) {      /*Q 01/100: OP */\n      rv_u32 a \x3D rv_lr(cpu\x2C rv_irs1(i));\n      rv_u32 b \x3D rv_ioph(i) \? rv_lr(cpu\x2C rv_irs2(i)) : rv_iimm_i(i);\n      rv_u32 s \x3D (rv_ioph(i) || rv_if3(i)) \? rv_b(i\x2C 30) : 0; /* alt. ALU op */\n      rv_u32 y /* result */\x2C sh \x3D b & 0x1F;                   /* shift amount */\n#if RVM\n      if (!rv_ioph(i) || !rv_b(i\x2C 25)) {\n#endif\n        if (rv_if3(i) \x3D\x3D 0)      /*I add\x2C addi\x2C sub */\n          y \x3D s \? a - b : a + b; /* subtract if alt. op\x2C otherwise add */\n        else if (rv_if3(i) \x3D\x3D 1) /*I sll\x2C slli */\n          y \x3D a << sh;\n        else if (rv_if3(i) \x3D\x3D 2) /*I slt\x2C slti */\n          y \x3D rv_ovf(a\x2C b\x2C a - b) !\x3D rv_sgn(a - b);\n        else if (rv_if3(i) \x3D\x3D 3) /*I sltu\x2C sltiu */\n          y \x3D (a - b) > a;\n        else if (rv_if3(i) \x3D\x3D 4) /*I xor\x2C xori */\n          y \x3D a ^ b;\n        else if (rv_if3(i) \x3D\x3D 5) /*I srl\x2C srli\x2C sra\x2C srai */\n          y \x3D (a >> sh) | ((0U - (s && rv_sgn(a))) << (0x1F - sh));\n        else if (rv_if3(i) \x3D\x3D 6) /*I or\x2C ori */\n          y \x3D a | b;\n        else /*I and\x2C andi */\n          y \x3D a & b;\n#if RVM\n      } else {\n        rv_u32 as \x3D 0 /* sgn(a) */\x2C bs \x3D 0 /* sgn(b) */\x2C ylo\x2C yhi; /* result */\n        if (rv_if3(i) < 4) {              /*I mul\x2C mulh\x2C mulhsu\x2C mulhu */\n          if (rv_if3(i) < 3 && rv_sgn(a)) /* a is signed iff f3 in {0\x2C 1\x2C 2} */\n            a \x3D ~a + 1\x2C as \x3D 1;\n          if (rv_if3(i) < 2 && rv_sgn(b)) /* b is signed iff f3 in {0\x2C 1} */\n            b \x3D ~b + 1\x2C bs \x3D 1;\n          ylo \x3D rvm(a\x2C b\x2C &yhi); /* perform multiply */\n          if (as ^ bs) {         /* invert output quantity if result <0 */\n            ylo \x3D ~ylo + 1\x2C yhi \x3D ~yhi; /* two\'s complement */\n            if (!ylo)                   /* carry out of lo */\n              yhi++;                    /* propagate carry to hi */\n          }\n          y \x3D rv_if3(i) \? yhi : ylo; /* return hi word if mulh\x2C otherwise lo */\n        } else {\n          if (rv_if3(i) \x3D\x3D 4) /*I div */\n            y \x3D b \? (rv_u32)((rv_s32)a / (rv_s32)b) : (rv_u32)(-1);\n          else if (rv_if3(i) \x3D\x3D 5) /*I divu */\n            y \x3D b \? (a / b) : (rv_u32)(-1);\n          else if (rv_if3(i) \x3D\x3D 6) /*I rem */\n            y \x3D (rv_u32)((rv_s32)a % (rv_s32)b);\n          else /*I remu */\n            y \x3D a % b;\n        }\n      }\n#endif\n      rv_sr(cpu\x2C rv_ird(i)\x2C y);   /* set register to ALU output */\n    } else if (rv_ioph(i) \x3D\x3D 3) { /*Q 11/100: SYSTEM */\n      rv_u32 csr \x3D rv_iimm_iu(i) /* CSR number */\x2C y; /* result */\n      rv_u32 s \x3D rv_if3(i) & 4 \? rv_irs1(i) : rv_lr(cpu\x2C rv_irs1(i)); /* uimm */\n      if ((rv_if3(i) & 3) \x3D\x3D 1) {    /*I csrrw\x2C csrrwi */\n        if (rv_irs1(i)) {            /* perform CSR load */\n          if (rv_lcsr(cpu\x2C csr\x2C &y)) /* load CSR into y */\n            return rv_except(cpu\x2C RV_EILL);\n          if (rv_ird(i))\n            rv_sr(cpu\x2C rv_ird(i)\x2C y); /* store y into rd */\n        }\n        if (rv_scsr(cpu\x2C csr\x2C s\x2C &y)) /* set CSR to s [y unused]*/\n          return rv_except(cpu\x2C RV_EILL);\n      } else if ((rv_if3(i) & 3) \x3D\x3D 2) { /*I csrrs\x2C csrrsi */\n        if (rv_lcsr(cpu\x2C csr\x2C &y))       /* load CSR into y */\n          return rv_except(cpu\x2C RV_EILL);\n        rv_sr(cpu\x2C rv_ird(i)\x2C y);                       /* store y into rd */\n        if (rv_irs1(i) && rv_scsr(cpu\x2C csr\x2C y | s\x2C &y)) /*     y|s into CSR */\n          return rv_except(cpu\x2C RV_EILL);\n      } else if ((rv_if3(i) & 3) \x3D\x3D 3) { /*I csrrc\x2C csrrci */\n        if (rv_lcsr(cpu\x2C csr\x2C &y))       /* load CSR into y */\n          return rv_except(cpu\x2C RV_EILL);\n        rv_sr(cpu\x2C rv_ird(i)\x2C y);                        /* store y into rd */\n        if (rv_irs1(i) && rv_scsr(cpu\x2C csr\x2C y & ~s\x2C &y)) /*    y&~s into CSR */\n          return rv_except(cpu\x2C RV_EILL);\n      } else if (!rv_if3(i)) {\n        if (!rv_ird(i)) {\n          if (!rv_irs1(i) && rv_irs2(i) \x3D\x3D 2 && rv_if7(i) \x3D\x3D 24) { /*I mret */\n            cpu->next_pc \x3D cpu->csrs.mepc; /* return from exception routine */\n          } else if (!rv_irs1(i) && !rv_irs2(i) && !rv_if7(i)) { /*I ecall */\n            return rv_except(cpu\x2C RV_EECALL);\n          } else if (!rv_irs1(i) && rv_irs2(i) \x3D\x3D 1 && !rv_if7(i)) {\n            return rv_except(cpu\x2C RV_EBP); /*I ebreak */\n          } else\n            return rv_except(cpu\x2C RV_EILL);\n        } else\n          return rv_except(cpu\x2C RV_EILL);\n      } else\n        return rv_except(cpu\x2C RV_EILL);\n    } else\n      return rv_except(cpu\x2C RV_EILL);\n  } else if (rv_iopl(i) \x3D\x3D 5) {\n    if (rv_ioph(i) \x3D\x3D 0) {                           /*Q 00/101: AUIPC */\n      rv_sr(cpu\x2C rv_ird(i)\x2C rv_iimm_u(i) + cpu->pc); /*I auipc */\n    } else if (rv_ioph(i) \x3D\x3D 1) {                    /*Q 01/101: LUI */\n      rv_sr(cpu\x2C rv_ird(i)\x2C rv_iimm_u(i));           /*I lui */\n    } else\n      return rv_except(cpu\x2C RV_EILL);\n  } else\n    return rv_except(cpu\x2C RV_EILL);\n  cpu->pc \x3D cpu->next_pc;\n  return 0;\n}", Scope = Protected, Description = 4578616D706C65204320636F64652E
	#tag EndConstant

	#tag Constant, Name = EXAMPLE_HTML, Type = String, Dynamic = False, Default = \"<!doctype html>\n\n<html lang\x3D\"en\">\n<head>\n<meta charset\x3D\"utf-8\">\n\n<title>HTML5 Template</title>\n<meta name\x3D\"description\" content\x3D\"HTML5\">\n<meta name\x3D\"author\" content\x3D\"Author\">\n\n<link rel\x3D\"stylesheet\" href\x3D\"css/styles.css\?v\x3D1.0\">\n\n<!--[if lt IE 9]>\n<script src\x3D\"http://html5shiv.googlecode.com/svn/trunk/html5.js\"></script>\n<![endif]-->\n</head>\n\n<body>\n<script src\x3D\"js/scripts.js\"></script>\n</body>\n</html> <!-- TODO: This is a todo-->", Scope = Protected, Description = 4578616D706C652048544D4C20746578742E
	#tag EndConstant

	#tag Constant, Name = EXAMPLE_JAVA, Type = String, Dynamic = False, Default = \"package com.thealgorithms.geometry;\n\nimport java.util.Arrays;\nimport java.util.Comparator;\nimport java.util.Stack;\n\n/*\n * A Java program that computes the convex hull using the Graham Scan algorithm\n * In the best case\x2C time complexity is O(n)\x2C while in the worst case\x2C it is log(n).\n * O(n) space complexity\n *\n * This algorithm is only applicable to integral coordinates.\n *\n * Reference:\n * https://github.com/TheAlgorithms/C-Plus-Plus/blob/master/geometry/graham_scan_algorithm.cpp\n * https://github.com/TheAlgorithms/C-Plus-Plus/blob/master/geometry/graham_scan_functions.hpp\n * https://algs4.cs.princeton.edu/99hull/GrahamScan.java.html\n */\npublic class GrahamScan {\nprivate final Stack<Point> hull \x3D new Stack<>();\n\npublic GrahamScan(Point[] points) {\n\n/*\n * pre-process the points by sorting them with respect to the bottom-most point\x2C then we\'ll\n * push the first point in the array to be our first extreme point.\n */\nArrays.sort(points);\nArrays.sort(points\x2C 1\x2C points.length\x2C points[0].polarOrder());\nhull.push(points[0]);\n\n// find index of first point not equal to a[0] (indexPoint1) and the first point that\'s not\n// collinear with either (indexPoint2).\nint indexPoint1;\nfor (indexPoint1 \x3D 1; indexPoint1 < points.length; indexPoint1++)\nif (!points[0].equals(points[indexPoint1])) break;\nif (indexPoint1 \x3D\x3D points.length) return;\n\nint indexPoint2;\nfor (indexPoint2 \x3D indexPoint1 + 1; indexPoint2 < points.length; indexPoint2++) {\nif (Point.orientation(points[0]\x2C points[indexPoint1]\x2C points[indexPoint2]) !\x3D 0) break;\nhull.push(points[indexPoint2 - 1]);\n\n// Now we simply add the point to the stack based on the orientation.\nfor (int i \x3D indexPoint2; i < points.length; i++) {\nPoint top \x3D hull.pop();\nwhile (Point.orientation(hull.peek()\x2C top\x2C points[i]) <\x3D 0) {\ntop \x3D hull.pop();\n}\nhull.push(top);\nhull.push(points[i]);\n}\n}\n\n/**\n * @return A stack of points representing the convex hull.\n */\npublic Iterable<Point> hull() {\nStack<Point> s \x3D new Stack<>();\nfor (Point p : hull) s.push(p);\nreturn s;\n}\n\npublic record Point(int x\x2C int y) implements Comparable<Point> {\n\n/**\n * Default constructor\n * @param x x-coordinate\n * @param y y-coordinate\n */\npublic Point {\n}\n\n/**\n * @return the x-coordinate\n */\n@Override\npublic int x() {\nreturn x;\n}\n\n/**\n * @return the y-coordinate\n */\n@Override\npublic int y() {\nreturn y;\n}\n\n/**\n * Finds the orientation of ordered triplet.\n *\n * @param a Co-ordinates of point a <int\x2C int>\n * @param b Co-ordinates of point a <int\x2C int>\n * @param c Co-ordinates of point a <int\x2C int>\n * @return { -1\x2C 0\x2C +1 } if a -\xE2\x86\x92 b -\xE2\x86\x92 c is a { clockwise\x2C collinear; counterclockwise }\n *     turn.\n */\npublic static int orientation(Point a\x2C Point b\x2C Point c) {\nint val \x3D (b.x - a.x) * (c.y - a.y) - (b.y - a.y) * (c.x - a.x);\nif (val \x3D\x3D 0) {\nreturn 0;\n}\nreturn (val > 0) \? +1 : -1;\n}\n\n/**\n * @param p2 Co-ordinate of point to compare to.\n * This function will compare the points and will return a positive integer it the\n * point is greater than the argument point and a negative integer if the point is\n * less than the argument point.\n */\npublic int compareTo(Point p2) {\nif (this.y < p2.y) return -1;\nif (this.y > p2.y) return +1;\nif (this.x < p2.x) return -1;\nif (this.x > p2.x) return +1;\nreturn 0;\n}\n\n/**\n * A helper function that will let us sort points by their polar order\n * This function will compare the angle between 2 polar Co-ordinates\n *\n * @return the comparator\n */\npublic Comparator<Point> polarOrder() {\nreturn new PolarOrder();\n}\n\nprivate class PolarOrder implements Comparator<Point> {\npublic int compare(Point p1\x2C Point p2) {\nint dx1 \x3D p1.x - x;\nint dy1 \x3D p1.y - y;\nint dx2 \x3D p2.x - x;\nint dy2 \x3D p2.y - y;\n\nif (dy1 >\x3D 0 && dy2 < 0)\nreturn -1; // q1 above; q2 below\nelse if (dy2 >\x3D 0 && dy1 < 0)\nreturn +1; // q1 below; q2 above\nelse if (dy1 \x3D\x3D 0 && dy2 \x3D\x3D 0) { // 3-collinear and horizontal\nif (dx1 >\x3D 0 && dx2 < 0)\nreturn -1;\nelse if (dx2 >\x3D 0 && dx1 < 0)\nreturn +1;\nelse\nreturn 0;\n} else\nreturn -orientation(Point.this\x2C p1\x2C p2); // both above or below\n}\n}\n\n/**\n * Override of the toString method\x2C necessary to compute the difference\n * between the expected result and the derived result\n *\n * @return a string representation of any given 2D point in the format (x\x2C y)\n */\n@Override\npublic String toString() {\nreturn \"(\" + x + \"\x2C \" + y + \")\";\n}\n}\n}\n}", Scope = Protected, Description = 4578616D706C65204A61766120636F64652E
	#tag EndConstant

	#tag Constant, Name = EXAMPLE_JAVASCRIPT, Type = String, Dynamic = False, Default = \"import {isIdentifierStart\x2C isIdentifierChar} from \"./identifier.js\"\nimport {types as tt\x2C keywords as keywordTypes} from \"./tokentype.js\"\nimport {Parser} from \"./state.js\"\nimport {SourceLocation} from \"./locutil.js\"\nimport {RegExpValidationState} from \"./regexp.js\"\nimport {lineBreak\x2C nextLineBreak\x2C isNewLine\x2C nonASCIIwhitespace} from \"./whitespace.js\"\nimport {codePointToString} from \"./util.js\"\n\n// Object type used to represent tokens. Note that normally\x2C tokens\n// simply exist as properties on the parser object. This is only\n// used for the onToken callback and the external tokenizer.\n\nexport class Token {\nconstructor(p) {\nthis.type \x3D p.type\nthis.value \x3D p.value\nthis.start \x3D p.start\nthis.end \x3D p.end\nif (p.options.locations)\nthis.loc \x3D new SourceLocation(p\x2C p.startLoc\x2C p.endLoc)\nif (p.options.ranges)\nthis.range \x3D [p.start\x2C p.end]\n}\n}\n\n// ## Tokenizer\n\nconst pp \x3D Parser.prototype\n\n// Move to the next token\n\npp.next \x3D function(ignoreEscapeSequenceInKeyword) {\nif (!ignoreEscapeSequenceInKeyword && this.type.keyword && this.containsEsc)\nthis.raiseRecoverable(this.start\x2C \"Escape sequence in keyword \" + this.type.keyword)\nif (this.options.onToken)\nthis.options.onToken(new Token(this))\n\nthis.lastTokEnd \x3D this.end\nthis.lastTokStart \x3D this.start\nthis.lastTokEndLoc \x3D this.endLoc\nthis.lastTokStartLoc \x3D this.startLoc\nthis.nextToken()\n}\n\npp.getToken \x3D function() {\nthis.next()\nreturn new Token(this)\n}\n\n// If we\'re in an ES6 environment\x2C make parsers iterable\nif (typeof Symbol !\x3D\x3D \"undefined\")\npp[Symbol.iterator] \x3D function() {\nreturn {\nnext: () \x3D> {\nlet token \x3D this.getToken()\nreturn {\ndone: token.type \x3D\x3D\x3D tt.eof\x2C\nvalue: token\n}\n}\n}\n}\n\n// Toggle strict mode. Re-reads the next number or string to please\n// pedantic tests (`\"use strict\"; 010;` should fail).\n\n// Read a single token\x2C updating the parser object\'s token-related\n// properties.\n\npp.nextToken \x3D function() {\nlet curContext \x3D this.curContext()\nif (!curContext || !curContext.preserveSpace) this.skipSpace()\n\nthis.start \x3D this.pos\nif (this.options.locations) this.startLoc \x3D this.curPosition()\nif (this.pos >\x3D this.input.length) return this.finishToken(tt.eof)\n\nif (curContext.override) return curContext.override(this)\nelse this.readToken(this.fullCharCodeAtPos())\n}\n\npp.readToken \x3D function(code) {\n// Identifier or keyword. \'\\uXXXX\' sequences are allowed in\n// identifiers\x2C so \'\\\' also dispatches to that.\nif (isIdentifierStart(code\x2C this.options.ecmaVersion >\x3D 6) || code \x3D\x3D\x3D 92 /* \'\\\' */)\nreturn this.readWord()\n\nreturn this.getTokenFromCode(code)\n}\n\npp.fullCharCodeAtPos \x3D function() {\nlet code \x3D this.input.charCodeAt(this.pos)\nif (code <\x3D 0xd7ff || code >\x3D 0xdc00) return code\nlet next \x3D this.input.charCodeAt(this.pos + 1)\nreturn next <\x3D 0xdbff || next >\x3D 0xe000 \? code : (code << 10) + next - 0x35fdc00\n}\n\npp.skipBlockComment \x3D function() {\nlet startLoc \x3D this.options.onComment && this.curPosition()\nlet start \x3D this.pos\x2C end \x3D this.input.indexOf(\"*/\"\x2C this.pos +\x3D 2)\nif (end \x3D\x3D\x3D -1) this.raise(this.pos - 2\x2C \"Unterminated comment\")\nthis.pos \x3D end + 2\nif (this.options.locations) {\nfor (let nextBreak\x2C pos \x3D start; (nextBreak \x3D nextLineBreak(this.input\x2C pos\x2C this.pos)) > -1;) {\n++this.curLine\npos \x3D this.lineStart \x3D nextBreak\n}\n}\nif (this.options.onComment)\nthis.options.onComment(true\x2C this.input.slice(start + 2\x2C end)\x2C start\x2C this.pos\x2C\n startLoc\x2C this.curPosition())\n}\n\npp.skipLineComment \x3D function(startSkip) {\nlet start \x3D this.pos\nlet startLoc \x3D this.options.onComment && this.curPosition()\nlet ch \x3D this.input.charCodeAt(this.pos +\x3D startSkip)\nwhile (this.pos < this.input.length && !isNewLine(ch)) {\nch \x3D this.input.charCodeAt(++this.pos)\n}\nif (this.options.onComment)\nthis.options.onComment(false\x2C this.input.slice(start + startSkip\x2C this.pos)\x2C start\x2C this.pos\x2C\n startLoc\x2C this.curPosition())\n}\n\n// Called at the start of the parse and after every token. Skips\n// whitespace and comments\x2C and.\n\npp.skipSpace \x3D function() {\nloop: while (this.pos < this.input.length) {\nlet ch \x3D this.input.charCodeAt(this.pos)\nswitch (ch) {\ncase 32: case 160: // \' \'\n++this.pos\nbreak\ncase 13:\nif (this.input.charCodeAt(this.pos + 1) \x3D\x3D\x3D 10) {\n++this.pos\n}\ncase 10: case 8232: case 8233:\n++this.pos\nif (this.options.locations) {\n++this.curLine\nthis.lineStart \x3D this.pos\n}\nbreak\ncase 47: // \'/\'\nswitch (this.input.charCodeAt(this.pos + 1)) {\ncase 42: // \'*\'\nthis.skipBlockComment()\nbreak\ncase 47:\nthis.skipLineComment(2)\nbreak\ndefault:\nbreak loop\n}\nbreak\ndefault:\nif (ch > 8 && ch < 14 || ch >\x3D 5760 && nonASCIIwhitespace.test(String.fromCharCode(ch))) {\n++this.pos\n} else {\nbreak loop\n}\n}\n}\n}\n\n// Called at the end of every token. Sets `end`\x2C `val`\x2C and\n// maintains `context` and `exprAllowed`\x2C and skips the space after\n// the token\x2C so that the next one\'s `start` will point at the\n// right position.\n\npp.finishToken \x3D function(type\x2C val) {\nthis.end \x3D this.pos\nif (this.options.locations) this.endLoc \x3D this.curPosition()\nlet prevType \x3D this.type\nthis.type \x3D type\nthis.value \x3D val\n\nthis.updateContext(prevType)\n}\n\n// ### Token reading\n\n// This is the function that is called to fetch the next token. It\n// is somewhat obscure\x2C because it works in character codes rather\n// than characters\x2C and because operator parsing has been inlined\n// into it.\n//\n// All in the name of speed.\n//\npp.readToken_dot \x3D function() {\nlet next \x3D this.input.charCodeAt(this.pos + 1)\nif (next >\x3D 48 && next <\x3D 57) return this.readNumber(true)\nlet next2 \x3D this.input.charCodeAt(this.pos + 2)\nif (this.options.ecmaVersion >\x3D 6 && next \x3D\x3D\x3D 46 && next2 \x3D\x3D\x3D 46) { // 46 \x3D dot \'.\'\nthis.pos +\x3D 3\nreturn this.finishToken(tt.ellipsis)\n} else {\n++this.pos\nreturn this.finishToken(tt.dot)\n}\n}\n\npp.readToken_slash \x3D function() { // \'/\'\nlet next \x3D this.input.charCodeAt(this.pos + 1)\nif (this.exprAllowed) { ++this.pos; return this.readRegexp() }\nif (next \x3D\x3D\x3D 61) return this.finishOp(tt.assign\x2C 2)\nreturn this.finishOp(tt.slash\x2C 1)\n}\n\npp.readToken_mult_modulo_exp \x3D function(code) { // \'%*\'\nlet next \x3D this.input.charCodeAt(this.pos + 1)\nlet size \x3D 1\nlet tokentype \x3D code \x3D\x3D\x3D 42 \? tt.star : tt.modulo\n\n// exponentiation operator ** and **\x3D\nif (this.options.ecmaVersion >\x3D 7 && code \x3D\x3D\x3D 42 && next \x3D\x3D\x3D 42) {\n++size\ntokentype \x3D tt.starstar\nnext \x3D this.input.charCodeAt(this.pos + 2)\n}\n\nif (next \x3D\x3D\x3D 61) return this.finishOp(tt.assign\x2C size + 1)\nreturn this.finishOp(tokentype\x2C size)\n}\n\npp.readToken_pipe_amp \x3D function(code) { // \'|&\'\nlet next \x3D this.input.charCodeAt(this.pos + 1)\nif (next \x3D\x3D\x3D code) {\nif (this.options.ecmaVersion >\x3D 12) {\nlet next2 \x3D this.input.charCodeAt(this.pos + 2)\nif (next2 \x3D\x3D\x3D 61) return this.finishOp(tt.assign\x2C 3)\n}\nreturn this.finishOp(code \x3D\x3D\x3D 124 \? tt.logicalOR : tt.logicalAND\x2C 2)\n}\nif (next \x3D\x3D\x3D 61) return this.finishOp(tt.assign\x2C 2)\nreturn this.finishOp(code \x3D\x3D\x3D 124 \? tt.bitwiseOR : tt.bitwiseAND\x2C 1)\n}\n\npp.readToken_caret \x3D function() { // \'^\'\nlet next \x3D this.input.charCodeAt(this.pos + 1)\nif (next \x3D\x3D\x3D 61) return this.finishOp(tt.assign\x2C 2)\nreturn this.finishOp(tt.bitwiseXOR\x2C 1)\n}\n\npp.readToken_plus_min \x3D function(code) { // \'+-\'\nlet next \x3D this.input.charCodeAt(this.pos + 1)\nif (next \x3D\x3D\x3D code) {\nif (next \x3D\x3D\x3D 45 && !this.inModule && this.input.charCodeAt(this.pos + 2) \x3D\x3D\x3D 62 &&\n(this.lastTokEnd \x3D\x3D\x3D 0 || lineBreak.test(this.input.slice(this.lastTokEnd\x2C this.pos)))) {\n// A `-->` line comment\nthis.skipLineComment(3)\nthis.skipSpace()\nreturn this.nextToken()\n}\nreturn this.finishOp(tt.incDec\x2C 2)\n}\nif (next \x3D\x3D\x3D 61) return this.finishOp(tt.assign\x2C 2)\nreturn this.finishOp(tt.plusMin\x2C 1)\n}\n\npp.readToken_lt_gt \x3D function(code) { // \'<>\'\nlet next \x3D this.input.charCodeAt(this.pos + 1)\nlet size \x3D 1\nif (next \x3D\x3D\x3D code) {\nsize \x3D code \x3D\x3D\x3D 62 && this.input.charCodeAt(this.pos + 2) \x3D\x3D\x3D 62 \? 3 : 2\nif (this.input.charCodeAt(this.pos + size) \x3D\x3D\x3D 61) return this.finishOp(tt.assign\x2C size + 1)\nreturn this.finishOp(tt.bitShift\x2C size)\n}\nif (next \x3D\x3D\x3D 33 && code \x3D\x3D\x3D 60 && !this.inModule && this.input.charCodeAt(this.pos + 2) \x3D\x3D\x3D 45 &&\nthis.input.charCodeAt(this.pos + 3) \x3D\x3D\x3D 45) {\n// `<!--`\x2C an XML-style comment that should be interpreted as a line comment\nthis.skipLineComment(4)\nthis.skipSpace()\nreturn this.nextToken()\n}\nif (next \x3D\x3D\x3D 61) size \x3D 2\nreturn this.finishOp(tt.relational\x2C size)\n}\n\npp.readToken_eq_excl \x3D function(code) { // \'\x3D!\'\nlet next \x3D this.input.charCodeAt(this.pos + 1)\nif (next \x3D\x3D\x3D 61) return this.finishOp(tt.equality\x2C this.input.charCodeAt(this.pos + 2) \x3D\x3D\x3D 61 \? 3 : 2)\nif (code \x3D\x3D\x3D 61 && next \x3D\x3D\x3D 62 && this.options.ecmaVersion >\x3D 6) { // \'\x3D>\'\nthis.pos +\x3D 2\nreturn this.finishToken(tt.arrow)\n}\nreturn this.finishOp(code \x3D\x3D\x3D 61 \? tt.eq : tt.prefix\x2C 1)\n}\n\npp.readToken_question \x3D function() { // \'\?\'\nconst ecmaVersion \x3D this.options.ecmaVersion\nif (ecmaVersion >\x3D 11) {\nlet next \x3D this.input.charCodeAt(this.pos + 1)\nif (next \x3D\x3D\x3D 46) {\nlet next2 \x3D this.input.charCodeAt(this.pos + 2)\nif (next2 < 48 || next2 > 57) return this.finishOp(tt.questionDot\x2C 2)\n}\nif (next \x3D\x3D\x3D 63) {\nif (ecmaVersion >\x3D 12) {\nlet next2 \x3D this.input.charCodeAt(this.pos + 2)\nif (next2 \x3D\x3D\x3D 61) return this.finishOp(tt.assign\x2C 3)\n}\nreturn this.finishOp(tt.coalesce\x2C 2)\n}\n}\nreturn this.finishOp(tt.question\x2C 1)\n}\n\npp.readToken_numberSign \x3D function() { // \'#\'\nconst ecmaVersion \x3D this.options.ecmaVersion\nlet code \x3D 35 // \'#\'\nif (ecmaVersion >\x3D 13) {\n++this.pos\ncode \x3D this.fullCharCodeAtPos()\nif (isIdentifierStart(code\x2C true) || code \x3D\x3D\x3D 92 /* \'\\\' */) {\nreturn this.finishToken(tt.privateId\x2C this.readWord1())\n}\n}\n\nthis.raise(this.pos\x2C \"Unexpected character \'\" + codePointToString(code) + \"\'\")\n}\n\npp.getTokenFromCode \x3D function(code) {\nswitch (code) {\n// The interpretation of a dot depends on whether it is followed\n// by a digit or another two dots.\ncase 46: // \'.\'\nreturn this.readToken_dot()\n\n// Punctuation tokens.\ncase 40: ++this.pos; return this.finishToken(tt.parenL)\ncase 41: ++this.pos; return this.finishToken(tt.parenR)\ncase 59: ++this.pos; return this.finishToken(tt.semi)\ncase 44: ++this.pos; return this.finishToken(tt.comma)\ncase 91: ++this.pos; return this.finishToken(tt.bracketL)\ncase 93: ++this.pos; return this.finishToken(tt.bracketR)\ncase 123: ++this.pos; return this.finishToken(tt.braceL)\ncase 125: ++this.pos; return this.finishToken(tt.braceR)\ncase 58: ++this.pos; return this.finishToken(tt.colon)\n\ncase 96: // \'`\'\nif (this.options.ecmaVersion < 6) break\n++this.pos\nreturn this.finishToken(tt.backQuote)\n\ncase 48: // \'0\'\nlet next \x3D this.input.charCodeAt(this.pos + 1)\nif (next \x3D\x3D\x3D 120 || next \x3D\x3D\x3D 88) return this.readRadixNumber(16) // \'0x\'\x2C \'0X\' - hex number\nif (this.options.ecmaVersion >\x3D 6) {\nif (next \x3D\x3D\x3D 111 || next \x3D\x3D\x3D 79) return this.readRadixNumber(8) // \'0o\'\x2C \'0O\' - octal number\nif (next \x3D\x3D\x3D 98 || next \x3D\x3D\x3D 66) return this.readRadixNumber(2) // \'0b\'\x2C \'0B\' - binary number\n}\n\n// Anything else beginning with a digit is an integer\x2C octal\n// number\x2C or float.\ncase 49: case 50: case 51: case 52: case 53: case 54: case 55: case 56: case 57: // 1-9\nreturn this.readNumber(false)\n\n// Quotes produce strings.\ncase 34: case 39: // \'\"\'\x2C \"\'\"\nreturn this.readString(code)\n\n// Operators are parsed inline in tiny state machines. \'\x3D\' (61) is\n// often referred to. `finishOp` simply skips the amount of\n// characters it is given as second argument\x2C and returns a token\n// of the type given by its first argument.\ncase 47: // \'/\'\nreturn this.readToken_slash()\n\ncase 37: case 42: // \'%*\'\nreturn this.readToken_mult_modulo_exp(code)\n\ncase 124: case 38: // \'|&\'\nreturn this.readToken_pipe_amp(code)\n\ncase 94: // \'^\'\nreturn this.readToken_caret()\n\ncase 43: case 45: // \'+-\'\nreturn this.readToken_plus_min(code)\n\ncase 60: case 62: // \'<>\'\nreturn this.readToken_lt_gt(code)\n\ncase 61: case 33: // \'\x3D!\'\nreturn this.readToken_eq_excl(code)\n\ncase 63: // \'\?\'\nreturn this.readToken_question()\n\ncase 126: // \'~\'\nreturn this.finishOp(tt.prefix\x2C 1)\n\ncase 35: // \'#\'\nreturn this.readToken_numberSign()\n}\n\nthis.raise(this.pos\x2C \"Unexpected character \'\" + codePointToString(code) + \"\'\")\n}\n\npp.finishOp \x3D function(type\x2C size) {\nlet str \x3D this.input.slice(this.pos\x2C this.pos + size)\nthis.pos +\x3D size\nreturn this.finishToken(type\x2C str)\n}\n\npp.readRegexp \x3D function() {\nlet escaped\x2C inClass\x2C start \x3D this.pos\nfor (;;) {\nif (this.pos >\x3D this.input.length) this.raise(start\x2C \"Unterminated regular expression\")\nlet ch \x3D this.input.charAt(this.pos)\nif (lineBreak.test(ch)) this.raise(start\x2C \"Unterminated regular expression\")\nif (!escaped) {\nif (ch \x3D\x3D\x3D \"[\") inClass \x3D true\nelse if (ch \x3D\x3D\x3D \"]\" && inClass) inClass \x3D false\nelse if (ch \x3D\x3D\x3D \"/\" && !inClass) break\nescaped \x3D ch \x3D\x3D\x3D \"\\\\\"\n} else escaped \x3D false\n++this.pos\n}\nlet pattern \x3D this.input.slice(start\x2C this.pos)\n++this.pos\nlet flagsStart \x3D this.pos\nlet flags \x3D this.readWord1()\nif (this.containsEsc) this.unexpected(flagsStart)\n\n// Validate pattern\nconst state \x3D this.regexpState || (this.regexpState \x3D new RegExpValidationState(this))\nstate.reset(start\x2C pattern\x2C flags)\nthis.validateRegExpFlags(state)\nthis.validateRegExpPattern(state)\n\n// Create Literal#value property value.\nlet value \x3D null\ntry {\nvalue \x3D new RegExp(pattern\x2C flags)\n} catch (e) {\n// ESTree requires null if it failed to instantiate RegExp object.\n// https://github.com/estree/estree/blob/a27003adf4fd7bfad44de9cef372a2eacd527b1c/es5.md#regexpliteral\n}\n\nreturn this.finishToken(tt.regexp\x2C {pattern\x2C flags\x2C value})\n}\n\n// Read an integer in the given radix. Return null if zero digits\n// were read\x2C the integer value otherwise. When `len` is given\x2C this\n// will return `null` unless the integer has exactly `len` digits.\n\npp.readInt \x3D function(radix\x2C len\x2C maybeLegacyOctalNumericLiteral) {\n// `len` is used for character escape sequences. In that case\x2C disallow separators.\nconst allowSeparators \x3D this.options.ecmaVersion >\x3D 12 && len \x3D\x3D\x3D undefined\n\n// `maybeLegacyOctalNumericLiteral` is true if it doesn\'t have prefix (0x\x2C0o\x2C0b)\n// and isn\'t fraction part nor exponent part. In that case\x2C if the first digit\n// is zero then disallow separators.\nconst isLegacyOctalNumericLiteral \x3D maybeLegacyOctalNumericLiteral && this.input.charCodeAt(this.pos) \x3D\x3D\x3D 48\n\nlet start \x3D this.pos\x2C total \x3D 0\x2C lastCode \x3D 0\nfor (let i \x3D 0\x2C e \x3D len \x3D\x3D null \? Infinity : len; i < e; ++i\x2C ++this.pos) {\nlet code \x3D this.input.charCodeAt(this.pos)\x2C val\n\nif (allowSeparators && code \x3D\x3D\x3D 95) {\nif (isLegacyOctalNumericLiteral) this.raiseRecoverable(this.pos\x2C \"Numeric separator is not allowed in legacy octal numeric literals\")\nif (lastCode \x3D\x3D\x3D 95) this.raiseRecoverable(this.pos\x2C \"Numeric separator must be exactly one underscore\")\nif (i \x3D\x3D\x3D 0) this.raiseRecoverable(this.pos\x2C \"Numeric separator is not allowed at the first of digits\")\nlastCode \x3D code\ncontinue\n}\n\nif (code >\x3D 97) val \x3D code - 97 + 10 // a\nelse if (code >\x3D 65) val \x3D code - 65 + 10 // A\nelse if (code >\x3D 48 && code <\x3D 57) val \x3D code - 48 // 0-9\nelse val \x3D Infinity\nif (val >\x3D radix) break\nlastCode \x3D code\ntotal \x3D total * radix + val\n}\n\nif (allowSeparators && lastCode \x3D\x3D\x3D 95) this.raiseRecoverable(this.pos - 1\x2C \"Numeric separator is not allowed at the last of digits\")\nif (this.pos \x3D\x3D\x3D start || len !\x3D null && this.pos - start !\x3D\x3D len) return null\n\nreturn total\n}\n\nfunction stringToNumber(str\x2C isLegacyOctalNumericLiteral) {\nif (isLegacyOctalNumericLiteral) {\nreturn parseInt(str\x2C 8)\n}\n\n// `parseFloat(value)` stops parsing at the first numeric separator then returns a wrong value.\nreturn parseFloat(str.replace(/_/g\x2C \"\"))\n}\n\nfunction stringToBigInt(str) {\nif (typeof BigInt !\x3D\x3D \"function\") {\nreturn null\n}\n\n// `BigInt(value)` throws syntax error if the string contains numeric separators.\nreturn BigInt(str.replace(/_/g\x2C \"\"))\n}\n\npp.readRadixNumber \x3D function(radix) {\nlet start \x3D this.pos\nthis.pos +\x3D 2 // 0x\nlet val \x3D this.readInt(radix)\nif (val \x3D\x3D null) this.raise(this.start + 2\x2C \"Expected number in radix \" + radix)\nif (this.options.ecmaVersion >\x3D 11 && this.input.charCodeAt(this.pos) \x3D\x3D\x3D 110) {\nval \x3D stringToBigInt(this.input.slice(start\x2C this.pos))\n++this.pos\n} else if (isIdentifierStart(this.fullCharCodeAtPos())) this.raise(this.pos\x2C \"Identifier directly after number\")\nreturn this.finishToken(tt.num\x2C val)\n}\n\n// Read an integer\x2C octal integer\x2C or floating-point number.\n\npp.readNumber \x3D function(startsWithDot) {\nlet start \x3D this.pos\nif (!startsWithDot && this.readInt(10\x2C undefined\x2C true) \x3D\x3D\x3D null) this.raise(start\x2C \"Invalid number\")\nlet octal \x3D this.pos - start >\x3D 2 && this.input.charCodeAt(start) \x3D\x3D\x3D 48\nif (octal && this.strict) this.raise(start\x2C \"Invalid number\")\nlet next \x3D this.input.charCodeAt(this.pos)\nif (!octal && !startsWithDot && this.options.ecmaVersion >\x3D 11 && next \x3D\x3D\x3D 110) {\nlet val \x3D stringToBigInt(this.input.slice(start\x2C this.pos))\n++this.pos\nif (isIdentifierStart(this.fullCharCodeAtPos())) this.raise(this.pos\x2C \"Identifier directly after number\")\nreturn this.finishToken(tt.num\x2C val)\n}\nif (octal && /[89]/.test(this.input.slice(start\x2C this.pos))) octal \x3D false\nif (next \x3D\x3D\x3D 46 && !octal) { // \'.\'\n++this.pos\nthis.readInt(10)\nnext \x3D this.input.charCodeAt(this.pos)\n}\nif ((next \x3D\x3D\x3D 69 || next \x3D\x3D\x3D 101) && !octal) { // \'eE\'\nnext \x3D this.input.charCodeAt(++this.pos)\nif (next \x3D\x3D\x3D 43 || next \x3D\x3D\x3D 45) ++this.pos // \'+-\'\nif (this.readInt(10) \x3D\x3D\x3D null) this.raise(start\x2C \"Invalid number\")\n}\nif (isIdentifierStart(this.fullCharCodeAtPos())) this.raise(this.pos\x2C \"Identifier directly after number\")\n\nlet val \x3D stringToNumber(this.input.slice(start\x2C this.pos)\x2C octal)\nreturn this.finishToken(tt.num\x2C val)\n}\n\n// Read a string value\x2C interpreting backslash-escapes.\n\npp.readCodePoint \x3D function() {\nlet ch \x3D this.input.charCodeAt(this.pos)\x2C code\n\nif (ch \x3D\x3D\x3D 123) { // \'{\'\nif (this.options.ecmaVersion < 6) this.unexpected()\nlet codePos \x3D ++this.pos\ncode \x3D this.readHexChar(this.input.indexOf(\"}\"\x2C this.pos) - this.pos)\n++this.pos\nif (code > 0x10FFFF) this.invalidStringToken(codePos\x2C \"Code point out of bounds\")\n} else {\ncode \x3D this.readHexChar(4)\n}\nreturn code\n}\n\npp.readString \x3D function(quote) {\nlet out \x3D \"\"\x2C chunkStart \x3D ++this.pos\nfor (;;) {\nif (this.pos >\x3D this.input.length) this.raise(this.start\x2C \"Unterminated string constant\")\nlet ch \x3D this.input.charCodeAt(this.pos)\nif (ch \x3D\x3D\x3D quote) break\nif (ch \x3D\x3D\x3D 92) { // \'\\\'\nout +\x3D this.input.slice(chunkStart\x2C this.pos)\nout +\x3D this.readEscapedChar(false)\nchunkStart \x3D this.pos\n} else if (ch \x3D\x3D\x3D 0x2028 || ch \x3D\x3D\x3D 0x2029) {\nif (this.options.ecmaVersion < 10) this.raise(this.start\x2C \"Unterminated string constant\")\n++this.pos\nif (this.options.locations) {\nthis.curLine++\nthis.lineStart \x3D this.pos\n}\n} else {\nif (isNewLine(ch)) this.raise(this.start\x2C \"Unterminated string constant\")\n++this.pos\n}\n}\nout +\x3D this.input.slice(chunkStart\x2C this.pos++)\nreturn this.finishToken(tt.string\x2C out)\n}\n\n// Reads template string tokens.\n\nconst INVALID_TEMPLATE_ESCAPE_ERROR \x3D {}\n\npp.tryReadTemplateToken \x3D function() {\nthis.inTemplateElement \x3D true\ntry {\nthis.readTmplToken()\n} catch (err) {\nif (err \x3D\x3D\x3D INVALID_TEMPLATE_ESCAPE_ERROR) {\nthis.readInvalidTemplateToken()\n} else {\nthrow err\n}\n}\n\nthis.inTemplateElement \x3D false\n}\n\npp.invalidStringToken \x3D function(position\x2C message) {\nif (this.inTemplateElement && this.options.ecmaVersion >\x3D 9) {\nthrow INVALID_TEMPLATE_ESCAPE_ERROR\n} else {\nthis.raise(position\x2C message)\n}\n}\n\npp.readTmplToken \x3D function() {\nlet out \x3D \"\"\x2C chunkStart \x3D this.pos\nfor (;;) {\nif (this.pos >\x3D this.input.length) this.raise(this.start\x2C \"Unterminated template\")\nlet ch \x3D this.input.charCodeAt(this.pos)\nif (ch \x3D\x3D\x3D 96 || ch \x3D\x3D\x3D 36 && this.input.charCodeAt(this.pos + 1) \x3D\x3D\x3D 123) { // \'`\'\x2C \'${\'\nif (this.pos \x3D\x3D\x3D this.start && (this.type \x3D\x3D\x3D tt.template || this.type \x3D\x3D\x3D tt.invalidTemplate)) {\nif (ch \x3D\x3D\x3D 36) {\nthis.pos +\x3D 2\nreturn this.finishToken(tt.dollarBraceL)\n} else {\n++this.pos\nreturn this.finishToken(tt.backQuote)\n}\n}\nout +\x3D this.input.slice(chunkStart\x2C this.pos)\nreturn this.finishToken(tt.template\x2C out)\n}\nif (ch \x3D\x3D\x3D 92) { // \'\\\'\nout +\x3D this.input.slice(chunkStart\x2C this.pos)\nout +\x3D this.readEscapedChar(true)\nchunkStart \x3D this.pos\n} else if (isNewLine(ch)) {\nout +\x3D this.input.slice(chunkStart\x2C this.pos)\n++this.pos\nswitch (ch) {\ncase 13:\nif (this.input.charCodeAt(this.pos) \x3D\x3D\x3D 10) ++this.pos\ncase 10:\nout +\x3D \"\\n\"\nbreak\ndefault:\nout +\x3D String.fromCharCode(ch)\nbreak\n}\nif (this.options.locations) {\n++this.curLine\nthis.lineStart \x3D this.pos\n}\nchunkStart \x3D this.pos\n} else {\n++this.pos\n}\n}\n}\n\n// Reads a template token to search for the end\x2C without validating any escape sequences\npp.readInvalidTemplateToken \x3D function() {\nfor (; this.pos < this.input.length; this.pos++) {\nswitch (this.input[this.pos]) {\ncase \"\\\\\":\n++this.pos\nbreak\n\ncase \"$\":\nif (this.input[this.pos + 1] !\x3D\x3D \"{\") {\nbreak\n}\n\n// falls through\ncase \"`\":\nreturn this.finishToken(tt.invalidTemplate\x2C this.input.slice(this.start\x2C this.pos))\n\n// no default\n}\n}\nthis.raise(this.start\x2C \"Unterminated template\")\n}\n\n// Used to read escaped characters\n\npp.readEscapedChar \x3D function(inTemplate) {\nlet ch \x3D this.input.charCodeAt(++this.pos)\n++this.pos\nswitch (ch) {\ncase 110: return \"\\n\" // \'n\' -> \'\\n\'\ncase 114: return \"\\r\" // \'r\' -> \'\\r\'\ncase 120: return String.fromCharCode(this.readHexChar(2)) // \'x\'\ncase 117: return codePointToString(this.readCodePoint()) // \'u\'\ncase 116: return \"\\t\" // \'t\' -> \'\\t\'\ncase 98: return \"\\b\" // \'b\' -> \'\\b\'\ncase 118: return \"\\u000b\" // \'v\' -> \'\\u000b\'\ncase 102: return \"\\f\" // \'f\' -> \'\\f\'\ncase 13: if (this.input.charCodeAt(this.pos) \x3D\x3D\x3D 10) ++this.pos // \'\\r\\n\'\ncase 10: // \' \\n\'\nif (this.options.locations) { this.lineStart \x3D this.pos; ++this.curLine }\nreturn \"\"\ncase 56:\ncase 57:\nif (this.strict) {\nthis.invalidStringToken(\nthis.pos - 1\x2C\n\"Invalid escape sequence\"\n)\n}\nif (inTemplate) {\nconst codePos \x3D this.pos - 1\n\nthis.invalidStringToken(\ncodePos\x2C\n\"Invalid escape sequence in template string\"\n)\n}\ndefault:\nif (ch >\x3D 48 && ch <\x3D 55) {\nlet octalStr \x3D this.input.substr(this.pos - 1\x2C 3).match(/^[0-7]+/)[0]\nlet octal \x3D parseInt(octalStr\x2C 8)\nif (octal > 255) {\noctalStr \x3D octalStr.slice(0\x2C -1)\noctal \x3D parseInt(octalStr\x2C 8)\n}\nthis.pos +\x3D octalStr.length - 1\nch \x3D this.input.charCodeAt(this.pos)\nif ((octalStr !\x3D\x3D \"0\" || ch \x3D\x3D\x3D 56 || ch \x3D\x3D\x3D 57) && (this.strict || inTemplate)) {\nthis.invalidStringToken(\nthis.pos - 1 - octalStr.length\x2C\ninTemplate\n\? \"Octal literal in template string\"\n: \"Octal literal in strict mode\"\n)\n}\nreturn String.fromCharCode(octal)\n}\nif (isNewLine(ch)) {\n// Unicode new line characters after \\ get removed from output in both\n// template literals and strings\nreturn \"\"\n}\nreturn String.fromCharCode(ch)\n}\n}\n\n// Used to read character escape sequences (\'\\x\'\x2C \'\\u\'\x2C \'\\U\').\n\npp.readHexChar \x3D function(len) {\nlet codePos \x3D this.pos\nlet n \x3D this.readInt(16\x2C len)\nif (n \x3D\x3D\x3D null) this.invalidStringToken(codePos\x2C \"Bad character escape sequence\")\nreturn n\n}\n\n// Read an identifier\x2C and return it as a string. Sets `this.containsEsc`\n// to whether the word contained a \'\\u\' escape.\n//\n// Incrementally adds only escaped chars\x2C adding other chunks as-is\n// as a micro-optimization.\n\npp.readWord1 \x3D function() {\nthis.containsEsc \x3D false\nlet word \x3D \"\"\x2C first \x3D true\x2C chunkStart \x3D this.pos\nlet astral \x3D this.options.ecmaVersion >\x3D 6\nwhile (this.pos < this.input.length) {\nlet ch \x3D this.fullCharCodeAtPos()\nif (isIdentifierChar(ch\x2C astral)) {\nthis.pos +\x3D ch <\x3D 0xffff \? 1 : 2\n} else if (ch \x3D\x3D\x3D 92) { // \"\\\"\nthis.containsEsc \x3D true\nword +\x3D this.input.slice(chunkStart\x2C this.pos)\nlet escStart \x3D this.pos\nif (this.input.charCodeAt(++this.pos) !\x3D\x3D 117) // \"u\"\nthis.invalidStringToken(this.pos\x2C \"Expecting Unicode escape sequence \\\\uXXXX\")\n++this.pos\nlet esc \x3D this.readCodePoint()\nif (!(first \? isIdentifierStart : isIdentifierChar)(esc\x2C astral))\nthis.invalidStringToken(escStart\x2C \"Invalid Unicode escape\")\nword +\x3D codePointToString(esc)\nchunkStart \x3D this.pos\n} else {\nbreak\n}\nfirst \x3D false\n}\nreturn word + this.input.slice(chunkStart\x2C this.pos)\n}\n\n// Read an identifier or keyword token. Will check for reserved\n// words when necessary.\n\npp.readWord \x3D function() {\nlet word \x3D this.readWord1()\nlet type \x3D tt.name\nif (this.keywords.test(word)) {\ntype \x3D keywordTypes[word]\n}\nreturn this.finishToken(type\x2C word)\n}", Scope = Public
	#tag EndConstant

	#tag Constant, Name = EXAMPLE_MARKDOWN, Type = String, Dynamic = False, Default = \"# Header 1\n#Also Header 1\n## Header 2\nNot a #header\nText\n\nhttps://google.com\n\n```xojo\nVar i As Integer \x3D 100\nVar s As String \x3D \"testing\"\n```\n\n```\n// This is a generic code fence\n```\n\n```objo\nvar p \x3D Person() # This is a comment\n```\n\n## About\n`SyntaxArea` is a free\x2C open source\x2C code editor written in 100% Xojo. It\'s built upon the open source [`TextInputCanvas`][tic] desktop control and implements all standard keyboard shortcuts and fully supports international input.\n\n## Background\nThis is the third (and currently best!) code editor that I\'ve written in Xojo. `SyntaxArea` began as an API 2.0 port of the venerable [`CustomEditField`][cef] (CEF) control but has been significantly refactored\x2C is better documented and many bugs have been fixed.\n\nRather than numerous classes\x2C interfaces and images scattered in multiple folders as was the case with CEF\x2C everything you need to use the `Editor` is contained within the `SyntaxArea` module (and two support modules).\n\nThe syntax highlighting engine has been improved and styling information removed from the definition files. The editor now has a theming engine to allow easier switching of its appearance when moving between light and dark mode.\n\n## Features\nHere\'s a list of the some of the editor\'s features:\n- Works on macOS and Windows (Linux _should_ work but is untested)\n- 100% API 2.0\n- **Syntax highlighting** (implemented through XML definition files)\n- Theme support\n- High performance (handles thousands of lines of code with ease)\n- Extensive support for keyboard shortcuts\n- Autocomplete\n- Line numbers\n- Optional block folding\n- Dirty line support\n- Optional right margin ruler\n- Undo / redo\n- Native scrollbars on macOS with support for Xojo scrollbars on Windows.\n\n## Requirements\nThe editor is 100% native Xojo code. The only dependency is the free and open source [`TextInputCanvas`][tic] plugin. This plugin is a Xojo `Canvas` control that handles international input. Make sure you download it and put it in your Xojo `plugins` folder before launching the Xojo IDE.\n\n## Usage\nThe best way to get a feel for the editor is to open and run the demo project included in the repo.\n\nThe editor is a `TextInputCanvas` **subclass** and is **_found_** within the `SyntaxArea` module. You will need to copy three modules from the demo project into your own:\n- `SyntaxArea`: Contains all classes related to the editor.\n- `UndoKit`: Contains classes to support undo/redo. This is in a separate module so that you can use it in other projects.\n- `MessageCentre`: Supports sending and receiving messages between components in a project. It\'s used internally within `SyntaxArea` but you can also use it for your own purposes within your own projects.\n\nFor more detailed information\x2C [see the Wiki][wiki].\n\n## Feedback\nI welcome feedback\x2C bug reports and feature requests. Please open a GitHub issue. I\'m also happy to take pull requests - if you make one please make sure you stick to the formatting styles used throughout the project.\n\n## License\nThis software is provided \"as-is\" under the MIT license.\n\n## Acknowledgements\n- [Alex Restrepo][alexr]\x2C the author of the original `CustomEditField`.\n- [Thomas Tempelmann][thomast] who has acted as a steward for `CustomEditField` for several years.\n- [Matthew Combatti][matthewc] who shared an early port of `CustomEditField` to API 2.0.\n\n[tic]: https://einhugur.com/Html/opensource.html \n[cef]: https://github.com/tempelmann/custom-editfield\n[alexr]: https://github.com/alexrestrepo\n[thomast]: https://www.tempel.org\n[matthewc]: https://github.com/simulanics\n[wiki]: https://github.com/gkjpettet/SyntaxArea/wiki", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = EXAMPLE_OBJOSCRIPT, Type = String, Dynamic = False, Default = \"class Person {\n# This is a comment.\n}", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = EXAMPLE_POSTGRESQL, Type = String, Dynamic = False, Default = \"INSERT INTO dinners (name\x2C birthdate\x2C entree\x2C side\x2C dessert) \nVALUES (\'Dolly\'\x2C \'1946-01-19\'\x2C \'steak\'\x2C \'salad\'\x2C \'cake\')\x2C \n(\'Etta\'\x2C \'1938-01-25\'\x2C \'chicken\'\x2C \'fries\'\x2C \'ice cream\')\x2C \n(\'Irma\'\x2C \'1941-02-18\'\x2C \'tofu\'\x2C \'fries\'\x2C \'cake\')\x2C \n(\'Barbara\'\x2C \'1948-12-25\'\x2C \'tofu\'\x2C \'salad\'\x2C \'ice cream\')\x2C \n(\'Gladys\'\x2C \'1944-05-28\'\x2C \'steak\'\x2C \'fries\'\x2C \'ice cream\');", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = EXAMPLE_XML, Type = String, Dynamic = False, Default = \"<\?xml version\x3D\"1.0\" encoding\x3D\"UTF-8\"\?>\n<highlightDefinition version\x3D\"2.0\">\n<name>Xojo</name>\n\n<!-- Module block -->\n<blockStartMarker indent\x3D\"1\">^\\s*(protected\\b|private\\b)\?\\s*module\\b</blockStartMarker>\n<blockEndMarker>^\\s*end\\s+module\\b</blockEndMarker>\n\n<!-- Class block -->\n<blockStartMarker indent\x3D\"1\">^\\s*(protected\\b|private\\b)\?\\s*class\\b</blockStartMarker>\n<blockEndMarker>^\\s*end\\s+class\\b</blockEndMarker>\n\n<!-- Interface block - prevents anything inside an interface from being indented (beyond level 1 indentation). -->\n<blockStartMarker indent\x3D\"1\" newstate\x3D\"insideInterface\">^\\s*(protected\\b|private\\b)\?\\s*interface\\b</blockStartMarker>\n<blockEndMarker condition\x3D\"insideInterface\" newstate\x3D\"\">^\\s*end\\s+interface\\b</blockEndMarker>\n\n<!-- Everything else -->\n<blockStartMarker indent\x3D\"1\">^\\s*(\?:(if|elseif)\\b.*\\sthen\\b\\s*((\'|//)|(\?!.+\?))|if\\s(\?!.*\\sthen\\b)|^\\s*(public\\b|protected\\b|private\\b)\?\\s*(shared\\b)\?\\s*(\?&lt;!end\\b)\\s*(sub|function|property)\\b|(do|for|while|select|case|try|catch|else|enum|Get|Set|#if|#elseif|#else)\\b)</blockStartMarker>\n<blockEndMarker>^\\s*(\?:end|wend|next|loop|else|case|catch|elseif|#else|#elseif|#endif)\\b</blockEndMarker>\n\n<lineContinuationMarker indent\x3D\"2\">^((\?:\"[^\"\\r\\n]*\"|(\?!\'|//|\\brem\\b)[^\\r\\n_])*)_[\\t\\x20]*((\?:\'|//|\\brem\\b)[^\\r\\n]*|)$</lineContinuationMarker>\n\n<symbols> <!-- these are used to identify declared symbols that are useful for navigation inside larger source file -->\n<symbol type\x3D\"method\">\n<entryRegEx>^\\s*(\?:public|protected|private)\?\\b\\s*(shared\\b)\?\\s*(\?&lt;!end\\b)\\s*(\?:sub|function)\\b.+\?\\([^\\)]*\\)\\s*(\?:as\\b\\s*\\w+\\s*)\?</entryRegEx>\n</symbol>\n<symbol type\x3D\"property\">\n<entryRegEx>^\\s*(\?:public|protected|private)\?\\b\\s*(shared\\b)\?\\s*(\?&lt;!end\\b)\\s*(property\\b).+</entryRegEx>\n</symbol>\n<symbol type\x3D\"class\">\n<entryRegEx>^\\s*(\?:protected\\b|private\\b)\?\\s*class\\s+\\w+\\s*</entryRegEx>\n</symbol>\n<symbol type\x3D\"module\">\n<entryRegEx>^\\s*(\?:protected\\b|private\\b)\?\\s*module\\s+\\w+\\s*</entryRegEx>\n</symbol>\n<symbol type\x3D\"interface\">\n<entryRegEx>^\\s*(\?:protected\\b|private\\b)\?\\s*interface\\s+\\w+\\s*</entryRegEx>\n</symbol>\n</symbols>\n\n<contexts caseSensitive\x3D\"no\">\n<highlightContext name\x3D\"type\">\n<keywords>\n<string>Boolean</string>\n<string>Color</string>\n<string>Double</string>\n<string>Integer</string>\n<string>Int8</string>\n<string>UInt8</string>\n<string>Int16</string>\n<string>UInt16</string>\n<string>Int32</string>\n<string>UInt32</string>\n<string>Int64</string>\n<string>UInt64</string>\n<string>Single</string>\n<string>String</string>\n<string>CFString</string>\n<string>Ptr</string>\n</keywords>\n</highlightContext>\n\n<highlightContext name\x3D\"keyword\">\n<keywords>\n<string>#Else</string>\n<string>#ElseIf</string>\n<string>#EndIf</string>\n<string>#If</string>\n<string>#Pragma</string>\n<string>AddHandler</string>\n<string>AddressOf</string>\n<string>And</string>\n<string>Array</string>\n<string>As</string>\n<string>Assigns</string>\n<string>ByRef</string>\n<string>ByVal</string>\n<string>Call</string>\n<string>Case</string>\n<string>Catch</string>\n<string>Class</string>\n<string>Const</string>\n<string>Continue</string>\n<string>CType</string>\n<string>Declare</string>\n<string>Delegate</string>\n<string>Dim</string>\n<string>Do</string>\n<string>DownTo</string>\n<string>Each</string>\n<string>Else</string>\n<string>ElseIf</string>\n<string>End</string>\n<string>Enum</string>\n<string>Event</string>\n<string>Exception</string>\n<string>Exit</string>\n<string>Extends</string>\n<string>False</string>\n<string>Finally</string>\n<string>For</string>\n<string>Function</string>\n<string>Get</string>\n<string>Global</string>\n<string>GoTo</string>\n<string>Handles</string>\n<string>If</string>\n<string>Implements</string>\n<string>In</string>\n<string>Inherits</string>\n<string>Inline68K</string>\n<string>Interface</string>\n<string>Is</string>\n<string>IsA</string>\n<string>Lib</string>\n<string>Loop</string>\n<string>Me</string>\n<string>Mod</string>\n<string>Module</string>\n<string>Namespace</string>\n<string>New</string>\n<string>Next</string>\n<string>Nil</string>\n<string>Not</string>\n<string>Object</string>\n<string>Of</string>\n<string>Optional</string>\n<string>Or</string>\n<string>ParamArray</string>\n<string>Private</string>\n<string>Property</string>\n<string>Protected</string>\n<string>Public</string>\n<string>Raise</string>\n<string>RaiseEvent</string>\n<string>Redim</string>\n<string>Rem</string>\n<string>RemoveHandler</string>\n<string>Return</string>\n<string>Select</string>\n<string>Self</string>\n<string>Set</string>\n<string>Shared</string>\n<string>Soft</string>\n<string>Static</string>\n<string>Step</string>\n<string>Structure</string>\n<string>Sub</string>\n<string>Super</string>\n<string>Then</string>\n<string>To</string>\n<string>True</string>\n<string>Try</string>\n<string>Until</string>\n<string>Var</string>\n<string>Wend</string>\n<string>While</string>\n<string>With</string>\n</keywords>\n</highlightContext>\n\n<highlightContext name\x3D\"double\" fallback\x3D\"number\">\n<entryRegEx>(\?&lt;\x3D[^\\w.&#x7F;-&#x10F7FF;]|^)(\?\x3D\\d+\\.|\\.\\d+|\\d+e(\?:\\d|\\b))(\\d*\\.\\d*(\?:e[-+]\?\\d*)\?|\\d+e[-+]\?\\d*)(\?\x3D[^\\w.&#x7F;-&#x10F7FF;]|$)</entryRegEx>\n</highlightContext>    \n\n<highlightContext name\x3D\"integer\" fallback\x3D\"number\">\n<entryRegEx>(\?&lt;\x3D[^\\w.&#x7F;-&#x10F7FF;]|^)(\?:\\d+|&amp;h[[:xdigit:]]*\\b|&amp;o[0-7]*\\b|&amp;b[01]*\\b)(\?\x3D[^\\w.&#x7F;-&#x10F7FF;]|$)</entryRegEx>\n</highlightContext>\n\n<highlightContext name\x3D\"pragma\" fallback\x3D\"directive\">\n<entryRegEx>#(\?:if|elseif|else|endif|pragma)</entryRegEx>\n</highlightContext>        \n\n<highlightContext name\x3D\"comment\">\n<startRegEx>\'|\\/\\/|\\brem\\b</startRegEx>\n<endRegEx>[\\n\\r]</endRegEx>\n</highlightContext>\n\n<highlightContext name\x3D\"string\">\n<entryRegEx>\"[^\"\\r\\n]*[\"\\r\\n]|&amp;u[[:xdigit:]]*\\b</entryRegEx>\n</highlightContext>\n\n<highlightContext name\x3D\"colorRed\">\n<entryRegEx>(\?&lt;\x3D&amp;c)[[:xdigit:]]{1\x2C2}</entryRegEx>\n</highlightContext>\n\n<highlightContext name\x3D\"colorGreen\">\n<entryRegEx>(\?&lt;\x3D&amp;c[[:xdigit:]]{2})[[:xdigit:]]{1\x2C2}</entryRegEx>\n</highlightContext>\n\n<highlightContext name\x3D\"colorBlue\">\n<entryRegEx>(\?&lt;\x3D&amp;c[[:xdigit:]]{4})[[:xdigit:]]{1\x2C2}</entryRegEx>\n</highlightContext>\n</contexts>\n</highlightDefinition>", Scope = Protected, Description = 4578616D706C6520584D4C20746578742E
	#tag EndConstant

	#tag Constant, Name = EXAMPLE_XOJO, Type = String, Dynamic = False, Default = \"#If Not DebugBuild\n#Pragma DisableBackgroundTasks\n#EndIf\n\n// Make sure we\'re not updating while the LineHighlighter is busy.\nVar lock As New SyntaxArea.LinesLock(Self)\n#Pragma Unused lock\n\nSelf.UpdateIndentation\n\nIf Not mRedrawEverything And Not mRedrawCaret Then\nmRedrawEverything \x3D True\nEnd If\n\nIf gr.Height <\x3D 0 Or gr.Width <\x3D 0 Then\n// There is nothing to draw.\nReturn\nEnd If\n\n// Check our back buffer to make sure we\'ve got one that we can draw to.\n// If we don\'t have a back buffer\x2C then we need to create one.\n// If our size is different than our back buffer\x2C then we need to create a new one.\nVar realign As Boolean\nrealign \x3D (mBackBuffer \x3D Nil) Or (gr.Width <> mBackBuffer.Width) Or _\n(gr.Height <> mBackBuffer.Height)\n\n// macOS already double buffers for us so we don\'t need a back buffer.\nVar createBackBuffers As Boolean \x3D Not TargetMacOS\n\nIf realign Then\nIf createBackBuffers Then\n// Create a double buffer.\nmBackBuffer \x3D parentWindow.BitmapForCaching(gr.Width\x2C gr.Height)\nEnd If\nCalculateMaxHorizontalSB\nCalculateMaxVerticalSB\nInvalidateAllLines\nmRedrawEverything \x3D True\nEnd If\n\n// Get a graphics context to draw onto.\nVar g As Graphics\nIf mBackBuffer \x3D Nil Then\n// Draw directly into the Canvas graphics (required for Retina support)\ng \x3D gr\nElse\n// Draw first into a separate graphics buffer which is then painted into the \n// Canvas at the end.\ng \x3D mBackBuffer.Graphics\nEnd If\n\nIf mRedrawCaret And Not mRedrawEverything Then\nmRedrawEverything \x3D True\nEnd If\n\n#If DebugBuild\nRedrawTime \x3D System.Microseconds\n#EndIf\n\nVar sx\x2C sy As Double\nVar gg As Graphics // For the gutter (left frame showing line numbers).\nVar gutterWidth As Integer \x3D LineNumberOffset\n\n// Line numbers.\nIf Self.displayLineNumbers Then\n// Create the line numbers picture if needed.\nIf Not createBackBuffers Then\n// Draw the gutter directly into the canvas graphics object (Retina requirement).\ngg \x3D gr\nElse\n// Use a separate graphics buffer for the gutter.\nIf Gutter \x3D Nil Or Gutter.Height <> g.Height Or gutter.Width <> gutterWidth Then\nGutter \x3D parentWindow.BitmapForCaching(gutterWidth\x2C g.Height)\ngg \x3D gutter.Graphics\ngg.FontName \x3D LineNumbersTextFont\ngg.FontSize \x3D LineNumbersFontSize\nElse\ngg \x3D gutter.Graphics\nEnd If\nEnd If\n  \n// Repaint the gutter background if needed.\nIf mfullRefresh Or LastDrawnTopLine <> ScrollPosition Then\ngg.DrawingColor \x3D GutterBackgroundColor.LighterColor(10\x2C True)\ngg.FillRectangle LineNumberOffset - FoldingOffset\x2C 0\x2C FoldingOffset\x2C g.Height\ngg.DrawingColor \x3D GutterBackgroundColor\ngg.FillRectangle 0\x2C 0\x2C gutterWidth - FoldingOffset\x2C g.Height\ngg.DrawingColor \x3D GutterSeparationLineColor\ngg.DrawLine(LineNumberOffset - 1\x2C 0\x2C LineNumberOffset - 1\x2C g.Height)\nLastDrawnTopLine \x3D ScrollPosition\nEnd If\nEnd If\n\n// Paint the selection and get its range.\nVar selection As New SyntaxArea.CharSelection(-1\x2C -1\x2C -1\x2C -1\x2C TextSelectionColor)\nVar tmpSelection As SyntaxArea.CharSelection\n\n// Get the selection range.\nIf SelectionLength > 0 Then\nselection.offset \x3D SelectionStart\nselection.length \x3D SelectionLength\nselection.StartLine \x3D Lines.GetLineNumberForOffset(SelectionStart)\nselection.EndLine \x3D Lines.GetLineNumberForOffset(SelectionStart + SelectionLength)\nEnd If\n\n// Set the text properties.\ng.FontSize \x3D FontSize\ng.FontName \x3D TextFont\nIf g <> gr Then\ngr.FontSize \x3D FontSize\ngr.FontName \x3D TextFont\nEnd If\n\n// Starting positions.\nsx \x3D LeftMarginOffset + LineNumberOffset - ScrollPositionX\nsy \x3D g.TextHeight\n\nVar line As TextLine\nVar linesDrawn As Integer\nVar firstLine As Integer\nVar lastLine As Integer\n\n// The lowest possible line to draw is ScrollPosition\x2C so start there.\nIf EnableLineFoldings Then\nfirstline \x3D Lines.GetNumberOfLinesNeededToView(ScrollPosition)\nlastLine \x3D Lines.Count - 1\nElse\nfirstLine \x3D ScrollPosition\nlastLine \x3D Min(Lines.Count - 1\x2C ScrollPosition + MaxVisibleLines)\nEnd If\n\nVar linesOnScreen As Integer\n\nFor lineIdx As Integer \x3D firstLine To lastLine\nlinesOnScreen \x3D linesOnScreen + 1\n\n// Get the current line.\nline \x3D Lines.GetLine(lineIdx)\nIf Not line.Visible Then Continue For\n\nIf _\nInvalidLines.HasKey(lineIdx) Or _\nmFullRefresh Or _\nselection.IsLineIndexInRange(lineIdx) Or _\n(PreviouslyDrawnSelection <> Nil And PreviouslyDrawnSelection.IsLineIndexInRange(lineIdx)) Then\n\n// This line needs to be repainted (invalid)\x2C or is a full refresh\x2C or is\n// part of the previous or current selection.\n\n// Clear the background for this line.\nVar lineBackColor As Color \x3D BackColor\n\nIf Not UseBackgroundColorForLine(lineIdx\x2C lineBackColor) Then\nlineBackColor \x3D BackColor\nEnd If\ng.DrawingColor \x3D lineBackColor\ng.FillRectangle(LineNumberOffset\x2C sy - g.TextHeight\x2C g.Width - LineNumberOffset\x2C TextHeight)\n\n// Draw highlighted ranges.\n// First draw the highlighted ranges.\nVar ranges() As SyntaxArea.CharSelection \x3D _\nHighlightedRanges.SelectionsForLine(lineIdx)\n\n// Then draw words with a background.\nline.AppendHighlightedWords(ranges\x2C lineIdx)\n\n// Finally draw the selection.\nranges.Add(selection)\n\nIf matchingBlockHighlight <> Nil Then\nranges.Add(MatchingBlockHighlight)\nEnd If\n\nVar x\x2C y\x2C w As Double\nFor Each tmpSelection In ranges\n If tmpSelection.IsLineIndexInRange(lineIdx) Then\n// If in selection\x2C highlight the line.\nIf mHasFocus Or Not tmpSelection.LosesFocus Then\ng.DrawingColor \x3D tmpSelection.SelectionColor\nElse\ng.DrawingColor \x3D BackColor.DarkerColor(30\x2C True)\nEnd If\n\nIf lineIdx > tmpSelection.StartLine And lineIdx < tmpSelection.EndLine Then\n// A fully selected line.\ng.FillRectangle(LineNumberOffset\x2C sy - g.TextHeight\x2C g.Width - line.VisualIndent(Self.IndentVisually)\x2C TextHeight)\n\nElseIf lineIdx \x3D tmpSelection.StartLine And tmpSelection.EndLine <> tmpSelection.StartLine Then\n// First line.\nXYAtCharPos(tmpSelection.Offset\x2C lineIdx\x2C x\x2C y)\n\nIf tmpSelection.Rounded Then\ng.FillRoundRectangle(x\x2C sy - g.TextHeight\x2C g.Width - x + 10\x2C TextHeight\x2C 8\x2C 8)\nElse\ng.FillRectangle(x\x2C sy - g.TextHeight\x2C g.Width - x\x2C TextHeight)\nEnd If\n\nElseIf lineIdx \x3D tmpSelection.EndLine And tmpSelection.EndLine <> tmpSelection.StartLine Then\n// Last line.\nXYAtCharPos(tmpSelection.Offset + tmpSelection.Length\x2C lineIdx\x2C x\x2C y)\n\nIf tmpSelection.Rounded Then\ng.FillRoundRectangle(LineNumberOffset - 10\x2C sy - g.TextHeight\x2C x - LineNumberOffset + 10\x2C TextHeight\x2C 8\x2C 8)\nElse\ng.FillRectangle(LineNumberOffset\x2C sy - g.TextHeight\x2C x - LineNumberOffset\x2C TextHeight)\nEnd If\n\nElse\n// Small block in line.\nXYAtCharPos(tmpSelection.Offset\x2C lineIdx\x2C x\x2C y)\nXYAtCharPos(tmpSelection.Offset + tmpSelection.Length\x2C lineIdx\x2C w\x2C y)\n\nIf tmpSelection.Rounded Then\ng.FillRoundRectangle(x\x2C sy - g.TextHeight\x2C w - x\x2C TextHeight\x2C 8\x2C 8)\nElse\ng.FillRectangle(x\x2C sy - g.TextHeight\x2C w - x\x2C TextHeight)\nEnd If\nEnd If\nEnd If\nNext tmpSelection\n\n// Paint a line background\?\nPaintBelowLine(lineIdx\x2C g\x2C LineNumberOffset\x2C sy - g.TextHeight\x2C g.Width - LineNumberOffset - 1\x2C TextHeight)\n\n// Paint the line.\nline.Paint(TextStorage\x2C g\x2C sx\x2C sy - (g.TextHeight - g.FontAscent)\x2C TextColor\x2C DisplayInvisibleCharacters\x2C SelectionStart\x2C SelectionLength\x2C True\x2C Self.IndentVisually)\n\n// Line overlay\?\nPaintAboveLine(lineIdx\x2C g\x2C LineNumberOffset\x2C sy - g.TextHeight\x2C g.Width - LineNumberOffset - 1\x2C TextHeight)\n\n// Contents after folded line...\nIf line.Folded Then\nVar tmp As SyntaxArea.TextLine \x3D Lines.GetLine(Lines.NextBlockEndLine(lineIdx))\nIf tmp <> Nil Then\n// Make italic and paint after the current line.\ntmp.Italic \x3D True\ntmp.Paint(TextStorage\x2C g\x2C sx + line.TotalWidth + SyntaxArea.BlockFoldedTrailImage.Width + 6\x2C sy - (g.TextHeight - g.FontAscent)\x2C TextColor\x2C False\x2C SelectionStart\x2C SelectionLength\x2C False\x2C Self.IndentVisually)\ntmp.Italic \x3D False\nEnd If\nEnd If\n\n// Autocomplete suggestion.\nIf SelectionLength \x3D 0 And lineIdx \x3D CaretLine And TrailingSuggestion <> \"\" Then\ng.DrawingColor \x3D SyntaxArea.AdjustColorForDarkMode(&cAAAAAA)\nVar c As Color \x3D g.DrawingColor\nIf Color.IsDarkMode Then\ng.DrawingColor \x3D Color.RGB(c.Red + 75\x2C c.Green + 75\x2C c.Blue + 75)\nEnd If\ng.DrawText(trailingSuggestion\x2C AutocompleteSuggestionInsertionX\x2C sy - (g.TextHeight - g.FontAscent))\nEnd If\n\n// Draw the gutter last so that it overwrites text that was drawn \n// into the gutter area when it\'s horizontally scrolled.\nIf displayLineNumbers Then\n// The caret line is slightly darker.\nIf EnableLineFoldings Then\ngg.DrawingColor \x3D GutterBackgroundColor.LighterColor(10\x2C True)\ngg.FillRectangle(LineNumberOffset - FoldingOffset - 1\x2C sy - g.TextHeight\x2C FoldingOffset\x2C TextHeight)\nEnd If\nIf CaretLine \x3D lineIdx Then\ngg.DrawingColor \x3D GutterBackgroundColor.DarkerColor(20\x2C True)\ngg.FillRectangle(0\x2C sy - g.TextHeight\x2C LineNumberOffset - 1 - FoldingOffset\x2C TextHeight)\ngg.Bold \x3D True\ngg.DrawingColor \x3D SyntaxArea.AdjustColorForDarkMode(Color.Black)\nElse\ngg.DrawingColor \x3D GutterBackgroundColor\ngg.FillRectangle(0\x2C sy - g.TextHeight\x2C LineNumberOffset - 1 - FoldingOffset\x2C TextHeight)\nEnd If\n\nIf DisplayDirtyLines And line.IsDirty Then\ngg.DrawingColor \x3D DirtyLinesColor\ngg.FillRectangle(LineNumberOffset - 4\x2C sy - g.TextHeight\x2C 3\x2C TextHeight)\nEnd If\n\n// Bookmarks\?\nIf BookmarkTable.HasKey(lineIdx) Then\nVar img As Picture \x3D UseBookmarkIconForLine(lineIdx)\nIf img \x3D Nil Then img \x3D BookmarkImage\ngg.DrawPicture(img\x2C 0\x2C sy - g.TextHeight + (g.TextHeight - img.Height) / 2)\nEnd If\n\n// Row icon available\?\nIf line.Icon <> Nil Then\nVar icn As Picture \x3D line.Icon\ngg.DrawPicture(icn\x2C gutterWidth - icn.Width - 2 - FoldingOffset\x2C sy - g.TextHeight + (g.TextHeight - icn.Height) / 2)\nElse\n// Line number.\ngg.DrawingColor \x3D LineNumbersColor\nIf gr \x3D gg Then\ngg.FontName \x3D LineNumbersTextFont\ngg.FontSize \x3D LineNumbersFontSize\nEnd If\ngg.DrawText(Str(lineIdx + 1)\x2C LineNumberOffset - 2 - gg.TextWidth(Str(lineIdx + 1)) - FoldingOffset\x2C sy - (TextHeight - gg.FontAscent) / 2)\nIf gr \x3D gg Then\ngg.FontSize \x3D FontSize\ngg.FontName \x3D TextFont\nEnd If\nEnd If\n\nIf EnableLineFoldings And line.IsBlockStart Then\nIf line.Folded Then\n// Draw a line folded marker.\ngg.DrawPicture(BlockFoldedImage\x2C LineNumberOffset - BlockFoldedImage.Width - 2\x2C sy - TextHeight + (TextHeight - BlockFoldedImage.Height) / 2 + 1)\nElse\ngg.DrawPicture(BlockStartImage\x2C LineNumberOffset - BlockStartImage.Width - 2\x2C sy - TextHeight + (TextHeight - BlockStartImage.Height) / 2 + 1)\nEnd If\nElseIf EnableLineFoldings And line.IsBlockEnd Then\ngg.DrawPicture(BlockEndImage\x2C LineNumberOffset - BlockEndImage.Width - 2\x2C sy - TextHeight + (TextHeight - BlockEndImage.Height) / 2 + 1)\nEnd If\n\ngg.Bold \x3D False\nEnd If\n\nlinesDrawn \x3D linesDrawn + 1\nEnd If\n\n// Go to the next line.\nIf TextHeight \x3D 0 Then Break\nsy \x3D sy + TextHeight\nIf sy - g.TextHeight > g.Height Then\n// Or bail out if we\'ve reached the end of the canvas.\nExit For\nEnd If\nNext lineIdx\n\nVisibleLineRange.Offset \x3D firstLine\nVisibleLineRange.Length \x3D linesOnScreen\n\n// Clear the rest of the buffer if necessary.\nsy \x3D sy - g.TextHeight\nIf sy < g.Height Then\ng.DrawingColor \x3D BackColor\ng.FillRectangle(gutterWidth\x2C sy\x2C g.Width - gutterWidth\x2C g.Height - sy)\nEnd If\n\n// Invalid lines are no longer invalid.\nInvalidLines.RemoveAll\nmFullRefresh \x3D False\nPreviouslyDrawnSelection \x3D selection\n\nIf MatchingBlockHighlight <> Nil Then\nInvalidateLine(MatchingBlockHighlight.StartLine)\nMatchingBlockHighlight \x3D Nil\nEnd If\n\n// Draw the line numbers.\nIf DisplayLineNumbers And gg <> gr Then\ng.DrawPicture(Gutter\x2C 0\x2C 0)\nEnd If\n\n// And their frame.\nIf Border Then\ng.DrawingColor \x3D BorderColor\ng.DrawRectangle(0\x2C 0\x2C g.Width\x2C g.Height)\nEnd If\n\n// Now we can draw the back buffer to the screen\nIf mBackBuffer <> Nil Then\ngr.DrawPicture(mBackBuffer\x2C 0\x2C 0\x2C gr.Width\x2C gr.Height\x2C 0\x2C 0\x2C mBackBuffer.Width\x2C mBackBuffer.Height)\nEnd If\n\n// Paint the location of the previous/next block character.\nIf BlockBeginPosX >\x3D 0 Then\nPaintHighlightedBlock(gr)\nBlockBeginPosX \x3D -1\nBlockBeginPosY \x3D -1\nEnd If\n\n// Right margin marker.\nIf DisplayRightMarginMarker And RightMarginAtPixel > 0 Then\ngr.DrawPicture(RightMarginLineImage\x2C RightMarginAtPixel - ScrollPositionX + LeftMarginOffset + LineNumberOffset\x2C 0\x2C 1\x2C gr.Height\x2C 0\x2C 0\x2C 1\x2C 1)\nEnd If\n\n// Paint the caret.\nIf DragSource \x3D Nil Then\nPaintCaret(CaretPos\x2C gr\x2C gutterWidth)\nElse\nPaintCaret(DragTextPos\x2C gr\x2C gutterWidth)\nEnd If\n\nPaintOver(gr\x2C gutterWidth)\n\n#If DebugBuild\nredrawTime \x3D System.Microseconds - redrawTime\n#EndIf\n\nmRedrawEverything \x3D False\nmRedrawCaret \x3D False", Scope = Protected, Description = 4578616D706C6520586F6A6F20636F64652E
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
#tag Events Info
	#tag Event , Description = 412073796D626F6C207761732073656C656374656420696E2074686520636F6E74726F6C2E
		Sub SymbolSelected(symbol as SyntaxArea.DocumentSymbol)
		  If symbol = Nil Then Return
		  CodeEditor.SelectLine(CodeEditor.LineNumAtCharPos(symbol.Offset))
		  
		End Sub
	#tag EndEvent
	#tag Event , Description = 54686520636F6E74726F6C2069732072657175657374696E6720616E206172726179206F6620646F63756D656E742073796D626F6C7320746F20646973706C61792E
		Function GetSymbols() As SyntaxArea.DocumentSymbol()
		  Return CodeEditor.DocumentSymbols
		  
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events CodeEditor
	#tag Event , Description = 54686520656469746F72206973206F70656E696E672E
		Sub Opening()
		  Me.UndoManager = App.UndoManager
		  
		  // Set the scrollbars on Windows and Linux (they are native on macOS).
		  #If TargetMacOS
		    HorizontalScrollBar.Visible = False
		    VerticalScrollBar.Visible = False
		    CodeEditor.Width = CodeEditor.Width + VerticalScrollBar.Width
		    CodeEditor.Height = CodeEditor.Height + HorizontalScrollBar.Height
		  #Else
		    Me.SetScrollbars(HorizontalScrollBar, VerticalScrollBar)
		  #EndIf
		  
		  
		  
		End Sub
	#tag EndEvent
	#tag Event
		Function AutocompleteOptionsForPrefix(prefix As String) As SyntaxArea.AutocompleteOptions
		  Var data As SyntaxArea.AutocompleteOptions
		  
		  If MyAutocompleteEngine <> Nil Then
		    data = MyAutocompleteEngine.OptionsForPrefix(prefix)
		  End If
		  
		  Return data
		  
		End Function
	#tag EndEvent
	#tag Event
		Sub SelectionChanged(line As Integer, column As Integer, length As Integer)
		  // Update the current selection / cursor position in the info panel.
		  
		  Info.SelectionStartLine = line
		  Info.SelectionStart = column
		  Info.SelectionLength = length
		  
		  If LastSelectionChangedLine <> line And CodeEditor.SymbolCount > 0 Then
		    Info.CurrentSymbol = CodeEditor.CaretSymbol
		  End If
		  
		  LastSelectionChangedLine = line
		  
		End Sub
	#tag EndEvent
	#tag Event , Description = 54686520656469746F72206973206C6F6164696E6720612073796E74617820646566696E6974696F6E20746861742069732072657175657374696E67206120646566696E6974696F6E20657874656E73696F6E20776974682074686520737065636966696564206E616D652E20596F752073686F756C642072657475726E204E696C206966206E6F6E6520697320617661696C61626C652E
		Function RequestDefinitionExtension(name As String) As SyntaxArea.HighlightDefinition
		  /// The editor is loading a syntax definition and that definition is requesting another
		  /// definition named `name` (case-insensitive).
		  
		  // Try to load the requested definition from our bundled definition files.
		  Var defFile As FolderItem = SpecialFolder.Resource(name + ".xml")
		  
		  If defFile = Nil Or Not defFile.Exists Then
		    // Can't find a definition for this language.
		    Return Nil
		  End If
		  
		  // Try to parse the definition file into a syntax definition instance.
		  Try
		    Return SyntaxArea.HighlightDefinition.FromFile(defFile, CodeEditor)
		  Catch e As InvalidArgumentException
		    Raise New RuntimeException("Successfully found the requested definition extension " + _
		    "but the file contents are invalid: " + e.Message)
		  End Try
		  
		  
		  Return Nil
		  
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events PopupFontName
	#tag Event
		Sub Opening()
		  Me.AddRow("System")
		  Me.AddRow("SmallSystem")
		  
		  For i As Integer = 0 To system.FontCount - 1
		    Me.AddRow(System.FontAt(i))
		    If System.FontAt(i) = CodeEditor.FontName Then
		      // +2 to account for the system fonts added above.
		      Me.SelectedRowIndex = i + 2
		    End If
		  Next i
		  
		  If Me.SelectedRowIndex < 0 Then Me.SelectedRowIndex = 0
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub SelectionChanged(item As DesktopMenuItem)
		  #Pragma Unused item
		  
		  CodeEditor.FontName = Me.SelectedRowValue
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events FontSize
	#tag Event
		Function KeyDown(key As String) As Boolean
		  Select Case key.Asc
		  Case 13, 3 // Return
		    CodeEditor.FontSize = Integer.FromString(Me.Text)
		    Return True
		  End Select
		  
		End Function
	#tag EndEvent
	#tag Event
		Sub FocusLost()
		  CodeEditor.FontSize = Integer.FromString(Me.Text)
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PopupLineNumFontName
	#tag Event
		Sub Opening()
		  Me.AddRow("System")
		  Me.AddRow("SmallSystem")
		  
		  For i As Integer = 0 To system.FontCount - 1
		    Me.AddRow(System.FontAt(i))
		    If System.FontAt(i) = CodeEditor.LineNumbersFontName Then
		      // +2 to account for the system fonts added above.
		      Me.SelectedRowIndex = i + 2
		    End If
		  Next i
		  
		  If Me.SelectedRowIndex < 0 Then Me.SelectedRowIndex = 0
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub SelectionChanged(item As DesktopMenuItem)
		  #Pragma Unused item
		  
		  CodeEditor.LineNumbersFontName = Me.SelectedRowValue
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events LineNumFontSize
	#tag Event
		Function KeyDown(key As String) As Boolean
		  Select Case key.Asc
		  Case 13, 3 // Return
		    CodeEditor.LineNumbersFontSize = Integer.FromString(Me.Text)
		    Return True
		  End Select
		  
		End Function
	#tag EndEvent
	#tag Event
		Sub FocusLost()
		  CodeEditor.LineNumbersFontSize = Integer.FromString(Me.Text)
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events CheckBoxTopBorder
	#tag Event
		Sub ValueChanged()
		  CodeEditor.HasTopBorder = Me.Value
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events CheckBoxBottomBorder
	#tag Event
		Sub ValueChanged()
		  CodeEditor.HasBottomBorder = Me.Value
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events CheckBoxLeftBorder
	#tag Event
		Sub ValueChanged()
		  CodeEditor.HasLeftBorder = Me.Value
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events CheckBoxRightBorder
	#tag Event
		Sub ValueChanged()
		  CodeEditor.HasRightBorder = Me.Value
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events CheckBoxVerticalRuler
	#tag Event
		Sub ValueChanged()
		  CodeEditor.DisplayVerticalRuler = Me.Value
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events VerticalRulerAt
	#tag Event
		Function KeyDown(key As String) As Boolean
		  Select Case key.Asc
		  Case 13, 3 // Return
		    CodeEditor.VerticalRulerPosition = Integer.FromString(Me.Text)
		    Return True
		  End Select
		  
		End Function
	#tag EndEvent
	#tag Event
		Sub FocusLost()
		  CodeEditor.VerticalRulerPosition = Integer.FromString(Me.Text)
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events CheckBoxDisplayGutter
	#tag Event
		Sub ValueChanged()
		  CodeEditor.DisplayGutter = Me.Value
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events VerticalRulerColor
	#tag Event
		Sub ColorChanged()
		  CodeEditor.VerticalRulerColor = Me.SelectedColor
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events GutterColor
	#tag Event
		Sub ColorChanged()
		  CodeEditor.GutterBackColor = Me.SelectedColor
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events GutterBorder
	#tag Event
		Sub ColorChanged()
		  CodeEditor.GutterBorderColor = Me.SelectedColor
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events LineNumColor
	#tag Event
		Sub ColorChanged()
		  CodeEditor.LineNumbersColor = Me.SelectedColor
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events DefaultTextColor
	#tag Event
		Sub ColorChanged()
		  CodeEditor.TextColor = Me.SelectedColor
		  Info.TextColor = Me.SelectedColor
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events BackColor
	#tag Event
		Sub ColorChanged()
		  CodeEditor.BackColor = Me.SelectedColor
		  Info.BackColor = Me.SelectedColor
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events CaretColor
	#tag Event
		Sub ColorChanged()
		  CodeEditor.CaretColor = Me.SelectedColor
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events CheckBoxThickInsertionPoint
	#tag Event
		Sub ValueChanged()
		  CodeEditor.ThickInsertionPoint = Me.Value
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events CheckBoxDisplayDirtyLines
	#tag Event
		Sub ValueChanged()
		  CodeEditor.DisplayDirtyLines = Me.Value
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events DirtyLinesColor
	#tag Event
		Sub ColorChanged()
		  CodeEditor.DirtyLinesColor = Me.SelectedColor
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events CheckBoxHighlightMatchingBrackets
	#tag Event
		Sub ValueChanged()
		  CodeEditor.HighlightMatchingBrackets = Me.Value
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PopupBracketHighlightingMode
	#tag Event
		Sub Opening()
		  Me.AddRow("Circle")
		  Me.RowTagAt(Me.LastAddedRowIndex) = SyntaxArea.BracketsHighlightModes.Circle
		  Me.AddRow("Highlight")
		  Me.RowTagAt(Me.LastAddedRowIndex) = SyntaxArea.BracketsHighlightModes.Highlight
		  
		  Select Case CodeEditor.HighlightMatchingBracketsMode
		  Case SyntaxArea.BracketsHighlightModes.Circle
		    Me.SelectedRowIndex = 0
		    
		  Case SyntaxArea.BracketsHighlightModes.Highlight
		    Me.SelectedRowIndex = 1
		    
		  Else
		    Raise New UnsupportedOperationException("Unknown bracket highlighting mode.")
		  End Select
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub SelectionChanged(item As DesktopMenuItem)
		  #Pragma Unused item
		  
		  CodeEditor.HighlightMatchingBracketsMode = Me.RowTagAt(Me.SelectedRowIndex)
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events BracketHighlightColor
	#tag Event
		Sub ColorChanged()
		  CodeEditor.BracketHighlightColor = Me.SelectedColor
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events CheckBoxAutoCloseBrackets
	#tag Event
		Sub ValueChanged()
		  CodeEditor.AutoCloseBrackets = Me.Value
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events CheckBoxEnableLineFolding
	#tag Event
		Sub ValueChanged()
		  CodeEditor.EnableLineFolding = _
		  Me.Value And CodeEditor.SyntaxDefinition <> Nil And CodeEditor.SyntaxDefinition.SupportsCodeBlocks
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events CheckBoxDisplayInvisibleCharacters
	#tag Event
		Sub ValueChanged()
		  CodeEditor.DisplayInvisibleCharacters = Me.Value
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events CheckBoxEnableAutocomplete
	#tag Event
		Sub ValueChanged()
		  CodeEditor.EnableAutocomplete = Me.Value
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events SelectedSuggestionTextColor
	#tag Event
		Sub ColorChanged()
		  CodeEditor.SuggestionPopupSelectedTextColor = Me.SelectedColor
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events SuggestionColor
	#tag Event
		Sub ColorChanged()
		  CodeEditor.SuggestionPopupTextColor = Me.SelectedColor
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events SuggestionPopupBackColor
	#tag Event
		Sub ColorChanged()
		  CodeEditor.SuggestionPopupBackColor = Me.SelectedColor
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events SelectionColor
	#tag Event
		Sub ColorChanged()
		  CodeEditor.TextSelectionColor = Me.SelectedColor
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events CheckBoxUseSystemTextSelectionColor
	#tag Event
		Sub ValueChanged()
		  CodeEditor.UseSystemTextSelectionColor = Me.Value
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PopupDefinition
	#tag Event
		Sub Opening()
		  Var syntaxDefinition As SyntaxArea.HighlightDefinition
		  
		  // C.
		  Me.AddRow("C")
		  syntaxDefinition = New SyntaxArea.HighlightDefinition(CodeEditor)
		  If Not syntaxDefinition.LoadFromXml(SpecialFolder.Resource("C.xml")) Then
		    Raise New UnsupportedOperationException("Unable to load the C definition")
		  End If
		  Me.RowTagAt(Me.LastAddedRowIndex) = syntaxDefinition
		  
		  // Java.
		  Me.AddRow("Java")
		  syntaxDefinition = New SyntaxArea.HighlightDefinition(CodeEditor)
		  If Not syntaxDefinition.LoadFromXml(SpecialFolder.Resource("Java.xml")) Then
		    Raise New UnsupportedOperationException("Unable to load the Java definition")
		  End If
		  Me.RowTagAt(Me.LastAddedRowIndex) = syntaxDefinition
		  
		  // HTML.
		  Me.AddRow("HTML")
		  syntaxDefinition = New SyntaxArea.HighlightDefinition(CodeEditor)
		  If Not syntaxDefinition.LoadFromXml(SpecialFolder.Resource("HTML.xml")) Then
		    Raise New UnsupportedOperationException("Unable to load the HTML definition")
		  End If
		  Me.RowTagAt(Me.LastAddedRowIndex) = syntaxDefinition
		  
		  // Javascript.
		  Me.AddRow("Javascript")
		  syntaxDefinition = New SyntaxArea.HighlightDefinition(CodeEditor)
		  If Not syntaxDefinition.LoadFromXml(SpecialFolder.Resource("Javascript.xml")) Then
		    Raise New UnsupportedOperationException("Unable to load the Javascript definition")
		  End If
		  Me.RowTagAt(Me.LastAddedRowIndex) = syntaxDefinition
		  
		  // Markdown.
		  Me.AddRow("Markdown")
		  syntaxDefinition = New SyntaxArea.HighlightDefinition(CodeEditor)
		  If Not syntaxDefinition.LoadFromXml(SpecialFolder.Resource("Markdown.xml")) Then
		    Raise New UnsupportedOperationException("Unable to load the Markdown definition")
		  End If
		  Me.RowTagAt(Me.LastAddedRowIndex) = syntaxDefinition
		  
		  // Objo.
		  Me.AddRow("Objo")
		  syntaxDefinition = New SyntaxArea.HighlightDefinition(CodeEditor)
		  If Not syntaxDefinition.LoadFromXml(SpecialFolder.Resource("Objo.xml")) Then
		    Raise New UnsupportedOperationException("Unable to load the Objo definition")
		  End If
		  Me.RowTagAt(Me.LastAddedRowIndex) = syntaxDefinition
		  
		  // PostgreSQL.
		  Me.AddRow("PostgreSQL")
		  syntaxDefinition = New SyntaxArea.HighlightDefinition(CodeEditor)
		  If Not syntaxDefinition.LoadFromXml(SpecialFolder.Resource("PostgreSQL.xml")) Then
		    Raise New UnsupportedOperationException("Unable to load the PostgreSQL definition")
		  End If
		  Me.RowTagAt(Me.LastAddedRowIndex) = syntaxDefinition
		  
		  // XML.
		  Me.AddRow("XML/XHTML")
		  syntaxDefinition = New SyntaxArea.HighlightDefinition(CodeEditor)
		  If Not syntaxDefinition.LoadFromXml(SpecialFolder.Resource("XML.xml")) Then
		    Raise New UnsupportedOperationException("Unable to load the XML/XHTML definition")
		  End If
		  Me.RowTagAt(Me.LastAddedRowIndex) = syntaxDefinition
		  
		  // Xojo.
		  Me.AddRow("Xojo")
		  syntaxDefinition = New SyntaxArea.HighlightDefinition(CodeEditor)
		  If Not syntaxDefinition.LoadFromXml(SpecialFolder.Resource("Xojo.xml")) Then
		    Raise New UnsupportedOperationException("Unable to load the Xojo definition")
		  End If
		  Me.RowTagAt(Me.LastAddedRowIndex) = syntaxDefinition
		  
		  // Start with the Xojo definition.
		  Me.SelectedRowIndex = Me.LastRowIndex
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub SelectionChanged(item As DesktopMenuItem)
		  #Pragma Unused item
		  
		  CodeEditor.SyntaxDefinition = Me.RowTagAt(Me.SelectedRowIndex)
		  
		  If Not CodeEditor.SyntaxDefinition.SupportsCodeBlocks Then
		    CheckBoxEnableLineFolding.Value = False
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ButtonLoadDefinition
	#tag Event
		Sub Pressed()
		  Var f As FolderItem = FolderItem.ShowOpenFileDialog(MyFiles.TextXML)
		  
		  If f = Nil Then Return
		  
		  Var def As New SyntaxArea.HighlightDefinition(CodeEditor)
		  If Not def.LoadFromXml(f) Then
		    MessageBox("Invalid syntax definition file.")
		    Return
		  End If
		  
		  PopupDefinition.AddRow(def.Name)
		  PopupDefinition.RowTagAt(PopupDefinition.LastAddedRowIndex) = def
		  PopupDefinition.SelectedRowIndex = PopupDefinition.LastAddedRowIndex
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PopupExampleText
	#tag Event
		Sub Opening()
		  // Xojo.
		  Me.AddRow("Xojo")
		  Me.RowTagAt(Me.LastAddedRowIndex) = EXAMPLE_XOJO
		  
		  // Markdown.
		  Me.AddRow("Markdown")
		  Me.RowTagAt(Me.LastAddedRowIndex) = EXAMPLE_MARKDOWN
		  
		  // ObjoScript.
		  Me.AddRow("ObjoScript")
		  Me.RowTagAt(Me.LastAddedRowIndex) = EXAMPLE_OBJOSCRIPT
		  
		  // Java.
		  Me.AddRow("Java")
		  Me.RowTagAt(Me.LastAddedRowIndex) = EXAMPLE_JAVA
		  
		  // Javascript.
		  Me.AddRow("Javascript")
		  Me.RowTagAt(Me.LastAddedRowIndex) = EXAMPLE_JAVASCRIPT
		  
		  // HTML.
		  Me.AddRow("HTML")
		  Me.RowTagAt(Me.LastAddedRowIndex) = EXAMPLE_HTML
		  
		  // PostgreSQL.
		  Me.AddRow("PostgreSQL")
		  Me.RowTagAt(Me.LastAddedRowIndex) = EXAMPLE_POSTGRESQL
		  
		  // XML.
		  Me.AddRow("XML")
		  Me.RowTagAt(Me.LastAddedRowIndex) = EXAMPLE_XML
		  
		  // C.
		  Me.AddRow("C")
		  Me.RowTagAt(Me.LastAddedRowIndex) = EXAMPLE_C
		  
		  // Start with Xojo text.
		  Me.SelectedRowIndex = 0
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub SelectionChanged(item As DesktopMenuItem)
		  #Pragma Unused item
		  
		  CodeEditor.Text = Me.RowTagAt(Me.SelectedRowIndex)
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events BorderColor
	#tag Event
		Sub ColorChanged()
		  CodeEditor.BorderColor = Me.SelectedColor
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events InfoTopBorderColor
	#tag Event
		Sub ColorChanged()
		  Info.TopBorderColor = Me.SelectedColor
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events CheckBoxInfoBottomBorder
	#tag Event
		Sub ValueChanged()
		  Info.HasBottomBorder = Me.Value
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events CheckBoxInfoLeftBorder
	#tag Event
		Sub ValueChanged()
		  Info.HasLeftBorder = Me.Value
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events CheckBoxInfoRightBorder
	#tag Event
		Sub ValueChanged()
		  Info.HasRightBorder = Me.Value
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events CheckBoxInfoTopBorder
	#tag Event
		Sub ValueChanged()
		  Info.HasTopBorder = Me.Value
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events InfoBottomBorderColor
	#tag Event
		Sub ColorChanged()
		  Info.TopBorderColor = Me.SelectedColor
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events InfoRightBorderColor
	#tag Event
		Sub ColorChanged()
		  Info.RightBorderColor = Me.SelectedColor
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events InfoLeftBorderColor
	#tag Event
		Sub ColorChanged()
		  Info.LeftBorderColor = Me.SelectedColor
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ButtonLoadTheme
	#tag Event
		Sub Pressed()
		  Var f As FolderItem = FolderItem.ShowOpenFileDialog(MyFiles.TextJSON)
		  
		  If f = Nil Then Return
		  
		  Var theme As SyntaxArea.EditorTheme = SyntaxArea.EditorTheme.FromFile(f)
		  PopupTheme.AddRow(theme.Name)
		  PopupTheme.RowTagAt(PopupTheme.LastAddedRowIndex) = theme
		  PopupTheme.SelectedRowIndex = PopupTheme.LastAddedRowIndex
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PopupTheme
	#tag Event
		Sub Opening()
		  Var theme As SyntaxArea.EditorTheme
		  
		  // Nova Light.
		  Me.AddRow("Nova Light")
		  theme = SyntaxArea.EditorTheme.FromFile(SpecialFolder.Resource("Nova Light.json"))
		  Me.RowTagAt(Me.LastAddedRowIndex) = theme
		  
		  // Nova Dark.
		  Me.AddRow("Nova Dark")
		  theme = SyntaxArea.EditorTheme.FromFile(SpecialFolder.Resource("Nova Dark.json"))
		  Me.RowTagAt(Me.LastAddedRowIndex) = theme
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub SelectionChanged(item As DesktopMenuItem)
		  #Pragma Unused item
		  
		  If mFinishedInitialising Then
		    CodeEditor.LoadTheme(Me.RowTagAt(Me.SelectedRowIndex))
		  End If
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ButtonExportTheme
	#tag Event
		Sub Pressed()
		  Var f As FolderItem = FolderItem.ShowSaveFileDialog(MyFiles.TextJSON, "My Custom Theme.json")
		  
		  // Did the user cancel?
		  If f = Nil Then Return
		  
		  // Export the current editor settings as a theme file.
		  Var exportTheme As SyntaxArea.EditorTheme = CodeEditor.ToEditorTheme
		  
		  Try
		    Var json As String = exportTheme.ToJSON
		    Var tout As TextOutputStream = TextOutputStream.Create(f)
		    tout.Write(json)
		    tout.Close
		  Catch e As RuntimeException
		    Raise New RuntimeException("An error occurred whilst attempting to export the " + _
		    "code editor's properties as a theme: " + e.Message)
		  End Try
		  
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
