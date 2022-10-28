@echo off
set a=0
set /p str=输入要重命名的文件类型（如jpg，png）^:
setlocal EnableDelayedExpansion
dir /b > oriName.txt
dir /b .\*.%str% | find /c /v "" >> .\tmp.txt
set /p c=<.\tmp.txt
del /a /f /q .\tmp.txt
del /a /f /q oriName.txt
echo.
echo 输入命名前缀
echo.
set /p str2=请输入命名前缀^:
for %%i in (*.%str%) do (
set /a a+=1
if !a! gtr %c% (goto aa)
echo %%i
set Num=00000!a!
set Num=!Num:~-5!
echo !Num!
ren "%%i" "%str2%!Num!.%str%"
)
:aa
echo.
echo 完成全部重命名，共计!a!个文件
pause