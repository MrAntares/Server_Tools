@echo off

set c= -breakOnExceptions true

REM Breaking on exceptions will allow you to see which commands
REM have issues; every batch file uses it as its first option

SET /P GRFBasePath=Path of your base GRF : 
SET /P GRFAddPath=Path of your GRF to add : 

set c=%c% -merge %GRFBasePath% %GRFAddPath%
set c=%c% -shellOpen %GRFBasePath%
set c=%c% -break

GrfCL.exe %c%