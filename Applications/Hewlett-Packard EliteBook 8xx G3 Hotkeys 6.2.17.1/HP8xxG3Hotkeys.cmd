@ECHO OFF

::***** Check if HP8xxG3Hotkeys.txt is already installed in %systemroot%\XXXXX *****
set HP8xxG3Hotkeys_CHECK=%systemroot%\XXXXX\HP8xxG3Hotkeys.txt
if exist "%HP8xxG3Hotkeys_CHECK%" goto ALREADYINSTALLED

::***** Copy files to local computer *****
pushd %~dp0
xcopy *.* %systemroot%\XXXXX\HP8xxG3Hotkeys\
popd
cls
goto STARTINSTALL

::***** Install HP EliteBook 8xx G3 Hotkeys 6.2.17.1 *****
:STARTINSTALL
ECHO Installing HP EliteBook 8xx G3 Hotkeys 6.2.17.1. This box will close when installation is complete.
%systemroot%\XXXXX\HP8xxG3Hotkeys\setup.exe /S /V"/qn REBOOT=Reallysuppress"

::***** Create Log that HP EliteBook 8xx G3 Hotkeys 6.2.17.1 was installed so it won't try reinstalling *****
:CREATELOG
ECHO Installed HP EliteBook 8xx G3 Hotkeys 6.2.17.1 on %date% at %time% > %systemroot%\XXXXX\HP8xxG3Hotkeys.txt
goto INSTALLED

::***** Notification that HP EliteBook 8xx G3 Hotkeys 6.2.17.1 was already installed - Calls HP8xxG3Hotkeys_already_installed.vbs *****
:ALREADYINSTALLED
pushd %~dp0
xcopy HP8xxG3Hotkeys_already_installed.vbs %systemroot%\XXXXX\HP8xxG3Hotkeys\
popd
cls
ECHO HP EliteBook 8xx G3 Hotkeys 6.2.17.1 was already installed!
%systemroot%\XXXXX\HP8xxG3Hotkeys\HP8xxG3Hotkeys_already_installed.vbs
goto CLEANUPANDEND

::***** Installation Complete - Calls HP8xxG3Hotkeys_installation_complete.vbs*****
:INSTALLED
%systemroot%\XXXXX\HP8xxG3Hotkeys\HP8xxG3Hotkeys_installation_complete.vbs
goto CLEANUPANDEND

::***** Clean Up (Delete extracted installation files) and end script *****
:CLEANUPANDEND
cd..
RD %systemroot%\XXXXX\HP8xxG3Hotkeys /s /q & exit