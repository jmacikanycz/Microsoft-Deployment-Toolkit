@ECHO OFF

::***** Check if Suzmon102.txt is already installed in %systemroot%\XXXXX *****
set SUZMON102_CHECK=%systemroot%\XXXXX\Suzmon102.txt
if exist "%SUZMON102_CHECK%" goto ALREADYINSTALLED

::***** Copy files to local computer *****
pushd %~dp0
xcopy /e /y *.* %systemroot%\XXXXX\Suzmon102\
popd
cls
goto STARTINSTALL

::***** Install Suzmon 1.02 *****
:STARTINSTALL
ECHO Installing Suzmon 1.02. This box will close when installation is complete.
MsiExec.exe /qn /i "%systemroot%\XXXXX\Suzmon102\Suzmon102.msi" ALLUSERS=1 REBOOT=ReallySuppress
goto CREATELOG

::***** Create Log that Suzmon 1.02 was installed so it won't try reinstalling *****
:CREATELOG
ECHO Installed Suzmon 1.02 on %date% at %time% > %systemroot%\XXXXX\Suzmon102.txt
goto INSTALLED

::***** Notification that Suzmon 1.02 was already installed - Calls Suzmon102_already_installed.vbs *****
:ALREADYINSTALLED
pushd %~dp0
xcopy Suzmon102_already_installed.vbs %systemroot%\XXXXX\Suzmon102\
popd
cls
ECHO Suzmon 1.02 was already installed!
%systemroot%\XXXXX\Suzmon102\Suzmon102_already_installed.vbs
goto CLEANUPANDEND

::***** Installation Complete - Calls Suzmon102_installation_complete.vbs*****
:INSTALLED
%systemroot%\XXXXX\Suzmon102\Suzmon102_installation_complete.vbs
goto CLEANUPANDEND

::***** Clean Up (Delete copied installation files) and end script *****
:CLEANUPANDEND
cd..
RD %systemroot%\XXXXX\Suzmon102 /s /q & exit