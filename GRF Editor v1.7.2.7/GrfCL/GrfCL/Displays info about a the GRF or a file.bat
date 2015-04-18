@echo off

set c= -breakOnExceptions true

REM Breaking on exceptions will allow you to see which commands
REM have issues; every batch file uses it as its first option

set c=%c% -open example.grf
set c=%c% -info
set c=%c% -break
set c=%c% -write "Now showing the structure of the current GRF : "
set c=%c% -tree data true all
set c=%c% -break
set c=%c% -fileInfo "data\sprite\∏ÛΩ∫≈Õ\high_orc.spr"
set c=%c% -break

GrfCL.exe %c%