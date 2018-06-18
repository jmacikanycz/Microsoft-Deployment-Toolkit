@ECHO OFF

::***** Check if GoogleChrome42 is already installed in %systemroot%\XXXXX *****
set GoogleChrome42_CHECK=%systemroot%\XXXXX\GoogleChrome42.txt
if exist "%GoogleChrome42_CHECK%" goto ALREADYINSTALLED

::***** Copy files to local computer *****
pushd %~dp0
cls
ECHO Copying Google Chrome 42 files. This box will close when installation begins.
xcopy /e /q *.* %systemroot%\XXXXX\GoogleChrome42\
popd
cls
goto STARTINSTALL

::***** Install Google Chrome 42 *****
:STARTINSTALL
ECHO Installing Google Chrome 42. This box will close when installation is complete.
msiexec.exe /qn /i %systemroot%\XXXXX\GoogleChrome42\GoogleChromeStandaloneEnterprise.msi
goto CREATELOG

::***** Create Log that Google Chrome 42 was installed so it won't try reinstalling *****
:CREATELOG
ECHO Installed Google Chrome 42 on %date% at %time% > %systemroot%\XXXXX\GoogleChrome42.txt
goto INSTALLED

::***** Notification that Google Chrome 42 was already installed - Calls GoogleChrome42_already_installed.vbs *****
:ALREADYINSTALLED
pushd %~dp0
xcopy GoogleChrome42_already_installed.vbs %systemroot%\XXXXX\GoogleChrome42\
popd
cls
ECHO Google Chrome 42 was already installed!
%systemroot%\XXXXX\GoogleChrome42\GoogleChrome42_already_installed.vbs
goto CLEANUPANDEND

::***** Installation Complete - Calls GoogleChrome42_installation_complete.vbs*****
:INSTALLED
%systemroot%\XXXXX\GoogleChrome42\GoogleChrome42_installation_complete.vbs
goto CLEANUPANDEND

::***** Clean Up (Delete extracted installation files) and end script *****
:CLEANUPANDEND
cd..
RD %systemroot%\XXXXX\GoogleChrome42 /s /q & exit