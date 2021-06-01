$ErrorActionPreference = 'Stop'

$packageName = 'terraform-docs'
$toolsPath = Split-Path $MyInvocation.MyCommand.Definition
$checksum = '965a729d37797291fc22c1c1983e4347bf9f8146e670bf5eb86e77da142716e1'
$url = 'https://github.com/terraform-docs/terraform-docs/releases/download/v0.14.1/terraform-docs-v0.14.1-windows-amd64.zip'
$destination = "$toolsPath\terraform-docs.exe"

Install-ChocolateyZipPackage -PackageName $packageName -Url64bit $url -Checksum64 $checksum -ChecksumType64 sha256 -UnzipLocation $destination
