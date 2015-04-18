@echo off

set c= -breakOnExceptions true

REM Breaking on exceptions will allow you to see which commands
REM have issues; every batch file uses it as its first option

SET /P GRFBasePath=Path of your older GRF : 
SET /P GRFNewPath=Path of your newer GRF : 
SET /P GRFOutPath=Path of your result GRF : 

set c=%c% -open %GRFBasePath%
set c=%c% -patch %GRFNewPath% %GRFOutPath%
set c=%c% -close
set c=%c% -shellOpen %GRFOutPath%
set c=%c% -break

GrfCL.exe %c%