@ECHO OFF

::***** Check if LeoPC311.txt is already installed in %systemroot%\XXXXX *****
set LEOPC311_CHECK=%systemroot%\XXXXX\LeoPC311.txt
if exist "%LEOPC311_CHECK%" goto ALREADYINSTALLED

::***** Copy files to local computer *****
pushd %~dp0
xcopy /e /y *.* %systemroot%\XXXXX\LeoPC311\
popd
cls
goto STARTINSTALL

::***** Install LeoPC 3.1.1 *****
:STARTINSTALL
ECHO Installing LeoPC 3.1.1. This box will close when installation is complete.
%systemroot%\XXXXX\LeoPC311\LEOPC\leopc1\setup.exe /S
%systemroot%\XXXXX\LeoPC311\LEOPC\leopc1\vci216.exe /LOADINF="%systemroot%\XXXXX\LeoPC311\LEOPC\leopc1\vci216" /NORESTART /SILENT
xcopy /e /y "%ProgramData%\Microsoft\Windows\Start Menu\Programs\Woodward\LeoPC1\LeoPC1.lnk" "C:\Users\Public\Desktop"  >nul 2>&1
goto CREATELOG

::***** Create Log that LeoPC 3.1.1 was installed so it won't try reinstalling *****
:CREATELOG
ECHO Installed LeoPC 3.1.1 on %date% at %time% > %systemroot%\XXXXX\LeoPC311.txt
goto INSTALLED

::***** Notification that LeoPC 3.1.1 was already installed - Calls LeoPC311_already_installed.vbs *****
:ALREADYINSTALLED
pushd %~dp0
xcopy LeoPC311_already_installed.vbs %systemroot%\XXXXX\LeoPC311\
popd
cls
ECHO LeoPC 3.1.1 was already installed!
%systemroot%\XXXXX\LeoPC311\LeoPC311_already_installed.vbs
goto CLEANUPANDEND

::***** Installation Complete - Calls LeoPC311_installation_complete.vbs*****
:INSTALLED
%systemroot%\XXXXX\LeoPC311\LeoPC311_installation_complete.vbs
goto CLEANUPANDEND

::***** Clean Up (Delete copied installation files) and end script *****
:CLEANUPANDEND
cd..
RD %systemroot%\XXXXX\LeoPC311 /s /q & exit