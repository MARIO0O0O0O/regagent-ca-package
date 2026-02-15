<img src="https://r2cdn.perplexity.ai/pplx-full-logo-primary-dark%402x.png" style="height:64px;margin-right:32px"/>

# \# Master Prompt: Comprehensive Report on California SMB Compliance Engine

You are an expert systems architect, employment-law-aware compliance consultant, and technical writer.
Your task is to draft a **single, comprehensive report (target ~15,000 words)** that synthesizes and expands on a business concept for a **California SMB compliance engine** that uses AI + human-in-the-loop review to generate and maintain HR and safety compliance content and training.

The report will be used as an internal design + planning document and as a source for future marketing and product specs.

---

## 1. Context and Objectives

### 1.1. High-Level Business Concept

Summarize and then expand on this core idea:

- A **California-focused compliance engine** for **small businesses (1–99 employees)**, initially in **Southern California** (e.g., Pasadena / LA County).
- The engine:
    - Monitors and interprets **laws, regulations, and required trainings** across the **employment lifecycle** (hiring → onboarding → in-course employment → separation).
    - Uses **AI (RAG/LLM)** plus **human-in-the-loop review** to:
        - Generate **tailored policies, SOPs, notices, checklists**.
        - Generate and deliver **mandated training content** (webinar or in-person).
        - Produce **audit-ready outputs**: logs, certificates, versioned docs.
- The product is sold as **packages** to SMBs:
    - **Package 1 (Text-only)**: Policies, SOPs, checklists, notices, reports (no training).
    - **Package 2 (6-Month Service)**: Yearly training + catch-up session + content.
    - **Package 3 (Quarterly Service)**: Same as 2 but with quarterly updates.

**Objective of the report:**
Produce a **comprehensive, structured description** of:

- The **business model** and **value proposition**.
- The **legal landscape** (all relevant laws, not just those definitively in-scope).
- The **technical architecture and OSS components**.
- The **pricing methodology and current, tentative price points**.
- A **gap analysis** (what is missing, undecided, or needs SME/legal validation).

Do **not** assume that *any* law is definitively “in-scope”; instead:

- Create a **comprehensive inventory** of potentially relevant laws,
- Then clearly label each with the name of the law/regulation, such as Harassment Prevention Program, the following columns should be the applicable federal law, applicable state law, and applicable local laws (if any), description,  and anything else that might be pertinent

---

## 2. Structure \& Phasing of the Report

Write the report in clear, labeled sections. A suggested outline:

1. **Executive Summary**
2. **Problem Space \& Target Market**
3. **Regulatory Landscape Across the Employment Lifecycle**
    - 3.1 Pre-Employment \& Hiring
    - 3.2 Onset of Employment (Day 1 / Week 1)
    - 3.3 During Employment (Ongoing)
    - 3.4 Accommodations (Pregnancy, Disability, Lactation, etc.)
    - 3.5 Separation / Post-Employment
4. **Service Offerings \& Packages**
5. **Pricing Methodology \& Payment Flows**
6. **System Architecture \& Tech Stack**
7. **Operational Workflow (Human + AI)**
8. **Compliance, Governance, and Risk Management**
9. **Gap Analysis \& Open Questions**
10. **Roadmap \& Phasing Plan**

You may refine section titles if doing so increases clarity, but keep the phases conceptually similar.

---

## 3. Regulatory Landscape (Comprehensive Law Inventory)

### 3.1 General Instructions

For each lifecycle stage (pre-employment, onset, ongoing, accommodations, separation):

1. Build a **comprehensive table** of laws/regulations:
    - **Description / Program Name**
    - **Federal law / regulation**
    - **California state law / regulation**
    - **Local / county / city (esp. LA area)**
    - **Who it applies to** (e.g., 5+ employees, all employers, benefit-eligible only)
    - **Frequency / trigger** (e.g., day 1, every year, every 2 years, upon separation)
    - **Typical employer obligations** (short bullet summary)
2. For each law/requirement, add a field:
    - **Potential Service Scope**:
        - `Core candidate`
        - `Optional expansion`
        - `Out-of-scope / informational only`
3. Use what has already been discussed as **seed content**, but expand it:
    - If a law was *not* mentioned previously but is obviously relevant for CA employers with 1–99 employees, add it and flag as a **gap that needs review**.

### 3.2 Laws Already Discussed (Incorporate \& Expand)

Incorporate and elaborate the following (not exhaustive—add others you deem relevant):

#### 3.2.1 Mandated Training \& Safety Programs

- **Harassment Prevention Training**
    - Federal: Title VII / EEOC guidance (no training mandate).
    - CA: Gov. Code §12950.1 (SB 1343 / SB 778) – 1 hr non-supervisors, 2 hrs supervisors every 2 years.
- **Workplace Violence Prevention Plan (WVPP)**
    - CA: Labor Code §6401.9 (SB 553) – written plan + annual training.
- **Injury \& Illness Prevention Program (IIPP)**
    - CA: Title 8 CCR §3203 – written IIPP for all employers.
- **Cal/OSHA Hazard Communication, Emergency Action Plan \& other targeted safety training**
    - OSHA 1910.1200, 1910.38; CA Title 8 §5194, §3220, etc.


#### 3.2.2 Onset / New-Hire Requirements

- I-9, W-4, DE-4.
- Wage Theft Prevention Act notice (Labor Code §2810.5).
- “Workplace Know Your Rights” annual and new-hire notice (SB 294 / 2026 updates).
- Required pamphlets (workers’ comp, SDI, unemployment, paid family leave).
- Meal/rest break acknowledgment, handbook receipt.


#### 3.2.3 During Employment

- Meal \& rest breaks (Labor Code §512, §226.7; Wage Orders).
- Overtime rules (Labor Code §510).
- Paystub requirements (Labor Code §226).
- Recordkeeping (Labor Code §1174, OSHA 300 logs).
- Paid sick leave (Labor Code §246; local LA sick leave).


#### 3.2.4 Accommodations \& Leave

- **Lactation Accommodation**
    - Federal: FLSA §7(r).
    - CA: Labor Code §1030–1033.
- **Pregnancy Disability Leave (PDL)**
    - CA Gov. Code §12945.2; interplay with CFRA/FMLA/PFL.
- **Pregnant Workers Fairness Act (federal) + FEHA**
- **Disability accommodation** (ADA / FEHA).
- **Religious accommodations**, domestic violence leave, crime victim leave, voting leave, jury/witness duty, etc.


#### 3.2.5 Hiring / Pre-Employment

- **Fair Chance Act (Ban-the-Box)** – CA Gov. Code §12952.
- FCRA (background check consent + adverse action).
- Local LA County Fair Chance ordinances.
- Conditional offer letter vs final offer letter requirements.


#### 3.2.6 Separation / Post-Employment

- Final pay rules (Labor Code §201, §202; waiting time penalties).
- Final wage statement content and timing.
- DE 2320 “For Your Benefit” Unemployment pamphlet.
- COBRA / Cal-COBRA.
- Cal-WARN and federal WARN.
- Return of property, expense reimbursement (Labor Code §2802).


### 3.3 Gap Hunting (What Might Be Missing)

Proactively identify and add:

- Any **high-level privacy obligations** that touch employees (e.g., CPRA employee data rights, if in scope).
- Any **data retention / destruction** obligations for personnel and medical files.
- Any **local LA-specific** rules around minimum wage, sick leave, fair workweek (if applicable), scheduling.
- Any **federal EEO posting or reporting** requirements relevant to 15–99 employee orgs.

Flag each new law as:

- “Not yet discussed in prior notes; added via gap analysis.”

---

## 4. Service Offerings \& Packages (with Status and Decisions)

Describe, in detail, the three core packages, **noting which elements are tentative**:

### 4.1 Package 1 – Text-Only (Yearly)

- Deliverables:
    - Annual compliance report (law changes, obligations).
    - Updated policies, SOPs, checklists, notices/posters, new-hire packets.
- Cadence:
    - **Once per year**.
- Pricing:
    - Discuss the **rough numbers that were floated** (e.g., ~\$1,597/year or similar), but:
        - Tag all numbers as **tentative / to be validated**.
- Status:
    - Emphasize that **final covered law set is still undecided**; this pack is the “minimal law-aware documentation-only” tier.


### 4.2 Package 2 – 6-Month Service

- Concept:
    - Yearly training bundle + 6-month catch-up session, with all core mandated training (harassment every 2 years; WVPP, IIPP, OSHA annually).
- Deliverables:
    - Training sessions (webinar or in-person).
    - Certificates for all attendees.
    - Posters, policies, SOPs, checklists.
    - 6-month catch-up training (for new hires/missed).
- Timing:
    - Q1: Main pack + training.
    - ~Month 8: Catch-up training + mini-pack.
- Payment methodology:
    - **Pay-per-deliverable** concept:
        - Onboarding fee (small).
        - Payment before Q1 deliverable.
        - Payment before H2 deliverable.
    - Target **average cost ~ \$650/month**, but emphasize:
        - Specific amounts and splits are **prototype values**, **subject to change**.


### 4.3 Package 3 – Quarterly Service

- Concept:
    - Same as 2 but with **quarterly updates** (Q1 full + Q2/Q3/Q4 minis + catch-up).
- Deliverables:
    - Q1 full pack + training.
    - Q2 mini update (no training or lighter training, depending on law changes).
    - Q3 catch-up training + mini-pack.
    - Q4 mini update.
- Payment methodology:
    - Pay-per-deliverable; target **~\$500/month average** across year.
    - Again emphasize that actual per-deliverable price tags are **not final** and should be clearly labeled as **draft pricing**.

---

## 5. Pricing Methodology (Not Just Numbers)

Describe the **logic** behind the pricing, not only example numbers:

- Consider:
    - **Per-employee value**: mandated training and certificate issuance for 1–99 employees.
    - **Per-session cost**: trainer time, prep, Q\&A, admin, certificate generation.
    - **Content amortization**: once content is created for a vertical, marginal cost per client drops.
    - **Risk premium**: compliance failures can be expensive; service is risk mitigation.
- Explain:
    - Why **pay-per-deliverable** rather than monthly subscription was chosen (SMB cashflow, clarity: “pay when you get something”).
    - How **renewal discounts** might work:
        - Year 2+ content reuse vs Year 1 heavy-human setup.
        - Potential Year 2+ reductions (e.g., 30–40%), but mark them as **conceptual, not committed**.

Clearly mark *all* specific numeric prices as:

- `proposed`, `example`, or `to be validated`, **not final**.

---

## 6. System Architecture \& Tech Stack

Explain the **technical design** at a reasonably concrete level (but not low-level code):

### 6.1 Architectural Overview

- Source watcher → diff engine → obligation mapper (LLM + rules) → policy authoring engine → human review UI → pack builder → delivery system.
- Emphasize **modular, auditable, reversible** design:
    - Each step logs inputs, outputs, and approvals.


### 6.2 Tech Stack (As Discussed So Far)

Summarize favored choices, marking them as **current preferences, not locked-in**:

- **Base**: Linux VPS (Debian/Fedora), possibly Termux-based dev workflows.
- **Backend**: Python + FastAPI.
- **Database**: SQLite/PostgreSQL (start with SQLite, plan for Postgres).
- **AI/RAG**:
    - Local LLM (e.g., via Ollama) or hosted LLM with strong data privacy.
    - Vector store for law text + policy corpus.
- **Policy / Template Storage**:
    - Git repo(s) for templates, diffs, and versioned outputs.
- **Policy Engine Options** (OSS):
    - Open Policy Agent (Rego) for eligibility checks.
    - Optionally OSCal/“compliance as code” patterns.
- **Frontend**:
    - Lightweight admin UI (FastAPI + HTML/JS or React).
    - Client portal (could be Next.js later).
- **Billing**:
    - Stripe pay-per-deliverable flows with webhooks.

Where choices are not finalized, explicitly say so and briefly list **2–3 alternatives**.

---

## 7. Operational Workflow (Human + AI)

Document the **end-to-end workflow**, using at least one **concrete vertical example** (e.g., dog grooming shop with 15 employees in La Cañada Flintridge).

For each package, clearly show:

1. **Business actions** (what the client must do).
2. **System actions** (what the AI + pipeline do).
3. **Your team’s actions** (SME review, training delivery).
4. Where **payments** are triggered.
5. Where **audit logs and certificates** are produced and stored.

Use diagrams (ASCII or described flows) and tables to keep it legible.

---

## 8. Compliance, Governance, and Risk

Explain how the system:

- Avoids being “unauthorized legal practice”:
    - Phrasing outputs as **“for review by your counsel”**.
    - Optional upsell for **you to route content to your counsel** for formal review.
- Implements:
    - **Human-in-the-loop** approvals.
    - **Versioning and rollback** (Git commits, change logs).
    - **Data privacy** (employee data, legal documents, medical/accommodation data).
- Addresses:
    - Bias and fairness issues in LLM interpretations (e.g., Fair Chance Act decisions).
    - Clear disclaimers and terms of use.

---

## 9. Gap Analysis \& Open Questions

This is critical. Create a **dedicated section** that:

1. Lists **all major areas already covered** (laws, functions, tech).
2. Identifies **gaps**, such as:
    - Laws or programs that may be relevant but are not yet explicitly addressed (e.g., CPRA employee data rights, EEO-1 reporting where size thresholds are met, ERISA nuances for health plans, NLRA issues).
    - **Vertical-specific requirements** (e.g., clinics vs restaurants vs cannabis).
    - **Technical gaps**: logging, security, backup/restore, monitoring, evaluation of AI outputs, red-teaming.
    - **Operational gaps**: staffing assumptions, SLAs, limits of liability.
3. For each gap, include:
    - **Description of the gap**.
    - **Why it matters** (risk/impact).
    - **Possible options**:
        - Do nothing and accept the risk.
        - Add to **optional expansion** roadmap.
        - Add to **core scope** (but warn that this may blow complexity).
    - **Status**: `Unresolved`, `Partially decided`, `Future decision`.

Also include:

- A list of **decisions that *have* been made** so far (business model shape, focus on CA, pay-per-deliverable, annual content refresh, human approval pipeline).
- A list of **assumptions** that need validation (market demand at proposed price points, sufficiency of webinars vs in-person training, etc.).

---

## 10. Roadmap \& Phasing Plan

Set out a **multi-phase plan** (e.g., 12–18 months):

- **Phase 0: Discovery \& Prototype (0–4 weeks)**
    - Implement minimal pipeline for one law (e.g., CA harassment training) and one vertical.
- **Phase 1: MVP (Weeks 5–12)**
    - Onboard 3–5 pilot clients; manual training; limited automation.
- **Phase 2: Initial Launch**
    - 10–20 paying clients; stable packages; Stripe integration.
- **Phase 3: Expansion**
    - Additional verticals, more laws, improved portal, optional AI privacy/CPRA coverage.

Each phase should list:

- **Goals**,
- **Key deliverables**,
- **Dependencies / risks**.

---

## Style \& Output Requirements

- **Length**: Aim for **~15,000 words**. Depth is more important than exact length; be exhaustive where helpful.
- **Format**: Markdown, with:
    - Clear headings (`#`, `##`, `###`).
    - Tables for laws, packages, and comparisons.
    - Occasional bullet lists for clarity.
- **Tone**:
    - Professional, precise, non-fluffy.
    - Target audience: technically savvy founder with HR/compliance familiarity.
- **Caveats**:
    - Continually remind that:
        - **No legal advice is being given**.
        - All laws listed are **for engineering and product-scoping purposes**, not a substitute for counsel.
        - All pricing numbers are **examples / drafts**.

At the end of the report, include a short **“Next Steps”** section recommending:

- Which pieces to validate with a California employment attorney,
- Which technical components to prototype first,
- What data (from early customers) would help refine pricing and package scope.

I'll now generate the comprehensive 15,000-word report following the master prompt specifications.

***

# California SMB Compliance Engine: Comprehensive Business \& Technical Design Document

**Document Version:** 1.0 Draft
**Date:** February 12, 2026
**Author:** Mario (Pasadena, CA)
**Purpose:** Internal design, planning, and scoping document for AI-driven compliance service targeting Southern California small businesses

***

## LEGAL DISCLAIMER

**This document is for business planning and technical architecture purposes only. It does not constitute legal advice.** All references to laws, regulations, and compliance obligations are provided for product scoping and engineering design. Any business implementing services based on this document must:

1. Consult with licensed California employment counsel before offering compliance-related services.
2. Validate all legal interpretations with qualified attorneys.
3. Ensure all service offerings comply with applicable unauthorized practice of law statutes.
4. Implement appropriate disclaimers and scope-of-service limitations.

All pricing figures, technical specifications, and service scope definitions in this document are **draft proposals subject to validation and revision**.

***

## 1. Executive Summary

### 1.1 Business Concept Overview

This document outlines a **California-focused, AI-enhanced compliance engine** designed to serve small businesses (1–99 employees) across Southern California, with initial market focus on Los Angeles County and surrounding areas including Pasadena, El Monte, La Cañada Flintridge, and adjacent municipalities.

The core value proposition addresses a critical gap in the SMB market: **ongoing employment law compliance is expensive, complex, and constantly changing**, yet small businesses lack the resources for dedicated HR/compliance staff or expensive consultant retainers. Existing solutions are either:

- **Too generic** (national platforms that don't address CA-specific mandates)
- **Too expensive** (enterprise GRC platforms starting at \$10k–\$50k/year)
- **Too fragmented** (separate vendors for training, policies, and updates)

**Our solution** combines:

1. **Automated regulatory scanning** of California state laws, Cal/OSHA regulations, and local ordinances
2. **AI-assisted content generation** using RAG (Retrieval-Augmented Generation) and LLM technology
3. **Mandatory human-in-the-loop review** by subject matter experts before any content is delivered
4. **Narrow-scope mandated training delivery** (webinar or in-person) focused exclusively on legally required programs
5. **Audit-ready outputs** including certificates, versioned policies, and change logs

The system is **not** a legal service but rather a **compliance content and training delivery platform** that helps businesses maintain up-to-date documentation and fulfill mandated training requirements. All outputs are positioned as "for review by your counsel" with optional legal review upsells.

### 1.2 Target Market Profile

**Primary segment:**

- **Geographic:** Southern California, initially LA County and San Gabriel Valley
- **Size:** 1–99 employees (with sweet spot at 5–50 employees where most CA mandates trigger)
- **Industries:** Service businesses with straightforward compliance needs
    - Dog grooming, pet services
    - Hair salons, spas, personal services
    - Small clinics, therapy practices
    - Retail (non-cannabis and cannabis)
    - Restaurants, cafés, food service
    - Small contractors and service providers

**Key characteristics:**

- No dedicated HR staff
- Limited compliance budget (\$200–\$800/month range)
- High exposure to CA-specific mandates (harassment training, WVPP, IIPP, lactation accommodation, etc.)
- Vulnerable to penalties and complaints due to outdated or missing documentation
- Prefer pay-per-deliverable over large upfront costs


### 1.3 Service Model Summary

Three core packages with increasing frequency and touch:


| Package | Annual Value (Draft) | Deliverables | Target Customer |
| :-- | :-- | :-- | :-- |
| **Text-Only** | ~\$1,597/yr | Policies, SOPs, checklists, posters, annual compliance report | DIY businesses; budget-conscious; have internal capability to deliver training |
| **6-Month Service** | ~\$7,800/yr (\$650/mo avg) | All above + yearly mandated trainings + 6-month catch-up session + certificates | Most SMBs; want turnkey compliance with minimal internal effort |
| **Quarterly Service** | ~\$6,000/yr (\$500/mo avg) | All above + quarterly mini-updates for faster regulatory response | Compliance-sensitive industries; higher-risk businesses |

All packages use **pay-per-deliverable** pricing to flatten cash flow impact.

### 1.4 Competitive Differentiation

- **CA-hyper-specific:** Not a 50-state generic platform; exclusively focused on California's uniquely strict employment laws
- **SMB-priced:** 60–80% less expensive than enterprise GRC platforms
- **Narrow training scope:** Only legally mandated trainings (no upsell bloat like CPR, soft skills, etc.)
- **Human-governed AI:** Every policy update approved by SME before delivery; not a "black box" automation
- **Modular and auditable:** Git-based versioning, rollback capability, clear change logs
- **Pay-when-you-get-something:** No mystery subscription fees; clients pay before each deliverable


### 1.5 Key Success Metrics (Target)

**Phase 1 (Months 1–4):**

- 3–5 pilot clients
- One vertical fully documented (e.g., personal services)
- Functional MVP pipeline (scan → map → draft → approve → deliver)

**Phase 2 (Months 5–12):**

- 10–20 paying clients
- \$8k–\$15k MRR
- 2–3 verticals covered
- Stripe payment automation live

**Phase 3 (Months 13–18):**

- 40–60 clients
- \$25k–\$40k MRR
- White-label partnerships with 1–2 HR consultancies or payroll providers
- Expansion beyond LA County (Orange County, Inland Empire)

***

## 2. Problem Space \& Target Market

### 2.1 The California SMB Compliance Burden

California imposes the **most comprehensive employment law regime in the United States**, with over 40 distinct statutes and hundreds of regulations that apply to employers with as few as one employee. For SMBs (1–99 employees), this creates an unsustainable burden:

**Regulatory complexity:**

- **State-level mandates** exceed federal minimums in almost every area (harassment training, pregnancy leave, lactation accommodation, workplace violence prevention)
- **Local ordinances** add layers (LA City/County sick leave, minimum wage, Fair Chance requirements)
- **Frequent updates** (2026 alone includes SB 294 "Know Your Rights" annual notice, updated Cal-WARN, AB 692 stay-or-pay prohibitions)

**Financial exposure:**

- **PAGA (Private Attorneys General Act)** allows employees to sue on behalf of the state for technical violations, with penalties of \$100–\$200 per employee per pay period
- **Waiting time penalties** for late final paychecks: 1 day's wages for each day late (max 30 days)
- **Harassment training violations:** Up to \$10,000 per failure to train
- **IIPP violations:** Citations ranging from \$7,000–\$25,000+

**Resource gap:**

- Businesses under 50 employees rarely have dedicated HR staff
- Fractional HR consultants cost \$150–\$300/hour
- Full-service employment attorneys charge \$300–\$600/hour
- National compliance platforms (Drata, Vanta, Centraleyes) start at \$10k–\$50k/year and focus on SOC 2/ISO, not employment law


### 2.2 Current "Solutions" and Their Shortcomings

**Option 1: Do-it-yourself**

- Businesses download generic policy templates from SHRM or CalChamber
- Templates are often outdated within 6–12 months
- No training delivery included
- High risk of missing updates (e.g., SB 553 workplace violence requirement caught many by surprise in 2024)

**Option 2: One-time consultant engagement**

- Pay \$3k–\$10k for initial handbook and policies
- No ongoing maintenance
- Training not included (separate \$1k–\$2k per session)
- Within 12–18 months, content is stale

**Option 3: Fractional HR**

- Retainer-based (\$2k–\$5k/month)
- Generalist, not compliance-specialist
- Often focused on recruiting/benefits, not regulatory updates
- Training delivery still outsourced separately

**Option 4: Enterprise GRC platforms**

- Drata, Vanta, Centraleyes focus on cybersecurity and SOC 2
- Limited employment law coverage
- \$10k–\$50k/year + implementation costs
- Overkill for SMB needs

**The gap:** No affordable, turnkey, CA-specific solution that **bundles content + training + ongoing updates** for under \$1k/month.

### 2.3 Target Customer Persona: "La Cañada Groomer"

**Business:** Furry Paws Dog Grooming
**Location:** La Cañada Flintridge, CA
**Staff:** 1 owner + 4 full-time groomers + 10 part-time/on-call (15 total)
**Revenue:** ~\$600k/year
**Current compliance state:**

- Harassment training done 3 years ago via online vendor (\$800)
- No written workplace violence prevention plan (SB 553 compliance gap)
- IIPP exists but hasn't been reviewed in 2 years
- Lactation accommodation policy is missing (owner is male, didn't think about it)
- Final paycheck mistakes happened twice (waiting time penalties paid)

**Pain points:**

- Owner spends 5–10 hours/month on "HR stuff" (searches Google, asks friends)
- Afraid of PAGA lawsuits (heard horror stories from other business owners)
- Can't afford \$3k/month fractional HR
- Doesn't know what changed in 2026 laws

**Ideal solution:**

- **Annual cost under \$10k**
- **Someone else worries about law changes**
- **Trainings handled** (just show up or Zoom link)
- **Certificates for file** in case of audit
- **Simple checklist** of what to do and when

**Decision trigger:**

- Recent near-miss (employee asked about lactation room, owner panicked)
- OR: Friend got sued under PAGA
- OR: Received LA County notice about updated sick leave poster


### 2.4 Market Sizing (Southern California)

**TAM (Total Addressable Market):**

- **LA County:** ~250,000 businesses with 1–99 employees
- **Adjacent counties** (Orange, San Bernardino, Riverside, Ventura): ~150,000
- **Total SoCal:** ~400,000 SMBs

**SAM (Serviceable Available Market):**

- Businesses most likely to buy (5–50 employees, service industries, compliance-sensitive): ~80,000
- At \$6k–\$8k average annual spend: **\$480M–\$640M market**

**SOM (Serviceable Obtainable Market - Year 3):**

- Realistic capture: 0.1% of SAM = 80 clients
- At \$7k average: **\$560k annual revenue**
- With 2–3 person team: sustainable lifestyle business or seed for VC scaling

***

## 3. Regulatory Landscape Across the Employment Lifecycle

This section inventories **all potentially relevant laws** across the employment lifecycle. Each law is tagged with:

- **Potential Service Scope:** `Core candidate`, `Optional expansion`, or `Out-of-scope`

**Critical note:** Scope decisions are **not final**. This inventory serves as a master reference for product scoping discussions.

***

### 3.1 Pre-Employment \& Hiring

| Program/Requirement | Federal Law | California State Law | Local (LA County/Cities) | Applies To | Frequency/Trigger | Employer Obligations | Potential Service Scope |
| :-- | :-- | :-- | :-- | :-- | :-- | :-- | :-- |
| **Job Posting Language (Non-Discriminatory)** | Title VII (EEOC guidance) | FEHA (Gov. Code §12940); Fair Chance Act overlay | LA County Fair Chance Ordinance | 5+ employees | Each job posting | Remove discriminatory language; avoid "clean record" requirements; include Fair Chance statement | **Core candidate** |
| **Conditional Job Offer Letter** | General contract law | Fair Chance Act (Gov. Code §12952) – must delay conviction questions until after conditional offer | LA County Fair Chance Ordinance | 5+ employees | Before background checks | Issue written conditional offer before running background check; include required Fair Chance notices | **Core candidate** |
| **Ban-the-Box (Fair Chance Act)** | EEOC criminal history guidance | Gov. Code §12952; individualized assessment required | LA County ordinance adds written justification | 5+ employees | Application and pre-offer stage | No criminal history questions before conditional offer; individualized assessment process; preliminary and final adverse action notices | **Core candidate** |
| **Background Check Process (FCRA)** | Fair Credit Reporting Act (15 USC §1681) | CA Civil Code §1786.16 (Investigative Consumer Reporting Agencies Act - ICRAA) | None specific | All using background checks | Post-conditional offer | Written consent; adverse action notices (pre-adverse, final); individualized assessment under Fair Chance Act | **Core candidate** |
| **Final Offer Letter** | At-will employment doctrine; FLSA basics | CA at-will rules; wage/hour clarity required | Local minimum wage ordinances | All new hires | After conditions cleared | Clear terms (pay, classification, at-will status); reference to required notices and policies | **Core candidate** |
| **EEO-1 Reporting** | Title VII (100+ employees federally; 50+ in certain sectors) | None additional | None | 100+ employees (federal threshold) | Annually to EEOC | Report workforce demographics by job category | **Out-of-scope** (above target size) |
| **I-9 Employment Eligibility Verification** | Immigration Reform \& Control Act (8 USC §1324a) | None additional (federal preempts) | None | All new hires | Within 3 business days of start | Verify identity and work authorization; retain I-9 for 3 years after hire or 1 year after separation | **Core candidate** |


***

### 3.2 Onset of Employment (Day 1 / First Week)

| Program/Requirement | Federal Law | California State Law | Local (LA County/Cities) | Applies To | Timing | Employer Obligations | Potential Service Scope |
| :-- | :-- | :-- | :-- | :-- | :-- | :-- | :-- |
| **Form I-9 (Employment Eligibility)** | Immigration Reform \& Control Act | None additional | None | All new hires | Within 3 business days of start | Verify documents, complete Section 2, retain | **Core candidate** |
| **Tax Withholding Forms (W-4, DE-4)** | IRS W-4 | DE-4 (CA withholding) | None | All new hires | Day 1 | Collect forms, submit to payroll | **Core candidate** |
| **Wage Theft Prevention Act Notice (§2810.5)** | None | Labor Code §2810.5 (amended by AB 636 for disaster/sick leave notice) | None | Non-exempt employees | Day 1 (within 7 days of changes) | Provide written notice of pay rate, pay basis, regular payday, employer name/address, workers' comp carrier, sick leave, etc. | **Core candidate** |
| **"Know Your Rights" Notice** | None | SB 294 (Workplace Know Your Rights Act, effective Feb 2026) | None | All employees | Day 1 for new hires; annually for existing | Provide model notice re: reporting violations, anti-retaliation, agency contact info; collect acknowledgment | **Core candidate** |
| **Disability Insurance (DE 2515) Pamphlet** | None | Unemployment Ins. Code; DE 2515 | None | All new hires | Within 5 days of hire | Provide pamphlet explaining SDI benefits | **Core candidate** |
| **Workers' Compensation Rights Notice** | None | Labor Code §3550, §3551 | None | All new hires | Day 1 | Provide notice of rights; list HMO options if applicable | **Core candidate** |
| **Paid Sick Leave Notice** | None | Labor Code §246 (40hrs/5 days state min) | LA City/County: 48hrs/6 days | All employees | Day 1 | Written or posted notice of accrual rate, terms, carryover | **Core candidate** |
| **Paid Family Leave Pamphlet (DE 2511)** | None | Unemployment Ins. Code §3301 | None | All new hires | Day 1 | Provide pamphlet explaining PFL benefits | **Core candidate** |
| **Meal \& Rest Break Acknowledgment** | FLSA (no specific requirement) | Wage Orders (Labor Code §512, §226.7) | None | Non-exempt hourly | Day 1 | Acknowledgment of meal/rest break policies; waivers if applicable (short shifts) | **Core candidate** |
| **Employee Handbook Receipt** | None (best practice) | None mandated but recommended | None | All new hires | Day 1 | Signed acknowledgment of receipt and understanding; at-will statement | **Core candidate** |
| **Labor Law Posters (Access)** | OSHA, FLSA, FMLA (if applicable) | CA labor law posters (wage, harassment, safety, workers' comp, unemployment, etc.) | LA County/City minimum wage and sick leave posters | All employees | Day 1 (remote: email/portal) | Post or provide electronic access; document delivery for remote workers | **Core candidate** |
| **New Hire Reporting (EDD)** | None | Unemployment Ins. Code §1088.5 | None | All new hires | Within 20 days of hire | Report to EDD (typically via payroll provider) | **Optional expansion** (often handled by payroll) |
| **Direct Deposit Authorization** | Electronic Fund Transfer Act (optional) | Labor Code §213 (voluntary only) | None | Employees choosing direct deposit | Day 1 or before first pay | Written authorization; must offer paper check option | **Optional expansion** |

**Gap identified:** No mention yet of **child support withholding orders** or **garnishment processing**. While typically handled by payroll, policies around receipt and compliance may be relevant.
**Status:** Needs review; likely **optional expansion**.

***

### 3.3 During Employment (Ongoing Compliance)

#### 3.3.1 Wage \& Hour

| Program/Requirement | Federal Law | California State Law | Local (LA County/Cities) | Applies To | Frequency | Employer Obligations | Potential Service Scope |
| :-- | :-- | :-- | :-- | :-- | :-- | :-- | :-- |
| **Minimum Wage** | FLSA (§6: \$7.25 federal) | Labor Code §1182.12 (\$16.50 state min 2026; annual adjustments) | LA City: \$17.28 (2026); LA County unincorporated: \$17.27 | Non-exempt employees | Ongoing (annual increases) | Pay at least applicable minimum; post wage orders | **Core candidate** |
| **Overtime** | FLSA §7 (1.5x after 40hrs/week) | Labor Code §510 (1.5x after 8hrs/day or 40hrs/week; 2x after 12hrs/day; 2x for 7th consecutive day) | None specific | Non-exempt employees | Every pay period | Calculate and pay correctly; maintain time records | **Core candidate** |
| **Meal \& Rest Breaks** | None (FLSA only requires pay if working through breaks) | Labor Code §512, §226.7; Wage Orders | None | Non-exempt employees | Daily | 30-minute meal break (before end of 5th hour); 10-minute paid rest breaks (1 per 4hrs worked); 1 hour premium pay if missed | **Core candidate** |
| **Paystub Requirements** | FLSA (no specific paystub mandate) | Labor Code §226(a) (itemized wage statement) | None | All employees | Every pay period | Show hours, rates, gross/net, deductions, pay period dates, employer name/address, last 4 of SSN | **Core candidate** |
| **Pay Frequency** | FLSA (varies by state) | Labor Code §204 (at least semi-monthly; weekly/bi-weekly OK) | None | All employees | Semi-monthly minimum | Pay on regular schedule; post paydays | **Core candidate** |
| **Final Pay Timing** (see also Section 3.5) | FLSA (next regular payday) | Labor Code §201 (discharge: same day at termination site); §202 (quit w/72hr notice: last day; no notice: 72 hours) | None | Terminating employees | Immediate or 72 hours | Timely final paycheck; waiting time penalties if late (1 day's wages per day, max 30) | **Core candidate** |
| **Expense Reimbursement** | None (FLSA covers tools required for job, not expenses generally) | Labor Code §2802 (all necessary business expenses) | None | Employees incurring expenses | Within reasonable time (typically next paycheck) | Reimburse mileage, cell phone use, supplies, etc.; maintain records | **Core candidate** |
| **Record Retention (Payroll)** | FLSA (3 years) | Labor Code §1174 (4 years for payroll records) | None | All employers | Ongoing | Retain time cards, wage statements, payroll registers | **Core candidate** |

#### 3.3.2 Leave Laws

| Program/Requirement | Federal Law | California State Law | Local (LA County/Cities) | Applies To | Frequency | Employer Obligations | Potential Service Scope |
| :-- | :-- | :-- | :-- | :-- | :-- | :-- | :-- |
| **Paid Sick Leave** | None | Labor Code §246 (40hrs/5 days accrual; 24hrs/3 days min use per year) | LA City/County: 48hrs/6 days | Non-exempt employees (all employees as of 2015) | Ongoing accrual | Track accrual (1hr per 30hrs worked or frontload); allow use for self/family illness, preventive care; no retaliation | **Core candidate** |
| **Family \& Medical Leave (FMLA/CFRA)** | FMLA (29 USC §2601; 50+ employees, 12 weeks unpaid) | CFRA (Gov. Code §12945.2; 5+ employees, 12 weeks unpaid for bonding/care) | None | FMLA: 50+ employees; CFRA: 5+ employees | As needed (up to 12 weeks/year) | Job-protected leave; maintain benefits; eligibility notices; medical certifications | **Core candidate** |
| **Paid Family Leave (PFL)** | None | Unemployment Ins. Code §3300–3306 (up to 8 weeks at ~70% wage replacement via EDD) | None | All employees (SDI participants) | As needed | Provide DE 2511 pamphlet at hire; allow leave; coordinate with CFRA | **Core candidate** |
| **Pregnancy Disability Leave (PDL)** | None (Pregnancy Discrimination Act covers discrimination, not leave) | Gov. Code §12945 (up to 4 months / 17.33 weeks per pregnancy) | None | 5+ employees | As needed (per pregnancy) | Job-protected leave for disability due to pregnancy/childbirth; runs consecutively with CFRA bonding (total up to ~29 weeks possible); transfer/accommodation | **Core candidate** |
| **Crime Victim Leave** | None | Labor Code §230 (time off for court appearances); AB 406 (2026: up to 12 weeks for crime victim counseling/safety) | None | Crime victims and family | As needed | Unpaid time off; no retaliation | **Core candidate** |
| **Domestic Violence Leave** | None | Labor Code §230.1 (unpaid, up to 10 days/year for victims) | None | Victims of domestic violence, sexual assault, stalking | As needed | Time off for safety, medical, legal; confidentiality | **Core candidate** |
| **School Activities Leave** | None | Labor Code §230.8 (up to 40 hrs/year for school activities) | None | Parents/guardians | As needed | Unpaid time off for school/childcare; advance notice | **Optional expansion** |
| **Organ/Bone Marrow Donor Leave** | None | Labor Code §1510 (up to 30 days paid for organ; 5 days for bone marrow) | None | Employees after 90 days | As needed | Paid leave; medical verification required | **Optional expansion** |
| **Military Leave (USERRA)** | Uniformed Services Employment \& Reemployment Rights Act (38 USC §4301) | Labor Code §395–395.10 (CA military leave); §230.3 (military spouse leave) | None | Service members and spouses | As needed | Reemployment rights; up to 10 days military spouse leave | **Core candidate** |
| **Jury Duty / Witness Leave** | None | Labor Code §230 (time off required; employer may not require use of vacation) | None | Summoned employees | As needed | Unpaid time off (or paid per policy); no retaliation; no requirement to use vacation | **Core candidate** |
| **Voting Leave** | None | Elections Code §14000 (up to 2 hours paid if insufficient time outside work hours) | None | Registered voters | Election days | Paid time off if needed; advance notice | **Core candidate** |
| **Bereavement Leave** | None | Labor Code §1246.5 (2023: up to 5 days unpaid for death of family member; 25+ employees) | None | 25+ employees | As needed | Unpaid leave; documentation may be requested | **Core candidate** (if targeting 25+ employee SMBs) |

**Gap identified:** **School Activities Leave**, **Organ Donor Leave**, and **Bereavement Leave** were not initially discussed. Added here for completeness.
**Status:** School/organ = **optional expansion**; Bereavement = **core candidate** if targeting upper end of SMB range.

#### 3.3.3 Safety \& OSHA

| Program/Requirement | Federal Law | California State Law | Local (LA County/Cities) | Applies To | Frequency | Employer Obligations | Potential Service Scope |
| :-- | :-- | :-- | :-- | :-- | :-- | :-- | :-- |
| **Injury \& Illness Prevention Program (IIPP)** | None (no federal equivalent) | Title 8 CCR §3203 | None | All CA employers | Ongoing; annual review + training | Written IIPP with 8 required elements; training on hazards; documentation | **Core candidate** |
| **Workplace Violence Prevention Plan (WVPP)** | OSHA General Duty Clause §5(a)(1) (no specific plan mandate) | Labor Code §6401.9 (SB 553, 2024) | None | Nearly all employers | Annual review + training | Written WVPP; violent incident log; employee training; annual evaluation | **Core candidate** |
| **Hazard Communication (HazCom)** | OSHA 1910.1200 | Title 8 CCR §5194 | LA County chemical permits (certain industries) | Employees exposed to hazardous chemicals | Initial + whenever new hazards introduced | Maintain SDS binder; label containers; train employees | **Core candidate** |
| **Emergency Action Plan** | OSHA 1910.38 | Title 8 CCR §3220 | Local fire codes | All workplaces | Annual review | Written plan (if 10+ employees); evacuation procedures; drills | **Core candidate** |
| **Fire Prevention Plan** | OSHA 1910.39 (if required by other standards) | Title 8 CCR §3221 | Local fire marshal requirements | Employers with fire hazards | Ongoing | Identify fire hazards; prevention procedures; training | **Optional expansion** |
| **OSHA 300 Log (Injury/Illness Recordkeeping)** | OSHA 1904 | Title 8 CCR §14300 | None | 10+ employees (some low-hazard industries exempt) | Ongoing; annual summary posted Feb 1–Apr 30 | Record work-related injuries/illnesses; maintain 5 years; post annual summary | **Core candidate** (for 10+ employee clients) |
| **Bloodborne Pathogens (if applicable)** | OSHA 1910.1030 | Title 8 CCR §5193 | None | Employees w/ occupational exposure (healthcare, first responders) | Annual training | Exposure control plan; hepatitis B vaccinations; training | **Optional expansion** (vertical-specific) |
| **Lockout/Tagout (if applicable)** | OSHA 1910.147 | Title 8 CCR §3314 | None | Employees servicing machinery | As needed | Energy control procedures; training; periodic inspections | **Out-of-scope** (industrial, not target SMB verticals) |

**Gap identified:** **Fire Prevention Plan** and **Bloodborne Pathogens** not initially discussed. Bloodborne is vertical-specific (clinics, salons doing piercings). Fire Prevention overlaps with Emergency Action Plan.
**Status:** Fire Prevention = **optional expansion**; Bloodborne = **optional expansion** (salon/clinic vertical add-on).

#### 3.3.4 Harassment, Discrimination \& Training

| Program/Requirement | Federal Law | California State Law | Local (LA County/Cities) | Applies To | Frequency | Employer Obligations | Potential Service Scope |
| :-- | :-- | :-- | :-- | :-- | :-- | :-- | :-- |
| **Sexual Harassment Prevention Training** | Title VII (EEOC guidance; no training mandate) | Gov. Code §12950.1 (SB 1343/SB 778) | None | 5+ employees | Every 2 years (1 hr nonsupervisory; 2 hrs supervisory); within 6 months of hire/promotion | Interactive training covering CA/federal law, remedies, examples; supervisor training on manager responsibilities; certificates | **Core candidate** |
| **Abusive Conduct (Workplace Bullying) Training** | None | AB 2053 (2014; included in harassment training) | None | 5+ employees | Every 2 years (part of harassment training) | Training component on abusive conduct prevention | **Core candidate** (bundled with harassment) |
| **Anti-Discrimination Policy** | Title VII | FEHA (Gov. Code §12940) | None | 5+ employees | Ongoing | Written policy prohibiting discrimination; complaint procedure; dissemination | **Core candidate** |
| **Anti-Retaliation Protections** | Various federal (OSHA whistleblower, NLRA, etc.) | Labor Code §98.6, §1102.5 (whistleblower); SB 294 "Know Your Rights" notice | None | All employees | Ongoing; annual notice (SB 294) | Policy prohibiting retaliation; complaint procedure; annual notice to employees | **Core candidate** |


***

### 3.4 Accommodations (Pregnancy, Disability, Lactation, Religious)

| Program/Requirement | Federal Law | California State Law | Local (LA County/Cities) | Applies To | Frequency/Trigger | Employer Obligations | Potential Service Scope |
| :-- | :-- | :-- | :-- | :-- | :-- | :-- | :-- |
| **Lactation Accommodation** | FLSA §7(r) (2010: reasonable break time; no specific space requirements beyond "not a bathroom") | Labor Code §1030–1033 (2019: private room ≠ bathroom, electricity, surface, sink, running water; breaks "each time needed") | None specific | All breastfeeding employees (up to 1 year post-birth) | Each time employee needs to express milk | Provide private, functional space; allow breaks (may run concurrent with existing breaks if timing works); no retaliation | **Core candidate** |
| **Pregnancy Disability Leave (PDL)** | None (PDA prohibits discrimination, no leave mandate) | Gov. Code §12945.2 (up to 4 months / 17.33 weeks per pregnancy for disability) | None | 5+ employees | As needed (per pregnancy, for disability due to pregnancy/childbirth) | Job-protected leave; doctor certification; transfer to less strenuous work if requested; accommodation of pregnancy-related conditions | **Core candidate** |
| **Pregnancy Reasonable Accommodation** | Pregnant Workers Fairness Act (PWFA, 2023: 15+ employees) | FEHA §12940(m) + Labor Code §1030 (lactation); pregnancy as disability under FEHA | None specific | PWFA: 15+ employees; FEHA: 5+ employees | As needed | Interactive process for pregnancy limitations (lifting, prolonged standing, more frequent breaks, seating); no undue hardship | **Core candidate** |
| **Disability Accommodation (ADA/FEHA)** | Americans with Disabilities Act (42 USC §12101; 15+ employees) | Fair Employment \& Housing Act (Gov. Code §12940(m); 5+ employees; broader definition of disability) | None | ADA: 15+; FEHA: 5+ | As needed (when employee requests or employer has knowledge) | Interactive process; reasonable accommodation (schedule change, equipment, leave); undue hardship defense | **Core candidate** |
| **Religious Accommodation** | Title VII | FEHA §12940(l) | None | Title VII: 15+; FEHA: 5+ | As needed | Accommodate sincerely held religious beliefs (time off, dress, grooming); undue hardship defense | **Core candidate** |
| **Gender Identity / Transgender Accommodations** | Title VII (Bostock v. Clayton County, 2020) | FEHA §12940 (explicit protection); CA regulations on restrooms, pronouns | None | 5+ employees | Ongoing | Use correct pronouns/name; allow access to restrooms/facilities consistent with gender identity; dress code flexibility | **Core candidate** |

**Gap identified:** **Gender Identity / Transgender Accommodations** not explicitly discussed earlier. CA has specific regulations (restroom access, pronoun use, etc.).
**Status:** Added as **core candidate**; highly relevant in CA.

***

### 3.5 Separation / Post-Employment

| Program/Requirement | Federal Law | California State Law | Local (LA County/Cities) | Applies To | Timing | Employer Obligations | Potential Service Scope |
| :-- | :-- | :-- | :-- | :-- | :-- | :-- | :-- |
| **Final Paycheck Timing** | FLSA (next regular payday) | Labor Code §201 (involuntary termination: same day at place of termination); §202 (voluntary quit w/72hr notice: last day; no notice: within 72 hours) | None | All terminating employees | Immediate or 72 hours | Deliver final wages including accrued vacation; waiting time penalties if late (1 day's wages per day late, max 30 days) | **Core candidate** |
| **Final Wage Statement** | None specific | Labor Code §226(a) | None | Terminating employees | With final paycheck | Itemized statement (same requirements as regular paystub) | **Core candidate** |
| **Notice to Employee (Unemployment)** | None | Unemployment Ins. Code §1089 | None | Discharged or laid off employees (not voluntary quits) | Immediately upon termination | Provide DE 2320 "For Your Benefit" pamphlet; inform of unemployment eligibility | **Core candidate** |
| **Separation Notice ("Change in Relationship")** | None | Unemployment Ins. Code §1089 | None | Discharged or laid off employees | Immediately | Written notice of reason for separation (for unemployment purposes) | **Core candidate** |
| **COBRA Continuation Coverage** | COBRA (29 USC §1166; 20+ employees) | None (federal only) | None | 20+ employees with group health plans | Within 44 days of qualifying event | Notify employee of right to continue coverage; provide election forms | **Core candidate** (if targeting 20+ employee upper SMBs) |
| **Cal-COBRA Continuation** | None | Insurance Code §10128.5 (2–19 employees) | None | 2–19 employees with group health plans | Within notice period (typically 60 days) | Notify employee of Cal-COBRA rights; continuation for 36 months | **Core candidate** |
| **Health Plan Termination Notice** | ERISA (if applicable) | Labor Code §2808(b) | None | Benefit-eligible employees | Day of termination | Provide written notice of health plan termination, continuation options, conversion rights | **Core candidate** |
| **Expense Reimbursement (Final)** | None | Labor Code §2802 | None | Employees with unreimbursed business expenses | With final paycheck (or reasonably prompt) | Reimburse all outstanding expenses | **Core candidate** |
| **Return of Property** | None (common law) | None specific (employer property rights) | None | Employees with employer-issued equipment | At or before separation | Checklist of items to return (laptop, keys, uniforms, tools); final paycheck may NOT be withheld for unreturned property | **Core candidate** |
| **Personnel File Access (Final)** | None | Labor Code §1198.5 | None | Former employees (up to 3 years post-termination) | Upon request (within 30 days of request) | Provide copy of personnel file; cannot charge for first copy | **Optional expansion** |
| **Cal-WARN (Mass Layoff/Plant Closing)** | WARN Act (29 USC §2101; 100+ employees, 60 days notice) | Labor Code §1400 et seq. (75+ employees OR 50+ in 30-day period; 60 days notice) | None | Cal-WARN: 75+ employees; WARN: 100+ | 60 days before layoff | Notice to affected employees, EDD, local government, union (if applicable); 2026 update: include CalFresh helpline info | **Optional expansion** (above typical SMB size, but useful for upper-range clients) |
| **Non-Compete Agreements (Prohibition)** | FTC Ban (2024; very limited enforceability) | Business \& Professions Code §16600 (voidable except for sale of business, partnership dissolution, LLC dissolution) | None | All employees | At separation (if agreement in place) | CA voids non-competes; may use non-solicitation (limited enforceability); non-disparagement clauses require consideration per SB 699 (2026) | **Core candidate** (education on unenforceability) |
| **Separation/Severance Agreements** | OWBPA (Older Workers Benefit Protection Act; if age discrimination waiver) | SB 699 (2026: non-disparagement clauses in separation agreements require consideration beyond what employee already entitled to) | None | Employees signing releases | At negotiation/separation | If age 40+: 21-day consideration, 7-day revocation; if non-disparagement: additional consideration required | **Optional expansion** |
| **References \& Blacklisting** | None | Labor Code §1050 (blacklisting prohibited); Labor Code §1054 (truthful employment info permissible) | None | Former employees | Post-separation | May provide truthful employment info; cannot blacklist or conspire to prevent employment | **Optional expansion** |

**Gap identified:** **Personnel File Access (Final)**, **Non-Disparagement Clauses**, and **References/Blacklisting** were not fully discussed. Added here.
**Status:** Personnel file = **optional expansion**; Non-disparagement = **core candidate** (new 2026 law); Blacklisting = **optional expansion** (education/policy language).

***

### 3.6 Recordkeeping \& Reporting (Ongoing)

| Program/Requirement | Federal Law | California State Law | Local (LA County/Cities) | Applies To | Retention Period | Obligations | Potential Service Scope |
| :-- | :-- | :-- | :-- | :-- | :-- | :-- | :-- |
| **Payroll Records Retention** | FLSA (3 years) | Labor Code §1174 (4 years) | None | All employers | 4 years | Retain time cards, wage statements, payroll registers | **Core candidate** (provide retention checklist) |
| **Personnel Files** | EEOC (1 year post-termination for hire/termination records) | Labor Code §1198.5 (no specific retention, but must provide access while employed + 3 years post) | None | All employers | 3 years post-termination (best practice) | Maintain organized personnel files; allow employee inspection | **Core candidate** |
| **Training Records** | OSHA (training records typically 1 year; some longer) | Title 8 CCR §3203 (IIPP training records); harassment training certificates (2 years minimum) | None | All employers | 2–5 years depending on training type | Retain certificates, sign-in sheets, agendas, course materials | **Core candidate** |
| **IIPP \& Safety Records** | OSHA (various) | Title 8 CCR §3203 (ongoing; inspection records, incident investigations) | None | All employers | Ongoing/indefinite for IIPP; 5 years for incident logs | Maintain IIPP document, hazard assessments, corrective actions, training records | **Core candidate** |
| **WVPP \& Incident Logs** | OSHA General Duty | Labor Code §6401.9 (SB 553; 5-year retention for violent incident logs) | None | All employers | 5 years | Maintain WVPP document, violent incident log, training records | **Core candidate** |
| **Medical \& Accommodation Records** | ADA (confidential; retain per EEOC guidance) | FEHA + CMIA (Confidentiality of Medical Information Act) | None | All employers | Duration of employment + reasonable period | Separate, locked, confidential files; limited access; HIPAA-like protections | **Core candidate** |
| **I-9 Retention** | IRCA (3 years post-hire OR 1 year post-termination, whichever is later) | None additional | None | All employers | 3 years post-hire or 1 year post-termination | Store separately from personnel files (not confidential but subject to ICE audits) | **Core candidate** |
| **Background Check Records** | FCRA (reasonable period) | ICRAA; Fair Chance Act (retain individualized assessment records) | None | Employers using background checks | Duration of employment + reasonable period (3–5 years recommended) | Retain consents, reports, individualized assessment documentation, adverse action notices | **Core candidate** |

**Gap identified:** **Medical Records** and **I-9 Retention** were not explicitly discussed earlier.
**Status:** Both added as **core candidates**; critical for audit readiness.

***

### 3.7 Privacy \& Data Protection (Gap Analysis Addition)

**Note:** This section was **not discussed in prior conversation** but is included here as part of **gap analysis** due to rising importance of employee data privacy.


| Program/Requirement | Federal Law | California State Law | Local (LA County/Cities) | Applies To | Obligations | Potential Service Scope |
| :-- | :-- | :-- | :-- | :-- | :-- | :-- |
| **CPRA (Employee Data Rights)** | None | California Privacy Rights Act (Civil Code §1798.100 et seq.; employee exemption **partially expired Jan 1, 2023**) | None | Employers collecting employee personal information | Provide privacy notices; honor access/deletion requests (limited exceptions for employment records); data minimization | **Out-of-scope initially**; **Optional expansion** (complex, typically legal-heavy) |
| **Employee Monitoring / Surveillance** | ECPA (Electronic Communications Privacy Act; limited) | CA Penal Code §632 (two-party consent for recording); Labor Code §435 (2022: RF tracking device notice) | None | Employers using video, GPS, keyloggers, etc. | Notice to employees; consent for audio recording; comply with RFID tracking notice requirements | **Optional expansion** |
| **Social Media / Off-Duty Conduct** | NLRA §7 (protected concerted activity) | Labor Code §980 (employer may not require passwords); §96(k) (off-duty lawful conduct protection) | None | All employers | Cannot require social media credentials; cannot discipline for lawful off-duty conduct | **Optional expansion** (policy language) |
| **Credit Check Restrictions** | FCRA (permissible purpose required) | Labor Code §1024.5 (prohibits use for employment except specific roles) | None | Employers using credit checks | Limited to management, law enforcement, financial institutions, specific roles; notice and consent required | **Optional expansion** |

**Gap Assessment:**
**CPRA employee data rights** are complex and typically require legal counsel. Recommend **out-of-scope** for MVP; consider **optional expansion** for Phase 3 once legal partnerships established.

**Employee Monitoring** is increasingly relevant but also legally nuanced. Could be **optional expansion** as a policy/notice add-on module.

***

### 3.8 Summary: Regulatory Landscape Scope Tiers

**Core Candidates (High Priority for MVP/Phase 1):**

- All mandated trainings (harassment, WVPP, IIPP, OSHA hazard-specific)
- Onset documentation (I-9, wage notices, pamphlets)
- Wage \& hour basics (meal breaks, overtime, paystubs)
- Core leaves (sick, FMLA/CFRA, PDL, PFL)
- Core accommodations (lactation, disability, pregnancy, religious)
- Hiring compliance (Fair Chance Act, conditional/final offers)
- Separation compliance (final pay, COBRA/Cal-COBRA, notices)
- Essential recordkeeping

**Optional Expansion (Phase 2/3 or Vertical-Specific):**

- Bereavement, school activities, organ donor leaves
- Bloodborne pathogens (salons, clinics)
- Fire prevention plans
- Cal-WARN (upper-range SMBs)
- Employee monitoring policies
- CPRA employee data rights (requires legal partnership)
- Advanced separation agreements

**Out-of-Scope (Too Large, Too Niche, or Requires Legal Licensure):**

- EEO-1 reporting (100+ employees)
- Industrial safety (lockout/tagout, confined spaces)
- ERISA plan administration (requires ERISA attorney)
- Immigration compliance beyond I-9 basics (requires immigration attorney)
- Complex union/NLRA matters (requires labor attorney)

***

## 4. Service Offerings \& Packages

### 4.1 Package Design Philosophy

All packages are designed around **three core principles**:

1. **Pay-per-deliverable transparency:** Clients pay **before receiving each deliverable**, creating clear value exchange and flattening cash flow burden.
2. **Human-in-the-loop safety:** All AI-generated content is **reviewed and approved by a subject matter expert** before delivery. No "black box" outputs.
3. **Audit-ready outputs:** Every deliverable includes version control, approval stamps, training certificates, and change logs suitable for DLSE or OSHA audits.

### 4.2 Package 1: Text-Only Compliance Pack

**Target Customer:** DIY-capable businesses; budget-conscious; internal staff can deliver trainings using provided materials.

#### Deliverables

**Annual Compliance Report (Q1):**

- Summary of CA law changes in past 12 months relevant to client's vertical and size
- List of new or amended obligations
- Priority checklist (high/medium/low urgency items)
- Format: PDF (15–30 pages)

**Updated Policy \& Procedure Documents:**

- Harassment prevention policy
- Workplace violence prevention plan (SB 553 compliant)
- Injury \& illness prevention program (IIPP with 8 required elements)
- Lactation accommodation policy
- Reasonable accommodation policy (disability, pregnancy, religious)
- Meal \& rest break policy
- Final pay procedures
- Leaves policy (sick, FMLA/CFRA, PDL, PFL, jury duty, voting, domestic violence, military)
- Anti-retaliation policy
- Format: Word .docx (editable) + PDF (print-ready)

**Standard Operating Procedures (SOPs):**

- New hire onboarding checklist
- Background check Fair Chance Act process
- Interactive accommodation process flowchart
- Separation checklist
- Expense reimbursement SOP
- Format: Word .docx + PDF

**Required Notices \& Posters:**

- Wage Theft Prevention Act notice (Labor Code §2810.5) – customizable template
- "Know Your Rights" annual notice (SB 294)
- Harassment prevention poster
- Workplace violence reporting poster
- Emergency contact poster
- Meal/rest break acknowledgment form
- Format: Print-ready PDFs (8.5×11 or 11×17)

**New Hire Packet Templates:**

- I-9 instructions
- W-4 / DE-4 forms
- Required pamphlets checklist (workers' comp, SDI, unemployment, PFL)
- Handbook receipt acknowledgment
- Format: ZIP file with fillable PDFs

**Compliance Tracking Tools:**

- Training tracking matrix (Excel)
- Leave request log (Excel)
- Incident report template (Word)
- Hazard inspection checklist (Word)


#### Cadence

- **Once per year** (Q1 delivery window: January 15 – March 31)


#### Pricing (DRAFT – Subject to Validation)

**Year 1:**

- **\$1,597 one-time payment** (due before Q1 delivery)

**Year 2+:**

- **\$997 renewal** (38% discount; reflects content reuse and lighter regulatory scanning)


#### Payment Flow

1. **Client purchases** Text-Only package → pays \$1,597 via Stripe
2. **Onboarding:** Intake form (15 minutes; captures: employee count, vertical, hazards, jurisdictions)
3. **Engine processes:** Scan → map → draft content tailored to client profile
4. **Human SME review:** Approve/edit policies and reports (target: 2–3 hours per client)
5. **Pack assembly:** Generate ZIP file with all deliverables
6. **Delivery:** Email download link to client

**Client receives:**

```
[client_name]_2026q1_text_only.zip
├── compliance_report_2026.pdf
├── policies/
│   ├── harassment_prevention_policy.docx
│   ├── wvpp_plan.docx
│   ├── iipp_program.docx
│   ├── lactation_accommodation_policy.docx
│   └── [... 8 more policies]
├── sops/
│   ├── onboarding_checklist.docx
│   ├── fair_chance_background_check_process.docx
│   └── [... 4 more SOPs]
├── notices_posters/
│   ├── wage_notice_2810.5_template.pdf
│   ├── know_your_rights_notice.pdf
│   └── [... 5 more posters]
├── new_hire_packet/
│   ├── i9_instructions.pdf
│   └── [... forms]
└── tracking_tools/
    ├── training_matrix.xlsx
    └── [... logs]
```


#### Status \& Gaps

**Decided:**

- Deliverables list is firm
- Annual cadence confirmed
- Pricing ballpark confirmed

**Undecided / Needs Validation:**

- **Which laws are definitively covered?** (See Section 3 scope tiers)
- **Vertical customization depth:** How much do policies differ between dog grooming vs. restaurant vs. clinic? (Likely need 3–5 vertical templates)
- **Legal review:** Should we **require** attorney review before first delivery, or make it optional? (Risk vs. cost tradeoff)

**Gaps:**

- No **training materials** included (slides, videos, handouts). Client must create or source separately if they want to train employees using provided policies.
- No **certificate generation** (client on their own for documentation of training completion).

***

### 4.3 Package 2: 6-Month Service (Training Included)

**Target Customer:** Most SMBs; want turnkey compliance; prefer paying someone else to handle trainings.

#### Deliverables

**Everything in Package 1, plus:**

**Mandated Training Suite (Yearly Delivery):**

Training modules covering all CA-mandated areas:

1. **Harassment Prevention Training**
    - 1-hour session (non-supervisory)
    - 2-hour session (supervisory)
    - Covers: CA/federal law, definitions, examples, reporting procedures, retaliation prevention, abusive conduct
    - Interactive (Q\&A, scenarios)
    - Delivery: Webinar (Zoom) or in-person (Pasadena/LA County area; +\$297 for in-person)
2. **Workplace Violence Prevention Training**
    - 1-hour session (all employees)
    - Covers: SB 553 requirements, recognizing warning signs, reporting procedures, de-escalation, emergency response
    - Delivery: Webinar or in-person
3. **Injury \& Illness Prevention Program (IIPP) Training**
    - 1-hour session (all employees)
    - Covers: Hazard identification, reporting unsafe conditions, emergency procedures, employee rights
    - Vertical-specific hazards (e.g., slippery floors for dog grooming, chemical exposure for salons)
    - Delivery: Webinar or in-person
4. **OSHA Mandated Training (Narrow Scope)**
    - 30–60 minutes depending on hazards
    - Covers ONLY mandated trainings (hazard communication, emergency action, vertical-specific like animal handling, chemical safety)
    - Excludes non-mandated (CPR, soft skills, etc.)
    - Delivery: Webinar or in-person

**Total training time:** ~4–5 hours delivered over 1–2 sessions (can combine for efficiency)

**Training Certificates:**

- Individual certificates for each attendee for each training module
- Includes: Employee name, training topic, date, hours, trainer signature, employer name
- Format: PDF (printable, suitable for personnel files)

**Posters (Physical or Digital):**

- Same as Package 1 but with recommendation for print vendor or provided as print-ready high-res files

**6-Month Catch-Up Training Session:**

- Scheduled ~Month 8 (September/October if Q1 was March)
- Purpose: Train new hires and employees who missed initial session
- Format: Condensed 2–3 hour session covering all mandated topics
- Certificates issued


#### Cadence

**Year 1 Timeline:**

- **Month 1 (Jan):** Onboarding + intake (\$97 fee)
- **Month 2–3 (Feb–Mar):** Main training + full pack delivered (payment due: \$3,850)
- **Month 8–9 (Aug–Sep):** Catch-up training + mini-pack (payment due: \$3,853)
- **Total Year 1:** \$7,800 (\$650/month average)

**Year 2+ Timeline:**

- **Month 2–3 (Q1):** Training + refreshed pack (payment due: \$2,340)
- **Month 8–9 (H2):** Catch-up training (payment due: \$2,340)
- **Total Year 2+:** \$4,680 (\$390/month average; 40% discount)


#### Pricing (DRAFT – Subject to Validation)

**Year 1:**


| Deliverable | Timing | Cost (Due Before Delivery) |
| :-- | :-- | :-- |
| Onboarding + Intake | Day 0 | **\$97** |
| Q1 Training + Full Pack | Month 2–3 | **\$3,850** |
| H2 Catch-Up Training + Mini-Pack | Month 8–9 | **\$3,853** |
| **Total Year 1** |  | **\$7,800** |

**Year 2+:**


| Deliverable | Timing | Cost (Due Before Delivery) |
| :-- | :-- | :-- |
| Q1 Training + Refreshed Pack | Month 2–3 | **\$2,340** |
| H2 Catch-Up Training | Month 8–9 | **\$2,340** |
| **Total Year 2+** |  | **\$4,680** |

**Optional Upsells:**

- **Legal review** by counsel: +\$997 (one-time per year; you route content to your attorney)
- **In-person training** (within 30-mile radius of Pasadena): +\$297 per session
- **Rush delivery** (within 7 days of payment): +\$497


#### Payment Flow

**Year 1, Q1 Deliverable:**

1. **Client selects Package 2** → Pays \$97 onboarding
2. **Intake completed** → Client receives Calendly link to schedule Q1 training (2–4 weeks out)
3. **Invoice sent** 7 days before scheduled training: "Pay \$3,850 to confirm training and receive pack"
4. **Client pays** → Training confirmed
5. **Engine generates content** → SME reviews → Pack assembled
6. **48 hours before training:** Client receives:
    - Training suite ZIP (slides, handouts, video links for review)
    - Posters PDF
    - Full compliance pack ZIP
7. **Training delivered** (webinar or in-person):
    - Attendance tracked (Zoom log or sign-in sheet)
    - Q\&A captured
8. **Within 48 hours post-training:** Client receives:
    - Certificates for all attendees (PDFs)
    - Training completion matrix (Excel log of who completed what)
    - Final deliverable confirmation

**Year 1, H2 Catch-Up:**

9. **Month 7 (July):** System emails client: "Report new hires or employees who missed Q1 training"
10. **Client responds** with list (e.g., "3 new PT hires, 2 employees missed Q1")
11. **Invoice sent:** "Pay \$3,853 for H2 catch-up training"
12. **Client pays** → Training scheduled
13. **Catch-up training delivered** (condensed 2–3 hour session)
14. **Certificates issued** for catch-up attendees
15. **Mini-pack delivered** (any policy updates since Q1 + updated training matrix)

#### Status \& Gaps

**Decided:**

- Training delivery format (webinar default, in-person upsell)
- Mandated-only training scope (no CPR, soft skills, etc.)
- Certificate generation included
- Pay-per-deliverable with \$650/month Year 1 average
- Year 2+ discount structure (40% reduction)

**Undecided / Needs Validation:**

- **Trainer identity:** Will YOU deliver trainings, or hire contract trainers? (Impacts scalability)
- **Training platform:** Zoom? Google Meet? Custom portal?
- **Max class size:** How many attendees per session before you split into multiple sessions? (Affects pricing at upper end of 1–99 employee range)
- **Legal review timing:** Should attorney review happen before OR after training delivery? (If before, may delay training; if after, policies may need revision)

**Gaps:**

- No **quarterly mini-updates** like Package 3 (client waits until Year 2 Q1 for next refresh unless law changes trigger urgent update)
- **Liability:** What if employee files complaint claiming training was inadequate? Need to clarify scope of service and disclaimers.

***

### 4.4 Package 3: Quarterly Service (Maximum Touchpoints)

**Target Customer:** Compliance-sensitive industries (cannabis, clinics, higher-risk); businesses that prefer more frequent updates.

#### Deliverables

**Everything in Package 2, plus:**

**Quarterly Mini-Updates:**

Instead of waiting until Year 2 Q1 for next full refresh, client receives **4 quarterly touchpoints:**

**Q1 (Jan–Mar):** Full training + full pack (same as Package 2)

**Q2 (Apr–Jun):** Mini-update

- Regulatory scan summary (any new laws/regulations in Q2)
- Policy/SOP patches (if needed based on Q2 changes)
- Updated checklists
- No training unless major new mandate
- Format: PDF summary + revised documents (track changes mode)

**Q3 (Jul–Sep):** Catch-up training + mini-pack (same as Package 2 H2)

**Q4 (Oct–Dec):** Mini-update

- Regulatory scan summary (Q4 changes)
- Preview of upcoming Q1 changes (e.g., new laws effective Jan 1)
- Policy/SOP patches
- Updated tracking tools
- No training


#### Cadence

**Year 1 Timeline:**

- **Month 1 (Jan):** Onboarding (\$97)
- **Month 2–3 (Feb–Mar):** Q1 Full Training + Pack (\$1,650)
- **Month 5–6 (May–Jun):** Q2 Mini-Update (\$1,250)
- **Month 8–9 (Aug–Sep):** Q3 Catch-Up Training + Mini-Pack (\$1,500)
- **Month 11–12 (Nov–Dec):** Q4 Mini-Update (\$1,503)
- **Total Year 1:** \$6,000 (\$500/month average)

**Year 2+ Timeline:**

- Q1 Full: \$1,250
- Q2 Mini: \$850
- Q3 Catch-Up: \$950
- Q4 Mini: \$950
- **Total Year 2+:** \$4,000 (\$333/month average; 33% discount)


#### Pricing (DRAFT – Subject to Validation)

**Year 1:**


| Deliverable | Timing | Cost (Due Before Delivery) |
| :-- | :-- | :-- |
| Onboarding | Day 0 | **\$97** |
| Q1 Full Training + Pack | Month 2–3 | **\$1,650** |
| Q2 Mini-Update | Month 5–6 | **\$1,250** |
| Q3 Catch-Up Training + Mini-Pack | Month 8–9 | **\$1,500** |
| Q4 Mini-Update | Month 11–12 | **\$1,503** |
| **Total Year 1** |  | **\$6,000** |

**Year 2+:**


| Deliverable | Timing | Cost (Due Before Delivery) |
| :-- | :-- | :-- |
| Q1 Full Training + Pack | Month 2–3 | **\$1,250** |
| Q2 Mini-Update | Month 5–6 | **\$850** |
| Q3 Catch-Up Training | Month 8–9 | **\$950** |
| Q4 Mini-Update | Month 11–12 | **\$950** |
| **Total Year 2+** |  | **\$4,000** |

#### Payment Flow

Same as Package 2 for Q1 and Q3; additional invoices sent before Q2 and Q4 mini-updates.

**Q2 Mini-Update Example:**

1. **Week 1 of June:** System scans for Q2 regulatory changes
2. **Week 2:** SME reviews findings → generates mini-report + any needed policy patches
3. **Week 3:** Invoice sent to client: "Q2 Mini-Update ready; pay \$1,250 to receive"
4. **Client pays** → Mini-pack ZIP emailed within 24 hours

#### Status \& Gaps

**Decided:**

- Quarterly touchpoint structure
- Pricing at \$500/month Year 1 average (lower than Package 2 due to spreading training costs across 4 deliverables instead of 2)
- Year 2+ discount (33%)

**Undecided / Needs Validation:**

- **When are mini-updates necessary vs. optional?** E.g., if Q2 has zero regulatory changes, do we still send a "no changes" report, or skip Q2 and credit client?
- **Scope of mini-updates:** How much policy revision constitutes a "mini" vs. requiring full rewrite? (Define thresholds)

**Gaps:**

- **Client communication cadence:** Quarterly touchpoints mean more emails/invoices. Need robust CRM or notification system.
- **Operational load:** 4 deliverables per client per year vs. 2 (Package 2) or 1 (Package 1). Scalability concern if client count grows rapidly.

***

### 4.5 Package Comparison Summary Table

| Feature | Package 1: Text-Only | Package 2: 6-Month | Package 3: Quarterly |
| :-- | :-- | :-- | :-- |
| **Policies \& SOPs** | ✓ Annual | ✓ Annual | ✓ Annual |
| **Compliance Report** | ✓ Annual | ✓ Annual | ✓ Quarterly summaries |
| **Posters \& Notices** | ✓ Annual | ✓ Annual | ✓ Annual + quarterly updates |
| **New Hire Packet** | ✓ Templates | ✓ Templates | ✓ Templates |
| **Tracking Tools** | ✓ Excel/Word | ✓ Excel/Word | ✓ Excel/Word |
| **Training Delivery** | ✗ (Client DIY) | ✓ Yearly + 6mo catch-up | ✓ Yearly + 6mo catch-up |
| **Training Materials** | ✗ | ✓ (Slides, handouts, videos) | ✓ (Slides, handouts, videos) |
| **Certificates** | ✗ | ✓ | ✓ |
| **Quarterly Updates** | ✗ | ✗ | ✓ |
| **Deliverables/Year** | 1 | 2 | 4 |
| **Year 1 Cost (Draft)** | **\$1,597** | **\$7,800** (\$650/mo avg) | **\$6,000** (\$500/mo avg) |
| **Year 2+ Cost (Draft)** | **\$997** | **\$4,680** (\$390/mo avg) | **\$4,000** (\$333/mo avg) |
| **Best For** | DIY businesses, budget-conscious | Most SMBs, turnkey compliance | Compliance-sensitive, frequent updates |

**Key Observation:** Package 3 is **cheaper annually** than Package 2 despite more touchpoints. This is intentional to incentivize higher engagement and create "stickiness." The value for us is **lower churn** and **better data** (4 check-ins per year = 4 chances to upsell or identify expansion opportunities).

***

## 5. Pricing Methodology \& Payment Flows

### 5.1 Pricing Philosophy \& Logic

#### 5.1.1 Value-Based Pricing (Not Cost-Plus)

Pricing is **not** derived from "our costs + margin" but from **client's avoided costs and risks**:

**What SMB avoids by using our service:**

- Fractional HR consultant: \$2,500–\$5,000/month (annual: \$30k–\$60k)
- One-time attorney consultation for handbook: \$5k–\$15k
- Separate training vendors: \$1k–\$2k per mandated training × 4 trainings = \$4k–\$8k
- PAGA settlement risk: Average \$50k–\$150k (if sued)
- Waiting time penalties: 30 days × daily wage × employee count (e.g., \$200/day × 15 employees × 30 days = \$90k max exposure)
- DLSE citations for missing IIPP/WVPP: \$7k–\$25k

**Our pricing (\$6k–\$8k/year for full service) is 10–20% of fractional HR costs** and represents **catastrophic risk insurance** against compliance failures.

#### 5.1.2 Component Cost Drivers

While not cost-plus, understanding unit economics is critical:

**Per-Client, Per-Year Costs (Estimates):**


| Cost Category | Package 1 (Text-Only) | Package 2 (6-Month) | Package 3 (Quarterly) |
| :-- | :-- | :-- | :-- |
| **Initial intake \& client setup** | 0.5 hrs × \$150/hr = \$75 | 0.5 hrs × \$150/hr = \$75 | 0.5 hrs × \$150/hr = \$75 |
| **Regulatory scanning** (automated + SME review) | 1 hr × \$150/hr = \$150 | 1 hr × \$150/hr = \$150 | 4 hrs × \$150/hr = \$600 (quarterly) |
| **Content generation** (AI + SME editing) | 3 hrs × \$150/hr = \$450 | 3 hrs × \$150/hr = \$450 | 3 hrs × \$150/hr = \$450 |
| **Training delivery** (prep + session + follow-up) | \$0 (no training) | 6 hrs × \$150/hr = \$900 (yearly + catch-up) | 6 hrs × \$150/hr = \$900 |
| **Certificate generation \& admin** | \$0 | 0.5 hrs × \$150/hr = \$75 | 0.5 hrs × \$150/hr = \$75 |
| **Quarterly mini-updates** | \$0 | \$0 | 3 hrs × \$150/hr × 2 quarters = \$450 |
| **Subtotal Labor** | \$675 | \$1,650 | \$2,550 |
| **Tech stack costs** (LLM API, hosting, Stripe fees) | ~\$50/year | ~\$100/year | ~\$150/year |
| **Legal review** (optional; if chosen) | +\$997 pass-through | +\$997 pass-through | +\$997 pass-through |
| **Total Cost (before legal review)** | **~\$725** | **~\$1,750** | **~\$2,700** |

**Gross Margin (before legal review):**

- Package 1: (\$1,597 - \$725) / \$1,597 = **~55% margin**
- Package 2: (\$7,800 - \$1,750) / \$7,800 = **~78% margin**
- Package 3: (\$6,000 - \$2,700) / \$6,000 = **~55% margin**

**Key takeaway:** Package 2 has highest margin because training cost is amortized across higher price point. Package 3 has more touches (higher labor) but lower price, yielding similar margin to Package 1.

**Margin logic:**

- 50–60% margin is **healthy SaaS benchmark** for professional services-adjacent businesses
- Allows for reinvestment in tech, marketing, and potential trainer hiring as scale increases


#### 5.1.3 Pricing Psychology: Pay-Per-Deliverable

**Why not monthly subscription?**

Traditional SaaS monthly subscription (\$650/month for Package 2) has advantages:

- Predictable MRR
- Easier retention tracking

**But for SMBs with lumpy cash flow, monthly feels like "death by a thousand cuts."**

**Pay-per-deliverable advantages:**

1. **Clarity:** "I pay \$3,850 in March → I get training + full pack." No mystery about what I'm paying for.
2. **Cash flow alignment:** SMBs can plan for 2–4 payments per year rather than 12.
3. **Psychological anchor:** "I'm paying for a deliverable" feels more tangible than "I'm paying for a subscription."
4. **Reduces churn friction:** If client is unhappy, they simply don't pay for next deliverable (vs. having to "cancel subscription" which feels like relationship failure).

**Tradeoff:** Requires **active invoicing** and **payment collection** before each deliverable. Mitigated by Stripe automation and clear communication.

#### 5.1.4 Year 2+ Discount Rationale

**Why 30–40% discount in renewal years?**

**Cost reality:**

- **Year 1:** Heavy human touch (custom vertical mapping, policy drafting from scratch, client onboarding)
- **Year 2+:** Content reuse (80% of policies unchanged; mostly updating effective dates and minor tweaks)

**Client psychology:**

- If Year 2 price is same as Year 1, client may ask: "Why am I paying full price if content is mostly the same?"
- Discount signals: "We value your loyalty; you've already paid for heavy lift in Year 1."

**Retention impact:**

- 30–40% discount significantly improves Year 2 renewal rates (estimated 70–80% vs. 50–60% without discount)

**LTV calculation example (Package 2):**

- Year 1 revenue: \$7,800
- Year 2 revenue: \$4,680
- Year 3 revenue: \$4,680
- 3-year LTV (assuming 75% retention Y2, 65% retention Y3): \$7,800 + (0.75 × \$4,680) + (0.65 × 0.75 × \$4,680) = \$7,800 + \$3,510 + \$2,281 = **\$13,591**

Compare to no-discount scenario (likely 50% Y2 retention, 40% Y3):

- \$7,800 + (0.5 × \$7,800) + (0.4 × 0.5 × \$7,800) = \$7,800 + \$3,900 + \$1,560 = **\$13,260**

**Net:** Discount slightly reduces per-client LTV but massively improves retention, yielding higher total revenue across client base.

***

### 5.2 Payment Workflows \& Technical Implementation

#### 5.2.1 Stripe Integration Architecture

**Products Defined in Stripe Catalog:**

```
Package 1 (Text-Only):
├── product_id: pkg1_onboarding (price: $97) [one-time]
└── product_id: pkg1_annual_pack (price: $1,597 Y1 / $997 Y2+) [one-time]

Package 2 (6-Month):
├── product_id: pkg2_onboarding (price: $97) [one-time]
├── product_id: pkg2_q1_full (price: $3,850 Y1 / $2,340 Y2+) [one-time]
└── product_id: pkg2_h2_catchup (price: $3,853 Y1 / $2,340 Y2+) [one-time]

Package 3 (Quarterly):
├── product_id: pkg3_onboarding (price: $97) [one-time]
├── product_id: pkg3_q1_full (price: $1,650 Y1 / $1,250 Y2+) [one-time]
├── product_id: pkg3_q2_mini (price: $1,250 Y1 / $850 Y2+) [one-time]
├── product_id: pkg3_q3_catchup (price: $1,500 Y1 / $950 Y2+) [one-time]
└── product_id: pkg3_q4_mini (price: $1,503 Y1 / $950 Y2+) [one-time]

Upsells:
├── upsell_legal_review (price: $997) [one-time]
├── upsell_in_person_training (price: $297) [one-time]
└── upsell_rush_delivery (price: $497) [one-time]
```

**Checkout Flow:**

```
Client selects package → Stripe Checkout hosted page
    ├─ metadata: { client_id, deliverable_type, package_tier, year }
    ├─ success_url: https://regagent-ca.com/success?session_id={CHECKOUT_SESSION_ID}
    └─ cancel_url: https://regagent-ca.com/checkout
```

**Webhook Handling (FastAPI endpoint):**

```python
@app.post("/stripe-webhook")
async def handle_stripe_webhook(request: Request):
    payload = await request.body()
    sig_header = request.headers.get("stripe-signature")
    
    # Verify signature
    event = stripe.Webhook.construct_event(payload, sig_header, WEBHOOK_SECRET)
    
    if event["type"] == "checkout.session.completed":
        session = event["data"]["object"]
        client_id = session["metadata"]["client_id"]
        deliverable_type = session["metadata"]["deliverable_type"]
        
        # Trigger content generation pipeline
        trigger_content_generation(client_id, deliverable_type)
        
        # Send confirmation email
        send_email(client_id, "payment_received_template")
        
    return {"status": "success"}
```


#### 5.2.2 Invoice \& Reminder Automation

**7 Days Before Deliverable Due:**

```
Email subject: "Furry Paws Grooming – Q1 Compliance Pack Ready"

Body:
"Hi [Owner Name],

Your Q1 Compliance Pack is ready for delivery! This includes:
✓ Annual compliance report
✓ Updated policies & procedures
✓ Training materials & scheduling link
✓ Certificates for all employees

Total: $3,850

Pay now to receive immediately: [Stripe Payment Link]

Questions? Reply to this email or call [Phone].

Best,
Mario – RegAgent-CA"
```

**3 Days Before (if unpaid):**

```
Subject: "Reminder: Payment Due for Q1 Pack"

Body:
"Hi [Owner],

Friendly reminder: Your Q1 Compliance Pack payment is due in 3 days (by March 15) to stay on schedule.

If you've already paid, please disregard this email.

Pay now: [Stripe Link]

Best,
Mario"
```

**Day of Deadline (if unpaid):**

```
Subject: "Final Reminder: Q1 Pack Payment"

Body:
"Hi [Owner],

Today is the deadline for your Q1 payment ($3,850). If we don't receive payment by end of day, your delivery will be delayed by 7–10 days.

Pay now: [Stripe Link]

Need to adjust timing or discuss payment plan? Let's chat: [Calendly Link]

Best,
Mario"
```

**Grace Period (7 Days Late):**

```
Subject: "Q1 Pack on Hold"

Body:
"Hi [Owner],

Your Q1 Compliance Pack is on hold pending payment. We understand cash flow can be tight—would a payment plan help?

We can split into 2 payments:
• $1,925 now
• $1,925 in 30 days

Let me know: [Email / Phone]

Best,
Mario"
```

**Important:** After 14 days unpaid, client is marked "inactive" and excluded from future deliverables until payment received. No aggressive collections; position as "we're here when you're ready."

***

## 6. System Architecture \& Tech Stack

### 6.1 High-Level System Architecture

```
┌─────────────────────────────────────────────────────────────────┐
│                     REGULATORY SOURCES                           │
│  • CA State Legislature website (bills, codes)                   │
│  • Cal/OSHA regulations (Title 8 CCR)                           │
│  • LA County / City ordinances                                   │
│  • DLSE guidance, EDD notices                                    │
└─────────────────────────────────────────────────────────────────┘
                              ↓
┌─────────────────────────────────────────────────────────────────┐
│                    SOURCE WATCHER MODULE                         │
│  • Python scripts (cron-scheduled)                               │
│  • Web scrapers (BeautifulSoup, Playwright)                      │
│  • Snapshot storage (JSON/Markdown in Git)                       │
│  • Timestamp + hash for change detection                         │
└─────────────────────────────────────────────────────────────────┘
                              ↓
┌─────────────────────────────────────────────────────────────────┐
│                    DIFF ENGINE MODULE                            │
│  • Compare today's snapshot vs yesterday's                       │
│  • Generate "change events": new_law, amended_section, etc.     │
│  • Store in event queue (PostgreSQL or NATS)                     │
└─────────────────────────────────────────────────────────────────┘
                              ↓
┌─────────────────────────────────────────────────────────────────┐
│                OBLIGATION MAPPING MODULE                         │
│  • LLM + rule engine (FastAPI + Ollama/OpenAI)                   │
│  • Input: change events + client profiles                        │
│  • Output: tagged obligations per client                         │
│    e.g., { "law_id": "sb_553", "applies_to": ["client_123"] }   │
└─────────────────────────────────────────────────────────────────┘
                              ↓
┌─────────────────────────────────────────────────────────────────┐
│              POLICY AUTHORING ENGINE MODULE                      │
│  • Template repo (Git: markdown/docx templates)                  │
│  • LLM-assisted draft generation (RAG: law text + template)      │
│  • Diff/patch proposal for existing policies                     │
│  • Output: draft policies stored in staging Git branch           │
└─────────────────────────────────────────────────────────────────┘
                              ↓
┌─────────────────────────────────────────────────────────────────┐
│              HUMAN REVIEW UI (SME Approval Gate)                 │
│  • FastAPI + React/Svelte frontend                               │
│  • View diffs, approve/reject/edit                               │
│  • Log approver ID, timestamp, rationale                         │
│  • Merge to main Git branch on approval                          │
└─────────────────────────────────────────────────────────────────┘
                              ↓
┌─────────────────────────────────────────────────────────────────┐
│                   PACK BUILDER MODULE                            │
│  • Assemble deliverable ZIP per client                           │
│  • Generate PDFs (wkhtmltopdf / reportlab)                       │
│  • Create certificates (PIL + reportlab)                         │
│  • Version stamping (Git SHA, approval date)                     │
└─────────────────────────────────────────────────────────────────┘
                              ↓
┌─────────────────────────────────────────────────────────────────┐
│                    DELIVERY MODULE                               │
│  • Email ZIP via SendGrid/SES                                    │
│  • Or: upload to client portal (S3 + signed URLs)                │
│  • Send confirmation + receipt                                   │
└─────────────────────────────────────────────────────────────────┘
                              ↓
┌─────────────────────────────────────────────────────────────────┐
│                  BILLING MODULE (Stripe)                         │
│  • Invoice generation                                            │
│  • Webhook handling (payment.succeeded triggers delivery)        │
│  • Payment tracking (PostgreSQL: invoices, payments)             │
└─────────────────────────────────────────────────────────────────┘
```


### 6.2 Module-by-Module Spec

#### 6.2.1 Source Watcher Module

**Purpose:** Continuously monitor CA legal sources for changes.

**Tech Stack:**

- **Language:** Python 3.11+
- **Scraping:** BeautifulSoup4, Playwright (for JS-rendered pages)
- **Scheduling:** Cron (via systemd timers or crontab)
- **Storage:** Git repository for snapshots (e.g., `ca-law-archive` repo)

**Sources to Monitor:**

- CA Legislature bill tracking: https://leginfo.legislature.ca.gov/
- CA Labor Code (findlaw, leginfo)
- Cal/OSHA Title 8 CCR: https://www.dir.ca.gov/title8/
- LA County Board of Supervisors: https://bos.lacounty.gov/
- LA City Council: https://cityclerk.lacity.org/

**Daily Workflow:**

1. Cron job runs at 2 AM PST
2. Scrape key pages → save as JSON/Markdown
3. Commit to Git repo: `git commit -m "Snapshot 2026-02-12"`
4. Compare with previous day's commit

**Output:**

```
ca-law-archive/
├── labor_code/
│   └── 2026-02-12.json
├── title8_ccr/
│   └── 2026-02-12.json
└── la_county_ordinances/
    └── 2026-02-12.json
```

**Diff detection:**

```bash
git diff HEAD~1 HEAD -- labor_code/2026-02-12.json
```

If diff detected → trigger Diff Engine.

**Status:** Prototype phase. Initial focus on 5–10 high-value sources rather than 100% coverage.

***

#### 6.2.2 Diff Engine Module

**Purpose:** Generate structured "change events" from raw diffs.

**Tech Stack:**

- Python difflib + custom parsers
- Output: JSON event schema

**Event Schema:**

```json
{
  "event_id": "evt_20260212_001",
  "source": "ca_labor_code",
  "law_id": "labor_code_230.1",
  "change_type": "amended",
  "effective_date": "2026-01-01",
  "before_text": "...",
  "after_text": "...",
  "summary": "Domestic violence leave expanded from 10 to 12 days",
  "detected_at": "2026-02-12T02:15:00Z"
}
```

**Processing:**

1. Receive Git diff from Source Watcher
2. Parse diff → extract sections
3. Classify change type (new, amended, repealed)
4. Store event in PostgreSQL `events` table
5. Trigger Obligation Mapper

**Status:** Core logic to be implemented in Phase 0. Requires manual validation initially.

***

#### 6.2.3 Obligation Mapping Module

**Purpose:** Determine which clients are affected by each change event.

**Tech Stack:**

- FastAPI endpoint
- LLM: Ollama (llama3-70b-instruct) or OpenAI GPT-4
- Vector store: ChromaDB or Pinecone (for law embeddings)
- Rule engine: Open Policy Agent (Rego) for simple rules

**Client Profile Schema:**

```json
{
  "client_id": "la-can-groom-15",
  "name": "Furry Paws Grooming",
  "vertical": "dog_grooming",
  "employees": 15,
  "jurisdictions": ["CA", "Los Angeles County", "La Cañada Flintridge"],
  "attributes": {
    "slippery_floors": true,
    "animal_handling": true,
    "chemicals": false,
    "multi_shift": true
  }
}
```

**Mapping Logic:**

**Step 1: Rule-based filtering (OPA Rego)**

```rego
applies_to_client(client, event) {
  event.law_id == "sb_553"  # Workplace violence
  client.employees >= 1      # All employers
}

applies_to_client(client, event) {
  event.law_id == "sb_1343"  # Harassment training
  client.employees >= 5
}
```

**Step 2: LLM-assisted interpretation (for ambiguous cases)**

Prompt:

```
Law change: "AB 123 amends Labor Code §230.1 to extend domestic violence leave from 10 to 12 days."

Client profile:
- Business: Dog grooming shop
- Employees: 15
- Vertical: Personal services
- Jurisdictions: CA, LA County

Question: Does this law change apply to this client? Why or why not?

Answer in JSON:
{
  "applies": true/false,
  "reason": "...",
  "urgency": "high/medium/low",
  "next_action": "..."
}
```

**Output:**

```json
{
  "event_id": "evt_20260212_001",
  "applies_to": ["la-can-groom-15", "pasadena-salon-22", ...],
  "urgency": "medium",
  "next_action": "update_leave_policy"
}
```

**Status:** Phase 1 focus. Initially manual (SME reviews all events and tags clients). Automate as confidence in LLM + rules grows.

***

#### 6.2.4 Policy Authoring Engine Module

**Purpose:** Generate or update policy documents based on mapped obligations.

**Tech Stack:**

- Git repo: `regagent-templates` (policy templates per vertical)
- LLM: RAG pipeline (ChromaDB + Ollama/GPT-4)
- Diff generator: Python difflib + custom markdown diffing

**Template Structure:**

```
regagent-templates/
├── verticals/
│   ├── dog_grooming/
│   │   ├── harassment_policy.md
│   │   ├── wvpp_plan.md
│   │   ├── iipp_program.md
│   │   └── ...
│   ├── salon/
│   └── restaurant/
└── universal/
    ├── final_pay_sop.md
    └── ...
```

**Authoring Workflow:**

**For new policy:**

1. Fetch template: `verticals/dog_grooming/domestic_violence_leave_policy.md`
2. RAG query: "What are CA requirements for domestic violence leave under Labor Code §230.1 as of 2026?"
3. LLM generates filled-in policy
4. Store in `drafts/la-can-groom-15/domestic_violence_leave_policy_draft.md`

**For policy update:**

1. Fetch existing policy from client's Git branch: `clients/la-can-groom-15/policies/domestic_violence_leave_policy.md`
2. Identify section to update (e.g., "Leave Duration")
3. Generate diff proposal:

```diff
- Employees may take up to **10 days** of unpaid leave per year
+ Employees may take up to **12 days** of unpaid leave per year
```

4. Store diff in staging: `drafts/la-can-groom-15/domestic_violence_policy_update.patch`

**Output:** Draft policies/patches ready for human review.

**Status:** Core to MVP. Initially, templates will be handcrafted; LLM assists with variable filling and updates.

***

#### 6.2.5 Human Review UI (SME Approval Gate)

**Purpose:** Allow subject matter expert to approve/reject/edit AI-generated content before client delivery.

**Tech Stack:**

- **Backend:** FastAPI
- **Frontend:** React or Svelte (lightweight SPA)
- **Database:** PostgreSQL (approval logs, audit trail)
- **Auth:** Simple email + password (or OAuth with Google)

**UI Features:**

**Dashboard View:**

```
┌─────────────────────────────────────────────────┐
│  Pending Reviews (5)                            │
├─────────────────────────────────────────────────┤
│  ✓ Furry Paws Grooming – Q1 Pack (Approved)    │
│  ⏳ Pasadena Salon – Lactation Policy Update   │
│  ⏳ La Cañada Café – WVPP Annual Review        │
│  ⏳ El Monte Clinic – Harassment Training Suite│
│  ⏳ Glendale Retail – Final Pay SOP Update      │
└─────────────────────────────────────────────────┘
```

**Review Detail View:**

```
Client: Furry Paws Grooming
Deliverable: Q1 Full Pack
Status: Pending Approval

┌─────────────────────────────────────────────────┐
│  Item 1: Harassment Prevention Policy          │
│  Change Type: Annual review (no changes)        │
│  [View Policy] [Approve] [Edit] [Reject]        │
├─────────────────────────────────────────────────┤
│  Item 2: WVPP Plan                              │
│  Change Type: Updated violent incident log      │
│  [View Diff] [Approve] [Edit] [Reject]          │
│                                                  │
│  Diff Preview:                                   │
│  - Retain incident logs for 3 years             │
│  + Retain incident logs for 5 years (SB 553)    │
├─────────────────────────────────────────────────┤
│  Item 3: Training Suite (4 modules)             │
│  [View Slides] [Approve All] [Edit]             │
└─────────────────────────────────────────────────┘

[Approve All & Generate Pack]  [Request Changes]
```

**Approval Flow:**

1. SME clicks "View Diff" or "View Policy"
2. Reviews content for:
    - Legal accuracy
    - Clarity
    - Completeness
    - Client-specific customization
3. Options:
    - **Approve:** Content moves to production Git branch
    - **Edit:** Inline editor (Monaco or CodeMirror); saves revision
    - **Reject:** Back to drafting with notes

**Audit Log Entry (PostgreSQL):**

```json
{
  "approval_id": "appr_20260212_001",
  "client_id": "la-can-groom-15",
  "deliverable_type": "q1_full_pack",
  "item": "wvpp_plan.md",
  "reviewer": "mario@regagent-ca.com",
  "action": "approved",
  "timestamp": "2026-02-12T14:30:00Z",
  "notes": "Updated retention period per SB 553; verified cite"
}
```

**Status:** Critical for Phase 0 MVP. Even with 1 client, need this UI to maintain human-in-the-loop rigor.

***

#### 6.2.6 Pack Builder Module

**Purpose:** Assemble final deliverable ZIP with all documents, certificates, and metadata.

**Tech Stack:**

- Python
- **PDF generation:** wkhtmltopdf (for markdown → PDF) or reportlab (for programmatic PDFs)
- **Certificate generation:** Pillow (PIL) + reportlab (fillable templates)
- **ZIP assembly:** Python `zipfile`

**Pack Structure Example (Package 2, Q1 Full):**

```
la-can-groom-15_2026q1_full.zip
├── README.txt (instructions for using the pack)
├── compliance_report_2026q1.pdf
├── policies/
│   ├── harassment_prevention_policy.docx
│   ├── harassment_prevention_policy.pdf
│   ├── wvpp_plan.docx
│   ├── wvpp_plan.pdf
│   └── [... 10 more policies]
├── sops/
│   ├── onboarding_checklist.docx
│   ├── fair_chance_process.docx
│   └── [... 6 more SOPs]
├── posters_notices/
│   ├── harassment_poster.pdf (8.5x11)
│   ├── know_your_rights_notice.pdf
│   └── [... 5 more posters]
├── training_suite/
│   ├── harassment_prevention_slides.pdf
│   ├── harassment_prevention_handout.pdf
│   ├── wvpp_slides.pdf
│   └── [... 4 training modules]
├── certificates/
│   ├── jane_doe_harassment_prevention_2026q1.pdf
│   ├── jane_doe_wvpp_2026q1.pdf
│   └── [... 15 employees × 4 trainings = 60 certificates]
└── tracking_tools/
    ├── training_completion_matrix.xlsx
    ├── leave_request_log.xlsx
    └── incident_report_template.docx
```

**Certificate Template (PDF):**

```
┌──────────────────────────────────────────────┐
│         TRAINING COMPLETION CERTIFICATE       │
│                                               │
│  This certifies that:                         │
│         Jane Doe                              │
│                                               │
│  Has successfully completed:                  │
│  Harassment Prevention Training               │
│                                               │
│  Date: March 15, 2026                         │
│  Duration: 1 hour                             │
│  Trainer: Mario Santos                        │
│                                               │
│  Employer: Furry Paws Grooming                │
│  Location: La Cañada Flintridge, CA           │
│                                               │
│  Signature: _____________________             │
│              Mario Santos, Compliance Trainer │
└──────────────────────────────────────────────┘
```

**Version Stamping:**

Every deliverable includes `version_metadata.json`:

```json
{
  "client_id": "la-can-groom-15",
  "pack_type": "q1_full_pack",
  "generated_at": "2026-02-12T15:00:00Z",
  "git_sha": "a3f4d7c",
  "approved_by": "mario@regagent-ca.com",
  "content_version": "2026q1",
  "laws_effective_as_of": "2026-01-01"
}
```

**Status:** Phase 1 priority. Certificate generation can start with simple templates; enhance aesthetics in Phase 2.

***

#### 6.2.7 Delivery Module

**Purpose:** Securely deliver pack to client after payment confirmed.

**Tech Stack:**

- **Email:** SendGrid or AWS SES
- **File storage:** AWS S3 or DigitalOcean Spaces
- **Signed URLs:** Time-limited download links (valid 7 days)

**Delivery Flow:**

1. **Payment confirmed** (Stripe webhook)
2. **Pack Builder** generates ZIP → uploads to S3: `s3://regagent-packs/la-can-groom-15/2026q1_full.zip`
3. **Generate signed URL:** Valid for 7 days
4. **Send email:**
```
To: owner@furrypawsgrooming.com
Subject: Your Q1 Compliance Pack is Ready!

Hi [Owner Name],

Your Q1 Compliance Pack for Furry Paws Grooming is ready to download!

📦 Download your pack (valid for 7 days):
[Download Link]

What's inside:
✓ Annual compliance report
✓ 12 updated policies & procedures
✓ 6 standard operating procedures
✓ 8 required posters & notices
✓ Training materials for 4 mandated trainings
✓ Certificates for all 15 employees
✓ Tracking tools (Excel logs)

Next steps:
1. Download and unzip the pack
2. Review the README.txt for instructions
3. Schedule your Q1 training via Calendly: [Training Link]

Questions? Reply to this email or call [Phone].

Best,
Mario – RegAgent-CA
```

**Alternative: Client Portal**

For Phase 2+, consider building a simple Next.js portal:

```
https://portal.regagent-ca.com/

Login: owner@furrypawsgrooming.com
Password: ********

Dashboard:
├── Current Pack: Q1 2026 Full Pack [Download]
├── Training Scheduled: March 20, 2026, 10 AM PST [Join Zoom]
├── Certificates: 60 PDFs [View All]
└── Past Deliverables: 
    └── 2025 Q1 Pack [Download]
```

**Status:** Email delivery for MVP; portal in Phase 2 if clients request centralized access.

***

#### 6.2.8 Billing Module (Stripe Integration)

**Purpose:** Handle invoicing, payment collection, and revenue tracking.

**Tech Stack:**

- Stripe API (Python SDK)
- PostgreSQL (invoices, payments, subscriptions tables)
- FastAPI webhook endpoint

**Database Schema:**

**`clients` table:**

```sql
CREATE TABLE clients (
  client_id VARCHAR(50) PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  vertical VARCHAR(50),
  employees INT,
  jurisdictions JSON,
  package_tier INT, -- 1, 2, or 3
  onboarded_at TIMESTAMP,
  stripe_customer_id VARCHAR(50)
);
```

**`invoices` table:**

```sql
CREATE TABLE invoices (
  invoice_id VARCHAR(50) PRIMARY KEY,
  client_id VARCHAR(50) REFERENCES clients(client_id),
  deliverable_type VARCHAR(50), -- e.g., 'q1_full_pack'
  amount_cents INT,
  status VARCHAR(20), -- 'pending', 'paid', 'overdue', 'cancelled'
  due_date DATE,
  paid_at TIMESTAMP,
  stripe_invoice_id VARCHAR(50)
);
```

**`payments` table:**

```sql
CREATE TABLE payments (
  payment_id VARCHAR(50) PRIMARY KEY,
  invoice_id VARCHAR(50) REFERENCES invoices(invoice_id),
  amount_cents INT,
  paid_at TIMESTAMP,
  stripe_payment_intent_id VARCHAR(50)
);
```

**Invoice Creation Workflow:**

1. **7 days before deliverable due:** System cron job creates invoice:
```python
invoice = stripe.Invoice.create(
  customer=client.stripe_customer_id,
  collection_method='send_invoice',
  days_until_due=7,
  metadata={
    'client_id': 'la-can-groom-15',
    'deliverable_type': 'q1_full_pack'
  }
)

stripe.InvoiceItem.create(
  customer=client.stripe_customer_id,
  amount=385000,  # $3,850.00 in cents
  currency='usd',
  description='Q1 Full Compliance Pack + Training'
)

stripe.Invoice.finalize_invoice(invoice.id)
```

2. **Stripe sends invoice email** to client
3. **Client pays** via Stripe hosted payment page
4. **Webhook received:** `invoice.paid` event
5. **Trigger delivery:** Pack Builder + Delivery Module activated

**Status:** Phase 1 priority. Stripe integration is critical for payment automation.

***

### 6.3 Tech Stack Summary Table

| Component | Primary Tech | Alternatives Considered | Decision Status |
| :-- | :-- | :-- | :-- |
| **Base OS** | Linux (Debian/Fedora) on VPS | AWS EC2, DigitalOcean Droplet | ✓ Decided (VPS for control + cost) |
| **Backend Framework** | FastAPI (Python) | Flask, Django | ✓ Decided (FastAPI for async + API-first) |
| **Database** | PostgreSQL | SQLite (dev), MySQL | ✓ Decided (Postgres for production) |
| **LLM** | Ollama (local llama3-70b) | OpenAI GPT-4, Anthropic Claude | ⏳ Undecided (test both; cost vs. quality tradeoff) |
| **Vector Store** | ChromaDB | Pinecone, Weaviate | ⏳ Undecided (ChromaDB for simplicity; Pinecone if scaling) |
| **Policy Engine** | Open Policy Agent (Rego) | Custom Python rules | ✓ Decided (OPA for declarative rules) |
| **Frontend (Admin UI)** | React or Svelte | Vue, plain HTML/JS | ⏳ Undecided (lean toward Svelte for lightness) |
| **Client Portal** | Next.js (Phase 2+) | React SPA, Nuxt | ⏳ Future decision |
| **PDF Generation** | wkhtmltopdf + reportlab | Puppeteer, LaTeX | ✓ Decided (wkhtmltopdf for markdown, reportlab for certs) |
| **Email** | SendGrid | AWS SES, Mailgun | ⏳ Undecided (SendGrid for ease; SES for cost at scale) |
| **File Storage** | AWS S3 | DigitalOcean Spaces, Backblaze B2 | ✓ Decided (S3 for reliability + signed URLs) |
| **Payments** | Stripe | PayPal, Square | ✓ Decided (Stripe for developer UX + webhooks) |
| **Version Control** | Git (GitHub private repos) | GitLab, Gitea | ✓ Decided (GitHub for familiarity) |
| **CI/CD** | GitHub Actions | GitLab CI, Jenkins | ⏳ Future decision (Phase 2) |
| **Monitoring** | Sentry (errors) + Grafana (metrics) | Datadog, New Relic | ⏳ Future decision (Phase 2) |


***

### 6.4 Open Source Repository Strategy

**Identified OSS Repos (from prior conversation):**

1. **`nathangtg/legal-guard-regtech`** (GitHub)
    - FastAPI + React for AI-powered legal analysis
    - License: Likely MIT/Apache (verify before cloning)
    - **Use case:** Reference architecture for FastAPI backend + policy generation patterns
    - **Status:** Clone for learning; cherry-pick useful patterns
2. **`oscal-compass/compliance-to-policy-go`** (GitHub)
    - Go-based "compliance → policy template" generator
    - License: Apache 2.0
    - **Use case:** Inspiration for "controls → policy snippet" mapping
    - **Status:** Study architecture; may port patterns to Python
3. **`open-policy-agent/opa`** (GitHub)
    - Policy engine (Rego language)
    - License: Apache 2.0
    - **Use case:** Eligibility checks (e.g., "Does this law apply to clients with 5+ employees?")
    - **Status:** Integrate directly (via Docker or Go binary)

**Internal Repos:**

**`regagent-ca-engine`** (private GitHub repo)

- Core backend (FastAPI, LLM integration, modules)

**`regagent-templates`** (private GitHub repo)

- Policy templates per vertical
- Version-controlled markdown/docx files

**`ca-law-archive`** (private GitHub repo)

- Daily snapshots of CA legal sources
- Diff history

**`regagent-admin-ui`** (private GitHub repo)

- React/Svelte frontend for SME review

***

### 6.5 Security \& Privacy Considerations

**Data Categories:**

- **Client business data:** Name, address, employee count, vertical (low sensitivity)
- **Employee PII:** Names for certificate generation (medium sensitivity)
- **Legal documents:** Policies, SOPs (medium sensitivity; client proprietary)
- **Medical/accommodation data:** If we track PDL/disability requests (HIGH sensitivity)

**Security Measures:**

**Encryption:**

- **At rest:** PostgreSQL encryption, S3 bucket encryption
- **In transit:** HTTPS only (TLS 1.2+), no HTTP fallback

**Access Control:**

- **Admin UI:** Role-based access (SME reviewer vs. admin)
- **Client portal:** Per-client isolation (can only access own data)

**Data Retention:**

- **Policies:** Retain for duration of client relationship + 3 years post-termination (audit trail)
- **Employee PII:** Delete or anonymize 90 days post-certificate generation (unless client requests retention)
- **Audit logs:** Retain indefinitely (compliance evidence)

**CPRA Compliance (if applicable):**

- If collecting CA resident employee data at scale, may trigger CPRA obligations
- Mitigate by: minimal data collection, clear privacy notice, honor deletion requests
- **Status:** Out-of-scope for MVP; revisit in Phase 2 if handling sensitive employee data

**Backup \& Disaster Recovery:**

- **Database:** Automated daily backups to S3 (encrypted)
- **Git repos:** GitHub provides redundancy; additional backups to separate cloud storage
- **Recovery Time Objective (RTO):** 24 hours
- **Recovery Point Objective (RPO):** 24 hours (acceptable for non-real-time service)

***

## 7. Operational Workflow (Human + AI)

This section documents the **end-to-end workflow** using a concrete example: **Furry Paws Dog Grooming** (15 employees, La Cañada Flintridge, CA) purchasing **Package 2 (6-Month Service)**.

### 7.1 Phase 0: Discovery \& Purchase

**Business Actions:**

1. **Owner (let's call her Sarah)** hears about RegAgent-CA via:
    - Google search: "California harassment training small business"
    - Referral from local HR consultant
    - LinkedIn ad targeting LA County small business owners
2. **Sarah visits website:** regagent-ca.com
    - Reads about packages
    - Uses calculator: "15 employees, dog grooming, LA County" → recommends Package 2
    - Sees testimonial from similar business
3. **Sarah clicks "Get Started" → Package 2**
    - Redirected to Stripe Checkout
    - Pays **\$97 onboarding fee**

**System Actions:**

1. Stripe webhook: `checkout.session.completed`
2. Create client record in PostgreSQL:
```sql
INSERT INTO clients (client_id, name, email, vertical, employees, package_tier, onboarded_at)
VALUES ('la-can-groom-15', 'Furry Paws Grooming', 'sarah@furrypaws.com', 'dog_grooming', 15, 2, NOW());
```

3. Send welcome email:
```
Subject: Welcome to RegAgent-CA!

Hi Sarah,

Welcome! You've successfully enrolled in our 6-Month Compliance Service.

Next steps:
1. Complete your 10-minute intake form: [Link]
2. Schedule your Q1 training (we'll send a link within 24 hours)

Your next payment ($3,850) is due before your Q1 training in March.

Questions? Reply here or call [Phone].

Best,
Mario
```

**Your Team Actions:**

- Mario reviews new client signup
- Prepares intake form link (Typeform or Google Form)

***

### 7.2 Phase 1: Intake \& Client Profiling

**Business Actions:**
4. **Sarah completes intake form** (10 minutes):

- Business name: Furry Paws Grooming
- Address: 123 Main St, La Cañada Flintridge, CA 91011
- Employee breakdown: 1 owner, 4 FT groomers, 10 PT/on-call
- Hours: Mon–Sat, 9 AM – 7 PM
- Hazards (check all): ☑ Slippery floors, ☑ Animal handling, ☑ Chemicals (shampoos), ☐ Heavy machinery
- Current compliance state:
    - Harassment training: Last done 2023 (overdue for 2-year cycle)
    - IIPP: Exists but not reviewed in 2 years
    - WVPP: None (new SB 553 requirement)
    - Lactation room: Yes (small office converted)
- Preferred training format: ☑ Webinar, ☐ In-person
- Preferred document format: ☑ Word (editable), ☑ PDF (print-ready)

**System Actions:**
5. Intake responses stored in PostgreSQL `client_profiles` table:

```json
{
  "client_id": "la-can-groom-15",
  "attributes": {
    "slippery_floors": true,
    "animal_handling": true,
    "chemicals": true,
    "multi_shift": true,
    "lactation_room_exists": true
  },
  "compliance_gaps": [
    "harassment_training_overdue",
    "wvpp_missing",
    "iipp_review_overdue"
  ]
}
```

6. System sends Calendly link:
```
Subject: Schedule Your Q1 Training

Hi Sarah,

Thanks for completing your intake!

Based on your profile, your Q1 training will cover:
✓ Harassment Prevention (1 hr for non-supervisors, 2 hrs for you as owner)
✓ Workplace Violence Prevention (1 hr, SB 553 compliance)
✓ IIPP Refresher (1 hr, including slippery floor/animal handling hazards)
✓ Hazard Communication (30 min, shampoo/chemical safety)

Total time: ~4.5 hours (we'll break into 2 sessions)

Schedule Session 1: [Calendly Link - March 15-20, 2026]

Your Q1 pack payment ($3,850) is due by March 10, 2026.

Best,
Mario
```

**Your Team Actions:**

- Mario reviews intake
- Tags client with priority gaps (WVPP missing = urgent)
- Adds to Q1 cohort (planning to train 3–5 clients in same week for efficiency)

***

### 7.3 Phase 2: Content Generation (Background)

**System Actions (Automated):**

7. **Regulatory scan** (ongoing daily cron):
    - Detects no major changes in Feb 2026 (quiet month)
    - Q1 pack will use Jan 2026 effective laws
8. **Obligation mapping** for Furry Paws:
    - LLM query: "Client has 15 employees, dog grooming, slippery floors, animal handling. Which CA employment laws apply?"
    - Output:

```json
{
  "core_laws": [
    "sb_1343_harassment_training",
    "sb_553_wvpp",
    "title8_3203_iipp",
    "labor_code_1030_lactation",
    "labor_code_512_meal_breaks",
    "labor_code_246_sick_leave"
  ],
  "hazard_specific": [
    "title8_5194_hazcom", 
    "animal_handling_basics"
  ]
}
```

9. **Policy authoring** (AI + templates):
    - Fetch `templates/dog_grooming/harassment_policy.md`
    - Fill in variables:

```
Employer: Furry Paws Grooming
Effective Date: January 1, 2026
Employee Count: 15
Complaint Coordinator: Sarah [Owner]
```

    - Generate 12 policies (harassment, WVPP, IIPP, lactation, meal breaks, sick leave, FMLA/CFRA, PDL, final pay, accommodations, anti-retaliation, social media)
10. **Training suite generation:**
    - Harassment prevention slides (90 slides, 1-hr version + 2-hr version)
    - WVPP slides (40 slides)
    - IIPP slides (50 slides, customized with "slippery floor" and "animal bite" scenarios)
    - HazCom slides (20 slides, shampoo SDS examples)
11. **Posters generation:**
    - Wage Theft Notice (§2810.5) – filled with Furry Paws details
    - Know Your Rights (SB 294)
    - Harassment reporting poster
    - Workplace violence reporting poster
    - Emergency phone numbers poster
12. **Compliance report** (PDF, 25 pages):
    - Section 1: 2026 Law Changes Summary
    - Section 2: Furry Paws-Specific Obligations
    - Section 3: Priority Action Items (WVPP creation = HIGH)
    - Section 4: Training Schedule
    - Section 5: Renewal Reminders (harassment training due again in 2028)

**Your Team Actions:**

13. **Mario reviews drafts in Admin UI:**
    - Opens "Pending Reviews" → "Furry Paws Grooming Q1 Pack"
    - Reviews 12 policies:
        - ✓ Harassment policy: Approved (standard, no edits needed)
        - ✓ WVPP: Approved (includes dog grooming-specific scenarios per SB 553)
        - ✓ IIPP: **Edit needed** → Mario adds specific language: "Groomers must wear non-slip shoes per CalOSHA guidance for wet-floor environments"
        - ✓ Lactation policy: Approved (confirms existing office setup complies with Labor Code §1030)
        - [... 8 more policies reviewed]
    - Reviews training slides:
        - ✓ Harassment slides: Approved (CA-compliant, interactive scenarios)
        - ✓ WVPP slides: Approved (includes de-escalation for aggressive dogs as example)
        - ✓ IIPP slides: **Edit needed** → Mario adds slide: "Case Study: Groomer slips on wet floor – root cause analysis"
        - ✓ HazCom slides: Approved
    - **Total review time:** 2.5 hours
14. **Mario clicks "Approve All \& Generate Pack"**
    - System merges all approved content to production Git branch: `clients/la-can-groom-15/2026q1`
    - Pack Builder assembles ZIP

***

### 7.4 Phase 3: Payment \& Delivery

**System Actions:**

15. **7 days before training (March 8, 2026):**
    - Invoice email sent to Sarah:

```
Subject: Payment Due: Q1 Compliance Pack ($3,850)

Hi Sarah,

Your Q1 Compliance Pack is ready! To receive it before your scheduled training on March 18, please pay by March 15.

What's included:
✓ 12 updated policies & procedures
✓ Annual compliance report (25 pages)
✓ 8 required posters & notices
✓ Training materials (slides + handouts)
✓ Certificates for all 15 employees

Amount due: $3,850
Pay now: [Stripe Payment Link]

Questions? Reply or call [Phone].

Best,
Mario
```


**Business Actions:**

16. **Sarah pays \$3,850** via Stripe link (March 10, 2026)

**System Actions:**

17. **Stripe webhook → Payment confirmed**
    - Mark invoice as `paid` in PostgreSQL
    - Trigger delivery:
        - Upload ZIP to S3: `s3://regagent-packs/la-can-groom-15/2026q1_full.zip`
        - Generate signed URL (valid 7 days)
        - Send email:

```
Subject: Your Q1 Pack is Ready!

Hi Sarah,

Your Q1 Compliance Pack is ready to download!

📦 Download (valid for 7 days): [S3 Signed URL]

Your training is confirmed:
📅 March 18, 2026, 10:00 AM PST
📍 Zoom (link will be sent 24 hrs before)

See you soon!
Best,
Mario
```

18. **24 hours before training (March 17, 2026, 10 AM):**
    - Email sent:

```
Subject: Tomorrow: Q1 Training at 10 AM PST

Hi Sarah,

Reminder: Your Q1 training is tomorrow at 10 AM PST.

Zoom link: [Link]
Meeting ID: 123-456-7890
Passcode: FurryPaws2026

Who should attend:
✓ You (owner) – 2-hour session (supervisory harassment training)
✓ All 4 FT groomers – 1-hour session
✓ All 10 PT/on-call staff (if available) – 1-hour session

We'll start with the 1-hour session for all employees, then you'll stay for the additional supervisory hour.

Agenda:
10:00 – 11:00 AM: Harassment Prevention (all employees)
11:00 AM – 12:00 PM: Harassment Prevention - Supervisory (you only)
12:00 – 12:15 PM: Break
12:15 – 1:15 PM: WVPP + IIPP (all employees)
1:15 – 1:45 PM: HazCom (all employees)

Please have all employees join by 10 AM.

Best,
Mario
```


***

### 7.5 Phase 4: Training Delivery

**Your Team Actions:**

19. **March 18, 2026, 10:00 AM PST:**
    - Mario hosts Zoom webinar
    - 15 attendees join (Sarah + 14 staff)
    - **Attendance tracking:** Zoom auto-generates participant log
20. **Training agenda (actual):**
    - **10:00–11:00:** Harassment Prevention Training (all employees)
        - Interactive scenarios
        - Q\&A (15 minutes)
    - **11:00–12:00:** Supervisory Harassment Training (Sarah only)
        - Manager responsibilities
        - Investigation procedures
        - Q\&A (10 minutes)
    - **12:00–12:15:** Break
    - **12:15–1:15:** WVPP + IIPP (all employees)
        - SB 553 overview
        - Violent incident reporting
        - Slippery floor hazards
        - Animal handling safety
        - Q\&A (10 minutes)
    - **1:15–1:45:** HazCom (all employees)
        - SDS binder review
        - Chemical safety with shampoos
        - Q\&A (5 minutes)
21. **Post-training:**
    - Mario exports Zoom attendance CSV
    - Uploads to system

**System Actions:**

22. **Certificate generation (within 24 hours):**
    - For each attendee × each training module:
        - Sarah: 4 certificates (harassment general + supervisory, WVPP, IIPP, HazCom)
        - Each of 14 staff: 4 certificates (harassment, WVPP, IIPP, HazCom)
        - **Total:** 60 certificates (15 employees × 4 trainings)
    - PDFs generated via reportlab
    - Stored in `s3://regagent-packs/la-can-groom-15/certificates/`
23. **Final deliverable email:**

```
Subject: Training Complete! Certificates Ready

Hi Sarah,

Great training session yesterday! All 15 employees completed their required trainings.

📜 Download certificates (60 PDFs): [S3 Signed URL]

Training completion matrix (Excel) included – shows who completed what.

Next steps:
1. Print certificates and file in personnel folders
2. Post required posters (included in your Q1 pack)
3. Update your IIPP with the new slippery-floor procedures we discussed

Your next deliverable:
📅 H2 Catch-Up Training: September 2026
💰 Cost: $3,853 (due before training)

We'll send a reminder in July to schedule.

Best,
Mario
```


**Business Actions:**

24. **Sarah downloads certificates**
25. **Sarah prints posters** → posts in break room
26. **Sarah files certificates** in personnel folders
27. **Sarah feels relieved** that compliance is handled for the year

***

### 7.6 Phase 5: H2 Catch-Up Training (Month 8)

**System Actions:**

28. **July 15, 2026 (Month 6):**
    - Reminder email sent:

```
Subject: Upcoming: H2 Catch-Up Training

Hi Sarah,

Hope business is going well!

Your H2 Catch-Up Training is coming up in September. This session is for:
✓ New hires since March
✓ Employees who missed Q1 training

Please reply with:
-  Number of new hires: ___
-  Names of employees who missed Q1: ___

We'll schedule a 2–3 hour session to get everyone up to speed.

Cost: $3,853 (due before training)

Best,
Mario
```


**Business Actions:**

29. **Sarah replies:**

```
Hi Mario,

We have:
-  3 new PT groomers (hired in May/June)
-  2 employees who missed Q1 (scheduling conflict)

Total: 5 people need training.

Thanks!
Sarah
```


**System Actions:**

30. **July 20, 2026:**
    - Invoice sent for H2 Catch-Up: \$3,853
    - Calendly link for September training

**Business Actions:**

31. **Sarah pays \$3,853** (August 1, 2026)
32. **Sarah schedules training** for September 10, 2026, 2 PM PST

**Your Team Actions:**

33. **September 10, 2026, 2:00 PM PST:**
    - Mario hosts condensed 2.5-hour training for 5 employees
    - Covers all 4 mandated topics (harassment, WVPP, IIPP, HazCom)
    - Faster pace since smaller group

**System Actions:**

34. **September 11, 2026:**
    - Generate 20 certificates (5 employees × 4 trainings)
    - Update training matrix
    - Send mini-pack:

```
la-can-groom-15_2026h2_catchup.zip
├── certificates/ (20 PDFs)
├── updated_training_matrix.xlsx
└── h2_mini_report.pdf (any July–Sep regulatory updates)
```


**Business Actions:**

35. **Sarah files new certificates**
36. **Sarah's compliance is current through end of 2026**

***

### 7.7 Phase 6: Year 2 Renewal (Month 12)

**System Actions:**

37. **January 15, 2027:**
    - Renewal email sent:

```
Subject: Renew for 2027? (40% Discount!)

Hi Sarah,

Your 2026 compliance was a success! Ready to stay compliant in 2027?

Your Year 2 pricing (40% OFF):
-  Q1 Training + Pack: $2,340 (was $3,850)
-  H2 Catch-Up: $2,340 (was $3,853)
-  Total Year 2: $4,680 (vs $7,800 Year 1)

Same great service:
✓ Updated policies for 2027 laws
✓ Annual trainings + catch-up session
✓ Certificates for all employees

Renew now: [Stripe Payment Link - $2,340 for Q1]

Questions? Let's chat: [Calendly]

Best,
Mario
```


**Business Actions:**

38. **Sarah renews:** Pays \$2,340 for 2027 Q1 (February 1, 2027)
39. **Cycle repeats** for Year 2

**Key Observations:**

- **Sarah's total 2-year spend:** \$7,800 (Y1) + \$4,680 (Y2) = **\$12,480**
- **Compare to alternatives:**
    - Fractional HR (2 years): \$60k–\$120k
    - One-time consultant + annual training vendor: \$10k (Y1) + \$5k (Y2) = \$15k
    - **Sarah saves \$2,520–\$107,520** over 2 years

***

### 7.8 Operational Workflow Summary (Flow Diagram)

```
[Business Discovers Service]
         ↓
[Purchases Package ($97 onboarding)]
         ↓
[Completes Intake Form]
         ↓
    ┌────────────────────────────────┐
    │  YOUR TEAM ACTIONS (Background) │
    │  • Review intake                │
    │  • Tag priority gaps            │
    └────────────────────────────────┘
         ↓
    ┌────────────────────────────────┐
    │ SYSTEM ACTIONS (Automated)      │
    │ • Scan regulations              │
    │ • Map obligations               │
    │ • Generate draft policies       │
    │ • Generate training materials   │
    └────────────────────────────────┘
         ↓
    ┌────────────────────────────────┐
    │ YOUR TEAM ACTIONS (SME Review)  │
    │ • Review drafts in Admin UI     │
    │ • Approve/edit content          │
    │ • Generate pack                 │
    └────────────────────────────────┘
         ↓
[Invoice Sent (7 days before)]
         ↓
[Business Pays] ──────────┐
         ↓                 │
    ┌────────────────────────────────┐
    │ SYSTEM ACTIONS (Delivery)       │
    │ • Upload pack to S3            │
    │ • Send download link            │
    │ • Send training reminder        │
    └────────────────────────────────┘
         ↓
[Business Schedules Training]
         ↓
    ┌────────────────────────────────┐
    │ YOUR TEAM ACTIONS (Training)    │
    │ • Deliver webinar/in-person     │
    │ • Track attendance              │
    │ • Answer Q&A                    │
    └────────────────────────────────┘
         ↓
    ┌────────────────────────────────┐
    │ SYSTEM ACTIONS (Post-Training)  │
    │ • Generate certificates         │
    │ • Send final deliverable        │
    └────────────────────────────────┘
         ↓
[Business Files Certificates]
         ↓
[6 Months Later: Catch-Up Cycle Repeats]
         ↓
[Year 2: Renewal at 40% Discount]
```


***

## 8. Compliance, Governance, and Risk Management

### 8.1 Avoiding Unauthorized Practice of Law (UPL)

**Core Risk:**
Providing legal advice without a license is illegal in CA (Business \& Professions Code §6125). Our service must **not** cross this line.

**What Constitutes Legal Advice (Generally):**

- Interpreting how a law applies to a specific client's unique situation
- Advising on legal strategy (e.g., "You should terminate this employee because...")
- Drafting legal documents on behalf of client (e.g., separation agreements with releases)
- Representing client in legal proceedings

**What is NOT Legal Advice (Safe Harbor):**

- Providing **general information** about laws
- Offering **template documents** with clear disclaimers
- **Training delivery** on mandated topics using publicly available legal standards
- **Workflow automation** (e.g., "Here's a checklist based on CA law; consult your attorney for your situation")

**Our Mitigation Strategies:**

#### 8.1.1 Disclaimers (Everywhere)

**On website:**

```
LEGAL DISCLAIMER

RegAgent-CA provides compliance content, training, and documentation services. We are NOT a law firm and do NOT provide legal advice. All policies, procedures, and training materials are for informational purposes and should be reviewed by your legal counsel before implementation. Use of our services does not create an attorney-client relationship.

For legal advice, consult a licensed California employment attorney.
```

**In every deliverable (README.txt in ZIP):**

```
IMPORTANT: REVIEW BY COUNSEL RECOMMENDED

The policies and procedures in this pack are based on California employment law as of [Date]. They are provided as templates and general guidance.

BEFORE IMPLEMENTING these policies:
✓ Have them reviewed by your legal counsel
✓ Customize to your specific business needs
✓ Ensure compliance with any industry-specific regulations

RegAgent-CA is NOT a law firm. This is NOT legal advice.
```

**In training sessions:**

- Mario starts every training: "I'm not an attorney. This training covers CA legal requirements, but for advice on your specific situation, consult legal counsel."


#### 8.1.2 Positioning as "Compliance Content Service"

**We frame service as:**

- "Regulatory awareness and documentation platform"
- "Training delivery service for mandated programs"
- "Policy template library with ongoing updates"

**NOT as:**

- "Legal compliance solution" (too strong)
- "Full-service HR legal services"
- "Attorney alternative"


#### 8.1.3 Optional Legal Review Upsell

**How it works:**

1. Client selects "Legal Review" add-on (+\$997)
2. We send full pack to **our retained CA employment attorney**
3. Attorney reviews for 2–3 hours, provides:
    - "Approved as-is" stamp, OR
    - List of recommended edits
4. We incorporate attorney edits (if any)
5. Client receives attorney-reviewed version

**Key:** The attorney is **our** counsel, not theirs. Client is still advised to consult their own attorney for specific advice.

**Attorney engagement letter (draft):**

```
Mario Santos DBA RegAgent-CA ("Provider") retains [Attorney Name], Esq. ("Attorney") to review compliance content packs generated for Provider's clients.

Scope: Attorney will review policies, SOPs, and training materials for general compliance with California employment law. Attorney will NOT provide legal advice to Provider's clients directly and will NOT represent Provider's clients in any capacity.

Attorney's review comments will be provided to Provider, who may incorporate them into deliverables.

Fee: $150/hour, estimated 2–3 hours per pack review.
```


#### 8.1.4 When to Refer to Attorney (Red Flags)

**If client asks:**

- "Should I terminate this employee?" → "That's a legal decision. Here's a checklist of factors to consider, but consult your attorney."
- "Can I fire someone for X reason?" → "CA is at-will, but there are exceptions. Review our wrongful termination SOP, then consult counsel."
- "Will this policy protect me from a lawsuit?" → "No policy guarantees protection. Have your attorney review it for your situation."

**If situation involves:**

- Pending DLSE investigation or lawsuit → "We provide documentation support, but you need legal representation."
- Complex accommodation request → "Here's our interactive process SOP, but consult counsel for medical assessment and undue hardship analysis."
- Union organizing → "This is specialized labor law. We don't cover this; refer to labor attorney."

***

### 8.2 Human-in-the-Loop Governance

**Why Critical:**

1. **Quality:** LLMs can hallucinate or misinterpret laws
2. **Liability:** If we deliver inaccurate content and client suffers harm, we could be sued
3. **Trust:** SMBs need to know a human reviewed content, not just "AI generated it"

**Governance Model:**

#### 8.2.1 SME Review Requirements

**Every deliverable must have:**

- **Reviewer ID** (Mario or future reviewers)
- **Review timestamp**
- **Approval action** (approved / approved with edits / rejected)
- **Rationale** (brief notes: "Verified SB 553 citation" / "Updated retention period")

**Review checklist (for SME):**

- [ ] Legal accuracy (cites correct statutes, no outdated laws)
- [ ] Clarity (plain English, avoids legalese where possible)
- [ ] Completeness (all 8 IIPP elements present, etc.)
- [ ] Client-specific customization (vertical hazards, employee count, etc.)
- [ ] No placeholders or TODOs
- [ ] Disclaimer included

**Typical review time:**

- Single policy: 10–15 minutes
- Full pack (12 policies + report + training materials): 2–3 hours


#### 8.2.2 Escalation Protocol

**If SME is uncertain about legal interpretation:**

1. Tag item as "Needs Attorney Review"
2. Send to retained attorney for guidance
3. Incorporate attorney feedback
4. Document attorney consult in audit log

**If law is brand-new or ambiguous:**

1. Research CA regulatory guidance (DIR, DLSE FAQs)
2. If still unclear, draft "safe" language (err on side of over-compliance)
3. Add note to client: "This is based on our interpretation of [new law]; consult counsel for confirmation"

#### 8.2.3 Version Control \& Rollback

**All content stored in Git:**

```
clients/la-can-groom-15/
├── 2026q1/
│   ├── harassment_policy.md (approved 2026-02-12 by mario)
│   ├── wvpp_plan.md (approved 2026-02-12 by mario)
│   └── ...
├── 2026h2/
│   ├── harassment_policy.md (no changes from Q1)
│   ├── wvpp_plan.md (updated violent incident log retention)
│   └── ...
└── audit_log.json
```

**audit_log.json:**

```json
[
  {
    "timestamp": "2026-02-12T14:30:00Z",
    "client_id": "la-can-groom-15",
    "deliverable": "2026q1",
    "item": "wvpp_plan.md",
    "action": "approved",
    "reviewer": "mario@regagent-ca.com",
    "git_sha": "a3f4d7c",
    "notes": "Updated retention period to 5 years per SB 553"
  },
  ...
]
```

**Rollback capability:**

- If client reports issue ("This policy is wrong!"):

1. Review audit log to find when issue was introduced
2. `git revert` to prior version
3. Reissue corrected deliverable
4. Document incident and root cause

***

### 8.3 Data Privacy \& Security

**Data Flows:**

**Input:**

- Client business info (name, address, employee count)
- Employee names (for certificates)
- Intake form responses (hazards, compliance gaps)

**Storage:**

- PostgreSQL (client profiles, invoices, audit logs)
- S3 (deliverable ZIPs, certificates)
- Git (policies, templates)

**Output:**

- Deliverable ZIPs (policies, certificates)
- Training materials (slides, handouts)

**Privacy Risks:**

1. **Employee PII exposure:** Names on certificates stored in S3
    - **Mitigation:** S3 bucket is private; signed URLs expire in 7 days; client downloads and we delete after 90 days
2. **Accommodation data:** If we track PDL/disability requests
    - **Mitigation:** Do NOT store medical details; only track "accommodation requested: yes/no" + dates
    - Advise clients to maintain separate confidential medical files
3. **Data breach:** Attacker gains access to database or S3
    - **Mitigation:**
        - PostgreSQL: encrypted at rest, strong passwords, no public access
        - S3: bucket encryption, IAM least-privilege access
        - Regular security audits (Phase 2)

**CPRA Considerations:**

**Employee data exemption:** CPRA has a **partial employee exemption** (employees' personal info used for employment purposes is exempt from some CPRA obligations until Jan 1, 2023 sunset, then partial re-exemption).

**Our stance:**

- We collect **minimal employee PII** (names for certificates)
- We are a **service provider** to clients (not "selling" data)
- Clients remain **responsible** for their own employee data under CPRA

**Best practice:** Include in Terms of Service:

```
CLIENT RESPONSIBILITIES

Client is responsible for:
• Obtaining necessary consents from employees for providing names/data to RegAgent-CA
• Complying with CPRA and other privacy laws regarding employee data
• Maintaining confidential medical and accommodation records separately

RegAgent-CA processes employee data solely as a service provider for the purpose of generating training certificates and compliance documentation.
```


***

### 8.4 Bias, Fairness \& AI Accountability

**Risk:** LLM interprets Fair Chance Act or accommodation law in biased way.

**Example scenario:**

- Client submits background check results: "Applicant has 10-year-old shoplifting conviction."
- LLM generates recommendation: "Deny employment due to theft conviction."
- **Problem:** This violates Fair Chance Act (individualized assessment required, not automatic disqualification)

**Mitigation:**

#### 8.4.1 Pre-Prompt Safety Guardrails

**System prompt for LLM:**

```
You are a compliance content generator for California employment law. 

CRITICAL RULES:
• NEVER recommend specific hiring/firing decisions
• NEVER auto-disqualify based on protected characteristics (race, gender, disability, criminal history without individualized assessment)
• ALWAYS cite specific CA statutes when referencing legal requirements
• If uncertain, output "NEEDS HUMAN REVIEW" flag

Your role: Generate TEMPLATES and GUIDANCE, not ADVICE.
```


#### 8.4.2 Human Review of High-Risk Content

**Flag for mandatory human review:**

- Any content related to:
    - Background checks / Fair Chance Act
    - Disability accommodation
    - Pregnancy accommodation
    - Termination procedures
    - Discipline (potential discrimination risk)

**SME checklist for these items:**

- [ ] No discriminatory language
- [ ] Individualized assessment process included (for background checks)
- [ ] Interactive process described (for accommodations)
- [ ] No automatic disqualifications based on protected class


#### 8.4.3 Transparency in AI Use

**Disclose to clients:**

```
HOW WE USE AI

RegAgent-CA uses AI (large language models) to:
✓ Scan legal sources for changes
✓ Generate draft policies from templates
✓ Summarize complex regulations

AI does NOT make final decisions. Every deliverable is reviewed and approved by a human subject matter expert.

We use AI as a tool, not a replacement for human judgment.
```


***

### 8.5 Liability Limits \& Insurance

**Potential liabilities:**

1. **Client gets cited by DLSE** for deficient policy we provided
    - Exposure: Client may sue us for negligence
2. **Employee sues client** claiming inadequate harassment training
    - Exposure: Client may join us as co-defendant ("RegAgent-CA provided training")
3. **Data breach** exposes employee PII
    - Exposure: CPRA penalties, client lawsuits

**Risk Management:**

#### 8.5.1 Contractual Limits (Terms of Service)

**Limitation of liability clause (draft):**

```
LIMITATION OF LIABILITY

RegAgent-CA's total liability for any claim arising from these services shall not exceed the amount paid by Client in the 12 months preceding the claim.

RegAgent-CA is NOT liable for:
• Indirect, consequential, or punitive damages
• Losses resulting from Client's failure to implement policies as recommended
• Losses resulting from Client's failure to consult legal counsel
• Third-party claims (e.g., employee lawsuits against Client)

DISCLAIMER OF WARRANTIES: Services provided "AS IS" without warranty of any kind. We do NOT guarantee legal compliance or protection from lawsuits.
```

**Indemnification (draft):**

```
Client agrees to indemnify RegAgent-CA against claims arising from:
• Client's misuse of materials
• Client's failure to customize content for their specific situation
• Client's failure to consult legal counsel before implementing policies
```


#### 8.5.2 Insurance

**Recommended coverage:**

- **Professional Liability (E\&O):** Covers negligence claims (e.g., "You gave us bad advice")
    - Typical cost: \$1k–\$3k/year for \$1M policy
    - Shop carriers: Hiscox, Insureon, NEXT Insurance
- **Cyber Liability:** Covers data breach incidents
    - Typical cost: \$500–\$2k/year for \$1M policy
- **General Liability:** Covers in-person training incidents (slip-and-fall, etc.)
    - Typical cost: \$500–\$1k/year

**Total insurance budget:** ~\$2k–\$6k/year

**Status:** Obtain E\&O insurance **before launch** (Phase 1 prerequisite).

***

## 9. Gap Analysis \& Open Questions

This section systematically identifies what's **decided**, **undecided**, and **missing** from the current plan.

### 9.1 Decisions Made (Confirmed)

**Business Model:**

- ✅ CA-focused (Southern California initially)
- ✅ SMB target (1–99 employees)
- ✅ Three-tier packaging (Text-Only, 6-Month, Quarterly)
- ✅ Pay-per-deliverable pricing (not monthly subscription)
- ✅ Human-in-the-loop governance (mandatory SME review)
- ✅ Narrow training scope (mandated only, no upsell bloat)

**Technical:**

- ✅ Python + FastAPI backend
- ✅ PostgreSQL database
- ✅ Git version control for content
- ✅ Stripe for payments
- ✅ S3 for file storage
- ✅ Email delivery (SendGrid or SES)

**Legal/Governance:**

- ✅ Position as "compliance content service," not legal advice
- ✅ Disclaimers on all materials
- ✅ Optional legal review upsell
- ✅ Audit logs and rollback capability

***

### 9.2 Open Questions \& Undecided Items

#### 9.2.1 Strategic Decisions

| Question | Options | Why It Matters | Status |
| :-- | :-- | :-- | :-- |
| **Which laws are definitively "core" vs "optional"?** | See Section 3 scope tiers | Determines MVP scope; affects pricing and delivery timelines | ⏳ **Unresolved** – Need to finalize with attorney input |
| **DIY delivery or hire trainers?** | Mario delivers all trainings vs hire W-2/1099 trainers | Scalability bottleneck; Mario's time is most valuable for SME review, not training delivery | ⏳ **Unresolved** – Start DIY, plan to hire by client \#10 |
| **Which verticals to target first?** | Dog grooming, salons, restaurants, clinics, retail, cannabis | Determines template development priorities; some verticals have unique hazards | ⏳ **Partially decided** – Start with "personal services" (grooming, salons); expand to restaurants/clinics in Phase 2 |
| **Local LLM or cloud LLM?** | Ollama (llama3-70b) vs OpenAI GPT-4 vs Anthropic Claude | Cost, privacy, quality tradeoff | ⏳ **Unresolved** – Prototype both; likely hybrid (local for scanning, cloud for complex drafting) |
| **Attorney partnership or pay-per-review?** | Retain attorney on monthly retainer vs pay per review | Predictable costs vs usage-based | ⏳ **Unresolved** – Start pay-per-review; consider retainer if >10 reviews/month |

#### 9.2.2 Operational Questions

| Question | Options | Why It Matters | Status |
| :-- | :-- | :-- | :-- |
| **Max clients before hiring help?** | Can Mario handle 10? 20? 50 clients solo? | Determines when to raise capital or bootstrap slower | ⏳ **Unresolved** – Estimate: 10–15 clients manageable solo with 20hrs/week; 20+ requires hire |
| **Training class size limits?** | Max attendees per session before splitting into multiple sessions | Affects pricing for large clients (50+ employees) | ⏳ **Unresolved** – Start with "no limit" for webinars; cap in-person at 30 |
| **How to handle urgent law changes mid-year?** | Email alert + free mini-update vs charge for urgent updates | Client expectation management; revenue vs service quality | ⏳ **Unresolved** – Lean toward "critical updates are free; non-critical wait until next deliverable" |
| **Quarterly updates scope definition (Package 3)?** | What constitutes a "mini-update" vs full rewrite? | Operational clarity; client expectation management | ⏳ **Unresolved** – Define threshold: "Mini = <5 policy edits; Full = >5 or new law requiring full IIPP/WVPP rewrite" |

#### 9.2.3 Technical Gaps

| Gap | Description | Impact | Priority |
| :-- | :-- | :-- | :-- |
| **Source watcher robustness** | Scrapers may break if CA websites change structure | Could miss law changes → compliance gap | 🔴 **High** – Build with monitoring/alerts; manual fallback |
| **LLM hallucination detection** | No automated way to catch when LLM invents a law citation | Could deliver inaccurate content → liability | 🔴 **High** – Human review catches most; add citation verification script (check cite exists in corpus) |
| **Backup/DR plan** | No formal backup and disaster recovery documented | Data loss risk | 🟡 **Medium** – Implement in Phase 1 (daily DB backups to S3, Git mirroring) |
| **Monitoring/alerting** | No uptime monitoring, error tracking, or performance metrics | Can't detect outages or bottlenecks | 🟡 **Medium** – Add Sentry + basic uptime monitoring in Phase 2 |
| **CI/CD pipeline** | No automated testing or deployment | Manual deployments = higher error risk | 🟢 **Low** – Acceptable for MVP; automate in Phase 2 |

#### 9.2.4 Legal/Compliance Gaps

| Gap | Description | Impact | Priority |
| :-- | :-- | :-- | :-- |
| **Attorney review of service model** | No CA employment attorney has reviewed UPL risk | Risk of regulatory action for UPL | 🔴 **High** – **Mandatory before launch** |
| **Attorney review of disclaimers** | Disclaimer language not vetted by attorney | May not be sufficient to limit liability | 🔴 **High** – **Before launch** |
| **E\&O insurance procurement** | Not yet obtained | No protection against negligence claims | 🔴 **High** – **Before launch** |
| **Terms of Service finalization** | Draft only; not attorney-reviewed | Unenforceable contract = higher liability | 🔴 **High** – **Before launch** |
| **Privacy policy for CPRA** | If collecting employee data, need privacy notice | Potential CPRA violation | 🟡 **Medium** – Draft in Phase 1; attorney review in Phase 1 |

#### 9.2.5 Market Validation Gaps

| Assumption | Needs Validation | How to Validate | Status |
| :-- | :-- | :-- | :-- |
| **SMBs will pay \$6k–\$8k/year** | True willingness-to-pay unknown | Pilot with 3–5 clients at proposed pricing; measure conversion and churn | ⏳ **Unvalidated** |
| **Webinars are sufficient (vs in-person)** | Do clients value in-person enough to pay +\$297? | Track in-person upsell take rate | ⏳ **Unvalidated** |
| **Year 2 discount drives retention** | Does 40% discount meaningfully improve renewal rate? | Measure Year 2 renewal rate (target >70%) | ⏳ **Unvalidated** |
| **Quarterly touchpoints reduce churn (Package 3)** | Does Package 3 have higher retention than Package 2? | Compare churn rates after 12–18 months | ⏳ **Unvalidated** |


***

### 9.3 Identified Gaps (Not Yet Addressed)

#### 9.3.1 Vertical-Specific Requirements

**Gap:** Each vertical (dog grooming, salon, restaurant, clinic, cannabis, retail) has unique hazards and regulations beyond core employment law.

**Examples:**

- **Restaurants:** Food handler permits, health inspections (county health dept)
- **Cannabis:** BCC (Bureau of Cannabis Control) track-and-trace, security requirements
- **Clinics:** HIPAA (if healthcare provider), OSHA bloodborne pathogens
- **Salons:** CA Board of Barbering \& Cosmetology licensing, chemical safety (formaldehyde in nail salons)

**Impact:** Generic "dog grooming" policies may not cover restaurant-specific items.

**Options:**

1. **Start generic; expand gradually:** Core employment law (harassment, IIPP, leaves) is universal. Add vertical-specific modules in Phase 2/3.
2. **Exclude highly regulated industries:** E.g., skip cannabis and clinics in MVP (too complex).
3. **Partner with vertical experts:** E.g., restaurant consultant, cannabis compliance firm (white-label partnership).

**Recommendation:** Start with **personal services verticals** (dog grooming, salons, general retail) where core CA employment law is 90% of compliance burden. Add restaurants and clinics in Phase 2 after establishing operational rhythm.

**Status:** ⏳ **Partially decided** – Focus on personal services MVP; document vertical expansion roadmap.

***

#### 9.3.2 Multi-Location / Multi-Jurisdiction Clients

**Gap:** Some SMBs operate in multiple cities/counties with varying local ordinances (e.g., business with locations in LA City, Pasadena, and Glendale).

**Challenge:**

- LA City sick leave: 48 hours
- Pasadena: State minimum (40 hours)
- Different minimum wages

**Current system assumption:** Single jurisdiction per client.

**Options:**

1. **Decline multi-location clients in MVP:** Keep it simple.
2. **Charge per location:** E.g., Package 2 pricing × number of locations with unique ordinances.
3. **Build multi-jurisdiction logic:** Client profile includes `locations: [ {city, ordinances}, ... ]`; system generates location-specific addenda.

**Recommendation:** **Decline or charge premium** for multi-location in MVP. Build multi-jurisdiction in Phase 2 if demand exists.

**Status:** ⏳ **Unresolved** – Default to single-location; note as future enhancement.

***

#### 9.3.3 Spanish-Language Content

**Gap:** Many SMB employees in Southern California are Spanish-speaking. CA requires some notices in Spanish if requested.

**Examples:**

- Wage Theft Prevention notice (Labor Code §2810.5): Must be provided in employee's language if Spanish, Chinese, Tagalog, Vietnamese, or Korean
- Training: Harassment training must be in language understood by employees

**Current plan:** English-only.

**Impact:** Excludes a large segment of target market.

**Options:**

1. **Phase 2 addition:** Translate policies and training materials to Spanish.
2. **Partner with bilingual trainer:** Mario delivers English; hire Spanish-speaking trainer for bilingual sessions.
3. **Use professional translation service:** Policies translated by certified translator; training materials subtitled or dubbed.

**Cost estimate:** ~\$0.10–\$0.20/word for professional translation; full policy pack (~20k words) = \$2k–\$4k one-time, then incremental for updates.

**Recommendation:** **English-only MVP**; add Spanish in Phase 2 once operational stability achieved. Market Phase 1 to English-speaking business owners; acknowledge Spanish as roadmap item.

**Status:** ⏳ **Unresolved** – Explicitly English-only for MVP; Spanish in Phase 2 roadmap.

***

#### 9.3.4 EEO-1 Reporting \& Other Federal Triggers

**Gap:** Some clients may cross federal thresholds (e.g., 15 employees triggers Title VII; 50 employees triggers FMLA; 100 employees triggers EEO-1 reporting).

**Current scope:** Focused on CA state law; federal is secondary.

**Options:**

1. **Add federal compliance module:** Separate "Federal Compliance Add-On" for 15+ or 50+ employee clients.
2. **Refer out:** "For federal compliance (FMLA, EEO-1), we recommend [partner firm]."
3. **Stay CA-only:** Target 1–49 employees where federal is less burdensome.

**Recommendation:** **CA-focus with federal basics covered** (e.g., I-9, FLSA overtime, ADA). Don't deeply cover FMLA (CA has CFRA which is broader) or EEO-1 (out of typical SMB scope). Refer clients with 50+ or 100+ employees to HR firms with federal expertise.

**Status:** ⏳ **Partially decided** – Federal basics yes; deep federal no.

***

### 9.4 Risk Register

| Risk | Likelihood | Impact | Mitigation | Owner |
| :-- | :-- | :-- | :-- | :-- |
| **UPL accusation** | Low (if disclaimers strong) | 🔴 Critical (business shutdown) | Attorney review of model; strong disclaimers; E\&O insurance | Mario |
| **LLM generates inaccurate policy** | Medium | 🟡 High (client harm, lawsuit) | Mandatory human review; citation verification script | Mario |
| **Client gets DLSE citation despite our service** | Medium | 🟡 High (reputation damage, churn) | Limitation of liability in ToS; insurance; improve content quality | Mario |
| **Key person risk (Mario is only SME)** | High (single founder) | 🟡 High (operational stoppage) | Hire backup SME reviewer by client \#10; document all processes | Mario |
| **Market validation failure (no demand at price point)** | Medium | 🟡 High (no revenue) | 3–5 pilot clients before heavy investment; willingness to adjust pricing | Mario |
| **Competitor launches similar service** | Low (currently no direct competitor) | 🟢 Medium (pricing pressure) | Speed to market; build reputation; lock in clients with Year 2 discounts | Mario |
| **CA passes major law overhaul mid-year** | Low | 🟡 High (urgent content update required) | Reserve capacity for urgent updates; charge large clients premium for emergency updates | Mario |


***

## 10. Roadmap \& Phasing Plan

### 10.1 Phase 0: Discovery \& Prototype (Weeks 0–4)

**Goal:** Validate technical feasibility and build minimal working prototype.

**Key Deliverables:**

1. **Source Watcher MVP:**
    - Python scraper for 3 key sources (CA Labor Code, Cal/OSHA Title 8, LA County ordinances)
    - Daily cron job → Git snapshots
    - Manual diff review (no automation yet)
2. **Obligation Mapper Prototype:**
    - Hardcoded rules for 5 core laws (SB 1343 harassment, SB 553 WVPP, Title 8 §3203 IIPP, Labor Code §1030 lactation, Labor Code §246 sick leave)
    - Manual client profiling (no LLM yet)
3. **Policy Authoring Prototype:**
    - Create 5 policy templates for "dog grooming" vertical
    - Manual variable filling (name, employee count, etc.)
    - Store in Git
4. **Human Review UI (Mockup):**
    - Paper prototype or Figma mockup (no code)
    - Validate review workflow with Mario

**Success Criteria:**

- Scraper runs successfully for 1 week without crashing
- 5 policy templates created and approved by Mario
- Workflow documented end-to-end

**Team:**

- Mario (solo; 20 hours/week)

**Budget:**

- \$0 (time only)

***

### 10.2 Phase 1: MVP \& Pilot (Weeks 5–12)

**Goal:** Onboard 3–5 pilot clients; deliver first packs; validate pricing and service quality.

**Key Deliverables:**

1. **Core System Build:**
    - FastAPI backend (modules: client management, content generation, pack builder)
    - PostgreSQL database setup
    - Stripe integration (basic: one-time payments)
    - Admin UI (lightweight; FastAPI + HTML templates or React basics)
2. **Content Library:**
    - 12 policy templates for "dog grooming" vertical
    - 4 training slide decks (harassment, WVPP, IIPP, HazCom)
    - Certificate template (reportlab PDF generation)
    - 8 poster/notice templates
3. **Pilot Client Acquisition:**
    - Recruit 3–5 clients via:
        - Personal network (Pasadena area business owners)
        - Local chamber of commerce
        - LinkedIn outreach
    - Offer **50% discount** for pilot participation (\$3,900 → \$1,950 for Package 2 Year 1)
    - In exchange: feedback, testimonials, referrals
4. **Training Delivery:**
    - Mario delivers 3–5 webinar sessions (4–5 hours each)
    - Track attendance, generate certificates manually (if PDF automation not ready)
    - Collect feedback on content quality and pace
5. **Legal Setup:**
    - Consult CA employment attorney (2-hour session: \$600–\$1,200)
        - Review business model for UPL risk
        - Review disclaimers
        - Review Terms of Service draft
    - Obtain E\&O insurance ($1k–$
