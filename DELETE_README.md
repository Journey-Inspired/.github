# 🚨 Organization Reset - Automated Deletion Scripts

**Generated:** 2026-06-10  
**Purpose:** Safely delete all repositories in Journey-Inspired organization

---

## ⚠️ CRITICAL WARNINGS

- **THIS IS IRREVERSIBLE** — Deleted repositories cannot be recovered
- **BACKUP FIRST** — Review `BACKUP_MANIFEST.md` before proceeding
- **VERIFY DEPENDENCIES** — Ensure no active deployments use these repos
- **ORGANIZATIONAL IMPACT** — Notify all team members before deletion

---

## 📋 Pre-Deletion Checklist

Before running any deletion script:

- [ ] **Backups Created** — Run local git mirrors of critical repos
  ```bash
  git clone --mirror https://github.com/Journey-Inspired/journey-inspired-org-engine.git
  git clone --mirror https://github.com/Journey-Inspired/journeyinspired-travel.git
  git clone --mirror https://github.com/Journey-Inspired/journey-inspired-frontend.git
  ```

- [ ] **Export Data** — Save issues, PRs, discussions
  ```bash
  gh api repos/Journey-Inspired/[REPO]/issues --paginate > issues.json
  gh api repos/Journey-Inspired/[REPO]/pulls --paginate > pulls.json
  ```

- [ ] **Team Notified** — Alert all organization members

- [ ] **Production Verified** — Confirm no active deployments depend on these repos

- [ ] **Approvals Obtained** — Get stakeholder sign-off

---

## 🔧 Usage Instructions

### Prerequisites

1. **Install GitHub CLI**
   ```bash
   # macOS (Homebrew)
   brew install gh
   
   # Windows (Chocolatey)
   choco install gh
   
   # Linux (apt)
   sudo apt install gh
   
   # Or download from: https://cli.github.com/
   ```

2. **Authenticate**
   ```bash
   gh auth login
   ```

3. **Verify Access**
   ```bash
   gh repo list Journey-Inspired
   ```

---

### Option 1: Bash Script (macOS/Linux)

```bash
# Download the script
curl -O https://raw.githubusercontent.com/Journey-Inspired/.github/main/delete-repos.sh

# Make executable
chmod +x delete-repos.sh

# Run the script
./delete-repos.sh

# When prompted, type: DELETE ALL
```

---

### Option 2: PowerShell Script (Windows)

```powershell
# Download the script
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/Journey-Inspired/.github/main/delete-repos.ps1" -OutFile "delete-repos.ps1"

# Allow script execution (if needed)
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

# Run the script
.\delete-repos.ps1

# When prompted, type: DELETE ALL
```

---

### Option 3: Manual Deletion (One by One)

```bash
# Delete individual repos
gh repo delete Journey-Inspired/.github --confirm
gh repo delete Journey-Inspired/introduction-to-github --confirm
gh repo delete Journey-Inspired/CopilotForXcode --confirm
gh repo delete Journey-Inspired/journey-inspired-mvp --confirm
gh repo delete Journey-Inspired/journey-inspired-frontend --confirm
gh repo delete Journey-Inspired/journey-inspired-group-site --confirm
gh repo delete Journey-Inspired/journey-curated-founder --confirm
gh repo delete Journey-Inspired/journey-inspired-platform --confirm
gh repo delete Journey-Inspired/journey-inspired-travel-site --confirm
gh repo delete Journey-Inspired/journey-inspired-org-engine --confirm
gh repo delete Journey-Inspired/journeyinspired-travel --confirm

# Verify deletion
gh repo list Journey-Inspired
```

---

## 📊 Repositories to be Deleted

| # | Repository | Type | Status |
|---|---|---|---|
| 1 | `.github` | Config | Configuration |
| 2 | `introduction-to-github` | Template | Educational |
| 3 | `CopilotForXcode` | Source | Tool |
| 4 | `journey-inspired-mvp` | Source | Development |
| 5 | `journey-inspired-frontend` | Source | **Critical** |
| 6 | `journey-inspired-group-site` | Source | Production |
| 7 | `journey-curated-founder` | Source | Active |
| 8 | `journey-inspired-platform` | Source | Active |
| 9 | `journey-inspired-travel-site` | Source | Active |
| 10 | `journey-inspired-org-engine` | Source | **Critical** |
| 11 | `journeyinspired-travel` | Source | **Critical** |

---

## ✅ After Deletion

1. **Verify Deletion**
   ```bash
   gh repo list Journey-Inspired
   # Should return: No repositories found
   ```

2. **Check Organization Settings**
   - Visit: https://github.com/organizations/Journey-Inspired/settings
   - Review Teams, Members, and Integrations
   - Remove any webhooks or integrations if needed

3. **Document Completion**
   - Archive this script file
   - Update team documentation
   - Store backup location securely

4. **Next Steps**
   - Recreate repos from backups if needed
   - Reconfigure organization settings
   - Set up new governance policies

---

## 🆘 Troubleshooting

### "Not authenticated with GitHub CLI"
```bash
gh auth login
# Follow prompts to authenticate
```

### "Permission denied"
- Verify you have **admin access** to the organization
- Check if organization requires 2FA
- Confirm your GitHub token has `repo:delete` scope

### "Script execution policy" (PowerShell)
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

### "Rate limiting"
Scripts include 1-second delays between deletions. If you hit rate limits:
- Wait 1 hour for limits to reset
- Run script again to delete remaining repos

---

## 📞 Support

For issues or questions:
1. Check GitHub CLI documentation: https://cli.github.com/
2. Review backup manifest: `BACKUP_MANIFEST.md`
3. Contact organization admins

---

**Last Updated:** 2026-06-10  
**Status:** Ready for execution
