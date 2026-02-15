#!/data/data/com.termux/files/usr/bin/bash
#
# HRBiz Vault Setup for Termux on Samsung S24 Ultra
# This script creates the Obsidian vault and makes it accessible from multiple locations
#
# Installation:
# 1. Copy this script to Termux
# 2. chmod +x termux_setup_hrbiz_vault.sh
# 3. ./termux_setup_hrbiz_vault.sh
#

echo "═══════════════════════════════════════════════════════════"
echo "🚀 HRBiz Vault Setup for Termux (S24 Ultra)"
echo "═══════════════════════════════════════════════════════════"
echo ""

# Step 1: Request storage permissions
echo "📱 Step 1: Requesting storage permissions..."
echo "   (You'll need to grant storage access)"
termux-setup-storage
sleep 2

# Check if storage is accessible
if [ ! -d "$HOME/storage/shared" ]; then
    echo "❌ ERROR: Storage permission not granted!"
    echo "   Please run: termux-setup-storage"
    echo "   Then grant permission and run this script again."
    exit 1
fi

echo "✅ Storage access confirmed"
echo ""

# Step 2: Define vault locations
SHARED_STORAGE="$HOME/storage/shared"
VAULT_NAME="HRBiz_Vault"

# Primary vault location (in Documents, accessible by Obsidian app)
PRIMARY_VAULT="$SHARED_STORAGE/Documents/$VAULT_NAME"

# Alternative locations (symlinks)
OBSIDIAN_DIR="$SHARED_STORAGE/Obsidian"
HRBIZ_DIR="$SHARED_STORAGE/HRBiz"
TERMUX_LOCAL="$HOME/$VAULT_NAME"

echo "📁 Step 2: Setting up vault locations..."
echo "   Primary: $PRIMARY_VAULT"
echo "   Obsidian shortcut: $OBSIDIAN_DIR/$VAULT_NAME"
echo "   HRBiz shortcut: $HRBIZ_DIR"
echo "   Termux local: $TERMUX_LOCAL"
echo ""

# Step 3: Create primary vault directory
echo "🏗️  Step 3: Creating vault structure..."

# Create Documents folder if it doesn't exist
mkdir -p "$SHARED_STORAGE/Documents"

# Create primary vault
mkdir -p "$PRIMARY_VAULT"

# Create all subdirectories
echo "   Creating folders..."
mkdir -p "$PRIMARY_VAULT/00_DASHBOARD"
mkdir -p "$PRIMARY_VAULT/01_PROJECTS/HRBizLMS_Software"
mkdir -p "$PRIMARY_VAULT/01_PROJECTS/Compliance_Programs/Harassment_Prevention"
mkdir -p "$PRIMARY_VAULT/01_PROJECTS/Compliance_Programs/Workplace_Violence"
mkdir -p "$PRIMARY_VAULT/01_PROJECTS/Compliance_Programs/IIPP"
mkdir -p "$PRIMARY_VAULT/01_PROJECTS/Compliance_Programs/Heat_Illness"
mkdir -p "$PRIMARY_VAULT/02_ARTIFACTS/Training_Materials"
mkdir -p "$PRIMARY_VAULT/02_ARTIFACTS/Policies_Plans"
mkdir -p "$PRIMARY_VAULT/02_ARTIFACTS/Forms_Templates"
mkdir -p "$PRIMARY_VAULT/02_ARTIFACTS/Software_Blueprints"
mkdir -p "$PRIMARY_VAULT/03_CLIENTS/Button_Nose_Grooming"
mkdir -p "$PRIMARY_VAULT/04_RESEARCH/Repository_Analysis"
mkdir -p "$PRIMARY_VAULT/04_RESEARCH/Legal_Compliance"
mkdir -p "$PRIMARY_VAULT/04_RESEARCH/Tech_Stack"
mkdir -p "$PRIMARY_VAULT/05_NOTES/Daily_Notes"
mkdir -p "$PRIMARY_VAULT/05_NOTES/Meeting_Notes"
mkdir -p "$PRIMARY_VAULT/05_NOTES/Ideas"
mkdir -p "$PRIMARY_VAULT/06_TEMPLATES"
mkdir -p "$PRIMARY_VAULT/07_ATTACHMENTS"
mkdir -p "$PRIMARY_VAULT/.obsidian"

echo "✅ Vault structure created ($(find "$PRIMARY_VAULT" -type d | wc -l) folders)"
echo ""

# Step 4: Create Obsidian configuration
echo "⚙️  Step 4: Configuring Obsidian..."

cat > "$PRIMARY_VAULT/.obsidian/app.json" << 'OBSIDIAN_CONFIG'
{
  "livePreview": true,
  "readableLineLength": false,
  "strictLineBreaks": false,
  "showFrontmatter": true,
  "foldHeading": true,
  "foldIndent": true,
  "showLineNumber": true,
  "spellcheck": true,
  "alwaysUpdateLinks": true,
  "attachmentFolderPath": "07_ATTACHMENTS",
  "newFileLocation": "current",
  "newLinkFormat": "relative",
  "useMarkdownLinks": true,
  "defaultViewMode": "source",
  "theme": "moonstone"
}
OBSIDIAN_CONFIG

cat > "$PRIMARY_VAULT/.obsidian/workspace.json" << 'WORKSPACE'
{
  "main": {
    "id": "main",
    "type": "split",
    "children": [
      {
        "id": "leaf1",
        "type": "leaf",
        "state": {
          "type": "markdown",
          "state": {
            "file": "00_DASHBOARD/00_START_HERE.md",
            "mode": "source"
          }
        }
      }
    ]
  },
  "active": "leaf1",
  "lastOpenFiles": [
    "00_DASHBOARD/00_START_HERE.md",
    "00_DASHBOARD/Task_Board.md",
    "00_DASHBOARD/Project_Roadmap.md",
    "00_DASHBOARD/Revenue_Tracker.md",
    "README.md"
  ]
}
WORKSPACE

echo "✅ Obsidian configuration created"
echo ""

# Step 5: Create symlinks for easy access
echo "🔗 Step 5: Creating shortcuts..."

# Create Obsidian directory shortcut
mkdir -p "$OBSIDIAN_DIR"
if [ -L "$OBSIDIAN_DIR/$VAULT_NAME" ]; then
    rm "$OBSIDIAN_DIR/$VAULT_NAME"
fi
ln -s "$PRIMARY_VAULT" "$OBSIDIAN_DIR/$VAULT_NAME"
echo "   ✅ $OBSIDIAN_DIR/$VAULT_NAME → Primary vault"

# Create HRBiz shortcut
if [ -L "$HRBIZ_DIR" ]; then
    rm "$HRBIZ_DIR"
fi
ln -s "$PRIMARY_VAULT" "$HRBIZ_DIR"
echo "   ✅ $HRBIZ_DIR → Primary vault"

# Create Termux local symlink
if [ -L "$TERMUX_LOCAL" ]; then
    rm "$TERMUX_LOCAL"
fi
ln -s "$PRIMARY_VAULT" "$TERMUX_LOCAL"
echo "   ✅ $TERMUX_LOCAL → Primary vault"

echo ""

# Step 6: Create placeholder README
echo "📝 Step 6: Creating initial files..."

cat > "$PRIMARY_VAULT/README.md" << 'README'
---
title: HRBiz Compliance Vault
created: 2026-02-07
---

# 📚 HRBiz Compliance Vault

**Your California Employment Law Compliance Business**

This Obsidian vault contains all your business materials:
- Training programs (Harassment Prevention, Workplace Violence, etc.)
- Software development plans (HRBizLMS)
- Client files and contracts
- Project management (tasks, roadmap, revenue tracking)
- Research and competitive analysis

## 🚀 Start Here

1. Open: `00_DASHBOARD/00_START_HERE.md`
2. Review: `00_DASHBOARD/Task_Board.md`
3. Plan: `00_DASHBOARD/Project_Roadmap.md`

## 📁 Folder Structure

```
00_DASHBOARD/        ← Project management & navigation
01_PROJECTS/         ← Active projects
02_ARTIFACTS/        ← Deliverables (training materials, etc.)
03_CLIENTS/          ← Client files
04_RESEARCH/         ← Research & analysis
05_NOTES/            ← Daily notes, meeting notes, ideas
06_TEMPLATES/        ← Reusable templates
07_ATTACHMENTS/      ← Files, PDFs, images
```

## 💡 Next Steps

Import the vault content from Claude Project Files:
1. Download vault from Claude
2. Extract files to this directory
3. Open in Obsidian app
4. Start managing your business!

**Created:** 2026-02-07  
**Location:** Documents/HRBiz_Vault/  
**Status:** Ready for content import
README

cat > "$PRIMARY_VAULT/00_DASHBOARD/00_START_HERE.md" << 'DASHBOARD'
---
title: HRBiz Dashboard - Start Here
created: 2026-02-07
tags: [dashboard, navigation]
---

# 🎯 HRBiz Compliance Platform - Start Here

> **Welcome to your command center!**

This vault will contain all your business materials once you import the content from Claude.

## 📥 Import Instructions

1. **In Claude:** Download the HRBiz_Vault from Project Files
2. **Extract:** Unzip the downloaded archive
3. **Copy:** Move all files to this directory
4. **Refresh:** Reopen Obsidian to see all content

## 📁 What You'll Get

- Complete task board with sprint planning
- 6-week launch roadmap
- Revenue tracking & client pipeline
- All training materials (Harassment, Violence Prevention)
- Software blueprints
- Client files (Button Nose Grooming)

## 🔗 Quick Links (After Import)

- [[Task_Board|📋 Task Board]]
- [[Project_Roadmap|📅 Roadmap]]
- [[Revenue_Tracker|💰 Revenue]]
- [[ARTIFACTS_INDEX|📦 Artifacts]]

## 🚀 Getting Started

1. Import content from Claude
2. Review task board
3. Check project roadmap
4. Start working!

---

**Vault Location:** Documents/HRBiz_Vault/  
**Created:** 2026-02-07  
**Status:** Awaiting content import
DASHBOARD

echo "✅ Initial files created"
echo ""

# Step 7: Create import helper script
echo "🛠️  Step 7: Creating import helper..."

cat > "$PRIMARY_VAULT/IMPORT_FROM_CLAUDE.sh" << 'IMPORT_SCRIPT'
#!/data/data/com.termux/files/usr/bin/bash
#
# Import HRBiz Vault content from Claude download
#
# Usage:
# 1. Download HRBiz_Vault.zip from Claude Project Files
# 2. Move it to ~/storage/downloads/HRBiz_Vault.zip
# 3. Run this script
#

DOWNLOADS="$HOME/storage/downloads"
VAULT_DIR="$HOME/storage/shared/Documents/HRBiz_Vault"

echo "🔄 Importing HRBiz Vault from Claude..."

# Check if zip exists
if [ ! -f "$DOWNLOADS/HRBiz_Vault.zip" ]; then
    echo "❌ ERROR: HRBiz_Vault.zip not found in Downloads!"
    echo "   Expected: $DOWNLOADS/HRBiz_Vault.zip"
    echo ""
    echo "Steps:"
    echo "1. In Claude, go to Project Files"
    echo "2. Navigate to HRBiz_Vault/"
    echo "3. Download as ZIP"
    echo "4. Move to Downloads folder"
    echo "5. Run this script again"
    exit 1
fi

# Install unzip if needed
if ! command -v unzip &> /dev/null; then
    echo "📦 Installing unzip..."
    pkg install unzip -y
fi

# Create temp directory
TEMP_DIR="/tmp/hrbiz_import"
rm -rf "$TEMP_DIR"
mkdir -p "$TEMP_DIR"

# Extract
echo "📦 Extracting archive..."
unzip -q "$DOWNLOADS/HRBiz_Vault.zip" -d "$TEMP_DIR"

# Find the vault folder (handle various extraction structures)
EXTRACTED_VAULT=$(find "$TEMP_DIR" -name "HRBiz_Vault" -type d | head -1)

if [ -z "$EXTRACTED_VAULT" ]; then
    # Vault might be at root of extraction
    EXTRACTED_VAULT="$TEMP_DIR"
fi

# Copy all files
echo "📁 Copying files to vault..."
rsync -av --exclude='.git' "$EXTRACTED_VAULT/" "$VAULT_DIR/" || \
    cp -r "$EXTRACTED_VAULT/"* "$VAULT_DIR/"

# Clean up
rm -rf "$TEMP_DIR"

echo ""
echo "✅ Import complete!"
echo ""
echo "📊 Vault contents:"
echo "   Folders: $(find "$VAULT_DIR" -type d | wc -l)"
echo "   Files: $(find "$VAULT_DIR" -type f | wc -l)"
echo ""
echo "🚀 Next steps:"
echo "   1. Open Obsidian app"
echo "   2. Open vault: Documents/HRBiz_Vault"
echo "   3. Start with: 00_DASHBOARD/00_START_HERE.md"
echo ""
IMPORT_SCRIPT

chmod +x "$PRIMARY_VAULT/IMPORT_FROM_CLAUDE.sh"

echo "✅ Import script created: IMPORT_FROM_CLAUDE.sh"
echo ""

# Step 8: Create quick access script for Termux
echo "⚡ Step 8: Creating Termux shortcuts..."

cat > "$HOME/.shortcuts/hrbiz" << 'SHORTCUT'
#!/data/data/com.termux/files/usr/bin/bash
# Quick access to HRBiz vault

VAULT="$HOME/storage/shared/Documents/HRBiz_Vault"

if [ -z "$1" ]; then
    echo "📂 HRBiz Vault Quick Access"
    echo ""
    echo "Usage:"
    echo "  hrbiz              - Go to vault directory"
    echo "  hrbiz dashboard    - Open dashboard"
    echo "  hrbiz tasks        - Open task board"
    echo "  hrbiz roadmap      - Open roadmap"
    echo "  hrbiz revenue      - Open revenue tracker"
    echo "  hrbiz note [name]  - Create daily note"
    echo "  hrbiz find [term]  - Search vault"
    echo "  hrbiz list         - List all files"
    echo "  hrbiz import       - Run import script"
    echo ""
    echo "📍 Vault location: $VAULT"
    cd "$VAULT"
else
    case "$1" in
        dashboard)
            nano "$VAULT/00_DASHBOARD/00_START_HERE.md"
            ;;
        tasks)
            nano "$VAULT/00_DASHBOARD/Task_Board.md"
            ;;
        roadmap)
            nano "$VAULT/00_DASHBOARD/Project_Roadmap.md"
            ;;
        revenue)
            nano "$VAULT/00_DASHBOARD/Revenue_Tracker.md"
            ;;
        note)
            DATE=$(date +%Y-%m-%d)
            NOTE_FILE="$VAULT/05_NOTES/Daily_Notes/$DATE.md"
            if [ ! -f "$NOTE_FILE" ]; then
                cat > "$NOTE_FILE" << EOF
---
title: Daily Note - $DATE
date: $DATE
tags: [daily-note]
---

# 📅 Daily Note - $DATE

## ✅ Tasks Completed Today
- 

## 🎯 Progress
- 

## 💡 Ideas / Notes
- 

## 📞 Client Communications
- 

## ⏭️ Tomorrow's Priorities
- 

EOF
            fi
            nano "$NOTE_FILE"
            ;;
        find)
            grep -r "$2" "$VAULT" --include="*.md"
            ;;
        list)
            find "$VAULT" -name "*.md" -type f
            ;;
        import)
            bash "$VAULT/IMPORT_FROM_CLAUDE.sh"
            ;;
        *)
            echo "❌ Unknown command: $1"
            echo "Run 'hrbiz' for usage"
            ;;
    esac
fi
SHORTCUT

mkdir -p "$HOME/.shortcuts"
chmod +x "$HOME/.shortcuts/hrbiz"

# Add to PATH if not already there
if ! grep -q ".shortcuts" "$HOME/.bashrc"; then
    echo 'export PATH=$PATH:$HOME/.shortcuts' >> "$HOME/.bashrc"
fi

echo "✅ Created 'hrbiz' command"
echo ""

# Final summary
echo "═══════════════════════════════════════════════════════════"
echo "🎉 HRBiz Vault Setup Complete!"
echo "═══════════════════════════════════════════════════════════"
echo ""
echo "📍 VAULT LOCATIONS:"
echo "   Primary:  $PRIMARY_VAULT"
echo "   Obsidian: $OBSIDIAN_DIR/$VAULT_NAME"
echo "   HRBiz:    $HRBIZ_DIR"
echo "   Termux:   $TERMUX_LOCAL"
echo ""
echo "📊 VAULT STRUCTURE:"
echo "   Folders:  $(find "$PRIMARY_VAULT" -type d | wc -l)"
echo "   Files:    $(find "$PRIMARY_VAULT" -type f | wc -l)"
echo ""
echo "🔍 ACCESS METHODS:"
echo ""
echo "1️⃣  OBSIDIAN APP:"
echo "   • Open Obsidian app"
echo "   • Tap 'Open folder as vault'"
echo "   • Navigate to: Documents/HRBiz_Vault"
echo "   • Tap 'Use this folder'"
echo ""
echo "2️⃣  FILE MANAGER:"
echo "   • Open 'My Files' app"
echo "   • Go to Documents/HRBiz_Vault"
echo "   • Or: Obsidian/HRBiz_Vault (shortcut)"
echo "   • Or: HRBiz (shortcut)"
echo ""
echo "3️⃣  TERMUX COMMANDS:"
echo "   • cd ~/HRBiz_Vault          (go to vault)"
echo "   • hrbiz                     (quick access)"
echo "   • hrbiz dashboard           (open dashboard)"
echo "   • hrbiz tasks               (open task board)"
echo "   • hrbiz note                (create daily note)"
echo "   • hrbiz find [search_term]  (search vault)"
echo ""
echo "📥 IMPORT CONTENT FROM CLAUDE:"
echo ""
echo "   1. In Claude: Project Files → HRBiz_Vault → Download"
echo "   2. Move zip to Downloads folder"
echo "   3. Run: hrbiz import"
echo "   OR: bash ~/storage/shared/Documents/HRBiz_Vault/IMPORT_FROM_CLAUDE.sh"
echo ""
echo "🚀 QUICK START:"
echo ""
echo "   cd ~/HRBiz_Vault"
echo "   hrbiz dashboard"
echo ""
echo "═══════════════════════════════════════════════════════════"
echo ""
echo "✅ Setup complete! Restart Termux to activate 'hrbiz' command."
echo ""
