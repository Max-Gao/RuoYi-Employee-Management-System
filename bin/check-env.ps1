param(
  [switch]$Strict
)

$ErrorActionPreference = "Stop"

function Get-MajorVersion([string]$v) {
  if (-not $v) { return -1 }
  $m = [regex]::Match($v, "(\d+)")
  if (-not $m.Success) { return -1 }
  return [int]$m.Groups[1].Value
}

function Write-Ok([string]$msg) {
  Write-Host "[OK] $msg" -ForegroundColor Green
}

function Write-Warn([string]$msg) {
  Write-Host "[WARN] $msg" -ForegroundColor Yellow
}

$hasError = $false

$javaVersionLine = (& java -version 2>&1 | Select-Object -First 1)
$javaMajor = Get-MajorVersion $javaVersionLine
if ($javaMajor -ne 21) {
  Write-Warn "JDK expected: 21, current: $javaVersionLine"
  $hasError = $true
} else {
  Write-Ok "JDK version check passed: $javaVersionLine"
}

$mvnLine = (& mvn -v | Select-Object -First 1)
if ($mvnLine) {
  Write-Ok "Maven detected: $mvnLine"
} else {
  Write-Warn "Maven not found in PATH."
  $hasError = $true
}

$nodeVersionLine = (& node -v 2>$null)
$nodeMajor = Get-MajorVersion $nodeVersionLine
if ($nodeMajor -ne 24) {
  Write-Warn "Node expected: 24.x, current: $nodeVersionLine"
  $hasError = $true
} else {
  Write-Ok "Node version check passed: $nodeVersionLine"
}

$npmVersionLine = (& npm.cmd -v 2>$null)
$npmMajor = Get-MajorVersion $npmVersionLine
if ($npmMajor -ne 11) {
  Write-Warn "npm expected: 11.x, current: $npmVersionLine"
  $hasError = $true
} else {
  Write-Ok "npm version check passed: $npmVersionLine"
}

if ($hasError -and $Strict) {
  throw "Environment check failed in strict mode."
}

if ($hasError) {
  Write-Warn "Environment check completed with warnings."
  exit 1
}

Write-Ok "Environment check completed successfully."
