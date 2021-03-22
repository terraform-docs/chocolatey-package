$ErrorActionPreference = 'Stop'

$packageName = 'terraform-docs'
$toolsPath = Split-Path $MyInvocation.MyCommand.Definition
$checksum = '14b7016bf00e7f3cfb49a78f393b95ea624fe5f906b68207a19e0f5de55c0190'
$url = 'https://github.com/terraform-docs/terraform-docs/releases/download/v0.12.0/terraform-docs-v0.12.0-windows-amd64.exe'
$destination = "$toolsPath\terraform-docs.exe"

Get-ChocolateyWebFile -PackageName $packageName -FileFullPath $destination -Url64bit $url -Checksum64 $checksum -ChecksumType64 sha256
