@ECHO OFF

::***** Check if LenovoE450Fingerprint.txt is already installed in %systemroot%\XXXXX *****
set LenovoE450Fingerprint_CHECK=%systemroot%\XXXXX\LenovoE450Fingerprint.txt
if exist "%LenovoE450Fingerprint_CHECK%" goto ALREADYINSTALLED

::***** Copy files to local computer *****
pushd %~dp0
xcopy /e /y *.* %systemroot%\XXXXX\LenovoE450Fingerprint\
popd
cls
goto STARTINSTALL

::***** Install Lenovo E450 Fingerprint 4.5.289.0 *****
:STARTINSTALL
ECHO Installing Lenovo E450 Fingerprint 4.5.289.0. This box will close when installation is complete.
%systemroot%\XXXXX\LenovoE450Fingerprint\WBF_Synaptics_FMA_CMN_Setup_L.exe /s
del "C:\Users\Public\Desktop\Lenovo Fingerprint Manager.lnk"

::***** Create Log that Lenovo E450 Fingerprint 4.5.289.0 was installed so it won't try reinstalling *****
:CREATELOG
ECHO Installed Lenovo E450 Fingerprint 4.5.289.0 on %date% at %time% > %systemroot%\XXXXX\LenovoE450Fingerprint.txt
goto INSTALLED

::***** Notification that Lenovo E450 Fingerprint 4.5.289.0 was already installed - Calls LenovoE450Fingerprint_already_installed.vbs *****
:ALREADYINSTALLED
pushd %~dp0
xcopy LenovoE450Fingerprint_already_installed.vbs %systemroot%\XXXXX\LenovoE450Fingerprint\
popd
cls
ECHO Lenovo E450 Fingerprint 4.5.289.0 was already installed!
%systemroot%\XXXXX\LenovoE450Fingerprint\LenovoE450Fingerprint_already_installed.vbs
goto CLEANUPANDEND

::***** Installation Complete - Calls LenovoE450Fingerprint_installation_complete.vbs*****
:INSTALLED
%systemroot%\XXXXX\LenovoE450Fingerprint\LenovoE450Fingerprint_installation_complete.vbs
goto CLEANUPANDEND

::***** Clean Up (Delete extracted installation files) and end script *****
:CLEANUPANDEND
cd..
RD %systemroot%\XXXXX\LenovoE450Fingerprint /s /q & exit