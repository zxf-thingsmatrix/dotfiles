@echo off

doskey ls=dir /p $*
doskey ..=cd ..
doskey cd=cd /d $*
doskey link=link.vbs $*

rem 设置 d:\qs 下所有 .lnk 的别名
for %%i in (e:\zxf\qs\*.lnk) do (
	doskey %%~ni=%%~nxi $*
)

