@ECHO OFF

::***** Check if LenovoT430USBHubDriver.txt is already installed in %systemroot%\XXXXX *****
set LenovoT430USBHubDriver_CHECK=%systemroot%\XXXXX\LenovoT430USBHubDriver.txt
if exist "%LenovoT430USBHubDriver_CHECK%" goto ALREADYINSTALLED

::***** Copy files to local computer *****
pushd %~dp0
xcopy /e /q *.* %systemroot%\XXXXX\LenovoT430USBHubDriver\
popd
cls
goto STARTINSTALL

::***** Install Lenovo T430 USB Hub Driver *****
:STARTINSTALL
ECHO Installing Lenovo T430 USB Hub Driver. This box will close when installation is complete.
PnPUtil -i -a %systemroot%\XXXXX\LenovoT430USBHubDriver\iusb3hub\iusb3hub.inf
goto CREATELOG

::***** Create Log that Lenovo T430 USB Hub Driver was installed so it won't try reinstalling *****
:CREATELOG
ECHO Installed Lenovo T430 USB Hub Driver on %date% at %time% > %systemroot%\XXXXX\LenovoT430USBHubDriver.txt
goto INSTALLED

::***** Notification that Lenovo T430 USB Hub Driver was already installed - Calls LenovoT430USBHubDriver_already_installed.vbs *****
:ALREADYINSTALLED
pushd %~dp0
xcopy LenovoT430USBHubDriver_already_installed.vbs %systemroot%\XXXXX\LenovoT430USBHubDriver\
popd
cls
ECHO Lenovo T430 USB Hub Driver was already installed!
%systemroot%\XXXXX\LenovoT430USBHubDriver\LenovoT430USBHubDriver_already_installed.vbs
goto CLEANUPANDEND

::***** Installation Complete - Calls LenovoT430USBHubDriver_installation_complete.vbs*****
:INSTALLED
%systemroot%\XXXXX\LenovoT430USBHubDriver\LenovoT430USBHubDriver_installation_complete.vbs
goto CLEANUPANDEND

::***** Clean Up (Delete extracted installation files) and end script *****
:CLEANUPANDEND
cd..
RD %systemroot%\XXXXX\LenovoT430USBHubDriver /s /q & exit