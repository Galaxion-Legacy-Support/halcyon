# Restore NuGet packages first: runprebuild copies some of them into bin\.
nuget restore Halcyon.sln

If (Test-Path "runprebuild.bat") {
    ./runprebuild.bat
    If ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
}

msbuild
