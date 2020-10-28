@echo off
cls
color 0a
ver
goto start
:start
set "cmd="
echo.
set /p cmd="sova-console>"
if %cmd%==ver goto ver
if %cmd%==exit exit
if %cmd%==write goto write
if %cmd%==help goto helpcheck
if %cmd%==time goto time
if %cmd%==date goto date
if %cmd%==os goto SwitchToCmdOS
if %cmd%==name goto name
if %cmd%==update goto up
:a
echo "%cmd%" is not a valid command. Type help for a list of commands.
goto start
:HELPCHECK
if "%2"=="" (goto help1) else (goto help2)
:name
echo.
if "%2"=="" goto a
echo Your name is %2.
goto start
:help2
echo.
echo ver - Current version of Sova Command Line
echo write - Print to console
echo help - View all avalable commands
echo time - Current time
echo date - Current date
echo name - Write your name
echo exit - Quit the program.
goto start
:ver
echo.
echo Sova Command Line version: %3
goto start
:write
echo.
set /p str="What to write? "
echo.
echo %str%
goto start
:help1
echo.
echo ver - Current version of Sova Command Line
echo write - Print to console
echo help - View all avalable commands
echo time - Current time
echo date - Current date
echo exit - Quit the program.
goto start
:time
echo.
time /t
goto start
:date
echo.
date /t
goto start
:SwitchToCmdOS
cd..
start e.bat %1 %2 %3
exit
:up
cd..
start update.bat %1
exit
