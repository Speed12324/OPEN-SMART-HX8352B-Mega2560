# Sources / Первоисточники

Access date / Дата обращения: **2026-11-28**.
Permanent commit links are used where an exact revision is known.
Local library source, original library ZIPs and license files provide lawful
source-code archival copies. External hardware pages/forum text are linked,
not wholesale republished. No verified manufacturer-hosted OPEN-SMART manual
for this exact board revision was found; the mirror is explicitly secondary.
The HX8352-B PDF search result carries **Himax Confidential** restrictions;
only bibliographic metadata/link is retained, not the PDF.

Даташит HX8352-A не подменяет HX8352-B. Точная ревизия найденного B-даташита
не установлена. Распиновка взята из проверенной библиотеки, не из предположений
по найденному PDF. Страницы форумов не являются гарантией работоспособности
на других платах.

| Title | URL | Version/date | Confirms / Подтверждает | Accessed | HTTP recheck |
|---|---|---|---|---|---|
| MCUFRIEND original | [https://github.com/prenticedavid/MCUFRIEND_kbv](https://github.com/prenticedavid/MCUFRIEND_kbv) | 3.0.0-Release | Original project | 2026-11-28 | 200 |
| MCUFRIEND exact revision | [https://github.com/prenticedavid/MCUFRIEND_kbv/tree/9fa56e527a88cf7e0c458dae99862ba43b213829](https://github.com/prenticedavid/MCUFRIEND_kbv/tree/9fa56e527a88cf7e0c458dae99862ba43b213829) | v3.0.0 | Source version, verified matching local source after line-ending normalization except the three macros | 2026-11-28 | 200 |
| Special pinout how-to | [https://github.com/prenticedavid/MCUFRIEND_kbv/blob/9fa56e527a88cf7e0c458dae99862ba43b213829/extras/mcufriend_how_to.txt](https://github.com/prenticedavid/MCUFRIEND_kbv/blob/9fa56e527a88cf7e0c458dae99862ba43b213829/extras/mcufriend_how_to.txt) | v3.0.0 item 19 | Three required macro edits | 2026-11-28 | unavailable at recheck: HTTP Error 503: Service Unavailable |
| Mega bus mapping | [https://github.com/prenticedavid/MCUFRIEND_kbv/blob/9fa56e527a88cf7e0c458dae99862ba43b213829/utility/mcufriend_special.h#L457-L512](https://github.com/prenticedavid/MCUFRIEND_kbv/blob/9fa56e527a88cf7e0c458dae99862ba43b213829/utility/mcufriend_special.h#L457-L512) | v3.0.0 | Exact OPEN-SMART Mega GPIO mapping and dummy reset alias | 2026-11-28 | unavailable at recheck: HTTP Error 503: Service Unavailable |
| Special selection | [https://github.com/prenticedavid/MCUFRIEND_kbv/blob/9fa56e527a88cf7e0c458dae99862ba43b213829/utility/mcufriend_shield.h#L16-L22](https://github.com/prenticedavid/MCUFRIEND_kbv/blob/9fa56e527a88cf7e0c458dae99862ba43b213829/utility/mcufriend_shield.h#L16-L22) | v3.0.0 | Conditional include/bypass | 2026-11-28 | unavailable at recheck: HTTP Error 503: Service Unavailable |
| HX8352-B initialization | [https://github.com/prenticedavid/MCUFRIEND_kbv/blob/9fa56e527a88cf7e0c458dae99862ba43b213829/MCUFRIEND_kbv.cpp#L1868-L1933](https://github.com/prenticedavid/MCUFRIEND_kbv/blob/9fa56e527a88cf7e0c458dae99862ba43b213829/MCUFRIEND_kbv.cpp#L1868-L1933) | v3.0.0 | case 0x0065, power sequence, RGB565 | 2026-11-28 | unavailable at recheck: HTTP Error 503: Service Unavailable |
| ID dispatch | [https://github.com/prenticedavid/MCUFRIEND_kbv/blob/9fa56e527a88cf7e0c458dae99862ba43b213829/MCUFRIEND_kbv.cpp#L909-L916](https://github.com/prenticedavid/MCUFRIEND_kbv/blob/9fa56e527a88cf7e0c458dae99862ba43b213829/MCUFRIEND_kbv.cpp#L909-L916) | v3.0.0 | begin switches on supplied ID | 2026-11-28 | unavailable at recheck: HTTP Error 503: Service Unavailable |
| Unsupported ID | [https://github.com/prenticedavid/MCUFRIEND_kbv/blob/9fa56e527a88cf7e0c458dae99862ba43b213829/MCUFRIEND_kbv.cpp#L3054-L3057](https://github.com/prenticedavid/MCUFRIEND_kbv/blob/9fa56e527a88cf7e0c458dae99862ba43b213829/MCUFRIEND_kbv.cpp#L3054-L3057) | v3.0.0 | Unsupported ID sets width to zero | 2026-11-28 | unavailable at recheck: HTTP Error 503: Service Unavailable |
| Adafruit GFX | [https://github.com/adafruit/Adafruit-GFX-Library/tree/ac6d7c3869a693d406f77b9bfcd486b0673169f0](https://github.com/adafruit/Adafruit-GFX-Library/tree/ac6d7c3869a693d406f77b9bfcd486b0673169f0) | 1.12.6 | Graphics dependency | 2026-11-28 | 200 |
| Adafruit BusIO | [https://github.com/adafruit/Adafruit_BusIO/tree/3b8364267c3ee6e16bad91bc2101aefbd5b5915f](https://github.com/adafruit/Adafruit_BusIO/tree/3b8364267c3ee6e16bad91bc2101aefbd5b5915f) | 1.17.4 | Transitive GFX dependency | 2026-11-28 | 200 |
| AVR core | [https://github.com/arduino/ArduinoCore-avr/tree/86df345b3cf46754a5db38fb983ec2808ce31303](https://github.com/arduino/ArduinoCore-avr/tree/86df345b3cf46754a5db38fb983ec2808ce31303) | 1.8.8 | Core, Mega variant, SPI and Wire | 2026-11-28 | 200 |
| Mega official hardware documentation | [https://docs.arduino.cc/hardware/mega-2560/](https://docs.arduino.cc/hardware/mega-2560/) | accessed 2026-11-28 | ATmega2560, pins, 4KB EEPROM | 2026-11-28 | 200 |
| CLI documentation | [https://arduino.github.io/arduino-cli/1.5/](https://arduino.github.io/arduino-cli/1.5/) | 1.5 | CLI commands and configuration | 2026-11-28 | 200 |
| CLI source and license | [https://github.com/arduino/arduino-cli/tree/v1.5.1](https://github.com/arduino/arduino-cli/tree/v1.5.1) | 1.5.1 | CLI source/license | 2026-11-28 | 200 |
| Toolchain build source | [https://github.com/arduino/toolchain-avr](https://github.com/arduino/toolchain-avr) | Arduino avr-gcc 7.3.0-atmel3.6.1-arduino7 | Build recipes and upstream source locations; not a claim of an archived complete compiler source distribution | 2026-11-28 | 200 |
| Arduino package index | [https://downloads.arduino.cc/packages/package_index.json](https://downloads.arduino.cc/packages/package_index.json) | snapshot 2026-11-28 | Pinned official binary URLs/checksums; TOOL-DOWNLOADS.json | 2026-11-28 | 200 |
| OPEN-SMART historical forum documentation | [https://forum.arduino.cc/t/open-smart-3-2-hx8352b-problems/516068](https://forum.arduino.cc/t/open-smart-3-2-hx8352b-problems/516068) | 2018-03 onward | Author explanation of OPEN-SMART macros; relevant search hit during diagnosis | 2026-11-28 | 200 |
| Other white-screen report | [https://forum.arduino.cc/t/using-tft-3-2-lcd-shield-on-arduino-mega-white-screen/662671](https://forum.arduino.cc/t/using-tft-3-2-lcd-shield-on-arduino-mega-white-screen/662671) | 2020 | Relevant search hit during diagnosis; same macro guidance | 2026-11-28 | 200 |
| OPEN-SMART example mirror (NOT authenticated manufacturer primary source) | [http://specs.buho.ch/MCU/%5BOPEN-SMART%5D%20TFT%20LCD%20Shield%203.8inch%20ILI9488/Arduino%20library/OPENSMART_TFT/examples/3.2inch%20HX8352B/](http://specs.buho.ch/MCU/%5BOPEN-SMART%5D%20TFT%20LCD%20Shield%203.8inch%20ILI9488/Arduino%20library/OPENSMART_TFT/examples/3.2inch%20HX8352B/) | directory timestamps 2023-07-11 | Historical OPENSMART_TFT example names; not relied on for tested implementation | 2026-11-28 | 200 |
| HX8352-B datasheet mirror | [https://www.mikrocontroller.net/attachment/120683/HX8352-B.pdf](https://www.mikrocontroller.net/attachment/120683/HX8352-B.pdf) | document revision not independently established | Datasheet located at a third-party mirror; carries Himax Confidential restrictions; NOT redistributed | 2026-11-28 | unavailable at recheck: HTTP Error 403: Forbidden |
