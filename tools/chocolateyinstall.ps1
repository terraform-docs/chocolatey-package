$ErrorActionPreference = 'Stop'

$packageName = 'terraform-docs'
$toolsPath = Split-Path $MyInvocation.MyCommand.Definition
$checksum = '37de7c80d96c43095cfa40322ca9cfedcd3e7a8aed084190cacd850c7d8217ab'
$url = 'https://github.com/terraform-docs/terraform-docs/releases/download/v0.18.0/terraform-docs-v0.18.0-windows-amd64.zip'
$destination = "$toolsPath\terraform-docs.exe"

Install-ChocolateyZipPackage -PackageName $packageName -Url64bit $url -Checksum64 $checksum -ChecksumType64 sha256 -UnzipLocation $destination
