@ECHO OFF

::***** Check if VLC224.txt is already installed in %systemroot%\XXXXX *****
set VLC224_CHECK=%systemroot%\XXXXX\VLC224.txt
if exist "%VLC224_CHECK%" goto ALREADYINSTALLED

::***** Copy files to local computer *****
pushd %~dp0
xcopy /e /y *.* %systemroot%\XXXXX\VLC224\
popd
cls
goto STARTINSTALL

::***** Install VLC 2.2.4 *****
:STARTINSTALL
ECHO Installing VLC 2.2.4. This box will close when installation is complete.
%systemroot%\XXXXX\VLC224\vlc-2.2.4-win64.exe /S
goto CREATELOG

::***** Create Log that VLC 2.2.4 was installed so it won't try reinstalling *****
:CREATELOG
ECHO Installed VLC 2.2.4 on %date% at %time% > %systemroot%\XXXXX\VLC224.txt
goto INSTALLED

::***** Notification that VLC 2.2.4 was already installed - Calls VLC224_already_installed.vbs *****
:ALREADYINSTALLED
pushd %~dp0
xcopy VLC224_already_installed.vbs %systemroot%\XXXXX\VLC224\
popd
cls
ECHO VLC 2.2.4 was already installed!
%systemroot%\XXXXX\VLC224\VLC224_already_installed.vbs
goto CLEANUPANDEND

::***** Installation Complete - Calls VLC224_installation_complete.vbs*****
:INSTALLED
%systemroot%\XXXXX\VLC224\VLC224_installation_complete.vbs
goto CLEANUPANDEND

::***** Clean Up (Delete copied installation files) and end script *****
:CLEANUPANDEND
cd..
RD %systemroot%\XXXXX\VLC224 /s /q & exit