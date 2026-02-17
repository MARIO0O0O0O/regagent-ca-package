# RegAgent CA — California Employer Compliance Platform
## Repository Structure

> These materials are compliance resources for educational purposes only.
> They do not constitute legal advice. Employers should consult qualified
> legal counsel for guidance specific to their situation.

---

## Repository Map

```
regagent-ca-package/
│
├── COMPLIANCE_RESOURCES/       ← Structured compliance packages (1–∞)
│   ├── manifest.json           ← Package index (web app source of truth)
│   ├── README.md
│   ├── 1_HARASSMENT_PREVENTION/
│   ├── 2_WORKPLACE_VIOLENCE_PREVENTION/
│   ├── 3_IIPP_SAFETY/
│   ├── 4_LEAVE_MANAGEMENT/
│   ├── 5_WAGE_HOUR/
│   ├── 6_REQUIRED_POSTINGS/
│   └── [future packages...]
│
├── ADDITIONAL_RESOURCES/       ← Customer-facing content library (1–∞)
│   ├── manifest.json           ← Content section index
│   ├── README.md
│   ├── 1_BLOG/
│   ├── 2_HOW_TO_GUIDES/
│   ├── 3_COMPLIANCE_ALERTS/
│   ├── 4_CHECKLISTS/
│   ├── 5_CASE_STUDIES/
│   ├── 6_FAQ/
│   ├── 7_GLOSSARY/
│   ├── 8_WEBINAR_CONTENT/
│   ├── 9_EMPLOYER_GUIDES/
│   └── 10_TEMPLATES/
│
└── KNOWLEDGE_BASE/             ← Source reference library (not customer-facing)
    ├── README.md
    ├── I_POLICIES/
    ├── II_TRAINING/
    ├── III_FORMS/
    ├── IV_POSTING_REQUIREMENTS/
    ├── V_RECORDKEEPING/
    ├── VI_CLIENT_EXAMPLES/
    └── VII_LEGAL_REFERENCES/
```

---

## Section Overview

### COMPLIANCE_RESOURCES
Structured compliance packages for California employers. Each package contains
a policy document, forms, training materials, quick-reference tools, and a
recordkeeping guide — all with full California statutory citations.

Each package includes `manifest.json` for web app integration and `CHANGELOG.md`
for version tracking.

### ADDITIONAL_RESOURCES
Educational and marketing content that supports employer compliance without
constituting legal advice. Includes blog articles, how-to guides, compliance
alerts, checklists, case studies, FAQ, glossary, webinar content, employer
guides, and reusable templates.

Designed as the customer-facing content layer for the web application.

### KNOWLEDGE_BASE
The foundational research archive. Contains prior-generation policy drafts,
legal reference documents, training materials, and client examples that
inform package development. Internal use only — not surfaced in the web app.

---

## Web App Integration

The web application reads `manifest.json` files as its source of truth:

| File | Purpose |
|------|---------|
| `COMPLIANCE_RESOURCES/manifest.json` | Package index — IDs, versions, laws, assets |
| `COMPLIANCE_RESOURCES/N_PACKAGE/manifest.json` | Individual package metadata |
| `ADDITIONAL_RESOURCES/manifest.json` | Content section index with display config |

### Key Design Decisions
- **Package IDs are slugs** (`harassment-prevention`) — safe for URL routing and DB keys
- **Asset paths are relative** to package root — portable across environments
- **Employer size thresholds** are queryable — enables "show me what applies to my 23-person company"
- **Tags are consistent** across packages and content — enables cross-linking
- **Knowledge Base is private** — no public routes should expose KB paths

---

## Compliance Package Roadmap

| # | Package | Status |
|---|---------|--------|
| 1 | Harassment Prevention | ✅ Current (v2.0) |
| 2 | Workplace Violence Prevention | ✅ Current (v1.0) |
| 3 | IIPP & Safety | ✅ Current (v1.0) |
| 4 | Leave Management | ✅ Current (v1.0) |
| 5 | Wage & Hour | ✅ Current (v1.0) |
| 6 | Required Postings | ✅ Current (v1.0) |
| 7 | Personnel Records | 🔲 Planned |
| 8 | Independent Contractor Compliance | 🔲 Planned |
| 9 | Pay Equity & Transparency | 🔲 Planned |
| 10 | Termination & Separation | 🔲 Planned |

---

*Repository maintained by RegAgent | Last updated: February 2026*
*California law changes annually. All content reviewed each January.*
