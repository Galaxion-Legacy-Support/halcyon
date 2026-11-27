# Porting LSL functions from OpenSimulator

Halcyon is missing 128 LSL functions and has 26 more that are only stubs (see the [LSL compatibility tracking issue, #127](https://github.com/Galaxion-Legacy-Support/halcyon/issues/127)). OpenSimulator 0.9.3.1, mirrored in [Galaxion-Legacy-OpenSimulator-0.9.x](https://github.com/Galaxion-Legacy-Support/Galaxion-Legacy-OpenSimulator-0.9.x), already implements **87** of them. This page says which, where to find each one, and how much work porting it is.

## Carrying code across

- OpenSimulator is BSD-3-Clause. Halcyon's script API, `InWorldz/InWorldz.Phlox.Engine/LSLSystemAPI.cs`, was itself ported from OpenSimulator's `LSL_Api.cs` in 2011 and already carries OpenSimulator's copyright notice, so ported functions sit under the notice that is there. **Keep that notice as it is.** A new file holding ported code gets OpenSimulator's header too.
- **Name the source in the pull request:** OpenSimulator 0.9.3.1, `OpenSim/Region/ScriptEngine/Shared/Api/Implementation/LSL_Api.cs`, mirror commit `b391ca40`, and the function names.
- OpenSimulator's tree also contains `OpenSim/Addons/os-webrtc-janus`, which is MPL-2.0, not BSD. **Don't carry anything across from it.**
- Halcyon runs scripts in Phlox, whose types differ from OpenSimulator's (`LSL_List`, `LSL_Integer` and so on), so even a grade A function needs its types adapting. OpenSimulator's script delays (`SleepScript`, `ScriptSleep`) become Halcyon's own delays, and the function's entry in Phlox's function table (`Defaults.cs`) must be added too.
- Each port needs a test, and anything that stores data on objects must survive OAR and IAR export.

## Grades

| Grade | Meaning | Functions |
| --- | --- | --- |
| **A** port directly | Strings, lists, hashes or maths: needs nothing from the region. Adapt the types and port any helper it calls. | 16 |
| **B** port and adapt | Uses features Halcyon already has (sound, inventory, avatars, camera, teleport, permissions, physics), through OpenSimulator's own scene code, which differs from Halcyon's. | 37 |
| **C** feature first | Needs a feature Halcyon doesn't have yet. OpenSimulator's code shows how it works, but the feature comes before the function. | 34 |

The grades come from reading what each function uses, so treat them as a guide: a B can turn out harder once you're in it.

## Where to start

- **Grade A first.** 14 of the 16 belong to [#110](https://github.com/Galaxion-Legacy-Support/halcyon/issues/110) (strings, lists and hashing), the good first issue; the other two are `llLinear2sRGB` ([#108](https://github.com/Galaxion-Legacy-Support/halcyon/issues/108)) and `llGetSPMaxMemory` ([#42](https://github.com/Galaxion-Legacy-Support/halcyon/issues/42)).
- **Then the B groups with the most to gain:** link sounds ([#112](https://github.com/Galaxion-Legacy-Support/halcyon/issues/112)), notecards and inventory ([#111](https://github.com/Galaxion-Legacy-Support/halcyon/issues/111)), agents ([#115](https://github.com/Galaxion-Legacy-Support/halcyon/issues/115)) and camera ([#116](https://github.com/Galaxion-Legacy-Support/halcyon/issues/116)).
- **Grade C needs a decision on each feature.** Linkset data ([#87](https://github.com/Galaxion-Legacy-Support/halcyon/issues/87)) is the most used of them in current scripts; it needs storage on the object that survives OAR and IAR export.

## By issue


### #110: string, list and hashing functions (14 of 16 in OpenSimulator)

| Function | In Halcyon | Grade | OpenSimulator 0.9.3.1 | Needs first |
| --- | --- | --- | --- | --- |
| `llChar` | missing | **A** port directly | [line 19134](https://github.com/Galaxion-Legacy-Support/Galaxion-Legacy-OpenSimulator-0.9.x/blob/b391ca40e024432f179591da553a13fc89d47a36/OpenSim/Region/ScriptEngine/Shared/Api/Implementation/LSL_Api.cs#L19134) (13 lines) |  |
| `llComputeHash` | missing | **A** port directly | [line 19536](https://github.com/Galaxion-Legacy-Support/Galaxion-Legacy-OpenSimulator-0.9.x/blob/b391ca40e024432f179591da553a13fc89d47a36/OpenSim/Region/ScriptEngine/Shared/Api/Implementation/LSL_Api.cs#L19536) (59 lines) |  |
| `llHMAC` | missing | **A** port directly | [line 19931](https://github.com/Galaxion-Legacy-Support/Galaxion-Legacy-OpenSimulator-0.9.x/blob/b391ca40e024432f179591da553a13fc89d47a36/OpenSim/Region/ScriptEngine/Shared/Api/Implementation/LSL_Api.cs#L19931) (51 lines) |  |
| `llHash` | missing | **A** port directly | [line 19196](https://github.com/Galaxion-Legacy-Support/Galaxion-Legacy-OpenSimulator-0.9.x/blob/b391ca40e024432f179591da553a13fc89d47a36/OpenSim/Region/ScriptEngine/Shared/Api/Implementation/LSL_Api.cs#L19196) (36 lines) |  |
| `llList2ListSlice` | missing | **A** port directly | [line 6318](https://github.com/Galaxion-Legacy-Support/Galaxion-Legacy-OpenSimulator-0.9.x/blob/b391ca40e024432f179591da553a13fc89d47a36/OpenSim/Region/ScriptEngine/Shared/Api/Implementation/LSL_Api.cs#L6318) (72 lines) |  |
| `llListFindListNext` | missing | **A** port directly | [line 6577](https://github.com/Galaxion-Legacy-Support/Galaxion-Legacy-OpenSimulator-0.9.x/blob/b391ca40e024432f179591da553a13fc89d47a36/OpenSim/Region/ScriptEngine/Shared/Api/Implementation/LSL_Api.cs#L6577) (84 lines) |  |
| `llListFindStrided` | missing | **A** port directly | [line 6661](https://github.com/Galaxion-Legacy-Support/Galaxion-Legacy-OpenSimulator-0.9.x/blob/b391ca40e024432f179591da553a13fc89d47a36/OpenSim/Region/ScriptEngine/Shared/Api/Implementation/LSL_Api.cs#L6661) (61 lines) |  |
| `llListSortStrided` | missing | **A** port directly | [line 5908](https://github.com/Galaxion-Legacy-Support/Galaxion-Legacy-OpenSimulator-0.9.x/blob/b391ca40e024432f179591da553a13fc89d47a36/OpenSim/Region/ScriptEngine/Shared/Api/Implementation/LSL_Api.cs#L5908) (5 lines) |  |
| `llOrd` | missing | **A** port directly | [line 19147](https://github.com/Galaxion-Legacy-Support/Galaxion-Legacy-OpenSimulator-0.9.x/blob/b391ca40e024432f179591da553a13fc89d47a36/OpenSim/Region/ScriptEngine/Shared/Api/Implementation/LSL_Api.cs#L19147) (49 lines) |  |
| `llReplaceSubString` | missing | **A** port directly | [line 19232](https://github.com/Galaxion-Legacy-Support/Galaxion-Legacy-OpenSimulator-0.9.x/blob/b391ca40e024432f179591da553a13fc89d47a36/OpenSim/Region/ScriptEngine/Shared/Api/Implementation/LSL_Api.cs#L19232) (35 lines) |  |
| `llSHA256String` | missing | **A** port directly | [line 8540](https://github.com/Galaxion-Legacy-Support/Galaxion-Legacy-OpenSimulator-0.9.x/blob/b391ca40e024432f179591da553a13fc89d47a36/OpenSim/Region/ScriptEngine/Shared/Api/Implementation/LSL_Api.cs#L8540) (12 lines) |  |
| `llXorBase64` | missing | **A** port directly | [line 14516](https://github.com/Galaxion-Legacy-Support/Galaxion-Legacy-OpenSimulator-0.9.x/blob/b391ca40e024432f179591da553a13fc89d47a36/OpenSim/Region/ScriptEngine/Shared/Api/Implementation/LSL_Api.cs#L14516) (40 lines) |  |
| `llXorBase64Strings` | stub | **A** port directly | [line 14341](https://github.com/Galaxion-Legacy-Support/Galaxion-Legacy-OpenSimulator-0.9.x/blob/b391ca40e024432f179591da553a13fc89d47a36/OpenSim/Region/ScriptEngine/Shared/Api/Implementation/LSL_Api.cs#L14341) (85 lines) |  |
| `llsRGB2Linear` | missing | **A** port directly | [line 19272](https://github.com/Galaxion-Legacy-Support/Galaxion-Legacy-OpenSimulator-0.9.x/blob/b391ca40e024432f179591da553a13fc89d47a36/OpenSim/Region/ScriptEngine/Shared/Api/Implementation/LSL_Api.cs#L19272) (5 lines) |  |
| `llSignRSA` | missing |  | not in OpenSimulator |  |
| `llVerifyRSA` | missing |  | not in OpenSimulator |  |

### #87: linkset data functions (13 of 13 in OpenSimulator)

| Function | In Halcyon | Grade | OpenSimulator 0.9.3.1 | Needs first |
| --- | --- | --- | --- | --- |
| `llLinksetDataAvailable` | missing | **C** feature first | [line 19277](https://github.com/Galaxion-Legacy-Support/Galaxion-Legacy-OpenSimulator-0.9.x/blob/b391ca40e024432f179591da553a13fc89d47a36/OpenSim/Region/ScriptEngine/Shared/Api/Implementation/LSL_Api.cs#L19277) (8 lines) | linkset data storage, saved with the object and in OAR and IAR archives |
| `llLinksetDataCountFound` | missing | **C** feature first | [line 19432](https://github.com/Galaxion-Legacy-Support/Galaxion-Legacy-OpenSimulator-0.9.x/blob/b391ca40e024432f179591da553a13fc89d47a36/OpenSim/Region/ScriptEngine/Shared/Api/Implementation/LSL_Api.cs#L19432) (8 lines) | linkset data storage, saved with the object and in OAR and IAR archives |
| `llLinksetDataCountKeys` | missing | **C** feature first | [line 19285](https://github.com/Galaxion-Legacy-Support/Galaxion-Legacy-OpenSimulator-0.9.x/blob/b391ca40e024432f179591da553a13fc89d47a36/OpenSim/Region/ScriptEngine/Shared/Api/Implementation/LSL_Api.cs#L19285) (8 lines) | linkset data storage, saved with the object and in OAR and IAR archives |
| `llLinksetDataDelete` | missing | **C** feature first | [line 19309](https://github.com/Galaxion-Legacy-Support/Galaxion-Legacy-OpenSimulator-0.9.x/blob/b391ca40e024432f179591da553a13fc89d47a36/OpenSim/Region/ScriptEngine/Shared/Api/Implementation/LSL_Api.cs#L19309) (16 lines) | linkset data storage, saved with the object and in OAR and IAR archives |
| `llLinksetDataDeleteFound` | missing | **C** feature first | [line 19416](https://github.com/Galaxion-Legacy-Support/Galaxion-Legacy-OpenSimulator-0.9.x/blob/b391ca40e024432f179591da553a13fc89d47a36/OpenSim/Region/ScriptEngine/Shared/Api/Implementation/LSL_Api.cs#L19416) (16 lines) | linkset data storage, saved with the object and in OAR and IAR archives |
| `llLinksetDataDeleteProtected` | missing | **C** feature first | [line 19325](https://github.com/Galaxion-Legacy-Support/Galaxion-Legacy-OpenSimulator-0.9.x/blob/b391ca40e024432f179591da553a13fc89d47a36/OpenSim/Region/ScriptEngine/Shared/Api/Implementation/LSL_Api.cs#L19325) (16 lines) | linkset data storage, saved with the object and in OAR and IAR archives |
| `llLinksetDataFindKeys` | missing | **C** feature first | [line 19448](https://github.com/Galaxion-Legacy-Support/Galaxion-Legacy-OpenSimulator-0.9.x/blob/b391ca40e024432f179591da553a13fc89d47a36/OpenSim/Region/ScriptEngine/Shared/Api/Implementation/LSL_Api.cs#L19448) (8 lines) | linkset data storage, saved with the object and in OAR and IAR archives |
| `llLinksetDataListKeys` | missing | **C** feature first | [line 19440](https://github.com/Galaxion-Legacy-Support/Galaxion-Legacy-OpenSimulator-0.9.x/blob/b391ca40e024432f179591da553a13fc89d47a36/OpenSim/Region/ScriptEngine/Shared/Api/Implementation/LSL_Api.cs#L19440) (8 lines) | linkset data storage, saved with the object and in OAR and IAR archives |
| `llLinksetDataRead` | missing | **C** feature first | [line 19293](https://github.com/Galaxion-Legacy-Support/Galaxion-Legacy-OpenSimulator-0.9.x/blob/b391ca40e024432f179591da553a13fc89d47a36/OpenSim/Region/ScriptEngine/Shared/Api/Implementation/LSL_Api.cs#L19293) (8 lines) | linkset data storage, saved with the object and in OAR and IAR archives |
| `llLinksetDataReadProtected` | missing | **C** feature first | [line 19301](https://github.com/Galaxion-Legacy-Support/Galaxion-Legacy-OpenSimulator-0.9.x/blob/b391ca40e024432f179591da553a13fc89d47a36/OpenSim/Region/ScriptEngine/Shared/Api/Implementation/LSL_Api.cs#L19301) (8 lines) | linkset data storage, saved with the object and in OAR and IAR archives |
| `llLinksetDataReset` | missing | **C** feature first | [line 19341](https://github.com/Galaxion-Legacy-Support/Galaxion-Legacy-OpenSimulator-0.9.x/blob/b391ca40e024432f179591da553a13fc89d47a36/OpenSim/Region/ScriptEngine/Shared/Api/Implementation/LSL_Api.cs#L19341) (15 lines) | linkset data storage, saved with the object and in OAR and IAR archives |
| `llLinksetDataWrite` | missing | **C** feature first | [line 19356](https://github.com/Galaxion-Legacy-Support/Galaxion-Legacy-OpenSimulator-0.9.x/blob/b391ca40e024432f179591da553a13fc89d47a36/OpenSim/Region/ScriptEngine/Shared/Api/Implementation/LSL_Api.cs#L19356) (30 lines) | linkset data storage, saved with the object and in OAR and IAR archives |
| `llLinksetDataWriteProtected` | missing | **C** feature first | [line 19386](https://github.com/Galaxion-Legacy-Support/Galaxion-Legacy-OpenSimulator-0.9.x/blob/b391ca40e024432f179591da553a13fc89d47a36/OpenSim/Region/ScriptEngine/Shared/Api/Implementation/LSL_Api.cs#L19386) (30 lines) | linkset data storage, saved with the object and in OAR and IAR archives |

### #107: environment functions (day cycles, sun and moon) (11 of 15 in OpenSimulator)

| Function | In Halcyon | Grade | OpenSimulator 0.9.3.1 | Needs first |
| --- | --- | --- | --- | --- |
| `llGetDayLength` | missing | **C** feature first | [line 18245](https://github.com/Galaxion-Legacy-Support/Galaxion-Legacy-OpenSimulator-0.9.x/blob/b391ca40e024432f179591da553a13fc89d47a36/OpenSim/Region/ScriptEngine/Shared/Api/Implementation/LSL_Api.cs#L18245) (9 lines) | environment day cycles (OpenSimulator's environment module) |
| `llGetDayOffset` | missing | **C** feature first | [line 18263](https://github.com/Galaxion-Legacy-Support/Galaxion-Legacy-OpenSimulator-0.9.x/blob/b391ca40e024432f179591da553a13fc89d47a36/OpenSim/Region/ScriptEngine/Shared/Api/Implementation/LSL_Api.cs#L18263) (9 lines) | environment day cycles (OpenSimulator's environment module) |
| `llGetMoonDirection` | missing | **C** feature first | [line 18300](https://github.com/Galaxion-Legacy-Support/Galaxion-Legacy-OpenSimulator-0.9.x/blob/b391ca40e024432f179591da553a13fc89d47a36/OpenSim/Region/ScriptEngine/Shared/Api/Implementation/LSL_Api.cs#L18300) (9 lines) | environment day cycles (OpenSimulator's environment module) |
| `llGetMoonRotation` | missing | **C** feature first | [line 18336](https://github.com/Galaxion-Legacy-Support/Galaxion-Legacy-OpenSimulator-0.9.x/blob/b391ca40e024432f179591da553a13fc89d47a36/OpenSim/Region/ScriptEngine/Shared/Api/Implementation/LSL_Api.cs#L18336) (8 lines) | environment day cycles (OpenSimulator's environment module) |
| `llGetRegionDayLength` | missing | **C** feature first | [line 18254](https://github.com/Galaxion-Legacy-Support/Galaxion-Legacy-OpenSimulator-0.9.x/blob/b391ca40e024432f179591da553a13fc89d47a36/OpenSim/Region/ScriptEngine/Shared/Api/Implementation/LSL_Api.cs#L18254) (9 lines) | environment day cycles (OpenSimulator's environment module) |
| `llGetRegionDayOffset` | missing | **C** feature first | [line 18272](https://github.com/Galaxion-Legacy-Support/Galaxion-Legacy-OpenSimulator-0.9.x/blob/b391ca40e024432f179591da553a13fc89d47a36/OpenSim/Region/ScriptEngine/Shared/Api/Implementation/LSL_Api.cs#L18272) (9 lines) | environment day cycles (OpenSimulator's environment module) |
| `llGetRegionMoonDirection` | missing | **C** feature first | [line 18309](https://github.com/Galaxion-Legacy-Support/Galaxion-Legacy-OpenSimulator-0.9.x/blob/b391ca40e024432f179591da553a13fc89d47a36/OpenSim/Region/ScriptEngine/Shared/Api/Implementation/LSL_Api.cs#L18309) (10 lines) | environment day cycles (OpenSimulator's environment module) |
| `llGetRegionMoonRotation` | missing | **C** feature first | [line 18344](https://github.com/Galaxion-Legacy-Support/Galaxion-Legacy-OpenSimulator-0.9.x/blob/b391ca40e024432f179591da553a13fc89d47a36/OpenSim/Region/ScriptEngine/Shared/Api/Implementation/LSL_Api.cs#L18344) (9 lines) | environment day cycles (OpenSimulator's environment module) |
| `llGetRegionSunDirection` | missing | **C** feature first | [line 18290](https://github.com/Galaxion-Legacy-Support/Galaxion-Legacy-OpenSimulator-0.9.x/blob/b391ca40e024432f179591da553a13fc89d47a36/OpenSim/Region/ScriptEngine/Shared/Api/Implementation/LSL_Api.cs#L18290) (10 lines) | environment day cycles (OpenSimulator's environment module) |
| `llGetRegionSunRotation` | missing | **C** feature first | [line 18327](https://github.com/Galaxion-Legacy-Support/Galaxion-Legacy-OpenSimulator-0.9.x/blob/b391ca40e024432f179591da553a13fc89d47a36/OpenSim/Region/ScriptEngine/Shared/Api/Implementation/LSL_Api.cs#L18327) (9 lines) | environment day cycles (OpenSimulator's environment module) |
| `llGetSunRotation` | missing | **C** feature first | [line 18319](https://github.com/Galaxion-Legacy-Support/Galaxion-Legacy-OpenSimulator-0.9.x/blob/b391ca40e024432f179591da553a13fc89d47a36/OpenSim/Region/ScriptEngine/Shared/Api/Implementation/LSL_Api.cs#L18319) (8 lines) | environment day cycles (OpenSimulator's environment module) |
| `llGetEnvironment` | missing |  | not in OpenSimulator |  |
| `llGetRegionTimeOfDay` | missing |  | not in OpenSimulator |  |
| `llReplaceEnvironment` | missing |  | not in OpenSimulator |  |
| `llSetEnvironment` | missing |  | not in OpenSimulator |  |

### #112: link sound functions and unfinished sound functions (9 of 9 in OpenSimulator)

| Function | In Halcyon | Grade | OpenSimulator 0.9.3.1 | Needs first |
| --- | --- | --- | --- | --- |
| `llLinkAdjustSoundVolume` | missing | **B** port and adapt | [line 7033](https://github.com/Galaxion-Legacy-Support/Galaxion-Legacy-OpenSimulator-0.9.x/blob/b391ca40e024432f179591da553a13fc89d47a36/OpenSim/Region/ScriptEngine/Shared/Api/Implementation/LSL_Api.cs#L7033) (8 lines) |  |
| `llLinkPlaySound` | missing | **B** port and adapt | [line 2852](https://github.com/Galaxion-Legacy-Support/Galaxion-Legacy-OpenSimulator-0.9.x/blob/b391ca40e024432f179591da553a13fc89d47a36/OpenSim/Region/ScriptEngine/Shared/Api/Implementation/LSL_Api.cs#L2852) (40 lines) |  |
| `llLinkSetSoundQueueing` | missing | **B** port and adapt | [line 17478](https://github.com/Galaxion-Legacy-Support/Galaxion-Legacy-OpenSimulator-0.9.x/blob/b391ca40e024432f179591da553a13fc89d47a36/OpenSim/Region/ScriptEngine/Shared/Api/Implementation/LSL_Api.cs#L17478) (9 lines) |  |
| `llLinkSetSoundRadius` | missing | **B** port and adapt | [line 7046](https://github.com/Galaxion-Legacy-Support/Galaxion-Legacy-OpenSimulator-0.9.x/blob/b391ca40e024432f179591da553a13fc89d47a36/OpenSim/Region/ScriptEngine/Shared/Api/Implementation/LSL_Api.cs#L7046) (6 lines) |  |
| `llLinkStopSound` | missing | **B** port and adapt | [line 2960](https://github.com/Galaxion-Legacy-Support/Galaxion-Legacy-OpenSimulator-0.9.x/blob/b391ca40e024432f179591da553a13fc89d47a36/OpenSim/Region/ScriptEngine/Shared/Api/Implementation/LSL_Api.cs#L2960) (9 lines) |  |
| `llLoopSoundMaster` | stub | **B** port and adapt | [line 2905](https://github.com/Galaxion-Legacy-Support/Galaxion-Legacy-OpenSimulator-0.9.x/blob/b391ca40e024432f179591da553a13fc89d47a36/OpenSim/Region/ScriptEngine/Shared/Api/Implementation/LSL_Api.cs#L2905) (12 lines) |  |
| `llLoopSoundSlave` | stub | **B** port and adapt | [line 2917](https://github.com/Galaxion-Legacy-Support/Galaxion-Legacy-OpenSimulator-0.9.x/blob/b391ca40e024432f179591da553a13fc89d47a36/OpenSim/Region/ScriptEngine/Shared/Api/Implementation/LSL_Api.cs#L2917) (12 lines) |  |
| `llPlaySoundSlave` | stub | **B** port and adapt | [line 2929](https://github.com/Galaxion-Legacy-Support/Galaxion-Legacy-OpenSimulator-0.9.x/blob/b391ca40e024432f179591da553a13fc89d47a36/OpenSim/Region/ScriptEngine/Shared/Api/Implementation/LSL_Api.cs#L2929) (13 lines) |  |
| `llTriggerSoundLimited` | stub | **B** port and adapt | [line 7227](https://github.com/Galaxion-Legacy-Support/Galaxion-Legacy-OpenSimulator-0.9.x/blob/b391ca40e024432f179591da553a13fc89d47a36/OpenSim/Region/ScriptEngine/Shared/Api/Implementation/LSL_Api.cs#L7227) (8 lines) |  |

### #115: agent functions (5 of 6 in OpenSimulator)

| Function | In Halcyon | Grade | OpenSimulator 0.9.3.1 | Needs first |
| --- | --- | --- | --- | --- |
| `llGetVisualParams` | missing | **B** port and adapt | [line 5103](https://github.com/Galaxion-Legacy-Support/Galaxion-Legacy-OpenSimulator-0.9.x/blob/b391ca40e024432f179591da553a13fc89d47a36/OpenSim/Region/ScriptEngine/Shared/Api/Implementation/LSL_Api.cs#L5103) (45 lines) |  |
| `llIsFriend` | missing | **B** port and adapt | [line 19456](https://github.com/Galaxion-Legacy-Support/Galaxion-Legacy-OpenSimulator-0.9.x/blob/b391ca40e024432f179591da553a13fc89d47a36/OpenSim/Region/ScriptEngine/Shared/Api/Implementation/LSL_Api.cs#L19456) (25 lines) |  |
| `llMapBeacon` | missing | **B** port and adapt | [line 14002](https://github.com/Galaxion-Legacy-Support/Galaxion-Legacy-OpenSimulator-0.9.x/blob/b391ca40e024432f179591da553a13fc89d47a36/OpenSim/Region/ScriptEngine/Shared/Api/Implementation/LSL_Api.cs#L14002) (64 lines) |  |
| `llName2Key` | missing | **B** port and adapt | [line 7067](https://github.com/Galaxion-Legacy-Support/Galaxion-Legacy-OpenSimulator-0.9.x/blob/b391ca40e024432f179591da553a13fc89d47a36/OpenSim/Region/ScriptEngine/Shared/Api/Implementation/LSL_Api.cs#L7067) (26 lines) |  |
| `llRequestUserKey` | missing | **B** port and adapt | [line 7093](https://github.com/Galaxion-Legacy-Support/Galaxion-Legacy-OpenSimulator-0.9.x/blob/b391ca40e024432f179591da553a13fc89d47a36/OpenSim/Region/ScriptEngine/Shared/Api/Implementation/LSL_Api.cs#L7093) (89 lines) |  |
| `llSetAgentRot` | missing |  | not in OpenSimulator |  |

### #108: PBR (glTF) material functions (4 of 6 in OpenSimulator)

| Function | In Halcyon | Grade | OpenSimulator 0.9.3.1 | Needs first |
| --- | --- | --- | --- | --- |
| `llLinear2sRGB` | missing | **A** port directly | [line 19267](https://github.com/Galaxion-Legacy-Support/Galaxion-Legacy-OpenSimulator-0.9.x/blob/b391ca40e024432f179591da553a13fc89d47a36/OpenSim/Region/ScriptEngine/Shared/Api/Implementation/LSL_Api.cs#L19267) (5 lines) |  |
| `llGetRenderMaterial` | missing | **C** feature first | [line 19595](https://github.com/Galaxion-Legacy-Support/Galaxion-Legacy-OpenSimulator-0.9.x/blob/b391ca40e024432f179591da553a13fc89d47a36/OpenSim/Region/ScriptEngine/Shared/Api/Implementation/LSL_Api.cs#L19595) (5 lines) | PBR (glTF) materials |
| `llIsLinkGLTFMaterial` | missing | **C** feature first | [line 19649](https://github.com/Galaxion-Legacy-Support/Galaxion-Legacy-OpenSimulator-0.9.x/blob/b391ca40e024432f179591da553a13fc89d47a36/OpenSim/Region/ScriptEngine/Shared/Api/Implementation/LSL_Api.cs#L19649) (47 lines) | PBR (glTF) materials |
| `llSetRenderMaterial` | missing | **C** feature first | [line 19696](https://github.com/Galaxion-Legacy-Support/Galaxion-Legacy-OpenSimulator-0.9.x/blob/b391ca40e024432f179591da553a13fc89d47a36/OpenSim/Region/ScriptEngine/Shared/Api/Implementation/LSL_Api.cs#L19696) (117 lines) | PBR (glTF) materials |
| `llSetLinkGLTFOverrides` | missing |  | not in OpenSimulator |  |
| `llSetLinkRenderMaterial` | missing |  | not in OpenSimulator |  |

### #113: rezzing and object functions (4 of 7 in OpenSimulator)

| Function | In Halcyon | Grade | OpenSimulator 0.9.3.1 | Needs first |
| --- | --- | --- | --- | --- |
| `llDerezObject` | missing | **B** port and adapt | [line 19481](https://github.com/Galaxion-Legacy-Support/Galaxion-Legacy-OpenSimulator-0.9.x/blob/b391ca40e024432f179591da553a13fc89d47a36/OpenSim/Region/ScriptEngine/Shared/Api/Implementation/LSL_Api.cs#L19481) (31 lines) |  |
| `llGetObjectLinkKey` | missing | **B** port and adapt | [line 4902](https://github.com/Galaxion-Legacy-Support/Galaxion-Legacy-OpenSimulator-0.9.x/blob/b391ca40e024432f179591da553a13fc89d47a36/OpenSim/Region/ScriptEngine/Shared/Api/Implementation/LSL_Api.cs#L4902) (41 lines) |  |
| `llGetStartString` | missing | **C** feature first | [line 4462](https://github.com/Galaxion-Legacy-Support/Galaxion-Legacy-OpenSimulator-0.9.x/blob/b391ca40e024432f179591da553a13fc89d47a36/OpenSim/Region/ScriptEngine/Shared/Api/Implementation/LSL_Api.cs#L4462) (7 lines) | rezzing with parameters (its 500-line rez path, and a start string kept on the object) |
| `llRezObjectWithParams` | missing | **C** feature first | [line 3359](https://github.com/Galaxion-Legacy-Support/Galaxion-Legacy-OpenSimulator-0.9.x/blob/b391ca40e024432f179591da553a13fc89d47a36/OpenSim/Region/ScriptEngine/Shared/Api/Implementation/LSL_Api.cs#L3359) (508 lines) | rezzing with parameters (its 500-line rez path, and a start string kept on the object) |
| `llDetectedRezzer` | missing |  | not in OpenSimulator |  |
| `llGetAttachedListFiltered` | missing |  | not in OpenSimulator |  |
| `llTransferOwnership` | missing |  | not in OpenSimulator |  |

### #39: resizer functions (3 of 3 in OpenSimulator)

| Function | In Halcyon | Grade | OpenSimulator 0.9.3.1 | Needs first |
| --- | --- | --- | --- | --- |
| `llGetMaxScaleFactor` | missing | **B** port and adapt | [line 1596](https://github.com/Galaxion-Legacy-Support/Galaxion-Legacy-OpenSimulator-0.9.x/blob/b391ca40e024432f179591da553a13fc89d47a36/OpenSim/Region/ScriptEngine/Shared/Api/Implementation/LSL_Api.cs#L1596) (10 lines) |  |
| `llGetMinScaleFactor` | missing | **B** port and adapt | [line 1606](https://github.com/Galaxion-Legacy-Support/Galaxion-Legacy-OpenSimulator-0.9.x/blob/b391ca40e024432f179591da553a13fc89d47a36/OpenSim/Region/ScriptEngine/Shared/Api/Implementation/LSL_Api.cs#L1606) (10 lines) |  |
| `llScaleByFactor` | missing | **B** port and adapt | [line 1575](https://github.com/Galaxion-Legacy-Support/Galaxion-Legacy-OpenSimulator-0.9.x/blob/b391ca40e024432f179591da553a13fc89d47a36/OpenSim/Region/ScriptEngine/Shared/Api/Implementation/LSL_Api.cs#L1575) (21 lines) |  |

### #44: Animesh object animations (3 of 3 in OpenSimulator)

| Function | In Halcyon | Grade | OpenSimulator 0.9.3.1 | Needs first |
| --- | --- | --- | --- | --- |
| `llGetObjectAnimationNames` | missing | **C** feature first | [line 4421](https://github.com/Galaxion-Legacy-Support/Galaxion-Legacy-OpenSimulator-0.9.x/blob/b391ca40e024432f179591da553a13fc89d47a36/OpenSim/Region/ScriptEngine/Shared/Api/Implementation/LSL_Api.cs#L4421) (12 lines) | animated objects (animesh) |
| `llStartObjectAnimation` | missing | **C** feature first | [line 4406](https://github.com/Galaxion-Legacy-Support/Galaxion-Legacy-OpenSimulator-0.9.x/blob/b391ca40e024432f179591da553a13fc89d47a36/OpenSim/Region/ScriptEngine/Shared/Api/Implementation/LSL_Api.cs#L4406) (10 lines) | animated objects (animesh) |
| `llStopObjectAnimation` | missing | **C** feature first | [line 4416](https://github.com/Galaxion-Legacy-Support/Galaxion-Legacy-OpenSimulator-0.9.x/blob/b391ca40e024432f179591da553a13fc89d47a36/OpenSim/Region/ScriptEngine/Shared/Api/Implementation/LSL_Api.cs#L4416) (5 lines) | animated objects (animesh) |

### #109: animation overrides (3 of 3 in OpenSimulator)

| Function | In Halcyon | Grade | OpenSimulator 0.9.3.1 | Needs first |
| --- | --- | --- | --- | --- |
| `llGetAnimationOverride` | stub | **B** port and adapt | [line 18192](https://github.com/Galaxion-Legacy-Support/Galaxion-Legacy-OpenSimulator-0.9.x/blob/b391ca40e024432f179591da553a13fc89d47a36/OpenSim/Region/ScriptEngine/Shared/Api/Implementation/LSL_Api.cs#L18192) (53 lines) |  |
| `llResetAnimationOverride` | stub | **B** port and adapt | [line 18149](https://github.com/Galaxion-Legacy-Support/Galaxion-Legacy-OpenSimulator-0.9.x/blob/b391ca40e024432f179591da553a13fc89d47a36/OpenSim/Region/ScriptEngine/Shared/Api/Implementation/LSL_Api.cs#L18149) (43 lines) |  |
| `llSetAnimationOverride` | stub | **B** port and adapt | [line 18094](https://github.com/Galaxion-Legacy-Support/Galaxion-Legacy-OpenSimulator-0.9.x/blob/b391ca40e024432f179591da553a13fc89d47a36/OpenSim/Region/ScriptEngine/Shared/Api/Implementation/LSL_Api.cs#L18094) (55 lines) |  |

### #111: notecard and inventory functions (3 of 6 in OpenSimulator)

| Function | In Halcyon | Grade | OpenSimulator 0.9.3.1 | Needs first |
| --- | --- | --- | --- | --- |
| `llGetInventoryAcquireTime` | missing | **B** port and adapt | [line 13184](https://github.com/Galaxion-Legacy-Support/Galaxion-Legacy-OpenSimulator-0.9.x/blob/b391ca40e024432f179591da553a13fc89d47a36/OpenSim/Region/ScriptEngine/Shared/Api/Implementation/LSL_Api.cs#L13184) (13 lines) |  |
| `llGetInventoryDesc` | missing | **B** port and adapt | [line 13827](https://github.com/Galaxion-Legacy-Support/Galaxion-Legacy-OpenSimulator-0.9.x/blob/b391ca40e024432f179591da553a13fc89d47a36/OpenSim/Region/ScriptEngine/Shared/Api/Implementation/LSL_Api.cs#L13827) (12 lines) |  |
| `llGetNotecardLineSync` | missing | **B** port and adapt | [line 15673](https://github.com/Galaxion-Legacy-Support/Galaxion-Legacy-OpenSimulator-0.9.x/blob/b391ca40e024432f179591da553a13fc89d47a36/OpenSim/Region/ScriptEngine/Shared/Api/Implementation/LSL_Api.cs#L15673) (27 lines) |  |
| `llFindNotecardTextCount` | missing |  | not in OpenSimulator |  |
| `llFindNotecardTextSync` | missing |  | not in OpenSimulator |  |
| `llGiveAgentInventory` | missing |  | not in OpenSimulator |  |

### #116: camera, HUD and game controller functions (3 of 4 in OpenSimulator)

| Function | In Halcyon | Grade | OpenSimulator 0.9.3.1 | Needs first |
| --- | --- | --- | --- | --- |
| `llGetCameraAspect` | missing | **B** port and adapt | [line 13926](https://github.com/Galaxion-Legacy-Support/Galaxion-Legacy-OpenSimulator-0.9.x/blob/b391ca40e024432f179591da553a13fc89d47a36/OpenSim/Region/ScriptEngine/Shared/Api/Implementation/LSL_Api.cs#L13926) (20 lines) |  |
| `llGetCameraFOV` | missing | **B** port and adapt | [line 13907](https://github.com/Galaxion-Legacy-Support/Galaxion-Legacy-OpenSimulator-0.9.x/blob/b391ca40e024432f179591da553a13fc89d47a36/OpenSim/Region/ScriptEngine/Shared/Api/Implementation/LSL_Api.cs#L13907) (19 lines) |  |
| `llWorldPosToHUD` | missing | **B** port and adapt | [line 19813](https://github.com/Galaxion-Legacy-Support/Galaxion-Legacy-OpenSimulator-0.9.x/blob/b391ca40e024432f179591da553a13fc89d47a36/OpenSim/Region/ScriptEngine/Shared/Api/Implementation/LSL_Api.cs#L19813) (66 lines) |  |
| `llOpenFloater` | missing |  | not in OpenSimulator |  |

### #41: god-mode functions (2 of 2 in OpenSimulator)

| Function | In Halcyon | Grade | OpenSimulator 0.9.3.1 | Needs first |
| --- | --- | --- | --- | --- |
| `llGodLikeRezObject` | stub | **B** port and adapt | [line 17498](https://github.com/Galaxion-Legacy-Support/Galaxion-Legacy-OpenSimulator-0.9.x/blob/b391ca40e024432f179591da553a13fc89d47a36/OpenSim/Region/ScriptEngine/Shared/Api/Implementation/LSL_Api.cs#L17498) (52 lines) |  |
| `llSetInventoryPermMask` | stub | **B** port and adapt | [line 13122](https://github.com/Galaxion-Legacy-Support/Galaxion-Legacy-OpenSimulator-0.9.x/blob/b391ca40e024432f179591da553a13fc89d47a36/OpenSim/Region/ScriptEngine/Shared/Api/Implementation/LSL_Api.cs#L13122) (49 lines) |  |

### #59: llTeleportAgentGlobalCoords (2 of 2 in OpenSimulator)

| Function | In Halcyon | Grade | OpenSimulator 0.9.3.1 | Needs first |
| --- | --- | --- | --- | --- |
| `llTeleportAgent` | missing | **B** port and adapt | [line 5336](https://github.com/Galaxion-Legacy-Support/Galaxion-Legacy-OpenSimulator-0.9.x/blob/b391ca40e024432f179591da553a13fc89d47a36/OpenSim/Region/ScriptEngine/Shared/Api/Implementation/LSL_Api.cs#L5336) (43 lines) |  |
| `llTeleportAgentGlobalCoords` | missing | **B** port and adapt | [line 5379](https://github.com/Galaxion-Legacy-Support/Galaxion-Legacy-OpenSimulator-0.9.x/blob/b391ca40e024432f179591da553a13fc89d47a36/OpenSim/Region/ScriptEngine/Shared/Api/Implementation/LSL_Api.cs#L5379) (27 lines) |  |

### #104: damage and health functions (combat) (2 of 5 in OpenSimulator)

| Function | In Halcyon | Grade | OpenSimulator 0.9.3.1 | Needs first |
| --- | --- | --- | --- | --- |
| `llGetHealth` | missing | **C** feature first | [line 5303](https://github.com/Galaxion-Legacy-Support/Galaxion-Legacy-OpenSimulator-0.9.x/blob/b391ca40e024432f179591da553a13fc89d47a36/OpenSim/Region/ScriptEngine/Shared/Api/Implementation/LSL_Api.cs#L5303) (11 lines) | damage and health (combat) |
| `llSetDamage` | stub | **C** feature first | [line 5298](https://github.com/Galaxion-Legacy-Support/Galaxion-Legacy-OpenSimulator-0.9.x/blob/b391ca40e024432f179591da553a13fc89d47a36/OpenSim/Region/ScriptEngine/Shared/Api/Implementation/LSL_Api.cs#L5298) (5 lines) | damage and health (combat) |
| `llAdjustDamage` | missing |  | not in OpenSimulator |  |
| `llDamage` | missing |  | not in OpenSimulator |  |
| `llDetectedDamage` | missing |  | not in OpenSimulator |  |

### #117: region functions (2 of 3 in OpenSimulator)

| Function | In Halcyon | Grade | OpenSimulator 0.9.3.1 | Needs first |
| --- | --- | --- | --- | --- |
| `llGetSimStats` | missing | **B** port and adapt | [line 13212](https://github.com/Galaxion-Legacy-Support/Galaxion-Legacy-OpenSimulator-0.9.x/blob/b391ca40e024432f179591da553a13fc89d47a36/OpenSim/Region/ScriptEngine/Shared/Api/Implementation/LSL_Api.cs#L13212) (35 lines) |  |
| `llTargetedEmail` | missing | **B** port and adapt | [line 4224](https://github.com/Galaxion-Legacy-Support/Galaxion-Legacy-OpenSimulator-0.9.x/blob/b391ca40e024432f179591da553a13fc89d47a36/OpenSim/Region/ScriptEngine/Shared/Api/Implementation/LSL_Api.cs#L4224) (54 lines) |  |
| `llSetGroundTexture` | missing |  | not in OpenSimulator |  |

### #118: unfinished physics functions (2 of 2 in OpenSimulator)

| Function | In Halcyon | Grade | OpenSimulator 0.9.3.1 | Needs first |
| --- | --- | --- | --- | --- |
| `llCollisionFilter` | stub | **B** port and adapt | [line 3944](https://github.com/Galaxion-Legacy-Support/Galaxion-Legacy-OpenSimulator-0.9.x/blob/b391ca40e024432f179591da553a13fc89d47a36/OpenSim/Region/ScriptEngine/Shared/Api/Implementation/LSL_Api.cs#L3944) (9 lines) |  |
| `llGetCenterOfMass` | stub | **B** port and adapt | [line 5898](https://github.com/Galaxion-Legacy-Support/Galaxion-Legacy-OpenSimulator-0.9.x/blob/b391ca40e024432f179591da553a13fc89d47a36/OpenSim/Region/ScriptEngine/Shared/Api/Implementation/LSL_Api.cs#L5898) (5 lines) |  |

### #42: memory profiling functions (1 of 2 in OpenSimulator)

| Function | In Halcyon | Grade | OpenSimulator 0.9.3.1 | Needs first |
| --- | --- | --- | --- | --- |
| `llGetSPMaxMemory` | missing | **A** port directly | [line 17456](https://github.com/Galaxion-Legacy-Support/Galaxion-Legacy-OpenSimulator-0.9.x/blob/b391ca40e024432f179591da553a13fc89d47a36/OpenSim/Region/ScriptEngine/Shared/Api/Implementation/LSL_Api.cs#L17456) (6 lines) |  |
| `llScriptProfiler` | missing |  | also only a stub (empty) |  |

### #114: sit flag functions (1 of 3 in OpenSimulator)

| Function | In Halcyon | Grade | OpenSimulator 0.9.3.1 | Needs first |
| --- | --- | --- | --- | --- |
| `llGetLinkSitFlags` | missing | **B** port and adapt | [line 19512](https://github.com/Galaxion-Legacy-Support/Galaxion-Legacy-OpenSimulator-0.9.x/blob/b391ca40e024432f179591da553a13fc89d47a36/OpenSim/Region/ScriptEngine/Shared/Api/Implementation/LSL_Api.cs#L19512) (13 lines) |  |
| `llSetLinkSitFlags` | missing |  | also only a stub (empty) |  |
| `llSitOnLink` | missing |  | not in OpenSimulator |  |

### #105: pathfinding characters (0 of 12 in OpenSimulator)

| Function | In Halcyon | Grade | OpenSimulator 0.9.3.1 | Needs first |
| --- | --- | --- | --- | --- |
| `llCreateCharacter` | missing |  | not in OpenSimulator |  |
| `llDeleteCharacter` | missing |  | not in OpenSimulator |  |
| `llEvade` | missing |  | not in OpenSimulator |  |
| `llExecCharacterCmd` | missing |  | not in OpenSimulator |  |
| `llFleeFrom` | missing |  | not in OpenSimulator |  |
| `llGetClosestNavPoint` | missing |  | not in OpenSimulator |  |
| `llGetStaticPath` | missing |  | not in OpenSimulator |  |
| `llNavigateTo` | missing |  | not in OpenSimulator |  |
| `llPatrolPoints` | missing |  | not in OpenSimulator |  |
| `llPursue` | missing |  | not in OpenSimulator |  |
| `llUpdateCharacter` | missing |  | not in OpenSimulator |  |
| `llWanderWithin` | missing |  | not in OpenSimulator |  |

### #106: Experiences (0 of 18 in OpenSimulator)

| Function | In Halcyon | Grade | OpenSimulator 0.9.3.1 | Needs first |
| --- | --- | --- | --- | --- |
| `llRemoteLoadScript` | missing |  | also only a stub (deprecated) |  |
| `llAgentInExperience` | missing |  | not in OpenSimulator |  |
| `llClearExperience` | missing |  | not in OpenSimulator |  |
| `llClearExperiencePermissions` | missing |  | not in OpenSimulator |  |
| `llCreateKeyValue` | missing |  | not in OpenSimulator |  |
| `llDataSizeKeyValue` | missing |  | not in OpenSimulator |  |
| `llDeleteKeyValue` | missing |  | not in OpenSimulator |  |
| `llGetExperienceDetails` | missing |  | not in OpenSimulator |  |
| `llGetExperienceErrorMessage` | missing |  | not in OpenSimulator |  |
| `llGetExperienceList` | missing |  | not in OpenSimulator |  |
| `llKeyCountKeyValue` | missing |  | not in OpenSimulator |  |
| `llKeysKeyValue` | missing |  | not in OpenSimulator |  |
| `llReadKeyValue` | missing |  | not in OpenSimulator |  |
| `llReplaceAgentEnvironment` | missing |  | not in OpenSimulator |  |
| `llRequestExperiencePermissions` | missing |  | not in OpenSimulator |  |
| `llSetAgentEnvironment` | missing |  | not in OpenSimulator |  |
| `llSetExperienceKey` | missing |  | not in OpenSimulator |  |
| `llUpdateKeyValue` | missing |  | not in OpenSimulator |  |

### Stubs with no issue

These are deprecated or dead in Second Life itself, and OpenSimulator only stubs them too, so there's nothing to port.

`llCollisionSprite`, `llMakeExplosion`, `llMakeFire`, `llMakeFountain`, `llMakeSmoke`, `llPointAt`, `llRefreshPrimURL`, `llReleaseCamera`, `llRemoteDataSetRegion`, `llSetPrimURL`, `llSound`, `llSoundPreload`, `llStopPointAt`, `llTakeCamera`.

## Not in OpenSimulator either

50 functions have no OpenSimulator implementation to start from: Experiences, pathfinding, key-value storage, most combat functions, the environment setters, RSA signing, and a few newer ones. They're written from Second Life's documentation, as their issues describe:

`llAdjustDamage`, `llAgentInExperience`, `llClearExperience`, `llClearExperiencePermissions`, `llCreateCharacter`, `llCreateKeyValue`, `llDamage`, `llDataSizeKeyValue`, `llDeleteCharacter`, `llDeleteKeyValue`, `llDetectedDamage`, `llDetectedRezzer`, `llEvade`, `llExecCharacterCmd`, `llFindNotecardTextCount`, `llFindNotecardTextSync`, `llFleeFrom`, `llGetAttachedListFiltered`, `llGetClosestNavPoint`, `llGetEnvironment`, `llGetExperienceDetails`, `llGetExperienceErrorMessage`, `llGetExperienceList`, `llGetRegionTimeOfDay`, `llGetStaticPath`, `llGiveAgentInventory`, `llKeyCountKeyValue`, `llKeysKeyValue`, `llNavigateTo`, `llOpenFloater`, `llPatrolPoints`, `llPursue`, `llReadKeyValue`, `llReplaceAgentEnvironment`, `llReplaceEnvironment`, `llRequestExperiencePermissions`, `llSetAgentEnvironment`, `llSetAgentRot`, `llSetEnvironment`, `llSetExperienceKey`, `llSetGroundTexture`, `llSetLinkGLTFOverrides`, `llSetLinkRenderMaterial`, `llSignRSA`, `llSitOnLink`, `llTransferOwnership`, `llUpdateCharacter`, `llUpdateKeyValue`, `llVerifyRSA`, `llWanderWithin`.


## How this was made

Every `ll` function in OpenSimulator's `LSL_Api.cs` at mirror commit `b391ca40` was classed as implemented, deprecated or empty by reading its body, and matched against Halcyon's list of missing and stubbed functions. The grades come from what each function's code (and the helpers it calls) uses. Redo it after a large OpenSimulator update, since line numbers and implementations change.
