@echo off
cd..
cd Files
echo Text editor
echo What should the text file's name be?
set /p name= 
echo Great, let's start editing!
echo Write something and it will be written to the file.
echo.
:a
set /p content= 
echo %content% >> %name%.txt
goto a
