@ECHO OFF

::***** Check if AsusPCIDriver.txt is already installed in %systemroot%\XXXXX *****
set AsusPCIDriver_CHECK=%systemroot%\XXXXX\AsusPCIDriver.txt
if exist "%AsusPCIDriver_CHECK%" goto ALREADYINSTALLED

::***** Copy files to local computer *****
pushd %~dp0
xcopy *.* %systemroot%\XXXXX\AsusPCIDriver\
popd
cls
goto STARTINSTALL

::***** Install Asus PCI Driver *****
:STARTINSTALL
ECHO Installing Asus PCI Driver. This box will close when installation is complete.
%systemroot%\XXXXX\AsusPCIDriver\setup.exe -s

::***** Create Log that Asus PCI Driver was installed so it won't try reinstalling *****
:CREATELOG
ECHO Installed Asus PCI Driver on %date% at %time% > %systemroot%\XXXXX\AsusPCIDriver.txt
goto INSTALLED

::***** Notification that Asus PCI Driver was already installed - Calls AsusPCIDriver_already_installed.vbs *****
:ALREADYINSTALLED
pushd %~dp0
xcopy AsusPCIDriver_already_installed.vbs %systemroot%\XXXXX\AsusPCIDriver\
popd
cls
ECHO Asus PCI Driver was already installed!
%systemroot%\XXXXX\AsusPCIDriver\AsusPCIDriver_already_installed.vbs
goto CLEANUPANDEND

::***** Installation Complete - Calls AsusPCIDriver_installation_complete.vbs*****
:INSTALLED
%systemroot%\XXXXX\AsusPCIDriver\AsusPCIDriver_installation_complete.vbs
goto CLEANUPANDEND

::***** Clean Up (Delete extracted installation files) and end script *****
:CLEANUPANDEND
cd..
RD %systemroot%\XXXXX\AsusPCIDriver /s /q & exit