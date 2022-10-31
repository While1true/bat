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
for /f "tokens=2,* delims=^(^)" %%x in ("%%i") do (
echo %%x
set Num=00000%%x
set Num=!Num:~-5!
ren "%%i" "!Num!.%str%"
)
)
set a=0
setlocal EnableDelayedExpansion
dir /b > oriName.txt
dir /b .\*.%str% | find /c /v "" >> .\tmp.txt
set /p c=<.\tmp.txt
del /a /f /q .\tmp.txt
del /a /f /q oriName.txt


for %%i in (*.%str%) do (
set /a a+=1
if !a! gtr %c% (goto bb)
set Num=00000!a!
set Num=!Num:~-5!
ren "%%i" "%str2%!Num!.%str%"
)
:bb

echo.
echo 完成全部重命名，共计!a!个文件
pause