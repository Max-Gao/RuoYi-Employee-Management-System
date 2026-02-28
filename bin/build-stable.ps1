$ErrorActionPreference = "Stop"

$root = Split-Path -Parent $PSScriptRoot

Write-Host "==> Step 1/4: Checking toolchain versions"
& "$PSScriptRoot\check-env.ps1" -Strict

Write-Host "==> Step 2/4: Backend clean package"
Push-Location $root
try {
  & mvn -DskipTests clean package
} finally {
  Pop-Location
}

Write-Host "==> Step 3/4: Frontend install"
Push-Location "$root\ruoyi-ui"
try {
  & npm.cmd install --legacy-peer-deps --no-audit --fund=false
} finally {
  Pop-Location
}

Write-Host "==> Step 4/4: Frontend production build"
Push-Location "$root\ruoyi-ui"
try {
  & npm.cmd run build:prod
} finally {
  Pop-Location
}

Write-Host "==> Stable build finished successfully"
