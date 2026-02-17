# 48-HOUR SPRINT TO TUESDAY LAUNCH
## HRBiz Marketing Site Deployment Plan

**Mission:** Deploy professional compliance consultancy website by Tuesday 5pm  
**Current Status:** Repo forked, architecture decided, content ready  
**Device:** Samsung S24 Ultra / Project IDX  
**Stack:** Firebase + Next.js

---

## ⏰ TIMELINE OVERVIEW

**TODAY (Sunday):** 6 hours - Get site running + content migration  
**MONDAY:** 10 hours - Customization + monetization + deployment  
**TUESDAY:** 4 hours - Polish + QA + LAUNCH

**Total:** 20 hours of focused work

---

## 📅 SUNDAY (6 Hours)

### HOUR 1 (Setup): 9:00am - 10:00am

**Tasks:**
- [ ] Open Project IDX at idx.google.com
- [ ] Import your forked NJS-Firebase-SaaS-Boilerplate repo
- [ ] Wait for environment to initialize
- [ ] Open terminal in IDX

**Commands:**
```bash
# Install dependencies
npm install

# Check if it runs
npm run dev
```

**Goal:** See the base template running in IDX preview

**Troubleshooting:**
- If "npm install" fails → Try `rm -rf node_modules && npm install`
- If port error → Use port IDX assigns (usually shows in terminal)

---

### HOUR 2 (Firebase Setup): 10:00am - 11:00am

**Tasks:**
- [ ] Go to console.firebase.google.com
- [ ] Create new project: "hrbiz-production"
- [ ] Enable services:
  - Authentication (Email/Password + Google)
  - Firestore Database (Start in production mode for now)
  - Storage
  - Hosting

**In Project IDX:**
- [ ] Create `.env.local` file
- [ ] Copy Firebase config from console

```bash
# .env.local
NEXT_PUBLIC_FIREBASE_API_KEY=your_api_key
NEXT_PUBLIC_FIREBASE_AUTH_DOMAIN=your_auth_domain
NEXT_PUBLIC_FIREBASE_PROJECT_ID=hrbiz-production
NEXT_PUBLIC_FIREBASE_STORAGE_BUCKET=your_storage_bucket
NEXT_PUBLIC_FIREBASE_MESSAGING_SENDER_ID=your_sender_id
NEXT_PUBLIC_FIREBASE_APP_ID=your_app_id
```

**Test:**
- [ ] Restart dev server: `npm run dev`
- [ ] Try to sign up for account
- [ ] Check Firebase console - you should see user created

---

### HOUR 3 (Branding Prompt): 11:00am - 12:00pm

**Use Your Pre-Made Gemini Prompt**

You mentioned you have a Gemini prompt ready. Run it now in Project IDX's AI assistant.

**The prompt should:**
- Rebrand "SaaS Starter" → "HRBiz - LA Compliance Shield"
- Update navigation (remove Pricing, add Resources, add Consult)
- Update homepage hero
- Update colors to your brand

**Manual tweaks if needed:**

`app/page.jsx` - Homepage hero:
```jsx
<h1>California Labor Compliance Made Simple</h1>
<p>Expert guidance for LA small businesses navigating 
   2026 labor mandates: SB 553, SB 294, harassment prevention, 
   and PAGA protection.</p>
<div className="cta-buttons">
  <Link href="/resources">Free Templates</Link>
  <Link href="/consult">Book Consultation</Link>
</div>
```

`components/Navbar.jsx` - Navigation:
```jsx
<nav>
  <Link href="/">Home</Link>
  <Link href="/blog">Compliance Blog</Link>
  <Link href="/resources">Resources</Link>
  <Link href="/consult">Book Consultation</Link>
  <Link href="/donate">Support Us</Link>
</nav>
```

---

### HOUR 4-5 (Content Migration): 12:00pm - 2:00pm

**Create Blog Posts:**

File: `app/blog/posts/sb-553-workplace-violence.md`
```markdown
---
title: "SB 553: Workplace Violence Prevention Plan - Required 2026"
date: "[DATE]"
author: "HRBiz Team"
tags: ["SB 553", "2026", "Workplace Violence"]
---

# What is SB 553?

[Paste content from your HRBiz_Content_Packet.md]

## Who Must Comply?

All California employers, effective [EFFECTIVE DATE].

## What You Need:

1. Written Workplace Violence Prevention Plan
2. Annual employee training
3. Violent Incident Log
4. Integration with existing IIPP

[Download our free WVPP template](/resources/wvpp-template.pdf)
```

**Repeat for:**
- `sb-294-know-your-rights.md` (SB 294 notice requirements)
- `2026-compliance-calendar.md` (All mandates with deadlines)
- `paga-protection-guide.md` (Self-audit basics)

**Create Resources Page:**

File: `app/resources/page.jsx`
```jsx
export default function ResourcesPage() {
  return (
    <div className="max-w-4xl mx-auto py-12 px-6">
      <h1 className="text-4xl font-bold mb-8">Free Compliance Templates</h1>
      
      <div className="grid md:grid-cols-2 gap-6">
        
        <ResourceCard
          title="SB 553 WVPP Template"
          description="Complete Workplace Violence Prevention Plan template"
          downloadUrl="/downloads/wvpp-template.pdf"
          icon="📋"
        />
        
        <ResourceCard
          title="SB 294 Notice (English/Spanish)"
          description="Know Your Rights annual notice"
          downloadUrl="/downloads/sb294-notice.pdf"
          icon="📄"
        />
        
        <ResourceCard
          title="Harassment Prevention Policy"
          description="2026-compliant anti-harassment policy"
          downloadUrl="/downloads/harassment-policy.pdf"
          icon="🛡️"
        />
        
        <ResourceCard
          title="PAGA Self-Audit Checklist"
          description="50-point compliance checklist"
          downloadUrl="/downloads/paga-checklist.pdf"
          icon="✅"
        />
        
      </div>
      
      <div className="mt-12 bg-blue-50 p-6 rounded-lg">
        <h2 className="text-2xl font-bold mb-4">Need Personalized Help?</h2>
        <p className="mb-4">
          These templates are a great start, but every business is unique. 
          Get expert guidance tailored to your situation.
        </p>
        <a href="/consult" className="btn-primary">
          Book Free 15-Minute Consultation
        </a>
      </div>
    </div>
  );
}

function ResourceCard({ title, description, downloadUrl, icon }) {
  return (
    <div className="bg-white p-6 rounded-lg shadow hover:shadow-lg transition">
      <div className="text-4xl mb-4">{icon}</div>
      <h3 className="text-xl font-bold mb-2">{title}</h3>
      <p className="text-gray-600 mb-4">{description}</p>
      <a 
        href={downloadUrl} 
        download
        className="text-blue-600 font-semibold hover:underline"
      >
        Download Free →
      </a>
    </div>
  );
}
```

**Upload PDFs to Firebase Storage:**
- [ ] Go to Firebase Console → Storage
- [ ] Create folder: `public/downloads/`
- [ ] Upload your PDF templates
- [ ] Make files publicly accessible
- [ ] Note the URLs

---

### HOUR 6 (Test Everything): 2:00pm - 3:00pm

**QA Checklist:**
- [ ] Homepage loads and looks decent
- [ ] Can navigate to Blog
- [ ] Blog posts display
- [ ] Can navigate to Resources
- [ ] Resource page loads
- [ ] PDF download links work (even if placeholder)
- [ ] Site is mobile-responsive (test in IDX's device preview)

**Fix any critical bugs**

**END OF SUNDAY GOAL:** Working site with your branding + 3 blog posts + resources page

---

## 📅 MONDAY (10 Hours)

### HOUR 7 (Booking System): 9:00am - 10:00am

**Option A: Calendly (Easiest)**
1. Go to calendly.com (free tier fine)
2. Set up "Compliance Consultation" event (15-30 min)
3. Get embed code

File: `app/consult/page.jsx`
```jsx
export default function ConsultPage() {
  return (
    <div className="max-w-4xl mx-auto py-12 px-6">
      <h1 className="text-4xl font-bold mb-4">Book Your Consultation</h1>
      <p className="text-lg text-gray-600 mb-8">
        15-minute free consultation to discuss your compliance needs.
        Paid engagements start at [AMOUNT].
      </p>
      
      <div className="calendly-inline-widget" 
           data-url="https://calendly.com/YOUR_LINK"
           style={{ minWidth: '320px', height: '700px' }} />
      
      <script type="text/javascript" 
              src="https://assets.calendly.com/assets/external/widget.js" 
              async />
              
      <div className="mt-12 bg-gray-50 p-6 rounded-lg">
        <h2 className="text-2xl font-bold mb-4">What We Offer</h2>
        <ul className="space-y-3">
          <li>✅ Compliance Audit - [AMOUNT] (one-time)</li>
          <li>✅ Policy Development - [AMOUNT] (SB 553, harassment prevention)</li>
          <li>✅ Monthly Retainer - [AMOUNT]/month (ongoing support)</li>
          <li>✅ Training Delivery - [AMOUNT]/session</li>
        </ul>
      </div>
    </div>
  );
}
```

**Option B: Simple Contact Form (If no Calendly)**
```jsx
'use client';
import { useState } from 'react';

export default function ConsultPage() {
  const [submitted, setSubmitted] = useState(false);
  
  const handleSubmit = async (e) => {
    e.preventDefault();
    const formData = new FormData(e.target);
    
    // Send to Firebase or email service
    // For now, just show confirmation
    setSubmitted(true);
  };
  
  if (submitted) {
    return <div>Thank you! We'll contact you within 24 hours.</div>;
  }
  
  return (
    <form onSubmit={handleSubmit} className="max-w-2xl mx-auto py-12 px-6">
      <h1 className="text-4xl font-bold mb-8">Request Consultation</h1>
      
      <input type="text" name="name" placeholder="Your Name" required 
             className="w-full p-3 mb-4 border rounded" />
      
      <input type="email" name="email" placeholder="Email" required 
             className="w-full p-3 mb-4 border rounded" />
      
      <input type="tel" name="phone" placeholder="Phone" 
             className="w-full p-3 mb-4 border rounded" />
      
      <input type="text" name="company" placeholder="Company Name" 
             className="w-full p-3 mb-4 border rounded" />
      
      <input type="number" name="employees" placeholder="Number of Employees" 
             className="w-full p-3 mb-4 border rounded" />
      
      <textarea name="message" placeholder="What do you need help with?" rows={4}
                className="w-full p-3 mb-4 border rounded" />
      
      <button type="submit" className="w-full bg-blue-600 text-white py-3 rounded-lg">
        Request Consultation
      </button>
    </form>
  );
}
```

---

### HOUR 8-9 (Stripe Integration): 10:00am - 12:00pm

**Set Up Stripe Account:**
1. Go to stripe.com
2. Create account
3. Complete business verification (can use test mode for now)

**Create Payment Links:**

In Stripe Dashboard:
1. Products → Create Product
   - "Compliance Consultation" - [AMOUNT]
   - "Donate to HRBiz" - Custom amount
   - "Monthly Retainer" - [AMOUNT]/month

2. Get Payment Link for each

**Add to Site:**

File: `app/donate/page.jsx`
```jsx
export default function DonatePage() {
  return (
    <div className="max-w-2xl mx-auto py-12 px-6 text-center">
      <h1 className="text-4xl font-bold mb-4">Support Free Compliance Resources</h1>
      <p className="text-lg text-gray-600 mb-8">
        Help us keep templates, guides, and tools free for LA small businesses.
      </p>
      
      <div className="grid md:grid-cols-3 gap-4 mb-12">
        <a href="https://buy.stripe.com/YOUR_LINK_25" 
           className="bg-blue-100 p-6 rounded-lg hover:bg-blue-200">
          <div className="text-3xl mb-2">☕</div>
          <div className="text-2xl font-bold">[AMOUNT]</div>
          <div className="text-sm">Buy us coffee</div>
        </a>
        
        <a href="https://buy.stripe.com/YOUR_LINK_50"
           className="bg-blue-200 p-6 rounded-lg hover:bg-blue-300">
          <div className="text-3xl mb-2">🥗</div>
          <div className="text-2xl font-bold">[AMOUNT]</div>
          <div className="text-sm">Buy us lunch</div>
        </a>
        
        <a href="https://buy.stripe.com/YOUR_LINK_100"
           className="bg-blue-300 p-6 rounded-lg hover:bg-blue-400">
          <div className="text-3xl mb-2">🎉</div>
          <div className="text-2xl font-bold">[AMOUNT]</div>
          <div className="text-sm">Major supporter</div>
        </a>
      </div>
      
      <p className="text-sm text-gray-500">
        HRBiz is an independent compliance consultancy serving LA small businesses.
        Your support helps us create free resources and tools.
      </p>
    </div>
  );
}
```

**Update Consult Page:**
Add Stripe payment link button after consultation booking form.

---

### HOUR 10-11 (About Page & Footer): 12:00pm - 2:00pm

File: `app/about/page.jsx`
```jsx
export default function AboutPage() {
  return (
    <div className="max-w-4xl mx-auto py-12 px-6">
      <h1 className="text-4xl font-bold mb-6">About HRBiz</h1>
      
      <div className="prose max-w-none">
        <h2>Our Mission</h2>
        <p>
          HRBiz provides tech-enabled HR compliance solutions for Los Angeles 
          small and mid-sized businesses. We help companies navigate California's 
          complex labor law landscape with practical, affordable tools and expert guidance.
        </p>
        
        <h2>What Makes Us Different</h2>
        <ul>
          <li><strong>LA-Focused:</strong> We specialize in LA County-specific requirements</li>
          <li><strong>2026-Ready:</strong> Updated for all new mandates (SB 553, SB 294, etc.)</li>
          <li><strong>Practical:</strong> Templates and tools you can implement today</li>
          <li><strong>Affordable:</strong> Solutions designed for 5-100 employee companies</li>
        </ul>
        
        <h2>Our Expertise</h2>
        <p>
          10+ years municipal regulatory experience + independent software development 
          = automated compliance that actually works for small businesses.
        </p>
        
        <h2>Services</h2>
        <ul>
          <li>Compliance audits and gap analysis</li>
          <li>Policy development (harassment prevention, violence prevention)</li>
          <li>Employee training delivery</li>
          <li>Ongoing compliance monitoring</li>
          <li>PAGA protection strategies</li>
        </ul>
      </div>
      
      <div className="mt-12 bg-blue-50 p-8 rounded-lg">
        <h3 className="text-2xl font-bold mb-4">Ready to Get Compliant?</h3>
        <div className="flex gap-4">
          <a href="/consult" className="btn-primary">Book Consultation</a>
          <a href="/resources" className="btn-secondary">Browse Free Resources</a>
        </div>
      </div>
    </div>
  );
}
```

**Update Footer:**
`components/Footer.jsx`
```jsx
export default function Footer() {
  return (
    <footer className="bg-gray-900 text-white py-12">
      <div className="max-w-6xl mx-auto px-6 grid md:grid-cols-4 gap-8">
        
        <div>
          <h3 className="font-bold mb-4">HRBiz.org</h3>
          <p className="text-gray-400 text-sm">
            California labor compliance for LA small businesses.
          </p>
        </div>
        
        <div>
          <h4 className="font-semibold mb-3">Resources</h4>
          <ul className="space-y-2 text-sm">
            <li><a href="/blog">Compliance Blog</a></li>
            <li><a href="/resources">Free Templates</a></li>
            <li><a href="/resources#calendar">2026 Calendar</a></li>
          </ul>
        </div>
        
        <div>
          <h4 className="font-semibold mb-3">Services</h4>
          <ul className="space-y-2 text-sm">
            <li><a href="/consult">Consultation</a></li>
            <li><a href="/about#services">Compliance Audit</a></li>
            <li><a href="/about#services">Training</a></li>
          </ul>
        </div>
        
        <div>
          <h4 className="font-semibold mb-3">Legal</h4>
          <ul className="space-y-2 text-sm">
            <li><a href="/privacy">Privacy Policy</a></li>
            <li><a href="/terms">Terms of Service</a></li>
            <li><a href="/disclaimer">Disclaimer</a></li>
          </ul>
          <p className="text-xs text-gray-500 mt-4">
            Not legal advice. Consult an attorney.
          </p>
        </div>
      </div>
      
      <div className="max-w-6xl mx-auto px-6 mt-8 pt-8 border-t border-gray-800 text-center text-sm text-gray-400">
        © 2026 HRBiz.org. All rights reserved.
      </div>
    </footer>
  );
}
```

---

### HOUR 12-14 (Mobile Testing & Bug Fixes): 2:00pm - 4:00pm

**Test on S24 Ultra:**
- [ ] Enable mobile preview in IDX
- [ ] Test all pages on mobile
- [ ] Check navigation menu (hamburger works?)
- [ ] Test PDF downloads
- [ ] Test forms
- [ ] Check text readability
- [ ] Check button sizes (touch-friendly?)

**Common issues to fix:**
- Text too small → Increase font sizes
- Buttons too small → Add more padding
- Navigation doesn't collapse → Fix mobile menu
- Images too large → Optimize/compress
- Forms hard to fill → Larger input fields

---

### HOUR 15 (Firebase Deployment): 4:00pm - 5:00pm

**Install Firebase CLI in IDX:**
```bash
npm install -g firebase-tools
firebase login
```

**Initialize project:**
```bash
firebase init

# Select:
# - Hosting
# - Use existing project: hrbiz-production
# - Public directory: out (or .next if using Next.js export)
# - Configure as SPA: Yes
# - Overwrite index.html: No
```

**Build and deploy:**
```bash
npm run build
firebase deploy
```

**You'll get a URL:** `hrbiz-production.web.app`

**Test deployed site:**
- [ ] Visit the live URL
- [ ] Test all pages
- [ ] Test on mobile (real phone, not emulator)
- [ ] Share link with friend for feedback

---

### HOUR 16 (Custom Domain - Optional): 5:00pm - 6:00pm

**If you own hrbiz.org:**

1. In Firebase Console → Hosting → Add custom domain
2. Add DNS records (Firebase will show you which)
3. Wait for SSL certificate (15-60 minutes)
4. Test at your custom domain

**If you don't own domain yet:**
- Buy from Namecheap/Google Domains
- Connect following Firebase instructions
- Or skip and use hrbiz-production.web.app for launch

---

## 📅 TUESDAY (4 Hours) - LAUNCH DAY

### HOUR 17 (Final Content Polish): 9:00am - 10:00am

**Add:**
- [ ] Meta descriptions to all pages (for SEO)
- [ ] OpenGraph images (for social sharing)
- [ ] FAQ section on homepage
- [ ] Testimonials (even if placeholder: "Coming soon!")
- [ ] Clear call-to-action on every page

**Example meta tags:**
```jsx
// app/layout.jsx or individual pages
export const metadata = {
  title: 'HRBiz - California Labor Compliance for LA Small Businesses',
  description: '2026-ready compliance tools, templates, and expert guidance for SB 553, harassment prevention, and PAGA protection.',
  openGraph: {
    title: 'HRBiz - LA Compliance Made Simple',
    description: 'Free templates + expert guidance for CA labor law compliance',
    images: ['/og-image.jpg'],
  }
};
```

---

### HOUR 18 (Analytics & SEO): 10:00am - 11:00am

**Google Analytics:**
1. Create GA4 property at analytics.google.com
2. Get measurement ID
3. Add to site:

```jsx
// app/layout.jsx
import Script from 'next/script';

export default function RootLayout({ children }) {
  return (
    <html>
      <head>
        <Script
          src="https://www.googletagmanager.com/gtag/js?id=G-XXXXXXXXXX"
          strategy="afterInteractive"
        />
        <Script id="google-analytics" strategy="afterInteractive">
          {`
            window.dataLayer = window.dataLayer || [];
            function gtag(){dataLayer.push(arguments);}
            gtag('js', new Date());
            gtag('config', 'G-XXXXXXXXXX');
          `}
        </Script>
      </head>
      <body>{children}</body>
    </html>
  );
}
```

**Submit to Google:**
- [ ] Create Google Search Console account
- [ ] Add your site
- [ ] Submit sitemap: `hrbiz.org/sitemap.xml`

---

### HOUR 19 (Switch to Live Mode): 11:00am - 12:00pm

**Stripe:**
- [ ] Switch from Test mode to Live mode
- [ ] Update payment links to live versions
- [ ] Test one small payment yourself ([AMOUNT] test)

**Firebase:**
- [ ] Review Firestore security rules (make sure not in test mode!)
- [ ] Set up billing alerts in Firebase console
- [ ] Check Storage rules

**Final deploy:**
```bash
npm run build
firebase deploy
```

---

### HOUR 20 (LAUNCH 🚀): 12:00pm - 1:00pm

**Announcement Checklist:**

- [ ] Post on LinkedIn:
  ```
  🚀 Excited to announce the launch of HRBiz.org!
  
  We're helping LA small businesses navigate California's 
  2026 labor mandates with practical, affordable solutions.
  
  ✅ Free compliance templates
  ✅ Expert guidance
  ✅ SB 553, SB 294, harassment prevention & more
  
  Check it out: hrbiz.org
  
  #HRCompliance #SmallBusiness #CaliforniaLaw
  ```

- [ ] Email your network:
  ```
  Subject: Just Launched: Free CA Compliance Resources for LA Businesses
  
  Hi [Name],
  
  I just launched HRBiz.org - a resource site for LA small businesses 
  trying to stay compliant with California's complex labor laws.
  
  2026 brings major new requirements (SB 553 violence prevention, 
  SB 294 notices, etc.) and I've created free templates to help.
  
  Check it out: hrbiz.org/resources
  
  Would love your feedback!
  
  [Your Name]
  ```

- [ ] Post in relevant Facebook/LinkedIn groups
- [ ] Notify any existing contacts/leads
- [ ] Set up Google My Business listing

---

## 🎉 POST-LAUNCH (Tuesday Afternoon)

**Monitor:**
- [ ] Check Google Analytics - any visitors?
- [ ] Check Stripe dashboard - any payments?
- [ ] Check Firebase console - any errors?
- [ ] Check your inbox - any inquiries?

**Respond immediately to:**
- Any form submissions
- Any booking requests
- Any bug reports
- Any questions on social media

---

## 📊 SUCCESS METRICS

**By End of Week 1:**
- [ ] 100+ site visitors
- [ ] 10+ PDF downloads
- [ ] 1-2 consultation bookings
- [ ] [AMOUNT]+ in donations

**By End of Month 1:**
- [ ] 1,000+ visitors
- [ ] 50+ PDF downloads
- [ ] 5+ paid consultations ([AMOUNT] revenue)
- [ ] 1-2 monthly retainer clients ([AMOUNT]/month)

---

## ⚠️ CRITICAL REMINDERS

1. **KEEP IT SIMPLE** - Don't add features, just launch
2. **TEST ON MOBILE** - Most users will be on phones
3. **REAL PAYMENT TEST** - Make sure Stripe actually works
4. **BACKUP PLAN** - If Firebase deploy fails, you have the Vercel option
5. **DON'T PERFECTIZE** - Launch at 80%, improve to 100% next week

---

## 🆘 EMERGENCY CONTACTS

**If Firebase deploy fails:**
- Alternative: Deploy to Vercel (5 minutes)
- `npx vercel` and follow prompts

**If Stripe doesn't work:**
- Fall back to PayPal button
- Or just collect emails, invoice manually

**If site crashes:**
- Check Firebase console for error logs
- Check browser console (F12) for JavaScript errors
- Rollback: `firebase hosting:rollback`

---

**YOU'VE GOT THIS!** 🚀

The site is 80% ready. These 20 hours are just execution. Focus on one hour at a time. Don't overthink. Just build and ship.

See you at launch! 🎉
