@ECHO OFF

::***** Copy files to local computer *****
pushd %~dp0
xcopy *.* %systemroot%\XXXXX\SSSSSUSwifi\
popd
cls

::***** Install SSSSSUS Wireless Profile *****
ECHO Installing SSSSSUS Wireless Profile. This box will close when installation is complete.
netsh wlan add profile filename=%systemroot%\XXXXX\SSSSSUSwifi\SSSSSUS.xml

::***** Create Log that SSSSSUS Wireless Profile was installed so it won't try reinstalling *****
ECHO Installed SSSSSUS Wireless Profile on %date% at %time% > %systemroot%\XXXXX\SSSSSUSwifi.txt

::***** Clean Up (Delete copied installation files) and end script *****
cd..
RD %systemroot%\XXXXX\SSSSSUSwifi /s /q & exit