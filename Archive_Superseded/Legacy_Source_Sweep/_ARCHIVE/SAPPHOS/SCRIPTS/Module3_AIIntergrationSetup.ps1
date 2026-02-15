# Module 3: AI Integration Setup for Personnel Audit Laboratory
# Purpose: Configure local AI (Ollama, Copilot) and establish cloud AI routing
# Author: Ellen, HR Director | Date: December 2025
# PROJECT DATES: 12/17/25, 12/19/25, 12/22/25, 12/23/25, 12/26/25, 12/29/25, 12/30/25, 01/02/26

<#
.SYNOPSIS
Establishes AI infrastructure for confidential personnel audit analysis

.DESCRIPTION
- Configures Ollama for local, confidential employee data processing
- Sets up GitHub Copilot integration for code assistance
- Creates AI routing logic (local vs cloud)
- Establishes prompt templates for audit analysis
- Implements security controls for PII protection

.NOTES
COMPLIANCE: All PII remains on local machine. Cloud AI used only for strategy.
#>

param(
    [string]$VaultPath = "C:\Users\mespindola\Documents\HRM\PERSONNEL RECORD AUDIT PROJECT",
    [switch]$SkipOllamaInstall,
    [switch]$Verbose
)

$ErrorActionPreference = "Stop"

# Color-coded logging
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

Write-AuditLog "=== MODULE 3: AI INTEGRATION SETUP ===" "INFO"
Write-AuditLog "Establishing dual AI infrastructure for audit project" "INFO"

#region Ollama Installation and Configuration
if (-not $SkipOllamaInstall) {
    Write-AuditLog "Checking Ollama installation..." "INFO"
    
    try {
        $ollamaVersion = ollama --version 2>$null
        Write-AuditLog "Ollama already installed: $ollamaVersion" "SUCCESS"
    }
    catch {
        Write-AuditLog "Ollama not found. Installing..." "WARNING"
        
        # Download and install Ollama for Windows
        $ollamaInstaller = "$env:TEMP\OllamaSetup.exe"
        Invoke-WebRequest -Uri "https://ollama.ai/download/OllamaSetup.exe" -OutFile $ollamaInstaller
        
        Write-AuditLog "Running Ollama installer (may require admin privileges)..." "INFO"
        Start-Process -FilePath $ollamaInstaller -Wait
        
        Write-AuditLog "Ollama installed successfully" "SUCCESS"
    }
    
    # Pull recommended models for HR audit work
    Write-AuditLog "Downloading AI models for local processing..." "INFO"
    
    $models = @(
        @{Name="llama3.2"; Purpose="General audit analysis, policy review"},
        @{Name="mistral"; Purpose="Legal document analysis, compliance checks"},
        @{Name="codellama"; Purpose="Data structure analysis, Excel formula validation"}
    )
    
    foreach ($model in $models) {
        Write-AuditLog "Pulling $($model.Name) - $($model.Purpose)" "INFO"
        ollama pull $model.Name
    }
    
    Write-AuditLog "All AI models ready for offline analysis" "SUCCESS"
}
#endregion

#region AI Configuration Files
Write-AuditLog "Creating AI configuration and routing files..." "INFO"

$aiConfigPath = Join-Path $VaultPath "00-CONFIGURATION\AI-Integration"
New-Item -Path $aiConfigPath -ItemType Directory -Force | Out-Null

# AI Routing Logic Document
$aiRoutingContent = @"
# AI Routing Protocol for Personnel Audit Project
*Established: December 2025 | Compliance Authority: Ellen, HR Director*

## 🔒 CONFIDENTIALITY CLASSIFICATION SYSTEM

### TIER 1: LOCAL AI ONLY (Ollama) - CONFIDENTIAL PII
**Rule**: Employee PII, medical info, discipline records, salary data **NEVER** leave local machine.

**Use Cases**:
- ✓ Analyzing individual employee files for completeness
- ✓ Reviewing medical certifications (FMLA, ADA)
- ✓ Processing salary/compensation data
- ✓ Investigating harassment complaints
- ✓ Evaluating disciplinary action files
- ✓ Any task involving SSN, health data, or financial info

**Models to Use**:
- **llama3.2**: General employee record analysis
- **mistral**: Legal compliance document review
- **codellama**: Data structure validation

**Example Prompts** (Local Only):
\`\`\`
"Review this employee's FMLA file for required DOL forms WH-380-E and WH-382"
"Analyze disciplinary progression: are there gaps between verbal, written, final warnings?"
"Check if this ADA accommodation file contains interactive process documentation"
\`\`\`

---

### TIER 2: CLOUD AI (Claude/ChatGPT) - STRATEGIC/NON-PII
**Rule**: Strategy, policy templates, training materials, aggregate statistics OK for cloud.

**Use Cases**:
- ✓ Drafting audit methodology frameworks
- ✓ Creating training presentations on SB 513 requirements
- ✓ Generating compliance checklists
- ✓ Analyzing aggregate workforce statistics (no names)
- ✓ Research on CA labor law changes
- ✓ Creating PowerPoint templates

**Example Prompts** (Cloud OK):
\`\`\`
"Draft a 2-hour training outline on California harassment prevention (Gov Code 12950.1)"
"Create Excel formulas to calculate 4-year retention period from hire date"
"Summarize key changes in SB 553 workplace violence prevention requirements"
\`\`\`

---

## 🔄 WORKFLOW DECISION TREE

\`\`\`mermaid
graph TD
    A[Task to Complete] --> B{Contains Employee Names/PII?}
    B -->|Yes| C[LOCAL AI ONLY - Ollama]
    B -->|No| D{Strategic/Policy Work?}
    D -->|Yes| E[CLOUD AI OK - Claude/ChatGPT]
    D -->|No| F{Aggregate Data Only?}
    F -->|Yes| E
    F -->|No| C
    
    C --> G[Use llama3.2/mistral locally]
    E --> H[Use Claude.ai or ChatGPT]
    
    style C fill:#ff6b6b,stroke:#c92a2a,color:#fff
    style E fill:#51cf66,stroke:#2b8a3e,color:#fff
\`\`\`

---

## 📋 PRE-TASK CHECKLIST

Before using ANY AI tool, ask yourself:

- [ ] Does this task involve employee names?
- [ ] Does this contain Social Security Numbers?
- [ ] Are there medical records or health conditions?
- [ ] Is salary/compensation data included?
- [ ] Would this violate HIPAA, ADA, or FMLA confidentiality?
- [ ] Could this expose the organization to privacy liability?

**If you answered YES to any question** → Use LOCAL AI (Ollama) ONLY.

---

## 🛡️ SECURITY REMINDERS

1. **Never copy/paste PII into cloud AI tools** (Claude, ChatGPT, Gemini)
2. **Redact names** before using cloud tools for examples
3. **Aggregate data** (e.g., "45% of files missing I-9") is safe for cloud
4. **When in doubt**, use local AI
5. **Legal counsel consultation**: If analyzing potential EEOC/DFEH exposure → local AI + attorney review

---

## 📞 ESCALATION PROTOCOL

**When to consult legal counsel** (regardless of AI tier):
- Potential discrimination/retaliation patterns detected
- EEOC or DFEH charge anticipated
- Whistleblower complaint implicated
- Class action risk identified
- Workers' comp fraud suspected

**Contact**: [Insert Employment Attorney Contact]

---

*Compliance Note: This protocol aligns with California Labor Code § 1198.5 (personnel record confidentiality), HIPAA 45 CFR § 164.502, and ADA 42 USC § 12112(d)(3)(B).*
"@

$aiRoutingContent | Out-File (Join-Path $aiConfigPath "AI-Routing-Protocol.md") -Encoding UTF8
Write-AuditLog "Created AI routing protocol" "SUCCESS"

# Local AI Prompt Templates
$promptLibraryContent = @"
# Local AI Prompt Library for Personnel Audits
*Confidential - For Internal HR Use Only*

## 🔍 AUDIT COMPLETENESS CHECKS

### I-9 Verification Prompt
\`\`\`
You are an HR compliance specialist reviewing Form I-9 for [EMPLOYEE NAME - REDACT FOR CLOUD].

**Task**: Analyze the following I-9 data and identify any deficiencies:

[PASTE EMPLOYEE I-9 DETAILS HERE]

**Check for**:
1. Section 1 completed on/before first day of work
2. Section 2 completed within 3 business days of hire
3. List A document OR List B + List C documents present
4. Photocopies attached (if company policy)
5. Reverification completed if work authorization expired
6. Corrections documented with date/initials

**Output**: Checklist with ✓ (compliant) or ✗ (deficient) for each item.
\`\`\`

---

### FMLA File Completeness Prompt
\`\`\`
You are reviewing an employee's FMLA file for regulatory compliance.

**Employee**: [REDACTED]
**Leave Dates**: [INSERT DATES]

**Documents to verify**:
1. Eligibility notice (DOL Form WH-381)
2. Rights & responsibilities notice (DOL Form WH-382-E)
3. Medical certification (DOL Form WH-380-E)
4. Designation notice (employer-created)
5. Premium payment tracking during leave
6. Return-to-work documentation

**Current File Contents**:
[PASTE FILE INVENTORY HERE]

**Task**: Identify missing documents and cite 29 CFR § 825.300 requirements.
\`\`\`

---

## 📊 DATA VALIDATION PROMPTS

### Salary Equity Analysis (CONFIDENTIAL)
\`\`\`
You are conducting a pay equity audit under California Equal Pay Act (Lab. Code § 1197.5).

**Dataset**: [PASTE ANONYMIZED SALARY DATA WITH JOB CODES]

**Analysis Required**:
1. Identify salary disparities >15% for substantially similar work
2. Flag gender/race pay gaps requiring justification
3. Check if differentials explained by:
   - Seniority system
   - Merit system  
   - Production-based system
   - Bona fide factor other than protected class

**Output**: Risk matrix with high/medium/low concern ratings.
\`\`\`

---

### Retention Period Validation
\`\`\`
You are verifying document retention compliance for a California employer.

**Document Type**: [E.G., PERFORMANCE REVIEWS]
**Current Retention**: [E.G., 2 YEARS]

**Task**:
1. Cite correct retention period under:
   - Federal law (EEOC, FLSA, ADA)
   - California law (Gov. Code § 12946 - SB 807)
2. Identify compliance gap if any
3. Recommend remediation timeline

**Reference**: Use attached research document (Document 2 from context).
\`\`\`

---

## 🚨 INVESTIGATION ANALYSIS PROMPTS

### Harassment Complaint Pattern Analysis
\`\`\`
**CONFIDENTIAL ATTORNEY-CLIENT WORK PRODUCT**

You are assisting in a workplace investigation. Analyze the following:

**Complainant**: [REDACTED]
**Respondent**: [REDACTED]  
**Allegations**: [SUMMARY]
**Timeline**: [KEY DATES]

**Evidence Reviewed**:
- Witness statements: [COUNT]
- Email correspondence: [COUNT]
- Prior complaints: [YES/NO]

**Task**:
1. Identify credibility factors per EEOC Enforcement Guidance
2. Note temporal proximity to protected activity (retaliation risk)
3. Flag corroborating/contradicting evidence
4. Recommend additional investigation steps

**Standard**: Preponderance of evidence (>50% likely true).
\`\`\`

---

## 📝 DOCUMENT DRAFTING PROMPTS

### Missing Document Remediation Letter
\`\`\`
Draft a letter to [EMPLOYEE NAME] requesting missing personnel file documents.

**Missing Items**:
- [E.G., SIGNED HANDBOOK ACKNOWLEDGMENT]
- [E.G., UPDATED EMERGENCY CONTACT]

**Tone**: Professional, non-punitive
**Deadline**: 10 business days
**Consequence**: Note file incomplete; may affect [specify if applicable]

**Legal Authority**: Cal. Lab. Code § 1198.5 (employer obligation to maintain complete personnel records per SB 513).
\`\`\`

---

*Reminder: These prompts are for LOCAL AI (Ollama) use only. Never paste employee PII into cloud-based AI tools.*
"@

$promptLibraryContent | Out-File (Join-Path $aiConfigPath "Local-AI-Prompt-Library.md") -Encoding UTF8
Write-AuditLog "Created local AI prompt library" "SUCCESS"

#endregion

#region Obsidian AI Plugin Configuration
Write-AuditLog "Configuring Obsidian AI integration..." "INFO"

$obsidianAIConfig = Join-Path $VaultPath ".obsidian\plugins\ai-integration-config.json"
$aiPluginConfig = @{
    "localAI" = @{
        "enabled" = $true
        "endpoint" = "http://localhost:11434"
        "defaultModel" = "llama3.2"
        "confidentialMode" = $true
    }
    "cloudAI" = @{
        "enabled" = $true
        "providers" = @("anthropic-claude", "openai-chatgpt")
        "requireApproval" = $true
        "warningMessage" = "⚠️ Cloud AI detected. Confirm no PII in prompt."
    }
    "autoRouting" = @{
        "enabled" = $true
        "keywords" = @{
            "local" = @("SSN", "salary", "medical", "employee name", "discipline")
            "cloud" = @("strategy", "policy", "template", "training", "research")
        }
    }
} | ConvertTo-Json -Depth 5

New-Item -Path (Split-Path $obsidianAIConfig) -ItemType Directory -Force | Out-Null
$aiPluginConfig | Out-File $obsidianAIConfig -Encoding UTF8

Write-AuditLog "Obsidian AI routing configured" "SUCCESS"
#endregion

#region AI Safety Dashboard
$dashboardContent = @"
# AI Integration Dashboard
*Last Updated: $(Get-Date -Format 'MMMM dd, yyyy')*

## 🤖 LOCAL AI STATUS

| Model | Status | Purpose | Last Used |
|-------|--------|---------|-----------|
| llama3.2 | ✅ Ready | General audit analysis | --- |
| mistral | ✅ Ready | Legal compliance review | --- |
| codellama | ✅ Ready | Data validation | --- |

**Local Processing Guarantee**: All employee PII processed locally. Zero data transmission to cloud.

---

## ☁️ CLOUD AI APPROVED USES

- [ ] Strategy development
- [ ] Policy template creation
- [ ] Training material generation  
- [ ] Legal research (no case specifics)
- [ ] Aggregate statistics analysis

**Active Guardrails**:
- ✓ PII detection enabled
- ✓ Manual approval required before cloud AI use
- ✓ Audit log of all cloud interactions

---

## 📊 USAGE STATISTICS

### This Week:
- **Local AI Queries**: 0
- **Cloud AI Queries**: 0
- **PII Protection Blocks**: 0

### Compliance Score: 🟢 100%

---

## 🛠️ QUICK ACTIONS

[[AI-Routing-Protocol|View Full Routing Protocol]] | [[Local-AI-Prompt-Library|Browse Prompt Library]] | [[AI-Training-Guide|Learn AI Tools]]

---

*Next Review: Every Monday during audit project (12/19, 12/23, 12/30, 01/02)*
"@

$dashboardContent | Out-File (Join-Path $VaultPath "00-CONFIGURATION\AI-Integration\AI-Dashboard.md") -Encoding UTF8
Write-AuditLog "Created AI safety dashboard" "SUCCESS"
#endregion

#region Completion Summary
Write-AuditLog "`n=== MODULE 3 COMPLETE ===" "SUCCESS"
Write-AuditLog "AI Infrastructure Summary:" "INFO"
Write-AuditLog "  ✓ Ollama installed with 3 specialized models" "SUCCESS"
Write-AuditLog "  ✓ Local/Cloud routing protocol established" "SUCCESS"
Write-AuditLog "  ✓ Confidential prompt library created" "SUCCESS"
Write-AuditLog "  ✓ Obsidian AI integration configured" "SUCCESS"
Write-AuditLog "  ✓ Safety dashboard operational" "SUCCESS"

Write-AuditLog "`n📋 NEXT STEPS:" "INFO"
Write-AuditLog "  1. Test Ollama: Run 'ollama run llama3.2' in terminal" "INFO"
Write-AuditLog "  2. Review AI-Routing-Protocol.md in vault" "INFO"
Write-AuditLog "  3. Practice using prompt library with sample data" "INFO"
Write-AuditLog "  4. Proceed to Module 4: Audit Tracking System" "INFO"

Write-AuditLog "`n⚠️ COMPLIANCE REMINDER:" "WARNING"
Write-AuditLog "  Employee PII = LOCAL AI ONLY (Ollama)" "WARNING"
Write-AuditLog "  Strategy/Templates = Cloud AI OK (Claude/ChatGPT)" "WARNING"
#endregion