@ECHO OFF

::***** Check if ESETRAAgent.txt is already installed in %systemroot%\XXXXX *****
set ESETRAAgent_CHECK=%systemroot%\XXXXX\ESETRAAgent.txt
if exist "%ESETRAAgent_CHECK%" goto ALREADYINSTALLED

::***** Copy files to local computer *****
pushd %~dp0
xcopy /e /y *.* %systemroot%\XXXXX\ESETRAAgent\
popd
cls
goto STARTINSTALL

::***** Install ESET Remote Administrator Agent *****
:STARTINSTALL
ECHO Installing ESET Remote Administrator Agent. This box will close when installation is complete.
start "ESET Remote Administrator Agent" /wait cmd /c %systemroot%\XXXXX\ESETRAAgent\SSSSS_EraAgentOnlineInstaller.bat

::***** Checks to see if ESET Remote Administrator Agent is running *****
:ERAAGENT_CHECK
tasklist /FI "IMAGENAME eq ERAAgent.exe" 2>NUL | find /I /N "ERAAgent.exe">NUL
if %ERRORLEVEL%==1 goto NOAGENT
if %ERRORLEVEL%==0 goto CREATELOG
:NOAGENT
ping localhost -n 3 >nul
goto ERAAGENT_CHECK

::***** Create Log that ESET Remote Administrator Agent was installed so it won't try reinstalling *****
:CREATELOG
ping localhost -n 20 >nul
ECHO Installed ESET Remote Administrator Agent on %date% at %time% > %systemroot%\XXXXX\ESETRAAgent.txt
goto INSTALLED

::***** Notification that ESET Remote Administrator Agent was already installed - Calls ESETRAAgent_already_installed.vbs *****
:ALREADYINSTALLED
pushd %~dp0
xcopy ESETRAAgent_already_installed.vbs %systemroot%\XXXXX\ESETRAAgent\
popd
cls
ECHO ESET Remote Administrator Agent was already installed!
%systemroot%\XXXXX\ESETRAAgent\ESETRAAgent_already_installed.vbs
goto CLEANUPANDEND

::***** Installation Complete - Calls ESETRAAgent_installation_complete.vbs*****
:INSTALLED
%systemroot%\XXXXX\ESETRAAgent\ESETRAAgent_installation_complete.vbs
goto CLEANUPANDEND

::***** Clean Up (Delete copied installation files) and end script *****
:CLEANUPANDEND
cd..
RD %systemroot%\XXXXX\ESETRAAgent /s /q & exit

:EXIT