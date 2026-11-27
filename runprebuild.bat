@copy /Y lib\*.* bin\

rem Libraries fetched from NuGet (see THIRD-PARTY.md, .nuget\packages.config and
rem scripts\nuget-libs.txt). Run "nuget restore Halcyon.sln" first; build.ps1 does
rem this for you.
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0scripts\fetch-nuget-libs.ps1"
if errorlevel 1 exit /b 1
