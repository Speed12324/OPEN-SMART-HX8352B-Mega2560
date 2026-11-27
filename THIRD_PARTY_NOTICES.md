# Third-party notices / Сторонние компоненты

Third-party components retain their original licenses.
Retain all included notices and consult each component's terms before redistribution.

| Component | Source | Notices |
|---|---|---|
| MCUFRIEND_kbv 3.0.0-Release | David Prentice, github.com/prenticedavid/MCUFRIEND_kbv | Complete original `license.txt` retained in library and `licenses/` |
| Adafruit GFX 1.12.6 | Adafruit, github.com/adafruit/Adafruit-GFX-Library | Original BSD-style license and source notices retained |
| Adafruit BusIO 1.17.4 | Adafruit, github.com/adafruit/Adafruit_BusIO | Original MIT `LICENSE` retained |
| Arduino AVR Core 1.8.8 | Arduino and contributors, github.com/arduino/ArduinoCore-avr | Corresponding source used by the application is preserved under `sources/ArduinoCore-avr-1.8.8`; original per-file notices and LGPL text retained |
| Arduino CLI 1.5.1 | Arduino, github.com/arduino/arduino-cli | Not redistributed; downloaded from the official release with checksum verification. GPL-3.0 license retained for reference |
| AVR GCC/toolchain | GNU/Atmel/Arduino contributors | GPL compiler/binutils; runtime exceptions and avr-libc notices apply. No compiler executable is redistributed; exact tools are installed from Arduino's official service |
| avrdude 8.0.0-arduino1 | AVRDUDE contributors / Arduino packaging | Not redistributed; official package installer downloads it |
| arduinoOTA 1.3.0 | Arduino | Not redistributed; official package installer downloads it |
| CLI built-in discovery/monitor tools | Arduino | Not redistributed; official CLI obtains its dependencies |

The complete configured source libraries are published with original notices.
The Windows binary environment bundle is excluded from public release: no full
corresponding compiler/tool source distribution was assembled. Links to build
recipes do not replace the corresponding-source obligations for binary redistribution.
Public installation downloads exact tool versions directly from official sources.
The unchanged application HEX is accompanied by its full sketch, display and
graphics source, Arduino core/SPI/Wire/Mega source, license notices and reproducible
build instructions so the application can be rebuilt with modified source.
GCC runtime support is subject to the saved runtime exception; avr-libc notices
are preserved in `licenses/avr-libc-LICENSE.txt` and
`licenses/avr-libc-actual-runtime-notices.txt`.

The HX8352-B mirrored datasheet is marked Himax Confidential: it is **not** copied
into this repository. Hardware documentation, forums and manufacturer/mirror
pages are bibliographically linked unless local redistribution rights were clear.
No claim of an authoritative OPEN-SMART manufacturer-hosted manual is made.

No blanket project license overrides third-party terms.
