@echo off
title Calculator
:s
Echo Write an equation to get the product below: (+ - * \)
set /p e= 
set /a a=%e%
echo %a%
echo.
goto s
