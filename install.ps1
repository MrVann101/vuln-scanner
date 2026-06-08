# vuln-scanner Skill Installer
# Installs to: VS Code and Antigravity

$skillName = "vuln-scanner"
$source = "$env:USERPROFILE\Downloads\$skillName"

$targets = @(
    "$env:USERPROFILE\.vscode\skills\$skillName",
    "$env:USERPROFILE\.gemini\antigravity\skills\$skillName"
)

Write-Host ""
Write-Host "Installing '$skillName' skill..." -ForegroundColor Cyan
Write-Host ""

foreach ($target in $targets) {
    try {
        New-Item -ItemType Directory -Force -Path $target | Out-Null
        Copy-Item -Path "$source\*" -Destination $target -Recurse -Force
        Write-Host "  [OK] $target" -ForegroundColor Green
    } catch {
        Write-Host "  [SKIP] $target — $($_.Exception.Message)" -ForegroundColor Yellow
    }
}

Write-Host ""
Write-Host "Done! Restart your IDE to activate the skill." -ForegroundColor Cyan
Write-Host ""
