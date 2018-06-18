@ECHO OFF

::***** Copy files to local computer *****
pushd %~dp0
xcopy MapMyDrives.cmd %systemroot%\XXXXX\MapMyDrives\
xcopy MapMyDrive.lnk C:\Users\Public\Desktop
popd
cls

::***** Create Log that MapMyDrives was copied so it won't try re-copying *****
ECHO Copied MyMapDrives on %date% at %time% > %systemroot%\XXXXX\MapMyDrives.txt