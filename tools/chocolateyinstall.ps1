$ErrorActionPreference = 'Stop'

$packageName = 'terraform-docs'
$toolsPath = Split-Path $MyInvocation.MyCommand.Definition
$checksum = '0664e27f9723824241f99f40465b62bbadcec0bf0a75b76712c9cf31fd0d49f0'
$url = 'https://github.com/terraform-docs/terraform-docs/releases/download/v0.13.0/terraform-docs-v0.13.0-windows-amd64.zip'
$destination = "$toolsPath\terraform-docs.exe"

Install-ChocolateyZipPackage -PackageName $packageName -Url64bit $url -Checksum64 $checksum -ChecksumType64 sha256 -UnzipLocation $destination
