@ECHO OFF

::***** Check if AdobeReader11017.txt is already installed in %systemroot%\XXXXX *****
set AdobeReader11017_CHECK=%systemroot%\XXXXX\AdobeReader11017.txt
if exist "%AdobeReader11017_CHECK%" goto ALREADYINSTALLED

::***** Copy files to local computer *****
pushd %~dp0
xcopy *.* %systemroot%\XXXXX\AdobeReader11017\
popd
cls
goto STARTINSTALL

::***** Install Adobe Reader 11.0.17 *****
:STARTINSTALL
ECHO Installing Adobe Reader 11.0.17. This box will close when installation is complete.
%systemroot%\XXXXX\AdobeReader11017\AdbeRdr11010_en_US.exe /sALL /rs /l /msi EULA_ACCEPT=YES DISABLE_ARM_SERVICE_INSTALL=1 DISABLEDESKTOPSHORTCUT=1 SUPPRESS_APP_LAUNCH=YES ALLUSERS=1
%Comspec% /c msiexec.exe /p %systemroot%\XXXXX\AdobeReader11017\AdbeRdrUpd11017.msp ALLUSERS=1 REBOOT=ReallySuppress /q
goto CREATELOG

::***** Create Log that Adobe Reader 11.0.17 was installed so it won't try reinstalling *****
:CREATELOG
ECHO Installed Adobe Reader 11.0.17 on %date% at %time% > %systemroot%\XXXXX\AdobeReader11017.txt
goto INSTALLED

::***** Notification that Adobe Reader 11.0.17 was already installed - Calls AdobeReader11017_already_installed.vbs *****
:ALREADYINSTALLED
pushd %~dp0
xcopy AdobeReader11017_already_installed.vbs %systemroot%\XXXXX\AdobeReader11017\
popd
cls
ECHO Adobe Reader 11.0.17 was already installed!
%systemroot%\XXXXX\AdobeReader11017\AdobeReader11017_already_installed.vbs
goto CLEANUPANDEND

::***** Installation Complete - Calls AdobeReader11017_installation_complete.vbs*****
:INSTALLED
%systemroot%\XXXXX\AdobeReader11017\AdobeReader11017_installation_complete.vbs
goto CLEANUPANDEND

::***** Clean Up (Delete copied installation files) and end script *****
:CLEANUPANDEND
cd..
RD %systemroot%\XXXXX\AdobeReader11017 /s /q & exit