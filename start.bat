@echo OFF
RMDIR /s /q "e:\FXServer\cache\files"

echo Appuyez sur une touche pour démarrer
pause > nul
CLS
cd e:\FXServer
cmd /k run.cmd +exec server.cfg