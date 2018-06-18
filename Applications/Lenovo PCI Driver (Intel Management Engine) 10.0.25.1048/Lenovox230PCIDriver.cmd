@ECHO OFF

::***** Check if Lenovox230PCIDriver.txt is already installed in %systemroot%\XXXXX *****
set Lenovox230PCIDriver_CHECK=%systemroot%\XXXXX\Lenovox230PCIDriver.txt
if exist "%Lenovox230PCIDriver_CHECK%" goto ALREADYINSTALLED

::***** Copy files to local computer *****
pushd %~dp0
cls
ECHO Copying Lenovo x230 PCI driver files. This box will close when installation begins.
xcopy /e /q *.* %systemroot%\XXXXX\Lenovox230PCIDriver\
popd
cls
goto STARTINSTALL

::***** Install Lenovox230 PCI Driver *****
:STARTINSTALL
ECHO Installing Lenovox230 PCI Driver. This box will close when installation is complete.
%systemroot%\XXXXX\Lenovox230PCIDriver\SetupME.exe -s
regedit /s AppAutoStartDefaultVal.reg

::***** Create Log that Lenovox230 PCI Driver was installed so it won't try reinstalling *****
:CREATELOG
ECHO Installed Lenovo x230 PCI Driver on %date% at %time% > %systemroot%\XXXXX\LenovoX230PCIDriver.txt
goto INSTALLED

::***** Notification that Lenovox230 PCI Driver was already installed - Calls Lenovox230PCIDriver_already_installed.vbs *****
:ALREADYINSTALLED
pushd %~dp0
xcopy Lenovox230PCIDriver_already_installed.vbs %systemroot%\XXXXX\Lenovox230PCIDriver\
popd
cls
ECHO Lenovox230 PCI Driver was already installed!
%systemroot%\XXXXX\Lenovox230PCIDriver\Lenovox230PCIDriver_already_installed.vbs
goto CLEANUPANDEND

::***** Installation Complete - Calls Lenovox230PCIDriver_installation_complete.vbs*****
:INSTALLED
%systemroot%\XXXXX\Lenovox230PCIDriver\Lenovox230PCIDriver_installation_complete.vbs
goto CLEANUPANDEND

::***** Clean Up (Delete extracted installation files) and end script *****
:CLEANUPANDEND
cd..
RD %systemroot%\XXXXX\Lenovox230PCIDriver /s /q & exit