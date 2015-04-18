@echo off

set c= -breakOnExceptions true

REM Breaking on exceptions will allow you to see which commands
REM have issues; every batch file uses it as its first option

set c=%c% -sM

GrfCL.exe %c%