@ECHO OFF

::***** Check if Vecwin1050.txt is already installed in %systemroot%\XXXXX *****
set VECWIN1050_CHECK=%systemroot%\XXXXX\Vecwin1050.txt
if exist "%VECWIN1050_CHECK%" goto ALREADYINSTALLED

::***** Copy files to local computer *****
pushd %~dp0
xcopy *.* %systemroot%\XXXXX\Vecwin1050\
popd
cls
goto STARTINSTALL

::***** Install Vecwin 10.50 *****
:STARTINSTALL
ECHO Installing Vecwin 10.50. This box will close when installation is complete.
MsiExec.exe /qn /i %systemroot%\XXXXX\Vecwin1050\Vecwin1050.msi
goto CREATELOG

::***** Create Log that Vecwin 10.50 was installed so it won't try reinstalling *****
:CREATELOG
ECHO Installed Vecwin 10.50 on %date% at %time% > %systemroot%\XXXXX\Vecwin1050.txt
goto INSTALLED

::***** Notification that Vecwin 10.50 was already installed - Calls Vecwin1050_already_installed.vbs *****
:ALREADYINSTALLED
pushd %~dp0
xcopy Vecwin1050_already_installed.vbs %systemroot%\XXXXX\Vecwin1050\
popd
cls
ECHO Vecwin 10.50 was already installed!
%systemroot%\XXXXX\Vecwin1050\Vecwin1050_already_installed.vbs
goto CLEANUPANDEND

::***** Installation Complete - Calls Vecwin1050_installation_complete.vbs*****
:INSTALLED
%systemroot%\XXXXX\Vecwin1050\Vecwin1050_installation_complete.vbs
goto CLEANUPANDEND

::***** Clean Up (Delete extracted installation files) and end script *****
:CLEANUPANDEND
cd..
RD %systemroot%\XXXXX\Vecwin1050 /s /q & exit