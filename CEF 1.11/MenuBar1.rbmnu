#tag Menu
Begin Menu MenuBar1
   Begin MenuItem FileMenu
      SpecialMenu = 0
      Text = "&File"
      Index = -2147483648
      AutoEnable = True
      Begin MenuItem FileNewWIndow
         SpecialMenu = 0
         Text = "New Window"
         Index = -2147483648
         ShortcutKey = "N"
         Shortcut = "Cmd+N"
         MenuModifier = True
         AutoEnable = True
      End
      Begin MenuItem FileOpenFile
         SpecialMenu = 0
         Text = "Open File..."
         Index = -2147483648
         ShortcutKey = "O"
         Shortcut = "Cmd+O"
         MenuModifier = True
         AutoEnable = True
      End
      Begin MenuItem FileClose
         SpecialMenu = 0
         Text = "Close"
         Index = -2147483648
         ShortcutKey = "W"
         Shortcut = "Cmd+W"
         MenuModifier = True
         AutoEnable = True
      End
      Begin MenuItem UntitledSeparator
         SpecialMenu = 0
         Text = "-"
         Index = -2147483648
         AutoEnable = True
      End
      Begin MenuItem FileSave
         SpecialMenu = 0
         Text = "Save As..."
         Index = -2147483648
         ShortcutKey = "S"
         Shortcut = "Cmd+S"
         MenuModifier = True
         AutoEnable = True
      End
      Begin MenuItem UntitledSeparator0
         SpecialMenu = 0
         Text = "-"
         Index = -2147483648
         AutoEnable = True
      End
      Begin MenuItem FilePageSetup
         SpecialMenu = 0
         Text = "Page Setup..."
         Index = -2147483648
         ShortcutKey = "P"
         Shortcut = "Cmd+Shift+P"
         MenuModifier = True
         AltMenuModifier = True
         AutoEnable = True
      End
      Begin MenuItem FilePrint
         SpecialMenu = 0
         Text = "Print..."
         Index = -2147483648
         ShortcutKey = "P"
         Shortcut = "Cmd+P"
         MenuModifier = True
         AutoEnable = True
      End
      Begin MenuItem UntitledSeparator1
         SpecialMenu = 0
         Text = "-"
         Index = -2147483648
         AutoEnable = True
      End
      Begin QuitMenuItem FileQuit
         SpecialMenu = 0
         Text = "#App.kFileQuit"
         Index = -2147483648
         ShortcutKey = "#App.kFileQuitShortcut"
         Shortcut = "#App.kFileQuitShortcut"
         AutoEnable = True
      End
   End
   Begin MenuItem EditMenu
      SpecialMenu = 0
      Text = "&Edit"
      Index = -2147483648
      AutoEnable = True
      Begin MenuItem EditUndo
         SpecialMenu = 0
         Text = "&Undo"
         Index = -2147483648
         ShortcutKey = "Z"
         Shortcut = "Cmd+Z"
         MenuModifier = True
         AutoEnable = False
      End
      Begin MenuItem EditRedo
         SpecialMenu = 0
         Text = "Redo"
         Index = -2147483648
         ShortcutKey = "Z"
         Shortcut = "Cmd+Shift+Z"
         MenuModifier = True
         AltMenuModifier = True
         AutoEnable = False
      End
      Begin MenuItem UntitledMenu1
         SpecialMenu = 0
         Text = "-"
         Index = -2147483648
         AutoEnable = True
      End
      Begin MenuItem EditCut
         SpecialMenu = 0
         Text = "Cu&t"
         Index = -2147483648
         ShortcutKey = "X"
         Shortcut = "Cmd+X"
         MenuModifier = True
         AutoEnable = True
      End
      Begin MenuItem EditCopy
         SpecialMenu = 0
         Text = "&Copy"
         Index = -2147483648
         ShortcutKey = "C"
         Shortcut = "Cmd+C"
         MenuModifier = True
         AutoEnable = True
      End
      Begin MenuItem EditPaste
         SpecialMenu = 0
         Text = "&Paste"
         Index = -2147483648
         ShortcutKey = "V"
         Shortcut = "Cmd+V"
         MenuModifier = True
         AutoEnable = True
      End
      Begin MenuItem EditClear
         SpecialMenu = 0
         Text = "#App.kEditClear"
         Index = -2147483648
         AutoEnable = True
      End
      Begin MenuItem UntitledMenu0
         SpecialMenu = 0
         Text = "-"
         Index = -2147483648
         AutoEnable = True
      End
      Begin MenuItem EditSelectAll
         SpecialMenu = 0
         Text = "Select &All"
         Index = -2147483648
         ShortcutKey = "A"
         Shortcut = "Cmd+A"
         MenuModifier = True
         AutoEnable = True
      End
      Begin MenuItem UntitledSeparator2
         SpecialMenu = 0
         Text = "-"
         Index = -2147483648
         AutoEnable = True
      End
      Begin MenuItem EditFind
         SpecialMenu = 0
         Text = "Find"
         Index = -2147483648
         AutoEnable = True
         SubMenu = True
         Begin MenuItem FindFind
            SpecialMenu = 0
            Text = "Find..."
            Index = -2147483648
            ShortcutKey = "F"
            Shortcut = "Cmd+F"
            MenuModifier = True
            AutoEnable = True
         End
         Begin MenuItem FindFindNext
            SpecialMenu = 0
            Text = "Find Next"
            Index = -2147483648
            ShortcutKey = "G"
            Shortcut = "Cmd+G"
            MenuModifier = True
            AutoEnable = True
         End
         Begin MenuItem FindReplace
            SpecialMenu = 0
            Text = "Replace"
            Index = -2147483648
            ShortcutKey = "="
            Shortcut = "Cmd+="
            MenuModifier = True
            AutoEnable = True
         End
         Begin MenuItem FindReplaceFindNext
            SpecialMenu = 0
            Text = "Replace && Find Next"
            Index = -2147483648
            ShortcutKey = "="
            Shortcut = "Cmd+Shift+="
            MenuModifier = True
            AltMenuModifier = True
            AutoEnable = True
         End
      End
   End
   Begin MenuItem ExtrasMenu
      SpecialMenu = 0
      Text = "Foldings"
      Index = -2147483648
      AutoEnable = True
      Begin MenuItem ExtrasFoldCurrentBlock
         SpecialMenu = 0
         Text = "Fold Current Block"
         Index = -2147483648
         AutoEnable = True
      End
      Begin MenuItem ExtrasFoldAllLines
         SpecialMenu = 0
         Text = "Fold All Lines"
         Index = -2147483648
         AutoEnable = True
      End
      Begin MenuItem ExtrasUnfoldAllLines
         SpecialMenu = 0
         Text = "Unfold All Lines"
         Index = -2147483648
         AutoEnable = True
      End
   End
   Begin MenuItem UntitledMenu2
      SpecialMenu = 0
      Text = "Misc"
      Index = -2147483648
      AutoEnable = True
      Begin MenuItem ExtrasSelectNextPlaceholder
         SpecialMenu = 0
         Text = "Select Next Placeholder"
         Index = -2147483648
         ShortcutKey = "/"
         Shortcut = "Control+/"
         MacControlKey = True
         AutoEnable = True
      End
   End
End
#tag EndMenu
