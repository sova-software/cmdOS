@echo off
:a
title cmdOS 1 (Guest)
color 0e
echo Hello, Guest!
echo.
echo Here are some programs you can use.
cmdmenusel e870 "Timer" "Calculator" 
if %errorlevel%==1 cd guest && start timer.bat
if %errorlevel%==2 cd guest && start calculator.bat
cd..
goto a
                                                                                                                                                                                                                                                                                                                                                                    










































