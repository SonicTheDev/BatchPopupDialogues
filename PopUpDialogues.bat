@echo off
title BATCH SCRIPT EXAMPLE

:start
Call :YesNoBox "This is the first dialogue message." "FIRST DIALOGUE MESSAGE"
if "%YesNo%"=="7" (
Call :MessageBox "You clicked no. I close." "FIRST DIALOGUE MESSAGE"
exit /b
)
if "%YesNo%"=="6" (
goto areyousure
)

:areyousure
Call :YesNoBox "I confirm it." "2ND DIALOGUE MESSAGE"
if "%YesNo%"=="7" (
Call :MessageBox "You clicked no and I close." "2ND DIALOGUE MESSAGE"
exit /b
)
if "%YesNo%"=="6" (
Call :MessageBox "You clicked yes and I do stuff." "2ND DIALOGUE MESSAGE"
goto execute
)



:YesNoBox
REM returns 6 = Yes, 7 = No. Type=4 = Yes/No
set YesNo=
set MsgType=4
set heading=%~2
set message=%~1
echo wscript.echo msgbox(WScript.Arguments(0),%MsgType%,WScript.Arguments(1)) >"%temp%\input.vbs"
for /f "tokens=* delims=" %%a in ('cscript //nologo "%temp%\input.vbs" "%message%" "%heading%"') do set YesNo=%%a
exit /b

:MessageBox
set heading=%~2
set message=%~1
echo msgbox WScript.Arguments(0),0,WScript.Arguments(1) >"%temp%\input.vbs"
cscript //nologo "%temp%\input.vbs" "%message%" "%heading%"
exit /b




:execute
echo yay
pause