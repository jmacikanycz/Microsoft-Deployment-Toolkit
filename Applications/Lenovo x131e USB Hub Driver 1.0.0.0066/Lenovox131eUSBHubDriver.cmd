@ECHO OFF

::***** Check if Lenovox131eUSBHubDriver.txt is already installed in %systemroot%\XXXXX *****
set Lenovox131eUSBHubDriver_CHECK=%systemroot%\XXXXX\Lenovox131eUSBHubDriver.txt
if exist "%Lenovox131eUSBHubDriver_CHECK%" goto ALREADYINSTALLED

::***** Copy files to local computer *****
pushd %~dp0
xcopy /e /q *.* %systemroot%\XXXXX\Lenovox131eUSBHubDriver\
popd
cls
goto STARTINSTALL

::***** Install Lenovo x131e USB Hub Driver *****
:STARTINSTALL
ECHO Installing Lenovo x131e USB Hub Driver. This box will close when installation is complete.
PnPUtil -i -a %systemroot%\XXXXX\Lenovox131eUSBHubDriver\amdhub30\amdhub30.inf
goto CREATELOG

::***** Create Log that Lenovo x131e USB Hub Driver was installed so it won't try reinstalling *****
:CREATELOG
ECHO Installed Lenovo x131e USB Hub Driver on %date% at %time% > %systemroot%\XXXXX\Lenovox131eUSBHubDriver.txt
goto INSTALLED

::***** Notification that Lenovo x131e USB Hub Driver was already installed - Calls Lenovox131eUSBHubDriver_already_installed.vbs *****
:ALREADYINSTALLED
pushd %~dp0
xcopy Lenovox131eUSBHubDriver_already_installed.vbs %systemroot%\XXXXX\Lenovox131eUSBHubDriver\
popd
cls
ECHO Lenovo x131e USB Hub Driver was already installed!
%systemroot%\XXXXX\Lenovox131eUSBHubDriver\Lenovox131eUSBHubDriver_already_installed.vbs
goto CLEANUPANDEND

::***** Installation Complete - Calls Lenovox131eUSBHubDriver_installation_complete.vbs*****
:INSTALLED
%systemroot%\XXXXX\Lenovox131eUSBHubDriver\Lenovox131eUSBHubDriver_installation_complete.vbs
goto CLEANUPANDEND

::***** Clean Up (Delete extracted installation files) and end script *****
:CLEANUPANDEND
cd..
RD %systemroot%\XXXXX\Lenovox131eUSBHubDriver /s /q & exit