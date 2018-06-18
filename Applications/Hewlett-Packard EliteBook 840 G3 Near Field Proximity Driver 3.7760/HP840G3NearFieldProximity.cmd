@ECHO OFF

::***** Check if HP840G3NearFieldProximity.txt is already installed in %systemroot%\XXXXX *****
set HP840G3NearFieldProximity_CHECK=%systemroot%\XXXXX\HP840G3NearFieldProximity.txt
if exist "%HP840G3NearFieldProximity_CHECK%" goto ALREADYINSTALLED

::***** Copy files to local computer *****
pushd %~dp0
xcopy /e /q *.* %systemroot%\XXXXX\HP840G3NearFieldProximity\
popd
cls
goto STARTINSTALL

::***** Install HP EliteBook 840 G3 Near Field Proximity 3.7760 *****
:STARTINSTALL
ECHO Installing HP EliteBook 840 G3 Near Field Proximity 3.7760 driver. This box will close when installation is complete.
%systemroot%\XXXXX\HP840G3NearFieldProximity\setup.exe /SD /ACCEPTLICENSE

::***** Create Log that HP EliteBook 840 G3 Near Field Proximity 3.7760 was installed so it won't try reinstalling *****
:CREATELOG
ECHO Installed HP EliteBook 840 G3 Near Field Proximity 3.7760 on %date% at %time% > %systemroot%\XXXXX\HP840G3NearFieldProximity.txt
goto INSTALLED

::***** Notification that HP EliteBook 840 G3 Near Field Proximity 3.7760 was already installed - Calls HP840G3NearFieldProximity_already_installed.vbs *****
:ALREADYINSTALLED
pushd %~dp0
xcopy HP840G3NearFieldProximity_already_installed.vbs %systemroot%\XXXXX\HP840G3NearFieldProximity\
popd
cls
ECHO HP EliteBook 840 G3 Near Field Proximity 3.7760 was already installed!
%systemroot%\XXXXX\HP840G3NearFieldProximity\HP840G3NearFieldProximity_already_installed.vbs
goto CLEANUPANDEND

::***** Installation Complete - Calls HP840G3NearFieldProximity_installation_complete.vbs*****
:INSTALLED
%systemroot%\XXXXX\HP840G3NearFieldProximity\HP840G3NearFieldProximity_installation_complete.vbs
goto CLEANUPANDEND

::***** Clean Up (Delete extracted installation files) and end script *****
:CLEANUPANDEND
cd..
RD %systemroot%\XXXXX\HP840G3NearFieldProximity /s /q & exit