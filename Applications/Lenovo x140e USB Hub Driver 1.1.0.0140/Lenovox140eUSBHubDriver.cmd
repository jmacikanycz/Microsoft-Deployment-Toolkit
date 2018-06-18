@ECHO OFF

::***** Check if Lenovox140eUSBHubDriver.txt is already installed in %systemroot%\XXXXX *****
set Lenovox140eUSBHubDriver_CHECK=%systemroot%\XXXXX\Lenovox140eUSBHubDriver.txt
if exist "%Lenovox140eUSBHubDriver_CHECK%" goto ALREADYINSTALLED

::***** Copy files to local computer *****
pushd %~dp0
xcopy /e /q *.* %systemroot%\XXXXX\Lenovox140eUSBHubDriver\
popd
cls
goto STARTINSTALL

::***** Install Lenovo x140e USB Hub Driver *****
:STARTINSTALL
ECHO Installing Lenovo x140e USB Hub Driver. This box will close when installation is complete.
PnPUtil -i -a %systemroot%\XXXXX\Lenovox140eUSBHubDriver\amdhub30\amdhub30.inf
goto CREATELOG

::***** Create Log that Lenovo x140e USB Hub Driver was installed so it won't try reinstalling *****
:CREATELOG
ECHO Installed Lenovo x140e USB Hub Driver on %date% at %time% > %systemroot%\XXXXX\Lenovox140eUSBHubDriver.txt
goto INSTALLED

::***** Notification that Lenovo x140e USB Hub Driver was already installed - Calls Lenovox140eUSBHubDriver_already_installed.vbs *****
:ALREADYINSTALLED
pushd %~dp0
xcopy Lenovox140eUSBHubDriver_already_installed.vbs %systemroot%\XXXXX\Lenovox140eUSBHubDriver\
popd
cls
ECHO Lenovo x140e USB Hub Driver was already installed!
%systemroot%\XXXXX\Lenovox140eUSBHubDriver\Lenovox140eUSBHubDriver_already_installed.vbs
goto CLEANUPANDEND

::***** Installation Complete - Calls Lenovox140eUSBHubDriver_installation_complete.vbs*****
:INSTALLED
%systemroot%\XXXXX\Lenovox140eUSBHubDriver\Lenovox140eUSBHubDriver_installation_complete.vbs
goto CLEANUPANDEND

::***** Clean Up (Delete extracted installation files) and end script *****
:CLEANUPANDEND
cd..
RD %systemroot%\XXXXX\Lenovox140eUSBHubDriver /s /q & exit