# =====================================================
# Phase 1: Smart HR Inbox → Obsidian Automation Script
# =====================================================
# Windows 11 Pro + Outlook Desktop
# Hybrid customer + matter routing (triage)
# =====================================================

Param(
    [string]$VaultPath = "$HOME\Documents\Obsidian\HRVault",
    [string]$RepoPath = "$HOME\Documents\HRInboxRouter",
    [string]$HotFolder = "$HOME\InboxHot"
)

Write-Host ">>> Starting Phase 1 HR Smart Inbox Setup..." -ForegroundColor Cyan

# ------------------------
# 1. Create Folder Structure
# ------------------------
Write-Host ">>> Creating directories..."
$dirs = @(
    $VaultPath,
    "$VaultPath\Customers",
    "$VaultPath\Inbox",
    "$VaultPath\Templates",
    $HotFolder
)

foreach ($d in $dirs) {
    New-Item -ItemType Directory -Force -Path $d | Out-Null
}

# ------------------------
# 2. Initialize Repo Skeleton
# ------------------------
Write-Host ">>> Creating repo structure..."
if (!(Test-Path $RepoPath)) { New-Item -ItemType Directory -Force -Path $RepoPath | Out-Null }

$scriptFolders = @("$RepoPath\scripts","$RepoPath\config")
foreach ($sf in $scriptFolders) {
    New-Item -ItemType Directory -Force -Path $sf | Out-Null
}

# ------------------------
# 3. Install Python Dependencies
# ------------------------
Write-Host ">>> Setting up Python venv and dependencies..."

# Check if Python exists
$pythonCheck = Get-Command python -ErrorAction SilentlyContinue
if (-not $pythonCheck) {
    Write-Host "Python not found. Please install Python 3.10+ manually and rerun." -ForegroundColor Red
    exit
}

# Create virtual environment
if (!(Test-Path "$RepoPath\.venv")) {
    python -m venv "$RepoPath\.venv"
}

# Activate and install packages
$venvPath = "$RepoPath\.venv\Scripts\activate"
& $venvPath
pip install --upgrade pip
pip install python-dotenv watchdog email-validator dateparser > $null

# ------------------------
# 4. Generate Customer + Matter Templates
# ------------------------
Write-Host ">>> Generating Obsidian templates..."

$customerTemplate = @"
# <% tp.file.title %>

## Contacts
- Controller:: 
- HR:: 
- Legal:: 
- Payroll:: 

## Active Matters
- 

## Timeline
- 

## Attachments
- 

## Open Tasks
- [ ]
"@
Set-Content -Path "$VaultPath\Templates\Customer.md" -Value $customerTemplate

$matterTemplate = @"
# <% tp.file.title %> (<% tp.file.cursor() %>)

## Category
- (WC / Leave / Payroll / Offer / Compliance / Discipline)

## Stakeholders
- Internal::
- External::

## Timeline
- 

## Tasks
- [ ]
"@
Set-Content -Path "$VaultPath\Templates\Matter.md" -Value $matterTemplate

# ------------------------
# 5. Generate Hybrid Router Script (Python)
# ------------------------
Write-Host ">>> Generating router.py (customer + matter triage)..."

$routerScript = @"
import os
import shutil
import email
import re
from datetime import datetime

# -------------------------
# Configuration
# -------------------------
VAULT = r'$VaultPath'
HOT = r'$HotFolder'
CUSTOMER_FOLDER = os.path.join(VAULT, 'Customers')
INBOX = os.path.join(VAULT, 'Inbox')

os.makedirs(CUSTOMER_FOLDER, exist_ok=True)
os.makedirs(INBOX, exist_ok=True)

# -------------------------
# Hybrid identity scoring
# -------------------------
def extract_customer_signals(msg):
    signals = {}
    signals['subject'] = msg.get('Subject','')
    signals['from_domain'] = msg.get('From','').split('@')[-1]
    # For Phase 1 simplicity: only weak matching
    return signals

def score_customer(customer_name, signals):
    score = 0
    name_tokens = customer_name.lower().split()
    for token in name_tokens:
        if token in signals['subject'].lower():
            score += 3
        if token in signals['from_domain'].lower():
            score += 2
    return score

def detect_or_create_customer(signals):
    # Try to match existing
    for fname in os.listdir(CUSTOMER_FOLDER):
        if not fname.endswith('.md'):
            continue
        cname = os.path.splitext(fname)[0]
        if score_customer(cname, signals) >= 4:
            return cname
    # No match: triage
    return None

def create_customer_note(customer_name):
    path = os.path.join(CUSTOMER_FOLDER, f'{customer_name}.md')
    if not os.path.exists(path):
        with open(path,'w',encoding='utf-8') as f:
            f.write(f'# {customer_name}\n\n## Contacts\n\n## Active Matters\n\n## Timeline\n\n## Attachments\n\n## Open Tasks\n- [ ]\n')
    return path

def route_email(file_path):
    with open(file_path,'rb') as f:
        msg = email.message_from_binary_file(f)
    signals = extract_customer_signals(msg)
    customer_name = detect_or_create_customer(signals)
    if customer_name:
        note_path = create_customer_note(customer_name)
        with open(note_path,'a',encoding='utf-8') as f:
            f.write(f'\n### {signals["subject"]}\n- From: {msg.get("From")}\n- Date: {msg.get("Date")}\n')
        # Save attachments (if any)
        # Phase 2 hooks
    else:
        # Triage to Inbox
        shutil.move(file_path, os.path.join(INBOX, os.path.basename(file_path)))

if __name__ == "__main__":
    for f in os.listdir(HOT):
        if f.lower().endswith('.msg') or f.lower().endswith('.eml'):
            route_email(os.path.join(HOT,f))
"@

Set-Content -Path "$RepoPath\scripts\router.py" -Value $routerScript -Encoding UTF8

# ------------------------
# 6. Generate Outlook Macro
# ------------------------
Write-Host ">>> Creating Outlook macro (Send to Hot Folder)..."

$macro = @"
Public Sub SendToHotFolder(MyMail As MailItem)
    Dim savePath As String
    savePath = ""$HotFolder\"" & Format(Now, ""yyyymmdd_hhnnss_"") & MyMail.Subject & "".msg""
    MyMail.SaveAs savePath, olMSG
    MsgBox ""Saved to Hot Folder!""
End Sub
"@
Set-Content -Path "$HOME\Documents\OutlookHRMacro.bas" -Value $macro

# ------------------------
# 7. Final Instructions
# ------------------------
Write-Host ""
Write-Host ">>> Setup Complete!" -ForegroundColor Green
Write-Host "Next Steps:"
Write-Host "1. Open Outlook VBA Editor (Alt+F11) → Import → OutlookHRMacro.bas"
Write-Host "2. Open Obsidian → Create Vault at: $VaultPath"
Write-Host "3. Install Obsidian Plugins: Templater, Tasks, Dataview"
Write-Host "4. Place emails in $HotFolder and run router.py to auto-link"
Write-Host "5. Emails with low confidence go to Inbox for manual triage"
Write-Host ""
Write-Host "Phase 2 Hooks:"
Write-Host "- Semantic NLP for matter detection"
Write-Host "- Named Entity Recognition for employees + customers"
Write-Host "- Task extraction and deadlines"
Write-Host "- Automated attachments linking per matter"
