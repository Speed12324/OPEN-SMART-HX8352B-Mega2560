# Changelog

## Public distribution preparation

- Preserve the hardware-tested sketch, configured drivers and firmware unchanged.
- Replace the binary tool bundle with exact-version installation from official sources.
- Add corresponding Arduino core/SPI/Wire/Mega application source and notices.
- Refresh technical documentation, release source archive and checksums.
- Audit all Git refs/history, nested release archives, binary strings, HEX,
  EEPROM and image metadata before changing visibility.

## v1.0.0 — 2026-11-28

- Preserved the hardware-verified OPEN-SMART HX8352B / Mega 2560 color test.
- Archived exact configured MCUFRIEND_kbv and pinned dependencies.
- Documented the three macro changes and HX8352-B ID `0x0065`.
- Preserved the uploaded application HEX, hashes and cropped webcam evidence.
- Added isolated build scripts and guarded upload script.
- Included the empty EEPROM reference.
