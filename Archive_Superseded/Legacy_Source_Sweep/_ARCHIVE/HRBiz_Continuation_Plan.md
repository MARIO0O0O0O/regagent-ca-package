# HRBiz Web Application - Continuation Plan
## HR Compliance Platform for California SMEs

**Date:** January 18, 2026  
**Status:** Resuming Development  
**Current Phase:** Ready for Implementation

---

## I. PROJECT OVERVIEW

### What You're Building
A SaaS web application that provides:
- **Interactive harassment prevention training** (AB 1825/SB 1343 compliant)
- **Workplace violence prevention training** (SB 553 compliant)
- **Automated compliance tracking** for California's 2026 mandates
- **Certificate generation & management** with SB 513-compliant recordkeeping
- **Business dashboard** for HR managers

### Target Market
- Los Angeles small-to-mid businesses (5-100 employees)
- HR consultants serving SME clients
- Businesses facing 2026 compliance deadlines

### Business Model
- **Free Tier:** Up to 5 employees, basic features
- **Starter:** $149/month (up to 25 employees)
- **Professional:** $299/month (up to 100 employees)
- **Enterprise:** Custom pricing

---

## II. CONTENT AUDIT - WHAT YOU HAVE

### ✅ Complete Legal/Training Content

**Harassment Prevention Program:**
- ✅ Policy templates (18+ protected classes)
- ✅ Training requirements documentation
- ✅ Supervisor training outline (2 hours)
- ✅ Employee training outline (1 hour)
- ✅ Investigation flowcharts
- ✅ Complaint forms
- ✅ Employee acknowledgment forms
- ✅ Quick reference guides

**Workplace Violence Prevention:**
- ✅ SB 553 WVPP plan template
- ✅ Violent Incident Log structure
- ✅ Training requirements (4 types of violence)
- ✅ Cal/OSHA compliance checklists
- ✅ Integration with IIPP protocols

**2026 Mandates:**
- ✅ SB 294 (Know Your Rights) notices
- ✅ SB 642 (Pay Transparency) guidance
- ✅ SB 616 (Sick Leave) updates
- ✅ Complete compliance calendar

**Recordkeeping (SB 513):**
- ✅ Training metadata requirements (5 fields)
- ✅ Personnel file audit protocols
- ✅ Retention schedules (2-3 years)

---

## III. GAPS TO FILL

### 🔴 Critical Gaps (Must Have for MVP)

**1. Interactive Training Content**
- **Need:** Slide-by-slide course content
- **Current State:** Have outlines and requirements
- **Solution:** Convert your policy documents into interactive lessons
- **Effort:** 40-60 hours per module
- **Priority:** HIGH

**2. Knowledge Assessment Quizzes**
- **Need:** 10-15 questions per course with correct answers
- **Current State:** Training objectives defined
- **Solution:** Generate from CRD materials + your content
- **Effort:** 10-15 hours per module
- **Priority:** HIGH

**3. Certificate Templates**
- **Need:** Professional PDF design
- **Current State:** None
- **Solution:** Design with your branding + SB 513 fields
- **Effort:** 5 hours
- **Priority:** MEDIUM

### 🟡 Important (Should Have for Launch)

**4. Video Content**
- **Need:** 5-10 minute training videos
- **Current State:** Scripts not yet written
- **Solution:** Can use AI avatar tools or real presenter
- **Effort:** 20-40 hours
- **Priority:** MEDIUM

**5. Scenario-Based Learning**
- **Need:** Interactive harassment scenarios
- **Current State:** None
- **Solution:** Develop 5-10 realistic workplace scenarios
- **Effort:** 15-20 hours
- **Priority:** MEDIUM

---

## IV. TECHNICAL IMPLEMENTATION ROADMAP

### Phase 1: Foundation (Weeks 1-2)

**Week 1: Project Setup**
- [ ] Set up Next.js 14 project with TypeScript
- [ ] Configure Prisma with PostgreSQL
- [ ] Set up Supabase for auth & storage
- [ ] Configure Tailwind CSS
- [ ] Set up Git repository

**Week 2: Database Schema**
```prisma
// User Management
model User {
  id            String   @id @default(cuid())
  email         String   @unique
  name          String
  role          Role     @default(EMPLOYEE)
  organizationId String
  organization  Organization @relation(fields: [organizationId])
  hireDate      DateTime
  isSupervisor  Boolean  @default(false)
  enrollments   Enrollment[]
  certificates  Certificate[]
}

model Organization {
  id          String   @id @default(cuid())
  name        String
  employees   User[]
  subscription Subscription?
  tier        SubscriptionTier
}

// Training System
model Course {
  id          String   @id @default(cuid())
  title       String
  description String
  duration    Int      // minutes
  statute     String   // e.g., "SB 1343"
  required    Boolean
  modules     Module[]
  enrollments Enrollment[]
}

model Module {
  id          String   @id @default(cuid())
  courseId    String
  course      Course   @relation(fields: [courseId])
  title       String
  content     Json     // Slide content
  orderIndex  Int
  quiz        Quiz?
}

model Quiz {
  id          String   @id @default(cuid())
  moduleId    String   @unique
  module      Module   @relation(fields: [moduleId])
  questions   Question[]
  passingScore Int     @default(80)
}

model Question {
  id          String   @id @default(cuid())
  quizId      String
  quiz        Quiz     @relation(fields: [quizId])
  text        String
  options     Json     // Array of answer options
  correctAnswer String
}

// Progress Tracking
model Enrollment {
  id          String   @id @default(cuid())
  userId      String
  user        User     @relation(fields: [userId])
  courseId    String
  course      Course   @relation(fields: [courseId])
  status      EnrollmentStatus
  startedAt   DateTime @default(now())
  completedAt DateTime?
  progress    Progress[]
}

model Progress {
  id            String   @id @default(cuid())
  enrollmentId  String
  enrollment    Enrollment @relation(fields: [enrollmentId])
  moduleId      String
  completed     Boolean  @default(false)
  score         Int?
  timeSpent     Int      // seconds
  lastAccessedAt DateTime @updatedAt
}

// Certificates (SB 513 Compliant)
model Certificate {
  id              String   @id @default(cuid())
  userId          String
  user            User     @relation(fields: [userId])
  courseId        String
  certificateNumber String @unique
  issueDate       DateTime @default(now())
  expiryDate      DateTime
  provider        String   // "HRBiz.org"
  competencies    Json     // Array of core competencies
  duration        Int      // Actual time spent
  score           Int
  verificationCode String  @unique
  pdfUrl          String
  securityHash    String
}

enum Role {
  SUPER_ADMIN
  ORG_ADMIN
  SUPERVISOR
  EMPLOYEE
}

enum EnrollmentStatus {
  NOT_STARTED
  IN_PROGRESS
  COMPLETED
  EXPIRED
}

enum SubscriptionTier {
  FREE
  STARTER
  PROFESSIONAL
  ENTERPRISE
}
```

### Phase 2: Core Features (Weeks 3-5)

**Week 3: Authentication & User Management**
- [ ] NextAuth.js setup with email/password
- [ ] Organization creation flow
- [ ] Employee roster import (CSV)
- [ ] Role-based access control
- [ ] Profile management

**Week 4: Training Module Player**
- [ ] Slide-based content renderer
- [ ] Progress auto-save (every 30 seconds)
- [ ] Time tracking (prevent rushing)
- [ ] Quiz component
- [ ] Minimum time enforcement

**Week 5: Certificate Generation**
- [ ] PDF generation with PDFKit or Puppeteer
- [ ] QR code for verification
- [ ] Security hash generation
- [ ] Email delivery with SendGrid
- [ ] Public verification page

### Phase 3: Business Features (Weeks 6-7)

**Week 6: Compliance Dashboard**
- [ ] Employee training status table
- [ ] Upcoming expiration alerts
- [ ] Completion rate charts
- [ ] Export compliance reports
- [ ] Auto-assignment based on hire date/role

**Week 7: Payment Integration**
- [ ] Stripe subscription setup
- [ ] Pricing tier enforcement
- [ ] Webhook handlers
- [ ] Billing portal
- [ ] Free trial logic (14 days)

### Phase 4: Content Migration (Week 8)

**Week 8: Load Training Content**
- [ ] Convert harassment prevention policy → slides
- [ ] Create 10 harassment prevention quiz questions
- [ ] Convert violence prevention plan → slides
- [ ] Create 10 violence prevention quiz questions
- [ ] Design certificate templates
- [ ] Set up course expiration rules

---

## V. CONTENT DEVELOPMENT STRATEGY

### Converting Your Documents to Interactive Training

**Step 1: Break Down Your Policy Documents**

Your `harassment_prevention_policy.html` becomes:

**Module 1: What is Harassment? (10 minutes)**
- Slide 1: Welcome & Legal Context (SB 1343)
- Slide 2: Definition of Harassment
- Slide 3: Protected Categories (18+ classes)
- Slide 4: Examples of Harassment
- Slide 5: What is NOT Harassment

**Module 2: Recognizing Harassment (15 minutes)**
- Slide 6: Verbal Harassment Examples
- Slide 7: Physical Harassment Examples
- Slide 8: Visual Harassment Examples
- Slide 9: Digital/Email Harassment (NEW 2026)
- Slide 10: Scenario Exercise #1

**Module 3: Reporting & Investigation (15 minutes)**
- Slide 11: How to Report
- Slide 12: Multiple Reporting Channels
- Slide 13: What Happens After You Report
- Slide 14: Investigation Process (your flowchart)
- Slide 15: Anti-Retaliation Protections

**Module 4: Supervisor Responsibilities (20 minutes - Supervisors Only)**
- Slide 16: Duty to Prevent
- Slide 17: Duty to Report
- Slide 18: Duty to Investigate
- Slide 19: Duty to Correct
- Slide 20: Liability for Inaction

**Module 5: Assessment (10 minutes)**
- Quiz: 15 questions, 80% passing

---

## VI. IMMEDIATE NEXT STEPS

### What To Do Right Now

**Option A: Quick Start with No-Code MVP (Fastest)**
1. Use Airtable for database
2. Use Typeform for training quizzes
3. Use Google Sites for content delivery
4. Use Zapier to connect everything
5. Use Canva for certificates

**Timeline:** 2-3 weeks to launch
**Cost:** ~$100/month tools
**Limitations:** Not scalable, manual processes

**Option B: Low-Code with Existing Platforms (Medium Speed)**
1. Use Thinkific or Teachable for LMS
2. Customize with your content
3. Integrate Stripe directly
4. Use Zapier for compliance tracking

**Timeline:** 3-4 weeks to launch
**Cost:** ~$200-500/month
**Limitations:** Limited customization, monthly fees

**Option C: Custom Build (Recommended for Long-Term)**
1. Clone Next.js SaaS starter (e.g., next-saas-stripe-starter)
2. Implement the Prisma schema above
3. Build training player with your content
4. Add certificate generation
5. Deploy to Vercel

**Timeline:** 6-8 weeks to MVP
**Cost:** $50-100/month (hosting + tools)
**Benefits:** Full control, scalable, brandable

---

## VII. RECOMMENDED TECH STACK

### Frontend
- **Framework:** Next.js 14 (App Router)
- **Styling:** Tailwind CSS + shadcn/ui
- **State:** Zustand or React Context
- **Forms:** React Hook Form

### Backend
- **ORM:** Prisma
- **Database:** PostgreSQL (via Supabase)
- **Auth:** NextAuth.js
- **Storage:** Supabase Storage (PDFs)

### Payments
- **Platform:** Stripe
- **SDK:** @stripe/stripe-js

### Email
- **Service:** SendGrid or Resend
- **Templates:** React Email

### Deployment
- **Hosting:** Vercel
- **Database:** Supabase (free tier to start)
- **CDN:** Vercel Edge Network

---

## VIII. BUSINESS LAUNCH CHECKLIST

### Legal & Compliance
- [ ] Terms of Service
- [ ] Privacy Policy
- [ ] GDPR/CCPA compliance notice
- [ ] Disclaimer (not legal advice)
- [ ] Professional liability insurance

### Marketing Assets
- [ ] Landing page with value proposition
- [ ] Demo video (2-3 minutes)
- [ ] Case study template
- [ ] Email sequence for leads
- [ ] LinkedIn content calendar

### Sales Materials
- [ ] ROI calculator
- [ ] Comparison chart (DIY vs HRBiz)
- [ ] Compliance checklist
- [ ] Pricing page
- [ ] Free consultation booking

---

## IX. YOUR FIRST TASKS (This Week)

### Decision Point #1: Which Development Path?
Choose Option A, B, or C above based on:
- Time to market urgency
- Technical comfort level
- Budget
- Long-term vision

### Decision Point #2: Content Creation Priority
What to build first:
1. **Harassment Prevention** (highest demand, 2-year cycle)
2. **Violence Prevention** (annual requirement, SB 553)
3. **2026 Mandates** (urgent deadlines)

### Immediate Actions
- [ ] Review Phase 1 technical requirements
- [ ] Decide on development path (A/B/C)
- [ ] Clone a starter repo if going custom (Option C)
- [ ] Begin converting first policy document to slides
- [ ] Draft 10 quiz questions for first module

---

## X. RESOURCES TO LEVERAGE

### Free Government Content (CRD)
- California Civil Rights Department training portal
- CRD Sample policies
- CRD Harassment Prevention Guide 2025
- EEOC enforcement guidance

### Your Existing Assets
- All policy templates in project knowledge
- Investigation flowcharts
- Complaint forms
- Quick reference guides
- Compliance checklists

### Open Source Repositories to Clone
**SaaS Starters:**
- next-saas-stripe-starter (Vercel)
- saas-starter (Next.js + Supabase)
- t3-app (TypeScript, tRPC, Prisma)

**LMS Examples:**
- lms-platform (Next.js LMS)
- teachable-clone
- udemy-clone

---

## XI. SUCCESS METRICS

### Technical Milestones
- [ ] User can sign up and create organization
- [ ] User can enroll in harassment prevention course
- [ ] User can complete course and receive certificate
- [ ] Admin can view dashboard of completion rates
- [ ] Payment processing works end-to-end

### Business Milestones
- [ ] First paying customer
- [ ] 10 active organizations
- [ ] 100 certificates issued
- [ ] $5K MRR (Monthly Recurring Revenue)
- [ ] Break even on development costs

---

## CONCLUSION

You have exceptional legal content and a clear market need. The path forward is:

1. **This Week:** Choose your development approach and start content conversion
2. **Weeks 1-4:** Build core training delivery system
3. **Weeks 5-8:** Add business features (payments, dashboards)
4. **Week 9:** Beta test with 3-5 friendly businesses
5. **Week 10+:** Launch and iterate

**Estimated Time to Launch:** 8-12 weeks  
**Estimated Initial Investment:** $2,000-5,000 (if using freelancers) or $0-500 (if DIY)  
**Potential First Year Revenue:** $50K-200K MRR

You're in a strong position. The hardest part (legal expertise and content) is done. Now it's execution time.

Ready to begin? Let me know which development path you want to take and we'll start building.
