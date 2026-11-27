# Reproduction / Воспроизведение

## Windows: exact tools from official sources

Use current `main` or the updated custom source ZIP attached to the release.
The original `v1.0.0` Git tag preserves older documentation; its firmware and
drivers are unchanged. The release notes identify the custom ZIP's source commit.

```powershell
git clone https://github.com/Speed12324/OPEN-SMART-HX8352B-Mega2560.git
cd OPEN-SMART-HX8352B-Mega2560
powershell -ExecutionPolicy Bypass -File scripts/install-tools.ps1
python scripts/verify.py
powershell -ExecutionPolicy Bypass -File scripts/build.ps1 -VerboseBuild
```

The installer downloads **Arduino CLI 1.5.1** directly from its official GitHub
release, verifies the ZIP against the committed official checksum list, and
installs **arduino:avr@1.8.8** with the official package manager. The core pins
AVR GCC **7.3.0-atmel3.6.1-arduino7** and its other tool dependencies.
CLI validates their package checksums. No external library is upgraded:
MCUFRIEND, GFX and BusIO are taken explicitly from `libraries/`.

Installation requires internet access, Windows x64, PowerShell 5.1+ and TLS 1.2.
All tools and CLI-generated local identity files stay under ignored `vendor/`;
no installation archive or generated inventory should be uploaded.
The binary Windows environment bundle is **not** part of the public release.
Do not follow older environment-bundle instructions in historical documentation.

Скрипт устанавливает инструменты в локальный `vendor`, не меняя глобальные
библиотеки. Для публичного воспроизведения нужен доступ к официальным серверам.
Проверяемые исходники и прошивка находятся в репозитории; сторонние исполняемые
инструменты скачиваются непосредственно у поставщиков, а не из архива релиза.

Expected output: `.build/output/color_test.ino.hex`.
Its SHA-256 must match the unchanged hardware-tested firmware:
```
5c606f44398f1e92de6aa939ce354e2dd6326a18caf083ca3bc50c6788f7d964
```
Inspect the library summary: MCUFRIEND 3.0.0-Release, GFX 1.12.6 and BusIO 1.17.4
must resolve to this checkout. SPI/Wire must come from local Core 1.8.8.
Building does **not** upload, open a serial port or reset the board.

## Optional explicit upload

Not needed for reproduction checking. Only when deliberately replacing the
application on a Mega 2560 with a working bootloader:
```powershell
powershell -ExecutionPolicy Bypass -File scripts/upload.ps1 -Port COM3 -ConfirmUpload
```
The script refuses without `-ConfirmUpload`. Determine the actual serial port;
COM3 is only the tested example. A CH340 driver may be required.
It uploads the preserved HEX, not an edited/rebuilt sketch.

## Linux (not host-tested)

Install CLI 1.5.1 from https://github.com/arduino/arduino-cli/releases/tag/v1.5.1,
verifying its architecture-specific archive against that release's checksum list.
Then:
```bash
export ARDUINO_DIRECTORIES_DATA="$PWD/.state/linux-data"
export ARDUINO_DIRECTORIES_USER="$PWD/.state/user"
export ARDUINO_DIRECTORIES_DOWNLOADS="$PWD/.state/downloads"
arduino-cli core update-index
arduino-cli core install arduino:avr@1.8.8
bash scripts/build.sh
```
Do not install the external libraries globally. Saved official core/tool URLs
and hashes are in `docs/TOOL-DOWNLOADS.json`.

## If checksums differ

Stop; do not overwrite `firmware/color_test.hex`. Compare actual library paths,
active macros, ID `0x0065`, CLI/core/toolchain versions and source hashes.
ELF debug paths are not the comparison target: compare Intel HEX or decoded flash.
Compatible hardware, host OS and availability of official downloads remain
external requirements. No bundled compiler is distributed publicly.
