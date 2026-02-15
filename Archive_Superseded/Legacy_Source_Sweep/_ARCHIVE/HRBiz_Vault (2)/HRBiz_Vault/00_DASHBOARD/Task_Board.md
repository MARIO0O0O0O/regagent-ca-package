---
title: Task Board - Sprint Planning
created: 2026-02-07
tags: [tasks, project-management, kanban]
---

# ✅ HRBiz Task Board - Sprint Planning

> **Current Sprint:** Week of Feb 7-14, 2026  
> **Goal:** Repository selection + Firebase setup + Initial customization

---

## 🎯 THIS WEEK (Feb 7-14)

### 🔥 CRITICAL - DO TODAY
- [ ] **Repository Decision:** Choose NJS-Firebase-SaaS (free) vs Makerkit ($299)
  - Read full reconnaissance report
  - Review NJS-Firebase-SaaS on GitHub
  - Review Makerkit pricing page
  - Make final decision
  - 📝 Document decision in [[05_NOTES/Daily_Notes/2026-02-07]]

### 🚀 HIGH PRIORITY - This Week
- [ ] **Firebase Setup**
  - [ ] Create Firebase project "HRBizLMS" at console.firebase.google.com
  - [ ] Enable Firestore database
  - [ ] Enable Authentication (Email/Password)
  - [ ] Enable Storage
  - [ ] Copy Firebase config credentials
  - [ ] Save credentials securely
  
- [ ] **Repository Clone**
  - [ ] Clone chosen repository
  - [ ] Run `npm install`
  - [ ] Create `.env.local` with Firebase credentials
  - [ ] Test local dev server (`npm run dev`)
  - [ ] Verify authentication flow works

- [ ] **Initial Customization**
  - [ ] Review existing code structure
  - [ ] Plan multi-tenant architecture additions
  - [ ] Create Firestore schema document
  - [ ] Test Firebase connection

---

## 📋 BACKLOG (Next 2-3 Weeks)

### Software Development
- [ ] Build multi-tenant company structure
  - [ ] Create `/companies` collection
  - [ ] Create `/employees` collection  
  - [ ] Create `/training_sessions` collection
  - [ ] Implement company onboarding wizard
  - [ ] Build employee roster UI

- [ ] Training Scheduler
  - [ ] Create training session form
  - [ ] Build calendar view
  - [ ] Implement employee assignment
  - [ ] Add email notifications

- [ ] Certificate Generator
  - [ ] Install jsPDF library
  - [ ] Design certificate template
  - [ ] Build certificate generation function
  - [ ] Implement certificate download
  - [ ] Add certificate storage (Firebase Storage)

- [ ] Compliance Dashboard
  - [ ] Build company compliance overview
  - [ ] Add program status indicators
  - [ ] Create employee completion tracking
  - [ ] Build renewal reminder system

### Content Generation
- [ ] Generate Workplace Violence Prevention materials
  - [ ] Use content prompt with AI tool
  - [ ] Review and customize for LA market
  - [ ] Save to vault `02_ARTIFACTS/Training_Materials/`

- [ ] Generate IIPP training materials
  - [ ] Create content generation prompt
  - [ ] Generate all deliverables
  - [ ] Review for Cal/OSHA compliance

- [ ] Generate Heat Illness Prevention materials
  - [ ] Create content generation prompt
  - [ ] Focus on outdoor worker industries
  - [ ] Tailor for LA climate

### Client Delivery
- [ ] Button Nose Grooming Onboarding
  - [ ] Schedule kickoff call
  - [ ] Collect employee roster (50 employees)
  - [ ] Upload employees to HRBizLMS
  - [ ] Customize WVPP for grooming industry
  - [ ] Schedule training sessions
  - [ ] Send contract/invoice ($7,000)

---

## ✅ COMPLETED TASKS

### Content Creation (DONE ✅)
- [x] Harassment Prevention training materials (8 deliverables)
  - [x] Facilitator Guide (Supervisor + Employee versions)
  - [x] Training presentations
  - [x] Certificate templates
  - [x] Attendance rosters
  - [x] Implementation guide
  - [x] Harassment Prevention Policy template
  - [x] Complaint form
  - [x] Investigation checklist

- [x] Workplace Violence Prevention content prompt
  - [x] Full deliverable specifications (8 items)
  - [x] SB 553 compliance requirements
  - [x] WVPP template structure
  - [x] Violent incident log format

### Software Planning (DONE ✅)
- [x] HRBizLMS v1.0 blueprint (harassment-only)
  - [x] Database schema design
  - [x] UI component specifications
  - [x] Cloud Functions architecture
  - [x] Deployment strategy

- [x] HRBizLMS v2.0 blueprint (multi-program)
  - [x] Program-agnostic architecture
  - [x] Updated database schema
  - [x] Multi-program dashboard design
  - [x] Pricing strategy (bundles + retainers)

### Research (DONE ✅)
- [x] Repository reconnaissance (8 repos analyzed)
  - [x] NJS-Firebase-SaaS-Boilerplate (MIT License) ⭐
  - [x] Makerkit ($299, production-grade)
  - [x] 6 other alternatives evaluated
  - [x] Feature comparison matrix
  - [x] ROI analysis
  - [x] Quick-start guide

---

## 📅 UPCOMING SPRINTS

### Sprint 2 (Feb 14-21): Core Development
- Multi-tenant architecture implementation
- Training scheduler MVP
- Certificate generation prototype

### Sprint 3 (Feb 21-28): Features & Testing
- Compliance dashboard
- Email notifications
- Testing with sample data

### Sprint 4 (Feb 28-Mar 7): Production Deploy
- Deploy to Vercel + Firebase
- Security hardening
- Performance optimization

### Sprint 5 (Mar 7-14): Client Delivery
- Button Nose Grooming onboarding
- First training delivery
- Collect $7,000 payment 💰

---

## 🎯 MILESTONES

| Milestone | Target Date | Status |
|-----------|-------------|--------|
| Repository chosen | Feb 7 | 🔄 In Progress |
| Firebase configured | Feb 9 | ⏳ Queued |
| Dev environment running | Feb 10 | ⏳ Queued |
| Multi-tenant architecture | Feb 21 | ⏳ Queued |
| Certificate generation | Feb 25 | ⏳ Queued |
| Production deployment | Mar 7 | ⏳ Queued |
| Button Nose onboarded | Mar 10 | ⏳ Queued |
| First payment received | Mar 14 | ⏳ Queued |

---

## 📊 SPRINT VELOCITY TRACKING

### Week 1 (Feb 7-14)
- **Planned Tasks:** 8
- **Completed:** _[Update daily]_
- **Velocity:** _[Calculate end of week]_

### Week 2 (Feb 14-21)
- **Planned Tasks:** TBD
- **Completed:** TBD
- **Velocity:** TBD

---

## 🚧 BLOCKERS & RISKS

### Current Blockers
- None identified (Feb 7)

### Risks
- **Repository Decision Delay:** Choose quickly to avoid losing momentum
  - **Mitigation:** Set deadline of TODAY for decision
  
- **Firebase Learning Curve:** May slow initial development
  - **Mitigation:** Use Firebase documentation + AI assistance
  
- **Multi-Tenancy Complexity:** Could take longer than estimated
  - **Mitigation:** Consider Makerkit if timeline slips

---

## 💡 NOTES

### Decision Log
- **2026-02-07:** Created task board, vault structure, project management system

### Resources Needed
- Firebase project quota (free tier should suffice)
- Vercel account (free tier)
- Stripe account (optional, for later)

---

**Last Updated:** 2026-02-07  
**Sprint Goal:** Repository + Firebase + Dev Environment

*Navigate: [[00_START_HERE|Dashboard]] | [[Project_Roadmap|Roadmap]] | [[Revenue_Tracker|Revenue]]*
