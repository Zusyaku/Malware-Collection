@echo off
setlocal enabledelayedexpansion
for /f "tokens=2 delims=:" %%a in ('netsh wlan show profile') do (
	set "ssid=%%~a"
	call :getpwd "%%ssid:~1%%"
)
pause
:getpwd
set "ssid=%*"
for /f "tokens=2 delims=:" %%i in ('netsh wlan show profile name^="%ssid:"=%" key^=clear ^|findstr /C:"Key Content"') do (
	echo Wi-Fi Name: %ssid% Password : %%i
)