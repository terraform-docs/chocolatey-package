$ErrorActionPreference = 'Stop'

$packageName = 'terraform-docs'
$toolsPath = Split-Path $MyInvocation.MyCommand.Definition
$checksum = '8414aa93ccc430966c70e5b184549f893bf5e78b77c977874dca51b94c063631'
$url = 'https://github.com/terraform-docs/terraform-docs/releases/download/v0.15.0/terraform-docs-v0.15.0-windows-amd64.zip'
$destination = "$toolsPath\terraform-docs.exe"

Install-ChocolateyZipPackage -PackageName $packageName -Url64bit $url -Checksum64 $checksum -ChecksumType64 sha256 -UnzipLocation $destination
