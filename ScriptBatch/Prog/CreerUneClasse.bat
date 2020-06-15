@ECHO OFF
rem ECHO param 0 = %0%
rem ECHO param 1 = %1%
rem ECHO param 2 = %2%
rem ECHO param 3 = %3%

cd ..
IF NOT EXIST Classes ( mkdir Classes)
cd Classes
    IF NOT EXIST %1 ( mkdir %1)
    cd ../Prog
    )
)

ECHO. >>../Log/log.txt
rem log.txt log_%time:~0,2%H%time:~3,2%M%time:~6,2%S.txt
