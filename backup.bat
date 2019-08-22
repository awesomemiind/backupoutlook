@echo off
echo EXECUTE COMO ADMINISTRADOR
pushd %~dp0
title Backup Outlook (Usuario: %username%) 
set /p OS=Digite o numero da OS: 
echo Salvar em 
echo 1- Diretorio atual 2- Outro disco
set /p BackupDir=:
if %BackupDir% equ 1 goto Atual
if %BackupDir% equ 2 goto Other

:Other
echo Digite o disco onde deseja fazer o backup:
set /p DirAlt=:
%DirAlt%:
mkdir "backupOutlook"
cd "backupOutlook"

:Atual
mkdir "%OS%-%username%-%date:/=-%"
cd "%OS%-%username%-%date:/=-%"
set RaizDir=%cd%
mkdir %username%
cd %username%
mkdir "AppData"
cd "AppData"
mkdir "Local"
cd "Local"
mkdir "Microsoft"
cd Microsoft
mkdir "Outlook"
cd "Outlook"
xcopy /y /e /d /c %localappdata%\Microsoft\Outlook\*.* %cd% >> %RaizDir%\"loglocal.txt"
cd %RaizDir%\%username%\"AppData"
mkdir "Roaming"
cd "Roaming"
mkdir "Microsoft"
cd "Microsoft"
mkdir "Outlook"
cd "Outlook"
xcopy /y /e /d /c %appdata%\Microsoft\Outlook\*.* %cd% >> %RaizDir%\"logroaming.txt"
exit
