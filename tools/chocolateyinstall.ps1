$ErrorActionPreference = 'Stop'

$packageName = 'terraform-docs'
$toolsPath = Split-Path $MyInvocation.MyCommand.Definition
$checksum = '0c12373034b8fca42911316273d3224a01895db3d3ed8a02446a3a07796618c4'
$url = 'https://github.com/terraform-docs/terraform-docs/releases/download/v0.11.1/terraform-docs-v0.11.1-windows-amd64.exe'
$destination = "$toolsPath\terraform-docs.exe"

Get-ChocolateyWebFile -PackageName $packageName -FileFullPath $destination -Url64bit $url -Checksum64 $checksum -ChecksumType64 sha256
