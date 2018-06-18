@ECHO OFF

::***** Check if LenovoE450IMEI.txt is already installed in %systemroot%\XXXXX *****
set LenovoE450IMEI_CHECK=%systemroot%\XXXXX\LenovoE450IMEI.txt
if exist "%LenovoE450IMEI_CHECK%" goto ALREADYINSTALLED

::***** Copy files to local computer *****
pushd %~dp0
xcopy /e /y *.* %systemroot%\XXXXX\LenovoE450IMEI\
popd
cls
goto STARTINSTALL

::***** Install Lenovo E450 IMEI 10.0.30.1054 *****
:STARTINSTALL
ECHO Installing Lenovo E450 IMEI 10.0.30.1054. This box will close when installation is complete.
%systemroot%\XXXXX\LenovoE450IMEI\SetupME.exe -s
regedit /s %systemroot%\XXXXX\LenovoE450IMEI\AppAutoStartDefaultVal.reg

::***** Create Log that Lenovo E450 IMEI 10.0.30.1054 was installed so it won't try reinstalling *****
:CREATELOG
ECHO Installed Lenovo E450 IMEI 10.0.30.1054 on %date% at %time% > %systemroot%\XXXXX\LenovoE450IMEI.txt
goto INSTALLED

::***** Notification that Lenovo E450 IMEI 10.0.30.1054 was already installed - Calls LenovoE450IMEI_already_installed.vbs *****
:ALREADYINSTALLED
pushd %~dp0
xcopy LenovoE450IMEI_already_installed.vbs %systemroot%\XXXXX\LenovoE450IMEI\
popd
cls
ECHO Lenovo E450 IMEI 10.0.30.1054 was already installed!
%systemroot%\XXXXX\LenovoE450IMEI\LenovoE450IMEI_already_installed.vbs
goto CLEANUPANDEND

::***** Installation Complete - Calls LenovoE450IMEI_installation_complete.vbs*****
:INSTALLED
%systemroot%\XXXXX\LenovoE450IMEI\LenovoE450IMEI_installation_complete.vbs
goto CLEANUPANDEND

::***** Clean Up (Delete extracted installation files) and end script *****
:CLEANUPANDEND
cd..
RD %systemroot%\XXXXX\LenovoE450IMEI /s /q & exit