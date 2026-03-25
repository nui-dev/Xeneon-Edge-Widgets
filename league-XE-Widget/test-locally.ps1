param(
  [int]$Port = 8000
)

$repoRoot = Split-Path -Parent $PSScriptRoot
$url = "http://localhost:$Port/league-XE-Widget/League%20of%20Legends%20for%20XE"

Write-Host "Serving Xeneon widget test page from $repoRoot on port $Port"
Write-Host "Open: $url"
Write-Host ""
Write-Host "Press Ctrl+C to stop."

Push-Location $repoRoot
try {
  if (Get-Command py -ErrorAction SilentlyContinue) {
    py -m http.server $Port
  } elseif (Get-Command python -ErrorAction SilentlyContinue) {
    python -m http.server $Port
  } else {
    Write-Error "Python was not found. Install Python or run any static file server from $repoRoot."
    exit 1
  }
} finally {
  Pop-Location
}
