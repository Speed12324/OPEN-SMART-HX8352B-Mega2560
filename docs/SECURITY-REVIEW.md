# Public-distribution review

Review date: 2026-11-28. Hardware application, configured drivers and firmware
remain unchanged. This report records scope and limitations, not a guarantee
that automated scanning can prove the absence of every possible secret.

## Scope

- Fetch all advertised remote heads/tags; scan all reachable Git history.
- Gitleaks 8.30.1, official executable ZIP verified against upstream checksums.
- Redacted findings only; no credential values in reports or documentation.
- Scan release files, nested archive contents, decoded Intel HEX/EEPROM and
  printable strings extracted from binaries.
- Inspect image metadata and inspect technical image content.
- Review passwords/tokens/keys, configuration strings and identifying metadata.
- Recheck the final source archive and remaining release assets before visibility changes.

## Resolved excluded-bundle finding

Gitleaks found a secret field in a CLI-generated installation inventory inside
the binary environment bundle. That entire asset was removed from the release.
It was not a committed Git source file. No secret value is reproduced here.
Generated `vendor/` and `.state/` remain ignored and must never be uploaded.

The binary environment also lacked a complete corresponding-source package for
all redistributed tools. It is not publicly distributed. Public tool setup uses
versioned official downloads with checksum verification instead.
Application-linked Arduino source and license notices are supplied under `sources/`.

## Firmware, EEPROM and photographs

- Application HEX remains SHA-256
  `5c606f44398f1e92de6aa939ce354e2dd6326a18caf083ca3bc50c6788f7d964`.
- The published EEPROM dump decodes to 4096 bytes of `0xFF`.
- Working-display JPEG: no EXIF tags, GPS, XMP or comment metadata.
- Image contains the LCD test, not credentials or unrelated application windows.
- Third-party copyright names/contact notices are retained as legally required,
  not treated as credentials.
- Older technical documentation remains in Git history; no history rewriting
  or tag replacement is performed. Current docs and custom release source ZIP
  omit local system paths, personal narrative and location/time-zone context.

## Reproducibility

Fresh installation from official CLI 1.5.1 / Core 1.8.8 sources followed by a
clean build produced the byte-identical hardware-tested HEX. No device upload.
See [VALIDATION](VALIDATION.md) and [REPRODUCE](REPRODUCE.md).

Public visibility is gated on zero unresolved findings in all intended public
artifacts. Local excluded build bundles and backup material are not published.
