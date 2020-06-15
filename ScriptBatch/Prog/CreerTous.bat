@ECHO OFF

Echo Recherche de la liste des personnes a ajouter
Echo.

cd ../Data
FOR /F "delims=; tokens=1" %%l IN (Classes.txt) DO (
ECHO Trouve %%l
)
Echo.
cd ../Log
ECHO Creation et verification des fichiers:

echo ^<================ %date% =================^> >>log.txt
echo ^<===============   %time:~0,2%H%time:~3,2%,%time:~6,2%   ================^> >>log.txt
echo ^<=============================================^> >>log.txt
cd../Data
FOR /F "delims=; tokens=1" %%l IN (Classes.txt) DO (
    FOR /F "delims=; tokens=1,2" %%m IN (%%l.txt) DO (
    cd ../Prog
    echo Creation de la classe %%l
    CALL CreerUneClasse.bat %%l 
    echo Creation de l utilisateurs %%m %%n
    CALL CreerUnCompte.bat %%l %%m %%n
    ECHO.
    cd ../Data
    )
)
ECHO.
cd ../Log
ECHO. >>log.txt

REN log.txt log_%time:~0,2%H%time:~3,2%M%time:~6,2%S.txt
cd ..	

