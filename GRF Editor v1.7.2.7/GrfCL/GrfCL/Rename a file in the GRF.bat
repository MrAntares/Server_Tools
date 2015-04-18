@echo off

set c= -breakOnExceptions true

REM Breaking on exceptions will allow you to see which commands
REM have issues; every batch file uses it as its first option

set c=%c% -open example.grf
set c=%c% -rename data\texture\chdesk-side1.bmp data\texture\chdesk-side3.bmp

set c=%c% -save
set c=%c% -write "Finished writing the new GRF!"
set c=%c% -shellOpen
set c=%c% -break

GrfCL.exe %c%