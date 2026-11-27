param([string]$InstallRoot = "")
$ErrorActionPreference = "Stop"
$root = Split-Path $PSScriptRoot -Parent
if (!$InstallRoot) { $InstallRoot = Join-Path $root "vendor" }
$InstallRoot = [System.IO.Path]::GetFullPath($InstallRoot)
$archive = "arduino-cli_1.5.1_Windows_64bit.zip"
$url = "https://github.com/arduino/arduino-cli/releases/download/v1.5.1/$archive"
$lock = Get-Content "$root/docs/ARDUINO-CLI-1.5.1-SHA256.txt" |
    Where-Object { $_ -match ("\s+" + [regex]::Escape($archive) + "$") }
if (@($lock).Count -ne 1) { throw "Pinned official CLI checksum missing or ambiguous" }
$expected = ($lock.Trim() -split "\s+")[0]
New-Item -ItemType Directory -Force "$InstallRoot/downloads" | Out-Null
$zip = Join-Path $InstallRoot "downloads/$archive"
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
Invoke-WebRequest -UseBasicParsing $url -OutFile $zip
if ((Get-FileHash $zip -Algorithm SHA256).Hash -ne $expected) { throw "CLI archive checksum mismatch" }
Expand-Archive $zip "$InstallRoot/cli-1.5.1" -Force
$cli = "$InstallRoot/cli-1.5.1/arduino-cli.exe"
$env:ARDUINO_DIRECTORIES_DATA = "$InstallRoot/arduino-data"
$env:ARDUINO_DIRECTORIES_USER = "$root/.state/user"
$env:ARDUINO_DIRECTORIES_DOWNLOADS = "$InstallRoot/downloads"
New-Item -ItemType Directory -Force $env:ARDUINO_DIRECTORIES_USER | Out-Null
& $cli version
if ($LASTEXITCODE -ne 0) { throw "CLI version check failed" }
& $cli core update-index
if ($LASTEXITCODE -ne 0) { throw "Official package index download failed" }
& $cli core install arduino:avr@1.8.8
if ($LASTEXITCODE -ne 0) { throw "Pinned core installation failed" }
# CLI verifies package checksums from Arduino's official index.
& $cli core list
if ($LASTEXITCODE -ne 0) { throw "Core check failed" }
Write-Output "Pinned tools installed. No sketch compiled or uploaded."
