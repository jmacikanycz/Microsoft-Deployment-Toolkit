@ECHO OFF

::***** Check if AsusATKPackage100027.txt is already installed in %systemroot%\XXXXX *****
set ATKPACKAGE_CHECK=%systemroot%\XXXXX\AsusATKPackage100027.txt
if exist "%ATKPACKAGE_CHECK%" goto ALREADYINSTALLED

::***** Copy files to local computer *****
pushd %~dp0
xcopy *.* %systemroot%\XXXXX\AsusATKPackage100027\
popd
cls
goto STARTINSTALL

::***** Install Asus ATKPackage 1.0.0027 *****
:STARTINSTALL
ECHO Installing Asus ATKPackage 1.0.0027. This box will close when installation is complete.
MsiExec.exe /qn /norestart /i %systemroot%\XXXXX\AsusATKPackage100027\409.msi

::***** Create Log that Asus ATKPackage 1.0.0027 was installed so it won't try reinstalling *****
:CREATELOG
ECHO Installed Asus ATKPackage 1.0.0027 on %date% at %time% > %systemroot%\XXXXX\AsusATKPackage100027.txt
goto INSTALLED

::***** Notification that Asus ATKPackage 1.0.0027 was already installed - Calls AsusATKPackage100027_already_installed.vbs *****
:ALREADYINSTALLED
pushd %~dp0
xcopy AsusATKPackage100027_already_installed.vbs %systemroot%\XXXXX\AsusATKPackage100027\
popd
cls
ECHO Asus ATKPackage 1.0.0027 was already installed!
%systemroot%\XXXXX\AsusATKPackage100027\AsusATKPackage100027_already_installed.vbs
goto CLEANUPANDEND

::***** Installation Complete - Calls AsusATKPackage100027_installation_complete.vbs*****
:INSTALLED
%systemroot%\XXXXX\AsusATKPackage100027\AsusATKPackage100027_installation_complete.vbs
goto CLEANUPANDEND

::***** Clean Up (Delete extracted installation files) and end script *****
:CLEANUPANDEND
cd..
RD %systemroot%\XXXXX\AsusATKPackage100027 /s /q & exit