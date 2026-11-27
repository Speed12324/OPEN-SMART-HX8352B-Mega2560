# Pinned environment / Зафиксированное окружение

| Component | Exact version | Role |
|---|---|---|
| Arduino CLI | 1.5.1; commit `01f3d4f2b`; build date 2026-06-05T10:22:12Z | Build/upload frontend |
| Arduino AVR Boards | 1.8.8 | Core, Mega variant, SPI 1.0, Wire 1.0 |
| AVR GCC | 7.3.0 | Compiler |
| Arduino toolchain package | 7.3.0-atmel3.6.1-arduino7 | Compiler, assembler, linker, objcopy |
| avrdude | package 8.0.0-arduino1 | Upload and original backup reader |
| arduinoOTA | 1.3.0 | Core package dependency, not used for USB test |
| MCUFRIEND_kbv | 3.0.0-Release, upstream v3.0.0 | LCD driver, exactly three macro edits |
| Adafruit GFX | 1.12.6 | Base graphics |
| Adafruit BusIO | 1.17.4 | GFX transitive dependency |
| Board FQBN | arduino:avr:mega | Mega 2560 default CPU selection |
| Serial port | COM3 | Historical host enumeration, not portable |
| Serial log speed | 115200 | Test sketch diagnostic output |

MCUFRIEND revision:
`9fa56e527a88cf7e0c458dae99862ba43b213829`.
Every local packaged source file was compared with that tag after CRLF/LF
normalization: exactly the three expected macro changes; package omits Git
metadata and upstream dotfiles. The full configured source is preserved.
No claim that all package archive bytes equal a GitHub source ZIP is made.

GFX tag commit: `ac6d7c3869a693d406f77b9bfcd486b0673169f0`.
BusIO tag commit: `3b8364267c3ee6e16bad91bc2101aefbd5b5915f`.
Core 1.8.8 tag commit: `86df345b3cf46754a5db38fb983ec2808ce31303`.
Dependency versions come from the actual used `library.properties` files;
their complete saved bytes, not a future tag lookup, are authoritative.

## Isolation / Изоляция

The Windows script sets `ARDUINO_DIRECTORIES_DATA`, `USER`, and `DOWNLOADS`
to project-local paths and passes all three library locations explicitly.
No user Arduino configuration, credentials or unrelated sketches are published.
`scripts/install-tools.ps1` downloads pinned CLI/core/tool packages from official
sources into ignored `vendor/`. It verifies the official CLI ZIP checksum;
the CLI verifies platform/tool checksums from Arduino's official index.
Generated local identity inventory must remain ignored.
There is no public Windows binary environment asset. Earlier offline-bundle
instructions are superseded by the official-source installation procedure.
`docs/ARDUINO-CLI-1.5.1-SHA256.txt` and `TOOL-DOWNLOADS.json` record upstream hashes.

Internet access is required for installation, not for subsequent compilation
once the platform and its built-in tools are installed.
Python 3 is only needed for the optional checksum verifier, not compilation.
PowerShell 5.1+, a compatible Windows host and basic OS runtime components remain
host requirements. CH340 driver installation is separate if uploading is needed.

## Binary reproducibility / Побайтовая воспроизводимость

The first isolated clean build matched the actual uploaded HEX exactly:
`5c606f44398f1e92de6aa939ce354e2dd6326a18caf083ca3bc50c6788f7d964`.
Both files are 45304 bytes in Intel HEX text form.
The application occupies 16100 bytes and global variables 508 bytes according
to CLI. HEX includes addresses/checksums, so text size differs from program size.
ELF debug data can contain absolute paths and is not used as the equality target.
The firmware released here is application-only, not a bootloader replacement.
