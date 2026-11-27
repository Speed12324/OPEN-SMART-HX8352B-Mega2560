"""Verify archived source/artifact SHA-256. Python 3 standard library only."""
import hashlib, pathlib, sys
root = pathlib.Path(__file__).resolve().parents[1]
bad = []
manifest = "VENDOR-SHA256SUMS.txt" if "--vendor" in sys.argv else "SHA256SUMS.txt"
for line in (root / "checksums" / manifest).read_text().splitlines():
    digest, relative = line.split("  ", 1)
    p = root / relative
    if not p.is_file() or hashlib.sha256(p.read_bytes()).hexdigest() != digest:
        bad.append(relative)
print("FAILED: " + ", ".join(bad) if bad else "All archived checksums match")
sys.exit(bool(bad))
