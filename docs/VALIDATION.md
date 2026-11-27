# Validation / Результаты проверки

Test date: 2026-11-28.

## Baseline

- MCUFRIEND v3.0.0 comparison: three macro changes after line-ending normalization.

## Earlier isolated rebuild

A fresh clone was used for validation.

The checked source started at the first preservation commit (`af642de`).
The earlier build used an isolated pinned tool snapshot; no global Arduino
libraries or core were used. That binary snapshot is not a public release asset.

- All committed source/artifact SHA-256 checks: **PASS**.
- Tool snapshot checks: **PASS** (historical test, not the public installation procedure).
- Clean build with `--clean`: **PASS**.
- Process HTTP/HTTPS proxy was set to a closed local endpoint during that build;
  no additional dependency installation was needed. This is not a claim of
  firewall-level host network isolation.
- Build summary explicitly selected clone-local MCUFRIEND 3.0.0-Release,
  GFX 1.12.6, BusIO 1.17.4, and vendor-local Core 1.8.8 / SPI / Wire.
- Rebuilt HEX is **byte-for-byte identical** to the actual hardware-tested HEX.
- No upload, erase, bootloader operation, serial reset or device write was
  performed in this reproduction check.

Both application HEX files:
```
SHA-256 5c606f44398f1e92de6aa939ce354e2dd6326a18caf083ca3bc50c6788f7d964
size    45304 bytes (Intel HEX file)
```

There is therefore no binary mismatch to explain for the verified Windows build.
Later preservation-documentation additions do not change the sketch or libraries.

## Public installation validation

A new empty build tree was prepared without copying any previous `vendor`
directory. `scripts/install-tools.ps1` downloaded Arduino CLI 1.5.1 from the
official versioned release, checked the official ZIP SHA-256, and installed
Arduino AVR Core 1.8.8 and its official dependencies.

Clean compilation with those freshly installed tools: **PASS**.
The actual output HEX SHA-256 was again
`5c606f44398f1e92de6aa939ce354e2dd6326a18caf083ca3bc50c6788f7d964`.
Library paths selected the test tree's saved MCUFRIEND/GFX/BusIO sources and
freshly installed Core 1.8.8. No global modified libraries were used.
No upload, device reset or serial-port access was performed.

Проверена новая публичная процедура: установка точных версий с официальных
серверов в пустой каталог, затем чистая сборка. HEX совпал побайтово.
Сторонний бинарный архив для этого не требуется.

## Русское резюме

После публикации выполнено настоящее клонирование GitHub в новый каталог.
Проверены суммы исходников и всех файлов окружения, выполнена чистая сборка
из сохранённых зависимостей. HEX полностью совпал с прошитым рабочим файлом.
Arduino при проверке не перепрошивалась.

Ограничения: Windows-проверка выполнена на том же физическом ПК, но с отдельными
каталогами CLI, без глобальных библиотек. Другой физический компьютер и Linux
не проверялись..
