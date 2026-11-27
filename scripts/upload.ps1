param([string]$Port = "COM3", [switch]$ConfirmUpload)
$ErrorActionPreference = "Stop"
if (!$ConfirmUpload) { throw "This replaces device firmware. Re-run with -ConfirmUpload only when intended." }
$root = Split-Path $PSScriptRoot -Parent
$env:ARDUINO_DIRECTORIES_DATA = "$root/vendor/arduino-data"
$env:ARDUINO_DIRECTORIES_USER = "$root/.state/user"
$env:ARDUINO_DIRECTORIES_DOWNLOADS = "$root/.state/downloads"
& "$root/vendor/arduino-cli.exe" upload --fqbn arduino:avr:mega --port $Port --input-file "$root/firmware/color_test.hex"
if ($LASTEXITCODE -ne 0) { throw "Upload failed" }
