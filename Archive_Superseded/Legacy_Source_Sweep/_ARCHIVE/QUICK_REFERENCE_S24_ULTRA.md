# ⚡ HRBiz Vault - S24 Ultra Quick Reference

## 🚀 One-Time Setup (5 minutes)

### 1. Install Termux (if not installed)
- Download from F-Droid or Play Store
- Open Termux, wait for initial setup

### 2. Run Setup Script
```bash
# Copy termux_setup_hrbiz_vault.sh to phone
# Then in Termux:
cd ~/storage/downloads
chmod +x termux_setup_hrbiz_vault.sh
./termux_setup_hrbiz_vault.sh
```

### 3. Install Obsidian App
- Download from Play Store: "Obsidian - Private knowledge base"
- Open app
- Tap "Open folder as vault"
- Navigate to: `Documents/HRBiz_Vault`
- Tap "Use this folder"

### 4. Import Content from Claude
```bash
# After downloading HRBiz_Vault.zip from Claude to Downloads:
hrbiz import
```

**Done!** 🎉

---

## 📍 Vault Locations on Your Phone

| Location | Path | Access Method |
|----------|------|---------------|
| **Primary** | `/storage/emulated/0/Documents/HRBiz_Vault` | File manager: Documents/HRBiz_Vault |
| **Obsidian** | `/storage/emulated/0/Obsidian/HRBiz_Vault` | Shortcut in Obsidian folder |
| **HRBiz** | `/storage/emulated/0/HRBiz` | Quick shortcut in root |
| **Termux** | `~/HRBiz_Vault` | Command: `cd ~/HRBiz_Vault` |

---

## 🛠️ Termux Commands

### Quick Access
```bash
hrbiz              # Show menu and go to vault
hrbiz dashboard    # Open main dashboard
hrbiz tasks        # Open task board
hrbiz roadmap      # Open project roadmap  
hrbiz revenue      # Open revenue tracker
hrbiz note         # Create today's daily note
hrbiz find XYZ     # Search for "XYZ" in vault
hrbiz list         # List all markdown files
hrbiz import       # Import from Claude download
```

### Navigation
```bash
cd ~/HRBiz_Vault                    # Go to vault
cd ~/HRBiz_Vault/00_DASHBOARD       # Go to dashboard
cd ~/HRBiz_Vault/02_ARTIFACTS       # Go to artifacts
ls -la                              # List files
```

### Editing Files
```bash
nano 00_DASHBOARD/Task_Board.md     # Edit task board
nano 05_NOTES/Daily_Notes/$(date +%Y-%m-%d).md  # Today's note
```

### Sync/Backup
```bash
# Backup to cloud (if rclone configured)
rclone sync ~/HRBiz_Vault gdrive:HRBiz_Vault

# Pull updates from Git (if using Git)
cd ~/HRBiz_Vault && git pull
```

---

## 📱 Obsidian App Shortcuts

### Navigation
- **Cmd Palette:** Swipe down from top or tap search icon
- **Quick Switcher:** Type `Ctrl+O` (if keyboard connected)
- **Graph View:** View → Graph view

### Editing
- **Toggle Edit/Preview:** Tap the eye/pencil icon
- **Insert Link:** Type `[[` and select note
- **Add Tag:** Type `#tagname`
- **Create Task:** Type `- [ ] Task name`

### Mobile Gestures
- **Swipe left:** Go back
- **Swipe right:** Go forward  
- **Long press link:** Preview note
- **Pinch zoom:** Zoom in/out on graph

---

## 📂 File Manager Access

### Samsung My Files App
1. Open "My Files" app
2. Go to "Documents"
3. Open "HRBiz_Vault"
4. Browse folders

### Quick Access Shortcuts
- `Obsidian/HRBiz_Vault` (symlink)
- `HRBiz` (symlink to vault root)

---

## 🔄 Sync Workflow

### From Claude → Phone
1. **In Claude:** Project Files → Download HRBiz_Vault as ZIP
2. **Transfer:** USB/cloud to phone Downloads
3. **In Termux:** `hrbiz import`
4. **In Obsidian:** Refresh to see new files

### From Phone → Claude
1. **Option A:** Copy files manually to Claude chat
2. **Option B:** Set up Git sync (advanced)
3. **Option C:** Use cloud storage both can access

---

## 💡 Daily Workflow

### Morning Routine (5 min)
```bash
# In Termux:
hrbiz tasks          # Review today's tasks
hrbiz note           # Create daily note

# Or in Obsidian:
# 1. Open 00_DASHBOARD/Task_Board.md
# 2. Check off yesterday's completed tasks
# 3. Add today's priorities
```

### During Work
- Update task statuses: `- [x] Completed task`
- Add notes to daily note
- Link related notes: `[[Note_Name]]`

### Evening (5 min)
```bash
hrbiz tasks          # Update completed tasks
hrbiz revenue        # Update if deals progressed

# Or in Obsidian:
# 1. Check off completed tasks
# 2. Plan tomorrow
# 3. Update revenue tracker if needed
```

---

## 🎯 Most Used Files

| File | Purpose | Quick Access |
|------|---------|--------------|
| `00_START_HERE.md` | Main dashboard | `hrbiz dashboard` |
| `Task_Board.md` | Daily tasks | `hrbiz tasks` |
| `Project_Roadmap.md` | 6-week plan | `hrbiz roadmap` |
| `Revenue_Tracker.md` | Finances | `hrbiz revenue` |
| `ARTIFACTS_INDEX.md` | All deliverables | In Obsidian |

---

## 🔧 Troubleshooting

### "hrbiz: command not found"
```bash
source ~/.bashrc
# Or close and reopen Termux
```

### "Permission denied" errors
```bash
termux-setup-storage
# Grant storage permission
```

### Can't see vault in Obsidian
1. Check vault exists:
   ```bash
   ls ~/storage/shared/Documents/HRBiz_Vault
   ```
2. In Obsidian, browse to exact path
3. Make sure path is: `Documents/HRBiz_Vault`

### Import script fails
```bash
pkg update
pkg install unzip rsync -y
hrbiz import
```

### Files don't show in file manager
- Wait 10 seconds for Android to index
- Reboot phone if needed
- Check path directly in Termux

---

## 📦 Backup Strategy

### Method 1: Cloud Sync (Recommended)
```bash
# Install rclone
pkg install rclone
rclone config  # Set up Google Drive

# Backup command
rclone sync ~/HRBiz_Vault gdrive:HRBiz_Vault
```

### Method 2: USB Transfer
1. Connect phone to computer
2. Copy `Documents/HRBiz_Vault/` to computer
3. Store safely

### Method 3: Git Repository
```bash
# Inside vault
git init
git add .
git commit -m "Vault backup"
git push origin main
```

---

## 🚀 Pro Tips

1. **Pin Obsidian:** Add to home screen for quick access
2. **Widget:** Use Obsidian daily note widget
3. **Voice Notes:** Use Samsung Voice Recorder, transcribe to vault
4. **Templates:** Create templates in `06_TEMPLATES/`
5. **Tags:** Use `#priority`, `#urgent`, `#client` for filtering
6. **Shortcuts:** Create Termux widgets for common commands

---

## 📞 Getting Help

### In Termux
```bash
hrbiz              # Shows command menu
man [command]      # Help for any command
```

### Ask Claude
- "Claude, how do I sync my vault?"
- "Claude, the import isn't working"
- "Claude, how do I backup my vault?"

---

## ✅ Success Checklist

- [ ] Termux installed
- [ ] Setup script run successfully
- [ ] Obsidian app installed
- [ ] Vault opened in Obsidian
- [ ] Content imported from Claude
- [ ] `hrbiz` command works
- [ ] Can edit files in Obsidian
- [ ] Daily workflow established

**All checked?** You're ready! 🎉

---

**Quick Start:** `hrbiz dashboard` → Review tasks → Get to work! 🚀
