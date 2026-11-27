# Hardware / Оборудование

| Item / Компонент | Observed / Наблюдение |
|---|---|
| Host / ПК | Windows x64; USB serial |
| Board / Плата | Blue Mega 2560 board, ATmega2560 marking visible in owner photographs |
| USB bridge | CH340, USB VID 1A86 / PID 7523; COM3 during experiment |
| Display | Red OPEN-SMART TFT LCD Shield, PCB text `Driver IC: HX8352B` |
| LCD interface | Parallel 8-bit OPEN-SMART mapping; see PINOUT |
| Driver geometry | 240 × 400 in portrait according to archived driver |
| Firmware | Original `color_test.ino`, `setRotation(0)` |
| Evidence | PC webcam, General Image Device |

The LCD controller itself is not exposed for direct chip-marking inspection:
HX8352B identification comes from **PCB text plus the returned ID 0x0065**.
No electrical probing, power-rail measurement or PCB continuity test was done.
The successful result was obtained without moving contacts, rewiring or changing
the physical shield connection. USB power was sufficient for this experiment;
that is not a general electrical certification.

На фото платы есть SD-слот и дополнительные элементы. Их работоспособность,
как и сенсорный ввод, **не проверялась**. Не подключайте новые нагрузки к общей
шине до отдельного анализа конфликтов.

No device firmware was modified during the archival task.
