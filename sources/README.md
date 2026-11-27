# Corresponding application source

`ArduinoCore-avr-1.8.8/` contains the unmodified platform files and sources used
to build the released application: Arduino core, Mega variant, SPI and Wire.
It is not a replacement installable board package or a bootloader archive.
Install the official platform with `scripts/install-tools.ps1` for compilation.

Upstream: https://github.com/arduino/ArduinoCore-avr
Revision: `86df345b3cf46754a5db38fb983ec2808ce31303` (tag `1.8.8`).
Copied from the exact installed 1.8.8 package; original notices are retained.
Arduino core LGPL-2.1 terms are in `licenses/GNU-LGPL-2.1.txt`.
Individual files retain their own copyright/license notices.

Application sketch: `color_test/color_test.ino`.
Display and graphics source: `libraries/`.
Rebuild/relink instructions: `docs/REPRODUCE.md`.
The application HEX and its source have not been changed by public preparation.
