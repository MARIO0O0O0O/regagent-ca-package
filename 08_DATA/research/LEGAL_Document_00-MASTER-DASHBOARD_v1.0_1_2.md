---
cssclass: dashboard
tags: [dashboard, home]
---

# 🏠 HR AUDIT MASTER DASHBOARD

**Today:** \= date(today)\

---

## 🎯 Quick Stats

<div style="display: flex; justify-content: space-around; text-align: center;">
<div><h2>⚪</h2><p><strong>Files Scanned</strong></p><p>0 / 47</p></div>
<div><h2>⚪</h2><p><strong>Files Reviewed</strong></p><p>0 / 47</p></div>
<div><h2>⚪</h2><p><strong>Health Score</strong></p><p>0%</p></div>
<div><h2>🔴</h2><p><strong>Critical Gaps</strong></p><p>TBD</p></div>
</div>

---

## 📊 Project Timeline

See: [[PROJECT-CHARTER|Full 23-Day Schedule]]

**Days Remaining:** [Calculate from 12/17/25]

---

## 🔥 Today's Priorities

- [ ] [Add today's tasks here]

---

## 📁 Recent Files

\\\dataview
TABLE WITHOUT ID
  file.link AS "File",
  file.ctime AS "Uploaded"
FROM "02-EMPLOYEE-FILES"
SORT file.ctime DESC
LIMIT 5
\\\

---

## 🎯 Quick Links

### Planning
- [[PROJECT-CHARTER|📋 23-Day Project Charter]]
- [[Health-Score-Tracker|📊 Health Dashboard]]
- [[PLUGIN-INSTALLATION-GUIDE|🔌 Plugin Setup]]

### Employee Files
- [[02-EMPLOYEE-FILES/Personnel-Jackets/|👤 Personnel Jackets]]
- [[02-EMPLOYEE-FILES/Confidential-Medical/|🏥 Medical Files]]
- [[02-EMPLOYEE-FILES/I-9-Files/|📄 I-9 Files]]

### Policy Library
- [[03-POLICY-LIBRARY/Required-Policies/|⚖️ Required Policies]]
- [[03-POLICY-LIBRARY/Policy-Tracking/|✅ Policy Tracker]]

### Reports
- [[05-FINDINGS-REPORTS/Individual-Reports/|📄 Individual Reports]]
- [[05-FINDINGS-REPORTS/Summary-Reports/|📊 Summary Reports]]

---

**Last Updated:** \= date(now)\

