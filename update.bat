@echo off
echo Loading version data...
set /a nextVER=%1+1 >NUL
set url=https://github.com/sova-software/cmdOS/archive/v%nextVER%.0.zip
echo Setting variables...
set dir="%cd%"
cd..
if exist "v%nextVER%.0.zip" (goto have) else (goto update)
:update
%dir%\wget.exe -N --tries=1 --timeout=5 %url%
if exist "v%nextVER%.0.zip" (goto a) else (goto b)
:a
echo Latest version downloaded in parent directory (%cd%)
del %dir%\.wget-hsts
cd /d %dir%
pause >NUL
:b
echo No new version found
echo Are you connected to the internet?
del %dir%\.wget-hsts
cd /d %dir%
pause >NUL
:have
echo You already have the latest cmdOS downloaded.
del %dir%\.wget-hsts
cd /d %dir%
pauce >NUL
