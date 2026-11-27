# Reproduction / Восстановление на другом компьютере

## Windows: preserved environment (recommended)

1. Ensure Git is installed.
2. Clone branch `main`, or checkout immutable tag `v1.0.0`:
   ```powershell
   git clone https://github.com/Speed12324/OPEN-SMART-HX8352B-Mega2560.git
   cd OPEN-SMART-HX8352B-Mega2560
   git checkout v1.0.0
   ```
3. Download `windows-environment-v1.0.0.zip` and its release SHA-256 manifest.
   Verify the ZIP with `Get-FileHash` before extraction.
   Extract **into the repository root**. It creates `vendor/`, not a replacement
   sketch. Do not extract old Flash dumps into this repository.
4. Verify source/artifacts and the extracted vendor files:
   ```powershell
   python scripts/verify.py
   python scripts/verify.py --vendor
   ```
5. Compile (does **not** touch the device):
   ```powershell
   powershell -ExecutionPolicy Bypass -File scripts/build.ps1 -VerboseBuild
   ```
6. Output: `.build/output/color_test.ino.hex`.
   SHA-256 must equal:
   ```
   5c606f44398f1e92de6aa939ce354e2dd6326a18caf083ca3bc50c6788f7d964
   ```
7. Inspect the build library summary. MCUFRIEND, GFX and BusIO must resolve inside
   this checkout; SPI/Wire must resolve inside `vendor/.../avr/1.8.8`.

Скачайте именно архив окружения из релиза; обычный GitHub “Source code ZIP”
не включает release assets. Архив содержит Windows-инструменты, Linux требует
других исполняемых файлов. Никакие глобальные библиотеки менять не нужно.

### Optional explicit restore to hardware / Загрузка только по намерению владельца

The archival/reproduction verification does **not** require uploading.
When actually restoring a board, confirm it is Mega 2560 and discover its port.
Then:
```powershell
powershell -ExecutionPolicy Bypass -File scripts/upload.ps1 -Port COM3 -ConfirmUpload
```
This uploads the **preserved known-working HEX**, not a newly edited sketch.
It replaces the current application; it assumes a working Mega bootloader.
The script intentionally refuses without `-ConfirmUpload`.

## Linux (provided, not host-tested)

Install Arduino CLI **1.5.1** from the official versioned release:
`https://github.com/arduino/arduino-cli/releases/tag/v1.5.1`.
Use an isolated data directory:
```bash
export ARDUINO_DIRECTORIES_DATA="$PWD/.state/linux-data"
export ARDUINO_DIRECTORIES_USER="$PWD/.state/user"
export ARDUINO_DIRECTORIES_DOWNLOADS="$PWD/.state/downloads"
arduino-cli core update-index
arduino-cli core install arduino:avr@1.8.8
bash scripts/build.sh
```
Do not install/upgrade the external libraries: all three are already vendored.
Official platform/compiler download URLs and expected hashes, including Linux
variants, are saved in `docs/TOOL-DOWNLOADS.json`.
Linux restoration still needs network access to those pinned official tools;
the Windows release archive is the verified self-contained host-tool backup.

## If hashes differ / Если суммы не совпали

Stop and compare `library.properties`, CLI/core/toolchain versions, active
macros and actual library paths. Do not replace the preserved firmware with a
different build just because compilation succeeded.
Different ELF paths are not a firmware mismatch; compare Intel HEX or decoded
flash bytes. No environment-dependent HEX difference was observed in the
verified Windows clean build.

## Archive scope

Committed source, source ZIPs, libraries, firmware, license notices and manifests
plus the Windows environment release asset are needed for long-term recovery.
Keep an independent local copy of release assets: Git clone alone does not copy them.
Compatible hardware and OS remain required.
