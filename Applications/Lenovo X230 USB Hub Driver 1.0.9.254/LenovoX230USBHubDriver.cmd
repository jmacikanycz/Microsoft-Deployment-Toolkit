@ECHO OFF

::***** Check if LenovoX230USBHubDriver.txt is already installed in %systemroot%\XXXXX *****
set LenovoX230USBHubDriver_CHECK=%systemroot%\XXXXX\LenovoX230USBHubDriver.txt
if exist "%LenovoX230USBHubDriver_CHECK%" goto ALREADYINSTALLED

::***** Copy files to local computer *****
pushd %~dp0
xcopy /e /q *.* %systemroot%\XXXXX\LenovoX230USBHubDriver\
popd
cls
goto STARTINSTALL

::***** Install Lenovo X230 USB Hub Driver *****
:STARTINSTALL
ECHO Installing Lenovo X230 USB Hub Driver. This box will close when installation is complete.
PnPUtil -i -a %systemroot%\XXXXX\LenovoX230USBHubDriver\iusb3hub\iusb3hub.inf
goto CREATELOG

::***** Create Log that Lenovo X230 USB Hub Driver was installed so it won't try reinstalling *****
:CREATELOG
ECHO Installed Lenovo X230 USB Hub Driver on %date% at %time% > %systemroot%\XXXXX\LenovoX230USBHubDriver.txt
goto INSTALLED

::***** Notification that Lenovo X230 USB Hub Driver was already installed - Calls LenovoX230USBHubDriver_already_installed.vbs *****
:ALREADYINSTALLED
pushd %~dp0
xcopy LenovoX230USBHubDriver_already_installed.vbs %systemroot%\XXXXX\LenovoX230USBHubDriver\
popd
cls
ECHO Lenovo X230 USB Hub Driver was already installed!
%systemroot%\XXXXX\LenovoX230USBHubDriver\LenovoX230USBHubDriver_already_installed.vbs
goto CLEANUPANDEND

::***** Installation Complete - Calls LenovoX230USBHubDriver_installation_complete.vbs*****
:INSTALLED
%systemroot%\XXXXX\LenovoX230USBHubDriver\LenovoX230USBHubDriver_installation_complete.vbs
goto CLEANUPANDEND

::***** Clean Up (Delete extracted installation files) and end script *****
:CLEANUPANDEND
cd..
RD %systemroot%\XXXXX\LenovoX230USBHubDriver /s /q & exit