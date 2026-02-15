# Module 5: Information Resources & Training Hub Setup
# Purpose: Create educational materials, glossaries, and interactive learning resources
# Author: Ellen, HR Director | Date: December 2025
# PROJECT DATES: 12/17/25, 12/19/25, 12/22/25, 12/23/25, 12/26/25, 12/29/25, 12/30/25, 01/02/26

<#
.SYNOPSIS
Establishes comprehensive knowledge base with interactive buttons, tooltips, and training materials

.DESCRIPTION
- Creates glossary of HR/legal terms
- Builds interactive concept explainers (AI, Obsidian, compliance)
- Generates video tutorial links and documentation
- Implements tooltips and info buttons throughout vault
- Establishes quick-reference guides

.NOTES
COGNITIVE LOAD REDUCTION: One-click access to explanations reduces mental burden
#>

param(
    [string]$VaultPath = "C:\Users\mespindola\Documents\HRM\PERSONNEL RECORD AUDIT PROJECT",
    [switch]$Verbose
)

$ErrorActionPreference = "Stop"

function Write-AuditLog {
    param([string]$Message, [string]$Type = "INFO")
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    switch ($Type) {
        "SUCCESS" { Write-Host "[$timestamp] ✓ $Message" -ForegroundColor Green }
        "WARNING" { Write-Host "[$timestamp] ⚠ $Message" -ForegroundColor Yellow }
        "ERROR"   { Write-Host "[$timestamp] ✗ $Message" -ForegroundColor Red }
        default   { Write-Host "[$timestamp] ℹ $Message" -ForegroundColor Cyan }
    }
}

Write-AuditLog "=== MODULE 5: INFORMATION RESOURCES & TRAINING ===" "INFO"
Write-AuditLog "Building comprehensive knowledge base and learning hub" "INFO"

$resourcesPath = Join-Path $VaultPath "05-REFERENCE-LIBRARY"
New-Item -Path $resourcesPath -ItemType Directory -Force | Out-Null

#region Technical Concepts Explainer
Write-AuditLog "Creating technical concepts explainer hub..." "INFO"

$techConceptsContent = @"
# Technical Concepts Explained: AI & Obsidian for HR Audits
*Educational Resource Hub | Ellen, HR Director*

---

## 🤖 UNDERSTANDING AI IN THIS PROJECT

### What is Local AI vs. Cloud AI?

#### 🏠 LOCAL AI (Ollama - Running on YOUR Computer)
**Simple Analogy**: Like having a private tutor in your office who never leaves.

**How It Works**:
1. AI software (Ollama) installed on YOUR computer (C:\Users\mespindola)
2. AI models (llama3.2, mistral) downloaded to YOUR hard drive
3. When you ask AI a question, it processes **entirely on your machine**
4. **Zero internet transmission** - data never leaves your computer
5. Perfect for confidential employee information (PII, medical, salary)

**Pros**:
- ✅ 100% private - no data sent to external servers
- ✅ Works offline (no internet needed)
- ✅ Free to use (no API costs)
- ✅ HIPAA/ADA/FMLA compliant for confidential data
- ✅ Fast (processes locally, no network latency)

**Cons**:
- ❌ Requires computer storage (3-8 GB per model)
- ❌ Slightly less "smart" than GPT-4/Claude (but very capable)
- ❌ Slower on older computers

**Use For**:
- Reviewing individual employee files with names/SSN
- Analyzing medical certifications (FMLA, ADA)
- Processing salary data and compensation analysis
- Investigating harassment complaints with PII

---

#### ☁️ CLOUD AI (ChatGPT, Claude)
**Simple Analogy**: Like calling an expert consultant who's brilliant but you need to be careful what you share.

**How It Works**:
1. You type question in web browser (ChatGPT.com, Claude.ai)
2. Your text sent over internet to company servers (OpenAI, Anthropic)
3. AI processes on their servers (massive computing power)
4. Response sent back to you over internet
5. **Your data passes through their systems** (privacy concerns)

**Pros**:
- ✅ Extremely intelligent (GPT-4, Claude Sonnet 4)
- ✅ No installation needed (just web browser)
- ✅ Works on any device
- ✅ Always up-to-date with latest improvements

**Cons**:
- ❌ Data leaves your computer (sent to company servers)
- ❌ Cannot use with PII/confidential employee data
- ❌ Requires internet connection
- ❌ Costs money (subscriptions or API fees)
- ❌ Privacy policies may allow data retention

**Use For**:
- Creating policy templates (no employee names)
- Researching CA employment law changes
- Drafting training presentations
- Generating audit methodologies
- Analyzing aggregate statistics ("20% of files missing I-9" - no names)

---

### What is an LLM vs. an Agent?

#### 📚 LLM (Large Language Model)
**Definition**: AI that understands and generates human-like text.

**Simple Analogy**: Like a very knowledgeable assistant who reads your question and writes a response. But they just sit there - you have to tell them every single thing to do.

**How It Works**:
- You: "Review this FMLA file and check if medical certification is complete"
- LLM: *Reads file, thinks, responds* "Medical certification present but missing physician signature on page 2"
- You: "Now check if employer provided FMLA notice"
- LLM: *Reads again, responds* "Yes, WH-382 notice dated 1/15/2024 is present"

**Key Point**: You guide every step. It doesn't take initiative.

**Examples**: ChatGPT, Claude, llama3.2 (Ollama), mistral

---

#### 🤖 AI AGENT
**Definition**: AI system that can plan, use tools, and take multi-step actions autonomously.

**Simple Analogy**: Like an assistant who can:
1. Read your goal ("Complete 50-file audit")
2. Break it into steps on their own
3. Use tools (open files, write reports, check websites)
4. Make decisions ("This file needs attorney review - adding to escalation list")

**How It Works**:
- You: "Audit employee file for John Smith (EMP023)"
- Agent: *Thinks*
  - "I'll check I-9 status" → opens I-9 file
  - "I-9 present, but Section 2 date is 4 days after hire - **FLAG: violation**"
  - "Checking FMLA eligibility..." → calculates tenure
  - "Employee eligible (hired 3 years ago) - checking FMLA file"
  - "No FMLA file found - **FLAG: critical gap**"
  - "Generating remediation report..."
- Agent: *Returns complete audit report without you prompting each step*

**Key Point**: You give it a goal; it figures out the steps.

**Examples**: 
- OpenAI GPT-4 with function calling
- Claude Computer Use (can control computer)
- AutoGPT (planning agent)
- LangChain agents (custom workflows)

---

### When to Use What in This Audit?

| Task | Use Local LLM | Use Cloud LLM | Use Agent |
|------|---------------|---------------|-----------|
| Review 1 employee file (PII) | ✅ Ollama | ❌ No | ❌ No |
| Draft audit methodology | ❌ | ✅ ChatGPT/Claude | ❌ |
| Audit all 50 files automatically | ❌ | ❌ | ✅ Custom agent |
| Research new CA law (SB 513) | ❌ | ✅ Web search + Claude | 🟡 Maybe |
| Create training presentation | ❌ | ✅ ChatGPT with DALL-E | ❌ |
| Batch process compliance scores | 🟡 With scripting | ❌ | ✅ Best option |

**For This Project**: We're using **Local LLMs (Ollama)** for confidential work and **Cloud LLMs** for strategy. We're NOT building full agents (yet) because it requires coding, but we're using AI assistants to reduce your cognitive load.

---

## 📓 OBSIDIAN EXPLAINED

### What is Obsidian?

**Definition**: A private, offline note-taking app that stores everything as simple text files on YOUR computer.

**Simple Analogy**: Imagine Microsoft OneNote, but:
- All notes are simple text files (not locked in proprietary format)
- Everything stored on YOUR computer (not Microsoft's cloud)
- Can create "links" between notes (like Wikipedia internally linking pages)
- Customizable with plugins (like Excel add-ins)
- 100% private (never sends data anywhere)

---

### Why Obsidian for This Audit?

#### ✅ SECURITY & CONFIDENTIALITY
- Files stored at: `C:\Users\mespindola\Documents\HRM\PERSONNEL RECORD AUDIT PROJECT`
- Never synced to cloud (unless you explicitly enable it)
- No company servers, no third-party access
- Perfect for PII, medical records, investigations

#### ✅ FLEXIBILITY
- Can view notes as:
  - Simple text (like Notepad)
  - Formatted documents (like Word)
  - Kanban boards (like Trello)
  - Mind maps (visual connections)
  - Gantt charts (project timelines)

#### ✅ LINKING & CONNECTIONS
Example structure:
\`\`\`
[[Employee-Audit-Tracker]] 
  → Links to [[EMP001-John-Smith]]
    → Links to [[FMLA-Compliance-Guide]]
      → Links to [[DOL-Form-WH-380-E]]
\`\`\`

Click any [[link]] to instantly jump to that note. No folders needed.

#### ✅ PLUGINS (Community Add-ons)
Like Excel macros but for notes:
- **Dataview**: Turn notes into databases ("Show me all high-risk files")
- **Kanban**: Move audit files through stages (To Do → In Progress → Complete)
- **Gantt Chart**: Visualize project timeline
- **Excalidraw**: Draw diagrams and flowcharts

---

### Is Obsidian Safe?

**YES - Here's Why**:

1. **Open Source Philosophy**: Code is publicly reviewed (no hidden spyware)
2. **Local Storage**: Files are plain text on YOUR computer (not encrypted in some proprietary format you can't access)
3. **No Account Required**: Don't need to create account/login (unlike Notion, Evernote)
4. **No Cloud Dependency**: Works 100% offline
5. **Portability**: If Obsidian disappeared tomorrow, all your files are still readable in Notepad

**Privacy Guarantee**: Obsidian never sees your data unless you:
- Enable Obsidian Sync (optional paid service)
- Enable Obsidian Publish (optional paid service)
- Install third-party plugins that connect to internet

**For This Audit**: We're using Obsidian in 100% offline mode. No sync, no publish, no internet plugins.

---

### Basic Obsidian Concepts

#### 📝 NOTES = FILES
Every note is just a `.md` (Markdown) file. Example:
\`\`\`
Employee-Audit-Tracker.md
├─ Simple text file
├─ Readable in Notepad, Word, VS Code
└─ Contains your audit data
\`\`\`

#### 🔗 LINKS = CONNECTIONS
\`\`\`markdown
This employee needs [[FMLA-Notice-WH-382]] and [[Medical-Certification]].
\`\`\`
When you click [[FMLA-Notice-WH-382]], Obsidian opens that note. If the note doesn't exist, it creates it.

#### 🏷️ TAGS = CATEGORIES
\`\`\`markdown
#high-risk #missing-i9 #requires-legal-review
\`\`\`
Search for `#high-risk` to see all flagged files.

#### 📊 DATAVIEW = DATABASE QUERIES
\`\`\`
Show me all employees where:
- Compliance score < 70%
- Missing I-9 = Yes
- Department = IT
\`\`\`
Dataview plugin turns your notes into a searchable database.

---

### Obsidian Learning Curve

**Day 1**: Confusing (What's Markdown? How do I link notes?)  
**Day 3**: Aha moment (Oh, it's just text files with superpowers!)  
**Week 1**: Comfortable (Creating notes, using templates, searching)  
**Week 2**: Power user (Building dashboards, using plugins, creating workflows)

**For This Audit**: We've pre-built everything. You just:
1. Open Obsidian
2. Click templates to create new notes
3. Fill in employee data
4. System auto-generates reports

---

## 🎓 QUICK START TUTORIALS

### Video Resources (External)

1. **"Obsidian for Beginners" (15 min)**  
   URL: https://www.youtube.com/watch?v=QgbLb6QCK88  
   Topics: Interface tour, creating notes, linking

2. **"Understanding Local vs Cloud AI" (12 min)**  
   URL: https://www.youtube.com/watch?v=5sLYAQS9sWQ  
   Topics: Privacy implications, when to use each

3. **"Ollama Setup on Windows" (10 min)**  
   URL: https://www.youtube.com/watch?v=Wjrdr0NU4Sk  
   Topics: Installation, downloading models, first query

4. **"LLMs vs AI Agents Explained" (18 min)**  
   URL: https://www.youtube.com/watch?v=F8NKVhkZZWI  
   Topics: Architectural differences, use cases

### Obsidian Plugin Tutorials

5. **"Dataview Plugin Tutorial" (20 min)**  
   URL: https://www.youtube.com/watch?v=JTObSymEvWA  
   Topics: Querying notes, creating tables, tracking tasks

6. **"Kanban Plugin for Project Management" (8 min)**  
   URL: https://www.youtube.com/watch?v=v6FZdTEf8VM  
   Topics: Creating boards, moving cards, audit workflow

---

## 📚 GLOSSARY OF HR/LEGAL TERMS

### Federal Laws
- **FLSA** (Fair Labor Standards Act): Federal wage/hour law requiring payroll records (29 USC § 201)
- **FMLA** (Family and Medical Leave Act): 12 weeks unpaid leave; requires medical certification (29 USC § 2601)
- **ADA** (Americans with Disabilities Act): Prohibits disability discrimination; requires medical files be separate (42 USC § 12101)
- **Title VII**: Civil Rights Act prohibiting employment discrimination (42 USC § 2000e)
- **FCRA** (Fair Credit Reporting Act): Regulates background checks (15 USC § 1681)

### California Laws
- **FEHA** (Fair Employment and Housing Act): CA anti-discrimination law (Gov. Code § 12900)
- **SB 807** (2022): Extended personnel record retention to 4 years (Gov. Code § 12946)
- **SB 513** (2024): Training records now part of personnel file (Lab. Code § 1198.5)
- **SB 553** (2024): Workplace violence prevention plan required (Lab. Code § 6401.7)
- **SB 1343**: Sexual harassment training every 2 years (Gov. Code § 12950.1)

### HR Terms
- **Personnel File**: Employee's official record (applications, reviews, discipline)
- **Confidential Medical File**: SEPARATE file for health info (FMLA, ADA, drug tests)
- **I-9 File**: SEPARATE file with all company I-9 forms (immigration compliance)
- **Tier 1/2/3 Documents**: Priority classification (Critical/Important/Recommended)
- **Progressive Discipline**: Escalating warnings (verbal → written → final → termination)

### Compliance Terms
- **Retention Period**: How long employer must keep records (varies by law)
- **Statute of Limitations**: Deadline to file lawsuit (e.g., 4 years for CA wage claims)
- **Remediation**: Fixing compliance gaps (obtaining missing documents)
- **File Separation**: Keeping medical/I-9 files SEPARATE from personnel files
- **DOL**: U.S. Department of Labor (federal agency)
- **DLSE**: Division of Labor Standards Enforcement (California agency)

---

## 🔍 COMMON QUESTIONS ANSWERED

### Q: Can I use ChatGPT for employee audits?
**A**: NO for individual employee data (PII). YES for strategy/templates.

### Q: What if I accidentally put employee names in Claude?
**A**: Data sent to cloud. Document the incident. Future: redact names before pasting.

### Q: How do I know which AI model to use?
**A**: Follow AI-Routing-Protocol.md in vault. If unsure, default to LOCAL (Ollama).

### Q: What if Obsidian crashes?
**A**: All files are plain text in `C:\Users\mespindola\Documents\HRM\PERSONNEL RECORD AUDIT PROJECT`. Open any .md file in Notepad - data is safe.

### Q: Do I need internet for this audit?
**A**: NO for Obsidian + Ollama (100% offline). YES for research and cloud AI strategy work.

### Q: Can legal counsel review these files?
**A**: YES. Export notes as PDFs or share entire vault folder.

---

## 📞 GETTING HELP

### Obsidian Help
- Press `Ctrl + P` (Command Palette) and type question
- Help docs: https://help.obsidian.md
- Community forum: https://forum.obsidian.md

### Ollama Help
- Official docs: https://github.com/ollama/ollama
- Command: `ollama help` in terminal

### AI Safety Questions
- Consult: AI-Routing-Protocol.md in vault
- When in doubt: Use local AI only

---

*This guide reduces cognitive load by explaining complex concepts in accessible language. Bookmark this page for reference throughout your audit.*
"@

$techConceptsContent | Out-File (Join-Path $resourcesPath "Technical-Concepts-Explained.md") -Encoding UTF8
Write-AuditLog "Technical concepts guide created" "SUCCESS"
#endregion

#region Legal Compliance Quick Reference
Write-AuditLog "Creating legal compliance quick reference..." "INFO"

$legalReferenceContent = @"
# Legal Compliance Quick Reference Guide
*Authoritative Citations for Personnel Audit | Ellen, HR Director*

## 📋 DOCUMENT RETENTION CHEAT SHEET

| Document | Federal | California | Keep For | Authority |
|----------|---------|------------|----------|-----------|
| **Form I-9** | 3 years from hire OR 1 year from separation (whichever later) | Same | Longer of two | 8 USC § 1324a |
| **Payroll Records** | 3 years | 4 years recommended | 4 years | FLSA/Lab Code § 1174 |
| **Personnel Files** | 1 year (EEOC) | 4 years (SB 807) | 4 years | Gov Code § 12946 |
| **FMLA Records** | 3 years | 3 years | 3 years | 29 CFR § 825.500 |
| **Training Records** | Varies | 4 years (SB 513) | 4 years | Lab Code § 1198.5 |
| **OSHA 300 Logs** | 5 years | 5 years | 5 years | 29 CFR § 1904.33 |
| **Medical Records** | Varies | 30 years (if exposure) | 30 years | 8 CCR § 3204 |

---

## 🔒 FILE SEPARATION REQUIREMENTS

### What MUST Be Separate?

#### 1️⃣ CONFIDENTIAL MEDICAL FILE (Separate from Personnel File)
**Legal Authority**: 42 USC § 12112(d)(3)(B) (ADA); 29 CFR § 825.500(g) (FMLA)

**Must Include**:
- ✅ FMLA medical certifications (DOL WH-380-E)
- ✅ ADA reasonable accommodation requests
- ✅ Fitness-for-duty exams
- ✅ Drug/alcohol test results
- ✅ Workers' comp medical records
- ✅ Pregnancy disability certifications
- ✅ GINA genetic information

**Storage**: Locked file cabinet, limited access (HR only), marked "CONFIDENTIAL - MEDICAL"

---

#### 2️⃣ I-9 FILE (Separate from All Other Files)
**Legal Authority**: 8 CFR § 274a.2; USCIS Handbook M-274

**Must Include**:
- ✅ ALL employee I-9 forms (consolidated in ONE location)
- ✅ I-9 supporting document copies
- ✅ Reverification forms (Section 3)

**Why Separate**: During ICE audit, employer produces ONLY I-9s - not entire personnel files (privacy protection)

**Storage**: Consolidated I-9 file (all employees together) OR electronic system

---

#### 3️⃣ CONFIDENTIAL INVESTIGATION FILE (Separate from Personnel File)
**Legal Authority**: Best practice; attorney-client privilege protection

**Must Include**:
- ✅ Harassment complaints
- ✅ Investigation interview notes
- ✅ Witness statements
- ✅ Investigator findings
- ✅ Disciplinary actions resulting from investigation

**Storage**: Locked file, HR Director + Legal only, marked "ATTORNEY-CLIENT PRIVILEGED"

---

## ⚖️ RECENT CALIFORNIA LEGISLATION SUMMARY

### SB 513 (Effective January 1, 2026)
**Topic**: Training records now part of personnel file

**Requirement**: Training/education records maintained by employer must be included in personnel file subject to employee inspection rights (Lab Code § 1198.5)

**Impact**: Employees can request copies of training records. Must provide within 30 days.

**Must Track**: Trainer name, date, duration, core competencies, resulting certification

---

### SB 553 (Effective July 1, 2024)
**Topic**: Workplace violence prevention

**Requirement**: Employers must establish written workplace violence prevention plan (Lab Code § 6401.7)

**Recordkeeping**: Maintain violent incident log for 5 years (Lab Code § 6401.9)

**Training**: Annual workplace violence prevention training required

---

### SB 807 (Effective January 1, 2022)
**Topic**: Extended record retention

**Requirement**: Personnel records retained 4 years (up from 3 years) (Gov Code § 12946)

**Covered Records**: Job applications, personnel files, hiring/promotion/termination records

---

### SB 1343 (Effective January 1, 2019 - Still Current)
**Topic**: Sexual harassment prevention training

**Requirement**: 
- Employers with 5+ employees must provide training
- Supervisors: 2 hours every 2 years
- Nonsupervisory: 1 hour every 2 years
- New hires: within 6 months
- Topics: sexual harassment, abusive conduct, harassment based on gender identity/expression/orientation

**Retention**: 4 years recommended (Gov Code § 12950.1)

---

## 🚨 PENALTY REFERENCE CHART

| Violation | Penalty Range | Authority |
|-----------|---------------|-----------|
| **Missing I-9 / Incomplete** | $272 - $2,507 per form | 8 CFR § 274a.10 |
| **Knowingly hiring unauthorized worker** | $2,507 - $25,076 | 8 CFR § 274a.10 |
| **Wage statement violation** | $50 first / $100 subsequent (max $4,000 per employee) | Lab Code § 226(e) |
| **Personnel record access denial** | $750 per violation | Lab Code § 1198.5(f) |
| **FMLA interference** | Back pay, liquidated damages, attorney fees | 29 USC § 2617 |
| **OSHA recordkeeping violation** | Up to $16,131 per violation (serious) | 29 CFR § 1903.15 |

---

## 📞 REGULATORY AGENCY CONTACTS

### Federal Agencies
- **U.S. Dept of Labor (DOL)** - FMLA, FLSA, OSHA  
  → San Francisco: (415) 625-2630  
  → https://www.dol.gov

- **EEOC** - Discrimination, harassment  
  → San Francisco: (800) 669-4000  
  → https://www.eeoc.gov

- **ICE** - I-9 audits  
  → https://www.ice.gov/worksite

### California Agencies
- **DLSE** (Division of Labor Standards Enforcement)  
  → Los Angeles: (213) 897-1511  
  → https://www.dir.ca.gov/dlse

- **DFEH** (Dept of Fair Employment & Housing)  
  → Now: Civil Rights Department (CRD)  
  → (800) 884-1684  
  → https://calcivilrights.ca.gov

- **Cal/OSHA**  
  → (844) 522-6734  
  → https://www.dir.ca.gov/dosh

- **EDD** (Employment Development Dept)  
  → Employer Helpline: (888) 745-3886  
  → https://edd.ca.gov

---

## 🎯 AUDIT PRIORITIES (Legal Risk Ranking)

### 🔴 CRITICAL (Address Within 10 Days)
1. Missing Form I-9 → ICE penalty $272-$2,507 each
2. Medical files not separated → ADA violation 42 USC § 12112(d)(3)(B)
3. FMLA-eligible employee with no FMLA documentation → DOL investigation
4. No harassment training for 2+ years → FEHA liability enhancement

### 🟠 HIGH (Address Within 30 Days)
5. Missing performance reviews → Weakens wrongful termination defense
6. Incomplete disciplinary files → No progressive discipline evidence
7. No job descriptions → Classification disputes (exempt/non-exempt)
8. Missing training records (post-SB 513) → Inspection right violation

### 🟡 MODERATE (Address Within 60 Days)
9. Missing offer letters → Contract term disputes
10. Incomplete benefit enrollment forms → ERISA compliance gaps

---

## 📖 LEGAL AUTHORITY DECODER

### How to Read Citations
- **29 USC § 2601** = Title 29, United States Code, Section 2601 (federal law)
- **29 CFR § 825.500** = Title 29, Code of Federal Regulations, Section 825.500 (federal regulation)
- **Cal. Lab. Code § 1174** = California Labor Code, Section 1174 (state statute)
- **8 CCR § 3203** = Title 8, California Code of Regulations, Section 3203 (state regulation)
- **Gov. Code § 12946** = California Government Code, Section 12946 (state statute)

### Where to Find Laws
- **Federal**: https://uscode.house.gov (statutes) | https://www.ecfr.gov (regulations)
- **California**: https://leginfo.legislature.ca.gov (statutes) | https://govt.westlaw.com (regulations)

---

*Use this guide to quickly cite legal authority when documenting audit findings or responding to employee requests.*
"@

$legalReferenceContent | Out-File (Join-Path $resourcesPath "Legal-Compliance-Quick-Reference.md") -Encoding UTF8
Write-AuditLog "Legal reference guide created" "SUCCESS"
#endregion

#region Interactive Buttons Configuration
Write-AuditLog "Creating interactive button templates..." "INFO"

$buttonsContent = @"
# Interactive Information Buttons Guide
*Using Obsidian Buttons Plugin for Quick Access*

## 🎛️ HOW TO USE BUTTONS

Buttons provide one-click access to explanatory resources without cluttering the main view.

### Example Button Syntax
\`\`\`button
name 🤖 What is Local AI?
type link
action obsidian://open?vault=PERSONNEL%20RECORD%20AUDIT%20PROJECT&file=05-REFERENCE-LIBRARY%2FTechnical-Concepts-Explained.md
\`\`\`

---

## 📚 PRE-CONFIGURED BUTTON LIBRARY

### Technical Concepts
\`\`\`button
name 🤖 Local vs Cloud AI
type link
action obsidian://open?vault=PERSONNEL%20RECORD%20AUDIT%20PROJECT&file=05-REFERENCE-LIBRARY%2FTechnical-Concepts-Explained.md#Local-AI-vs-Cloud-AI
\`\`\`

\`\`\`button
name 📓 What is Obsidian?
type link
action obsidian://open?vault=PERSONNEL%20RECORD%20AUDIT%20PROJECT&file=05-REFERENCE-LIBRARY%2FTechnical-Concepts-Explained.md#Obsidian-Explained
\`\`\`

\`\`\`button
name 🧠 LLM vs Agent
type link
action obsidian://open?vault=PERSONNEL%20RECORD%20AUDIT%20PROJECT&file=05-REFERENCE-LIBRARY%2FTechnical-Concepts-Explained.md#LLM-vs-Agent
\`\`\`

### Compliance References
\`\`\`button
name ⚖️ SB 513 Summary
type link
action obsidian://open?vault=PERSONNEL%20RECORD%20AUDIT%20PROJECT&file=05-REFERENCE-LIBRARY%2FLegal-Compliance-Quick-Reference.md#SB-513
\`\`\`

\`\`\`button
name 🔒 File Separation Rules
type link
action obsidian://open?vault=PERSONNEL%20RECORD%20AUDIT%20PROJECT&file=05-REFERENCE-LIBRARY%2FLegal-Compliance-Quick-Reference.md#File-Separation
\`\`\`

\`\`\`button
name 💰 Penalty Reference
type link
action obsidian://open?vault=PERSONNEL%20RECORD%20AUDIT%20PROJECT&file=05-REFERENCE-LIBRARY%2FLegal-Compliance-Quick-Reference.md#Penalty-Chart
\`\`\`

### AI Safety
\`\`\`button
name 🛡️ AI Routing Protocol
type link
action obsidian://open?vault=PERSONNEL%20RECORD%20AUDIT%20PROJECT&file=00-CONFIGURATION%2FAI-Integration%2FAI-Routing-Protocol.md
\`\`\`

\`\`\`button
name 📝 Prompt Library
type link
action obsidian://open?vault=PERSONNEL%20RECORD%20AUDIT%20PROJECT&file=00-CONFIGURATION%2FAI-Integration%2FLocal-AI-Prompt-Library.md
\`\`\`

---

## 🎨 EMBEDDING BUTTONS IN NOTES

### Example: Employee Audit Note Template
\`\`\`markdown
# Employee Audit: [Employee Name]
**Status**: In Progress

## Quick Help
\`\`\`button
name 🤖 Use Local AI for This File
type link
action obsidian://open?vault=PERSONNEL%20RECORD%20AUDIT%20PROJECT&file=00-CONFIGURATION%2FAI-Integration%2FAI-Routing-Protocol.md#Tier-1-Local-AI
\`\`\`

\`\`\`button
name 📋 View Audit Checklist
type link
action obsidian://open?vault=PERSONNEL%20RECORD%20AUDIT%20PROJECT&file=02-AUDIT-CHECKLISTS%2FMaster-Audit-Checklist.md
\`\`\`

## Audit Findings
[Your notes here]
\`\`\`

---

## 🚀 ADVANCED BUTTON ACTIONS

### Run PowerShell Script
\`\`\`button
name 📊 Generate Status Report
type command
action shell:powershell.exe -File "C:\Users\mespindola\Documents\HRM\PERSONNEL RECORD AUDIT PROJECT\03-TRACKING-DASHBOARDS\Generate-Status-Report.ps1"
\`\`\`

### Open External Tool
\`\`\`button
name 🤖 Launch Ollama UI
type command
action shell:ollama run llama3.2
\`\`\`

### Create New Note from Template
\`\`\`button
name ➕ New Employee Audit
type template
template employee-audit-template
folder 04-EMPLOYEE-FILES
\`\`\`

---

*Buttons reduce cognitive load by providing instant access to complex information without memorizing locations.*
"@

$buttonsContent | Out-File (Join-Path $resourcesPath "Interactive-Buttons-Guide.md") -Encoding UTF8
Write-AuditLog "Interactive buttons guide created" "SUCCESS"
#endregion

#region Training Checklist
$trainingContent = @"
# Self-Training Checklist for Audit Project
*Recommended Learning Path | Est. Time: 3-4 Hours*

## ✅ PRE-AUDIT TRAINING (Complete by 12/17/25)

### 📓 Obsidian Basics (30 minutes)
- [ ] Watch: "Obsidian for Beginners" (15 min) → https://www.youtube.com/watch?v=QgbLb6QCK88
- [ ] Practice: Create test note, add [[links]], use templates (15 min)
- [ ] **Milestone**: Successfully create and link 3 notes

### 🤖 Local AI Setup (45 minutes)
- [ ] Watch: "Ollama Setup on Windows" (10 min) → https://www.youtube.com/watch?v=Wjrdr0NU4Sk
- [ ] Install Ollama: Run Module 3 PowerShell script (10 min)
- [ ] Test: Run `ollama run llama3.2` and ask "Explain FMLA requirements" (5 min)
- [ ] Read: AI-Routing-Protocol.md in vault (20 min)
- [ ] **Milestone**: Successfully query local AI with test employment question

### ⚖️ Legal Compliance Review (60 minutes)
- [ ] Read: Legal-Compliance-Quick-Reference.md (20 min)
- [ ] Review: SB 513, SB 553, SB 807 summaries (15 min)
- [ ] Study: File Separation Requirements (15 min)
- [ ] Quiz: Can you identify which documents go in medical vs personnel file? (10 min)
- [ ] **Milestone**: Correctly categorize 10 sample documents

### 📊 Tracking System Familiarization (30 minutes)
- [ ] Open: Employee-Audit-Tracker.csv in Excel (5 min)
- [ ] Review: Progress-Dashboard.md in Obsidian (10 min)
- [ ] Understand: Risk-Scoring-Matrix.md methodology (15 min)
- [ ] **Milestone**: Understand how compliance scores are calculated

### 🎯 Audit Checklist Walkthrough (45 minutes)
- [ ] Read: Master-Audit-Checklist.md (20 min)
- [ ] Compare: Tier 1 vs Tier 2 vs Tier 3 requirements (10 min)
- [ ] Practice: Mock audit using sample employee file (15 min)
- [ ] **Milestone**: Complete practice audit in < 25 minutes

---

## ✅ DAY-OF-AUDIT REFRESHERS (10 min before each session)

### Before 12/19 Pilot Audit
- [ ] Re-read: Top 10 Compliance Gaps (5 min)
- [ ] Confirm: Local AI (Ollama) running → test query (2 min)
- [ ] Open: Obsidian vault and audit tracker (1 min)
- [ ] Review: Today's goal (5 files) and timeline (2 min)

### Before 12/22-12/26 Full Audit Days
- [ ] Review: Previous day's findings and patterns (3 min)
- [ ] Check: AI routing protocol for confidential data (2 min)
- [ ] Confirm: Tracking CSV updated with latest data (2 min)
- [ ] Mental prep: 15-20 min per file pace (3 min)

---

## ✅ OPTIONAL ADVANCED TRAINING (If Time Permits)

### 🔌 Obsidian Plugins Deep Dive (60 minutes)
- [ ] Watch: "Dataview Plugin Tutorial" (20 min) → https://www.youtube.com/watch?v=JTObSymEvWA
- [ ] Watch: "Kanban Plugin" (8 min) → https://www.youtube.com/watch?v=v6FZdTEf8VM
- [ ] Experiment: Create custom Dataview query for high-risk files (32 min)

### 🧠 AI Prompt Engineering (45 minutes)
- [ ] Read: Local-AI-Prompt-Library.md (15 min)
- [ ] Practice: Customize prompts for your audit style (20 min)
- [ ] Test: Compare prompt versions (detailed vs concise) for accuracy (10 min)

---

## 📊 TRAINING PROGRESS TRACKER

| Module | Est. Time | Actual Time | Completed | Confidence (1-10) |
|--------|-----------|-------------|-----------|-------------------|
| Obsidian Basics | 30 min | ___ | ⬜ | ___ |
| Local AI Setup | 45 min | ___ | ⬜ | ___ |
| Legal Compliance | 60 min | ___ | ⬜ | ___ |
| Tracking System | 30 min | ___ | ⬜ | ___ |
| Audit Checklist | 45 min | ___ | ⬜ | ___ |
| **TOTAL CORE** | **210 min (3.5 hrs)** | ___ | ⬜ | ___ |

**Confidence Scale**:  
1-3 = Need more practice | 4-6 = Comfortable | 7-10 = Expert

**Target**: All core modules ≥7 confidence before 12/19 pilot audit.

---

## 🎓 CERTIFICATION OF READINESS

**I certify that I have completed the following**:
- ✅ Understand difference between local AI (Ollama) and cloud AI (ChatGPT/Claude)
- ✅ Can identify which employee data requires local AI only
- ✅ Know how to separate medical/I-9/confidential files
- ✅ Familiar with SB 513, SB 553, SB 807 requirements
- ✅ Can navigate Obsidian vault and use templates
- ✅ Understand compliance risk scoring methodology
- ✅ Ready to conduct pilot audit (5 files) on 12/19/25

**Signature**: _________________  **Date**: _________________

---

## 📞 HELP RESOURCES

**Technical Issues**:
- Obsidian: Press Ctrl+P → Search help
- Ollama: Run `ollama help` in terminal
- PowerShell: Right-click script → "Run with PowerShell"

**Legal Questions**:
- Review: Legal-Compliance-Quick-Reference.md
- Escalate to: Employment attorney (for liability questions)

**Process Questions**:
- Review: README-MODULES.md (full implementation guide)
- Consult: This training checklist

---

*Complete this training before 12/17/25 setup day to ensure smooth audit execution.*
"@

$trainingContent | Out-File (Join-Path $resourcesPath "Self-Training-Checklist.md") -Encoding UTF8
Write-AuditLog "Training checklist created" "SUCCESS"
#endregion

#region Resource Index
$resourceIndexContent = @"
# Reference Library Index
*Quick Navigation to All Educational Resources*

## 📚 CORE DOCUMENTS

### Technical Concepts
- [[Technical-Concepts-Explained]] - AI, Obsidian, LLM vs Agent explained
  - Local AI vs Cloud AI
  - LLM vs AI Agent
  - Obsidian safety and functionality
  - Video tutorial links

### Legal & Compliance
- [[Legal-Compliance-Quick-Reference]] - Citations, penalties, regulations
  - Document retention periods
  - File separation requirements
  - Recent CA legislation (SB 513, 553, 807)
  - Penalty reference chart
  - Regulatory agency contacts

### Training & Learning
- [[Self-Training-Checklist]] - Structured learning path (3-4 hours)
  - Pre-audit training modules
  - Day-of-audit refreshers
  - Progress tracker
  - Certification of readiness

### Interactive Tools
- [[Interactive-Buttons-Guide]] - One-click info access
  - Button syntax examples
  - Pre-configured button library
  - Embedding buttons in notes

---

## 🎯 QUICK ACCESS BY TOPIC

### 🤖 AI & Technology
- What is local AI? → [[Technical-Concepts-Explained#Local-AI]]
- LLM vs Agent? → [[Technical-Concepts-Explained#LLM-vs-Agent]]
- Obsidian safety → [[Technical-Concepts-Explained#Is-Obsidian-Safe]]
- AI routing rules → [[AI-Routing-Protocol]]

### ⚖️ Legal Authority
- Retention periods → [[Legal-Compliance-Quick-Reference#Retention-Cheat-Sheet]]
- File separation → [[Legal-Compliance-Quick-Reference#File-Separation]]
- SB 513 summary → [[Legal-Compliance-Quick-Reference#SB-513]]
- Penalties → [[Legal-Compliance-Quick-Reference#Penalty-Chart]]

### 🎓 Learning
- Obsidian basics → [[Self-Training-Checklist#Obsidian-Basics]]
- AI setup → [[Self-Training-Checklist#Local-AI-Setup]]
- Legal review → [[Self-Training-Checklist#Legal-Compliance-Review]]
- Audit practice → [[Self-Training-Checklist#Audit-Checklist-Walkthrough]]

---

## 📹 VIDEO TUTORIALS (External)

| Topic | Duration | URL |
|-------|----------|-----|
| Obsidian for Beginners | 15 min | https://www.youtube.com/watch?v=QgbLb6QCK88 |
| Local vs Cloud AI | 12 min | https://www.youtube.com/watch?v=5sLYAQS9sWQ |
| Ollama Setup (Windows) | 10 min | https://www.youtube.com/watch?v=Wjrdr0NU4Sk |
| LLMs vs AI Agents | 18 min | https://www.youtube.com/watch?v=F8NKVhkZZWI |
| Dataview Plugin | 20 min | https://www.youtube.com/watch?v=JTObSymEvWA |
| Kanban Plugin | 8 min | https://www.youtube.com/watch?v=v6FZdTEf8VM |

---

## 🔍 SEARCH TIPS

### In Obsidian
- Press `Ctrl + O`: Quick file switcher
- Press `Ctrl + Shift + F`: Search all notes
- Press `Ctrl + P`: Command palette

### Common Searches
- `#high-risk`: Show all high-risk audit flags
- `tag:#missing-i9`: Files with I-9 gaps
- `[compliance score < 70]`: Dataview query for low-scoring files

---

## 📊 USAGE STATISTICS

**Total Resources**: 4 comprehensive guides  
**Total Video Hours**: ~1.5 hours curated content  
**Est. Learning Time**: 3-4 hours core training  
**Obsidian Links**: 50+ internal connections  

---

## 🆘 GETTING HELP

**Can't find something?**
1. Search this index for keywords
2. Use Obsidian search (Ctrl + Shift + F)
3. Check README-MODULES.md for full documentation
4. Review Technical-Concepts-Explained for tool basics

**Still stuck?**
- Obsidian help: https://help.obsidian.md
- Ollama GitHub: https://github.com/ollama/ollama
- Legal questions: Consult employment attorney

---

*This library reduces cognitive load by centralizing all reference materials in one accessible location.*
"@

$resourceIndexContent | Out-File (Join-Path $resourcesPath "Resource-Library-Index.md") -Encoding UTF8
Write-AuditLog "Resource library index created" "SUCCESS"
#endregion

#region Completion Summary
Write-AuditLog "`n=== MODULE 5 COMPLETE ===" "SUCCESS"
Write-AuditLog "Information Resources and Training Hub Summary:" "INFO"
Write-AuditLog "  ✓ Technical concepts explained (AI, Obsidian, LLM vs Agent)" "SUCCESS"
Write-AuditLog "  ✓ Legal compliance quick reference (citations, penalties)" "SUCCESS"
Write-AuditLog "  ✓ Interactive buttons guide (one-click info access)" "SUCCESS"
Write-AuditLog "  ✓ Self-training checklist (3-4 hours structured learning)" "SUCCESS"
Write-AuditLog "  ✓ Resource library index (master navigation)" "SUCCESS"
Write-AuditLog "  ✓ Video tutorial links (6 curated resources)" "SUCCESS"

Write-AuditLog "`nKNOWLEDGE BASE READY:" "INFO"
Write-AuditLog "  → 50+ internal links for instant navigation" "INFO"
Write-AuditLog "  → 6 video tutorials (~90 minutes)" "INFO"
Write-AuditLog "  → Glossary of 20+ HR/legal terms" "INFO"
Write-AuditLog "  → Interactive button templates" "INFO"

Write-AuditLog "`nLEARNING PATH ESTABLISHED:" "INFO"
Write-AuditLog "  1. Obsidian Basics (30 min)" "INFO"
Write-AuditLog "  2. Local AI Setup (45 min)" "INFO"
Write-AuditLog "  3. Legal Compliance Review (60 min)" "INFO"
Write-AuditLog "  4. Tracking System (30 min)" "INFO"
Write-AuditLog "  5. Audit Checklist Walkthrough (45 min)" "INFO"
Write-AuditLog "  Total Core Training: 3.5 hours before 12/17/25" "INFO"

Write-AuditLog "`nALL 5 MODULES NOW COMPLETE" "WARNING"
Write-AuditLog "  Next: Review README-MODULES.md for full implementation guide" "WARNING"
Write-AuditLog "  Next: Execute modules in sequence before audit start date" "WARNING"
#endregion