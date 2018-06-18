@ECHO OFF

::***** Check if Stream290.txt is already installed in %systemroot%\XXXXX *****
set STREAM290_CHECK=%systemroot%\XXXXX\Stream290.txt
if exist "%STREAM290_CHECK%" goto ALREADYINSTALLED

::***** Copy files to local computer *****
pushd %~dp0
xcopy *.* %systemroot%\XXXXX\Stream290\
popd
cls
goto STARTINSTALL

::***** Install Stream 2.9.0 *****
:STARTINSTALL
ECHO Installing Stream 2.9.0. This box will close when installation is complete.
%systemroot%\XXXXX\Stream290\stream-win32-2.9.0-setup.exe /S /D=C:\Program Files (x86)\Stream\
md "%ProgramData%\Microsoft\Windows\Start Menu\Programs\Stream"  >nul 2>&1
xcopy /e /y "%systemroot%\XXXXX\Stream290\Stream.lnk" "%ProgramData%\Microsoft\Windows\Start Menu\Programs\Stream" >nul 2>&1
xcopy /e /y "%systemroot%\XXXXX\Stream290\Uninstall_Stream.lnk" "%ProgramData%\Microsoft\Windows\Start Menu\Programs\Stream" >nul 2>&1
xcopy /e /y "%ProgramData%\Microsoft\Windows\Start Menu\Programs\Stream\Stream.lnk" "C:\Users\Public\Desktop"  >nul 2>&1
goto CREATELOG

::***** Create Log that Stream 2.9.0 was installed so it won't try reinstalling *****
:CREATELOG
ECHO Installed Stream 2.9.0 on %date% at %time% > %systemroot%\XXXXX\Stream290.txt
goto INSTALLED

::***** Notification that Stream 2.9.0 was already installed - Calls Stream290_already_installed.vbs *****
:ALREADYINSTALLED
pushd %~dp0
xcopy Stream290_already_installed.vbs %systemroot%\XXXXX\Stream290\
popd
cls
ECHO Stream 2.9.0 was already installed!
%systemroot%\XXXXX\Stream290\Stream290_already_installed.vbs
goto CLEANUPANDEND

::***** Installation Complete - Calls Stream290_installation_complete.vbs*****
:INSTALLED
%systemroot%\XXXXX\Stream290\Stream290_installation_complete.vbs
goto CLEANUPANDEND

::***** Clean Up (Delete copied installation files) and end script *****
:CLEANUPANDEND
cd..
RD %systemroot%\XXXXX\Stream290 /s /q & exit