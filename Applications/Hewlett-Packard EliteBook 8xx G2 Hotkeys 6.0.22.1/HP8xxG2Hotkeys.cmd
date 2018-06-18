@ECHO OFF

::***** Check if HP8xxG2Hotkeys.txt is already installed in %systemroot%\XXXXX *****
set HP8xxG2Hotkeys_CHECK=%systemroot%\XXXXX\HP8xxG2Hotkeys.txt
if exist "%HP8xxG2Hotkeys_CHECK%" goto ALREADYINSTALLED

::***** Copy files to local computer *****
pushd %~dp0
xcopy *.* %systemroot%\XXXXX\HP8xxG2Hotkeys\
popd
cls
goto STARTINSTALL

::***** Install HP EliteBook 8xx G2 Hotkeys 6.0.22.1 *****
:STARTINSTALL
ECHO Installing HP EliteBook 8xx G2 Hotkeys 6.0.22.1. This box will close when installation is complete.
%systemroot%\XXXXX\HP8xxG2Hotkeys\setup.exe /S /V"/qn REBOOT=Reallysuppress"

::***** Create Log that HP EliteBook 8xx G2 Hotkeys 6.0.22.1 was installed so it won't try reinstalling *****
:CREATELOG
ECHO Installed HP EliteBook 8xx G2 Hotkeys 6.0.22.1 on %date% at %time% > %systemroot%\XXXXX\HP8xxG2Hotkeys.txt
goto INSTALLED

::***** Notification that HP EliteBook 8xx G2 Hotkeys 6.0.22.1 was already installed - Calls HP8xxG2Hotkeys_already_installed.vbs *****
:ALREADYINSTALLED
pushd %~dp0
xcopy HP8xxG2Hotkeys_already_installed.vbs %systemroot%\XXXXX\HP8xxG2Hotkeys\
popd
cls
ECHO HP EliteBook 8xx G2 Hotkeys 6.0.22.1 was already installed!
%systemroot%\XXXXX\HP8xxG2Hotkeys\HP8xxG2Hotkeys_already_installed.vbs
goto CLEANUPANDEND

::***** Installation Complete - Calls HP8xxG2Hotkeys_installation_complete.vbs*****
:INSTALLED
%systemroot%\XXXXX\HP8xxG2Hotkeys\HP8xxG2Hotkeys_installation_complete.vbs
goto CLEANUPANDEND

::***** Clean Up (Delete extracted installation files) and end script *****
:CLEANUPANDEND
cd..
RD %systemroot%\XXXXX\HP8xxG2Hotkeys /s /q & exit