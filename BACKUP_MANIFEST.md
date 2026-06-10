# Journey-Inspired Organization Backup Manifest
**Generated:** 2026-06-10  
**Organization:** Journey-Inspired

## Organization Overview
- **Type:** Organization
- **Created:** 2024
- **Total Repositories:** 11

---

## Repository Inventory & Backup Status

### 1. `.github`
- **URL:** https://github.com/Journey-Inspired/.github
- **Language:** Not specified
- **Stars:** 1
- **Description:** Organization configuration repository
- **Status:** ✅ Configuration (preserve if needed)

### 2. `introduction-to-github`
- **URL:** https://github.com/Journey-Inspired/introduction-to-github
- **Language:** Not specified
- **Stars:** 0
- **Description:** Get started using GitHub in less than an hour
- **Status:** ✅ Educational/template content

### 3. `CopilotForXcode`
- **URL:** https://github.com/Journey-Inspired/CopilotForXcode
- **Language:** Not specified
- **Stars:** 0
- **Description:** AI coding assistant for Xcode
- **Status:** ✅ Source code repository

### 4. `journey-inspired-mvp`
- **URL:** https://github.com/Journey-Inspired/journey-inspired-mvp
- **Language:** JavaScript
- **Stars:** 0
- **Description:** MVP project
- **Status:** ✅ Active development

### 5. `journey-inspired-frontend`
- **URL:** https://github.com/Journey-Inspired/journey-inspired-frontend
- **Language:** Not specified
- **Stars:** 0
- **Description:** Authoritative front-end architecture and governance repository for Journey Inspired's multi-domain digital ecosystem (corporate, platform, and founder-architect portals)
- **Status:** ✅ Critical architecture repository

### 6. `journey-inspired-group-site`
- **URL:** https://github.com/Journey-Inspired/journey-inspired-group-site
- **Language:** Not specified
- **Stars:** 0
- **Description:** Corporate site
- **Status:** ✅ Production website

### 7. `journey-curated-founder`
- **URL:** https://github.com/Journey-Inspired/journey-curated-founder
- **Language:** Not specified
- **Stars:** 0
- **Description:** Founder portal
- **Status:** ✅ Active platform

### 8. `journey-inspired-platform`
- **URL:** https://github.com/Journey-Inspired/journey-inspired-platform
- **Language:** Not specified
- **Stars:** 0
- **Description:** Platform portal
- **Status:** ✅ Active platform

### 9. `journey-inspired-travel-site`
- **URL:** https://github.com/Journey-Inspired/journey-inspired-travel-site
- **Language:** Not specified
- **Stars:** 0
- **Description:** Travel site
- **Status:** ✅ Active platform

### 10. `journey-inspired-org-engine`
- **URL:** https://github.com/Journey-Inspired/journey-inspired-org-engine
- **Language:** Not specified
- **Stars:** 0
- **Description:** Primary engine file — contains the full Org Design & Governance Engine, including entity model, RACI, SLA, governance, licensing, PMO, and role mandates. This is your board-grade source of truth.
- **Status:** ✅ **CRITICAL** - Governance & compliance

### 11. `journeyinspired-travel`
- **URL:** https://github.com/Journey-Inspired/journeyinspired-travel
- **Language:** Not specified
- **Stars:** 1
- **Description:** Phase 1 revenue-first travel commerce and concierge platform for Journey Inspired — focused on curated travel experiences, reseller packages, affiliate offers, and lead generation.
- **Status:** ✅ **CRITICAL** - Revenue-generating platform

---

## Backup Instructions

### Before Deletion, Archive:
1. **Critical Repositories** (recommended backup):
   - `journey-inspired-org-engine` - Contains governance, compliance, RACI matrices
   - `journeyinspired-travel` - Revenue-generating platform
   - `journey-inspired-frontend` - Shared architecture standards

2. **How to Backup Locally:**
   ```bash
   # Clone all repositories
   git clone --mirror https://github.com/Journey-Inspired/[REPO_NAME].git
   
   # Or use GitHub CLI to archive
   gh repo clone Journey-Inspired/[REPO_NAME] --archive
   ```

3. **Export Issues & PRs** (optional):
   ```bash
   gh api repos/Journey-Inspired/[REPO_NAME]/issues --paginate > backup_issues.json
   gh api repos/Journey-Inspired/[REPO_NAME]/pulls --paginate > backup_prs.json
   ```

---

## Deletion Checklist
- [ ] Backup critical repositories locally
- [ ] Export important issues/PRs/discussions
- [ ] Confirm no active deployments depend on these repos
- [ ] Verify no external integrations reference these repos
- [ ] Get stakeholder approval for deletion

**⚠️ WARNING: This action is irreversible. Ensure proper backups are in place.**
