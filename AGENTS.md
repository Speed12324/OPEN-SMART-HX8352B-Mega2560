# OPEN-SMART HX8352B troubleshooting reference

## Match criteria

- Board: Arduino Mega 2560 / ATmega2560; FQBN `arduino:avr:mega`.
- Shield: OPEN-SMART TFT LCD Shield, PCB marked `Driver IC: HX8352B`.
- Interface: 8-bit parallel; portrait driver geometry 240 × 400.
- Symptoms: white illuminated LCD; `readID()` returns `0x0065` (or `0x65`).
- Library: MCUFRIEND_kbv 3.0.0-Release, upstream commit `9fa56e527a88cf7e0c458dae99862ba43b213829`.

## Tested configuration

| File relative to `libraries/MCUFRIEND_kbv/` | Required active definition |
|---|---|
| `utility/mcufriend_shield.h` | `#define USE_SPECIAL` |
| `utility/mcufriend_special.h` | `#define USE_OPENSMART_SHIELD_PINOUT_MEGA` |
| `MCUFRIEND_kbv.cpp` | `#define SUPPORT_8352B` |

In the sketch call `tft.begin(0x0065);`. Do not substitute `0x8352`: that value produced a white screen in the test and does not select the HX8352-B switch case in this library version.

## Source locations and test

- `utility/mcufriend_shield.h:16–22`: special mapping selection.
- `utility/mcufriend_special.h:457–512`: Mega-specific bus mapping.
- `MCUFRIEND_kbv.cpp:1868–1933`: HX8352-B initialization, case `0x0065`.
- `patches/mcufriend-opensmart-mega.patch`: exact three macro changes.
- `color_test/color_test.ino`: minimal RGB and text test.
- `docs/PINOUT.md`: GPIO mapping; RESET macro aliases WR and is not a physical wiring instruction.
- `docs/REFERENCES.md`: upstream links and source limitations.

Expected result: red, green, blue bands and readable white text. Serial output alone does not prove LCD output. The successful combination was tested on hardware; each macro was not independently ablated. Other boards, touch, SD and other rotations are untested. Do not change wiring or flash a connected board without explicit authorization.

Build using pinned dependencies in `docs/ENVIRONMENT.md` and `docs/REPRODUCE.md`. Firmware SHA-256: `5c606f44398f1e92de6aa939ce354e2dd6326a18caf083ca3bc50c6788f7d964`.
