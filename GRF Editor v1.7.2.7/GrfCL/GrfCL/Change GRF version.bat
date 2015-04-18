@echo off

set c= -breakOnExceptions true

REM Breaking on exceptions will allow you to see which commands
REM have issues; every batch file uses it as its first option

SET /P GRFPath=Path of your GRF : 

ECHO.
ECHO Select your format
ECHO.
ECHO 1 - 0x102
ECHO 2 - 0x103
ECHO 3 - 0x200
ECHO.

set c=%c% -open %GRFPath%

SET /P M=Type 1, 2 or 3 : 
IF %M%==1 GOTO OP1
IF %M%==2 GOTO OP2
IF %M%==3 GOTO OP3

:OP1
set c=%c% -changeVersion 0x102
GOTO PROGRAM
:OP2
set c=%c% -changeVersion 0x103
GOTO PROGRAM
:OP3
set c=%c% -changeVersion 0x200
GOTO PROGRAM

:PROGRAM
set c=%c% -save -close -break

GrfCL.exe %c%