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
					FolderItem = Li4vLi4vLi4vZGVmaW5pdGlvbnMvQy54bWw=
					FolderItem = Li4vLi4vLi4vZGVmaW5pdGlvbnMvSHRtbC54bWw=
					FolderItem = Li4vLi4vLi4vZGVmaW5pdGlvbnMvSmF2YS54bWw=
					FolderItem = Li4vLi4vLi4vZGVmaW5pdGlvbnMvSmF2YXNjcmlwdC54bWw=
					FolderItem = Li4vLi4vLi4vZGVmaW5pdGlvbnMvTWFya2Rvd24ueG1s
					FolderItem = Li4vLi4vLi4vZGVmaW5pdGlvbnMvUGhwLnhtbA==
					FolderItem = Li4vLi4vLi4vZGVmaW5pdGlvbnMvUG9zdGdyZXNxbC54bWw=
					FolderItem = Li4vLi4vLi4vZGVmaW5pdGlvbnMvWG1sLnhtbA==
					FolderItem = Li4vLi4vLi4vZGVmaW5pdGlvbnMvWG9qby54bWw=
					FolderItem = Li4vLi4vLi4vZGVmaW5pdGlvbnMvT2Jqb0Jhc2ljLnhtbA==
					FolderItem = Li4vLi4vLi4vZGVmaW5pdGlvbnMvT2Jqb1NjcmlwdC54bWw=
					FolderItem = Li4vLi4vLi4vZGVmaW5pdGlvbnMvV3Jlbi54bWw=
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
					FolderItem = Li4vLi4vLi4vZGVmaW5pdGlvbnMvQy54bWw=
					FolderItem = Li4vLi4vLi4vZGVmaW5pdGlvbnMvSmF2YS54bWw=
					FolderItem = Li4vLi4vLi4vZGVmaW5pdGlvbnMvSmF2YXNjcmlwdC54bWw=
					FolderItem = Li4vLi4vLi4vZGVmaW5pdGlvbnMvTWFya2Rvd24ueG1s
					FolderItem = Li4vLi4vLi4vZGVmaW5pdGlvbnMvUGhwLnhtbA==
					FolderItem = Li4vLi4vLi4vZGVmaW5pdGlvbnMvUG9zdGdyZXNxbC54bWw=
					FolderItem = Li4vLi4vLi4vZGVmaW5pdGlvbnMvWG1sLnhtbA==
					FolderItem = Li4vLi4vLi4vZGVmaW5pdGlvbnMvWG9qby54bWw=
					FolderItem = Li4vLi4vLi4vZGVmaW5pdGlvbnMvT2Jqb0Jhc2ljLnhtbA==
					FolderItem = Li4vLi4vLi4vZGVmaW5pdGlvbnMvT2Jqb1NjcmlwdC54bWw=
					FolderItem = Li4vLi4vLi4vZGVmaW5pdGlvbnMvV3Jlbi54bWw=
					FolderItem = Li4vLi4vLi4vZGVmaW5pdGlvbnMvSHRtbC54bWw=
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
					FolderItem = Li4vLi4vLi4vZGVmaW5pdGlvbnMvQy54bWw=
					FolderItem = Li4vLi4vLi4vZGVmaW5pdGlvbnMvSHRtbC54bWw=
					FolderItem = Li4vLi4vLi4vZGVmaW5pdGlvbnMvSmF2YS54bWw=
					FolderItem = Li4vLi4vLi4vZGVmaW5pdGlvbnMvSmF2YXNjcmlwdC54bWw=
					FolderItem = Li4vLi4vLi4vZGVmaW5pdGlvbnMvTWFya2Rvd24ueG1s
					FolderItem = Li4vLi4vLi4vZGVmaW5pdGlvbnMvUGhwLnhtbA==
					FolderItem = Li4vLi4vLi4vZGVmaW5pdGlvbnMvUG9zdGdyZXNxbC54bWw=
					FolderItem = Li4vLi4vLi4vZGVmaW5pdGlvbnMvWG1sLnhtbA==
					FolderItem = Li4vLi4vLi4vZGVmaW5pdGlvbnMvWG9qby54bWw=
					FolderItem = Li4vLi4vLi4vZGVmaW5pdGlvbnMvT2Jqb0Jhc2ljLnhtbA==
					FolderItem = Li4vLi4vLi4vZGVmaW5pdGlvbnMvT2Jqb1NjcmlwdC54bWw=
					FolderItem = Li4vLi4vLi4vZGVmaW5pdGlvbnMvV3Jlbi54bWw=
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
