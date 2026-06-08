# vuln-scanner Skill Installer
# Installs to: Copilot and Antigravity

New-Item -ItemType Directory -Force -Path "$env:USERPROFILE\.copilot\skills\vuln-scanner" | Out-Null
New-Item -ItemType Directory -Force -Path "$env:USERPROFILE\.gemini\antigravity\skills\vuln-scanner" | Out-Null

copy "$env:USERPROFILE\Downloads\vuln-scanner\SKILL.md" "$env:USERPROFILE\.copilot\skills\vuln-scanner\SKILL.md"
copy "$env:USERPROFILE\Downloads\vuln-scanner\SKILL.md" "$env:USERPROFILE\.gemini\antigravity\skills\vuln-scanner\SKILL.md"

Write-Host ""
Write-Host "Done! Restart your IDE to activate the skill." -ForegroundColor Cyan
Write-Host ""
