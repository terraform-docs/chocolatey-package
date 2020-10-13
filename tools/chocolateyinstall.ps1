$ErrorActionPreference = 'Stop'

$packageName = 'terraform-docs'
$toolsPath = Split-Path $MyInvocation.MyCommand.Definition
$checksum = '6eaecdfa79ce8eb9231aaf9f0a40bf0b0b19cac0f4cd49f4428d7e0f636ee85e'
$url = 'https://github.com/terraform-docs/terraform-docs/releases/download/v0.10.0/terraform-docs-v0.10.0-windows-amd64.exe'
$destination = "$toolsPath\terraform-docs.exe"

Get-ChocolateyWebFile -PackageName $packageName -FileFullPath $destination -Url64bit $url -Checksum64 $checksum -ChecksumType64 sha256
