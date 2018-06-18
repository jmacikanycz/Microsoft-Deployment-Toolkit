@ECHO OFF

::***** Check if AdobeFlash1700169.txt is already installed in %systemroot%\XXXXX *****
set AdobeFlash1700169_CHECK=%systemroot%\XXXXX\AdobeFlash1700169.txt
if exist "%AdobeFlash1700169_CHECK%" goto ALREADYINSTALLED

::***** Copy files to local computer *****
pushd %~dp0
xcopy /e /y *.* %systemroot%\XXXXX\AdobeFlash1700169\
popd
cls
goto STARTINSTALL

::***** Install Adobe Flash 17.0.0.169 *****
:STARTINSTALL
ECHO Installing Adobe Flash 17.0.0.169. This box will close when installation is complete.
msiExec.exe /qn /i "%systemroot%\XXXXX\AdobeFlash1700169\install_flash_player_17_active_x.msi" ALLUSERS=1 REBOOT=ReallySuppress
goto CREATELOG

::***** Create Log that Adobe Flash 17.0.0.169 was installed so it won't try reinstalling *****
:CREATELOG
ECHO Installed Adobe Flash 17.0.0.169 on %date% at %time% > %systemroot%\XXXXX\AdobeFlash1700169.txt
goto INSTALLED

::***** Notification that Adobe Flash 17.0.0.169 was already installed - Calls AdobeFlash1700169_already_installed.vbs *****
:ALREADYINSTALLED
pushd %~dp0
xcopy AdobeFlash1700169_already_installed.vbs %systemroot%\XXXXX\AdobeFlash1700169\
popd
cls
ECHO Adobe Flash 17.0.0.169 was already installed!
%systemroot%\XXXXX\AdobeFlash1700169\AdobeFlash1700169_already_installed.vbs
goto CLEANUPANDEND

::***** Installation Complete - Calls AdobeFlash1700169_installation_complete.vbs*****
:INSTALLED
%systemroot%\XXXXX\AdobeFlash1700169\AdobeFlash1700169_installation_complete.vbs
goto CLEANUPANDEND

::***** Clean Up (Delete copied installation files) and end script *****
:CLEANUPANDEND
cd..
RD %systemroot%\XXXXX\AdobeFlash1700169 /s /q & exit