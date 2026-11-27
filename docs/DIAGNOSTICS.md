# White-screen diagnostics

Hardware test: 2026-11-28.

## Test sequence

1. **Observed:** screen illuminated white; no useful graphics. 
2. **PCB identification:** PCB marked OPEN-SMART, TFT LCD Shield,
   `Driver IC: HX8352B`; blue board marked Mega 2560 / ATmega2560.
3. **Host enumeration:** CH340 USB serial device appeared as COM3.
4. **Documentation finding:** MCUFRIEND how-to item 19 requires special OPEN-SMART
   wiring and HX8352B support; forum results corroborated this.
5. **Source inspection:** the installed MCUFRIEND_kbv 3.0.0-Release had
   `USE_SPECIAL`, `USE_OPENSMART_SHIELD_PINOUT_MEGA`, `SUPPORT_8352B` commented out.
6. **Baseline:** pre-test firmware was backed up.
7. **Change:** created a separate local library copy; uncommented those three
   macros. Global libraries were left unchanged.
8. **Failed experiment:** uploaded bars/text sketch calling `begin(0x8352)`.
   Webcam still showed white. 
9. **Serial observation:** at 115200 baud, controller reported `Read ID: 0x65`.
   Serial also printed “Color bars drawn”; that message alone did not prove display output.
10. **Source analysis:** `SUPPORT_8352B` guards `case 0x0065 // HX8352-B`.
    `0x8352` is not a supported switch case.
11. **Correction:** changed only the diagnostic ID argument/message to `0x0065`.
12. **Upload succeeded:** 16100 bytes program, 508 bytes global RAM as reported by CLI.
13. **Visual observation:** webcam showed red, green, blue areas and text
    `HX8352B`, `MEGA 2560`, `COLOR TEST`.
14. **Rebuild:** isolated compilation produced a byte-identical HEX.

## Facts vs hypotheses / Факты и гипотезы

**Confirmed:** physical connection carried readable ID; correct selection drew
color/text; no physical rewiring; original global macros were disabled;
working HEX is preserved. The combination of configuration changes and corrected
ID works on this unit.

**Not separately isolated:** each macro's individual failure effect was not
tested one-at-a-time. Their required purpose follows from conditional compilation,
not from three separate hardware experiments.

**Rejected as necessary for this success:** replacing display, changing wires,
trying every available TFT library. None was needed.

**Not established:** absence of any intermittent hardware defect, full-screen
pixel correctness, touch/SD operation, all rotations or long-term reliability.

## Symptom matrix / Таблица симптомов

| Symptom / Симптом | Possible cause / Возможная причина | Test / Проверка | Status here |
|---|---|---|---|
| White, backlight on | Wrong/unsupported `begin` ID | Compare readID and compiled switch cases | Confirmed failed `0x8352`; fixed `0x0065` |
| White | Controller support compiled out | Inspect `SUPPORT_8352B`, build log | Macro was disabled; enabled in preserved copy |
| White or garbled output | Wrong bus pinout | Inspect special mapping and board branch | Original special selection disabled |
| ID 0xFFFF / 0x0000 / inconsistent | Bus, power, seating, RD, mapping issue | Read registers, inspect wiring, measure rails safely | Hypothesis; not observed here |
| Serial says drawn but no pixels | Program ran, initialization failed | Webcam, not serial text alone | Observed in first test |
| Dark screen | No backlight/power, display off, physical fault | Check power safely; distinguish from black pixels | Not diagnosed here |
| Mirrored/rotated | Orientation or access-control bits | Controlled rotation test | Only rotation 0 validated |
| Works until another library added | Pin conflict or changed dependency | Compare pinned versions and mapping | Hypothesis, not tested |
