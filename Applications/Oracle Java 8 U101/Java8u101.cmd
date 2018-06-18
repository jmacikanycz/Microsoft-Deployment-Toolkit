@ECHO OFF

::***** Check if Java8U101.txt is already installed in %systemroot%\XXXXX *****
set Java8U101_CHECK=%systemroot%\XXXXX\Java8U101.txt
if exist "%Java8U101_CHECK%" goto ALREADYINSTALLED

::***** Copy files to local computer *****
pushd %~dp0
xcopy *.* %systemroot%\XXXXX\Java8U101\
popd
cls
goto STARTINSTALL

::***** Install Java 8 U101 *****
:STARTINSTALL
ECHO Installing Java 8 U101. This box will close when installation is complete.
%systemroot%\XXXXX\Java8U101\jre-8u101-windows-i586.exe /s SPONSORS=0 WEB_JAVA=1 AUTO_UPDATE=0
goto CREATELOG

::***** Create Log that Java 8 U101 was installed so it won't try reinstalling *****
:CREATELOG
ECHO Installed Java 8 U101 on %date% at %time% > %systemroot%\XXXXX\Java8U101.txt
goto INSTALLED

::***** Notification that Java 8 U101 was already installed - Calls Java8U101_already_installed.vbs *****
:ALREADYINSTALLED
pushd %~dp0
xcopy Java8U101_already_installed.vbs %systemroot%\XXXXX\Java8U101\
popd
cls
ECHO Java 8 U101 was already installed!
%systemroot%\XXXXX\Java8U101\Java8U101_already_installed.vbs
goto CLEANUPANDEND

::***** Installation Complete - Calls Java8U101_installation_complete.vbs*****
:INSTALLED
%systemroot%\XXXXX\Java8U101\Java8U101_installation_complete.vbs
goto CLEANUPANDEND

::***** Clean Up (Delete copied installation files) and end script *****
:CLEANUPANDEND
cd..
RD %systemroot%\XXXXX\Java8U101 /s /q & exit