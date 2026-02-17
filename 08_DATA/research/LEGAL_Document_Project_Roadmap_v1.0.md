---
title: 6-Week Launch Roadmap
created: 2026-02-07
tags: [roadmap, timeline, planning]
---

# 📅 HRBiz 6-Week Launch Roadmap

> **Launch Target:** March 14, 2026 (Week 6)  
> **First Client:** Button Nose Grooming ($7,000)  
> **Platform:** HRBizLMS Multi-Program Compliance Platform

---

## 🎯 ROADMAP OVERVIEW

```
Week 1 (Feb 7-14):  Repository Selection + Firebase Setup
Week 2 (Feb 14-21): Multi-Tenant Architecture
Week 3 (Feb 21-28): Training Features + Certificate Generation
Week 4 (Feb 28-Mar 7): Testing + Production Deployment
Week 5 (Mar 7-14): Content Generation + Client Onboarding
Week 6 (Mar 14-21): First Training Delivery + Payment Collection
```

---

## 📆 WEEK-BY-WEEK BREAKDOWN

### Week 1: Foundation (Feb 7-14) 🔄 CURRENT WEEK

**Goal:** Choose repository, set up Firebase, run local dev environment

**Tasks:**
- [x] Complete repository reconnaissance
- [ ] **DECIDE:** NJS-Firebase-SaaS (free, 2-3 weeks) vs Makerkit ($299, 1 week)
- [ ] Create Firebase project "HRBizLMS"
- [ ] Enable Firestore, Auth, Storage
- [ ] Clone chosen repository
- [ ] Install dependencies
- [ ] Configure environment variables
- [ ] Test local development server
- [ ] Verify authentication flow

**Deliverables:**
- ✅ Repository decision documented
- ✅ Firebase project configured
- ✅ Local dev environment running

**Time Commitment:** 10-15 hours

---

### Week 2: Multi-Tenant Architecture (Feb 14-21)

**Goal:** Build company/employee structure, data isolation

**Tasks:**
- [ ] Design Firestore collections schema
  - `/companies/{companyId}`
  - `/employees/{employeeId}`
  - `/training_sessions/{sessionId}`
  - `/programs/{programId}`
  - `/certificates/{certificateId}`
- [ ] Build company onboarding wizard
- [ ] Create employee roster table
- [ ] Implement multi-tenant data isolation
- [ ] Add company switching (for consultants with multiple clients)
- [ ] Test data security rules

**Deliverables:**
- ✅ Multi-tenant database architecture
- ✅ Company onboarding flow
- ✅ Employee roster management

**Time Commitment:** 20-25 hours

---

### Week 3: Training & Certificates (Feb 21-28)

**Goal:** Build training scheduler and certificate generator

**Tasks:**
- [ ] Build training session scheduler
  - Create session form
  - Calendar view
  - Employee assignment
- [ ] Implement certificate generation
  - Install jsPDF
  - Design certificate template
  - Program-specific formatting (CERT vs WV prefix)
  - Certificate download + storage
- [ ] Build compliance dashboard
  - Company overview
  - Program status cards
  - Employee completion tracking
- [ ] Add email notifications
  - Session reminders
  - Certificate delivery
  - Renewal alerts

**Deliverables:**
- ✅ Training scheduler functional
- ✅ Certificate generator working
- ✅ Compliance dashboard live

**Time Commitment:** 25-30 hours

---

### Week 4: Testing & Deployment (Feb 28-Mar 7)

**Goal:** Production deployment, security hardening, performance optimization

**Tasks:**
- [ ] Comprehensive testing
  - Create test company
  - Add test employees
  - Schedule test training session
  - Generate test certificates
  - Verify all workflows
- [ ] Deploy to production
  - Deploy to Vercel (frontend)
  - Configure Firebase (production)
  - Set up custom domain (optional)
  - Enable SSL/HTTPS
- [ ] Security hardening
  - Review Firestore security rules
  - Test authentication flows
  - Verify data isolation
  - Add rate limiting
- [ ] Performance optimization
  - Test load times
  - Optimize images
  - Enable caching

**Deliverables:**
- ✅ All features tested
- ✅ Production deployment live
- ✅ Security audit complete

**Time Commitment:** 15-20 hours

---

### Week 5: Content & Client Prep (Mar 7-14)

**Goal:** Generate remaining training content, onboard Button Nose

**Tasks:**
- [ ] Generate Workplace Violence Prevention materials
  - Use content prompt with AI
  - Customize for grooming industry
  - Review for SB 553 compliance
  - Save to Firebase Storage
- [ ] Button Nose Grooming onboarding
  - Schedule kickoff call
  - Collect employee roster (50 employees)
  - Upload employees to HRBizLMS
  - Assign programs (HPP + WVPP)
  - Customize WVPP for grooming operations
- [ ] Schedule training sessions
  - Harassment Prevention: 2 hours (supervisor + employee)
  - Workplace Violence: 1 hour (all employees)
  - Book dates with client
- [ ] Prepare training materials
  - Print facilitator guides
  - Test presentation slides
  - Prepare certificates
  - Print attendance rosters

**Deliverables:**
- ✅ WVPP training materials complete
- ✅ Button Nose fully onboarded
- ✅ Training sessions scheduled
- ✅ Materials prepared

**Time Commitment:** 15-20 hours

---

### Week 6: Delivery & Payment (Mar 14-21) 💰

**Goal:** Deliver first training, generate certificates, collect payment

**Tasks:**
- [ ] Deliver Harassment Prevention training
  - Supervisor session (2 hours)
  - Employee session (2 hours)
  - Collect attendance
  - Generate certificates
  - Upload to HRBizLMS
- [ ] Deliver Workplace Violence Prevention training
  - All-staff session (1 hour)
  - Collect attendance
  - Generate certificates
  - Upload to HRBizLMS
- [ ] Post-training deliverables
  - Email certificates to all employees
  - Provide WVPP document to client
  - Deliver violent incident log template
  - Schedule annual review reminder
- [ ] **Collect payment**
  - Send final invoice ($7,000)
  - Follow up if needed
  - **Receive first payment!** 🎉

**Deliverables:**
- ✅ Both training sessions delivered
- ✅ All certificates generated and delivered
- ✅ WVPP document provided
- ✅ **$7,000 payment received**

**Time Commitment:** 10-15 hours (+ 5 hours training delivery)

---

## 🎯 CRITICAL SUCCESS FACTORS

### Technical
1. **Repository Decision Speed:** Decide TODAY to avoid delay
2. **Firebase Mastery:** Use documentation + AI assistance heavily
3. **Multi-Tenancy Correctness:** Get data isolation right from start
4. **Certificate Quality:** Professional-looking certificates are crucial

### Business
1. **Button Nose Communication:** Keep client informed, build trust
2. **Training Quality:** First delivery sets reputation
3. **Documentation:** Deliver everything promised in contract
4. **Payment Collection:** Follow up promptly on invoice

---

## 📊 WEEKLY TIME BUDGET

| Week | Development | Content | Client Work | Total |
|------|-------------|---------|-------------|-------|
| 1 | 15h | 0h | 0h | 15h |
| 2 | 25h | 0h | 0h | 25h |
| 3 | 30h | 0h | 0h | 30h |
| 4 | 20h | 0h | 0h | 20h |
| 5 | 5h | 10h | 5h | 20h |
| 6 | 0h | 0h | 15h | 15h |
| **Total** | **95h** | **10h** | **20h** | **125h** |

**Hourly Rate:** ~$56/hour ($7,000 ÷ 125h)  
**But:** Reusable platform = $0 marginal cost for clients 2-10

---

## 🚨 RISK MITIGATION

### Technical Risks
| Risk | Probability | Impact | Mitigation |
|------|-------------|--------|------------|
| Multi-tenancy bugs | Medium | High | Thorough testing, security rules review |
| Firebase learning curve | Medium | Medium | Use AI assistance, documentation |
| Certificate generation issues | Low | Medium | Test early, use proven jsPDF patterns |
| Deployment problems | Low | High | Test on staging first, have rollback plan |

### Business Risks
| Risk | Probability | Impact | Mitigation |
|------|-------------|--------|------------|
| Client delay/cancellation | Low | High | Maintain regular communication |
| Poor training delivery | Low | High | Practice, prepare thoroughly |
| Payment delay | Medium | Medium | Invoice promptly, follow up |
| Scope creep | Medium | Medium | Stick to contract, upsell extras |

---

## 💰 REVENUE MILESTONES

### Q1 2026 (Weeks 1-12)
- **Week 6:** Button Nose payment #1 = $7,000
- **Week 10:** Client #2 (target) = $7,000
- **Week 12:** Client #3 (target) = $7,000
- **Q1 Total:** $21,000

### Q2 2026 (Weeks 13-24)
- Add 5 more clients @ $7,000 = $35,000
- Convert 3 to retainers @ $1,200/mo = $10,800
- **Q2 Total:** $45,800

### Q3-Q4 2026
- Scale to 15 total clients
- 8 on retainers ($115,200/year)
- New client revenue: $56,000
- **2026 Total:** $192,000+

---

## 🎓 POST-LAUNCH EXPANSION

### Q2 2026: Add More Programs
- IIPP (Injury & Illness Prevention)
- Heat Illness Prevention
- Launch 4-program bundles

### Q3 2026: Platform Enhancements
- Mobile app (React Native)
- Video training delivery
- Advanced reporting
- Multi-language support (Spanish)

### Q4 2026: Scale Operations
- Hire part-time trainer
- Automate marketing
- Build referral program
- Target enterprise clients (100-499 employees)

---

## ✅ WEEKLY CHECKLIST

### Every Monday
- [ ] Review last week's progress
- [ ] Update task board
- [ ] Plan this week's priorities
- [ ] Check client communications

### Every Friday
- [ ] Review week's accomplishments
- [ ] Update roadmap if needed
- [ ] Prepare next week's tasks
- [ ] Back up work

---

**Current Status:** Week 1 of 6  
**Days Until Launch:** 35  
**Next Major Milestone:** Repository chosen + Firebase configured

*Navigate: [[00_START_HERE|Dashboard]] | [[Task_Board|Tasks]] | [[Revenue_Tracker|Revenue]]*
