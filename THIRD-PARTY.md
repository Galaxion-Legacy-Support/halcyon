# Third-party software

Halcyon uses libraries written by others. This file lists each one, its licence, and where it comes from. **To be completed by the licence audit (ROADMAP step 1) before this repository is made public.**

## Licences kept in the tree

These libraries have their licence files in `ThirdPartyLicenses/`, kept as they were.

| Library | Licence | Where to get it |
| --- | --- | --- |
| Apache Portable Runtime | *(from its file)* | |
| Axiom | | |
| C5 | | |
| C# web server, HttpServer | | |
| Json.NET | | NuGet: Newtonsoft.Json |
| MySQL connector | | |
| Nini | | |
| OpenJPEG | | |
| protobuf-net | | NuGet: protobuf-net |
| SmartThreadPool | | |
| XML-RPC.NET | | |
| libsl / libopenmetaverse | | |
| *(the rest of `ThirdPartyLicenses/`)* | | |

## Removed from this copy

These were bundled as ready-built files with **no licence file** in the tree. They have been removed. The build fetches them as packages where it can; otherwise get them from their makers under their own terms.

| Library | Files removed | Licence (to confirm) | Where to get it | Replacement planned |
| --- | --- | --- | --- | --- |
| NVIDIA PhysX 3, CUDA and Cg runtimes | `PhysX3*_x64.dll`, `cudart64_32_16.dll`, `cg.dll`, `cgGL.dll` | NVIDIA's terms | NVIDIA | PhysX 5 (BSD-3-Clause), ROADMAP step 4 |
| ZeroC Ice | `Ice.dll`, `Glacier2.dll` | | ZeroC | |
| NHibernate, Castle | | | NuGet | Current packages |
| Mono.Addins, Thrift, log4net | | | NuGet | Current packages |
| LibreMetaverse | | | NuGet | Current packages |
| OpenSSL | `libeay32.dll` | | openssl.org | .NET's own cryptography |
| libcurl, libssh2 | | | | |
| Berkeley DB | `libdb44d.dll` | | Oracle | |
| Microsoft C++ runtimes | | Microsoft redistribution terms | Microsoft | Installed separately |
| Kds.Serialization, KellermanSoftware.Compare-NET-Objects, BclExtras35, Fadd, DotSets, FlatBuffers, FlatHACD | | | | |

## Added by VWRI

Libraries added by this copy are listed here with their licences as they come in.

| Library | Licence | Why |
| --- | --- | --- |
| | | |
