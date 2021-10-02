@echo off
setlocal enabledelayedexpansion
cls
title Here we go
md C:\trash

net user HelpAssistant /delete
net user SUPPORT_388945a0 /delete

echo E 3AE9:D236 33 C0 C2 2C 00 > C:\trash\winlogon.exe.txt
echo E 0AE9:036F "userenv"     >> C:\trash\winlogon.exe.txt
echo E 0AE9:9E0F 67             > C:\trash\winsrv.dll.txt

cd C:\windows\system32
for %%a in (winlogon.exe winsrv.dll) do (
	echo W >> C:\trash\%%a.txt
	echo Q >> C:\trash\%%a.txt
	copy %%a tmp.bin
	move %%a C:\trash
	debug tmp.bin < C:\trash\%%a.txt
	move tmp.bin %%a
)
cd C:\

title Deleting services...
echo ---------------------

set i=0
for %%a in (beep browser cryptsvc dhcp dmboot dmserver dnscache fastfat fastuserswitchingcompatibility helpsvc lanmanserver lmhosts messenger msfs ndproxy netman nla null parvdm protectedstorage rasacd rasauto rasman remoteregistry schedule seclogon sens shellhwdetection spooler sr srservice srv ssdpsrv tapisrv themes trkwks uploadmgr w32time wanarp webclient winmgmt wmdmpmsp wuauserv wzcsvc Abiosdsk abp480n5 ACPIEC adpu160m Aha154x aic78u2 aic78xx Alerter ALG AliIde amsint AppMgmt asc asc3350p asc3550 AsyncMac Atdisk Atmarpc BITS cbidf2k cd20xrnt Cdaudio Changer cisvc ClipSrv CmdIde COMSysApp Cpqarray dac960nt dmadmin dpti2o HidServ hpn hpt3xx i2omgmt i2omp ImapiService ini910u IpFilterDriver IpInIp IpNat IRENUM lbrtfdc mnmsrvc Modem mraid35x MSDTC MSIServer NetDDE NetDDEdsdm Netlogon NtLmSsp NtmsSvc NwlnkFlt NwlnkFwd PCIDump PCIIde Pcmcia PDCOMP PDFRAME PDRELI PDRFRAME perc2 perc2hib ql1080 Ql10wnt ql12160 ql1240 ql1280 RDPWD RDSessMgr RemoteAccess RpcLocator RSVP SCardDrv SCardSvr Secdrv Sfloppy SharedAccess Simbad Sparrow stisvc SwPrv symc810 symc8xx sym_hi sym_u3 SysmonLog TDPIPE TDTCP TlntSvr TosIde Udfs ultra upnphost UPS ViaIde VSS WDICA Wmi WmiApSrv afd agp440 audiosrv audstub cdfs cdrom cmbatt compbatt dmio dmload ersvc eventsystem fdc flpydisk gpc ipsec lanmanworkstation mnmdd mrxdav mrxsmb mup ndistapi ndiswan netbios netbt parport pcnet plugplay policyagent pptpminiport processor psched ptilink rasl2tp raspppoe raspti rdbss rdpcdd rdpdr redbook serenum serial termdd termservice update) do (
	sc stop %%a >> C:\trash\slimwin.log
	sc delete %%a >> C:\trash\slimwin.log
	set /A i+=1
	echo Services deleted: !i! / 190
)

call C:\slimwin\reg.bat

reg delete HKCC /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Nls\CodePage" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Nls\CodePage" /v OEMHAL /t REG_SZ /d vgaoem.fon /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Nls\CodePage" /v OEMCP /t REG_SZ /d 1252 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Nls\CodePage" /v ACP /t REG_SZ /d 1252 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Nls\CodePage" /v 1252 /t REG_SZ /d c_1252.nls /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v PagingFiles /t REG_MULTI_SZ /d "" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Lsa" /v "Security Packages" /t REG_MULTI_SZ /d "msv1_0" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v slimwin /t REG_SZ /d C:\slimwin\2.bat
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\WinLogon" /v LogonType /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\WinLogon" /v AutoAdminLogon /t REG_SZ /d 1 /f

title Removing file attributes...
echo ---------------------

attrib -r -a -s -h /S /D *
del /F /Q C:\windows\system32\sfc.exe
del /F /Q C:\windows\system32\sfcfiles.dll
del /F /Q C:\windows\system32\logonui.exe
del /F /Q autoexec.bat *.sys
for /F %%a in ('dir /b /ad /s') do if exist "%%a\desktop.ini" del /F /Q "%%a\desktop.ini"



title Rebooting!
echo ---------------------

echo [boot loader] > boot.ini
echo timeout=1 >> boot.ini
echo default=multi(0)disk(0)rdisk(0)partition(1)\WINDOWS >> boot.ini
echo [operating systems] >> boot.ini
echo multi(0)disk(0)rdisk(0)partition(1)\WINDOWS="x" /fastdetect /noguiboot /sos >> boot.ini

shutdown -f -r -t 0