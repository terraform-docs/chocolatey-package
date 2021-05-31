$ErrorActionPreference = 'Stop'

$packageName = 'terraform-docs'
$toolsPath = Split-Path $MyInvocation.MyCommand.Definition
$checksum = '0d2df76699f10dc6e20c899da4df96ce915a97978eb6ee3069ca32b6cfcb856e'
$url = 'https://github.com/terraform-docs/terraform-docs/releases/download/v0.14.0/terraform-docs-v0.14.0-windows-amd64.zip'
$destination = "$toolsPath\terraform-docs.exe"

Install-ChocolateyZipPackage -PackageName $packageName -Url64bit $url -Checksum64 $checksum -ChecksumType64 sha256 -UnzipLocation $destination
