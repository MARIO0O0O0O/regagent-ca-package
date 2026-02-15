# MULTI-PROGRAM COMPLIANCE LMS - SOFTWARE BLUEPRINT UPDATE
## HRBizLMS v2.0 - Scalable Multi-Program Architecture

**Date:** February 6, 2026  
**Version:** 2.0 - Multi-Program Platform  
**Programs Supported:** Harassment Prevention (SB 1343) + Workplace Violence Prevention (SB 553)  

---

## 🎯 ARCHITECTURAL SHIFT: SINGLE-PROGRAM → MULTI-PROGRAM

### What Changed:
**v1.0 (Harassment Prevention Only):**
- Hardcoded for harassment prevention training
- Single certificate format
- 2-year renewal cycle
- Supervisor vs. employee distinction

**v2.0 (Multi-Program Platform):**
- ✅ **Program-agnostic architecture**
- ✅ **Modular program system** (add new programs without code rewrite)
- ✅ **Flexible renewal schedules** (annual, biennial, custom)
- ✅ **Program-specific requirements** (supervisor distinction, incident logs, plans)
- ✅ **Cross-program bundling** (package discounts, combined dashboards)
- ✅ **Compliance matrix view** (all programs per client)

---

## 📊 DATABASE SCHEMA UPDATES (Firestore)

### NEW COLLECTION: `/programs`

```typescript
/programs/{programId}
  - programCode: string ("HPP" | "WVPP" | "IIPP" | "HIP")
  - programName: string ("Harassment Prevention Program")
  - shortName: string ("Harassment Prevention")
  - regulatoryAuthority: string ("DFEH" | "Cal/OSHA" | "EDD" | etc.)
  - statute: string ("SB 1343" | "SB 553" | etc.)
  - trainingDurationMinutes: number (60 or 120)
  - renewalFrequencyMonths: number (24 for harassment, 12 for violence)
  - certificatePrefix: string ("CERT" | "WV" | "IIPP" | "HEAT")
  - requiresSupervisorDistinction: boolean (true for HPP, false for WVPP)
  - requiresWrittenPlan: boolean (false for HPP, true for WVPP/IIPP)
  - requiresIncidentLog: boolean (false for HPP, true for WVPP)
  - colorTheme: object {
      primary: "#1F497D" // Blue for harassment, Red for violence
      secondary: "#4F81BD"
      accent: "#C00000"
    }
  - active: boolean
  - createdAt: timestamp
```

**Seeded Programs:**
1. **Harassment Prevention (HPP)**
   - programCode: "HPP"
   - renewalFrequencyMonths: 24
   - requiresSupervisorDistinction: true
   - requiresWrittenPlan: false
   - certificatePrefix: "CERT"
   - colorTheme.primary: "#1F497D" (blue)

2. **Workplace Violence Prevention (WVPP)**
   - programCode: "WVPP"
   - renewalFrequencyMonths: 12
   - requiresSupervisorDistinction: false
   - requiresWrittenPlan: true
   - requiresIncidentLog: true
   - certificatePrefix: "WV"
   - colorTheme.primary: "#B22222" (red)

### UPDATED COLLECTION: `/companies`

```typescript
/companies/{companyId}
  - consultantId: string (FK)
  - name: string
  - address: string
  - industry: string
  - employeeCount: number
  - logoUrl: string
  
  // NEW: Program subscriptions
  - programs: array<{
      programId: string (FK → /programs)
      programCode: string ("HPP" | "WVPP")
      enrolledDate: timestamp
      active: boolean
      customSettings: object {
        // For WVPP
        wvppCoordinatorName?: string
        wvppCoordinatorEmail?: string
        // For HPP
        eeoOfficerName?: string
        eeoOfficerEmail?: string
      }
    }>
  
  - createdAt: timestamp
```

### UPDATED COLLECTION: `/employees`

```typescript
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
  - isSupervisor: boolean // Still used for HPP
  - employmentStatus: "active" | "leave" | "terminated"
  - leaveStartDate: timestamp?
  - leaveEndDate: timestamp?
  
  // NEW: Program-specific training status
  - trainingRecords: array<{
      programId: string (FK → /programs)
      programCode: string ("HPP" | "WVPP")
      trainingStatus: "pending" | "scheduled" | "completed" | "overdue"
      lastTrainingDate: timestamp?
      nextDueDate: timestamp?
      certificateNumber: string?
      sessionId: string? (FK → /training_sessions)
    }>
```

### UPDATED COLLECTION: `/training_sessions`

```typescript
/training_sessions/{sessionId}
  - companyId: string (FK)
  
  // NEW: Program reference
  - programId: string (FK → /programs)
  - programCode: string ("HPP" | "WVPP")
  
  - sessionType: "supervisor" | "employee" | "all" // "all" for programs like WVPP
  - date: timestamp
  - duration: number (minutes)
  - format: "webinar" | "in-person" | "hybrid"
  - location: string
  - trainer: string
  - capacity: number?
  - assignedEmployees: string[]
  - attendedEmployees: string[]
  - status: "scheduled" | "completed" | "cancelled"
  - attendanceRosterUrl: string?
```

### UPDATED COLLECTION: `/certificates`

```typescript
/certificates/{certificateId}
  - employeeId: string (FK)
  - companyId: string (FK)
  - sessionId: string (FK)
  
  // NEW: Program reference
  - programId: string (FK → /programs)
  - programCode: string ("HPP" | "WVPP")
  
  - certificateNumber: string (e.g., "CERT-2026-COMPANY-001" or "WV-2026-COMPANY-001")
  - issueDate: timestamp
  - expirationDate: timestamp
  - trainingType: "supervisor" | "employee" | "all"
  - duration: number (minutes)
  - pdfUrl: string
```

### NEW COLLECTION: `/program_plans` (for WVPP, IIPP, etc.)

```typescript
/program_plans/{planId}
  - companyId: string (FK)
  - programId: string (FK → /programs)
  - programCode: string ("WVPP" | "IIPP")
  - planName: string ("Workplace Violence Prevention Plan")
  - version: string ("v1.0")
  - documentUrl: string (Firebase Storage path to .docx/.pdf)
  - createdDate: timestamp
  - lastReviewDate: timestamp
  - nextReviewDueDate: timestamp
  - status: "draft" | "approved" | "active" | "archived"
  - approvedBy: string (name of approver)
  - approvalDate: timestamp?
  - employeeAcknowledgments: array<{
      employeeId: string
      acknowledgedDate: timestamp
      signatureUrl: string?
    }>
```

### NEW COLLECTION: `/incident_logs` (for WVPP)

```typescript
/incident_logs/{incidentId}
  - companyId: string (FK)
  - programId: string (FK → /programs) // WVPP program
  - incidentNumber: string ("VI-2026-001")
  - incidentDate: timestamp
  - incidentTime: string ("14:30")
  - location: string (specific area/department)
  - violenceType: 1 | 2 | 3 | 4 (Cal/OSHA categories)
  - description: string (narrative)
  - aggressorInfo: string (name, relationship)
  - targetInfo: string (may be redacted)
  - witnesses: string[]
  - injuriesOccurred: boolean
  - injuryDetails: string?
  - medicalTreatment: boolean
  - actionsTaken: string (security called, 911, first aid)
  - reportedToCalOSHA: boolean
  - followUpRequired: string
  - investigationCompletedDate: timestamp?
  - correctiveActions: string?
  - logEntryDate: timestamp
  - loggedBy: string (name, title)
  - attachments: array<string> (URLs to photos, reports)
```

---

## 🎨 FRONTEND UI UPDATES

### 1. PROGRAM SELECTOR (Consultant Dashboard)

**New Component:** `ProgramSelector.tsx`

**Visual Design:**
```
┌─────────────────────────────────────────────────────────┐
│  Program Management                                     │
├─────────────────────────────────────────────────────────┤
│                                                          │
│  [HPP] Harassment Prevention (SB 1343)         [Active] │
│  └─ 26 clients enrolled | 2-year renewal cycle         │
│                                                          │
│  [WVPP] Workplace Violence Prevention (SB 553) [Active] │
│  └─ 18 clients enrolled | Annual renewal               │
│                                                          │
│  [IIPP] Injury & Illness Prevention (Coming Soon)      │
│  └─ Launch: Q2 2026                                     │
│                                                          │
│  [+ Add New Program]                                    │
└─────────────────────────────────────────────────────────┘
```

### 2. MULTI-PROGRAM COMPANY DASHBOARD

**Updated Component:** `CompanyComplianceDashboard.tsx`

**Visual Design:**
```
┌──────────────────────────────────────────────────────────┐
│  Button Nose Grooming - Compliance Overview             │
├──────────────────────────────────────────────────────────┤
│                                                           │
│  ┌─────────────────────┬─────────────────────┐          │
│  │ Harassment          │ Violence            │          │
│  │ Prevention (HPP)    │ Prevention (WVPP)   │          │
│  ├─────────────────────┼─────────────────────┤          │
│  │ ✓ COMPLIANT         │ ✓ COMPLIANT         │          │
│  │                     │                     │          │
│  │ Last Training:      │ Last Training:      │          │
│  │ Jan 15, 2026        │ Feb 1, 2026         │          │
│  │                     │                     │          │
│  │ Next Renewal:       │ Next Renewal:       │          │
│  │ Jan 15, 2028        │ Feb 1, 2027         │          │
│  │ (729 days)          │ (364 days)          │          │
│  │                     │                     │          │
│  │ Employees Trained:  │ Employees Trained:  │          │
│  │ 50/50 (100%)        │ 50/50 (100%)        │          │
│  │                     │                     │          │
│  │ [View Details]      │ [View Details]      │          │
│  └─────────────────────┴─────────────────────┘          │
│                                                           │
│  Overall Compliance Score: 100% (2/2 programs)           │
│                                                           │
│  [+ Enroll in New Program]                               │
└──────────────────────────────────────────────────────────┘
```

### 3. PROGRAM-SPECIFIC EMPLOYEE ROSTER

**Updated Component:** `EmployeeRosterTable.tsx`

**New Columns:**
- Training Status columns now grouped by program
- Color-coded badges per program (blue for HPP, red for WVPP)

**Visual Design:**
```
┌───────────────────────────────────────────────────────────────────────┐
│  Employee Roster - Button Nose Grooming                              │
├───────────────────────────────────────────────────────────────────────┤
│  [Search] [Filter: All/Active/Leave] [Export CSV]                    │
├──────┬─────────────┬──────────┬───────────────────┬─────────────────┤
│ Name │ Job Title   │ Hire Date│ Harassment (HPP) │ Violence (WVPP)│
├──────┼─────────────┼──────────┼───────────────────┼─────────────────┤
│ John │ Manager     │ 01/15/20 │ ✓ Completed       │ ✓ Completed    │
│ Doe  │ (Supervisor)│          │ Exp: 01/15/2028   │ Exp: 02/01/2027│
│      │             │          │ [View Cert]       │ [View Cert]    │
├──────┼─────────────┼──────────┼───────────────────┼─────────────────┤
│ Jane │ Groomer     │ 03/10/22 │ ⚠️ Due in 30 days │ ✓ Completed    │
│ Smith│             │          │ Due: 03/10/2026   │ Exp: 02/01/2027│
│      │             │          │ [Schedule]        │ [View Cert]    │
├──────┼─────────────┼──────────┼───────────────────┼─────────────────┤
│ Bob  │ Receptionist│ 12/01/25 │ ⏳ Scheduled      │ ⏳ Scheduled   │
│ Lee  │             │          │ Sess: 03/15/2026  │ Sess: 03/15/26 │
│      │             │          │ [View Session]    │ [View Session] │
└──────┴─────────────┴──────────┴───────────────────┴─────────────────┘
```

### 4. UNIFIED TRAINING SCHEDULER

**Updated Component:** `TrainingScheduler.tsx`

**First Step: Select Program**
```
┌────────────────────────────────────────────┐
│  Schedule Training Session                 │
├────────────────────────────────────────────┤
│                                             │
│  Select Program:                           │
│                                             │
│  ○ Harassment Prevention (SB 1343)         │
│    └─ 2-hour (supervisors) / 1-hour (emp) │
│                                             │
│  ● Workplace Violence Prevention (SB 553)  │
│    └─ 1-hour (all employees)               │
│                                             │
│  [Next: Select Employees →]                │
└────────────────────────────────────────────┘
```

**Second Step: Session Details (Program-Specific)**

If **Workplace Violence** selected:
```
┌────────────────────────────────────────────┐
│  Workplace Violence Prevention Session     │
├────────────────────────────────────────────┤
│                                             │
│  Session Type: [All Employees] (fixed)     │
│  Duration: 60 minutes (1 hour)             │
│  Date: [03/15/2026] Time: [09:00 AM]       │
│  Format: [Webinar ▾] [In-Person] [Hybrid]  │
│  Location: [Main Office / Zoom Link]       │
│  Trainer: [Your Name]                      │
│                                             │
│  [← Back]  [Next: Assign Employees →]      │
└────────────────────────────────────────────┘
```

If **Harassment Prevention** selected:
```
┌────────────────────────────────────────────┐
│  Harassment Prevention Session             │
├────────────────────────────────────────────┤
│                                             │
│  Session Type: [Supervisor (2hr) ▾]       │
│  Duration: 120 minutes (2 hours)           │
│  Date: [03/15/2026] Time: [09:00 AM]       │
│  Format: [Webinar ▾] [In-Person] [Hybrid]  │
│  Location: [Main Office / Zoom Link]       │
│  Trainer: [Your Name]                      │
│                                             │
│  [← Back]  [Next: Assign Employees →]      │
└────────────────────────────────────────────┘
```

### 5. PROGRAM-SPECIFIC DOCUMENT VAULT

**New Component:** `ProgramDocumentsVault.tsx`

**Visual Design:**
```
┌──────────────────────────────────────────────────────────┐
│  Compliance Documents - Button Nose Grooming             │
├──────────────────────────────────────────────────────────┤
│                                                           │
│  ┌─ Harassment Prevention (HPP) ──────────────────────┐  │
│  │                                                      │  │
│  │  📄 Harassment Prevention Policy v1.0               │  │
│  │  📄 Employee Acknowledgment Form                    │  │
│  │  📄 Complaint Form Template                         │  │
│  │  📁 Certificates (50 files)                         │  │
│  │  📊 Compliance Summary Report (Jan 2026)            │  │
│  │                                                      │  │
│  └──────────────────────────────────────────────────────┘  │
│                                                           │
│  ┌─ Workplace Violence Prevention (WVPP) ─────────────┐  │
│  │                                                      │  │
│  │  📄 Workplace Violence Prevention Plan v1.0         │  │
│  │  📄 Violent Incident Report Form                    │  │
│  │  📊 Violent Incident Log (Excel)                    │  │
│  │  📁 Certificates (50 files)                         │  │
│  │  📁 Incident Reports (3 logged incidents)           │  │
│  │  📊 Compliance Summary Report (Feb 2026)            │  │
│  │                                                      │  │
│  └──────────────────────────────────────────────────────┘  │
│                                                           │
│  [Download All Documents (ZIP)]                          │
└──────────────────────────────────────────────────────────┘
```

### 6. VIOLENT INCIDENT LOG INTERFACE

**New Component:** `ViolentIncidentLog.tsx`

**Visual Design:**
```
┌──────────────────────────────────────────────────────────┐
│  Violent Incident Log - Button Nose Grooming             │
│  (Workplace Violence Prevention - SB 553 Requirement)    │
├──────────────────────────────────────────────────────────┤
│                                                           │
│  [+ Log New Incident]  [Export Log]  [Filter: All ▾]     │
│                                                           │
│  ┌────────────────────────────────────────────────────┐  │
│  │ VI-2026-001  │  02/15/2026  │  Type 2  │  Closed   │  │
│  ├────────────────────────────────────────────────────┤  │
│  │ Location: Front Desk                               │  │
│  │ Description: Customer became verbally aggressive   │  │
│  │ when denied refund. Security called. Customer     │  │
│  │ escorted out. No injuries.                        │  │
│  │                                                    │  │
│  │ Actions: Security response, incident report filed │  │
│  │ Follow-up: Additional de-escalation training for  │  │
│  │ front desk staff scheduled.                       │  │
│  │                                                    │  │
│  │ [View Full Report]  [Edit]  [Download PDF]        │  │
│  └────────────────────────────────────────────────────┘  │
│                                                           │
│  ┌────────────────────────────────────────────────────┐  │
│  │ VI-2026-002  │  02/20/2026  │  Type 3  │  Open     │  │
│  ├────────────────────────────────────────────────────┤  │
│  │ Location: Break Room                              │  │
│  │ Description: Employee made threatening comment... │  │
│  │ [View Full Report]                                │  │
│  └────────────────────────────────────────────────────┘  │
│                                                           │
│  Total Incidents: 2  │  Open: 1  │  Closed: 1          │
└──────────────────────────────────────────────────────────┘
```

---

## ⚙️ CLOUD FUNCTIONS UPDATES

### UPDATED FUNCTION: `sendDailyReminders`

**Now Program-Aware:**

```typescript
export const sendDailyReminders = functions.pubsub
  .schedule('0 9 * * *')
  .timeZone('America/Los_Angeles')
  .onRun(async (context) => {
    const db = admin.firestore();
    const now = admin.firestore.Timestamp.now();
    
    // Get all programs
    const programsSnapshot = await db.collection('programs')
      .where('active', '==', true)
      .get();
    
    const programs = new Map();
    programsSnapshot.forEach(doc => {
      programs.set(doc.id, doc.data());
    });
    
    // Get all active employees
    const employeesSnapshot = await db.collection('employees')
      .where('employmentStatus', '==', 'active')
      .get();
    
    const reminders = [];
    
    for (const employeeDoc of employeesSnapshot.docs) {
      const employee = employeeDoc.data();
      
      // Check each program the employee is enrolled in
      for (const trainingRecord of employee.trainingRecords || []) {
        const program = programs.get(trainingRecord.programId);
        if (!program) continue;
        
        if (!trainingRecord.nextDueDate) continue;
        
        const daysUntilDue = calculateDaysUntil(trainingRecord.nextDueDate, now);
        
        // Different reminder schedules per program
        const reminderDays = program.renewalFrequencyMonths === 12 
          ? [90, 60, 30, 14, 7] // Annual (WVPP)
          : [180, 90, 60, 30, 14, 7]; // Biennial (HPP)
        
        if (reminderDays.includes(daysUntilDue)) {
          reminders.push({
            to: employee.email,
            from: 'training@hrbiz.org',
            subject: `${program.shortName} Training Reminder: ${daysUntilDue} Days Until Due`,
            html: generateProgramSpecificEmail(employee, program, daysUntilDue, trainingRecord)
          });
        }
      }
    }
    
    if (reminders.length > 0) {
      await sgMail.send(reminders);
      console.log(`Sent ${reminders.length} program-specific reminder emails`);
    }
    
    return null;
  });
```

### UPDATED FUNCTION: `generateCertificate`

**Now Program-Aware:**

```typescript
export const generateCertificate = functions.firestore
  .document('training_sessions/{sessionId}')
  .onUpdate(async (change, context) => {
    const after = change.after.data();
    const before = change.before.data();
    
    if (after.status !== 'completed' || before.status === 'completed') {
      return null;
    }
    
    const db = admin.firestore();
    const sessionId = context.params.sessionId;
    
    // Get program details
    const programDoc = await db.collection('programs').doc(after.programId).get();
    const program = programDoc.data();
    
    console.log(`Generating certificates for ${program.programName} session ${sessionId}`);
    
    for (const employeeId of after.attendedEmployees || []) {
      const employeeDoc = await db.collection('employees').doc(employeeId).get();
      if (!employeeDoc.exists) continue;
      
      const employee = employeeDoc.data();
      
      // Generate program-specific certificate number
      const certNumber = `${program.certificatePrefix}-${new Date().getFullYear()}-${after.companyId.substring(0, 8).toUpperCase()}-${String(Math.floor(Math.random() * 1000)).padStart(3, '0')}`;
      
      // Generate PDF with program-specific colors and content
      const doc = new jsPDF({
        orientation: 'landscape',
        unit: 'in',
        format: 'letter'
      });
      
      // Use program-specific color theme
      doc.setTextColor(program.colorTheme.primary);
      doc.setFontSize(36);
      doc.text('CERTIFICATE OF COMPLETION', 5.5, 1.5, { align: 'center' });
      
      doc.setTextColor('#000000');
      doc.setFontSize(16);
      doc.text(program.programName, 5.5, 2.2, { align: 'center' });
      
      doc.setFontSize(24);
      doc.text(`${employee.firstName} ${employee.lastName}`, 5.5, 3.2, { align: 'center' });
      
      doc.setFontSize(14);
      doc.text(`Training Date: ${after.date.toDate().toLocaleDateString()}`, 5.5, 4, { align: 'center' });
      doc.text(`Duration: ${after.duration} minutes`, 5.5, 4.4, { align: 'center' });
      doc.text(`Certificate Number: ${certNumber}`, 5.5, 4.8, { align: 'center' });
      
      // Calculate expiration based on program renewal frequency
      const expirationDate = new Date(after.date.toDate().getTime() + (program.renewalFrequencyMonths * 30 * 24 * 60 * 60 * 1000));
      doc.text(`Valid Through: ${expirationDate.toLocaleDateString()}`, 5.5, 5.2, { align: 'center' });
      
      doc.setFontSize(10);
      doc.text(`Training Provider: HRBiz.org Compliance Consulting`, 5.5, 6, { align: 'center' });
      doc.text(`This certificate complies with California ${program.statute} requirements`, 5.5, 6.3, { align: 'center' });
      
      // Save to Storage
      const pdfBuffer = doc.output('arraybuffer');
      const bucket = storage.bucket();
      const file = bucket.file(`certificates/${after.companyId}/${program.programCode}/${certNumber}.pdf`);
      
      await file.save(Buffer.from(pdfBuffer), {
        contentType: 'application/pdf',
        metadata: {
          programId: after.programId,
          programCode: program.programCode,
          employeeId,
          sessionId,
          certificateNumber: certNumber
        }
      });
      
      const [pdfUrl] = await file.getSignedUrl({
        action: 'read',
        expires: '03-01-2500'
      });
      
      // Save certificate record
      await db.collection('certificates').add({
        employeeId,
        companyId: after.companyId,
        sessionId,
        programId: after.programId,
        programCode: program.programCode,
        certificateNumber: certNumber,
        issueDate: admin.firestore.FieldValue.serverTimestamp(),
        expirationDate: admin.firestore.Timestamp.fromDate(expirationDate),
        trainingType: after.sessionType,
        duration: after.duration,
        pdfUrl
      });
      
      // Update employee's training record for this program
      const updatedTrainingRecords = employee.trainingRecords.map((record: any) => {
        if (record.programId === after.programId) {
          return {
            ...record,
            trainingStatus: 'completed',
            lastTrainingDate: after.date,
            nextDueDate: admin.firestore.Timestamp.fromDate(expirationDate),
            certificateNumber: certNumber,
            sessionId
          };
        }
        return record;
      });
      
      await db.collection('employees').doc(employeeId).update({
        trainingRecords: updatedTrainingRecords
      });
      
      console.log(`Generated ${program.programCode} certificate ${certNumber} for ${employee.firstName} ${employee.lastName}`);
    }
    
    return null;
  });
```

### NEW FUNCTION: `schedulePlanReviews` (for WVPP/IIPP)

```typescript
export const schedulePlanReviews = functions.pubsub
  .schedule('0 8 * * 1') // Run weekly on Mondays at 8 AM
  .timeZone('America/Los_Angeles')
  .onRun(async (context) => {
    const db = admin.firestore();
    const now = admin.firestore.Timestamp.now();
    
    // Get all active program plans (WVPP, IIPP)
    const plansSnapshot = await db.collection('program_plans')
      .where('status', '==', 'active')
      .get();
    
    const reviewNotifications = [];
    
    for (const planDoc of plansSnapshot.docs) {
      const plan = planDoc.data();
      
      const daysUntilReview = calculateDaysUntil(plan.nextReviewDueDate, now);
      
      // Notify at 60, 30, 14, 7 days before review due
      if ([60, 30, 14, 7].includes(daysUntilReview)) {
        // Get company admin email
        const companyDoc = await db.collection('companies').doc(plan.companyId).get();
        const company = companyDoc.data();
        
        // Get consultant email
        const consultantDoc = await db.collection('consultants').doc(company.consultantId).get();
        const consultant = consultantDoc.data();
        
        reviewNotifications.push({
          to: consultant.email,
          cc: company.programs.find((p: any) => p.programCode === plan.programCode)?.customSettings?.wvppCoordinatorEmail,
          subject: `${plan.planName} Review Due in ${daysUntilReview} Days - ${company.name}`,
          html: generatePlanReviewEmail(plan, company, daysUntilReview)
        });
      }
    }
    
    if (reviewNotifications.length > 0) {
      await sgMail.send(reviewNotifications);
      console.log(`Sent ${reviewNotifications.length} plan review notifications`);
    }
    
    return null;
  });
```

---

## 📦 PROGRAM BUNDLING & PRICING

### Pricing Strategy

**Individual Programs:**
- Harassment Prevention: $5,250 initial + $1,500/year renewal
- Workplace Violence: $3,000 initial + $1,500/year renewal

**Bundle Discounts:**
- **Complete Compliance Bundle** (HPP + WVPP): $7,000 initial (save $1,250)
- **Tri-Program Bundle** (HPP + WVPP + IIPP): $10,000 initial (save $3,000)

**Monthly Retainer Tiers:**
- Basic (1 program): $500-800/mo
- Professional (2 programs): $1,200-1,500/mo
- Enterprise (3+ programs): $2,000-3,000/mo

### Bundle Code Implementation

```typescript
// New field in /companies collection
- bundles: array<{
    bundleId: string
    bundleName: string ("Complete Compliance Bundle")
    programIds: string[] (array of included program IDs)
    discountPercent: number (15%)
    enrolledDate: timestamp
    annualPrice: number (combined discounted price)
  }>
```

---

## 🚀 PHASED ROLLOUT PLAN

### Phase 1: Multi-Program Foundation (Week 1-2)
- [ ] Add `/programs` collection with HPP and WVPP seeded
- [ ] Update database schema (add program references to all collections)
- [ ] Update Firestore security rules (program-based access control)
- [ ] Build `ProgramSelector` component

### Phase 2: WVPP Integration (Week 3-4)
- [ ] Build WVPP onboarding wizard (plan generation)
- [ ] Build `ViolentIncidentLog` interface
- [ ] Update training scheduler for program selection
- [ ] Update certificate generation for program-specific formats
- [ ] Add program-specific colors to UI

### Phase 3: Multi-Program Dashboard (Week 5)
- [ ] Build multi-program company compliance dashboard
- [ ] Update employee roster with program columns
- [ ] Build program-specific document vault
- [ ] Add cross-program filtering and reporting

### Phase 4: Testing & Deployment (Week 6)
- [ ] Test with Button Nose Grooming (pilot both programs)
- [ ] Generate WVPP + WVPP certificates
- [ ] Test incident logging
- [ ] Deploy to production

### Phase 5: IIPP & Heat Illness (Q2 2026)
- [ ] Add IIPP program (Injury & Illness Prevention)
- [ ] Add Heat Illness Prevention program
- [ ] Build industry-specific customizations
- [ ] Launch bundled offerings

---

## 📊 BUSINESS IMPACT

### Revenue Projections (Multi-Program vs Single-Program)

**Single-Program (v1.0 - Harassment Only):**
- 10 clients × $5,250 initial = $52,500
- 10 clients × $1,500/year renewal = $15,000/year
- **Total Year 1:** $67,500

**Multi-Program (v2.0 - Harassment + Violence):**
- 10 clients × $7,000 bundle initial = $70,000
- 10 clients × $3,000/year combined renewals = $30,000/year
- **Total Year 1:** $100,000 (+48% increase)

**With Retainer Conversions:**
- 6 clients convert to Professional tier ($1,200/mo) = $86,400/year
- **Total Year 1:** $156,400 (+132% increase)

### Client Stickiness Improvement
- Single program: 1 touchpoint every 2 years
- Two programs (HPP annual, WVPP biennial): 3 touchpoints over 2 years
- Three programs: 5+ touchpoints over 2 years
- **Result:** Higher retention, more upsell opportunities

---

## 🎯 KEY ARCHITECTURAL PRINCIPLES

1. **Program-Agnostic Core:** All features work across any program type
2. **Modular Design:** Add new programs without code rewrite
3. **Backward Compatible:** Existing harassment-only clients work seamlessly
4. **Flexible Scheduling:** Support any renewal frequency (monthly, annual, biennial)
5. **Program-Specific Extensions:** Incident logs, plans, forms only where required

---

**STATUS:** Ready for Implementation  
**ESTIMATED DEVELOPMENT TIME:** 6 weeks (phased rollout)  
**BUSINESS VALUE:** +48% revenue increase (program bundling) + higher retention  

---

END OF BLUEPRINT
