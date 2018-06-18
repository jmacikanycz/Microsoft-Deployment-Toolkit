@ECHO OFF

::***** Check if LTiDriveManager360 is already installed in %systemroot%\XXXXX *****
set LTIDRIVEMANAGER360_CHECK=%systemroot%\XXXXX\LTiDriveManager360.txt
if exist "%LTIDRIVEMANAGER360_CHECK%" goto ALREADYINSTALLED

::***** Copy files to local computer *****
pushd %~dp0
cls
ECHO Copying LTi Drive Manager 3.60 files. This box will close when installation begins.
xcopy /e /q *.* %systemroot%\XXXXX\LTiDriveManager360\
popd
cls
goto STARTINSTALL

::***** Install LTi Drive Manager 3.60 *****
:STARTINSTALL
ECHO Installing LTi Drive Manager 3.60. This box will close when installation is complete.
%systemroot%\XXXXX\LTiDriveManager360\DriveManager\V3_x\Setup.exe /s
%systemroot%\XXXXX\LTiDriveManager360\MotorData\CDE3000\Setup.exe /s
%systemroot%\XXXXX\LTiDriveManager360\MotorData\CDD3000\Setup.exe /s
goto CREATELOG

::***** Create Log that LTi Drive Manager 3.60 was installed so it won't try reinstalling *****
:CREATELOG
ECHO Installed LTi Drive Manager 3.60 on %date% at %time% > %systemroot%\XXXXX\LTiDriveManager360.txt
goto INSTALLED

::***** Notification that LTi Drive Manager 3.60 was already installed - Calls LTiDriveManager360_already_installed.vbs *****
:ALREADYINSTALLED
pushd %~dp0
xcopy AdobeReader11007_already_installed.vbs %systemroot%\XXXXX\AdobeReader11007\
popd
cls
ECHO LTi Drive Manager 3.60 was already installed!
%systemroot%\XXXXX\LTiDriveManager360\LTiDriveManager360_already_installed.vbs
goto CLEANUPANDEND

::***** Installation Complete - Calls LTiDriveManager360_installation_complete.vbs*****
:INSTALLED
%systemroot%\XXXXX\LTiDriveManager360\LTiDriveManager360_installation_complete.vbs
goto CLEANUPANDEND

::***** Clean Up (Delete extracted installation files) and end script *****
:CLEANUPANDEND
cd..
RD %systemroot%\XXXXX\LTiDriveManager360 /s /q & exit