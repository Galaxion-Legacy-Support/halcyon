# Checks that every program config redirects log4net to the version in bin\log4net.dll.
# Run after runprebuild. LibreMetaverse.dll was built against log4net 2.0.8, so
# without a matching redirect it can't load log4net at runtime.
$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $PSScriptRoot
$dll = Join-Path $root 'bin\log4net.dll'
$name = [Reflection.AssemblyName]::GetAssemblyName($dll)
$version = $name.Version.ToString()
$token = -join ($name.GetPublicKeyToken() | ForEach-Object { $_.ToString('x2') })
Write-Host "bin\log4net.dll: version $version, public key token $token"

$configs = 'InWorldz\Halcyon\app.config', 'OpenSim\Grid\GridServer\app.config',
           'OpenSim\Grid\MessagingServer\app.config', 'OpenSim\Grid\UserServer\app.config',
           'OpenSim\TestSuite\app.config'
$bad = 0
foreach ($c in $configs) {
    [xml]$x = Get-Content (Join-Path $root $c)
    $ns = @{ a = 'urn:schemas-microsoft-com:asm.v1' }
    $dep = Select-Xml -Xml $x -Namespace $ns -XPath "//a:dependentAssembly[a:assemblyIdentity/@name='log4net']"
    if (-not $dep) { Write-Host "::error file=$c::no binding redirect for log4net"; $bad++; continue }
    $id = $dep.Node.assemblyIdentity; $br = $dep.Node.bindingRedirect
    if ($id.publicKeyToken -ne $token) { Write-Host "::error file=$c::log4net redirect has token $($id.publicKeyToken), bin\log4net.dll has $token"; $bad++ }
    if ($br.newVersion -ne $version) { Write-Host "::error file=$c::log4net redirect goes to $($br.newVersion), bin\log4net.dll is $version"; $bad++ }
    $top = [version]($br.oldVersion -split '-')[-1]
    if ($top -lt [version]$version -or $top -lt [version]'2.0.8.0') { Write-Host "::error file=$c::log4net redirect's oldVersion $($br.oldVersion) must cover 2.0.8.0 to $version"; $bad++ }
    if ($bad -eq 0) { Write-Host "$c redirects log4net to $version" }
}
if ($bad) { exit 1 }
