@echo off
set "TOMCAT_HOME=C:\xampp\tomcat"
set "APP_NAME=app-test"
set "CURRENT_DIR=%~dp0"
set "JAR_SOURCE=%CURRENT_DIR%..\framework.jar"

echo --- Debut du deploiement ---

REM 1. Verification du JAR
if not exist "%JAR_SOURCE%" (
    echo [ERREUR] framework.jar non trouve. Lancez d'abord compile.bat dans le dossier parent.
    pause
    exit /b
)

REM 2. Preparation du dossier lib
if not exist "%CURRENT_DIR%WEB-INF\lib" mkdir "%CURRENT_DIR%WEB-INF\lib"

REM 3. Copie du JAR
copy "%JAR_SOURCE%" "%CURRENT_DIR%WEB-INF\lib\" /Y

REM 4. Deploiement vers Tomcat
echo Deploiement vers %TOMCAT_HOME%\webapps\%APP_NAME%...
xcopy "%CURRENT_DIR%*" "%TOMCAT_HOME%\webapps\%APP_NAME%\" /E /I /Y

echo [SUCCES] Application deployee. Verifiez sur http://localhost:8080/%APP_NAME%/index.html
pause