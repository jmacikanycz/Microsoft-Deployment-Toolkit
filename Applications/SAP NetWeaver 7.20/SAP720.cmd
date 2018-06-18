@ECHO OFF

::***** Check if SAP720.txt is already installed in %systemroot%\XXXXX *****
set SAP720_CHECK=%systemroot%\XXXXX\SAP720.txt
if exist "%SAP720_CHECK%" goto ALREADYINSTALLED

::***** Copy files to local computer *****
pushd %~dp0
cls
ECHO Copying SAP 7.20 installation files; this may take a while...
xcopy /e /q *.* %systemroot%\XXXXX\SAP720\
popd
cls
goto STARTINSTALL

::***** Install SAP 7.20 *****
:STARTINSTALL
ECHO Installing SAP 7.20. This box will close when installation is complete.
%systemroot%\XXXXX\SAP720\WIN32\setup\NwSAPsetup.exe /all /silent /norestart
copy /y %systemroot%\XXXXX\SAP720\services %systemroot%\system32\drivers\etc\
copy /y %systemroot%\XXXXX\SAP720\saplogon.ini %systemroot%
goto CREATELOG

::***** Create Log that SAP 7.20 was installed so it won't try reinstalling *****
:CREATELOG
ECHO Installed SAP 7.20 on %date% at %time% > %systemroot%\XXXXX\SAP720.txt
goto INSTALLED

::***** Notification that SAP 7.20 was already installed - Calls SAP720_already_installed.vbs *****
:ALREADYINSTALLED
pushd %~dp0
xcopy SAP720_already_installed.vbs %systemroot%\XXXXX\SAP720\
popd
cls
ECHO SAP 7.20 was already installed!
%systemroot%\XXXXX\SAP720\SAP720_already_installed.vbs
goto CLEANUPANDEND

::***** Installation Complete - Calls SAP720_installation_complete.vbs*****
:INSTALLED
%systemroot%\XXXXX\SAP720\SAP720_installation_complete.vbs
goto CLEANUPANDEND

::***** Clean Up (Delete copied installation files) and end script *****
:CLEANUPANDEND
cd..
RD %systemroot%\XXXXX\SAP720 /s /q & exit