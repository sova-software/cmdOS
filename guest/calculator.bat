@echo off
title Calculator
:s
Echo Write an equation to get the product below: (+ - * \)
set /p e= 
set /a a=%e%
echo %a%
pause >NUL
cls
goto s