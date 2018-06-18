@ECHO OFF

::***** Check if IntegralDrive32211.txt is already installed in %systemroot%\XXXXX *****
set INTEGRALDRIVE32211_CHECK=%systemroot%\XXXXX\IntegralDrive32211.txt
if exist "%INTEGRALDRIVE32211_CHECK%" goto ALREADYINSTALLED

::***** Copy files to local computer *****
pushd %~dp0
xcopy *.* %systemroot%\XXXXX\IntegralDrive32211\
popd
cls
goto STARTINSTALL

::***** Install IntegralDrive32 2.11 *****
:STARTINSTALL
ECHO Installing IntegralDrive32 2.11. This box will close when installation is complete.
MsiExec.exe /qn /i %systemroot%\XXXXX\IntegralDrive32211\IntegralDrive32_v2.11.msi ALLUSERS=1 REBOOT=ReallySuppress
goto CREATELOG

::***** Create Log that IntegralDrive32 2.11 was installed so it won't try reinstalling *****
:CREATELOG
ECHO Installed IntegralDrive32 2.11 on %date% at %time% > %systemroot%\XXXXX\IntegralDrive32211.txt
goto INSTALLED

::***** Notification that IntegralDrive32 2.11 was already installed - Calls IntegralDrive32211_already_installed.vbs *****
:ALREADYINSTALLED
pushd %~dp0
xcopy IntegralDrive32211_already_installed.vbs %systemroot%\XXXXX\IntegralDrive32211\
popd
cls
ECHO IntegralDrive32 2.11 was already installed!
%systemroot%\XXXXX\IntegralDrive32211\IntegralDrive32211_already_installed.vbs
goto CLEANUPANDEND

::***** Installation Complete - Calls IntegralDrive32211_installation_complete.vbs*****
:INSTALLED
%systemroot%\XXXXX\IntegralDrive32211\IntegralDrive32211_installation_complete.vbs
goto CLEANUPANDEND

::***** Clean Up (Delete extracted installation files) and end script *****
:CLEANUPANDEND
cd..
RD %systemroot%\XXXXX\IntegralDrive32211 /s /q & exit