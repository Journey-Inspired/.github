#!/bin/bash

# Journey-Inspired Organization - Automated Repository Deletion Script
# DANGER: This script will permanently delete all repositories in the organization
# Created: 2026-06-10
# Backup manifest: BACKUP_MANIFEST.md

set -e

ORG="Journey-Inspired"
REPOS=(
  ".github"
  "introduction-to-github"
  "CopilotForXcode"
  "journey-inspired-mvp"
  "journey-inspired-frontend"
  "journey-inspired-group-site"
  "journey-curated-founder"
  "journey-inspired-platform"
  "journey-inspired-travel-site"
  "journey-inspired-org-engine"
  "journeyinspired-travel"
)

# Color codes for output
RED='\033[0;31m'
YELLOW='\033[1;33m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

# Check if GitHub CLI is installed
if ! command -v gh &> /dev/null; then
    echo -e "${RED}Error: GitHub CLI (gh) is not installed.${NC}"
    echo "Install it from: https://cli.github.com/"
    exit 1
fi

# Check if user is authenticated
if ! gh auth status &> /dev/null; then
    echo -e "${RED}Error: Not authenticated with GitHub CLI.${NC}"
    echo "Run: gh auth login"
    exit 1
fi

echo -e "${YELLOW}╔════════════════════════════════════════════════════════╗${NC}"
echo -e "${YELLOW}║   JOURNEY-INSPIRED ORG - REPOSITORY DELETION SCRIPT   ║${NC}"
echo -e "${YELLOW}╚════════════════════════════════════════════════════════╝${NC}"
echo ""
echo -e "${RED}⚠️  WARNING: This will PERMANENTLY DELETE all repositories!${NC}"
echo ""
echo "Organization: $ORG"
echo "Repositories to delete: ${#REPOS[@]}"
echo ""
echo "Repositories:"
for repo in "${REPOS[@]}"; do
    echo "  - $repo"
done
echo ""
echo -e "${RED}This action CANNOT be undone.${NC}"
echo ""
read -p "Type 'DELETE ALL' to confirm deletion (case-sensitive): " confirmation

if [ "$confirmation" != "DELETE ALL" ]; then
    echo -e "${YELLOW}Deletion cancelled.${NC}"
    exit 0
fi

echo ""
echo -e "${YELLOW}Starting deletion process...${NC}"
echo ""

deleted_count=0
failed_count=0
skipped_count=0

for repo in "${REPOS[@]}"; do
    full_name="$ORG/$repo"
    
    echo -n "Deleting $full_name... "
    
    if gh repo delete "$full_name" --confirm 2>/dev/null; then
        echo -e "${GREEN}✓ DELETED${NC}"
        ((deleted_count++))
    else
        echo -e "${RED}✗ FAILED${NC}"
        ((failed_count++))
    fi
    
    # Add slight delay to avoid rate limiting
    sleep 1
done

echo ""
echo -e "${YELLOW}╔════════════════════════════════════════════════════════╗${NC}"
echo -e "${YELLOW}║                  DELETION SUMMARY                     ║${NC}"
echo -e "${YELLOW}╚════════════════════════════════════════════════════════╝${NC}"
echo -e "${GREEN}Deleted: $deleted_count${NC}"
echo -e "${RED}Failed: $failed_count${NC}"
echo ""

if [ $failed_count -eq 0 ]; then
    echo -e "${GREEN}✓ All repositories successfully deleted!${NC}"
else
    echo -e "${RED}✗ Some repositories failed to delete. Check permissions and try again.${NC}"
fi

echo ""
echo "Next steps:"
echo "  1. Verify all repos are deleted: gh repo list $ORG"
echo "  2. Check organization settings for remaining configuration"
echo "  3. Review BACKUP_MANIFEST.md for backup details"
