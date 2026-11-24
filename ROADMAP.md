# Roadmap

Halcyon was last changed in March 2023, and its viewer support stopped well before that. This copy brings it up to date in steps. **Each step ships as its own release,** so a world can stop at any point.

| Step | What | Status |
| --- | --- | --- |
| 1 | Licence audit and clean public base | Not started |
| 2 | .NET 10 (the successor to .NET Core) on Windows, Linux and macOS, with Anaximander2 | Not started |
| 3 | Current viewer compatibility (EEP, bakes on mesh, PBR and the rest) | Not started |
| 4 | PhysX 5 in place of PhysX 3 | Not started |
| 5 | One C# WHIP asset server, built on WHIP-LRU | Not started |

Security and data-safety fixes go in at any time, whatever step we're on.

## 1. Licence audit and clean public base

- Keep `LICENSE` and every existing header exactly as they are.
- Add `NOTICE`, `THIRD-PARTY.md` and `CONTRIBUTORS.md`.
- Remove every bundled library without a licence file before the base snapshot is committed. Fetch what can be fetched as packages through the build.

## 2. Current .NET

Every project targets .NET Framework 4.7.1 today, which runs only on Windows.

- Move every project to the current SDK project format and the latest long-term-support .NET.
- Replace libraries that exist only for .NET Framework or only for Windows with current equivalents.
- Move Anaximander2 (map tiles) at the same time.
- Test on Windows and Linux; macOS where the native pieces allow.

## 3. Current viewer compatibility

Current viewers, Firestorm among them, expect features that Halcyon doesn't have. Today Halcyon has the older Windlight environment settings, legacy (normal and specular) materials, and an avatar appearance of 21 texture entries and 6 bakes, from before bakes on mesh.

The aim is that a current Firestorm or Second Life viewer works fully on a Halcyon region. Work in this order, each its own release:

1. **Bakes on mesh:** the extended avatar appearance (more texture entries and bake slots, including the universal wearable), so mesh bodies show baked skins and tattoos.
2. **Environment settings (EEP):** region and parcel day cycles, sky and water settings, settings items in inventory, and the scripting functions that go with them. Keep reading old Windlight settings so existing regions keep their look.
3. **PBR materials (glTF):** material assets and inventory items, applying them to faces and the per-face changes viewers send, and saving them in OAR and IAR backups.
4. **The rest current viewers rely on:** animated mesh, current mesh and texture fetching, and whatever the step 3 audit finds.

**First task for this step:** an audit of what a current Firestorm asks of the region (capabilities, messages, simulator features) against what Halcyon answers, written up as a list in this repository's issues. The audit decides the final list.

Every new feature must also survive OAR and IAR export, so worlds can carry it with them.

## 4. PhysX 5

- Rebuild the wrapper (`halcyon-physx`, `PhysX.net`) against PhysX 5, which NVIDIA released as open source under BSD-3-Clause.
- Build its native libraries for each system. Check which systems PhysX 5's own build supports.
- GPU acceleration stays optional; regions run physics on the processor.

## 5. One C# WHIP asset server

- Port the C++ WHIP server's storage and protocol handling to C#, on WHIP-LRU's code, as WHIP-LRU's author intended.
- Keep both notices (Apache-2.0 and MIT).
- Move the result to current .NET with the rest.

## Not planned

- Features beyond what current viewers already support.
- Links to other platforms or networks.
