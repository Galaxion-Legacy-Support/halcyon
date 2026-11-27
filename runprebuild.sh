#!/bin/sh

cp lib/* bin/

# Libraries fetched from NuGet (see THIRD-PARTY.md and .nuget/packages.config).
# Run "nuget restore Halcyon.sln" first; build.sh does this for you.
if [ ! -d packages/log4net.2.0.17 ]; then
    echo "runprebuild: NuGet packages are missing. Run 'nuget restore Halcyon.sln' first." >&2
    exit 1
fi

cp packages/CompareNETObjects.1.6.0/lib/KellermanSoftware.Compare-NET-Objects.dll bin/
cp packages/log4net.2.0.17/lib/net45/log4net.dll bin/
cp packages/Mono.Addins.1.0.0/lib/net20/Mono.Addins.dll bin/
cp packages/openstack.net.1.3.2/lib/net40/openstacknet.dll bin/
cp packages/SimpleRESTServices.1.3.0.1/lib/net40/SimpleRESTServices.dll bin/
cp "packages/System.Collections.Immutable.1.1.37/lib/portable-net45+win8+wp8+wpa81/System.Collections.Immutable.dll" bin/
cp packages/System.Data.SQLite.Core.1.0.98/lib/net45/System.Data.SQLite.dll bin/
mkdir -p bin/x86 bin/x64
cp packages/System.Data.SQLite.Core.1.0.98/build/net45/x86/SQLite.Interop.dll bin/x86/
cp packages/System.Data.SQLite.Core.1.0.98/build/net45/x64/SQLite.Interop.dll bin/x64/
cp packages/Thrift.0.6.0/lib/net35/Thrift.dll bin/
cp packages/zlib.net.1.0.3/lib/zlib.net.dll bin/
