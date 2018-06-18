@ECHO OFF

::***** Check if CiscoAnyConnect31495.txt is already installed in %systemroot%\XXXXX *****
set CISCOANYCONNECT31495_CHECK=%systemroot%\XXXXX\CiscoAnyConnect31495.txt
if exist "%CISCOANYCONNECT31495_CHECK%" goto ALREADYINSTALLED

::***** Copy files to local computer *****
pushd %~dp0
xcopy *.* %systemroot%\XXXXX\CiscoAnyConnect31495\
popd
cls
goto STARTINSTALL

::***** Install Cisco AnyConnect 3.1.495 *****
:STARTINSTALL
ECHO Installing Cisco AnyConnect 3.1.495. This box will close when installation is complete.
md "C:\Users\Administrator\AppData\Local\Cisco\Cisco AnyConnect Secure Mobility Client"
copy /y %systemroot%\XXXXX\CiscoAnyConnect31495\Preferences.xml "C:\Users\Administrator\AppData\Local\Cisco\Cisco AnyConnect Secure Mobility Client\" >nul 2>&1
md "C:\Users\Default\AppData\Local\Cisco\Cisco AnyConnect Secure Mobility Client"
copy /y %systemroot%\XXXXX\CiscoAnyConnect31495\Preferences.xml "C:\Users\Default\AppData\Local\Cisco\Cisco AnyConnect Secure Mobility Client\" >nul 2>&1
%systemroot%\XXXXX\CiscoAnyConnect31495\CiscoAnyconnect.exe /qn
copy /y "C:\ProgramData\Microsoft\Windows\Start Menu\Cisco AnyConnect Secure Mobility Client.lnk" "C:\Users\Public\Desktop" >nul 2>&1
goto CREATELOG

::***** Create Log that Cisco AnyConnect 3.1.495 was installed so it won't try reinstalling *****
:CREATELOG
ECHO Installed Cisco AnyConnect 3.1.495 on %date% at %time% > %systemroot%\XXXXX\CiscoAnyConnect31495.txt
goto INSTALLED

::***** Notification that Cisco AnyConnect 3.1.495 was already installed - Calls CiscoAnyConnect31495_already_installed.vbs *****
:ALREADYINSTALLED
pushd %~dp0
xcopy CiscoAnyConnect31495_already_installed.vbs %systemroot%\XXXXX\CiscoAnyConnect31495\
popd
cls
ECHO Cisco AnyConnect 3.1.495 was already installed!
%systemroot%\XXXXX\CiscoAnyConnect31495\CiscoAnyConnect31495_already_installed.vbs
goto CLEANUPANDEND

::***** Installation Complete - Calls CiscoAnyConnect31495_installation_complete.vbs*****
:INSTALLED
%systemroot%\XXXXX\AdobeReader11007\CiscoAnyConnect31495_installation_complete.vbs
goto CLEANUPANDEND

::***** Clean Up (Delete copied installation files) and end script *****
:CLEANUPANDEND
cd..
RD %systemroot%\XXXXX\CiscoAnyConnect31495 /s /q & exit