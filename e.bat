@echo off
title cmdOS 4
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
cmdmenusel E870 "Timer" "Calculator" "Command Line" "Text editor"
if %errorlevel%==1 goto t
if %errorlevel%==2 goto c
if %errorlevel%==3 goto m
if %errorlevel%==4 goto k
:t
start Library\timer.bat
exit
:c
start Library\calculator.bat
exit
:m
start Library\command.bat %1
exit
:k
start Library/Text editor
exit
