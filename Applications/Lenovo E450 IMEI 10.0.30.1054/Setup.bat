@ECHO OFF

ECHO.
ECHO Installing Intel(R) ME 10.0 Software. Please wait...
ECHO.

CALL SetupME.exe -s

regedit /s AppAutoStartDefaultVal.reg

ECHO Installation completed.
ECHO.

:END