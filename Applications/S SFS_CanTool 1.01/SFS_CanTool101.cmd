@ECHO OFF

::***** Check if SFS_CanTool101.txt is already installed in %systemroot%\XXXXX *****
set SFS_CANTOOL101_CHECK=%systemroot%\XXXXX\SFS_CanTool101.txt
if exist "%SFS_CANTOOL101_CHECK%" goto ALREADYINSTALLED

::***** Copy files to local computer *****
pushd %~dp0
xcopy /e /y *.* %systemroot%\XXXXX\SFS_CanTool101\
popd
cls
goto STARTINSTALL

::***** Install SFS_CanTool 1.01 *****
:STARTINSTALL
ECHO Installing SFS_CanTool 1.01. This box will close when installation is complete.
MsiExec.exe /qn /i "%systemroot%\XXXXX\SFS_CanTool101\SFS_CanTool 1.01.MSI" ALLUSERS=1 REBOOT=ReallySuppress
xcopy /e /y "%systemroot%\XXXXX\SFS_CanTool101\SFS_CanTool.lnk" "C:\Users\Public\Desktop"  >nul 2>&1
goto CREATELOG

::***** Create Log that SFS_CanTool 1.01 was installed so it won't try reinstalling *****
:CREATELOG
ECHO Installed SFS_CanTool 1.01 on %date% at %time% > %systemroot%\XXXXX\SFS_CanTool101.txt
goto INSTALLED

::***** Notification that SFS_CanTool 1.01 was already installed - Calls SFS_CanTool101_already_installed.vbs *****
:ALREADYINSTALLED
pushd %~dp0
xcopy SFS_CanTool101_already_installed.vbs %systemroot%\XXXXX\SFS_CanTool101\
popd
cls
ECHO SFS_CanTool 1.01 was already installed!
%systemroot%\XXXXX\SFS_CanTool101\SFS_CanTool101_already_installed.vbs
goto CLEANUPANDEND

::***** Installation Complete - Calls SFS_CanTool101_installation_complete.vbs*****
:INSTALLED
%systemroot%\XXXXX\SFS_CanTool101\SFS_CanTool101_installation_complete.vbs
goto CLEANUPANDEND

::***** Clean Up (Delete copied installation files) and end script *****
:CLEANUPANDEND
cd..
RD %systemroot%\XXXXX\SFS_CanTool101 /s /q & exit