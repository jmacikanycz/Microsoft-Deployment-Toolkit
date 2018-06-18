@ECHO OFF

::***** Check if HP4420sHotKeys.txt is already installed in %systemroot%\XXXXX *****
set HP4420sHotKeys_CHECK=%systemroot%\XXXXX\HP4420sHotKeys.txt
if exist "%HP4420sHotKeys_CHECK%" goto ALREADYINSTALLED

::***** Copy files to local computer *****
pushd %~dp0
xcopy *.* %systemroot%\XXXXX\HP4420sHotKeys\
popd
cls
goto STARTINSTALL

::***** Install HP ProBook 4420s Hotkeys 4.0.3.1 *****
:STARTINSTALL
ECHO Installing HP ProBook 4420s Hotkeys 4.0.3.1. This box will close when installation is complete.
HPHKS.exe /qn /norestart

::***** Create Log that HP ProBook 4420s Hotkeys 4.0.3.1 was installed so it won't try reinstalling *****
:CREATELOG
ECHO Installed HP ProBook 4420s Hotkeys 4.0.3.1 on %date% at %time% > %systemroot%\XXXXX\HP4420sHotKeys.txt
goto INSTALLED

::***** Notification that HP ProBook 4420s Hotkeys 4.0.3.1 was already installed - Calls HP4420sHotKeys_already_installed.vbs *****
:ALREADYINSTALLED
pushd %~dp0
xcopy HP4420sHotKeys_already_installed.vbs %systemroot%\XXXXX\HP4420sHotKeys\
popd
cls
ECHO HP ProBook 4420s Hotkeys 4.0.3.1 was already installed!
%systemroot%\XXXXX\HP4420sHotKeys\HP4420sHotKeys_already_installed.vbs
goto CLEANUPANDEND

::***** Installation Complete - Calls HP4420sHotKeys_installation_complete.vbs*****
:INSTALLED
%systemroot%\XXXXX\HP4420sHotKeys\HP4420sHotKeys_installation_complete.vbs
goto CLEANUPANDEND

::***** Clean Up (Delete extracted installation files) and end script *****
:CLEANUPANDEND
cd..
RD %systemroot%\XXXXX\HP4420sHotKeys /s /q & exit