@echo off
setlocal enabledelayedexpansion

title Deleting registry... (HKEY_CLASSES_ROOT)
echo ---------------------
set i=0
echo REGEDIT4 > C:\slimwin\reg1.reg
for /F "usebackq skip=6 tokens=*" %%a in (`reg query HKCR`) do (
	set x=0
	for %%b in (.bat .exe batfile CLSID exefile Drive Folder) do if /I "%%~a"=="HKEY_CLASSES_ROOT\%%~b" set x=1
	if !x!==0 (
		set /A i+=1
		echo [-%%~a] >> C:\slimwin\reg1.reg
	)
)
echo Deleting !i! class keys...
reg import C:\slimwin\reg1.reg

title Deleting registry... (CLSID)
echo ---------------------
set i=0
echo REGEDIT4 > C:\slimwin\reg2.reg
for /F "usebackq skip=6 tokens=*" %%a in (`reg query HKCR\CLSID`) do (
	set x=0
	set p=%%a
	set p=!p:~25,6!
 	for %%b in (000000 000214 603D38 95CE84 A55737 A5E46E AF604E ECD4FC) do if !p!==%%b set x=1
	if !x!==0 (
		set /A i+=1
		echo [-%%~a] >> C:\slimwin\reg2.reg
	)
)
echo Deleting !i! CLSID keys...
reg import C:\slimwin\reg2.reg

title Deleting registry... (SOFTWARE)
echo ---------------------
echo REGEDIT4 > C:\slimwin\reg3.reg
echo [-HKEY_USERS] >> C:\slimwin\reg3.reg
for %%a in (C07ft5Y Clients Gemplus ODBC Policies "Program Groups" Schlumberger Secure "Windows 3.1 Migration Status") do (
	echo [-HKEY_LOCAL_MACHINE\SOFTWARE\%%~a] >> C:\slimwin\reg3.reg
)
for %%a in ("Active Setup" ADs "Advanced INF Setup" ALG AudioCompressionManager COM3 "Command Processor" Conferencing CTF DataAccess DataFactory DeviceManager Dfrg Direct3D DirectDraw DirectInput DirectMusic DirectPlay DirectPlay8 DirectPlayNATHelp DirectX "Driver Signing" DRM DrWatson EAPOL EnterpriseCertificates ESENT EventSystem "IE Setup" IE4 IMAPI "Internet Account Manager" "Internet Connection Wizard" "Internet Domains" "Internet Explorer" IPSec Jet MediaPlayer MessengerService MMC MMCtlsForIE Mobile "Mr. Enigma" MSDTC MSLicensing MSMQ MSN MSN6 Multimedia NetDDE NetSh NetShow "Non-Driver Signing" Ole "Outlook Express" PCHealth Ras "Ras AutoDial" Router Rpc SchedulingAgent Secure "Shared Tools" "Shared Tools Location" SmartCard Speech SystemCertificates Tcpip TelnetServer "Terminal Server Client" Tracing "Transaction Server" TShoot "Tuning Spaces" "UPnP Device Host" WAB WBEM Windows "Windows Media Device Manager" "Windows Messaging Subsystem" "Windows Script Host" "Windows Scripting Host" WZCSVC) do (
	echo [-HKEY_LOCAL_MACHINE\Software\Microsoft\%%~a] >> C:\slimwin\reg3.reg
)
for %%a in (Calais CatalogDB CatDBTempFiles IEDirtyFlags "Machine Settings" OID Protect Providers RNG Services) do (
	echo [-HKEY_LOCAL_MACHINE\Software\Microsoft\Cryptography\%%~a] >> C:\slimwin\reg3.reg
)
for %%a in (Accessibility AeDebug Asr Classes Compatibility Compatibility32 Console Drivers drivers.desc Drivers32 EFS Embedding "Event Viewer" "File Manager" "Font Drivers" FontDPI FontMapper Fonts FontSubstitutes GRE_Initialize HotFix ICM "Image File Execution Options" "IME Compatibility" IMM LanguagePack LastFontSweep MCI "MCI Extensions" MCI32 Midimap ModuleCompatibility Network NetworkCards PerHwIdStorage Ports Prefetcher Print related.desc SeCEdit Setup Storage SystemRestore "Terminal Server" "Time Zones" Tracing "Type 1 Installer" Userinstallable.drivers Windows WOW WPAEvents) do (
	echo [-HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion\%%~a] >> C:\slimwin\reg3.reg
)

reg import C:\slimwin\reg3.reg

title Deleting registry... (SYSTEM)
echo ---------------------
echo REGEDIT4 > C:\slimwin\reg4.reg

for %%a in ({32B62694-E9C9-4405-948C-CFBED5B0705B} BattC ContentFilter ContentIndex dac2w2k Fips Fs_Rec Imami inetaccs Inport ISAPISearch ldap LicenseService NDIS Ndisuio PerfDisk PerfNet PerfOS PerfProc RDPDD RDPNP SamSs Tcpip TSDDD W3SVC Winsock WinSock2 WinTrust WmiApRpl) do (
	echo [-HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\%%~a] >> C:\slimwin\reg4.reg
)
for %%a in (AGP BackupRestore Biosinfo BootVerificationProgram CoDeviceInstallers "COM Name Arbiter" ContentIndex ContentIndexCommon CrashControl CriticalDeviceDatabase DeviceClasses FileSystem GraphicsDrivers HAL IDConfigDB "Keyboard Layout" "Keyboard Layouts" MediaProperties MediaResources Network NTMS PnP Print PriorityControl ProductOptions SafeBoot ScsiPort SecurePipeServers SecurityProviders "Server Applications" ServiceProvider Setup StillImage SystemResources "Terminal Server" TimeZoneInformation Update UsbFlags Video VirtualDeviceDrivers Watchdog Windows WMI WOW) do (
	echo [-HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\%%~a] >> C:\slimwin\reg4.reg
)
reg import C:\slimwin\reg4.reg