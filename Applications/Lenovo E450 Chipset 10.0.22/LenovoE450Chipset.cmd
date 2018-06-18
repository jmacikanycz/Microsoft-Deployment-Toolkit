@ECHO OFF

::***** Check if LenovoE450Chipset.txt is already installed in %systemroot%\XXXXX *****
set LenovoE450Chipset_CHECK=%systemroot%\XXXXX\LenovoE450Chipset.txt
if exist "%LenovoE450Chipset_CHECK%" goto ALREADYINSTALLED

::***** Copy files to local computer *****
pushd %~dp0
xcopy /e /y *.* %systemroot%\XXXXX\LenovoE450Chipset\
popd
cls
goto STARTINSTALL

::***** Install Lenovo E450 Chipset 10.0.22 *****
:STARTINSTALL
ECHO Installing Lenovo E450 Chipset 10.0.22. This box will close when installation is complete.
%systemroot%\XXXXX\LenovoE450Chipset\SetupChipset.exe -s

::***** Create Log that Lenovo E450 Chipset 10.0.22 was installed so it won't try reinstalling *****
:CREATELOG
ECHO Installed Lenovo E450 Chipset 10.0.22 on %date% at %time% > %systemroot%\XXXXX\LenovoE450Chipset.txt
goto INSTALLED

::***** Notification that Lenovo E450 Chipset 10.0.22 was already installed - Calls LenovoE450Chipset_already_installed.vbs *****
:ALREADYINSTALLED
pushd %~dp0
xcopy LenovoE450Chipset_already_installed.vbs %systemroot%\XXXXX\LenovoE450Chipset\
popd
cls
ECHO Lenovo E450 Chipset 10.0.22 was already installed!
%systemroot%\XXXXX\LenovoE450Chipset\LenovoE450Chipset_already_installed.vbs
goto CLEANUPANDEND

::***** Installation Complete - Calls LenovoE450Chipset_installation_complete.vbs*****
:INSTALLED
%systemroot%\XXXXX\LenovoE450Chipset\LenovoE450Chipset_installation_complete.vbs
goto CLEANUPANDEND

::***** Clean Up (Delete extracted installation files) and end script *****
:CLEANUPANDEND
cd..
RD %systemroot%\XXXXX\LenovoE450Chipset /s /q & exit