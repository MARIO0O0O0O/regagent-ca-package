# AI Routing Protocol for Personnel Audit Project
*Established: December 2025 | Compliance Authority: Ellen, HR Director*

## ðŸ”’ CONFIDENTIALITY CLASSIFICATION SYSTEM

### TIER 1: LOCAL AI ONLY (Ollama) - CONFIDENTIAL PII
**Rule**: Employee PII, medical info, discipline records, salary data **NEVER** leave local machine.

**Use Cases**:
- âœ“ Analyzing individual employee files for completeness
- âœ“ Reviewing medical certifications (FMLA, ADA)
- âœ“ Processing salary/compensation data
- âœ“ Investigating harassment complaints
- âœ“ Evaluating disciplinary action files
- âœ“ Any task involving SSN, health data, or financial info

**Models to Use**:
- **llama3.2**: General employee record analysis
- **mistral**: Legal compliance document review
- **codellama**: Data structure validation

**Example Prompts** (Local Only):
\\\
"Review this employee's FMLA file for required DOL forms WH-380-E and WH-382"
"Analyze disciplinary progression: are there gaps between verbal, written, final warnings?"
"Check if this ADA accommodation file contains interactive process documentation"
\\\

---

### TIER 2: CLOUD AI (Claude/ChatGPT) - STRATEGIC/NON-PII
**Rule**: Strategy, policy templates, training materials, aggregate statistics OK for cloud.

**Use Cases**:
- âœ“ Drafting audit methodology frameworks
- âœ“ Creating training presentations on SB 513 requirements
- âœ“ Generating compliance checklists
- âœ“ Analyzing aggregate workforce statistics (no names)
- âœ“ Research on CA labor law changes
- âœ“ Creating PowerPoint templates

**Example Prompts** (Cloud OK):
\\\
"Draft a 2-hour training outline on California harassment prevention (Gov Code 12950.1)"
"Create Excel formulas to calculate 4-year retention period from hire date"
"Summarize key changes in SB 553 workplace violence prevention requirements"
\\\

---

## ðŸ”„ WORKFLOW DECISION TREE

\\\mermaid
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
\\\

---

## ðŸ“‹ PRE-TASK CHECKLIST

Before using ANY AI tool, ask yourself:

- [ ] Does this task involve employee names?
- [ ] Does this contain Social Security Numbers?
- [ ] Are there medical records or health conditions?
- [ ] Is salary/compensation data included?
- [ ] Would this violate HIPAA, ADA, or FMLA confidentiality?
- [ ] Could this expose the organization to privacy liability?

**If you answered YES to any question** â†’ Use LOCAL AI (Ollama) ONLY.

---

## ðŸ›¡ï¸ SECURITY REMINDERS

1. **Never copy/paste PII into cloud AI tools** (Claude, ChatGPT, Gemini)
2. **Redact names** before using cloud tools for examples
3. **Aggregate data** (e.g., "45% of files missing I-9") is safe for cloud
4. **When in doubt**, use local AI
5. **Legal counsel consultation**: If analyzing potential EEOC/DFEH exposure â†’ local AI + attorney review

---

## ðŸ“ž ESCALATION PROTOCOL

**When to consult legal counsel** (regardless of AI tier):
- Potential discrimination/retaliation patterns detected
- EEOC or DFEH charge anticipated
- Whistleblower complaint implicated
- Class action risk identified
- Workers' comp fraud suspected

**Contact**: [Insert Employment Attorney Contact]

---

*Compliance Note: This protocol aligns with California Labor Code Â§ 1198.5 (personnel record confidentiality), HIPAA 45 CFR Â§ 164.502, and ADA 42 USC Â§ 12112(d)(3)(B).*
