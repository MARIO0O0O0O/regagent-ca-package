# 📥 How to Download HRBiz Vault to Your S24 Ultra

Follow these steps to get your vault from Claude onto your phone.

---

## Method 1: Download from Claude Project Files (RECOMMENDED) ⭐

### Step 1: Download from Claude
1. In Claude interface, click **"Project Files"** (top right)
2. Navigate to `HRBiz_Vault/` folder
3. Click the **download icon** (⬇️) next to the folder
4. Save as `HRBiz_Vault.zip` to your computer

### Step 2: Transfer to Phone
**Option A: USB Cable**
1. Connect S24 Ultra to computer via USB
2. Copy `HRBiz_Vault.zip` to phone's `Downloads/` folder

**Option B: Cloud Transfer**
1. Upload zip to Google Drive / Dropbox
2. Download on phone to `Downloads/` folder

**Option C: Direct Download (if available)**
1. If Claude allows direct phone download, save to `Downloads/`

### Step 3: Import to Termux
1. Open Termux on S24 Ultra
2. Run: `hrbiz import`
3. Or: `bash ~/storage/shared/Documents/HRBiz_Vault/IMPORT_FROM_CLAUDE.sh`
4. Script will extract and copy all files

### Step 4: Open in Obsidian
1. Open Obsidian app
2. Tap "Open folder as vault"
3. Navigate to: `Documents/HRBiz_Vault`
4. Tap "Use this folder"
5. Start with: `00_DASHBOARD/00_START_HERE.md`

---

## Method 2: Manual File-by-File Download

If you can't download the entire folder:

### In Claude Project Files:
1. Download each important file individually:
   - `00_DASHBOARD/00_START_HERE.md`
   - `00_DASHBOARD/Task_Board.md`
   - `00_DASHBOARD/Project_Roadmap.md`
   - `00_DASHBOARD/Revenue_Tracker.md`
   - `02_ARTIFACTS/ARTIFACTS_INDEX.md`
   - `README.md`

2. Transfer to phone (USB/cloud)

3. In Termux, copy to vault:
```bash
cd ~/storage/downloads
cp *.md ~/storage/shared/Documents/HRBiz_Vault/00_DASHBOARD/
```

---

## Method 3: Git Clone (If Repository Created)

If you've pushed the vault to a Git repository:

```bash
# In Termux
cd ~/storage/shared/Documents
git clone [your-repo-url] HRBiz_Vault
```

---

## Verification

After import, verify in Termux:

```bash
hrbiz list  # List all markdown files
cd ~/HRBiz_Vault
ls -R       # Show all folders and files
```

Expected output:
- 28 folders
- 8+ markdown files
- Obsidian config in `.obsidian/`

---

## Troubleshooting

### "hrbiz command not found"
```bash
source ~/.bashrc
# Or restart Termux
```

### "Permission denied"
```bash
termux-setup-storage
# Grant permission and try again
```

### "Import script fails"
```bash
pkg install unzip rsync -y
hrbiz import
```

### "Obsidian can't find vault"
1. Open file manager
2. Go to Documents/HRBiz_Vault
3. Verify files are there
4. In Obsidian, manually browse to that exact path

---

## Success Check ✅

You'll know it's working when:
- ✅ Termux command `hrbiz` shows menu
- ✅ File manager shows Documents/HRBiz_Vault with files
- ✅ Obsidian opens vault and shows dashboard
- ✅ Can navigate between notes using [[links]]

---

## Next Steps After Import

1. **In Obsidian:**
   - Open `00_START_HERE.md`
   - Review task board
   - Check project roadmap

2. **Daily Workflow:**
   - Morning: `hrbiz tasks`
   - Create note: `hrbiz note`
   - Search: `hrbiz find [term]`

3. **Stay Synced:**
   - Periodically re-download from Claude
   - Or set up Git sync for automatic updates

---

**Need Help?** Ask Claude:
- "Claude, how do I download the vault?"
- "Claude, the import isn't working, what should I do?"
