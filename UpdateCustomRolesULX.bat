@echo off
set /p changes="Enter Changes: "
"C:\Program Files (x86)\Steam\steamapps\common\GarrysMod\bin\gmpublish.exe"  update -addon "TTT-Custom-Roles-ULX.gma" -id "2091700901" -changes "%changes%"
pause