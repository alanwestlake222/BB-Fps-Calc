@echo off
SET THEFILE=C:\Users\alanw\Documents\Lazarus files\FPScalc\FPScalc.exe
echo Linking %THEFILE%
C:\lazarus\fpc\3.2.2\bin\x86_64-win64\ld.exe -b pei-x86-64  --gc-sections   --subsystem windows --entry=_WinMainCRTStartup    -o "C:\Users\alanw\Documents\Lazarus files\FPScalc\FPScalc.exe" "C:\Users\alanw\Documents\Lazarus files\FPScalc\link19988.res"
if errorlevel 1 goto linkend
goto end
:asmend
echo An error occurred while assembling %THEFILE%
goto end
:linkend
echo An error occurred while linking %THEFILE%
:end
