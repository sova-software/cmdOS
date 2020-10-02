@echo off
title cmdOS 3
cd .acc
if exist temp.txt (del temp.txt && goto l) else (goto l)
:l
color E
cls
echo Hello, %1!
echo.
:qn
cd..
echo Here are some programs you can use.
cmdmenusel E870 "Timer" "Calculator" "Command Line"
if %errorlevel%==1 goto t
if %errorlevel%==2 goto c
if %errorlevel%==3 goto m
:t
start Library\timer.bat
exit
:c
start Library\calculator.bat
exit
:m
start Library\command.bat %1
exit
