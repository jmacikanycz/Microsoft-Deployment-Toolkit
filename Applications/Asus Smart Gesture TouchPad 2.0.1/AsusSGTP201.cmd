@ECHO OFF

::***** Check if AsusSGTP201.txt is already installed in %systemroot%\XXXXX *****
set ASUSSGTP201_CHECK=%systemroot%\XXXXX\AsusSGTP201.txt
if exist "%ASUSSGTP201_CHECK%" goto ALREADYINSTALLED

::***** Copy files to local computer *****
pushd %~dp0
xcopy *.* %systemroot%\XXXXX\AsusSGTP201\
popd
cls
goto STARTINSTALL

::***** Install Asus SmartGesture 2.0.1 *****
:STARTINSTALL
ECHO Installing Asus SmartGesture 2.0.1. This box will close when installation is complete.
set _ASUS_REG_PATH_="HKLM\SOFTWARE\ASUS\ASUS Smart Gesture"
reg ADD %_ASUS_REG_PATH_% /v SupportMS /t REG_DWORD /d 1 /f
MsiExec.exe /qn /norestart /i %systemroot%\XXXXX\AsusSGTP201\SetupTPDriver.msi

::***** Create Log that Asus SmartGesture 2.0.1 was installed so it won't try reinstalling *****
:CREATELOG
ECHO Installed Asus SmartGesture 2.0.1 on %date% at %time% > %systemroot%\XXXXX\AsusSGTP201.txt
goto INSTALLED

::***** Notification that Asus SmartGesture 2.0.1 was already installed - Calls AsusSGTP201_already_installed.vbs *****
:ALREADYINSTALLED
pushd %~dp0
xcopy AsusSGTP201_already_installed.vbs %systemroot%\XXXXX\AsusSGTP201\
popd
cls
ECHO Asus SmartGesture 2.0.1 was already installed!
%systemroot%\XXXXX\AsusSGTP201\AsusSGTP201_already_installed.vbs
goto CLEANUPANDEND

::***** Installation Complete - Calls AsusSGTP201_installation_complete.vbs*****
:INSTALLED
%systemroot%\XXXXX\AsusSGTP201\AsusSGTP201_installation_complete.vbs
goto CLEANUPANDEND

::***** Clean Up (Delete extracted installation files) and end script *****
:CLEANUPANDEND
cd..
RD %systemroot%\XXXXX\AsusSGTP201 /s /q & exit