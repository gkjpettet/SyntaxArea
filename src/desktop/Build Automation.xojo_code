#tag BuildAutomation
			Begin BuildStepList Linux
				Begin BuildProjectStep Build
				End
				Begin CopyFilesBuildStep CopyDefinitionsLinux
					AppliesTo = 0
					Architecture = 0
					Target = 0
					Destination = 1
					Subdirectory = 
					FolderItem = Li4vLi4vLi4vZGVmaW5pdGlvbnMv
				End
				Begin CopyFilesBuildStep CopyThemesLinux
					AppliesTo = 0
					Architecture = 0
					Target = 0
					Destination = 1
					Subdirectory = 
					FolderItem = Li4vLi4vLi4vdGhlbWVzLw==
				End
			End
			Begin BuildStepList Mac OS X
				Begin BuildProjectStep Build
				End
				Begin CopyFilesBuildStep CopyDefinitionsMac
					AppliesTo = 0
					Architecture = 0
					Target = 0
					Destination = 1
					Subdirectory = 
					FolderItem = Li4vLi4vLi4vZGVmaW5pdGlvbnMv
				End
				Begin CopyFilesBuildStep CopyThemesMac
					AppliesTo = 0
					Architecture = 0
					Target = 0
					Destination = 1
					Subdirectory = 
					FolderItem = Li4vLi4vLi4vdGhlbWVzLw==
				End
				Begin SignProjectStep Sign
				  DeveloperID=
				  macOSEntitlements={"App Sandbox":"False","Hardened Runtime":"False","Notarize":"False","UserEntitlements":""}
				End
			End
			Begin BuildStepList Windows
				Begin BuildProjectStep Build
				End
				Begin CopyFilesBuildStep CopyDefinitionsWindows
					AppliesTo = 0
					Architecture = 0
					Target = 0
					Destination = 1
					Subdirectory = 
					FolderItem = Li4vLi4vLi4vZGVmaW5pdGlvbnMv
				End
				Begin CopyFilesBuildStep CopyThemesWindows
					AppliesTo = 0
					Architecture = 0
					Target = 0
					Destination = 1
					Subdirectory = 
					FolderItem = Li4vLi4vLi4vdGhlbWVzLw==
				End
			End
#tag EndBuildAutomation
