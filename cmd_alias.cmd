@echo off

doskey ls=dir /p $*
doskey ..=cd ..
doskey cd=cd /d $*
doskey link=%~dp0\link.vbs $*

rem 设置 e:\qs 下所有 .lnk 的别名
for %%i in (e:\qs\*.lnk) do (
	doskey %%~ni=%%~nxi $*
)

