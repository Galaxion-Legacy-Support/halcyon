# Copies the files listed in scripts/nuget-libs.txt from restored NuGet packages
# into bin/. Called by runprebuild.bat; runprebuild.sh does the same in shell.
$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $PSScriptRoot
$packages = Join-Path $root 'packages'
$bin = Join-Path $root 'bin'
# 1.6.0.0, 1.6.0 and 1.6 are the same version to NuGet.
function Short([string]$v) { while ($v -match '\.0$') { $v = $v -replace '\.0$', '' }; $v }
if (-not (Test-Path $packages)) {
    [Console]::Error.WriteLine("runprebuild: no packages/ folder. Run 'nuget restore Halcyon.sln' first."); exit 1
}
$missing = 0
foreach ($line in Get-Content (Join-Path $PSScriptRoot 'nuget-libs.txt')) {
    if ($line -match '^\s*(#|$)') { continue }
    $id, $version, $rel, $dest = -split $line
    $dir = Get-ChildItem $packages -Directory | Where-Object {
        $_.Name.StartsWith("$id.", 'OrdinalIgnoreCase') -and
        (Short $_.Name.Substring($id.Length + 1)) -eq (Short $version)
    } | Select-Object -First 1
    $src = if ($dir) { Join-Path $dir.FullName $rel } else { $null }
    if (-not $src -or -not (Test-Path $src)) {
        [Console]::Error.WriteLine("runprebuild: missing $id $version ($rel)"); $missing++; continue
    }
    $to = if ($dest -eq '.') { $bin } else { Join-Path $bin $dest }
    New-Item -ItemType Directory -Force -Path $to | Out-Null
    Copy-Item $src $to -Force
}
if ($missing) {
    [Console]::Error.WriteLine("runprebuild: restored packages are:")
    Get-ChildItem $packages -Directory | ForEach-Object { [Console]::Error.WriteLine("  " + $_.Name) }
    exit 1
}
