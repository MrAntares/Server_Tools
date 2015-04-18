@echo off

set c= -breakOnExceptions true

REM Breaking on exceptions will allow you to see which commands
REM have issues; every batch file uses it as its first option

SET /P GRFPath=Name of your GRF : 

set c=%c% -new
set c=%c% -save %GRFPath%
set c=%c% -shellOpen %GRFPath%
set c=%c% -break

GrfCL.exe %c%