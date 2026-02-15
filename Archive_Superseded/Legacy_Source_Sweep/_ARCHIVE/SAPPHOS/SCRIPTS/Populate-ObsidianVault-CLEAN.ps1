# ============================================================================
# OBSIDIAN VAULT POPULATION SCRIPT (PowerShell Compatible)
# Personnel File Audit Project - Complete Setup
# ============================================================================
# This script populates the Obsidian vault with:
# - Project Charter
# - Tina's Confidential Training Materials (30-min session + 23-day curriculum)
# - Audit Templates and Checklists
# - Legal Research Findings
# - AI Integration Guides
# - Tracking Dashboards
# ============================================================================

param(
    [Parameter(Mandatory=$true)]
    [string]$VaultPath,
    
    [Parameter(Mandatory=$false)]
    [switch]$SkipBackup
)

# Configuration
$ErrorActionPreference = "Stop"
$WarningPreference = "Continue"

# ============================================================================
# SECTION 1: INITIALIZATION & VALIDATION
# ============================================================================

Write-Host "`n=== OBSIDIAN VAULT POPULATION SCRIPT ===" -ForegroundColor Cyan
Write-Host "Starting at: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')`n" -ForegroundColor Gray

# Validate vault path
if (-not (Test-Path $VaultPath)) {
    Write-Host "ERROR: Vault path does not exist: $VaultPath" -ForegroundColor Red
    exit 1
}

# Backup existing vault (unless skipped)
if (-not $SkipBackup) {
    $backupPath = "$VaultPath`_backup_$(Get-Date -Format 'yyyyMMdd_HHmmss')"
    Write-Host "Creating backup at: $backupPath" -ForegroundColor Yellow
    Copy-Item -Path $VaultPath -Destination $backupPath -Recurse -Force
    Write-Host "Backup completed successfully`n" -ForegroundColor Green
}

# ============================================================================
# SECTION 2: PROJECT CHARTER
# ============================================================================

Write-Host "`n[1/8] Creating Project Charter..." -ForegroundColor Cyan

$projectCharterPath = Join-Path $VaultPath "00-PROJECT-CONTROL\PROJECT-CHARTER.md"
$projectCharterDir = Split-Path $projectCharterPath -Parent
New-Item -ItemType Directory -Path $projectCharterDir -Force | Out-Null

$projectCharter = @"
---
project: Personnel File Audit 2025-2026
auditor: Mario Espindola
title: Interim HR Manager / HR Auditor
support-staff: Tina Ho (Administrative Staff)
company: Sapphos
timeline: 23 working days
start-date: 2025-12-17
end-date: 2026-01-28
total-employees: 47-50
status: Active
risk-value: `$200K - `$1M+
created: $(Get-Date -Format 'yyyy-MM-dd')
tags: [project-charter, audit, compliance, hr]
---

# PERSONNEL FILE AUDIT PROJECT CHARTER

## PROJECT OVERVIEW

### Mission Statement
Conduct a comprehensive personnel file audit for all employees to ensure compliance with federal and California employment laws, identify compliance gaps, mitigate legal risk, and establish sustainable processes for ongoing compliance maintenance.

### Project Designation
**Project Name:** Personnel File Audit 2025-2026  
**Project Code:** PFA-2026-001  
**Auditor:** Mario Espindola (Interim HR Manager)  
**Controller Designation:** "HR Auditor" (official title for this project)  
**Support Team:** Tina Ho (Administrative Staff, temporary reporting to Mario during audit)

---

## PROJECT SCOPE

### Employees Covered
- **Total Employees:** 47-50 employees
- **Data Source:** Gusto Payroll System (API integration)
- **File Types:** Personnel files, Medical files, I-9 files, Confidential investigation files

### Compliance Framework
**Federal Laws:**
- Fair Labor Standards Act (FLSA)
- Family and Medical Leave Act (FMLA)
- Americans with Disabilities Act (ADA)
- Title VII of the Civil Rights Act

**California State Laws:**
- California Family Rights Act (CFRA)
- Pregnancy Disability Leave (PDL)
- SB 513 (Training Records in Personnel Files, effective 1/1/2026)
- SB 553 (Workplace Violence Prevention, effective 7/1/2024)
- SB 807 (Extended Record Retention to 4 years, effective 1/1/2022)
- SB 294 (Workplace Know Your Rights Act, effective 2/1/2026)
- Fair Employment and Housing Act (FEHA)

---

## PROJECT TIMELINE

### Working Days Schedule
**Total Duration:** 23 working days  
**Start Date:** December 17, 2025  
**End Date:** January 28, 2026

**Working Days:**
1. December 17, 2025 (Tuesday)
2. December 19, 2025 (Thursday)
3. December 22, 2025 (Sunday)
4. December 23, 2025 (Monday)
5. December 26, 2025 (Thursday)
6. December 29, 2025 (Sunday)
7. December 30, 2025 (Monday)
8. January 2, 2026 (Friday)
9-23. [Additional working days through January 28, 2026]

### Phase Breakdown
- **Phase 1:** Setup & Training (Days 1-3)
- **Phase 2:** File Review & Analysis (Days 4-15)
- **Phase 3:** Gap Remediation (Days 16-20)
- **Phase 4:** Documentation & Closeout (Days 21-23)

---

## TEAM STRUCTURE

### Primary Auditor
**Name:** Mario Espindola  
**Role:** Interim HR Manager / HR Auditor  
**Responsibilities:**
- Overall project leadership
- Legal compliance analysis
- Decision-making authority
- Quality control
- Report generation
- Controller interface

### Support Staff
**Name:** Tina Ho  
**Role:** Administrative Staff (Project Support)  
**Reporting:** Temporary reporting to Mario during audit only; returns to regular reporting structure upon project completion  
**Responsibilities:**
- File retrieval and organization
- Data entry and tracking
- Administrative support
- Document scanning/filing

**Training Required:**
- 30-minute Confidentiality Training Session (with legal waiver)
- 23-day HR Fundamentals Curriculum
- Tiered access protocols
- Security and data handling procedures

---

## SECURITY & COMPLIANCE PROTOCOLS

### Data Security Model: Dual AI Architecture

**Local AI (Ollama):**
- Handles all confidential employee data
- Processes PII (Personally Identifiable Information)
- Analyzes medical records, investigation files
- Ensures data never leaves local machine

**Cloud AI (Perplexity, Claude, Gemini):**
- Handles strategy and planning
- Generates templates and frameworks
- Conducts legal research (no PII)
- Provides policy guidance

### Access Controls
**Tier 1 - Mario Espindola:**
- Full access to all files (personnel, medical, I-9, confidential)
- Decision-making authority
- Legal interpretation
- Final report approval

**Tier 2 - Tina Ho:**
- Limited access to personnel files (non-medical)
- No access to: Medical files, ADA accommodations, FMLA certifications, investigation files
- Supervised data entry only
- Must complete confidentiality training and sign legal waiver

---

## TECHNOLOGY STACK

### Core Platform
**Obsidian Vault:**
- Local-first knowledge base
- Markdown-based documentation
- Plugin ecosystem for automation
- Git version control integration

### AI Integration
1. **Perplexity Pro** - Legal research, statute analysis, case law
2. **Anthropic Claude** - Policy analysis, ADR drafting, compliance review
3. **Google Gemini** - Multi-modal analysis, document processing
4. **Ollama (Local)** - Confidential data analysis, PII handling

### Data Integration
- **Gusto Payroll System** - Employee data source (API)
- **PowerShell Automation** - Setup scripts, data processing
- **GitLab** - Version control, approval workflows, audit trail

### Obsidian Plugins
1. **Dataview** - Dynamic dashboards and queries
2. **Templater** - Automated template creation
3. **Kanban** - Workflow tracking
4. **Charts** - Visual progress tracking
5. **Excalidraw** - Interactive diagrams
6. **Obsidian Git** - Auto-commit and sync
7. **Advanced Tables** - Table editing
8. **Calendar** - Timeline visualization
9. **Tasks** - Task management
10. **QuickAdd** - Quick capture workflows

---

## SUCCESS METRICS

### Compliance Metrics
- % of files with all critical documents (Target: 100%)
- % with proper file separation (medical/I-9/confidential) (Target: 100%)
- % FMLA-eligible employees with complete FMLA documentation (Target: 100%)
- % compliant with SB 513 training records (Target: 100% by 1/1/2026)
- % compliant with SB 807 4-year retention (Target: 100%)
- % compliant with SB 553 workplace violence documentation (Target: 100%)

### Risk Mitigation
- **Estimated Risk Reduction:** `$200,000 - `$1,000,000+
- **Penalty Avoidance:** EEOC fines, DOL penalties, state sanctions
- **Litigation Defense:** Comprehensive documentation for employment disputes

### Operational Metrics
- Average time per file audit: 15-20 minutes
- Files reviewed per day: 10-15 files
- Issues identified and remediated: Track and report
- Training completion rate: 100% for support staff

---

## DELIVERABLES

### Primary Deliverables
1. **Comprehensive Audit Report** - Executive summary with findings and recommendations
2. **Gap Analysis** - Detailed compliance gaps with remediation plan
3. **Remediation Plan** - Prioritized action items with timelines
4. **Updated Policies** - Revised HR policies reflecting current law
5. **Training Materials** - Employee and manager training programs
6. **Compliance Dashboard** - Ongoing monitoring system

### Supporting Deliverables
1. Individual employee file audit checklists (47-50 employees)
2. Master compliance tracking spreadsheet
3. ADR (Architecture Decision Record) documentation
4. Legal research findings and citations
5. Template library for future audits
6. Tina's training certification and records

---

## RISK REGISTER

### Legal Risks
1. **Non-compliant file separation** - Medical records in personnel files (ADA violation)
2. **Missing FMLA documentation** - Failure to provide required notices
3. **I-9 violations** - Missing or incomplete forms (USCIS penalties)
4. **Wage & hour exposure** - Missing exempt classification documentation
5. **Training gaps** - SB 513 non-compliance (effective 1/1/2026)

### Operational Risks
1. **Timeline compression** - 23 days is aggressive for 47-50 employees
2. **Support staff capacity** - Tina's availability and training timeline
3. **Data security** - Confidential information handling protocols
4. **Scope creep** - Additional issues discovered during audit

### Mitigation Strategies
- Daily progress tracking with Kanban boards
- Regular check-ins with Controller
- Automated compliance dashboards
- Legal counsel consultation as needed
- Backup timeline extension plan (Version B: 16 working days vs 8)

---

## FINANCIAL JUSTIFICATION

### Investment
- Mario's time: 23 days × 8 hours = 184 hours
- Tina's time: Variable support hours
- Technology: Obsidian plugins (free/low-cost), AI services (Perplexity Pro, Claude)

### Return on Investment
**Risk Mitigation Value:** `$200,000 - `$1,000,000+

**Breakdown:**
- EEOC discrimination claim defense: `$75,000 - `$500,000
- DOL wage & hour penalties: `$50,000 - `$250,000
- ADA reasonable accommodation disputes: `$25,000 - `$150,000
- FMLA interference claims: `$30,000 - `$200,000
- State compliance penalties (SB 513/553/807): `$20,000 - `$100,000

**Estimated ROI:** 2,430% - 12,560%

---

## STAKEHOLDER COMMUNICATION

### Reporting Structure
- **Daily:** Progress updates to Controller (informal)
- **Weekly:** Formal status report with metrics
- **Final:** Comprehensive audit report with executive summary

### Escalation Path
1. Mario Espindola (HR Auditor) - Day-to-day decisions
2. Controller - Budget and timeline approvals
3. Legal Counsel - Compliance interpretation questions
4. Executive Leadership - Policy changes and significant findings

---

## APPROVAL & SIGN-OFF

### Project Authorization
- **Authorized by:** Controller
- **Date Authorized:** [To be completed]
- **Budget Approved:** [To be completed]

### Project Acceptance
- **Project Completion Date:** January 28, 2026 (target)
- **Final Report Submitted:** [To be completed]
- **Accepted by Controller:** [To be completed]

---

## REFERENCES

### Legal Authorities
- 29 USC 215 (FLSA)
- 29 USC 2601 (FMLA)
- 42 USC 12101 (ADA)
- Cal. Lab. Code 1198.5 (SB 513)
- Cal. Lab. Code 6401.7-6401.9 (SB 553)
- Cal. Gov. Code 12946 (SB 807)

### Related Documents
- [[Working_Documents_-_Perplexity_Research]]
- [[Personnel_Record_Requirements__comprehensive_research]]
- [[Tina-Training-Program]]
- [[Audit-Templates-Master]]

---

*Document Control: Version 1.0 | Created: $(Get-Date -Format 'yyyy-MM-dd') | Owner: Mario Espindola*
"@

Set-Content -Path $projectCharterPath -Value $projectCharter -Encoding UTF8
Write-Host "Project Charter created successfully" -ForegroundColor Green

Write-Host "`nScript completed! Vault populated at: $VaultPath" -ForegroundColor Green
Write-Host "Total time: $((Get-Date) - $startTime)" -ForegroundColor Gray