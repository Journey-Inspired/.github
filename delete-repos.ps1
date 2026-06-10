# Journey-Inspired Organization - Automated Repository Deletion Script (PowerShell)
# DANGER: This script will permanently delete all repositories in the organization
# Created: 2026-06-10
# Backup manifest: BACKUP_MANIFEST.md
# Usage: .\delete-repos.ps1

param(
    [switch]$SkipConfirmation = $false
)

$ORG = "Journey-Inspired"
$REPOS = @(
    ".github",
    "introduction-to-github",
    "CopilotForXcode",
    "journey-inspired-mvp",
    "journey-inspired-frontend",
    "journey-inspired-group-site",
    "journey-curated-founder",
    "journey-inspired-platform",
    "journey-inspired-travel-site",
    "journey-inspired-org-engine",
    "journeyinspired-travel"
)

# Check if GitHub CLI is installed
if (-not (Get-Command gh -ErrorAction SilentlyContinue)) {
    Write-Host "Error: GitHub CLI (gh) is not installed." -ForegroundColor Red
    Write-Host "Install it from: https://cli.github.com/"
    exit 1
}

# Check authentication
$authStatus = gh auth status 2>&1
if ($LASTEXITCODE -ne 0) {
    Write-Host "Error: Not authenticated with GitHub CLI." -ForegroundColor Red
    Write-Host "Run: gh auth login"
    exit 1
}

# Display warning
Write-Host "`n╔════════════════════════════════════════════════════════╗" -ForegroundColor Yellow
Write-Host "║   JOURNEY-INSPIRED ORG - REPOSITORY DELETION SCRIPT   ║" -ForegroundColor Yellow
Write-Host "╚════════════════════════════════════════════════════════╝`n" -ForegroundColor Yellow

Write-Host "⚠️  WARNING: This will PERMANENTLY DELETE all repositories!" -ForegroundColor Red
Write-Host ""
Write-Host "Organization: $ORG"
Write-Host "Repositories to delete: $($REPOS.Count)"
Write-Host ""
Write-Host "Repositories:"
foreach ($repo in $REPOS) {
    Write-Host "  - $repo"
}

Write-Host ""
Write-Host "This action CANNOT be undone." -ForegroundColor Red
Write-Host ""

if (-not $SkipConfirmation) {
    $confirmation = Read-Host "Type 'DELETE ALL' to confirm deletion (case-sensitive)"
    
    if ($confirmation -ne "DELETE ALL") {
        Write-Host "Deletion cancelled." -ForegroundColor Yellow
        exit 0
    }
}

Write-Host ""
Write-Host "Starting deletion process..." -ForegroundColor Yellow
Write-Host ""

$deletedCount = 0
$failedCount = 0

foreach ($repo in $REPOS) {
    $fullName = "$ORG/$repo"
    
    Write-Host -NoNewline "Deleting $fullName... "
    
    $output = gh repo delete $fullName --confirm 2>&1
    
    if ($LASTEXITCODE -eq 0) {
        Write-Host "✓ DELETED" -ForegroundColor Green
        $deletedCount++
    } else {
        Write-Host "✗ FAILED" -ForegroundColor Red
        $failedCount++
    }
    
    # Add slight delay to avoid rate limiting
    Start-Sleep -Seconds 1
}

Write-Host ""
Write-Host "╔════════════════════════════════════════════════════════╗" -ForegroundColor Yellow
Write-Host "║                  DELETION SUMMARY                     ║" -ForegroundColor Yellow
Write-Host "╚════════════════════════════════════════════════════════╝" -ForegroundColor Yellow

Write-Host "Deleted: $deletedCount" -ForegroundColor Green
Write-Host "Failed: $failedCount" -ForegroundColor Red
Write-Host ""

if ($failedCount -eq 0) {
    Write-Host "✓ All repositories successfully deleted!" -ForegroundColor Green
} else {
    Write-Host "✗ Some repositories failed to delete. Check permissions and try again." -ForegroundColor Red
}

Write-Host ""
Write-Host "Next steps:"
Write-Host "  1. Verify all repos are deleted: gh repo list $ORG"
Write-Host "  2. Check organization settings for remaining configuration"
Write-Host "  3. Review BACKUP_MANIFEST.md for backup details"
