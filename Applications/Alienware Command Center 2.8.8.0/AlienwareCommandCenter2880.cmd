@ECHO OFF

::***** Check if AlienwareCommandCenter2880.txt is already installed in %systemroot%\XXXXX *****
set AlienwareCommandCenter2880_CHECK=%systemroot%\XXXXX\AlienwareCommandCenter2880.txt
if exist "%AlienwareCommandCenter2880_CHECK%" goto ALREADYINSTALLED

::***** Copy files to local computer *****
pushd %~dp0
cls
ECHO Copying Alienware Command Center 2.8.8.0 files. This box will close when installation begins.
xcopy /e /q *.* %systemroot%\XXXXX\AlienwareCommandCenter2880\
popd
cls
goto STARTINSTALL

::***** Install Alienware Command Center 2.8.8.0 *****
:STARTINSTALL
ECHO Installing Alienware Command Center 2.8.8.0. This box will close when installation is complete.
%systemroot%\XXXXX\AlienwareCommandCenter2880\Setup.exe /S /v/qn

::***** Create Log that Alienware Command Center 2.8.8.0 was installed so it won't try reinstalling *****
:CREATELOG
ECHO Installed Alienware Command Center 2.8.8.0 on %date% at %time% > %systemroot%\XXXXX\AlienwareCommandCenter2880.txt
goto INSTALLED

::***** Notification that Alienware Command Center 2.8.8.0 was already installed - Calls AlienwareCommandCenter2880_already_installed.vbs *****
:ALREADYINSTALLED
pushd %~dp0
xcopy AlienwareCommandCenter2880_already_installed.vbs %systemroot%\XXXXX\AlienwareCommandCenter2880\
popd
cls
ECHO Alienware Command Center 2.8.8.0 was already installed!
%systemroot%\XXXXX\AlienwareCommandCenter2880\AlienwareCommandCenter2880_already_installed.vbs
goto CLEANUPANDEND

::***** Installation Complete - Calls AlienwareCommandCenter2880_installation_complete.vbs*****
:INSTALLED
%systemroot%\XXXXX\AlienwareCommandCenter2880\AlienwareCommandCenter2880_installation_complete.vbs
goto CLEANUPANDEND

::***** Clean Up (Delete extracted installation files) and end script *****
:CLEANUPANDEND
cd..
RD %systemroot%\XXXXX\AlienwareCommandCenter2880 /s /q & exit