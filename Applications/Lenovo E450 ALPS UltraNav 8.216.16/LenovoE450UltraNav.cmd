@ECHO OFF

::***** Check if LenovoE450UltraNav.txt is already installed in %systemroot%\XXXXX *****
set LenovoE450UltraNav_CHECK=%systemroot%\XXXXX\LenovoE450UltraNav.txt
if exist "%LenovoE450UltraNav_CHECK%" goto ALREADYINSTALLED

::***** Copy files to local computer *****
pushd %~dp0
xcopy /e /y *.* %systemroot%\XXXXX\LenovoE450UltraNav\
popd
cls
goto STARTINSTALL

::***** Install Lenovo E450 UltraNav 8.216.16 *****
:STARTINSTALL
ECHO Installing Lenovo E450 UltraNav 8.216.16. This box will close when installation is complete.
%systemroot%\XXXXX\LenovoE450UltraNav\Setup.exe /s

::***** Create Log that Lenovo E450 UltraNav 8.216.16 was installed so it won't try reinstalling *****
:CREATELOG
ECHO Installed Lenovo E450 UltraNav 8.216.16 on %date% at %time% > %systemroot%\XXXXX\LenovoE450UltraNav.txt
goto INSTALLED

::***** Notification that Lenovo E450 UltraNav 8.216.16 was already installed - Calls LenovoE450UltraNav_already_installed.vbs *****
:ALREADYINSTALLED
pushd %~dp0
xcopy LenovoE450UltraNav_already_installed.vbs %systemroot%\XXXXX\LenovoE450UltraNav\
popd
cls
ECHO Lenovo E450 UltraNav 8.216.16 was already installed!
%systemroot%\XXXXX\LenovoE450UltraNav\LenovoE450UltraNav_already_installed.vbs
goto CLEANUPANDEND

::***** Installation Complete - Calls LenovoE450UltraNav_installation_complete.vbs*****
:INSTALLED
%systemroot%\XXXXX\LenovoE450UltraNav\LenovoE450UltraNav_installation_complete.vbs
goto CLEANUPANDEND

::***** Clean Up (Delete extracted installation files) and end script *****
:CLEANUPANDEND
cd..
RD %systemroot%\XXXXX\LenovoE450UltraNav /s /q & exit