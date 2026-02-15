#!/data/data/com.termux/files/usr/bin/bash
#
# HRBiz Vault - Automated GitLab Setup Script
# Run this on your S24 Ultra in Termux after downloading HRBiz_Vault.zip
#
# Usage: bash setup_vault_gitlab.sh
#

set -e  # Exit on any error

echo "═══════════════════════════════════════════════════════════"
echo "🚀 HRBiz Vault - Automated GitLab Setup"
echo "═══════════════════════════════════════════════════════════"
echo ""

# ============================================================================
# CONFIGURATION - Edit these if needed
# ============================================================================

GITLAB_USERNAME="marioo00"
GITLAB_TOKEN="glpat-pEXhtWvJIHG7m1oFrX-tK286MQp1OmlsaGM1Cw.01.120yoaurz"
GITLAB_REPO="hrbiz-vault"
VAULT_NAME="HRBiz_Vault"

ZIP_FILENAME="HRBiz_Vault.zip"
DOWNLOADS_DIR="$HOME/storage/downloads"
TARGET_DIR="$HOME/storage/shared/Documents"
VAULT_PATH="$TARGET_DIR/$VAULT_NAME"

# ============================================================================
# STEP 1: Prerequisites Check
# ============================================================================

echo "📋 Step 1: Checking prerequisites..."

# Check storage access
if [ ! -d "$HOME/storage/shared" ]; then
    echo "❌ Storage access not granted!"
    echo "   Please run: termux-setup-storage"
    echo "   Then grant permission and run this script again."
    exit 1
fi

# Install required packages
echo "📦 Installing required packages..."
pkg install -y git unzip > /dev/null 2>&1

echo "✅ Prerequisites OK"
echo ""

# ============================================================================
# STEP 2: Locate ZIP File
# ============================================================================

echo "📥 Step 2: Locating HRBiz_Vault.zip..."

ZIP_PATH=""

# Check Downloads folder
if [ -f "$DOWNLOADS_DIR/$ZIP_FILENAME" ]; then
    ZIP_PATH="$DOWNLOADS_DIR/$ZIP_FILENAME"
    echo "✅ Found ZIP in Downloads: $ZIP_PATH"
# Check current directory
elif [ -f "$ZIP_FILENAME" ]; then
    ZIP_PATH="$ZIP_FILENAME"
    echo "✅ Found ZIP in current directory: $ZIP_PATH"
# Check Documents
elif [ -f "$TARGET_DIR/$ZIP_FILENAME" ]; then
    ZIP_PATH="$TARGET_DIR/$ZIP_FILENAME"
    echo "✅ Found ZIP in Documents: $ZIP_PATH"
else
    echo "❌ ERROR: Cannot find $ZIP_FILENAME"
    echo ""
    echo "Please:"
    echo "1. Download HRBiz_Vault.zip from Claude"
    echo "2. Save it to one of these locations:"
    echo "   - $DOWNLOADS_DIR/"
    echo "   - $TARGET_DIR/"
    echo "   - Current directory"
    echo "3. Run this script again"
    exit 1
fi

echo ""

# ============================================================================
# STEP 3: Extract ZIP
# ============================================================================

echo "📂 Step 3: Extracting vault..."

# Remove existing vault if present (backup first)
if [ -d "$VAULT_PATH" ]; then
    echo "⚠️  Existing vault found, creating backup..."
    BACKUP_PATH="${VAULT_PATH}.backup.$(date +%Y%m%d_%H%M%S)"
    mv "$VAULT_PATH" "$BACKUP_PATH"
    echo "✅ Backup created: $BACKUP_PATH"
fi

# Extract to temporary location first (Termux-compatible)
TEMP_DIR="$HOME/tmp/hrbiz_extract_$$"
mkdir -p "$HOME/tmp"
mkdir -p "$TEMP_DIR"
echo "   Extracting to temporary location..."
unzip -q "$ZIP_PATH" -d "$TEMP_DIR"

# Find the vault directory (handle various extraction structures)
if [ -d "$TEMP_DIR/$VAULT_NAME" ]; then
    EXTRACTED_PATH="$TEMP_DIR/$VAULT_NAME"
elif [ -d "$TEMP_DIR/HRBiz_Vault" ]; then
    EXTRACTED_PATH="$TEMP_DIR/HRBiz_Vault"
else
    # Vault might be at root of extraction
    EXTRACTED_PATH="$TEMP_DIR"
fi

# Move to final location
mv "$EXTRACTED_PATH" "$VAULT_PATH"
rm -rf "$TEMP_DIR"

echo "✅ Vault extracted to: $VAULT_PATH"
echo "   Folders: $(find "$VAULT_PATH" -type d | wc -l)"
echo "   Files: $(find "$VAULT_PATH" -type f | wc -l)"
echo ""

# ============================================================================
# STEP 4: Git Configuration
# ============================================================================

echo "⚙️  Step 4: Configuring Git..."

cd "$VAULT_PATH"

# Prompt for user details
echo ""
echo "📝 Git needs your name and email for commits"
echo "   (This will be visible in commit history)"
echo ""

read -p "Your Name: " GIT_NAME
read -p "Your Email: " GIT_EMAIL

# Initialize git
git init

# Configure user
git config user.name "$GIT_NAME"
git config user.email "$GIT_EMAIL"

echo "✅ Git configured"
echo ""

# ============================================================================
# STEP 5: Create .gitignore
# ============================================================================

echo "🔒 Step 5: Creating .gitignore..."

cat > .gitignore << 'GITIGNORE'
# Obsidian workspace (device-specific)
.obsidian/workspace.json
.obsidian/workspace-mobile.json
.obsidian/cache/
.trash/

# System files
.DS_Store
Thumbs.db
*.tmp
~*

# Sensitive data
*.key
*.secret
.env
*_PRIVATE.md
GITIGNORE

echo "✅ .gitignore created"
echo ""

# ============================================================================
# STEP 6: Add GitLab Remote
# ============================================================================

echo "🔗 Step 6: Connecting to GitLab..."

GITLAB_URL="https://oauth2:${GITLAB_TOKEN}@gitlab.com/${GITLAB_USERNAME}/${GITLAB_REPO}.git"
git remote add origin "$GITLAB_URL"

echo "✅ Remote added: gitlab.com/${GITLAB_USERNAME}/${GITLAB_REPO}"
echo ""

# ============================================================================
# STEP 7: Commit Files
# ============================================================================

echo "📝 Step 7: Creating initial commit..."

git add .

COMMIT_MESSAGE="Initial commit: HRBiz Compliance Vault v1.0

Complete vault structure with:
- Dashboard (task board, roadmap, revenue tracker)
- 28 folder organization system
- Artifact index (24 deliverables)
- Harassment Prevention program (complete)
- Workplace Violence content prompt
- Software blueprints (v1.0 + v2.0)
- Client: Button Nose Grooming ($7K contract)
- 2026 Revenue target: $192,600

Ready for daily business operations and platform development.
Pushed from S24 Ultra via Termux.
"

git commit -m "$COMMIT_MESSAGE"

echo "✅ Files committed"
echo "   Commit hash: $(git rev-parse --short HEAD)"
echo ""

# ============================================================================
# STEP 8: Push to GitLab
# ============================================================================

echo "🚀 Step 8: Pushing to GitLab..."
echo "   This may take a moment..."
echo ""

# Rename branch to main
git branch -M main

# Push to GitLab
if git push -u origin main; then
    echo ""
    echo "✅ Successfully pushed to GitLab!"
    PUSH_SUCCESS=true
else
    echo ""
    echo "❌ Push failed!"
    echo ""
    echo "Possible reasons:"
    echo "1. Network connection issue"
    echo "2. Token expired or invalid"
    echo "3. Repository doesn't exist on GitLab"
    echo ""
    echo "Your vault is ready locally at: $VAULT_PATH"
    echo "You can try pushing manually later with: git push -u origin main"
    PUSH_SUCCESS=false
fi

echo ""

# ============================================================================
# STEP 9: Create Shortcuts
# ============================================================================

echo "🔗 Step 9: Creating shortcuts..."

# Create symlinks for easy access
ln -sf "$VAULT_PATH" "$HOME/HRBiz_Vault" 2>/dev/null || true
ln -sf "$VAULT_PATH" "$HOME/storage/shared/Obsidian/HRBiz_Vault" 2>/dev/null || true
ln -sf "$VAULT_PATH" "$HOME/storage/shared/HRBiz" 2>/dev/null || true

mkdir -p "$HOME/.shortcuts"

# Create hrbiz shortcut command
cat > "$HOME/.shortcuts/hrbiz" << 'HRBIZ_CMD'
#!/data/data/com.termux/files/usr/bin/bash
VAULT="$HOME/storage/shared/Documents/HRBiz_Vault"

if [ -z "$1" ]; then
    echo "📂 HRBiz Vault Quick Access"
    echo ""
    echo "Usage:"
    echo "  hrbiz              - Go to vault"
    echo "  hrbiz dashboard    - Open dashboard"
    echo "  hrbiz tasks        - Open task board"
    echo "  hrbiz sync         - Pull from GitLab"
    echo "  hrbiz push         - Push to GitLab"
    echo "  hrbiz status       - Git status"
    echo ""
    cd "$VAULT"
else
    case "$1" in
        dashboard)
            nano "$VAULT/00_DASHBOARD/00_START_HERE.md"
            ;;
        tasks)
            nano "$VAULT/00_DASHBOARD/Task_Board.md"
            ;;
        sync)
            cd "$VAULT" && git pull && echo "✅ Synced from GitLab!"
            ;;
        push)
            cd "$VAULT"
            git add .
            git commit -m "Update from S24 $(date +%Y-%m-%d_%H:%M)"
            git push
            echo "✅ Pushed to GitLab!"
            ;;
        status)
            cd "$VAULT" && git status
            ;;
        *)
            echo "❌ Unknown command: $1"
            ;;
    esac
fi
HRBIZ_CMD

chmod +x "$HOME/.shortcuts/hrbiz"

# Add to PATH if not already there
if ! grep -q ".shortcuts" "$HOME/.bashrc" 2>/dev/null; then
    echo 'export PATH=$PATH:$HOME/.shortcuts' >> "$HOME/.bashrc"
fi

echo "✅ Shortcuts created"
echo ""

# ============================================================================
# STEP 10: Verification
# ============================================================================

echo "✅ Step 10: Verification..."
echo ""

cd "$VAULT_PATH"

echo "📊 Vault Statistics:"
echo "   Location: $VAULT_PATH"
echo "   Folders: $(find . -type d | wc -l)"
echo "   Files: $(find . -type f | wc -l)"
echo "   Size: $(du -sh . | cut -f1)"
echo "   Commits: $(git rev-list --count HEAD)"
echo "   Branch: $(git branch --show-current)"
echo ""

if [ "$PUSH_SUCCESS" = true ]; then
    echo "🔗 GitLab Repository:"
    echo "   https://gitlab.com/${GITLAB_USERNAME}/${GITLAB_REPO}"
    echo ""
fi

echo "═══════════════════════════════════════════════════════════"
echo "🎉 Setup Complete!"
echo "═══════════════════════════════════════════════════════════"
echo ""

if [ "$PUSH_SUCCESS" = true ]; then
    echo "✅ SUCCESS! Your vault is:"
    echo "   1. Extracted to S24 Ultra"
    echo "   2. Git repository initialized"
    echo "   3. Pushed to GitLab"
    echo "   4. Ready for Obsidian"
    echo ""
    echo "🔗 View on GitLab:"
    echo "   https://gitlab.com/${GITLAB_USERNAME}/${GITLAB_REPO}"
    echo ""
else
    echo "⚠️  PARTIAL SUCCESS:"
    echo "   ✅ Vault extracted to S24 Ultra"
    echo "   ✅ Git repository initialized"
    echo "   ❌ Push to GitLab failed"
    echo ""
    echo "📝 To retry pushing:"
    echo "   cd $VAULT_PATH"
    echo "   git push -u origin main"
    echo ""
fi

echo "📱 Next Steps:"
echo ""
echo "1. Open Obsidian app"
echo "   → Tap 'Open folder as vault'"
echo "   → Navigate to: Documents/HRBiz_Vault"
echo "   → Tap 'Use this folder'"
echo ""
echo "2. Start using quick commands:"
echo "   hrbiz           - Go to vault"
echo "   hrbiz dashboard - Open dashboard"
echo "   hrbiz tasks     - View task board"
echo "   hrbiz sync      - Pull from GitLab"
echo "   hrbiz push      - Push to GitLab"
echo ""
echo "3. Daily workflow:"
echo "   • Morning: hrbiz sync (get Claude's updates)"
echo "   • Work: Edit in Obsidian"
echo "   • Evening: hrbiz push (send your changes)"
echo ""
echo "═══════════════════════════════════════════════════════════"
echo "📖 Vault location: $VAULT_PATH"
echo "🔗 GitLab: https://gitlab.com/${GITLAB_USERNAME}/${GITLAB_REPO}"
echo "💬 Tell Claude: 'Setup complete!'"
echo "═══════════════════════════════════════════════════════════"
echo ""

# Restart bash to load shortcuts
echo "⚠️  IMPORTANT: Close and reopen Termux to activate 'hrbiz' command"
echo ""
