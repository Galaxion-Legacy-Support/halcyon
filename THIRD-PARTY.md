# Third-party software

Halcyon uses libraries written by others. This file lists each one, its licence, and where it comes from. It records the licence audit (ROADMAP step 1) of every ready-built library (DLL, EXE, SO and DYLIB) in `bin/`, `lib/` and `ThirdParty/` at the base commit (HalcyonGrid `halcyon`, `master` at `3125cc15`), and of the PhysX test project's copies.

Libraries were identified from their own version information. "Licence (to confirm)" means no licence file came with the library, and the licence given is what its makers are known to publish; check their current terms before you use it.

## Kept: licence in the tree

These libraries have their licence files in `ThirdPartyLicenses/` (or, where noted, beside their source in `ThirdParty/`), kept as they were.

| Library | Files | Licence | Licence file | Where to get it | On NuGet? |
| --- | --- | --- | --- | --- | --- |
| Apache Portable Runtime 0.9.12 | `lib/libapr.dll`, `lib/libaprutil.dll`, `lib/libapriconv.dll` (0.9.7) | Apache-2.0 | `ApachePortableRuntime.txt` | apr.apache.org | Not checked |
| Axiom.MathLib 1.0 | `lib/Axiom.MathLib.dll` | LGPL-2.1 | `Axiom.txt` | Axiom engine project | Not checked |
| C5 2.4 | `lib/C5.dll` (and `C5.pdb`) | MIT | `C5.txt`; also `ThirdParty/C5.src/LICENSE.txt` | github.com/sestoft/C5 | Yes (2.4 builds) |
| C# WebServer (HttpServer) 1.0 | `lib/HttpServer.dll` | Two licence files: Apache-2.0 and LGPL-2.1 | `HttpServer.txt` (Apache-2.0), `C# Webserver.txt` (LGPL-2.1, names `HttpServer.dll`); source in `ThirdParty/HttpServer/` with `Apache License 2.0.txt` | Source in `ThirdParty/HttpServer/` | Not checked |
| DotNetOpenId 2.6.0 | `lib/DotNetOpenId.dll` | BSD-3-Clause | `DotNetOpenid.txt` | DotNetOpenAuth project | Not checked |
| GlynnTucker.Cache 1.0 | `lib/GlynnTucker.Cache.dll` | MPL-1.1 or GPL (dual) | `GTCache.txt` | gtcache.sourceforge.net | Not checked |
| MySQL Connector/NET 6.9.7 | `lib/MySql.Data.dll` | GPL-2.0 with the MySQL FLOSS exception | `MySQL.txt` | dev.mysql.com | Yes: `MySql.Data` 6.9.7 |
| Json.NET 5.0.6 | `lib/Newtonsoft.Json.dll` (and `.XML`) | MIT | `Newtonsoft-JsonDotNet.txt` | newtonsoft.com/json | Yes: `Newtonsoft.Json` 5.0.6 |
| Nini 1.1.0 | `lib/Nini.dll` | MIT | `Nini.txt` | nini.sourceforge.net | No (only 1.0.0-beta-0004) |
| OpenJPEG 1.1 (openjpeg-dotnet) | `lib/openjpeg-dotnet.dll`, `lib/openjpeg-dotnet-x86_64.dll`, `lib/libopenjpeg-dotnet-2.1.3.0-dotnet-1.dylib` | BSD-2-Clause | `OpenJpeg.txt`; also `ThirdParty/libopenmetaverse/openjpeg-dotnet/license.txt` | openjpeg.org | Not checked |
| protobuf-net 2.1.0 | `lib/protobuf-net.dll` | Apache-2.0 | `Protobuf-net.txt` | github.com/protobuf-net/protobuf-net | Yes: `protobuf-net` 2.1.0 |
| SmartThreadPool | `lib/SmartThreadPool.dll` (and `.pdb`) | Ms-PL | `SmartThreadPool.txt`; source in `ThirdParty/SmartThreadPool/` | Source in `ThirdParty/SmartThreadPool/` | Not the same build (`SmartThreadPool.dll` 2.2–2.3) |
| XML-RPC.NET | `lib/CookComputing.XmlRpcV2.dll` | MIT | `XML-RPC.NET.txt` | xml-rpc.net | Later versions only (`xmlrpcnet` 2.5.0, 3.0) |
| Compiler tools in C# (CS Tools) 4.7 | `lib/Tools.dll` | Permission notice from Malcolm Crowe | `CSCompilerTools.txt` (the DLL holds no version information; identified by its CSTools types) | Malcolm Crowe | Not checked |
| LibreMetaverse 1.0.2.26 | `lib/LibreMetaverse.dll`, `lib/LibreMetaverse.Types.dll`, `lib/LibreMetaverse.StructuredData.dll` | BSD-3-Clause | `libsl.txt`; also `ThirdParty/libopenmetaverse/LICENSE.txt` | github.com/cinderblocks/libremetaverse | Yes: `LibreMetaverse` 1.0.2.26 |
| XmlRpcCS 1.10 | `lib/XmlRpcCS.dll` | BSD-3-Clause | Only beside its source: `ThirdParty/XmlRpcCS-1.10/XmlRpcCS/LICENSE.html` | Source in `ThirdParty/XmlRpcCS-1.10/` | Not checked |
| Prebuild 2.0.3 | `ThirdParty/libopenmetaverse/Programs/Prebuild/Prebuild.exe` | BSD | Only beside it: `ThirdParty/libopenmetaverse/Programs/Prebuild/COPYING` | Source beside it | Not checked |

`ThirdPartyLicenses/` also holds licences for things that are not ready-built libraries: `Npgsql.txt` (no Npgsql library is bundled), `MXP.txt`, `Prototype.txt` and `DefaultTerrain.txt` (Linden Lab artwork, CC BY-SA 3.0).

## Removed from this copy

These were bundled as ready-built files with **no licence file** in the tree, and have been removed. Where NuGet has the same version, the build now fetches it (see "Fetched from NuGet" below). Otherwise get the library from its makers under their own terms.

| Library | Files removed | Licence (to confirm) | Where to get it | On NuGet? | Replacement planned |
| --- | --- | --- | --- | --- | --- |
| NVIDIA PhysX 3.2.3.1 | `lib/PhysX3*_x64.dll` (11 files); in `InWorldz/InWorldz.PhysxPhysics/Tests/PhysXtest/Deps/`: `PhysX3*_x64.dll` (9 files) and `PxTaskCuda.dll` | NVIDIA PhysX 3 licence | NVIDIA | Not checked | PhysX 5 (BSD-3-Clause), ROADMAP step 4 |
| PhysX.Net 0.2 (StillDesign) | `lib/PhysX.Net.dll`; `PhysXtest/PhysX.Net.dll` and `PhysXtest/Deps/PhysX.Net.dll` | | Companion repository `PhysX.net` | Not checked | Rebuilt against PhysX 5, ROADMAP step 4 |
| NVIDIA CUDA 3.2.16 runtime | `lib/cudart64_32_16.dll`, `PhysXtest/Deps/cudart64_32_16.dll` | NVIDIA CUDA licence | NVIDIA | Not checked | GPU physics stays optional (ROADMAP step 4) |
| NVIDIA Cg 2.2 runtime | `lib/cg.dll`, `lib/cgGL.dll`, and their `PhysXtest/Deps/` copies | NVIDIA Cg licence | NVIDIA | Not checked | Not needed by PhysX 5 |
| GLUT for Win32 | `lib/glut32.dll`, `PhysXtest/Deps/glut32.dll` | GLUT licence | | Not checked | Not needed |
| ZeroC Ice 3.4.2 | `lib/Ice.dll`, `lib/Glacier2.dll` | GPL-2.0 or ZeroC commercial | zeroc.com | Not checked | Not used by the code |
| OpenSSL 1.0.1e | `lib/libeay32.dll`, `lib/ssleay32.dll` | OpenSSL / SSLeay | openssl.org | Not checked | .NET's own cryptography |
| libcurl 7.34.0 | `lib/libcurl.dll` | curl licence | curl.se | Not checked | Not used by the code |
| libssh2 1.4.3 | `lib/libssh2.dll` | BSD-3-Clause | libssh2.org | Not checked | Not used by the code |
| Berkeley DB 4.4.20 and its .NET wrapper | `lib/libdb44d.dll`, `lib/libdb_dotNET43.dll` | Sleepycat; wrapper by Karl Waclawek | Oracle | Not checked | Not used by the code |
| Kds.Serialization 0.8.1 | `lib/Kds.Serialization.dll` | | Karl Waclawek | Not checked | Not used by the code |
| Microsoft C++ runtimes 10.0 and 11.0 | `lib/msvcp100.dll`, `lib/msvcr100.dll`, `lib/msvcp110.dll`, `lib/msvcr110.dll` | Microsoft redistribution terms | Microsoft (Visual C++ Redistributable) | Not checked | Installed separately |
| zlib 1.2.8 | `lib/zlib1.dll` | zlib licence | zlib.net | Not checked | |
| SQLite 3.8.11.1 | `lib/sqlite3.dll` (and `sqlite3.dll.version.txt`), `lib/libsqlite3.so.0.8.6` | Public domain | sqlite.org | Native library comes with `System.Data.SQLite.Core` | |
| System.Data.SQLite 1.0.98 | `lib/System.Data.SQLite.dll` | Public domain | system.data.sqlite.org | **Yes: `System.Data.SQLite.Core` 1.0.98 (fetched)** | |
| Mono.Data.SqliteClient 2.0 | `lib/Mono.Data.SqliteClient.dll` | MIT (Mono) | Mono | Not checked | Not used by the code |
| Apache log4net 2.0.8 | `lib/log4net.dll` | Apache-2.0 | logging.apache.org | **Yes: `log4net` 2.0.8 (fetched)** | |
| Mono.Addins 1.0 | `lib/Mono.Addins.dll` (and `.dll.config`) | MIT | github.com/mono/mono-addins | **Yes: `Mono.Addins` 1.0.0 (fetched)** | |
| Apache Thrift 0.6.0 | `lib/Thrift.dll` | Apache-2.0 | thrift.apache.org | **Yes: `Thrift` 0.6.0 (fetched)** | |
| openstack.net 1.3.2 | `lib/openstacknet.dll` (and `.xml`) | Per the package's licence page | github.com/openstacknetsdk | **Yes: `openstack.net` 1.3.2 (fetched)** | |
| SimpleRESTServices 1.3.0.1 | `lib/SimpleRESTServices.dll` (and `.xml`) | Per the package's licence page | github.com/JSIStudios/SimpleRestServices | **Yes: `SimpleRESTServices` 1.3.0.1 (fetched)** | |
| System.Collections.Immutable 1.1.37 | `lib/System.Collections.Immutable.dll` (and `.xml`) | Microsoft .NET library licence | Microsoft | **Yes: `System.Collections.Immutable` 1.1.37 (fetched)** | |
| Compare-NET-Objects 1.6.0 | `lib/KellermanSoftware.Compare-NET-Objects.dll` (and `.XML`) | Per the package's licence page | Kellerman Software | **Yes: `CompareNETObjects` 1.6.0 (fetched)** | |
| ZLIB.NET 1.0.3 | `lib/zlib.net.dll` | ComponentAce licence | componentace.com | **Yes: `zlib.net` 1.0.3 (fetched)** | |
| NHibernate 2.0.1, NHibernate.Mapping.Attributes 1.2.1, Iesi.Collections 2.0.1 | `lib/NHibernate.dll`, `lib/NHibernate.Mapping.Attributes.dll`, `lib/Iesi.Collections.dll` | LGPL-2.1 (as the assemblies state) | nhibernate.info | Not this version (only 2.1.2) | Not used by the code |
| Castle Core 1.0.3, DynamicProxy 1.1.5 and 2.0.3 | `lib/Castle.Core.dll`, `lib/Castle.DynamicProxy.dll`, `lib/Castle.DynamicProxy2.dll` | Apache-2.0 | castleproject.org | Not checked | Not used by the code |
| ANTLR 3.3.1 runtime and StringTemplate | `lib/Antlr3.Runtime.dll`, `lib/Antlr3.Runtime.Debug.dll`, `lib/Antlr3.StringTemplate.dll` | BSD-3-Clause | antlr.org | Not this version (`Antlr3.Runtime` 3.5.1 only) | |
| AprSharp 1.0 | `lib/AprSharp.dll` | | SOFTEC sa | Not checked | Not used by the code |
| BclExtras35 1.0 | `lib/BclExtras35.dll` | | | Not checked | |
| CSJ2K 1.0.5030 | `lib/CSJ2K.dll` | | | Not this version (0.9.x, 2.x, 3.x) | |
| DotNetOpenMail 1.0 | `lib/DotNetOpenMail.dll` | | | Not checked | |
| DotSets 1.0 | `lib/DotSets.dll` | | | Not checked | Not used by the code |
| Fadd 1.0 and Fadd.Globalization.Yaml (Gauffin Telecom) | `lib/Fadd.dll`, `lib/Fadd.Globalization.Yaml.dll`, `ThirdParty/HttpServer/dlls/Fadd.dll`, `ThirdParty/HttpServer/dlls/Fadd.Globalization.Yaml.dll` | | | Not checked | Used only by HttpServer's sample and test projects, which are not in `Halcyon.sln` |
| xUnit.net 1.0.3 and 1.1.0 | `lib/xunit.dll`, `ThirdParty/HttpServer/dlls/xunit.dll` | | xunit.net | Not checked | As for Fadd |
| FlatBuffers 1.0 (Google) | `lib/FlatBuffers.dll`; the compiler `bin/flatc-win.exe` | Apache-2.0 | github.com/google/flatbuffers | A `FlatBuffers` 1.0.0 package exists, not confirmed to be the same build | |
| FlatHACD (HACD) | `lib/FlatHACD.dll` | HACD's source in `ThirdParty/HACD/` names no licence | Khaled Mamou's HACD | Not checked | |
| BulletSim wrapper | `lib/libbulletnet.dll` | | | Not checked | Not used by the code |
| MonoXnaCompactMaths, Mono.PEToolkit, NDesk.Options | `lib/MonoXnaCompactMaths.dll`, `lib/Mono.PEToolkit.dll`, `lib/NDesk.Options.dll` | | | Not checked | Not used by the code |
| Phlox script engine | `lib/InWorldz.Phlox.dll` | Licence in its own repository, not in this tree | Companion repository `phlox` | No | Built from `phlox` |
| WHIP client | `lib/InWorldz.Whip.Client.dll` | Licence in its own repository, not in this tree | Companion repository `whip-client` | No | Built from `whip-client` |
| Aperture | `bin/aperture.exe` | Licence in its own repository, not in this tree | Companion repository `aperture` | No | Built from `aperture` |
| hc-database | `bin/hc-database.exe` (and `.exe.config`) | Source not in this tree | | No | |

"Not used by the code" means no project, source or configuration file in this tree refers to the library.

### Fetched from NuGet

The build restores these through `.nuget/packages.config`, and `runprebuild` copies them into `bin/`, where the projects already look for them: `log4net` 2.0.8, `Mono.Addins` 1.0.0, `CompareNETObjects` 1.6.0, `zlib.net` 1.0.3, `openstack.net` 1.3.2, `SimpleRESTServices` 1.3.0.1, `Thrift` 0.6.0, `System.Collections.Immutable` 1.1.37 and `System.Data.SQLite.Core` 1.0.98. Only these exact versions are fetched; moving to newer versions belongs to ROADMAP step 2.

### Build output in `bin/`

The base snapshot also held 99 files in `bin/` that HalcyonGrid's repository doesn't: byte-for-byte copies of files in `lib/` and `ThirdParty/` that `runprebuild` puts there at build time. They have been removed whether or not they have a licence, and `.gitignore` already keeps them out (`bin/*.dll*` and the rest).

## Added by VWRI

Libraries added by this copy are listed here with their licences as they come in.

| Library | Licence | Why |
| --- | --- | --- |
| | | |
