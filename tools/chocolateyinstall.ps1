$ErrorActionPreference = 'Stop'

$packageName = 'terraform-docs'
$toolsPath = Split-Path $MyInvocation.MyCommand.Definition
$checksum = 'ec07ddd6cab4a8f595a91a025345028197dfba2bce40eebdf8d63e8d4e0ac4de'
$url = 'https://github.com/terraform-docs/terraform-docs/releases/download/v0.10.1/terraform-docs-v0.10.1-windows-amd64.exe'
$destination = "$toolsPath\terraform-docs.exe"

Get-ChocolateyWebFile -PackageName $packageName -FileFullPath $destination -Url64bit $url -Checksum64 $checksum -ChecksumType64 sha256
