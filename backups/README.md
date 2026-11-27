# Original pre-test backups / Резервные копии до теста

- `original-eeprom.hex`: Intel HEX dump of all 4096 EEPROM bytes, all `0xFF`.
  Parsed and checked before inclusion. This is the pre-diagnostic backup,
  not the empty compiler-generated `.eep` file.
- Original Flash: **deliberately not uploaded**. Parsed 262144 bytes; readable
  strings identify prior network-program data. It may contain confidential
  credentials/configuration; publishing even to a private repo is unnecessary.
  No sanitized dump is substituted for the original.

Both unmodified backups remain locally in:
`D:\opencode\tft-diagnostics` and the timestamped full project backup
`D:\opencode\tft-diagnostics-backup-20261128-004314`.
The original full file inventory and digests are in `checksums/INITIAL-INVENTORY.txt`.
Only names, sizes and SHA-256 values, not previous firmware strings, are recorded.

This exclusion does **not** prevent restoring the working display solution:
the verified working application HEX is `firmware/color_test.hex`.
The application HEX assumes a working Mega-compatible bootloader.
