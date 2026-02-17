# AI DEVELOPMENT PLATFORM PROMPTS
## Ready-to-Use Prompts for Building HRBizLMS

---

## 🔥 PROMPT 1: FIREBASE + NEXT.JS (RECOMMENDED)

### For: Cursor, Claude Code, Windsurf, or any AI code assistant

```markdown
# PROJECT: HRBiz Compliance LMS - Harassment Prevention Training Platform

## OBJECTIVE
Build a multi-tenant SaaS platform for California harassment prevention training compliance. The system has TWO user types: (1) Consultants who manage multiple client companies, and (2) Client companies who view their compliance status.

## TECH STACK
- Frontend: Next.js 14 (App Router, TypeScript, Tailwind CSS)
- Backend: Firebase (Firestore, Auth, Storage, Cloud Functions)
- UI Components: shadcn/ui
- PDF Generation: jsPDF + docxtemplater
- Email: SendGrid
- Deployment: Vercel (frontend) + Firebase (backend)

## CORE FEATURES (MVP - Phase 1)

### 1. Authentication & Multi-Tenancy
- Firebase Authentication with email/password
- Two user roles: "consultant" and "client"
- Consultants can manage multiple companies
- Clients can only view their own company data
- Role-based access control (RBAC) in Firestore security rules

### 2. Consultant Dashboard
- Overview: Total clients, upcoming sessions, monthly revenue
- Client list with compliance status (✓ Compliant / ⚠️ Action Required)
- Quick actions: Add Client, Schedule Training, View Reports

### 3. Company Onboarding Wizard (Consultant Only)
Step 1: Basic Info
- Company name, address, industry, employee count
- Upload company logo (Firebase Storage)

Step 2: EEO Officer & Reporting Channels
- EEO Officer: Name, title, email, phone
- Select reporting channels (checkboxes):
  - Direct supervisor
  - HR department (provide email)
  - EEO Officer
  - Anonymous hotline (provide phone)
  - Third-party vendor (provide details)

Step 3: Auto-Generate Documents
- Generate harassment prevention policy (docx + PDF)
- Generate employee acknowledgment form (docx + PDF)
- Generate complaint form template (docx + PDF)
- Store in Firebase Storage under /companies/{companyId}/documents/

### 4. Employee Roster Management
- CSV bulk upload (provide template download)
- Manual entry form (one-by-one)
- Required fields:
  - Employee ID, First Name*, Last Name*, Email*, Phone
  - Job Title, Department, Hire Date*
  - [POSITION] Status* (boolean)
  - Employment Status* (active/leave/terminated)
  - Leave dates (if applicable)

- Auto-calculate:
  - Training requirement (1hr or 2hr based on supervisor status)
  - Initial training due date (hire date + 6 months)
  - Renewal training due date (last training + 2 years)
  - Overdue status (if past due date)

### 5. Training Session Scheduler
- Create session form:
  - Session type: [POSITION] (2hr) or Employee (1hr)
  - Date & time (datetime picker)
  - Format: Webinar / In-Person / Hybrid
  - Location/Link
  - Trainer name
  - Capacity (optional)

- Auto-assign employees:
  - Show list of employees who need training
  - Filter by department, hire date, overdue status
  - Bulk-select and assign to session

- Generate attendance roster (PDF):
  - Pre-populated with assigned employee names
  - Columns: Name, Signature, Date
  - Printable for in-person training

### 6. Automated Reminder System (Cloud Functions)
- Cloud Function scheduled daily (cron job)
- Check all employees in Firestore
- Send email reminders based on rules:
  - Initial training: 30 days, 14 days, 7 days before due
  - Renewal training: 90 days, 60 days, 30 days, 14 days before expiration
  - Day of training: Morning reminder
  - After missed session: Makeup required notification

- Email template includes:
  - Employee name
  - Training type required
  - Due date
  - Next scheduled session (if applicable)
  - Link to client portal

### 7. Training Attendance & Certificate Generation
- Consultant marks attendance after session
- Select attendees from assigned list
- System generates certificate for each attendee:
  - Employee name
  - Training type (Supervisory / Non-Supervisory)
  - Training date
  - Duration (120 min / 60 min)
  - Certificate number: CERT-{YEAR}-{COMPANY_SHORT}-{INCREMENT}
  - Training provider: HRBiz.org Compliance Consulting
  - Expiration date (training date + 2 years)
  - Trainer signature (uploaded image)

- Auto-generate PDF certificate (jsPDF)
- Store in Firebase Storage
- Email certificate to employee
- Update employee record with:
  - trainingStatus: "completed"
  - lastTrainingDate: session date
  - nextDueDate: session date + 2 years
  - certificateNumber: generated number

### 8. Compliance Records Vault
- After each training session, create compliance package:
  - Signed attendance roster (PDF)
  - All certificates (PDFs in folder)
  - Compliance summary report (auto-generated PDF):
    - Total employees trained
    - [POSITION] vs non-supervisor count
    - Attendance rate
    - Certificate list
    - SB 513 compliance checklist ✓

- Store in Firebase Storage under:
  `/compliance_records/{companyId}/{sessionDate}/`

- Retain for minimum 2 years (SB 513 requirement)
- Auto-alert before deletion eligibility

### 9. Client Dashboard (Read-Only)
- Compliance status badge (✓ Compliant / ⚠️ Action Required / ❌ Overdue)
- Days until next renewal
- Employee training status:
  - Total employees
  - Trained count (%)
  - Pending count
  - Overdue count
- Upcoming training session (if scheduled)
- Documents:
  - Download policy (PDF)
  - Download acknowledgment form
  - Download complaint form
- Certificates:
  - Search by employee name
  - Download individual certificate
  - Download all certificates (ZIP)

### 10. Compliance Dashboard & Reports
- Consultant view:
  - Client compliance status table
  - Filter: Compliant / Action Required / Overdue
  - Sort: Last training date, Next due date, Company name
  - Quick actions: Schedule Training, View Details, Download Report

- Client view:
  - Training history timeline
  - Employee roster with training status
  - Generate audit report (PDF):
    - Company info
    - EEO Officer contact
    - Reporting channels
    - Training history
    - Current compliance status
    - All certificates attached

## FIRESTORE DATABASE SCHEMA

```typescript
// Collections
/consultants/{consultantId}
  - name: string
  - email: string
  - phone: string
  - createdAt: timestamp

/companies/{companyId}
  - consultantId: string (FK)
  - name: string
  - address: string
  - industry: string
  - employeeCount: number
  - logoUrl: string
  - eeoOfficer: {
      name: string
      title: string
      email: string
      phone: string
    }
  - reportingChannels: string[]
  - policyVersion: string
  - createdAt: timestamp

/employees/{employeeId}
  - companyId: string (FK)
  - employeeNumber: string
  - firstName: string
  - lastName: string
  - email: string
  - phone: string
  - jobTitle: string
  - department: string
  - hireDate: timestamp
  - isSupervisor: boolean
  - employmentStatus: "active" | "leave" | "terminated"
  - leaveStartDate: timestamp?
  - leaveEndDate: timestamp?
  - trainingStatus: "pending" | "scheduled" | "completed" | "overdue"
  - lastTrainingDate: timestamp?
  - nextDueDate: timestamp?
  - certificateNumber: string?

/training_sessions/{sessionId}
  - companyId: string (FK)
  - sessionType: "supervisor" | "employee"
  - date: timestamp
  - duration: number (minutes)
  - format: "webinar" | "in-person" | "hybrid"
  - location: string
  - trainer: string
  - capacity: number?
  - assignedEmployees: string[] (employee IDs)
  - attendedEmployees: string[] (employee IDs)
  - status: "scheduled" | "completed" | "cancelled"

/certificates/{certificateId}
  - employeeId: string (FK)
  - companyId: string (FK)
  - sessionId: string (FK)
  - certificateNumber: string
  - issueDate: timestamp
  - expirationDate: timestamp
  - trainingType: "supervisor" | "employee"
  - duration: number
  - pdfUrl: string (Firebase Storage path)

/compliance_records/{recordId}
  - companyId: string (FK)
  - sessionId: string (FK)
  - attendanceRosterUrl: string
  - certificateUrls: string[]
  - complianceSummaryUrl: string
  - createdAt: timestamp
```

## FIRESTORE SECURITY RULES

```javascript
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    
    // Helper functions
    function isAuthenticated() {
      return request.auth != null;
    }
    
    function isConsultant() {
      return isAuthenticated() && 
             exists(/databases/$(database)/documents/consultants/$(request.auth.uid));
    }
    
    function isClientOfCompany(companyId) {
      return isAuthenticated() && 
             get(/databases/$(database)/documents/companies/$(companyId)).data.clientUserId == request.auth.uid;
    }
    
    function ownsCompany(companyId) {
      return isConsultant() && 
             get(/databases/$(database)/documents/companies/$(companyId)).data.consultantId == request.auth.uid;
    }
    
    // Consultants collection
    match /consultants/{consultantId} {
      allow read, write: if request.auth.uid == consultantId;
    }
    
    // Companies collection
    match /companies/{companyId} {
      allow read: if isConsultant() || isClientOfCompany(companyId);
      allow create, update: if isConsultant();
      allow delete: if ownsCompany(companyId);
    }
    
    // Employees collection
    match /employees/{employeeId} {
      allow read: if isConsultant() || isClientOfCompany(resource.data.companyId);
      allow write: if ownsCompany(resource.data.companyId);
    }
    
    // Training sessions
    match /training_sessions/{sessionId} {
      allow read: if isConsultant() || isClientOfCompany(resource.data.companyId);
      allow write: if ownsCompany(resource.data.companyId);
    }
    
    // Certificates
    match /certificates/{certificateId} {
      allow read: if isConsultant() || 
                     isClientOfCompany(resource.data.companyId) ||
                     request.auth.uid == resource.data.employeeId;
      allow write: if ownsCompany(resource.data.companyId);
    }
    
    // Compliance records
    match /compliance_records/{recordId} {
      allow read: if isConsultant() || isClientOfCompany(resource.data.companyId);
      allow write: if ownsCompany(resource.data.companyId);
    }
  }
}
```

## CLOUD FUNCTIONS

### Function 1: Scheduled Reminders (Daily Cron)
```typescript
// functions/src/reminders.ts
import * as functions from 'firebase-functions';
import * as admin from 'firebase-admin';
import * as sgMail from '@sendgrid/mail';

export const sendDailyReminders = functions.pubsub
  .schedule('0 9 * * *') // Run daily at 9 AM
  .timeZone('America/Los_Angeles')
  .onRun(async (context) => {
    const db = admin.firestore();
    const now = admin.firestore.Timestamp.now();
    
    // Get all employees
    const employeesSnapshot = await db.collection('employees')
      .where('employmentStatus', '==', 'active')
      .get();
    
    const reminders = [];
    
    for (const doc of employeesSnapshot.docs) {
      const employee = doc.data();
      const daysUntilDue = calculateDaysUntil(employee.nextDueDate, now);
      
      // Check if reminder needed
      if ([90, 60, 30, 14, 7].includes(daysUntilDue)) {
        reminders.push({
          to: employee.email,
          subject: `Training Reminder: ${daysUntilDue} Days Until Due`,
          text: `Hi ${employee.firstName}, your harassment prevention training is due in ${daysUntilDue} days.`,
          html: generateReminderEmail(employee, daysUntilDue)
        });
      }
    }
    
    // Send emails via SendGrid
    await sgMail.send(reminders);
    
    return null;
  });
```

### Function 2: Auto-Generate Certificate
```typescript
// functions/src/certificates.ts
import * as functions from 'firebase-functions';
import * as admin from 'firebase-admin';
import { jsPDF } from 'jspdf';

export const generateCertificate = functions.firestore
  .document('training_sessions/{sessionId}')
  .onUpdate(async (change, context) => {
    const after = change.after.data();
    const before = change.before.data();
    
    // Only trigger if status changed to 'completed'
    if (after.status !== 'completed' || before.status === 'completed') {
      return null;
    }
    
    const db = admin.firestore();
    const storage = admin.storage();
    const sessionId = context.params.sessionId;
    
    // Get attended employees
    const attendedEmployeeIds = after.attendedEmployees;
    
    for (const employeeId of attendedEmployeeIds) {
      const employeeDoc = await db.collection('employees').doc(employeeId).get();
      const employee = employeeDoc.data();
      
      // Generate certificate number
      const certNumber = `CERT-${new Date().getFullYear()}-${after.companyId.substring(0, 8).toUpperCase()}-${Math.floor(Math.random() * 1000)}`;
      
      // Generate PDF certificate
      const doc = new jsPDF({
        orientation: 'landscape',
        unit: 'in',
        format: 'letter'
      });
      
      doc.setFontSize(36);
      doc.text('CERTIFICATE OF COMPLETION', 5.5, 1.5, { align: 'center' });
      doc.setFontSize(20);
      doc.text(`${employee.firstName} ${employee.lastName}`, 5.5, 3, { align: 'center' });
      doc.setFontSize(14);
      doc.text(`Training Date: ${after.date.toDate().toLocaleDateString()}`, 5.5, 4, { align: 'center' });
      doc.text(`Certificate Number: ${certNumber}`, 5.5, 4.5, { align: 'center' });
      
      const pdfBuffer = doc.output('arraybuffer');
      
      // Upload to Firebase Storage
      const bucket = storage.bucket();
      const file = bucket.file(`certificates/${after.companyId}/${certNumber}.pdf`);
      await file.save(Buffer.from(pdfBuffer), {
        contentType: 'application/pdf'
      });
      
      const pdfUrl = await file.getSignedUrl({
        action: 'read',
        expires: '03-01-2500'
      });
      
      // Save certificate record
      await db.collection('certificates').add({
        employeeId,
        companyId: after.companyId,
        sessionId,
        certificateNumber: certNumber,
        issueDate: admin.firestore.FieldValue.serverTimestamp(),
        expirationDate: admin.firestore.Timestamp.fromDate(
          new Date(after.date.toDate().getTime() + (2 * 365 * 24 * 60 * 60 * 1000)) // +2 years
        ),
        trainingType: after.sessionType,
        duration: after.duration,
        pdfUrl: pdfUrl[0]
      });
      
      // Update employee record
      await db.collection('employees').doc(employeeId).update({
        trainingStatus: 'completed',
        lastTrainingDate: after.date,
        nextDueDate: admin.firestore.Timestamp.fromDate(
          new Date(after.date.toDate().getTime() + (2 * 365 * 24 * 60 * 60 * 1000))
        ),
        certificateNumber: certNumber
      });
      
      // Send certificate email
      // TODO: Implement SendGrid email with PDF attachment
    }
    
    return null;
  });
```

## NEXT.JS APP STRUCTURE

```
src/
├── app/
│   ├── (auth)/
│   │   ├── login/page.tsx              # Login page
│   │   └── register/page.tsx           # Register page
│   ├── (consultant)/
│   │   ├── dashboard/page.tsx          # Consultant dashboard
│   │   ├── clients/
│   │   │   ├── page.tsx                # Client list
│   │   │   ├── new/page.tsx            # Onboarding wizard
│   │   │   └── [id]/
│   │   │       ├── page.tsx            # Client details
│   │   │       ├── employees/page.tsx  # Employee roster
│   │   │       └── sessions/page.tsx   # Training sessions
│   │   └── sessions/page.tsx           # All sessions across clients
│   ├── (client)/
│   │   ├── dashboard/page.tsx          # Client dashboard
│   │   ├── employees/page.tsx          # View employees
│   │   ├── documents/page.tsx          # View policies/forms
│   │   └── certificates/page.tsx       # View certificates
│   ├── api/
│   │   ├── employees/
│   │   │   ├── route.ts                # GET, POST employees
│   │   │   └── [id]/route.ts           # PUT, DELETE employee
│   │   ├── sessions/route.ts           # Training sessions API
│   │   └── certificates/route.ts       # Certificates API
│   ├── layout.tsx
│   └── page.tsx                        # Landing page
├── components/
│   ├── ui/                             # shadcn/ui components
│   ├── EmployeeRosterTable.tsx
│   ├── SessionScheduler.tsx
│   ├── CertificateViewer.tsx
│   └── ComplianceDashboard.tsx
├── lib/
│   ├── firebase.ts                     # Firebase initialization
│   ├── firestore.ts                    # Firestore helper functions
│   └── utils.ts
└── types/
    ├── Employee.ts
    ├── TrainingSession.ts
    └── Certificate.ts
```

## UI/UX REQUIREMENTS
- Clean, professional design (blue color scheme: #1F497D primary)
- Mobile-responsive (all views work on phone/tablet)
- Loading states for all async operations
- Error handling with user-friendly messages
- Toast notifications for success/error actions
- Accessible (WCAG 2.1 AA compliant)

## DEPLOYMENT STEPS
1. Create Firebase project
2. Enable Firestore, Authentication, Storage, Functions
3. Install Firebase CLI: `npm install -g firebase-tools`
4. Deploy Firestore rules: `firebase deploy --only firestore:rules`
5. Deploy Cloud Functions: `firebase deploy --only functions`
6. Deploy Next.js to Vercel: Connect GitHub repo, auto-deploy on push

## NEXT STEPS (Phase 2)
- Leave tracking & return-to-work automation
- New hire webhook integrations (ADP, Paychex)
- Advanced analytics & reporting
- E-signature integration (DocuSign)
- Mobile app (React Native)

---

START BY:
1. Setting up Firebase project configuration
2. Creating Firestore database schema
3. Building authentication (login/register)
4. Creating consultant dashboard
5. Building company onboarding wizard

Generate the initial project structure with Next.js 14, TypeScript, Tailwind CSS, and Firebase SDK configured. Include all necessary files to get started.
```

---

## 🚀 PROMPT 2: BOLT.NEW (RAPID PROTOTYPING)

### For: Bolt.new (StackBlitz AI)

```markdown
Build a California harassment prevention training compliance tracker called "HRBizLMS".

KEY FEATURES:
1. Consultant dashboard - manage multiple client companies
2. Company onboarding wizard - collect company info, generate compliance documents
3. Employee roster - bulk CSV upload, track training status (pending/scheduled/completed/overdue)
4. Training scheduler - schedule 2hr supervisor or 1hr employee sessions
5. Auto-generate SB 513 compliant certificates after training
6. Client dashboard - read-only view of compliance status
7. Automated email reminders (30, 14, 7 days before due dates)

TECH STACK:
- Next.js 14 with TypeScript
- Firebase (Firestore + Auth + Storage)
- Tailwind CSS
- shadcn/ui components
- jsPDF for certificate generation

USER FLOW (CONSULTANT):
1. Register as consultant
2. Add new client company (wizard: company info → EEO officer → reporting channels)
3. Upload employee roster (CSV)
4. Schedule training session (select employees, date/time)
5. After training, mark attendance
6. System auto-generates certificates, emails to employees
7. View compliance dashboard (all clients)

USER FLOW (CLIENT):
1. Login to client portal
2. View compliance status (✓ Compliant / ⚠️ Action Required)
3. View employee training status
4. Download policy documents
5. Download certificates

DATABASE SCHEMA (Firestore):
- /consultants/{id}: name, email, phone
- /companies/{id}: name, consultantId, employeeCount, eeoOfficer, reportingChannels
- /employees/{id}: companyId, name, email, isSupervisor, trainingStatus, lastTrainingDate, nextDueDate
- /training_sessions/{id}: companyId, date, sessionType, assignedEmployees, attendedEmployees
- /certificates/{id}: employeeId, companyId, certificateNumber, issueDate, expirationDate, pdfUrl

START WITH:
- Authentication (consultant + client roles)
- Consultant dashboard with client list
- Company onboarding wizard (3 steps)
- Employee roster table with CSV upload

Make it look professional with blue color scheme (#1F497D). Include loading states and error handling.
```

---

## 🎨 PROMPT 3: V0.DEV (UI COMPONENTS)

### For: V0.dev (Vercel AI UI Generator)

```markdown
Generate a compliance dashboard for an HR training platform.

DASHBOARD LAYOUT:
- Top navigation: Logo (left), User menu (right)
- Sidebar: Dashboard, Clients, Training Sessions, Reports, Settings
- Main content area with cards

CARDS TO INCLUDE:
1. Compliance Status Overview
   - Total Clients: 5
   - Compliant Clients: 3 (green badge)
   - Action Required: 2 (amber badge)
   - Overdue: 0 (red badge)

2. Upcoming Training Sessions (table)
   Columns: Date, Client, Type ([POSITION]/Employee), Attendees, Status
   Sample data:
   - Feb 15, 2026 | [COMPANY NAME] | [POSITION] | 15 employees | Scheduled
   - Feb 20, 2026 | ABC Corp | Employee | 30 employees | Scheduled

3. Recent Activity (timeline)
   - Feb 1: Generated 50 certificates for [COMPANY NAME]
   - Jan 25: Scheduled training for ABC Corp
   - Jan 20: Onboarded new client XYZ Company

4. Quick Actions (buttons)
   - Add New Client (primary button, blue)
   - Schedule Training (secondary button)
   - Generate Report (outline button)

DESIGN:
- Professional blue color scheme (#1F497D primary, #4F81BD secondary)
- Clean, modern aesthetic
- Use shadcn/ui components
- Responsive (mobile-friendly)
- Include icons (Lucide React)

Add hover states and smooth transitions. Make it feel polished and production-ready.
```

---

## 💻 PROMPT 4: WINDSURF / CURSOR (CODE GENERATION)

### For: Windsurf, Cursor, Codeium

```markdown
Create an employee roster management page for HRBizLMS.

REQUIREMENTS:
1. Table with columns:
   - Employee ID
   - Name (First + Last)
   - Email
   - Job Title
   - Department
   - [POSITION]? (badge: Yes/No)
   - Training Status (badge: Pending/Scheduled/Completed/Overdue)
   - Last Training Date
   - Next Due Date
   - Actions (View, Edit, Delete icons)

2. Features:
   - Search bar (filter by name, email, or department)
   - Filter dropdown (All / Supervisors / Non-Supervisors)
   - Status filter (All / Pending / Completed / Overdue)
   - CSV Bulk Upload button (opens modal)
   - Add Employee button (opens form)
   - Pagination (25 per page)

3. CSV Upload Modal:
   - Drag-and-drop area or file picker
   - Download CSV template link
   - Preview table (show first 5 rows)
   - Validate button (check required fields)
   - Import button (disabled until validated)
   - Progress indicator during import

4. Add/Edit Employee Form:
   - Fields: First Name*, Last Name*, Email*, Phone, Employee ID*
   - Job Title*, Department*, Hire Date*
   - [POSITION] Status* (toggle switch)
   - Employment Status* (dropdown: Active/Leave/Terminated)
   - Leave dates (if status = Leave)
   - Save & Close button
   - Cancel button

TECH STACK:
- React + TypeScript
- Tailwind CSS
- shadcn/ui (Table, Button, Input, Select, Modal, Badge)
- React Hook Form for form validation
- Zod for schema validation
- Firestore for data (assume Firebase already configured)

CODE STRUCTURE:
- EmployeeRosterPage.tsx (main page component)
- EmployeeTable.tsx (table component)
- EmployeeForm.tsx (add/edit form)
- CSVUploadModal.tsx (CSV upload)
- hooks/useEmployees.ts (Firestore CRUD operations)
- lib/csvParser.ts (parse CSV, validate data)

Include proper TypeScript types, error handling, loading states, and success/error toasts.

Generate the complete implementation with all files.
```

---

## 🤖 PROMPT 5: REPLIT (FULL-STACK BUILD)

### For: Replit AI Agent

```markdown
Build "HRBizLMS" - a California harassment prevention training compliance platform.

PROJECT SETUP:
- Next.js 14 (TypeScript, App Router)
- Firebase (Firestore, Auth, Storage, Functions)
- Tailwind CSS + shadcn/ui
- Deploy to Vercel

FEATURES TO BUILD:
1. Authentication (email/password)
   - Consultant role (manage multiple clients)
   - Client role (view own company only)

2. Consultant Dashboard
   - Overview cards (total clients, upcoming sessions, compliance alerts)
   - Client list table (name, status, last training, next due, actions)
   - Quick action buttons

3. Company Onboarding (3-step wizard)
   Step 1: Company info (name, address, industry, logo upload)
   Step 2: EEO Officer (name, title, email, phone)
   Step 3: Reporting channels (checkboxes, generate policy documents)

4. Employee Roster
   - Table view with search/filter
   - CSV bulk upload
   - Add/edit forms
   - Track training status (auto-calculate due dates)

5. Training Scheduler
   - Create session form (type, date, location, assign employees)
   - Calendar view of upcoming sessions
   - Generate attendance roster (PDF)

6. Certificate Generation
   - After training, mark attendance
   - Auto-generate PDF certificates (SB 513 compliant)
   - Email to employees
   - Store in Firestore + Firebase Storage

7. Client Dashboard (read-only)
   - Compliance status badge
   - Employee training status
   - Download documents (policy, forms, certificates)

8. Automated Reminders (Cloud Function)
   - Daily cron job
   - Check all employees for upcoming due dates
   - Send email reminders (30, 14, 7 days before)

FIRESTORE SCHEMA:
/consultants, /companies, /employees, /training_sessions, /certificates, /compliance_records

CLOUD FUNCTIONS:
- sendDailyReminders (scheduled)
- generateCertificate (Firestore trigger)

Include Firestore security rules for role-based access control.

Generate the full project structure with all necessary files. Set up Firebase configuration and deployment scripts.
```

---

## 🔧 PROMPT 6: DEVIN (AI SOFTWARE ENGINEER)

### For: Devin.ai

```markdown
# PROJECT: HRBizLMS - Harassment Prevention Training Compliance Platform

## MISSION
Build a production-ready SaaS platform for California HR consultants to manage harassment prevention training compliance for their clients.

## DELIVERABLES
1. Fully functional web application (Next.js + Firebase)
2. Database schema with security rules
3. Cloud Functions for automation (reminders, certificate generation)
4. Deployment to Vercel (frontend) + Firebase (backend)
5. Documentation (README, API docs, deployment guide)
6. Test coverage (unit + integration tests)

## CORE FEATURES (MVP)
See detailed requirements in PROMPT 1 above.

## TECH REQUIREMENTS
- Frontend: Next.js 14, TypeScript, Tailwind CSS, shadcn/ui
- Backend: Firebase (Firestore, Auth, Storage, Cloud Functions)
- Email: SendGrid API integration
- PDF: jsPDF + docxtemplater
- Testing: Vitest + React Testing Library + Firebase Emulator
- CI/CD: GitHub Actions
- Deployment: Vercel (auto-deploy from main branch)

## PROJECT MILESTONES
1. Setup & Configuration (Day 1)
   - Initialize Next.js project
   - Configure Firebase (Firestore, Auth, Storage)
   - Set up Tailwind CSS + shadcn/ui
   - Create project structure

2. Authentication & Multi-Tenancy (Day 2)
   - Implement Firebase Auth (email/password)
   - Create consultant and client roles
   - Build login/register pages
   - Implement role-based routing

3. Consultant Dashboard (Day 3-4)
   - Dashboard overview (cards, charts)
   - Client list table
   - Company onboarding wizard (3 steps)
   - Policy document generation

4. Employee Management (Day 5-6)
   - Employee roster table
   - CSV bulk upload
   - Add/edit forms
   - Auto-calculate training due dates

5. Training Scheduler (Day 7-8)
   - Session creation form
   - Calendar view
   - Employee assignment
   - Attendance roster PDF generation

6. Certificate Generation (Day 9-10)
   - SB 513 compliant certificate template
   - Auto-generate after training
   - Email delivery
   - Storage & tracking

7. Client Dashboard (Day 11)
   - Compliance status view
   - Document downloads
   - Certificate search

8. Automation (Day 12-13)
   - Cloud Function: Daily reminder cron
   - Cloud Function: Auto-generate certificates
   - SendGrid email integration

9. Testing & QA (Day 14)
   - Unit tests for utility functions
   - Integration tests for Firestore operations
   - E2E tests for critical user flows
   - Firebase Emulator testing

10. Deployment & Documentation (Day 15)
    - Deploy to Vercel + Firebase
    - Write README with setup instructions
    - Create API documentation
    - Record demo video

## ACCEPTANCE CRITERIA
- All features working end-to-end
- No console errors or warnings
- Mobile-responsive (works on phone/tablet)
- Loading states for async operations
- Error handling with user-friendly messages
- Test coverage >80%
- Firestore security rules enforced
- Cloud Functions running on schedule
- Successful production deployment

## CONSTRAINTS
- Budget: Use Firebase free tier (Spark plan)
- Timeline: 15 days from start to deployment
- Code quality: TypeScript strict mode, ESLint, Prettier
- Security: No credentials in code, use environment variables

## OPTIONAL ENHANCEMENTS (if time permits)
- E-signature integration (DocuSign sandbox)
- Advanced analytics dashboard
- Email templates with branding
- Webhook for new hire integration

Start by creating a detailed task breakdown and estimated hours for each milestone. Then proceed with implementation.
```

---

