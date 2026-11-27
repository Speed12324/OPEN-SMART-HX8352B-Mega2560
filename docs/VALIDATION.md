# Validation / Результаты проверки

Date: **2026-11-28**, Europe/Kyiv.

## Initial preservation

- Timestamped original backup: 87 files; every file read and SHA-256 compared
  against `D:\opencode\tft-diagnostics`: **PASS**.
- Original working sketch preserved byte-for-byte: **PASS**.
- Original Flash/EEPROM parsed; previous network-program strings found in Flash,
  so Flash is excluded. EEPROM: 4096 bytes, all `0xFF`.
- Source scan for the previous sketch's nontrivial password: no match in the
  publication tree. No token or credential-manager output is committed.
- MCUFRIEND compared against upstream v3.0.0: only the three macro edits
  after line-ending normalization.

## Published repository clean clone

Repository was actually created as **PRIVATE**, then source was pushed to `main`.
Cloned from GitHub into a previously absent directory:
`D:\opencode\hx8352b-github-verify-20261128`.

The checked source started at the first preservation commit (`af642de`).
Extracted the prepared release environment ZIP into the clone; no global
Arduino libraries or core were used.

- All committed source/artifact SHA-256 checks: **PASS**.
- All 2200 vendor-file SHA-256 checks: **PASS**.
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
Final GitHub tag, release assets, downloaded asset hashes and repository privacy
are additionally checked after release publication; that external result is
reported to the owner rather than self-referentially rewriting this immutable tag.

## Русское резюме

После публикации выполнено настоящее клонирование GitHub в новый каталог.
Проверены суммы исходников и всех файлов окружения, выполнена чистая сборка
из сохранённых зависимостей. HEX полностью совпал с прошитым рабочим файлом.
Arduino при проверке не перепрошивалась.

Ограничения: Windows-проверка выполнена на том же физическом ПК, но с отдельными
каталогами CLI, без глобальных библиотек. Другой физический компьютер и Linux
не проверялись. Некоторые старые снимки сессии недоступны как локальные файлы;
точная временная метка сообщения об успехе не извлечена независимо.
