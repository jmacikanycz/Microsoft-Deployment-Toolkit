@ECHO OFF

::***** Check if HP840G3Bluetooth.txt is already installed in %systemroot%\XXXXX *****
set HP840G3Bluetooth_CHECK=%systemroot%\XXXXX\HP840G3Bluetooth.txt
if exist "%HP840G3Bluetooth_CHECK%" goto ALREADYINSTALLED

::***** Copy files to local computer *****
pushd %~dp0
xcopy /e /y *.* %systemroot%\XXXXX\HP840G3Bluetooth\
popd
cls
goto STARTINSTALL

::***** Install HP EliteBook 840 G3 Bluetooth 18.1.1508 *****
:STARTINSTALL
ECHO Installing HP EliteBook 840 G3 Bluetooth 18.1.1508. This box will close when installation is complete.
%systemroot%\XXXXX\HP840G3Bluetooth\InstMultiPkg.exe /silent

::***** Create Log that HP EliteBook 840 G3 Bluetooth 18.1.1508 was installed so it won't try reinstalling *****
:CREATELOG
ECHO Installed HP EliteBook 840 G3 Bluetooth 18.1.1508 on %date% at %time% > %systemroot%\XXXXX\HP840G3Bluetooth.txt
goto INSTALLED

::***** Notification that HP EliteBook 840 G3 Bluetooth 18.1.1508 was already installed - Calls HP840G3Bluetooth_already_installed.vbs *****
:ALREADYINSTALLED
pushd %~dp0
xcopy HP840G3Bluetooth_already_installed.vbs %systemroot%\XXXXX\HP840G3Bluetooth\
popd
cls
ECHO HP EliteBook 840 G3 Bluetooth 18.1.1508 was already installed!
%systemroot%\XXXXX\HP840G3Bluetooth\HP840G3Bluetooth_already_installed.vbs
goto CLEANUPANDEND

::***** Installation Complete - Calls HP840G3Bluetooth_installation_complete.vbs*****
:INSTALLED
%systemroot%\XXXXX\HP840G3Bluetooth\HP840G3Bluetooth_installation_complete.vbs
goto CLEANUPANDEND

::***** Clean Up (Delete extracted installation files) and end script *****
:CLEANUPANDEND
cd..
RD %systemroot%\XXXXX\HP840G3Bluetooth /s /q & exit