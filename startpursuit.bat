@echo off
:: BatchGotAdmin
:-------------------------------------
REM  --> Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params = %*:"=""
    echo UAC.ShellExecute "%~s0", "%params%", "", "runas", 1 >> "%temp%\getadmin.vbs"
    "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    if exist "%temp%\getadmin.vbs" ( del "%temp%\getadmin.vbs" )
    pushd "%CD%"
    CD /D "%~dp0"
:--------------------------------------
echo ====Set Wireless Network Utility===
echo ===================================


:Tryagain
echo Type 1 to start, 0 to stop
set /P "w=>"
if %w%==1 goto Start
if %w%==0 goto Stop
echo Invalid Choice
echo Try again
goto Tryagain
:Start
set /P wifiName=Enter the name of the network : 
set /P wifikey="Enter the key : "
netsh wlan set hostednetwork mode=allow ssid=%wifiName% key=%wifikey%
netsh wlan start hostednetwork
goto End
:Stop
netsh wlan stop hostednetwork
:End
set /P "exit"="Press Return to exit......"