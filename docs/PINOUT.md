# Pinout / Точная распиновка

Source: `libraries/MCUFRIEND_kbv/utility/mcufriend_special.h`, lines 457–512,
the `__AVR_ATmega2560__ && USE_OPENSMART_SHIELD_PINOUT_MEGA` branch.
Mega Arduino pin numbers are cross-checked against the preserved core:
`vendor/arduino-data/packages/arduino/hardware/avr/1.8.8/variants/mega/pins_arduino.h`.

Это отображение **фактически выбранных программных определений**, а не догадка по типовой схеме.
Не используйте эту таблицу как рекомендацию перепаять работающий шилд.

| LCD signal | ATmega2560 port bit | Arduino Mega pin | Derivation |
|---|---|---|---|
| D0 | PH5 | D8 | `((x)&0x03)<<5` |
| D1 | PH6 | D9 | `((x)&0x03)<<5` |
| D2 | PB4 | D10 | `((x)&0x2C)<<2` |
| D3 | PB5 | D11 | `((x)&0x2C)<<2` |
| D4 | PG5 | D4 | `((x)&0x10)<<1` |
| D5 | PB7 | D13 | `((x)&0x2C)<<2` |
| D6 | PH3 | D6 | `((x)&0xC0)>>3` |
| D7 | PH4 | D7 | `((x)&0xC0)>>3` |
| RD | PF0 | A0 / D54 | `RD_PORT PORTF`, `RD_PIN 0` |
| WR | PF1 | A1 / D55 | `WR_PORT PORTF`, `WR_PIN 1` |
| RS / CD | PF2 | A2 / D56 | `CD_PORT PORTF`, `CD_PIN 2` |
| CS | PF3 | A3 / D57 | `CS_PORT PORTF`, `CS_PIN 3` |
| RESET macro | PF1 | A1 / D55 | **Dummy alias of WR, not a physical LCD reset wire** |

`RESET_PIN 1 // n/a. so mimic WR_PIN` explicitly says reset is not independently
controlled here. Do **not** wire physical LCD RESET to WR based on this macro.
The precise physical reset circuit was not electrically traced.

The write expression is:
```cpp
PORTH = (PORTH&~HMASK)|(((x)&0b11000000)>>3)|(((x)&0b00000011)<<5);
PORTB = (PORTB&~BMASK)|(((x)&0b00101100)<<2);
PORTG = (PORTG&~GMASK)|(((x)&0b00010000)<<1);
```
`read_8()` implements the inverse mapping; `setWriteDir` / `setReadDir` change
only the masked data pins. Thus this is an 8-bit parallel interface, not an SPI LCD.

By comparison, the **standard** Mega shield branch in `mcufriend_shield.h`
uses D2/D3 instead of OPEN-SMART's D10/D11/D13 arrangement and has different
data mapping; the OPEN-SMART selection must not be omitted.
Supply pins and SD/touch/temperature connections are not specified by this LCD
bus branch. The shield photograph labels 5V/GND, but no new voltage measurement
or full PCB schematic verification was performed. Keep the verified seating unchanged.

## Why each setting matters / Назначение настроек

- `mcufriend_shield.h:16–22`: `USE_SPECIAL` includes `mcufriend_special.h`
  and bypasses the normal mapping unless the special driver fails selection.
- `mcufriend_special.h:14,457–512`: the Mega macro selects the mapping above.
- `MCUFRIEND_kbv.cpp:16,1868–1933`: `SUPPORT_8352B` compiles the HX8352-B
  initialization table, including power sequence, gamma, RGB565 and display-on writes.
- `MCUFRIEND_kbv.cpp:1869`: `case 0x0065`, **not** `case 0x8352`.
  The driver's logical height is set to 400; the column end is `0xEF` (239).
- `begin()` assigns `_lcd_ID = ID` then dispatches on `switch (_lcd_ID)`.
  Its final default branch sets width to zero for an unsupported ID.
  There is no `case 0x8352` in this version.
- Backlight operation and physical absence of rewiring are observations, not
  claims proved by a C++ macro. The first test had illumination without pixels;
  the second showed colored pixels with the same physical connection.

Permanent upstream source links are in [REFERENCES](REFERENCES.md).
