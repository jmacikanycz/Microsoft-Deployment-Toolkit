@ECHO OFF

::***** Check if LenovoE450Hotkeys.txt is already installed in %systemroot%\XXXXX *****
set LenovoE450Hotkeys_CHECK=%systemroot%\XXXXX\LenovoE450Hotkeys.txt
if exist "%LenovoE450Hotkeys_CHECK%" goto ALREADYINSTALLED

::***** Copy files to local computer *****
pushd %~dp0
xcopy /e /y *.* %systemroot%\XXXXX\LenovoE450Hotkeys\
popd
cls
goto STARTINSTALL

::***** Install Lenovo E450 Hotkeys 8.63.10 *****
:STARTINSTALL
ECHO Installing Lenovo E450 Hotkeys 8.63.10. This box will close when installation is complete.
%systemroot%\XXXXX\LenovoE450Hotkeys\setup.exe /SP- /VERYSILENT /NORESTART /SUPPRESSMSGBOXES

::***** Create Log that Lenovo E450 Hotkeys 8.63.10 was installed so it won't try reinstalling *****
:CREATELOG
ECHO Installed Lenovo E450 Hotkeys 8.63.10 on %date% at %time% > %systemroot%\XXXXX\LenovoE450Hotkeys.txt
goto INSTALLED

::***** Notification that Lenovo E450 Hotkeys 8.63.10 was already installed - Calls LenovoE450Hotkeys_already_installed.vbs *****
:ALREADYINSTALLED
pushd %~dp0
xcopy LenovoE450Hotkeys_already_installed.vbs %systemroot%\XXXXX\LenovoE450Hotkeys\
popd
cls
ECHO Lenovo E450 Hotkeys 8.63.10 was already installed!
%systemroot%\XXXXX\LenovoE450Hotkeys\LenovoE450Hotkeys_already_installed.vbs
goto CLEANUPANDEND

::***** Installation Complete - Calls LenovoE450Hotkeys_installation_complete.vbs*****
:INSTALLED
%systemroot%\XXXXX\LenovoE450Hotkeys\LenovoE450Hotkeys_installation_complete.vbs
goto CLEANUPANDEND

::***** Clean Up (Delete extracted installation files) and end script *****
:CLEANUPANDEND
cd..
RD %systemroot%\XXXXX\LenovoE450Hotkeys /s /q & exit