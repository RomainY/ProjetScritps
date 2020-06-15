@ECHO OFF
rem ECHO param 0 = %0%
rem ECHO param 1 = %1%
rem ECHO param 2 = %2%
rem ECHO param 3 = %3%

cd ..

IF NOT EXIST Users ( mkdir Users)

cd Users
if EXIST %2_%3 (
    echo %2_%3 est deja pris >> ../Log/Log.txt
) else (
    echo Creation du fichier %2_%3>> ../Log/Log.txt
    MKDIR %2_%3
    echo le fichier %2_%3 a etait creer >> ../Log/Log.txt 
)

cd../Prog


