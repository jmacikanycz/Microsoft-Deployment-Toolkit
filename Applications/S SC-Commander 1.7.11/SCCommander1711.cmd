@ECHO OFF

::***** Check if SCCommander1711.txt is already installed in C:\Windows\XXXXX *****
set SCCOMMANDER1711_CHECK=C:\Windows\XXXXX\SCCommander1711.txt
if exist "%SCCOMMANDER1711_CHECK%" goto ALREADYINSTALLED

::***** Copy files to local computer *****
pushd %~dp0
cls
ECHO Copying SC-Commander 1.7.11 files. This box will close when installation begins.
xcopy /e /q *.* %systemroot%\XXXXX\SCCommander1711\
popd
cls
goto STARTINSTALL

::***** Install SC-Commander 1.7.11 *****
:STARTINSTALL
ECHO Installing SC-Commander 1.7.11. This box will close when installation is complete.
md "C:\Program Files (x86)\SC-Commander"  >nul 2>&1
md "%ProgramData%\Microsoft\Windows\Start Menu\Programs\SC-Commander"  >nul 2>&1
robocopy %systemroot%\XXXXX\SCCommander1711\SC-Commander "C:\Program Files (x86)\SC-Commander" /S /E /COPYALL /Z /R:0 /W:0   >nul 2>&1
robocopy %systemroot%\XXXXX\SCCommander1711\Shortcuts "%ProgramData%\Microsoft\Windows\Start Menu\Programs\SC-Commander" /S /E /COPYALL /Z /R:0 /W:0  >nul 2>&1
xcopy /e /y %systemroot%\XXXXX\SCCommander1711\Shortcuts\SC-Commander.lnk "C:\Users\Public\Desktop"  >nul 2>&1
goto CREATELOG

::***** Create Log that SC-Commander 1.7.11 was installed so it won't try reinstalling *****
:CREATELOG
ECHO Installed SC-Commander 1.7.11 on %date% at %time% > c:\windows\XXXXX\SCCommander1711.txt
goto INSTALLED

::***** Notification that SC-Commander 1.7.11 was already installed - Calls SCCommander1711_already_installed.vbs *****
:ALREADYINSTALLED
pushd %~dp0
xcopy SCCommander1711_already_installed.vbs %systemroot%\XXXXX\SCCommander1711\
popd
cls
ECHO SC-Commander 1.7.11 was already installed!
%systemroot%\XXXXX\SCCommander1711\SCCommander1711_already_installed.vbs
goto CLEANUPANDEND

::***** Installation Complete - Calls SCCommander1711_installation_complete.vbs*****
:INSTALLED
%systemroot%\XXXXX\SCCommander1711\SCCommander1711_installation_complete.vbs
goto CLEANUPANDEND

::***** Clean Up (Delete extracted installation files) and end script *****
:CLEANUPANDEND
cd..
RD C:\Windows\XXXXX\SCCommander1711 /s /q & exit