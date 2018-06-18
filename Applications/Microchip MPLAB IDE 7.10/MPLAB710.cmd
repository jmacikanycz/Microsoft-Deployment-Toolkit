@ECHO OFF

::***** Check if MPLAB710 is already installed in %systemroot%\XXXXX *****
set MPLAB710_CHECK=%systemroot%\XXXXX\MPLAB710.txt
if exist "%MPLAB710_CHECK%" goto ALREADYINSTALLED

::***** Copy files to local computer *****
pushd %~dp0
cls
ECHO Copying MBLAB 7.10 files. This box will close when installation begins.
xcopy /e /q *.* %systemroot%\XXXXX\MPLAB710\
popd
cls
goto STARTINSTALL

::***** Install MPLAB 7.10 *****
:STARTINSTALL
ECHO Installing MPLAB 7.10. This box will close when installation is complete.
msiexec.exe /i %systemroot%\XXXXX\MPLAB710\ISScript10.Msi /qn
msiexec.exe /i %systemroot%\XXXXX\MPLAB710\MPLABToolsv7.10.msi ISSETUPDRIVEN=1 /qn  ALLUSERS=1 REBOOT=ReallySuppress
goto CREATELOG

::***** Create Log that MPLAB 7.10 was installed so it won't try reinstalling *****
:CREATELOG
ECHO Installed MPLAB 7.10 on %date% at %time% > %systemroot%\XXXXX\MPLAB710.txt
goto INSTALLED

::***** Notification that MPLAB 7.10 was already installed - Calls MPLAB710_already_installed.vbs *****
:ALREADYINSTALLED
pushd %~dp0
xcopy MPLAB710_already_installed.vbs %systemroot%\XXXXX\MPLAB710\
popd
cls
ECHO MPLAB 7.10 was already installed!
%systemroot%\XXXXX\MPLAB710\MPLAB710_already_installed.vbs
goto CLEANUPANDEND

::***** Installation Complete - Calls MPLAB710_installation_complete.vbs *****
:INSTALLED
%systemroot%\XXXXX\MPLAB710\MPLAB710_installation_complete.vbs
goto CLEANUPANDEND

::***** Clean Up (Delete extracted installation files) and end script *****
:CLEANUPANDEND
cd..
RD %systemroot%\XXXXX\MPLAB710 /s /q & exit