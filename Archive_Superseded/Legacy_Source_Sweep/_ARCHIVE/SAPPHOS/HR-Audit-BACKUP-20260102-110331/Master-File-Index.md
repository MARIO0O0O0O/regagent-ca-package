---
tags: [index, registry]
---

# 📑 Master File Index

**Auto-Generated:** \= date(now)\

---

## 📊 File Statistics

### Total Files in Vault
\\\dataview
TABLE WITHOUT ID
  ("Total Files: " + length(rows)) AS Count
FROM ""
WHERE file.name != "Master-File-Index"
GROUP BY true
\\\

### Files by Folder
\\\dataview
TABLE WITHOUT ID
  file.folder AS "Folder",
  length(rows) AS "File Count"
FROM ""
GROUP BY file.folder
SORT file.folder ASC
\\\

---

## 📁 Employee Files

### Scanned Documents
\\\dataview
LIST
FROM "02-EMPLOYEE-FILES/Scanned-Documents"
SORT file.name ASC
\\\

### Findings Reports
\\\dataview
LIST
FROM "05-FINDINGS-REPORTS/Individual-Reports"
SORT file.name ASC
\\\

---

## 📚 Policy Library

### Required Policies
\\\dataview
LIST
FROM "03-POLICY-LIBRARY/Required-Policies"
SORT file.name ASC
\\\

### Recommended Policies
\\\dataview
LIST
FROM "03-POLICY-LIBRARY/Recommended-Policies"
SORT file.name ASC
\\\

---

## 📖 Research & Compliance

### Federal Law Research
\\\dataview
LIST
FROM "04-COMPLIANCE-RESEARCH/Federal-Law"
SORT file.name ASC
\\\

### California State Law Research
\\\dataview
LIST
FROM "04-COMPLIANCE-RESEARCH/California-State"
SORT file.name ASC
\\\

---

**Index Updates Automatically**
