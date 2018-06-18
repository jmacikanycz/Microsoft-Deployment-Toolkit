@ECHO OFF

::***** Check if MManager311 is already installed in %systemroot%\XXXXX *****
set MMANAGER311_CHECK=%systemroot%\XXXXX\MMANAGER311.txt
if exist "%MMANAGER311_CHECK%" goto ALREADYINSTALLED

::***** Copy files to local computer *****
pushd %~dp0
cls
ECHO Copying MManager 3.11 files. This box will close when installation begins.
xcopy /e /q *.* %systemroot%\XXXXX\MManager311\
popd
cls
goto STARTINSTALL

::***** Install MManager 3.11 *****
:STARTINSTALL
ECHO Installing MManager 3.11. This box will close when installation is complete.
MsiExec.exe /qn /i %systemroot%\XXXXX\MManager311\ISScript8.Msi
MsiExec.exe /qn /i %systemroot%\XXXXX\MManager311\data1.msi ALLUSERS=1
rd /s /q "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Bachmann\M1 Software\Dokumentation (deutsch)" >nul 2>&1
del /q "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Bachmann\M1 Software\M-PLC V2.04.lnk" >nul 2>&1
del /q "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Bachmann\M1 Software\M-PLC V3.20.lnk" >nul 2>&1
copy /y "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Bachmann\M1 Software\M-Manager.lnk" "C:\Users\Public\Desktop\" >nul 2>&1
copy /y "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Bachmann\M1 Software\M-Scope.lnk" "C:\Users\Public\Desktop\" >nul 2>&1
copy /y "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Bachmann\M1 Software\TargetManager.lnk" "C:\Users\Public\Desktop\" >nul 2>&1
goto CREATELOG

::***** Create Log that MManager 3.11 was installed so it won't try reinstalling *****
:CREATELOG
ECHO Installed MManager 3.11 on %date% at %time% > %systemroot%\XXXXX\MManager311.txt
goto INSTALLED

::***** Notification that MManager 3.11 was already installed - Calls MManager311_already_installed.vbs *****
:ALREADYINSTALLED
pushd %~dp0
xcopy MManager311_already_installed.vbs %systemroot%\XXXXX\MManager311\
popd
cls
ECHO MManager 3.11 was already installed!
%systemroot%\XXXXX\MManager311\MManager311_already_installed.vbs
goto CLEANUPANDEND

::***** Installation Complete - Calls MManager311_installation_complete.vbs *****
:INSTALLED
%systemroot%\XXXXX\MManager311\MManager311_installation_complete.vbs
goto CLEANUPANDEND

::***** Clean Up (Delete extracted installation files) and end script *****
:CLEANUPANDEND
cd..
RD %systemroot%\XXXXX\MManager311 /s /q & exit