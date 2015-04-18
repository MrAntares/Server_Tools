@echo off

set c= -breakOnExceptions true

REM Breaking on exceptions will allow you to see which commands
REM have issues; every batch file uses it as its first option

SET /P GRFPath=Path of your GRF : 

REM CPU performance management will avoid lag, but it takes some
REM time to load. It's up to you really, if you've got a good
REM good computer, you can comment the next line.
set c=%c% -cpuPerf true

REM Encoding will only affect the extraction
set c=%c% -encoding 949
set c=%c% -open %GRFPath%

REM The timer is used to calculate the time of the extraction.
REM This is only to show some additional features.
set c=%c% -timer start
set c=%c% -extractFiles "" ""
set c=%c% -write ""
set c=%c% -write "Time of the extraction with CPU performance management"
set c=%c% -timer stop
set c=%c% -shellOpen data
set c=%c% -break

GrfCL.exe %c%