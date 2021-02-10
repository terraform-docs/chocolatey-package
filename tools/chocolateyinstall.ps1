$ErrorActionPreference = 'Stop'

$packageName = 'terraform-docs'
$toolsPath = Split-Path $MyInvocation.MyCommand.Definition
$checksum = '243569f4b1f44be69155d25a5388c50900854b8f17ff6dbbe8d77b4248d1f957'
$url = 'https://github.com/terraform-docs/terraform-docs/releases/download/v0.11.0/terraform-docs-v0.11.0-windows-amd64.exe'
$destination = "$toolsPath\terraform-docs.exe"

Get-ChocolateyWebFile -PackageName $packageName -FileFullPath $destination -Url64bit $url -Checksum64 $checksum -ChecksumType64 sha256
