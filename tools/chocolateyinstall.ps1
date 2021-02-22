$ErrorActionPreference = 'Stop'

$packageName = 'terraform-docs'
$toolsPath = Split-Path $MyInvocation.MyCommand.Definition
$checksum = '8bdf5ddb865cd095cb47eabeb4c4c89aec4aff4215b6be8a0f23aebbd94635af'
$url = 'https://github.com/terraform-docs/terraform-docs/releases/download/v0.11.2/terraform-docs-v0.11.2-windows-amd64.exe'
$destination = "$toolsPath\terraform-docs.exe"

Get-ChocolateyWebFile -PackageName $packageName -FileFullPath $destination -Url64bit $url -Checksum64 $checksum -ChecksumType64 sha256
