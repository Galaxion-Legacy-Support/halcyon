# Halcyon — legacy support copy, maintained by Virtual World Research Inc

This is VWRI's maintained copy of **Halcyon**, the virtual-world server that InWorldz LLC released as open source in 2015 and that HalcyonGrid carried on until 2023. It is based on HalcyonGrid's `halcyon` repository, `master` at commit `3125cc15` (5 March 2023).

We keep it so that worlds still running Halcyon get security, data-safety and backup-export fixes, and a server that runs on today's systems and works with today's viewers, while they decide whether, and when, to move.

## What we work on

- **Fixes:** security, data loss or corruption (regions, inventories, backups), OAR and IAR export, and building and running on current systems and databases.
- **Bringing Halcyon up to date** (see [ROADMAP.md](ROADMAP.md)):
  - .NET 10, the cross-platform successor to .NET Core, so regions run on Windows, Linux and macOS;
  - support for what current viewers such as Firestorm expect: environment settings (EEP), bakes on mesh, PBR materials and the rest;
  - the open-source PhysX 5 in place of PhysX 3;
  - one C# WHIP asset server, built on WHIP-LRU.
- **Not here:** features beyond what current viewers already support, and any link to other platforms.

Each step ships as its own release, so a world can stop at any point.

## Licence

BSD-3-Clause, as the original project: see [LICENSE](LICENSE). All original notices are kept as they were. See also [NOTICE](NOTICE) for the copyright holders and [THIRD-PARTY.md](THIRD-PARTY.md) for the libraries Halcyon uses and where to get them.

## Who wrote it, and who maintains this copy

Halcyon's original authors are credited in [CONTRIBUTORS.md](CONTRIBUTORS.md). **This copy is maintained by VWRI's Galaxion Legacy Support Work Group;** the original authors are not involved in it. This repository's history starts from a snapshot of the base commit, so its log shows only our changes; the original history remains in HalcyonGrid's and IslandzVW's repositories.

This copy is **not endorsed by** InWorldz, IslandzVW, HalcyonGrid or Halcyon's original authors. Their names are used only to say what this is.

## Companion repositories

| Repository | What it is |
| --- | --- |
| `phlox` | The Phlox script engine and LSL compiler |
| `aperture` | The Aperture texture and mesh server |
| `whip-server` | The WHIP asset server, moving to C# on WHIP-LRU |
| `whip-client` | The .NET client for the WHIP asset server |
| `ais` | The AISv3 inventory service |
| `halcyon-physx`, `PhysX.net` | The physics wrapper (moving to PhysX 5) |
| `anaximander2` | The map tile generator |
| `setuptools` | Tools to configure and launch Halcyon |
| `import-export` | Import and export tools |

## Building and running

See [doc/](doc/) for the original instructions. Instructions for .NET 10 will be added here as that work lands.

## Getting help

- **Security problems:** please don't open a public issue. See [SECURITY.md](SECURITY.md).
- **Bugs and questions:** open an issue. Help is best effort.
- **Contributing:** see [CONTRIBUTING.md](CONTRIBUTING.md).

## Support period

We support this copy until **<date to be published>**, and review that date every year. See [CHANGELOG.md](CHANGELOG.md) for releases.

## Moving on

Halcyon's worlds can move to **Galaxion Elysian**, which reads Halcyon's OAR and IAR archives. <link>
