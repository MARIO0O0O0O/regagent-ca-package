# HRbiz Training Prototype - 8-Hour Build Plan
## Functional MVP for 50 Employees Using Public Content

**Goal:** Deploy a working training platform TODAY that can:
- Deliver harassment prevention training to 50 employees
- Track completion status
- Issue certificates
- Meet SB 1343 compliance requirements

**Timeline:** 8 hours (1 working day)
**Cost:** $0-50 (essentially free)
**Tech:** Google Workspace + Public CRD content

---

## PHASE 1: SETUP & INFRASTRUCTURE (Hour 1)

### Tools You'll Use (All Free/Existing)

**Core Platform: Google Sites** (Free)
- Employee-facing training portal
- No coding required
- Mobile responsive
- Tracks visits automatically

**Content Management: Google Drive** (Free)
- Host training materials
- Share videos/documents
- Control access permissions

**Quiz Engine: Google Forms** (Free)
- Auto-graded assessments
- Tracks responses automatically
- Timestamp compliance

**Tracking: Google Sheets** (Free)
- Roster management
- Completion tracking
- Certificate log

**Certificates: Google Apps Script + Autocrat Add-on** (Free)
- Auto-generate PDF certificates
- Email delivery
- Merge employee data

### Hour 1 Tasks - Setup (60 minutes)

**Minutes 0-15: Account Setup**
```
□ Create dedicated Google account: training@hrbiz.org
□ Enable Google Sites, Forms, Sheets, Drive
□ Create folder structure:
  /HRbiz Training Platform
    /Content (Public Materials)
    /Quizzes
    /Certificates
    /Employee Roster
```

**Minutes 15-30: Create Training Site**
```
□ Go to sites.google.com
□ Click "+" Create new site
□ Name: "HRbiz Compliance Training"
□ Choose template: "Simple" or "Blank"
□ Create 5 pages:
  - Home (Welcome + Instructions)
  - Harassment Prevention Training
  - Workplace Violence Prevention
  - Quiz & Certificate
  - Resources
```

**Minutes 30-45: Build Employee Roster**
```
□ Create Google Sheet: "Employee Training Roster"
□ Columns:
  - Employee ID
  - First Name
  - Last Name
  - Email Address
  - Position (Supervisor/Non-Supervisor)
  - Hire Date
  - Training Type Required (1hr/2hr)
  - Training Assigned Date
  - Training Started Date/Time
  - Training Completed Date/Time
  - Quiz Score
  - Certificate Number
  - Certificate Issued Date
□ Import your 50 employees (copy/paste from existing list)
□ Add data validation (dropdowns for Position)
```

**Minutes 45-60: Set Up Tracking Form**
```
□ Create Google Form: "Training Registration"
□ Questions:
  1. Email (auto-collect)
  2. Full Name
  3. Employee ID
  4. I confirm I will complete training honestly [Checkbox]
□ Link form responses to Roster sheet (auto-populate)
□ This creates audit trail of who started when
```

---

## PHASE 2: CONTENT SOURCING & INTEGRATION (Hour 2)

### Public Training Content Sources (FREE)

**1. California Civil Rights Department (CRD)**

**Primary Resource: CRD Free Online Training**
- URL: https://www.dfeh.ca.gov/shpt/
- **Supervisor Training (2 hours):** Available as interactive online course
- **Non-Supervisor Training (1 hour):** Separate course
- **Features:**
  - Fully compliant with SB 1343
  - Interactive scenarios
  - Spanish + English versions
  - Printable certificates (can be replaced with yours)

**How to Use:**
```
Option A (Simplest): 
□ Direct link employees to CRD site
□ They take training there
□ Screenshot/download CRD certificate
□ Upload to your Google Form as proof

Option B (Integrated):
□ Embed CRD training videos into your Google Site
□ Use their content, your tracking
□ Issue your own certificates after completion
```

**2. CRD Downloadable Materials** (Supplementary)
- Harassment Prevention Guide (PDF): https://calcivilrights.ca.gov/wp-content/uploads/sites/32/2025/04/Harassment-Prevention-Guide-2025.pdf
- Sample EEO Policy: Available on CRD site
- Model Complaint Form: CRD templates

**3. EEOC Training Materials** (Supplementary)
- Promising Practices Guide: https://www.eeoc.gov/laws/guidance/promising-practices-preventing-harassment
- Training Institute Resources: https://www.eeoc.gov/training-institute

**4. Cal/OSHA (Workplace Violence - SB 553)**
- Workplace Violence Prevention Guide: https://www.dir.ca.gov/dosh/Workplace-Violence/
- Model Plan Template: Available on DIR website
- Training Video: Cal/OSHA YouTube channel

### Hour 2 Tasks - Content Integration (60 minutes)

**Minutes 0-20: Download Public Content**
```
□ Download CRD Harassment Prevention Guide PDF
□ Download CRD Sample Policy templates
□ Download Cal/OSHA Violence Prevention Guide
□ Bookmark CRD training site links
□ Save all to Google Drive /Content folder
□ Set sharing to "Anyone with link can view"
```

**Minutes 20-40: Create Training Pages**

**Harassment Prevention Page:**
```
□ Headline: "Sexual Harassment Prevention Training (Required)"
□ Subtext: "California Law (SB 1343) requires this training"

□ Section 1: Pre-Training Materials
  - Embed PDF: "Before You Begin - Read This Policy"
  - Link to your harassment_prevention_policy.html
  - Estimated time: 10 minutes

□ Section 2: Interactive Training
  [Two options - pick one]
  
  OPTION A (Recommended - Use CRD Directly):
  - Add button: "Start Supervisor Training (2 hours)"
    Link: https://www.dfeh.ca.gov/shpt/ 
  - Add button: "Start Employee Training (1 hour)"
    Link: https://www.dfeh.ca.gov/shpt/
  - Instructions: 
    "1. Click the link for your role
     2. Complete the entire training
     3. Download your completion certificate
     4. Return here and submit proof below"
  
  OPTION B (Embed Content):
  - Embed CRD training videos (if available as YouTube)
  - List key learning objectives
  - Add your own scenarios from project content

□ Section 3: Knowledge Check
  - Link to Google Form quiz (created in Hour 3)
  - Required score: 80%
  - Unlimited attempts

□ Section 4: Certificate
  - Auto-issued upon quiz completion
  - Delivered via email
```

**Violence Prevention Page:**
```
□ Headline: "Workplace Violence Prevention (SB 553)"
□ Embed Cal/OSHA guide PDF
□ Link to your violence prevention plan
□ Short video: "Recognizing and Reporting Violence"
  (Use Cal/OSHA YouTube if available, or create 5-min recording)
□ Link to incident reporting form (Google Form)
□ Knowledge check quiz
```

**Minutes 40-60: Build Resource Library**
```
□ Create "Download Center" on Resources page:
  - Your harassment_prevention_policy.html
  - Your complaint forms
  - Your investigation flowchart
  - Quick reference guides
  - CRD contact information
  - EEOC filing instructions

□ Add FAQ section (copy from your project docs)
  - What is harassment?
  - How do I report?
  - What if I'm a supervisor?
  - What are my rights?

□ Add contact info:
  - HR contact email
  - Anonymous reporting option
  - External resources (CRD, EEOC)
```

---

## PHASE 3: ASSESSMENT & QUIZZES (Hour 3)

### Quiz Development Using Public Content

**Source Material for Questions:**
- CRD Harassment Prevention Guide (pages with scenarios)
- EEOC Enforcement Guidance examples
- Your existing project knowledge

### Hour 3 Tasks - Build Quizzes (60 minutes)

**Minutes 0-30: Harassment Prevention Quiz**

```
□ Create Google Form: "Harassment Prevention Knowledge Check"

□ Settings:
  ✓ Collect email addresses
  ✓ Limit to 1 response (or allow multiple if they fail)
  ✓ Make this a quiz
  ✓ Release grades: Immediately after submission
  ✓ Respondent can see: Correct answers, Points

□ Set point values:
  - 15 questions × 1 point = 15 total
  - Passing score: 12/15 (80%)

□ Questions (Use Multiple Choice format):

QUESTION 1 (from CRD Guide):
"Which of the following is protected under California's FEHA?"
○ Race, religion, and national origin only
○ Sex, sexual orientation, and gender identity only
● All of the above plus age, disability, marital status, and more [CORRECT]
○ Only characteristics listed in the company handbook

QUESTION 2 (Scenario from CRD):
"A supervisor overhears employees making jokes about a coworker's accent. What should the supervisor do?"
○ Ignore it unless the coworker complains
● Immediately intervene and report to HR [CORRECT]
○ Laugh along to avoid seeming uptight
○ Tell the coworker to toughen up

QUESTION 3:
"How soon must new supervisors receive harassment prevention training?"
○ Within 30 days of hire
● Within 6 months of assumption of supervisory position [CORRECT]
○ Within 1 year
○ No specific deadline

QUESTION 4 (Bystander intervention):
"You witness harassment but are not involved. What should you do?"
○ Mind your own business
● Intervene safely or report to HR [CORRECT]
○ Wait until the victim complains
○ Only act if asked

QUESTION 5:
"Retaliation against someone who reports harassment is:"
○ Legal if done subtly
● Illegal under FEHA [CORRECT]
○ Only illegal if proven
○ Allowed within 30 days

[Continue with 10 more questions - pull from your project content]
- Protected categories definitions
- Complaint procedures
- Investigation process
- Supervisor responsibilities
- Third-party harassment
```

**Minutes 30-45: Violence Prevention Quiz**

```
□ Create Google Form: "Workplace Violence Prevention Quiz"

□ 10 Questions covering:
  - Types of workplace violence (Type 1-4)
  - Reporting procedures
  - Warning signs
  - Emergency response
  - Incident log requirements

SAMPLE QUESTIONS:

"Type 2 workplace violence involves:"
● Violence by customers, clients, or visitors [CORRECT]
○ Violence by coworkers
○ Domestic violence in workplace
○ Criminal activity by strangers

"If you witness a violent incident, you must:"
○ Handle it yourself
● Report immediately per company policy [CORRECT]
○ Wait until your next shift
○ Only report if someone is injured

[Add 8 more from Cal/OSHA guidelines]
```

**Minutes 45-60: Link Quizzes to Tracking**

```
□ Open each quiz's responses settings
□ Click "Link to Sheets"
□ Create new spreadsheet: "Quiz Results - [Topic]"

□ In main Employee Roster sheet, add formula:
  =VLOOKUP(B2, 'Quiz Results'!A:D, 4, FALSE)
  (This pulls quiz scores into main roster)

□ Set up conditional formatting:
  - Green if score ≥80%
  - Red if <80%
  - Yellow if not attempted

□ Create filter view: "Incomplete Training"
  - Show only employees with no score or score <80%
```

---

## PHASE 4: CERTIFICATE GENERATION (Hour 4)

### Automated Certificate System

**Tool: Autocrat Add-on for Google Sheets** (Free)

### Hour 4 Tasks - Certificate Setup (60 minutes)

**Minutes 0-20: Design Certificate Template**

```
□ Create Google Doc: "Training Certificate Template"

□ Design layout:
────────────────────────────────────────────────────
│                                                  │
│         [YOUR COMPANY LOGO]                      │
│                                                  │
│        CERTIFICATE OF COMPLETION                 │
│                                                  │
│              This certifies that                 │
│                                                  │
│              {{First Name}} {{Last Name}}        │
│                                                  │
│         has successfully completed the           │
│                                                  │
│    California Harassment Prevention Training    │
│                                                  │
│  In compliance with California Government Code   │
│   § 12950.1 and 2 CCR § 11024 (SB 1343)        │
│                                                  │
│  Training Provider: HRbiz.org                    │
│  Training Duration: {{Duration}} hours           │
│  Completion Date: {{Completion Date}}            │
│  Certificate Number: {{Certificate Number}}      │
│  Core Competencies:                             │
│   • Recognition of prohibited conduct under FEHA│
│   • Supervisor reporting obligations            │
│   • Complaint procedures and investigation      │
│   • Anti-retaliation protections                │
│   • Practical prevention strategies             │
│                                                  │
│  Quiz Score: {{Score}}%                         │
│  Status: PASSED                                 │
│                                                  │
│  Authorized by: [Your Name]                     │
│  Title: HR Compliance Director                  │
│                                                  │
│  Verification: hrbiz.org/verify/{{Cert Number}} │
│                                                  │
────────────────────────────────────────────────────

□ Use merge fields syntax: {{Field Name}}
□ These will auto-populate from spreadsheet
□ Format professionally (use borders, professional font)
□ Add footer: "This certificate meets California Labor Code § 1198.5 (SB 513) training record requirements"
```

**Minutes 20-40: Install & Configure Autocrat**

```
□ Open Employee Roster spreadsheet
□ Extensions → Add-ons → Get add-ons
□ Search "Autocrat"
□ Install (free, by New Visions Cloudlab)

□ Configure Autocrat:
  1. Extensions → Autocrat → Launch
  2. Click "New Job"
  3. Name: "Training Certificates"
  4. Choose source sheet: "Employee Roster"
  5. Choose template: "Training Certificate Template"
  6. Map merge fields:
     - {{First Name}} → Column B
     - {{Last Name}} → Column C
     - {{Duration}} → Column H
     - {{Completion Date}} → Column J
     - {{Certificate Number}} → Column L
     - {{Score}} → Column K
  7. Set trigger: "When form submitted" (from quiz)
  8. Output: PDF to Drive folder + Email to employee

□ Test with one sample row
```

**Minutes 40-50: Set Up Auto-Numbering**

```
□ In Employee Roster, add formula for Certificate Number:
  Column L: =IF(J2<>"", "HRB-2026-"&TEXT(ROW(),"000"), "")
  (Creates: HRB-2026-001, HRB-2026-002, etc.)

□ Add formula for SB 513 metadata:
  Create hidden column with JSON:
  {
    "employee": "{{Name}}",
    "provider": "HRbiz.org",
    "date": "{{Date}}",
    "duration": "{{Hours}}",
    "competencies": [
      "FEHA compliance",
      "Supervisor duties",
      "Investigation procedures",
      "Anti-retaliation"
    ],
    "certification": "CA Harassment Prevention Certificate",
    "statutory_authority": "Gov Code § 12950.1"
  }
```

**Minutes 50-60: Create Verification Page**

```
□ Add page to Google Site: "Verify Certificate"

□ Embed Google Form:
  - Field 1: "Enter Certificate Number"
  - Field 2: "Enter Employee Last Name"
  
□ Create Apps Script to check:
  - Look up certificate number in roster
  - Verify name matches
  - Display: Valid/Invalid + issue date

□ Publish form on site
□ Test verification flow
```

---

## PHASE 5: EMPLOYEE ENROLLMENT (Hour 5)

### Mass Communication & Onboarding

### Hour 5 Tasks - Launch Preparation (60 minutes)

**Minutes 0-20: Create Welcome Email Template**

```
□ Draft in Gmail or Google Docs:

Subject: [ACTION REQUIRED] Complete Your Harassment Prevention Training by [DATE]

Dear [Employee Name],

California law requires all employees to complete harassment prevention training. We've created a simple online training platform to help you meet this requirement.

YOUR TRAINING ASSIGNMENT:
• Course: [Harassment Prevention - Supervisor/Employee]
• Duration: [1 or 2 hours]
• Due Date: [7 days from now]
• Passing Score: 80%

HOW TO COMPLETE:
1. Visit: [Your Google Site URL]
2. Click "Start Training" 
3. Complete all modules
4. Pass the knowledge check quiz
5. Download your certificate

WHY THIS MATTERS:
✓ Legal requirement (California SB 1343)
✓ Creates safer workplace for everyone
✓ Required every 2 years

NEED HELP?
• Email: training@hrbiz.org
• Phone: [Your number]
• FAQ: [Link to FAQ page]

Please complete by [DATE]. If you don't finish on time, we'll need to follow up.

Thank you,
[Your Name]
HR Compliance Team

---
This training meets California Labor Code requirements including SB 513 recordkeeping standards.
```

**Minutes 20-35: Set Up Email Distribution**

```
□ Option A - Gmail Mail Merge (Free with add-on):
  1. Install "Yet Another Mail Merge" (YAMM) add-on
  2. Create draft email with merge fields
  3. Send from Employee Roster spreadsheet
  4. Track opens (YAMM feature)

□ Option B - Manual BCC (If <50 employees):
  1. Copy all 50 emails from roster
  2. BCC everyone
  3. Personalize with each person's training type
  
□ Include in email:
  - Direct link to Google Site
  - Employee's specific course assignment
  - Deadline (recommend 7-14 days)
  - Support contact
```

**Minutes 35-50: Create Reminder Sequences**

```
□ Set up automated reminders using Google Calendar:

DAY 1: Welcome email (sent)
DAY 3: Check-in email for non-starters
  "Hi [Name], Just checking if you had any issues accessing 
   the training. Let me know if you need help."

DAY 5: Reminder for incomplete
  "You're halfway through! Don't forget to finish by [date]."

DAY 7: Final reminder
  "Last chance to complete training by [deadline]."

DAY 8: Escalation notice
  "Your training is overdue. Please complete immediately.
   Failure to comply may affect your employment status."

□ Create these as Gmail drafts
□ Use Google Calendar to remind you to send
□ Or use YAMM scheduled send feature
```

**Minutes 50-60: Build Dashboard for HR**

```
□ Create new sheet: "Training Dashboard"

□ Add these summary formulas:

TOTAL EMPLOYEES: =COUNTA(Roster!B:B)-1
TRAINING ASSIGNED: =COUNTIF(Roster!H:H, "<>")
TRAINING STARTED: =COUNTIF(Roster!I:I, "<>")
TRAINING COMPLETED: =COUNTIF(Roster!J:J, "<>")
COMPLETION RATE: =J4/J2

SUPERVISORS - 2HR REQUIRED: =COUNTIF(Roster!E:E, "Supervisor")
SUPERVISORS COMPLETED: =COUNTIFS(Roster!E:E, "Supervisor", Roster!J:J, "<>")

EMPLOYEES - 1HR REQUIRED: =COUNTIF(Roster!E:E, "Employee")
EMPLOYEES COMPLETED: =COUNTIFS(Roster!E:E, "Employee", Roster!J:J, "<>")

AVERAGE QUIZ SCORE: =AVERAGE(Roster!K:K)
FAILED ATTEMPTS: =COUNTIF(Roster!K:K, "<80")

□ Add charts:
  - Pie chart: Completed vs. Incomplete
  - Bar chart: By department
  - Timeline: Completions over time

□ Share dashboard with management
```

---

## PHASE 6: INCIDENT REPORTING (Hour 6)

### Complaint & Violence Incident Forms

### Hour 6 Tasks - Reporting Systems (60 minutes)

**Minutes 0-25: Harassment Complaint Form**

```
□ Create Google Form: "Confidential Harassment Complaint"

□ Introduction text:
"This form allows you to report harassment, discrimination, or retaliation. Your complaint will be investigated promptly and confidentially. Retaliation against anyone who reports in good faith is illegal and prohibited."

□ Form sections:

SECTION 1: YOUR INFORMATION
- Email (auto-collect)
- Full Name
- Employee ID
- Department
- Supervisor Name
- Phone Number (optional)
□ Would you like to remain anonymous? [Yes/No]
  (If Yes, skip email collection)

SECTION 2: COMPLAINT DETAILS
- Type of Complaint [Dropdown]:
  ○ Sexual harassment
  ○ Discrimination (specify protected class)
  ○ Retaliation
  ○ Hostile work environment
  ○ Other
- Describe the incident [Long text]
- Date(s) of incident(s) [Date picker]
- Time (if known) [Short text]
- Location(s) [Short text]

SECTION 3: PERSON(S) INVOLVED
- Name of person(s) you're complaining about [Short text]
- Their role/title [Short text]
- Relationship to you [Dropdown]:
  ○ Supervisor
  ○ Coworker
  ○ Subordinate
  ○ Customer/Client
  ○ Vendor
  ○ Other

SECTION 4: WITNESSES
- Were there witnesses? [Yes/No]
- If yes, list names [Long text]
- Do you have any evidence? [Checkboxes]:
  □ Emails
  □ Text messages
  □ Photos
  □ Documents
  □ Other
- Can you provide copies? [Yes/No]

SECTION 5: PRIOR COMPLAINTS
- Have you reported this before? [Yes/No]
- If yes, when and to whom? [Short text]
- What was the outcome? [Short text]

SECTION 6: DESIRED OUTCOME
- What would you like to happen? [Long text]
- Are you willing to participate in investigation? [Yes/No]

ACKNOWLEDGMENT:
□ I certify this complaint is made in good faith
□ I understand false complaints may result in discipline
□ I understand retaliation is prohibited

□ Submit button

□ Confirmation message:
"Thank you. Your complaint has been received. You will be contacted within 2 business days. Case number: {{Form Response ID}}"

□ Send confirmation email with:
  - Case number
  - Next steps
  - Timeline
  - Retaliation warning
  - Contact info
```

**Minutes 25-45: Violence Incident Report (SB 553)**

```
□ Create Google Form: "Workplace Violence Incident Report"

□ Introduction:
"California law (SB 553) requires all workplace violence incidents be documented. Complete this form immediately after any incident."

SECTION 1: INCIDENT DETAILS
- Date of Incident [Date]
- Time of Incident [Time]
- Location (specific) [Short text]
- Type of Violence [Dropdown]:
  ○ Type 1: Criminal intent (no business relationship)
  ○ Type 2: Customer/client violence
  ○ Type 3: Employee-to-employee
  ○ Type 4: Personal relationship violence
- Brief Description [Long text]

SECTION 2: INVOLVED PARTIES
- Victim Name(s) [Short text]
- Victim Role [Short text]
- Perpetrator Description [Long text]:
  (Name if known, or physical description)
- Perpetrator Type [Dropdown]:
  ○ Stranger/Unknown
  ○ Customer/Client
  ○ Current Employee
  ○ Former Employee
  ○ Personal relationship to employee
  ○ Other

SECTION 3: INCIDENT NATURE
- Physical contact occurred? [Yes/No]
- Verbal threats made? [Yes/No]
- Weapons involved? [Yes/No]
  If yes, describe: [Short text]
- Injuries sustained? [Yes/No]
  If yes, describe: [Long text]

SECTION 4: RESPONSE
- Law enforcement called? [Yes/No]
  If yes, case number: [Short text]
- Security involved? [Yes/No]
- Medical attention needed? [Yes/No]
- Employee taken off site? [Yes/No]

SECTION 5: WITNESS INFORMATION
- Witnesses present? [Yes/No]
- Witness names: [Long text]

SECTION 6: PREVENTION
- Warning signs present? [Yes/No]
- Could incident have been prevented? [Yes/No]
- Suggestions for prevention: [Long text]

□ Submit

□ Auto-send to:
  - HR/Safety Manager (immediate)
  - Create entry in Violent Incident Log
  - Trigger investigation workflow
```

**Minutes 45-60: Incident Log & Tracking**

```
□ Create spreadsheet: "Violent Incident Log - 2026"

□ Columns (SB 553 compliant):
  - Log Entry ID
  - Date Reported
  - Date of Incident
  - Time of Incident
  - Location
  - Incident Type (1-4)
  - Description (REDACTED for employee viewing)
  - Perpetrator Classification
  - Employee Activity at Time
  - Witnesses (REDACTED)
  - Law Enforcement Case #
  - Injuries
  - Actions Taken
  - Investigation Status
  - Investigation Completed Date
  - Root Cause
  - Corrective Actions
  - Assigned To
  - Status (Open/Closed)

□ Create two versions:
  1. FULL LOG (HR only - Google Sheet)
  2. REDACTED LOG (Employee viewing - Google Site page)
     - Remove names
     - Remove identifying details
     - Keep incident types, dates, corrective actions

□ Publish redacted version to site: "Incident Log"
□ Update monthly
□ Retain for 5 years (SB 553 requirement)
```

---

## PHASE 7: TESTING & QUALITY CHECK (Hour 7)

### End-to-End Testing

### Hour 7 Tasks - Testing (60 minutes)

**Minutes 0-20: Test Employee Flow**

```
□ Create test employee account (yourself)
□ Complete full training workflow:
  1. Receive welcome email ✓
  2. Click link to site ✓
  3. Navigate to training page ✓
  4. View pre-training materials ✓
  5. Complete training module ✓
  6. Take quiz ✓
  7. Pass quiz (score >80%) ✓
  8. Receive certificate email ✓
  9. Download certificate ✓
  10. Verify certificate on site ✓

□ Check timing: Full process should take 1-2 hours for employee

□ Test mobile experience:
  - Open site on phone
  - Check readability
  - Test form submission
  - Verify certificate displays properly
```

**Minutes 20-35: Test Tracking & Admin**

```
□ Check roster auto-population:
  - Quiz submission updates roster ✓
  - Completion date stamps correctly ✓
  - Certificate number generates ✓
  - Email triggers to employee ✓
  
□ Test dashboard:
  - Completion rates calculate ✓
  - Charts update ✓
  - Filters work ✓
  
□ Test incident reporting:
  - Complaint form submits ✓
  - Confirmation email sends ✓
  - Log updates automatically ✓
```

**Minutes 35-50: Test Edge Cases**

```
□ What if employee fails quiz?
  - Can retake? ✓
  - How many attempts? (Set to unlimited)
  - Score updates properly? ✓

□ What if email bounces?
  - Check bounce logs
  - Have backup contact method
  
□ What if employee can't access?
  - Test link on different browsers
  - Test without Google account (if applicable)
  - Create troubleshooting guide

□ What if certificate doesn't generate?
  - Test Autocrat triggers
  - Check permissions
  - Have manual backup process
```

**Minutes 50-60: Create Support Documentation**

```
□ Create "Admin Guide" Google Doc:
  - How to add new employees
  - How to manually issue certificate
  - How to pull completion reports
  - How to respond to complaints
  - How to update content
  - Troubleshooting common issues

□ Create "Employee FAQ" on site:
  - How long does training take?
  - Can I pause and resume?
  - What if I fail the quiz?
  - Who do I contact for help?
  - Is this anonymous?
  - When do I need to retake?
```

---

## PHASE 8: LAUNCH & MONITOR (Hour 8)

### Go Live & Initial Support

### Hour 8 Tasks - Launch (60 minutes)

**Minutes 0-15: Final Pre-Flight Check**

```
CRITICAL CHECKLIST:
□ All 50 employee emails in roster ✓
□ Supervisor vs. Employee designation correct ✓
□ Google Site published (not draft) ✓
□ All forms accepting responses ✓
□ Certificate template has correct company name ✓
□ Autocrat triggers enabled ✓
□ Welcome email draft ready ✓
□ Dashboard shared with management ✓
□ You have admin access to all tools ✓
□ Backup email address set up (training@) ✓
```

**Minutes 15-30: LAUNCH - Send Invites**

```
□ Final review of welcome email
□ Customize for your company
□ Set deadline (recommend 14 days from today)
□ Send to all 50 employees via YAMM or BCC
□ Send copy to yourself as confirmation
□ Post announcement in company Slack/Teams:
  
  "📢 IMPORTANT: Harassment Prevention Training Launch
   All employees must complete required training by [DATE].
   Check your email for instructions. Questions? 
   Reply here or email training@hrbiz.org"
```

**Minutes 30-50: Monitor First Responses**

```
□ Watch dashboard for first completions
□ Check for error emails
□ Monitor form submissions
□ Be ready to respond to questions immediately

□ Common Day 1 issues:
  - "I can't access the site" → Check email/permissions
  - "Quiz won't submit" → Check internet connection
  - "I didn't get certificate" → Check spam, re-trigger Autocrat
  - "How long will this take?" → 1-2 hours
```

**Minutes 50-60: Set Up Ongoing Monitoring**

```
□ Daily tasks (next 14 days):
  - Check completion rates
  - Send reminders to non-starters (Day 3, 5, 7)
  - Answer questions
  - Troubleshoot issues
  
□ Weekly tasks:
  - Report to management
  - Follow up on overdue
  - Update dashboard

□ Create calendar reminders:
  - Day 7: Reminder to 50% incomplete
  - Day 10: Reminder to 75% incomplete
  - Day 14: Final deadline
  - Day 15: Escalation for non-compliant
  
□ Set 2-year renewal reminder:
  - [Today's Date + 24 months]
  - "Time to re-train all employees"
```

---

## 8-HOUR BUILD SUMMARY

### What You'll Have After 8 Hours:

✅ **Functional training portal** (Google Sites)
✅ **50 employees enrolled** with tracking
✅ **Automated quiz system** with instant grading
✅ **Auto-generated certificates** (SB 513 compliant)
✅ **Incident reporting** (harassment + violence)
✅ **Real-time dashboard** for HR monitoring
✅ **Email notification system**
✅ **Verification system** for certificates
✅ **Violent incident log** (SB 553 compliant)
✅ **Mobile-responsive** interface
✅ **$0 cost** (uses free tools)

### SB 513 Compliance Achieved:

Your certificates will include:
- ✅ Employee Name
- ✅ Training Provider (HRbiz.org)
- ✅ Date & Duration
- ✅ Core Competencies
- ✅ Resulting Certification

### Legal Compliance Met:

- ✅ SB 1343: Training content from CRD (state-approved)
- ✅ SB 513: Certificate metadata complete
- ✅ SB 553: Incident log with proper retention
- ✅ 2 CCR § 11024: 2-year recordkeeping (Google Drive permanent)

---

## TOTAL COST: $0-50

**Free tier of all tools covers 50 employees:**
- Google Workspace: $0 (existing account or free Gmail)
- Autocrat: $0 (free add-on)
- YAMM: $0 (free tier = 50 emails/day)
- CRD Training Content: $0 (public domain)
- Cal/OSHA Materials: $0 (public domain)

**Optional upgrades:**
- Custom domain: $12/year
- Professional email: $6/user/month (only need 1 admin)
- Premium YAMM: $40/year (for tracking)

---

## HOUR-BY-HOUR RECAP

| Hour | Focus | Deliverable |
|------|-------|-------------|
| 1 | Setup | Site + Forms + Roster |
| 2 | Content | Training pages with CRD links |
| 3 | Assessment | Quizzes with auto-grading |
| 4 | Certificates | Auto-generation system |
| 5 | Enrollment | Emails + Dashboard |
| 6 | Reporting | Incident forms + logs |
| 7 | Testing | QA + Documentation |
| 8 | Launch | Send invites + Monitor |

---

## POST-LAUNCH: DAYS 1-14

### Day 1-2 (Today/Tomorrow)
- Monitor first completions
- Answer quick questions
- Fix any broken links

### Day 3
- Send first reminder to non-starters (~30% typically)
- Check dashboard for issues

### Day 7 (Midpoint)
- Report to management: "We're at X% completion"
- Send reminder to incomplete
- Individual outreach to struggling employees

### Day 10
- Escalation warnings to overdue
- Manager notification for their teams

### Day 14 (Deadline)
- Final count
- Issue completion report
- Plan follow-up for non-compliant

---

## SUCCESS METRICS

**Target by Day 14:**
- 95%+ completion rate
- 90%+ pass rate on first quiz attempt
- <5 support tickets
- Zero technical failures
- All certificates issued correctly

**Compliance Proof:**
- Roster with timestamps
- Quiz scores documented
- Certificates issued & stored
- Training content from approved sources (CRD)
- 5-year retention plan in place

---

## SCALING TO FULL SAAS (LATER)

This prototype validates:
✅ Content effectiveness
✅ Employee engagement
✅ Completion rates
✅ Quiz difficulty
✅ Certificate acceptance

**When to upgrade to custom platform:**
- After you've trained your 50 employees successfully
- When you want to sell to other companies
- When you need multi-tenant architecture
- When you want white-label branding
- When Google tools feel limiting

**For now:** This gets you 100% functional TODAY for $0.

---

## FINAL CHECKLIST - BEFORE YOU START

```
□ I have Google account with Drive, Sites, Forms, Sheets access
□ I have list of 50 employees with emails
□ I have designated supervisor vs. non-supervisor roles
□ I have downloaded harassment_prevention_policy from project
□ I have bookmarked CRD training site
□ I have 8 uninterrupted hours today
□ I have second monitor (helpful but not required)
□ I am ready to GO

START TIME: _______
END TIME: _______
```

---

**NOW GO BUILD IT!** 🚀

Follow each hour sequentially. Don't skip ahead. By hour 8, you'll have a fully functional compliance training platform serving all 50 employees.

Questions during build? Document them - you'll answer them in Hour 5's FAQ section.

Good luck!
