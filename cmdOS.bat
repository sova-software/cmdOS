@echo off
set version=5
set termversion=2
title cmdOS %version%
:start
cls
cmdmenusel f870 "Register" "Login as User" "Login as Guest"
if %errorlevel%==1 goto Register
if %errorlevel%==2 goto Login
if %errorlevel%==3 start GuestMode.bat
timeout /t 1 /NOBREAK>NUL
Exit
:Login
cls
cd .acc
cls
set /p name=Username: 
if NOT exist %name%.acc goto error
FOR /F "tokens=*" %%a in ('type %name%.acc') do SET Correct=%%a
cd..
if "%Correct%"=="" (goto system) else (goto zaz)
:zaz
set /p writpass=Password: 
cd .acc
EncryptFile.exe unlock %writpass% %name%.acc temp.txt
if %errorlevel%==0 (cd.. & goto ag) else (goto qns)
:qns
echo Wrong Password!
timeout /t 3 /NOBREAK>NUL
cd..
goto start
:error 
cd..
set err=USER_DOES_NOT_EXIST
goto bsod
:Register
cls
if exist .acc (goto hop) 
mkdir .acc
attrib +h .acc
:hop
cd .acc
set /p name=Username: 
if exist %name%.acc (set err=USER_ALREADY_EXISTS && goto bsod)
cls
type NUL > %name%.acc
echo Do you want to set a password?
cd..
cmdmenusel f870 "Yes" "No"
if %errorlevel%==1 (goto NP) else (goto skippass)
set pass="*G*"
goto skip1
:NP
cls
set /p pass=Set password: 
goto skip1
:skip1
cls
cd .acc
echo|set /p="success" > encrypt.txt
EncryptFile.exe lock %pass% encrypt.txt %name%.acc
del encrypt.txt
goto ag
:skippass
cls
cd .acc
type NUL > %name%.acc
cd..
goto ag
:ag
start e.bat %version% %name% %termver%
exit
:bsod
cls
color 1f
echo OPERATION FAILED
echo ERROR CODE: %err%
pause >NUL
goto start
:system
start e.bat %version% %name% %termversion%
