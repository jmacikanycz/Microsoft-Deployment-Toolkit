@ECHO OFF

::***** Check if 7z938-x64 is already installed in %systemroot%\XXXXX *****
set 7z938-x64_CHECK=%systemroot%\XXXXX\7z938-x64.txt
if exist "%7z938-x64_CHECK%" goto ALREADYINSTALLED

::***** Copy files to local computer *****
pushd %~dp0
xcopy /e /y *.* %systemroot%\XXXXX\7z938-x64\
popd
cls
goto STARTINSTALL

::***** Install 7zip 9.38 x64 *****
:STARTINSTALL
ECHO Installing 7zip 9.38 x64. This box will close when installation is complete.
msiExec.exe /qn /i "%systemroot%\XXXXX\7z938-x64\7z938-x64.msi" ALLUSERS=1 REBOOT=ReallySuppress TRANSFORMS="%systemroot%\XXXXX\7z938-x64\assoc.mst"
goto CREATELOG

::***** Create Log that 7zip 9.38 x64 was installed so it won't try reinstalling *****
:CREATELOG
ECHO Installed 7zip 9.38 x64 on %date% at %time% > %systemroot%\XXXXX\7z938-x64.txt
goto INSTALLED

::***** Notification that 7zip 9.38 x64 was already installed - Calls 7z938-x64_already_installed.vbs *****
:ALREADYINSTALLED
pushd %~dp0
xcopy 7z938-x64_already_installed.vbs %systemroot%\XXXXX\7z938-x64\
popd
cls
ECHO 7zip 9.38 x64 was already installed!
%systemroot%\XXXXX\7z938-x64\7z938-x64_already_installed.vbs
goto CLEANUPANDEND

::***** Installation Complete - Calls 7z938-x64_installation_complete.vbs*****
:INSTALLED
%systemroot%\XXXXX\7z938-x64\7z938-x64_installation_complete.vbs
goto CLEANUPANDEND

::***** Clean Up (Delete copied installation files) and end script *****
:CLEANUPANDEND
cd..
RD %systemroot%\XXXXX\7z938-x64 /s /q & exit