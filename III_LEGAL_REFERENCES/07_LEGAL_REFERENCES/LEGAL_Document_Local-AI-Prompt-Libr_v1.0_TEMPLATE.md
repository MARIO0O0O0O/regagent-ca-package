# Local AI Prompt Library for Personnel Audits
*Confidential - For Internal HR Use Only*

## ðŸ” AUDIT COMPLETENESS CHECKS

### I-9 Verification Prompt
\\\
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

**Output**: Checklist with âœ“ (compliant) or âœ— (deficient) for each item.
\\\

---

### FMLA File Completeness Prompt
\\\
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

**Task**: Identify missing documents and cite 29 CFR Â§ 825.300 requirements.
\\\

---

## ðŸ“Š DATA VALIDATION PROMPTS

### Salary Equity Analysis (CONFIDENTIAL)
\\\
You are conducting a pay equity audit under California Equal Pay Act (Lab. Code Â§ 1197.5).

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
\\\

---

### Retention Period Validation
\\\
You are verifying document retention compliance for a California employer.

**Document Type**: [E.G., PERFORMANCE REVIEWS]
**Current Retention**: [E.G., 2 YEARS]

**Task**:
1. Cite correct retention period under:
   - Federal law (EEOC, FLSA, ADA)
   - California law (Gov. Code Â§ 12946 - SB 807)
2. Identify compliance gap if any
3. Recommend remediation timeline

**Reference**: Use attached research document (Document 2 from context).
\\\

---

## ðŸš¨ INVESTIGATION ANALYSIS PROMPTS

### Harassment Complaint Pattern Analysis
\\\
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
\\\

---

## ðŸ“ DOCUMENT DRAFTING PROMPTS

### Missing Document Remediation Letter
\\\
Draft a letter to [EMPLOYEE NAME] requesting missing personnel file documents.

**Missing Items**:
- [E.G., SIGNED HANDBOOK ACKNOWLEDGMENT]
- [E.G., UPDATED EMERGENCY CONTACT]

**Tone**: Professional, non-punitive
**Deadline**: 10 business days
**Consequence**: Note file incomplete; may affect [specify if applicable]

**Legal Authority**: Cal. Lab. Code Â§ 1198.5 (employer obligation to maintain complete personnel records per SB 513).
\\\

---

*Reminder: These prompts are for LOCAL AI (Ollama) use only. Never paste employee PII into cloud-based AI tools.*
