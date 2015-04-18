@echo off

set c= -breakOnExceptions true

REM Breaking on exceptions will allow you to see which commands
REM have issues; every batch file uses it as its first option

SET /P GRFPath=Name of your GRF : 

set c=%c% -makeGrf %GRFPath% data

REM There are other ways of doing the same command above, here
REM they are :
REM set c=%c% -new
REM set c=%c% -add "" data

REM "" means that no argument is passed (the GRF path in this case).
REM This will add the folder "data" to the root node of the GRF, 
REM hence creating a new data node.

REM This line would also do the same :
REM set c=%c% -add "data" data\texture data\06guild_r.gat ...

set c=%c% -shellOpen %GRFPath%
set c=%c% -break

GrfCL.exe %c%