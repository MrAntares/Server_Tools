@echo off

REM Breaking on exceptions will allow you to see which commands
REM have issues; every batch file uses it as its first option

GrfCL.exe -breakOnExceptions true -gif myGifs *.act 1 /ignore=True -break