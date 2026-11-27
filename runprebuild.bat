@copy /Y lib\*.* bin\

rem Libraries fetched from NuGet (see THIRD-PARTY.md and .nuget\packages.config).
rem Run "nuget restore Halcyon.sln" first; build.ps1 does this for you.
if not exist packages\log4net.2.0.17 (
    echo runprebuild: NuGet packages are missing. Run "nuget restore Halcyon.sln" first. 1>&2
    exit /b 1
)

call :fetch "packages\CompareNETObjects.1.6.0\lib\KellermanSoftware.Compare-NET-Objects.dll" bin\
call :fetch "packages\log4net.2.0.17\lib\net45\log4net.dll" bin\
call :fetch "packages\Mono.Addins.1.0.0\lib\net20\Mono.Addins.dll" bin\
call :fetch "packages\openstack.net.1.3.2\lib\net40\openstacknet.dll" bin\
call :fetch "packages\SimpleRESTServices.1.3.0.1\lib\net40\SimpleRESTServices.dll" bin\
call :fetch "packages\System.Collections.Immutable.1.1.37\lib\portable-net45+win8+wp8+wpa81\System.Collections.Immutable.dll" bin\
call :fetch "packages\System.Data.SQLite.Core.1.0.98\lib\net45\System.Data.SQLite.dll" bin\
@if not exist bin\x86 mkdir bin\x86
@if not exist bin\x64 mkdir bin\x64
call :fetch "packages\System.Data.SQLite.Core.1.0.98\build\net45\x86\SQLite.Interop.dll" bin\x86\
call :fetch "packages\System.Data.SQLite.Core.1.0.98\build\net45\x64\SQLite.Interop.dll" bin\x64\
call :fetch "packages\Thrift.0.6.0\lib\net35\Thrift.dll" bin\
call :fetch "packages\zlib.net.1.0.3\lib\zlib.net.dll" bin\

if defined RUNPREBUILD_FAILED (
    echo runprebuild: some NuGet files were not where expected. Restored packages: 1>&2
    dir /b packages 1>&2
    exit /b 1
)
goto :eof

rem Copies one file from a NuGet package, naming it if it's missing.
:fetch
if not exist "%~1" (
    echo runprebuild: missing %~1 1>&2
    set RUNPREBUILD_FAILED=1
    goto :eof
)
copy /Y "%~1" %2 >nul
goto :eof
