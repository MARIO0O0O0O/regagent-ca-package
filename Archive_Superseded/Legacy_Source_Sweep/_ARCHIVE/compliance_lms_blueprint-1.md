# HARASSMENT PREVENTION COMPLIANCE LMS
## High-Level Software Blueprint for AI Implementation

---

## 🎯 BUSINESS MODEL DECISION

**RECOMMENDED: HYBRID CONSULTANT-CLIENT MODEL**

### Why Hybrid?
- **Consultant Portal (YOU)**: Manage multiple clients, deliver training, generate compliance packages
- **Client Portal (THEM)**: View compliance status, access policies, track employee training
- **Revenue Strategy**: Software as loss-leader → Build trust → Convert to high-value consulting retainers

### Your Role:
1. Setup client company (policies, reporting channels, EEO officer)
2. Upload employee roster
3. Schedule and deliver live training sessions
4. System auto-generates certificates, rosters, compliance records
5. Client monitors status via read-only dashboard
6. You upsell monthly HR advisory retainer ($500-2000/mo)

---

## 📛 REPOSITORY & PRODUCT NAMING

### Top Recommendations:
1. **HRBizLMS** - Simple, direct, ties to your brand
2. **ComplianceIQ** - Smart, professional
3. **SB1343Hub** - California-specific, regulation-focused
4. **TrainTrackCA** - Training + tracking for California
5. **SafeWorkspaceLMS** - Friendly, mission-driven
6. **PREVENTai** - Modern, prevention-focused
7. **HarassmentShield** - Protective, defensive positioning

**WINNER RECOMMENDATION**: **HRBizLMS** or **ComplianceIQ**
- GitHub repo: `hrbiz-compliance-lms` or `complianceiq-platform`

---

## 🏗️ SYSTEM ARCHITECTURE

### Technology Stack Recommendation:
```
Frontend: Next.js 14 (React + TypeScript)
Backend: Firebase (Firestore + Auth + Functions + Storage)
Authentication: Firebase Auth (SSO ready for future enterprise clients)
Database: Firestore (NoSQL for flexible schema)
File Storage: Firebase Storage (certificates, policies, rosters)
Email/SMS: SendGrid + Twilio (reminders, notifications)
Scheduling: Cloud Functions + Firestore triggers
PDF Generation: jsPDF + docxtemplater
Hosting: Vercel (frontend) + Firebase (backend)
```

### Alternative Stack:
```
Backend: Supabase (PostgreSQL if you prefer SQL)
Everything else same as above
```

---

## 🎨 SYSTEM FEATURES - COMPLETE BREAKDOWN

### PHASE 1: CORE COMPLIANCE SETUP (MVP)

#### 1. MULTI-TENANT ARCHITECTURE
- **Consultant Account** (you)
  - Manage multiple client companies
  - Dashboard showing all clients' compliance status
  - Revenue tracking, billing integration (future)
  
- **Company Account** (client)
  - Single company view
  - Limited admin access or read-only
  - Branded with their logo/colors

#### 2. COMPANY ONBOARDING WIZARD
**Inputs Required:**
- Company name, address, industry
- Total employee count
- Supervisor count vs non-supervisor count
- Upload company logo
- Primary contact person (HR manager/owner)
- Billing contact (if different)

**System Generates:**
- Unique company ID
- Custom subdomain (optional): `buttonnosepetgrooming.complianceiq.com`
- Initial compliance assessment dashboard

#### 3. POLICY GENERATION ENGINE
**Input Wizard:**
- Select reporting channels:
  - ☐ Direct supervisor
  - ☐ HR department (provide contact)
  - ☐ EEO Officer (provide contact)
  - ☐ Anonymous hotline (provide number)
  - ☐ Third-party vendor (provide details)
  
- EEO Officer Details:
  - Name, title, email, phone, office location
  
- Company-specific customizations:
  - Remote work policy? (Yes/No)
  - Multiple locations? (List addresses)
  - Union employees? (Yes/No - affects language)

**System Outputs:**
- **Generated Policy Document** (.docx + PDF)
  - Pre-filled with company name, reporting channels, EEO officer
  - SB 1343 compliant language
  - Ready for e-signature or DocuSign integration
  
- **Employee Acknowledgment Form** (.docx + PDF)
  - "I have received and read the policy..."
  - Signature field, date field
  
- **Complaint Form Template** (.docx + PDF)
  - Structured incident reporting form

**Storage:**
- All documents stored in Firebase Storage
- Versioned (v1.0, v1.1 if updated)
- Accessible via client dashboard

#### 4. EMPLOYEE ROSTER MANAGEMENT
**Bulk Import Options:**
- CSV upload (template provided)
- Manual entry form (one-by-one)
- ADP/Paychex integration (future)

**Required Fields:**
```
- Employee ID (unique)
- First Name*
- Last Name*
- Email Address*
- Phone Number (optional for SMS reminders)
- Job Title
- Department
- Hire Date*
- Supervisor Status* (Supervisor / Non-Supervisor)
- Employment Status* (Active / On Leave / Terminated)
- Leave Start Date (if applicable)
- Expected Return Date (if applicable)
- Training Status (Pending / Scheduled / Completed / Overdue)
- Last Training Date
- Next Training Due Date
- Certificate Number (after completion)
```

**System Auto-Calculates:**
- Training requirement (1hr or 2hr based on supervisor status)
- Initial training due date (within 6 months of hire)
- Renewal training due date (2 years after last completion)
- Overdue status (if past due date)

#### 5. TRAINING SCHEDULER

**Session Creation:**
- **Session Type**: Supervisor (2hr) or Employee (1hr)
- **Date & Time**: Calendar picker
- **Format**: Webinar / In-Person / Hybrid
- **Location**: Address or Zoom link
- **Trainer**: Your name (or delegate)
- **Capacity**: Max attendees (optional)

**Auto-Assign Employees:**
- System suggests employees who need training
- Filter by: Department, Hire Date, Overdue Status
- Bulk-select and assign to session

**Calendar Integration:**
- Generate .ics file (Add to Calendar)
- Send calendar invites to all assigned employees
- Outlook/Google Calendar sync (future)

#### 6. AUTOMATED REMINDER SYSTEM

**Notification Schedule:**
- **Initial Training:**
  - Day 1 (hire date): Welcome email + policy attached + training requirement notice
  - 30 days before due: "Training required in 30 days"
  - 14 days before due: "Training required in 14 days"
  - 7 days before due: "URGENT: Training required in 7 days"
  - Day of training: "Training session today at [TIME]"
  
- **Renewal Training:**
  - 90 days before expiration: "Training renewal in 90 days"
  - 60 days before: "Training renewal in 60 days"
  - 30 days before: "Training renewal in 30 days"
  - 14 days before: "URGENT: Training expires in 14 days"
  - After expiration: "OVERDUE: Training expired"

**Reminder Channels:**
- Email (primary)
- SMS (if phone number provided)
- In-app notification (if client portal access)

**Configurable Settings:**
- Consultant can adjust reminder schedule per client
- Disable certain reminders (e.g., client prefers no SMS)

#### 7. TRAINING DELIVERY & ATTENDANCE

**Pre-Training:**
- System generates attendance roster (pre-populated with assigned employees)
- Printable PDF or digital version
- QR code for quick sign-in (mobile app future)

**During Training:**
- **Option A (Your Use Case)**: Print roster, collect signatures manually
- **Option B (Digital)**: Employees sign in via tablet/phone with digital signature
- **Option C (Hybrid)**: QR code attendance + manual backup

**Post-Training:**
- Upload signed roster OR confirm attendees digitally
- System marks attendance status: Present / Absent / Partial (left early)

**Makeup Sessions:**
- System auto-flags employees marked "Absent"
- Creates "Makeup Required" list
- Consultant schedules makeup session
- Automated reminders sent to flagged employees

#### 8. CERTIFICATE GENERATION (SB 513 COMPLIANT)

**Trigger:** After training session, consultant confirms attendance

**System Auto-Generates:**
For each attendee:
- **Certificate PDF** with:
  1. Employee name (from roster)
  2. Training type (Supervisory / Non-Supervisory)
  3. Training date
  4. Duration (120 min / 60 min)
  5. **SB 513 Required Metadata:**
     - Training provider: HRBiz.org Compliance Consulting
     - Core competencies covered
     - Resulting qualification: Valid for 2 years
     - Certificate number: CERT-2026-BUTTONNOSE-001
  6. Trainer signature (digital or uploaded scan)
  7. Expiration date (2 years from training date)

**Certificate Delivery:**
- Auto-email to employee within 24 hours
- Available for download in employee portal
- Stored in Firebase Storage (permanent record)
- HR can bulk-download all certificates

**Certificate Numbering Schema:**
```
CERT-[YEAR]-[COMPANY_SHORT]-[INCREMENT]
Example: CERT-2026-BUTTONNOSE-001
```

#### 9. COMPLIANCE RECORDS VAULT

**Auto-Generated Compliance Package (Post-Training):**

For each training session, system creates a compliance folder:
```
/compliance_records/[COMPANY]/[SESSION_DATE]/
  ├── attendance_roster_signed.pdf
  ├── certificates/
  │   ├── employee_001_cert.pdf
  │   ├── employee_002_cert.pdf
  │   └── ...
  ├── training_agenda.pdf (from your facilitator guide)
  ├── participant_list.csv
  ├── compliance_summary.pdf (auto-generated report)
  └── audit_trail.json (metadata for all actions)
```

**Compliance Summary Report Includes:**
- Total employees trained (count)
- Supervisor vs non-supervisor breakdown
- Attendance rate
- Certificates issued (count + list)
- Training duration verification (120 min or 60 min confirmed)
- Trainer credentials
- SB 513 compliance checklist ✓

**Retention:**
- All records retained for minimum 2 years (SB 513 requirement)
- Option to extend to 4+ years (PAGA recommendation)
- Auto-alerts before deletion eligibility

#### 10. COMPLIANCE DASHBOARD

**Consultant View (Your Dashboard):**
```
OVERVIEW
├── Active Clients: 5
├── Upcoming Training Sessions: 3 (next 30 days)
├── Employees Trained This Month: 42
├── Revenue This Month: $12,500
└── Compliance Alerts: 2 clients with overdue renewals

CLIENT LIST
[Button Nose Grooming]
├── Status: ✓ Compliant
├── Last Training: Jan 15, 2026
├── Next Renewal: Jan 15, 2028
├── Employees: 50 (15 supervisors, 35 employees)
├── Overdue: 0

[Client 2]
├── Status: ⚠️ ACTION REQUIRED
├── Last Training: N/A
├── Next Renewal: N/A
├── Employees: 25 (5 supervisors, 20 employees)
├── Overdue: 5 (need initial training)
```

**Client View (Their Dashboard):**
```
COMPLIANCE STATUS: ✓ COMPLIANT
├── Last Training: Jan 15, 2026
├── Next Renewal: Jan 15, 2028
├── Days Until Expiration: 729

EMPLOYEE TRAINING STATUS
├── Total Employees: 50
├── Trained: 50 (100%)
├── Pending: 0
├── Overdue: 0

UPCOMING TRAINING
├── Renewal Session: Jan 10, 2028 (scheduled)

DOCUMENTS
├── Harassment Prevention Policy (v1.0)
├── Employee Acknowledgment Form
├── Complaint Form
├── EEO Officer Contact Card

CERTIFICATES
├── Download All Certificates (ZIP)
├── Individual employee certificates (searchable by name)

REPORTS
├── Generate Compliance Audit Report
├── Training History Report
└── Certificate Verification Report
```

---

### PHASE 2: ADVANCED FEATURES (Post-MVP)

#### 11. LEAVE TRACKING & RETURN-TO-WORK
- Import leave dates from HR system
- Auto-pause training requirements during leave
- Auto-flag for makeup training upon return
- Calculate new due dates based on return date

#### 12. NEW HIRE AUTOMATION
- Webhook integration with ADP/Paychex/BambooHR
- Auto-add new employees to roster
- Auto-trigger onboarding email sequence
- Auto-calculate 6-month training deadline
- Auto-schedule to next available training session

#### 13. MULTI-LOCATION SUPPORT
- Separate training schedules per location
- Location-specific reporting channels
- Multiple EEO officers (one per site)
- Aggregate compliance reporting

#### 14. ADVANCED REPORTING & ANALYTICS
- Training completion rates over time
- Compliance risk scoring (% overdue)
- Department-level breakdowns
- Supervisor vs employee trends
- Export to Excel/PDF for audits

#### 15. E-SIGNATURE INTEGRATION
- DocuSign or HelloSign integration
- Digital policy acknowledgment
- Tracked + timestamped for legal defensibility
- Auto-archive signed documents

#### 16. AUDIT TRAIL & LEGAL DEFENSIBILITY
- Every action logged with timestamp + user
- "Who did what when" for investigations
- Immutable records (blockchain future?)
- Export full audit log for DFEH/court requests

#### 17. WHITE-LABEL CLIENT PORTAL
- Client's logo, colors, domain
- Embedded iframe option for their HR portal
- SSO integration (SAML, OAuth)

#### 18. MOBILE APP (iOS/Android)
- Employees scan QR code to sign attendance
- Push notifications for training reminders
- Mobile certificate wallet (like Apple Wallet)
- Quick policy reference guide

---

## 📋 CALIFORNIA COMPLIANCE REQUIREMENTS CHECKLIST

### SB 1343 Requirements ✓
- [x] 2-hour training for supervisors
- [x] 1-hour training for non-supervisors
- [x] Training within 6 months of hire/promotion
- [x] Renewal every 2 years
- [x] Interactive training format (live delivery)
- [x] All 11 mandatory content elements covered

### SB 513 Requirements ✓
- [x] Certificate with 5 required metadata fields
- [x] 2-year record retention
- [x] Training provider name
- [x] Training date
- [x] Training duration
- [x] Core competencies listed
- [x] Resulting qualification stated

### SB 778 Requirements ✓
- [x] Bystander intervention training included
- [x] 5 D's strategy demonstrated

### FEHA Requirements ✓
- [x] All 17 protected categories covered
- [x] Written policy distributed
- [x] Multiple reporting channels provided
- [x] Anti-retaliation protections stated

### Best Practice Extras ✓
- [x] EEO Officer designated
- [x] Complaint form provided
- [x] Attendance roster with signatures
- [x] Certificate generation automated
- [x] Automated reminders for renewals
- [x] Makeup training for absences
- [x] Leave-of-absence tracking
- [x] New hire automation

---

## 🚀 DEPLOYMENT & TECH STACK DETAILS

### Recommended: Firebase + Next.js

**Why Firebase?**
- Serverless (no infrastructure management)
- Real-time database (instant updates across devices)
- Built-in authentication
- File storage included
- Cloud functions for automation (scheduled reminders)
- Scales automatically
- Generous free tier ($0-25/month for small clients)

**Why Next.js?**
- React framework (modern, fast)
- Server-side rendering (SEO-friendly)
- API routes (backend + frontend in one repo)
- Vercel deployment (1-click, free for hobby projects)
- TypeScript support (type-safe code)

---

## 🎯 DATABASE SCHEMA (Firestore Collections)

```
/consultants
  /{consultantId}
    - name: string
    - email: string
    - phone: string
    - createdAt: timestamp
    
/companies
  /{companyId}
    - name: string
    - consultantId: string (foreign key)
    - employeeCount: number
    - industry: string
    - logoUrl: string
    - eeoOfficer: {
        name: string
        email: string
        phone: string
      }
    - reportingChannels: array<string>
    - policyVersion: string
    - createdAt: timestamp
    
/employees
  /{employeeId}
    - companyId: string (foreign key)
    - employeeNumber: string
    - firstName: string
    - lastName: string
    - email: string
    - phone: string
    - jobTitle: string
    - department: string
    - hireDate: timestamp
    - isSupervisor: boolean
    - employmentStatus: string (active/leave/terminated)
    - leaveStartDate: timestamp (nullable)
    - leaveEndDate: timestamp (nullable)
    - trainingStatus: string (pending/scheduled/completed/overdue)
    - lastTrainingDate: timestamp (nullable)
    - nextDueDate: timestamp (nullable)
    - certificateNumber: string (nullable)
    
/training_sessions
  /{sessionId}
    - companyId: string (foreign key)
    - sessionType: string (supervisor/employee)
    - date: timestamp
    - duration: number (minutes)
    - format: string (webinar/in-person/hybrid)
    - location: string
    - trainer: string
    - capacity: number
    - assignedEmployees: array<string> (employee IDs)
    - attendedEmployees: array<string> (employee IDs)
    - status: string (scheduled/completed/cancelled)
    
/certificates
  /{certificateId}
    - employeeId: string (foreign key)
    - companyId: string (foreign key)
    - sessionId: string (foreign key)
    - certificateNumber: string
    - issueDate: timestamp
    - expirationDate: timestamp
    - trainingType: string
    - duration: number
    - pdfUrl: string (Firebase Storage path)
    
/compliance_records
  /{recordId}
    - companyId: string (foreign key)
    - sessionId: string (foreign key)
    - attendanceRosterUrl: string
    - certificateUrls: array<string>
    - complianceSummaryUrl: string
    - auditTrailUrl: string
    - createdAt: timestamp
    
/reminders
  /{reminderId}
    - employeeId: string (foreign key)
    - reminderType: string (initial/renewal/makeup)
    - scheduledDate: timestamp
    - sent: boolean
    - sentAt: timestamp (nullable)
    
/audit_logs
  /{logId}
    - userId: string (consultant or employee)
    - action: string (login/create/update/delete/download)
    - resource: string (employee/session/certificate/etc)
    - resourceId: string
    - timestamp: timestamp
    - ipAddress: string
    - metadata: object
```

---

## 📦 FILE STRUCTURE (Next.js + Firebase)

```
hrbiz-compliance-lms/
├── .env.local                      # Firebase config (gitignored)
├── firebase.json                   # Firebase config
├── firestore.rules                 # Database security rules
├── functions/                      # Cloud Functions (Node.js)
│   ├── src/
│   │   ├── index.ts
│   │   ├── reminders.ts            # Scheduled reminder function
│   │   ├── certificates.ts         # Certificate generation
│   │   └── notifications.ts        # Email/SMS sending
│   └── package.json
├── public/                         # Static assets
│   ├── logo.png
│   └── certificate_template.html
├── src/
│   ├── app/                        # Next.js 14 app router
│   │   ├── (auth)/
│   │   │   ├── login/page.tsx
│   │   │   └── register/page.tsx
│   │   ├── (consultant)/           # Consultant portal
│   │   │   ├── dashboard/page.tsx
│   │   │   ├── clients/page.tsx
│   │   │   ├── clients/[id]/page.tsx
│   │   │   ├── sessions/page.tsx
│   │   │   └── reports/page.tsx
│   │   ├── (client)/               # Client portal
│   │   │   ├── dashboard/page.tsx
│   │   │   ├── employees/page.tsx
│   │   │   ├── documents/page.tsx
│   │   │   └── certificates/page.tsx
│   │   ├── api/                    # API routes
│   │   │   ├── employees/route.ts
│   │   │   ├── sessions/route.ts
│   │   │   ├── certificates/route.ts
│   │   │   └── reminders/route.ts
│   │   ├── layout.tsx
│   │   └── page.tsx
│   ├── components/                 # Reusable UI components
│   │   ├── ui/
│   │   │   ├── Button.tsx
│   │   │   ├── Table.tsx
│   │   │   ├── Card.tsx
│   │   │   └── Modal.tsx
│   │   ├── EmployeeRoster.tsx
│   │   ├── SessionScheduler.tsx
│   │   ├── CertificateViewer.tsx
│   │   └── ComplianceDashboard.tsx
│   ├── lib/
│   │   ├── firebase.ts             # Firebase SDK initialization
│   │   ├── firestore.ts            # Database helper functions
│   │   ├── storage.ts              # File upload/download
│   │   └── utils.ts                # Utility functions
│   └── types/
│       ├── Employee.ts
│       ├── TrainingSession.ts
│       └── Certificate.ts
├── package.json
├── tsconfig.json
└── README.md
```

---

