# Troubleshooting / Поиск неисправностей

Start by restoring the archived solution, not by upgrading dependencies.
Сначала восстановите зафиксированное решение, не обновляйте библиотеки.

1. Verify hashes with `python scripts/verify.py`.
2. Verify all three macros are active (not just present inside comments).
3. Verify **`tft.begin(0x0065)`** and FQBN `arduino:avr:mega`.
4. Build with the provided script and check that **all three external library
   paths point into this checkout**. Wire and SPI must come from core 1.8.8.
5. On a replacement PC install the appropriate CH340 driver if no serial port
   appears. Port COM3 is historical, not guaranteed on another machine.
6. Do not confuse `0x8352` with `0x0065`, or HX8352-A with HX8352-B.
7. Do not wire physical RESET to WR: the library's reset macro is a dummy alias.
8. Only if deliberately restoring device firmware, use the separately guarded
   upload script. Close other serial monitors first.

Expected output: red/green/blue bands, white text. It is sideways when the
portrait test is viewed on a physically landscape-positioned panel.
Do not rotate/refactor the archived sketch just to make the photograph horizontal.

Backlight on ≠ LCD controller initialized.
Подсветка ≠ правильная инициализация.

Never brute-force arbitrary GPIO output combinations: bus contention and
incorrect power connections can damage hardware. If the exact archived image
no longer works, document the hardware state before altering contacts.
See the confirmed/hypothetical symptom table in DIAGNOSTICS.
