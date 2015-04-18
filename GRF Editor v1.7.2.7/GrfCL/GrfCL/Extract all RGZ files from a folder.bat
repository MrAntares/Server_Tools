@echo off

set c= -breakOnExceptions true

REM Breaking on exceptions will allow you to see which commands
REM have issues; every batch file uses it as its first option

setlocal enabledelayedexpansion

FOR %%f in (C:\*.rgz) DO (
    set c=!c! -eRgz "%%f" "myROFolder"
)

set c=%c% -break

GrfCL.exe %c%