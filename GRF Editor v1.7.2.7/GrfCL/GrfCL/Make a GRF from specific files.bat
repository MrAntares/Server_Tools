@echo off

set c= -breakOnExceptions true

REM Breaking on exceptions will allow you to see which commands
REM have issues; every batch file uses it as its first option

set c=%c% -new
set c=%c% -add "data\texture" data\texture\chdesk-side1.bmp data\texture\chdesk-side2.bmp
set c=%c% -add "data" data\06guild_r.gnd
set c=%c% -add "data\sprite\몬스터" "data\sprite\몬스터\high_orc.spr"

set c=%c% -save example.grf
set c=%c% -write "Finished writing the new GRF!"

REM shellOpen opens an explorer window and selects the file
set c=%c% -shellOpen example.grf
set c=%c% -break

GrfCL.exe %c%