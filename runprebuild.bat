@copy /Y lib\*.* bin\

rem Libraries fetched from NuGet (see THIRD-PARTY.md and .nuget\packages.config).
rem Run "nuget restore Halcyon.sln" first; build.ps1 does this for you.
if not exist packages\log4net.2.0.17 (
    echo runprebuild: NuGet packages are missing. Run "nuget restore Halcyon.sln" first. 1>&2
    exit /b 1
)

@copy /Y packages\CompareNETObjects.1.6.0\lib\KellermanSoftware.Compare-NET-Objects.dll bin\
@copy /Y packages\log4net.2.0.17\lib\net45\log4net.dll bin\
@copy /Y packages\Mono.Addins.1.0.0\lib\net20\Mono.Addins.dll bin\
@copy /Y packages\openstack.net.1.3.2\lib\net40\openstacknet.dll bin\
@copy /Y packages\SimpleRESTServices.1.3.0.1\lib\net40\SimpleRESTServices.dll bin\
@copy /Y "packages\System.Collections.Immutable.1.1.37\lib\portable-net45+win8+wp8+wpa81\System.Collections.Immutable.dll" bin\
@copy /Y packages\System.Data.SQLite.Core.1.0.98\lib\net45\System.Data.SQLite.dll bin\
@if not exist bin\x86 mkdir bin\x86
@if not exist bin\x64 mkdir bin\x64
@copy /Y packages\System.Data.SQLite.Core.1.0.98\build\net45\x86\SQLite.Interop.dll bin\x86\
@copy /Y packages\System.Data.SQLite.Core.1.0.98\build\net45\x64\SQLite.Interop.dll bin\x64\
@copy /Y packages\Thrift.0.6.0\lib\net35\Thrift.dll bin\
@copy /Y packages\zlib.net.1.0.3\lib\zlib.net.dll bin\
