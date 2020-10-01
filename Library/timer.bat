@echo off
title Timer
set m=4
set s=50
cls
cmdmenusel f870 "5 minutes" "10 minutes"
if %errorlevel%==1 (goto 5) else (goto 10)
:g
cls
if %m% GEQ %ls% goto d
echo %m%;%s%
timeout 1 /NOBREAK>NUL
cls
set /a s=%s%+1
if %s% LSS 60 goto g
set /a m=%m%+1
set s=0
goto g
:5
set /a ls=5
goto g
:10
set /a ls=10
goto g
:d
cls
echo %ls%;0
powershell -c (New-Object Media.SoundPlayer "C:\Windows\Media\Alarm03.wav").PlaySync();
goto p
:p
pause >NUL
goto p

