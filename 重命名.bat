@echo off
set a=0
set /p str=����Ҫ���������ļ����ͣ���jpg��png��^:
setlocal EnableDelayedExpansion
dir /b > oriName.txt
dir /b .\*.%str% | find /c /v "" >> .\tmp.txt
set /p c=<.\tmp.txt
del /a /f /q .\tmp.txt
del /a /f /q oriName.txt
echo.
echo ��������ǰ׺
echo.
set /p str2=����������ǰ׺^:
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
echo ���ȫ��������������!a!���ļ�
pause