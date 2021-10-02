@echo off
setlocal enabledelayedexpansion

call C:\slimwin\reg.bat
reg delete HKEY_CLASSES_ROOT\Interface /f

reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /v slimwin /t REG_SZ /d C:\slimwin\3.bat /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\WinLogon" /v AutoAdminLogon /t REG_SZ /d 1 /f

cd C:\windows\system32
C:\slimwin\exe\reshacker -extract ole32.dll,C:\trash\ico1.ico,icon,8,
C:\slimwin\exe\reshacker -extract shell32.dll,C:\trash\ico2.ico,icon,2,
C:\slimwin\exe\reshacker -extract shell32.dll,C:\trash\ico3.ico,icon,3,
C:\slimwin\exe\reshacker -extract mshtml.dll,C:\trash\ico4.ico,icon,2671,

title Trashing system files...
echo ---------------------
cd C:\
del /F /Q /ah pagefile.sys
rd /S /Q C:\docume~1 C:\progra~1
cd C:\windows
rd /S /Q addins apppatch config connec~1 cursors debug downlo~1 driver~1 help help ime inf installer java media msagent msapps mui offlin~1 pchealth prefetch regist~1 repair resour~1 security srchasst system tasks temp twain_32 web
del /F /Q *.log *.txt *.bmp *.ini *.dll s* t* w* _default.pif bootstat.dat clock.avi explorer.scf hh.exe notepad.exe reglocs.old
move explorer.exe C:\trash
copy C:\trash\explorer.exe .
cd fonts
move * C:\trash
move C:\trash\vgaoem.fon .
cd ..\winsxs
rd /S /Q x86_Mi~1.0_x x86_Mi~2.0_x x86_Mi~4.0_x InstallTemp
cd Manifests
del /F /Q *gdi* *plus* *system* *tools*
cd ..\..\system32\config
rd /S /Q systemprofile
del /F /Q *.sav tempkey* userdiff*
cd ..\drivers
md +
rd /S /Q disdn etc
for %%a in (acpi atapi classpnp disk dxapi dxg dxgthk ftdisk i8042prt imapi intelide isapnp kbdclass ks ksecdd mouclass mountmgr ndproxy npfs ntfs partmgr parvdm pci pciidex swenum vga videoprt volsnap wmilib) do move %%a.sys +
for %%a in (*) do move "%%~a" C:\trash
move +\* .
move + ..
cd ..
md -
move wbem\framedyn.dll -
for /D %%a in (10* ca* i* m* r* s* w*) do rd /S /Q %%a
rd /S /Q dllcache 2052 3076 3com_dmi Com dhcp DirectX export npp oobe usmt xircom

for %%a in (advapi32 authz basesrv bootvid browseui comctl32 comdlg32 crypt32 cryptdll csrsrv dnsapi eventlog framebuf gdi32 hal imagehlp kdcom kernel32 lsasrv mpr msasn1 msgina msprivs msv1_0 msvcrt ncobjapi netapi32 ntdll ntdsapi odbc32 odbcint ole32 oleaut32 profmap psapi regapi rpcrt4 rpcss samlib samsrv scesrv secur32 setupapi sfc_os shdocvw shell32 shlwapi sxs umpnpmgr user32 userenv uxtheme version wininet winsrv winsta wintrust wldap32 ws2_32 ws2help winmm) do move %%a.dll +
for %%a in (c_1252 ctype l_intl locale sortkey sorttbls unicode) do move %%a.nls +
for %%a in (cmd.exe csrss.exe lsass.exe ntoskrnl.exe services.exe shutdown.exe smss.exe svchost.exe userinit.exe watchdog.sys winlogon.exe win32k.sys winspool.drv) do move %%a +

for %%a in (aclui.dll activeds.dll adsldpc.dll atl.dll cards.dll clb.dll dhcpcsvc.dll iphlpapi.dll mprapi.dll netman.dll rasapi32.dll rasman.dll rtutils.dll sol.exe tapi32.dll taskmgr.exe ulib.dll vdmdbg.dll winmm.dll wmi.dll wtsapi32.dll wzcsvc.dll ..\regedit.exe) do move %%a -

for %%a in (*) do move "%%~a" C:\trash
copy "+\*" .
move + C:\trash
move - C:\keep

title Deleting resources...
echo ---------------------
echo Deleting resources...

echo versioninfo
for %%a in (advapi32.dll authz.dll basesrv.dll bootvid.dll browseui.dll cmd.exe comctl32.dll comdlg32.dll crypt32.dll cryptdll.dll csrsrv.dll csrss.exe dnsapi.dll eventlog.dll framebuf.dll gdi32.dll hal.dll imagehlp.dll kdcom.dll kernel32.dll lsasrv.dll lsass.exe mpr.dll msasn1.dll msgina.dll msprivs.dll msv1_0.dll msvcrt.dll ncobjapi.dll netapi32.dll ntdll.dll ntdsapi.dll ntoskrnl.exe odbc32.dll odbcint.dll ole32.dll oleaut32.dll profmap.dll psapi.dll regapi.dll rpcrt4.dll rpcss.dll samlib.dll samsrv.dll scesrv.dll secur32.dll services.exe setupapi.dll sfc_os.dll shdocvw.dll shell32.dll shlwapi.dll shlwapi.dll shutdown.exe smss.exe svchost.exe sxs.dll umpnpmgr.dll user32.dll userenv.dll userinit.exe uxtheme.dll watchdog.sys win32k.sys wininet.dll winlogon.exe winspool.drv winsrv.dll winsta.dll wintrust.dll wldap32.dll ws2_32.dll ws2help.dll) do (
	C:\slimwin\exe\reshacker -delete %%a,%%a,versioninfo,,
)

echo stringtable
for %%a in (advapi32.dll crypt32.dll mpr.dll msprivs.dll odbc32.dll odbcint.dll ole32.dll scesrv.dll services.exe setupapi.dll sfc_os.dll shutdown.exe sxs.dll userinit.exe uxtheme.dll wininet.dll winspool.drv winsrv.dll wintrust.dll wldap32.dll ws2help.dll) do (
	C:\slimwin\exe\reshacker -delete %%a,%%a,stringtable,,
)

echo messagetable
for %%a in (advapi32.dll crypt32.dll eventlog.dll lsasrv.dll samsrv.dll scesrv.dll setupapi.dll sfc_os.dll sxs.dll umpnpmgr.dll userinit.exe wininet.dll winspool.drv winsrv.dll) do (
	C:\slimwin\exe\reshacker -delete %%a,%%a,messagetable,,
)

echo icon
for %%a in (browseui.dll cmd.exe comctl32.dll comdlg32.dll msgina.dll odbcint.dll ole32.dll setupapi.dll sfc_os.dll shdocvw.dll shell32.dll shlwapi.dll sxs.dll userenv.dll uxtheme.dll wininet.dll winlogon.exe winsrv.dll wintrust.dll) do (
	C:\slimwin\exe\reshacker -delete %%a,%%a,icon,,
)

echo dialog
for %%a in (odbcint.dll ole32.dll setupapi.dll sfc_os.dll shutdown.exe sxs.dll wininet.dll winspool.drv winsrv.dll wintrust.dll) do (
	C:\slimwin\exe\reshacker -delete %%a,%%a,dialog,,
)

echo bitmap
for %%a in (browseui.dll comctl32.dll comdlg32.dll msgina.dll ntoskrnl.exe odbcint.dll setupapi.dll shdocvw.dll shell32.dll user32.dll uxtheme.dll winsrv.dll) do (
	C:\slimwin\exe\reshacker -delete %%a,%%a,bitmap,,
)

echo cursor
for %%a in (browseui.dll comctl32.dll ole32.dll shdocvw.dll shell32.dll) do (
	C:\slimwin\exe\reshacker -delete %%a,%%a,cursor,,
)

echo avi
for %%a in (msgina.dll setupapi.dll shdocvw.dll shell32.dll) do (
	C:\slimwin\exe\reshacker -delete %%a,%%a,avi,,
)

echo mofdata
for %%a in (advapi32.dll dnsapi.dll lsass.exe msv1_0.dll samsrv.dll) do (
	C:\slimwin\exe\reshacker -delete %%a,%%a,mofdata,,
)

echo reginst
for %%a in (browseui.dll comctl32.dll shdocvw.dll shell32.dll wininet.dll) do (
	C:\slimwin\exe\reshacker -delete %%a,%%a,reginst,,
)

echo rcdata
for %%a in (advapi32.dll framebuf.dll) do (
	C:\slimwin\exe\reshacker -delete %%a,%%a,rcdata,,
)
echo etc.
for %%a in (browseui.dll shell32.dll) do (
	C:\slimwin\exe\reshacker -delete %%a,%%a,23,,
)

C:\slimwin\exe\reshacker -delete userenv.dll,userenv.dll,jpeg,,
C:\slimwin\exe\reshacker -delete shell32.dll,shell32.dll,uifile,,

for %%a in (1 2 3 4) do (
	C:\slimwin\exe\reshacker -add shell32.dll,shell32.dll,C:\trash\ico%%a.ico,icon,%%a,
)

echo explorer.exe
cd..
C:\slimwin\exe\reshacker -delete explorer.exe,explorer.exe,bitmap,,
C:\slimwin\exe\reshacker -delete explorer.exe,explorer.exe,icon,,
C:\slimwin\exe\reshacker -delete explorer.exe,explorer.exe,menu,,
C:\slimwin\exe\reshacker -delete explorer.exe,explorer.exe,versioninfo,,
C:\slimwin\exe\reshacker -delete explorer.exe,explorer.exe,24,,
cd system32
move winmm.dll C:\keep

title Compressing files...
echo ---------------------
rem C:\slimwin\exe\upx --best --strip-relocs=0 --compress-icons=0 ..\explorer.exe advapi32.dll browseui.dll cmd.exe crypt32.dll cryptdll.dll dnsapi.dll eventlog.dll lsass.exe msv1_0.dll msvcrt.dll ncobjapi.dll netapi32.dll ntdsapi.dll odbc32.dll odbcint.dll ole32.dll oleaut32.dll profmap.dll psapi.dll regapi.dll rpcrt4.dll rpcss.dll samlib.dll samsrv.dll scesrv.dll secur32.dll services.exe setupapi.dll sfc_os.dll shdocvw.dll shell32.dll shlwapi.dll shutdown.exe svchost.exe sxs.dll wintrust.dll wldap32.dll ws2_32.dll ws2help.dll msasn1.dll msgina.dll mpr.dll authz.dll imagehlp.dll lsasrv.dll comdlg32.dll umpnpmgr.dll userinit.exe uxtheme.dll version.dll wininet.dll winspool.drv winsta.dll userenv.dll

title Optimizing registry...
echo ---------------------
C:\slimwin\exe\ntregopt silent /reboot