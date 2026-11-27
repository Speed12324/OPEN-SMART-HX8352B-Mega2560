param([string]$Cli = "", [switch]$VerboseBuild)
$ErrorActionPreference = "Stop"
$root = Split-Path $PSScriptRoot -Parent
if (!$Cli) {
    $Cli = Join-Path $root "vendor/cli-1.5.1/arduino-cli.exe"
    if (!(Test-Path $Cli)) { $Cli = Join-Path $root "vendor/arduino-cli.exe" }
}
if (!(Test-Path $Cli)) { throw "Run scripts/install-tools.ps1 to install pinned tools from official sources." }
$data = Join-Path $root "vendor/arduino-data"
$state = Join-Path $root ".state"
$build = Join-Path $root ".build"
New-Item -ItemType Directory -Force $state,$build,"$state/user","$state/downloads" | Out-Null
$env:ARDUINO_DIRECTORIES_DATA = $data
$env:ARDUINO_DIRECTORIES_USER = "$state/user"
$env:ARDUINO_DIRECTORIES_DOWNLOADS = "$state/downloads"
$argsList = @("compile","--clean","--fqbn","arduino:avr:mega",
 "--build-path",$build,"--output-dir","$build/output",
 "--library","$root/libraries/MCUFRIEND_kbv",
 "--library","$root/libraries/Adafruit_GFX_Library",
 "--library","$root/libraries/Adafruit_BusIO","$root/color_test")
if ($VerboseBuild) { $argsList += "--verbose" }
& $Cli @argsList
if ($LASTEXITCODE -ne 0) { throw "Build failed: $LASTEXITCODE" }
Get-FileHash "$build/output/color_test.ino.hex" -Algorithm SHA256
