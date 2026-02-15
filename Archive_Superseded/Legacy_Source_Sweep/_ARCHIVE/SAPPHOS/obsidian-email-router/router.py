import os, sys, json, shutil, email, re
from dotenv import load_dotenv

load_dotenv()

VAULT = os.getenv("VAULT_PATH", r"C:\Users\mespindola\Documents\Obsidian\InboxVault")
HOT = os.getenv("HOT_PATH", r"C:\Users\mespindola\InboxHot")

PROJECTS = f"{VAULT}/Projects"
INBOX = f"{VAULT}/Inbox"

os.makedirs(PROJECTS, exist_ok=True)
os.makedirs(INBOX, exist_ok=True)

def detect_project(subject):
    tokens = re.findall(r"[A-Z]{2,}-\d+|\b[Pp]roject\s+\w+", subject)
    return tokens[0] if tokens else None

def create_project(name):
    p = f"{PROJECTS}/{name}.md"
    if not os.path.exists(p):
        with open(p, "w", encoding="utf8") as f:
            f.write(f"# {name}\n\n## Metadata\n- Status: active\n\n## Threads\n")
    return p

def route_email(path):
    with open(path, "rb") as f:
        msg = email.message_from_binary_file(f)
    subject = msg.get("Subject", "Untitled")
    project = detect_project(subject)
    if project:
        p = create_project(project)
        with open(p, "a", encoding="utf8") as f:
            f.write(f"\n### {subject}\n- From: {msg.get('From')}\n- Date: {msg.get('Date')}\n")
    else:
        shutil.move(path, f"{INBOX}/{os.path.basename(path)}")

if __name__ == "__main__":
    for f in os.listdir(HOT):
        if f.lower().endswith(".msg") or f.lower().endswith(".eml"):
            route_email(f"{HOT}/{f}")
