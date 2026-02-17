# Prompt for Gemini in Firebase Studio

**Copy this entire prompt into Gemini in Firebase Studio to guide the development:**

---

# 🎯 Project Mission: HRBizLMS - California Compliance Training Platform

## Executive Summary

I'm building **HRBizLMS**, a multi-tenant B2B SaaS platform for delivering California employment law compliance training to small-to-medium businesses (1-99 employees) in the Los Angeles metro area. I need your help cloning and adapting an open-source Next.js + Firebase SaaS starter kit to create a production-ready compliance training platform.

---

## 📋 Project Context

### Business Model
- **Target Market:** LA-area businesses (salons, restaurants, retail, services)
- **Company Size:** 1-99 employees per client
- **Service:** Mandatory California compliance training delivery
- **Revenue Model:** [AMOUNT] initial setup + optional [AMOUNT]/mo retainer
- **First Client:** [COMPANY NAME] (50 employees, [AMOUNT] contract, delivery [EFFECTIVE DATE])

### Current Status
- ✅ Content complete for Harassment Prevention Program (12 deliverables)
- ✅ Content prompts ready for 3 additional programs
- ✅ Business vault deployed to GitLab: https://gitlab.com/marioo00/hrbiz-vault
- ✅ Firebase project ready to create
- 🔄 Platform development starting NOW

---

## 🎯 Technical Foundation

### Source Repository to Clone
**GitHub:** https://github.com/Saas-Starter-Kit/Saas-Starter-Kit.git

**Why this repo:**
- Next.js 14 + Firebase architecture
- Multi-tenant workspace structure (perfect for B2B)
- Authentication & authorization built-in
- Stripe integration for subscriptions
- MIT License (fully customizable)
- Production-ready patterns

### Content Source (My Business Vault)
**GitLab:** https://gitlab.com/marioo00/hrbiz-vault

**Vault Structure:**
```
/00_DASHBOARD/           # Project management
/01_PROJECTS/            # Active programs
/02_ARTIFACTS/           # Training materials
  /Training_Materials/   # Presentations, guides
  /Policies_Plans/       # Policy templates
  /Forms_Templates/      # Forms, certificates
/03_CLIENTS/             # Client files
/04_RESEARCH/            # Compliance research
```

**Key Content Files (Already Complete):**
- Harassment Prevention Facilitator Guide
- Harassment Prevention Training Presentation
- Certificate Templates
- Attendance Rosters
- Harassment Prevention Policy Template
- Complaint Forms
- Investigation Checklists

---

## 🏗️ Platform Architecture Requirements

### Phase 1: Harassment Prevention Program (MVP - [EFFECTIVE DATE])

**Core Entities:**

1. **Companies (Tenants)**
   - Company profile (name, industry, employee count)
   - Admin users (HR managers, owners)
   - Billing information
   - Active programs (which trainings they purchased)
   - Compliance status dashboard

2. **Employees**
   - Belongs to one company
   - Basic profile (name, email, department, role)
   - Training assignments
   - Completion status
   - Certificates earned
   - Login credentials (optional - can use magic links)

3. **Training Programs**
   - Program type: "Harassment Prevention", "Workplace Violence", "IIPP", "Heat Illness"
   - Content modules (slides, videos, documents)
   - Quiz questions (10 per program)
   - Passing score (80%)
   - Certificate template
   - Annual renewal requirement

4. **Training Sessions**
   - Assigned to employee
   - Program type
   - Status: Not Started / In Progress / Completed / Failed
   - Start date, completion date
   - Quiz attempts & scores
   - Certificate issued (yes/no)

5. **Certificates**
   - Employee name
   - Program completed
   - Completion date
   - Unique certificate ID
   - PDF generation
   - Downloadable & emailable

### Multi-Tenant Isolation (Critical!)

**Firestore Structure:**
```
/companies/{companyId}
  - name, industry, employeeCount, createdAt, status
  
/companies/{companyId}/employees/{employeeId}
  - name, email, role, department, status
  
/companies/{companyId}/trainingSessions/{sessionId}
  - employeeId, programType, status, scores, completedAt
  
/companies/{companyId}/certificates/{certificateId}
  - employeeId, programType, issuedAt, certificateNumber
  
/programs/{programId}
  - type, title, description, modules, questions, passingScore
```

**Security Rules:**
- Companies can ONLY see their own data
- Employees can ONLY see their assigned trainings
- Admins can see all company data
- Super admin (me) can see everything

---

## 🎨 User Interface Requirements

### Company Admin Portal

**Dashboard:**
- Employee roster (name, assigned trainings, completion %)
- Compliance overview (% of employees compliant per program)
- Upcoming renewals (annual recertification alerts)
- Recent activity feed

**Employee Management:**
- Add/import employees (CSV upload)
- Assign training programs
- View individual employee progress
- Resend training links
- Download completion reports

**Training Assignment:**
- Select program(s) to assign
- Assign to individuals or bulk assign
- Set deadlines (optional)
- Send email invitations with magic links

**Reporting:**
- Compliance status report (exportable PDF)
- Employee completion list
- Certificate downloads (batch)
- Training history

### Employee Portal

**Landing Page:**
- Welcome message
- Assigned trainings list
- Completion status for each
- Earned certificates

**Training Flow:**
1. Click "Start Training"
2. View training presentation (embedded slides or video)
3. Read policy documents (accordion or tabs)
4. Complete quiz (10 multiple choice questions)
5. View results (pass/fail, score)
6. Download certificate (if passed)
7. Retake option (if failed)

**Certificate Display:**
- Professional PDF with company branding
- Employee name, program type, date
- Unique certificate ID
- Download & email options

---

## 🔥 Firebase Configuration

### Services to Enable

1. **Authentication:**
   - Email/Password for admins
   - Magic Links for employees (passwordless)
   - Custom claims for roles (admin, employee)

2. **Firestore Database:**
   - Multi-tenant collections structure (outlined above)
   - Security rules for tenant isolation
   - Composite indexes for queries

3. **Storage:**
   - Training content (PDFs, videos, images)
   - Certificate PDFs
   - Company logos
   - Structure: `/companies/{companyId}/...`

4. **Cloud Functions:**
   - Certificate PDF generation (on training completion)
   - Welcome emails (new employee added)
   - Training reminder emails (optional)
   - Quiz auto-grading
   - Certificate email delivery

5. **Hosting (Optional):**
   - Deploy admin portal
   - Deploy employee portal
   - Custom domain setup

---

## 📝 Step-by-Step Implementation Guide I Need

### Part 1: Repository Setup & Customization

**Please provide:**

1. **Clone & Initial Setup:**
   - Commands to clone Saas-Starter-Kit to my local environment
   - How to remove their Git history and initialize my own
   - How to rename "workspace" references to "company"
   - How to restructure for B2B multi-tenant (not per-user workspaces)

2. **Firebase Integration:**
   - How to configure Firebase credentials
   - Environment variables needed
   - How to adapt their Firebase setup to my schema
   - Security rules for multi-tenant isolation

3. **Dependencies & Configuration:**
   - Which dependencies to add for:
     - PDF generation (certificates)
     - CSV import (employee bulk upload)
     - Email sending (training invitations)
     - Quiz functionality
   - Next.js configuration adjustments
   - Tailwind/UI customizations for compliance theme

### Part 2: Core Feature Implementation

**Please provide code/guidance for:**

1. **Company Onboarding Flow:**
   - New company registration form
   - Admin user creation
   - Company profile setup
   - Initial employee import (CSV or manual)

2. **Employee Management:**
   - Employee roster UI component
   - Add employee form
   - CSV import function
   - Bulk actions (assign training, send invites)

3. **Training Module System:**
   - Content management (how to upload/organize training materials from GitLab vault)
   - Training viewer component (for slides/PDFs)
   - Progress tracking
   - Module completion logic

4. **Quiz Engine:**
   - Quiz question schema (Firestore)
   - Quiz UI component (multiple choice)
   - Auto-grading logic
   - Pass/fail determination (80% threshold)
   - Retry logic (if failed)

5. **Certificate Generation:**
   - PDF template design (professional, branded)
   - Dynamic data insertion (name, date, program)
   - Cloud Function trigger (on quiz pass)
   - Storage & retrieval
   - Email delivery

6. **Admin Dashboard:**
   - Compliance overview widgets
   - Employee completion charts
   - Recent activity feed
   - Quick actions (assign training, view reports)

### Part 3: Content Integration from GitLab

**Please guide me on:**

1. **Connecting to GitLab Vault:**
   - How to programmatically access my GitLab repository content
   - Authentication (personal access token)
   - Reading markdown/PDF files from vault

2. **Training Content Structure:**
   - How to convert my facilitator guides to training modules
   - How to embed presentations (Google Slides links or uploaded PDFs)
   - How to structure quiz questions in Firestore
   - How to link policy templates to trainings

3. **Content Management:**
   - Admin interface to update training content
   - Markdown rendering for policy documents
   - Media upload (images, PDFs)
   - Version control (track content changes)

### Part 4: Deployment & Testing

**Please provide:**

1. **Development Environment:**
   - How to run locally (Termux on Android or Project IDX)
   - Hot reload setup
   - Firebase emulators for testing
   - Debugging tips

2. **Production Deployment:**
   - Vercel deployment steps
   - Firebase Hosting alternative
   - Environment variables for production
   - Custom domain setup (hrbiz.org)

3. **Testing Strategy:**
   - How to test with dummy data
   - Multi-tenant isolation verification
   - Security testing
   - Performance optimization

---

## 🎯 Phased Rollout Plan

### Phase 1: Harassment Prevention (MVP) - [EFFECTIVE DATE]

**Must-Have Features:**
- ✅ Company & employee management
- ✅ Harassment Prevention training delivery
- ✅ Quiz (10 questions, 80% pass)
- ✅ Certificate generation & download
- ✅ Basic admin dashboard
- ✅ Employee training portal

**Content:**
- Harassment Prevention Facilitator Guide → Training modules
- Training Presentation → Embedded viewer
- Policy Template → Downloadable PDF
- 10 quiz questions based on content
- Certificate template (professional design)

**Delivery Target:** [COMPANY NAME] (50 employees) by [EFFECTIVE DATE]

### Phase 2: Workplace Violence Prevention - April 2026

**Add:**
- Workplace Violence Prevention Program module
- Additional quiz questions
- Violence-specific certificate template
- Incident reporting form (bonus feature)

### Phase 3: IIPP (Injury & Illness Prevention) - May 2026

**Add:**
- IIPP training module
- Safety checklist integration
- Hazard reporting feature

### Phase 4: Heat Illness Prevention - June 2026

**Add:**
- Heat Illness training (outdoor workers focus)
- Temperature-based reminders (seasonal)
- Mobile-optimized for field workers

---

## 🛠️ Technical Constraints & Preferences

### Development Environment
- **Primary:** Samsung S24 Ultra using Termux
- **Alternative:** Google Project IDX (browser-based)
- **Editor:** WindSurf (AI pair programming)
- **Git:** GitLab (already using)
- **Deployment:** Vercel (preferred) or Firebase Hosting

### Stack Preferences
- **Frontend:** Next.js 14 (App Router)
- **UI Library:** shadcn/ui + Tailwind CSS
- **Backend:** Firebase (Auth, Firestore, Storage, Functions)
- **PDF Generation:** jsPDF or similar
- **Email:** Firebase Extensions or SendGrid
- **Payments:** Stripe (already in starter kit)

### Design Preferences
- **Theme:** Professional, compliance-focused (navy/gray/white)
- **Mobile-first:** Many employees will access on phones
- **Accessibility:** WCAG 2.1 AA compliance
- **Branding:** Clean, trustworthy, government-adjacent aesthetic

---

## 💰 Business Context (Important!)

### Pricing Model
- **Initial Setup:** [AMOUNT] per client (includes all programs + 1 year)
- **Optional Retainer:** [AMOUNT]/month (updates, support, additional trainings)
- **Target:** 15 clients in 2026 = [AMOUNT] revenue

### Why This Matters for Development
- **Multi-tenant is critical:** Each client sees ONLY their data
- **White-label capable:** May rebrand for larger clients
- **Scalable:** Need to handle 15 companies × 50-100 employees = 750-1,500 users
- **Compliance-grade:** Data security, audit trails, SOC 2 aspirations
- **Low-touch:** Admins should self-serve, minimal support needed

---

## 🎯 Success Criteria

By [EFFECTIVE DATE], the platform should:
- ✅ Allow me to create [COMPANY NAME] company account
- ✅ Import 50 employees via CSV
- ✅ Assign Harassment Prevention training to all 50
- ✅ Send training invitation emails automatically
- ✅ Employees can complete training + quiz on mobile
- ✅ Auto-generate certificates on quiz pass (80%+)
- ✅ Admin dashboard shows completion progress
- ✅ Export compliance report (PDF)

**Measurement:**
- 50 employees trained by March 14
- [AMOUNT] payment collected
- Zero data leakage between tenants
- < 2 hours support time needed
- Platform ready for client #2 immediately

---

## 📚 Resources You Can Reference

### My Content (GitLab Vault)
- **Facilitator Guides:** Detailed training scripts
- **Presentations:** Ready-to-use training slides
- **Policies:** Template documents
- **Forms:** Complaint forms, investigation checklists
- **Certificates:** Template designs

### Source Repository
- **GitHub:** https://github.com/Saas-Starter-Kit/Saas-Starter-Kit.git
- **Documentation:** Review their README, architecture docs
- **Existing Features:** Auth, billing, multi-tenant workspaces

### Technical Docs
- **Next.js 14:** https://nextjs.org/docs
- **Firebase:** https://firebase.google.com/docs
- **shadcn/ui:** https://ui.shadcn.com
- **Vercel:** https://vercel.com/docs

---

## 🚨 Critical Requirements (Non-Negotiable)

1. **Data Isolation:** Companies CANNOT see each other's data (multi-tenant security)
2. **Mobile-First:** Must work perfectly on phones (many employees don't have computers)
3. **Certificate Legitimacy:** Certificates must look professional & include unique IDs
4. **Audit Trail:** Track who completed training when (compliance requirement)
5. **Email Delivery:** Automated training invites & certificate delivery
6. **CSV Import:** Bulk employee upload (HR people work in Excel)
7. **Offline-Friendly:** Training content should load fast, cache well

---

## 🎯 What I Need From You (Gemini)

### Immediate (This Weekend)
1. **Step-by-step cloning guide:**
   - Commands to clone repo
   - How to set up Firebase
   - Initial customization roadmap

2. **Architecture adaptation:**
   - How to transform "workspaces" to "companies"
   - Schema design for my use case
   - Security rules for multi-tenancy

3. **Quick start guide:**
   - Get dev server running
   - Test authentication
   - Create first company & employee

### Week 1 (Feb 8-14)
1. **Core entity implementation:**
   - Company model & UI
   - Employee model & UI
   - Training program structure

2. **Basic training flow:**
   - Content upload/organization
   - Training viewer component
   - Progress tracking

### Week 2-3 (Feb 15-28)
1. **Quiz engine:**
   - Question management
   - Quiz UI
   - Auto-grading
   - Pass/fail logic

2. **Certificate system:**
   - PDF template
   - Generation function
   - Storage & retrieval
   - Email delivery

### Week 4 (Mar 1-7)
1. **Admin dashboard:**
   - Employee roster
   - Completion tracking
   - Reporting

2. **Polish & testing:**
   - Mobile optimization
   - Security testing
   - Performance tuning

3. **Production deployment:**
   - Deploy to Vercel
   - Configure custom domain
   - Set up monitoring

---

## 💡 Specific Questions to Answer

1. **How do I efficiently port my training content from GitLab markdown files into the platform?**
2. **What's the best approach for PDF certificate generation in Firebase/Next.js?**
3. **How should I structure Firestore for optimal multi-tenant queries?**
4. **Can I use Firebase Auth magic links for employee login (no passwords)?**
5. **How do I implement CSV employee import with validation?**
6. **What's the best way to embed training presentations (Google Slides? PDFs? Videos?)**
7. **How do I track partial completion (user starts but doesn't finish)?**
8. **Should I use Firebase Extensions for email or SendGrid API?**
9. **How do I generate unique certificate IDs that look legitimate?**
10. **What's the migration path from this MVP to more advanced features (video hosting, live webinars, etc.)?**

---

## 🎯 Expected Output Format

Please structure your response as:

### Part 1: Setup Guide (5 minutes)
- Clone commands
- Firebase project creation
- Initial configuration

### Part 2: Architecture Overview (10 minutes reading)
- Entity relationship diagram
- Firestore schema design
- File structure explanation
- Security model

### Part 3: Implementation Roadmap (Reference)
- Week-by-week task breakdown
- Code snippets for key features
- Configuration files
- Testing strategies

### Part 4: Content Integration (Critical)
- How to pull content from GitLab
- How to structure training modules
- How to create quiz questions
- How to design certificates

### Part 5: Deployment Guide
- Step-by-step Vercel deployment
- Environment variables
- Custom domain setup
- Monitoring & maintenance

---

## ✅ Success Checklist

After following your guidance, I should be able to:
- [ ] Clone repo successfully
- [ ] Configure Firebase project
- [ ] Run dev server locally
- [ ] Create test company
- [ ] Add test employee
- [ ] Upload training content
- [ ] Assign training to employee
- [ ] Complete training as employee
- [ ] Pass quiz (80%+)
- [ ] Receive generated certificate
- [ ] View completion in admin dashboard
- [ ] Deploy to production
- [ ] Onboard [COMPANY NAME] (50 employees)

---

## 🚀 Let's Build!

I'm ready to implement everything you suggest. I have:
- ✅ GitLab vault with all content ready
- ✅ Firebase account ready to configure
- ✅ Termux/Project IDX ready for development
- ✅ First client waiting (Button Nose - [AMOUNT])
- ✅ 5 weeks until delivery deadline
- ✅ Strong motivation to build this business

**Please provide the complete implementation guide starting with Part 1: Setup Guide.**

Let's turn this open-source starter kit into a production-ready California compliance training platform! 🎯

---

**Additional Context:**
- I'm building this solo (indie hacker)
- I have MPA degree + IPMA-SCP credential (I understand compliance deeply)
- This is my path to building a real business ($200K+ in 2026)
- I'm comfortable with code but appreciate clear explanations
- I prefer pragmatic solutions over perfect architecture
- Speed to market is critical (Button Nose deadline is real)

**Let's make HRBizLMS happen!** 🚀
