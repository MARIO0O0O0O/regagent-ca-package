import os
import shutil
import email
import re
import win32com.client
from datetime import datetime
from pathlib import Path

# -----------------------
# CONFIGURATION
# -----------------------
# Paths (adjust as needed)
VAULT_PATH = Path(r"C:\Users\YourUser\Documents\Obsidian\HRVault")
CUSTOMER_FOLDER = VAULT_PATH / "Customers"
INBOX_FOLDER = VAULT_PATH / "Inbox"
HOT_FOLDER = Path(r"C:\Users\YourUser\InboxHot")

# Threshold for auto-linking
CONFIDENCE_THRESHOLD = 4

# Ensure directories exist
for folder in [CUSTOMER_FOLDER, INBOX_FOLDER, HOT_FOLDER]:
    folder.mkdir(parents=True, exist_ok=True)

# -----------------------
# OUTLOOK: pull emails
# -----------------------
def fetch_outlook_emails(folder_name="Inbox", category_filter=None):
    outlook = win32com.client.Dispatch("Outlook.Application").GetNamespace("MAPI")
    inbox = outlook.GetDefaultFolder(6)  # 6=Inbox
    messages = inbox.Items
    for msg in list(messages):
        if category_filter and category_filter not in getattr(msg, "Categories", ""):
            continue
        # Save to HotFolder
        subject_clean = re.sub(r'[\\/*?:"<>|]',"", msg.Subject or "NoSubject")
        timestamp = msg.ReceivedTime.strftime("%Y%m%d_%H%M%S")
        filename = f"{timestamp}_{subject_clean}.msg"
        save_path = HOT_FOLDER / filename
        msg.SaveAs(str(save_path))
    print(f"Fetched {len(list(messages))} emails into HotFolder.")

# -----------------------
# ROUTER: hybrid customer + matter
# -----------------------
def extract_customer_signals(msg):
    signals = {}
    signals['subject'] = msg.get('Subject','')
    signals['from_email'] = msg.get('From','')
    signals['from_domain'] = signals['from_email'].split('@')[-1] if '@' in signals['from_email'] else ''
    signals['body'] = msg.get_payload() if hasattr(msg,'get_payload') else ''
    signals['attachments'] = [att for att in getattr(msg,'Attachments',[])]
    return signals

def score_customer(customer_name, signals):
    score = 0
    tokens = customer_name.lower().split()
    for token in tokens:
        if token in signals['subject'].lower():
            score += 3
        if token in signals['from_domain'].lower():
            score += 2
        if token in signals['body'].lower():
            score += 1
    return score

def detect_or_create_customer(signals):
    for fname in os.listdir(CUSTOMER_FOLDER):
        if not fname.endswith('.md'):
            continue
        cname = os.path.splitext(fname)[0]
        if score_customer(cname, signals) >= CONFIDENCE_THRESHOLD:
            return cname
    return None  # low-confidence → triage

def create_customer_note(customer_name):
    path = CUSTOMER_FOLDER / f"{customer_name}.md"
    if not path.exists():
        path.write_text(f"# {customer_name}\n\n## Contacts\n\n## Active Matters\n\n## Timeline\n\n## Attachments\n\n## Open Tasks\n- [ ]\n", encoding='utf-8')
    return path

def save_attachments(msg, customer_name):
    attach_folder = CUSTOMER_FOLDER / customer_name / "Attachments"
    attach_folder.mkdir(parents=True, exist_ok=True)
    try:
        for i in range(1, msg.Attachments.Count+1):
            attachment = msg.Attachments.Item(i)
            att_name = attachment.FileName
            attachment.SaveAsFile(str(attach_folder / att_name))
    except AttributeError:
        pass  # no attachments for .eml fallback

def route_email(file_path):
    # Read .msg using Outlook COM (as backup) or .eml via email package
    signals = {'subject': os.path.basename(file_path)}
    # Detect customer by filename as placeholder for Phase 1
    customer_name = detect_or_create_customer(signals)
    if customer_name:
        note_path = create_customer_note(customer_name)
        with open(note_path,'a',encoding='utf-8') as f:
            f.write(f"\n### {signals['subject']}\n- Imported: {datetime.now()}\n")
        # Save attachments placeholder
        # Future: link attachments in note
    else:
        # Move to vault Inbox for manual triage
        shutil.move(file_path, INBOX_FOLDER / os.path.basename(file_path))

def process_hotfolder():
    for f in HOT_FOLDER.iterdir():
        if f.suffix.lower() in [".msg",".eml"]:
            route_email(f)

# -----------------------
# MAIN
# -----------------------
if __name__ == "__main__":
    print("Fetching emails from Outlook...")
    fetch_outlook_emails()  # fetches to HotFolder
    print("Routing emails into Obsidian vault...")
    process_hotfolder()
    print("✅ Phase 1 Smart HR Inbox Complete!")
