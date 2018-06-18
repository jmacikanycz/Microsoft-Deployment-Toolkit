@ECHO OFF

::***** Check if ABRActivation.txt is already installed in %systemroot%\XXXXX *****
set ABRActivation_CHECK=%systemroot%\XXXXX\ABRActivation.txt
if exist "%ABRActivation_CHECK%" goto ALREADYINSTALLED

::***** Copy files to local computer *****
pushd %~dp0
xcopy *.* %systemroot%\XXXXX\ABRActivation\
popd
cls
goto STARTINSTALL

::***** Install ABR Activation for HP EliteBook 840 G1 *****
:STARTINSTALL
ECHO Installing ABR Activation for HP EliteBook 840 G1. This box will close when installation is complete.
%systemroot%\XXXXX\ABRActivation\activation_restore.exe --silent
goto CREATELOG

::***** Create Log that ABR Activation for HP EliteBook 840 G1 was installed so it won't try reinstalling *****
:CREATELOG
ECHO Installed ABR Activation for HP EliteBook 840 G1 on %date% at %time% > %systemroot%\XXXXX\ABRActivation.txt
goto INSTALLED

::***** Notification that ABR Activation for HP EliteBook 840 G1 was already installed - Calls ABRActivation_already_installed.vbs *****
:ALREADYINSTALLED
pushd %~dp0
xcopy ABRActivation_already_installed.vbs %systemroot%\XXXXX\ABRActivation\
popd
cls
ECHO ABR Activation for HP EliteBook 840 G1 was already installed!
%systemroot%\XXXXX\ABRActivation\ABRActivation_already_installed.vbs
goto CLEANUPANDEND

::***** Installation Complete - Calls ABRActivation_installation_complete.vbs*****
:INSTALLED
%systemroot%\XXXXX\ABRActivation\ABRActivation_installation_complete.vbs
goto CLEANUPANDEND

::***** Clean Up (Delete copied installation files) and end script *****
:CLEANUPANDEND
cd..
RD %systemroot%\XXXXX\ABRActivation /s /q & exit