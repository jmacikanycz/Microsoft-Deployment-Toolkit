@ECHO OFF

::***** Check if LenovoE440Hotkeys.txt is already installed in %systemroot%\XXXXX *****
set LenovoE440Hotkeys_CHECK=%systemroot%\XXXXX\LenovoE440Hotkeys.txt
if exist "%LenovoE440Hotkeys_CHECK%" goto ALREADYINSTALLED

::***** Copy files to local computer *****
pushd %~dp0
xcopy /e /y *.* %systemroot%\XXXXX\LenovoE440Hotkeys\
popd
cls
goto STARTINSTALL

::***** Install Lenovo E440 Hotkeys 5.51.0100 *****
:STARTINSTALL
ECHO Installing Lenovo E440 Hotkeys 5.51.0100. This box will close when installation is complete.
%systemroot%\XXXXX\LenovoE440Hotkeys\setup.exe /S /B /H

::***** Create Log that Lenovo E440 Hotkeys 5.51.0100 was installed so it won't try reinstalling *****
:CREATELOG
ECHO Installed Lenovo E440 Hotkeys 5.51.0100 on %date% at %time% > %systemroot%\XXXXX\LenovoE440Hotkeys.txt
goto INSTALLED

::***** Notification that Lenovo E440 Hotkeys 5.51.0100 was already installed - Calls LenovoE440Hotkeys_already_installed.vbs *****
:ALREADYINSTALLED
pushd %~dp0
xcopy LenovoE440Hotkeys_already_installed.vbs %systemroot%\XXXXX\LenovoE440Hotkeys\
popd
cls
ECHO Lenovo E440 Hotkeys 5.51.0100 was already installed!
%systemroot%\XXXXX\LenovoE440Hotkeys\LenovoE440Hotkeys_already_installed.vbs
goto CLEANUPANDEND

::***** Installation Complete - Calls LenovoE440Hotkeys_installation_complete.vbs*****
:INSTALLED
%systemroot%\XXXXX\LenovoE440Hotkeys\LenovoE440Hotkeys_installation_complete.vbs
goto CLEANUPANDEND

::***** Clean Up (Delete extracted installation files) and end script *****
:CLEANUPANDEND
cd..
RD %systemroot%\XXXXX\LenovoE440Hotkeys /s /q & exit