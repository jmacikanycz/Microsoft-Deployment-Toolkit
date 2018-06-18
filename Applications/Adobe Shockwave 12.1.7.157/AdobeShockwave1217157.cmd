@ECHO OFF

::***** Check if AdobeShockwave1217157.txt is already installed in %systemroot%\XXXXX *****
set AdobeShockwave1217157_CHECK=%systemroot%\XXXXX\AdobeShockwave1217157.txt
if exist "%AdobeShockwave1217157_CHECK%" goto ALREADYINSTALLED

::***** Copy files to local computer *****
pushd %~dp0
xcopy /e /y *.* %systemroot%\XXXXX\AdobeShockwave1217157\
popd
cls
goto STARTINSTALL

::***** Install Adobe Shockwave 12.1.7.157 *****
:STARTINSTALL
ECHO Installing Adobe Shockwave 12.1.7.157. This box will close when installation is complete.
msiExec.exe /qn /i "%systemroot%\XXXXX\AdobeShockwave1217157\sw_lic_full_installer_1217157.msi" ALLUSERS=1 REBOOT=ReallySuppress
goto CREATELOG

::***** Create Log that Adobe Shockwave 12.1.7.157 was installed so it won't try reinstalling *****
:CREATELOG
ECHO Installed Adobe Shockwave 12.1.7.157 on %date% at %time% > %systemroot%\XXXXX\AdobeShockwave1217157.txt
goto INSTALLED

::***** Notification that Adobe Shockwave 12.1.7.157 was already installed - Calls AdobeShockwave1217157_already_installed.vbs *****
:ALREADYINSTALLED
pushd %~dp0
xcopy AdobeShockwave1217157_already_installed.vbs %systemroot%\XXXXX\AdobeShockwave1217157\
popd
cls
ECHO Adobe Shockwave 12.1.7.157 was already installed!
%systemroot%\XXXXX\AdobeShockwave1217157\AdobeShockwave1217157_already_installed.vbs
goto CLEANUPANDEND

::***** Installation Complete - Calls AdobeShockwave1217157_installation_complete.vbs*****
:INSTALLED
%systemroot%\XXXXX\AdobeShockwave1217157\AdobeShockwave1217157_installation_complete.vbs
goto CLEANUPANDEND

::***** Clean Up (Delete copied installation files) and end script *****
:CLEANUPANDEND
cd..
RD %systemroot%\XXXXX\AdobeShockwave1217157 /s /q & exit