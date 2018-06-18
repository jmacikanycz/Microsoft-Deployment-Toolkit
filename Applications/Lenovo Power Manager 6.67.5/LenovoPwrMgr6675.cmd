@ECHO OFF

::***** Check if LenovoPwrMgr6675.txt is already installed in %systemroot%\XXXXX *****
set LenovoPwrMgr6675_CHECK=%systemroot%\XXXXX\LenovoPwrMgr6675.txt
if exist "%LenovoPwrMgr6675_CHECK%" goto ALREADYINSTALLED

::***** Copy files to local computer *****
pushd %~dp0
xcopy /e /q *.* %systemroot%\XXXXX\LenovoPwrMgr6675\
popd
cls
goto STARTINSTALL

::***** Install Lenovo Power Manager 6.67.5 *****
:STARTINSTALL
ECHO Installing Lenovo Power Manager 6.67.5. This box will close when installation is complete.
%systemroot%\XXXXX\LenovoPwrMgr6675\pwrmgrv\setup.exe /s REBOOT=ReallySuppress
goto CREATELOG

::***** Create Log that Lenovo Power Manager 6.67.5 was installed so it won't try reinstalling *****
:CREATELOG
ECHO Installed Lenovo Power Manager 6.67.5 on %date% at %time% > %systemroot%\XXXXX\LenovoPwrMgr6675.txt
goto INSTALLED

::***** Notification that Lenovo Power Manager 6.67.5 was already installed - Calls LenovoPwrMgr6675_already_installed.vbs *****
:ALREADYINSTALLED
pushd %~dp0
xcopy LenovoPwrMgr6675_already_installed.vbs %systemroot%\XXXXX\LenovoPwrMgr6675\
popd
cls
ECHO Lenovo Power Manager 6.67.5 was already installed!
%systemroot%\XXXXX\LenovoPwrMgr6675\LenovoPwrMgr6675_already_installed.vbs
goto CLEANUPANDEND

::***** Installation Complete - Calls LenovoPwrMgr6675_installation_complete.vbs*****
:INSTALLED
%systemroot%\XXXXX\LenovoPwrMgr6675\LenovoPwrMgr6675_installation_complete.vbs
goto CLEANUPANDEND

::***** Clean Up (Delete extracted installation files) and end script *****
:CLEANUPANDEND
cd..
RD %systemroot%\XXXXX\LenovoPwrMgr6675 /s /q & exit