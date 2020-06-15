@ECHO OFF
:Relance
echo Que voulez vous faire ?
echo.

echo	                  ################
echo	         ##########              ##########
echo	        #				   #
echo        ##  1) Ajouter un utilisateur       ##
echo        ##  2) Ajouter une classe           ##
echo        ##  3) Creation automatique initial ##
echo        ##  4) Sortir                       ##
echo	       ##                                  ##
echo	        ####################################

echo.
echo Quelle option voulez vous faire ?:

set /p choix=
if "%choix%"==""  goto Relance
if "%choix%"=="1" goto CreateUser
if "%choix%"=="2" goto CreateClass
if "%choix%"=="3" goto UseNormaly
if "%choix%"=="4" Exit
echo %choix%

:CreateUser
echo Entrez l utilisateur que vous voulez rajouter ainsi que sa classe de la facon suivante:
echo Nom
set /p NomUser=
if "%NomUser%"=="" (
    echo Veuillez entrez un nom
    goto CreateUser)
echo Prenom
set /p PrenomUser=
if "%PrenomUser%"=="" ( 
    echo Veuillez entrez un Prenom
    goto CreateUser
) else ( 
cd Prog 
CALL CreerUnCompte %%l %NomUser% %PrenomUser%)
pause
goto fin

:CreateClass
echo Entrez la classe que vous voulez rajouter
set /p NomClasse=
cd Classes
if EXIST "%NomClasse%" ( 
    echo Cette classe existe deja 
    goto CreateClass)
cd ..
if "%NomClasse%"=="" (goto CreateClass) else ( 
cd Prog
CALL CreerUneClasse %NomClasse%)
echo ^<================ %date% =================^> >>../Log/log.txt
echo ^<===============   %time:~0,2%H%time:~3,2%,%time:~6,2%   ================^> >>../Log/log.txt
echo ^<=============================================^> >>../Log/log.txt
echo Creation de la classe %NomClasse%>> ../Log/Log.txt
goto fin

:UseNormaly
echo Lancement automatique
cd Prog
CALL CreerTous.bat
echo Creation automatique fini
goto fin

:fin
echo voulez vous rajoutez autre chose ?
echo 1) oui
echo 2) Non


:ChoixFin
set /p ChoixFin=
if "%ChoixFin%"=="" (
    echo merci de faire un choix
    goto ChoixFin)
if "%ChoixFin%"=="1" goto Relance
if "%ChoixFin%"=="2" Exit