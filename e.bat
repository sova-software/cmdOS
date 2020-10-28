@echo off
title cmdOS %1
cd .acc
if exist temp.txt (del temp.txt && goto l) else (goto l)
:l
color E
cls
echo Hello, %2!
echo.
cd..
:qn
echo Here are some programs you can use.
cmdmenusel E870 "Timer" "Calculator" "Command Line" "Text Editor" "About"
if %errorlevel%==1 goto t
if %errorlevel%==2 goto c
if %errorlevel%==3 goto m
if %errorlevel%==4 goto k
if %errorlevel%==5 goto wqw
:t
cd Library && timer.bat
exit
:c
cd Library && calculator.bat
exit
:m
cd Library && command.bat %1 %2 %3
exit
:k
cd Library && text.bat
exit
:wqw
cls
echo Version: %1
echo Command Line Version: %3
echo Username: %2
echo.
cmdmenusel E870 "Update" "Go back"
if %errorlevel% == 1 (start update.bat %1 && exit) else (cls && echo Hello, %2! && echo. && goto qn)
