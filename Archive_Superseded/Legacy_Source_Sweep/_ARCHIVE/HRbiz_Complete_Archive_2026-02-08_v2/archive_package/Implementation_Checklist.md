# HRBiz Firebase Implementation Checklist
## Transforming NJS-Firebase-SaaS-Boilerplate into LA Compliance Platform

═══════════════════════════════════════════════════════════════
QUICK REFERENCE: Copy-Paste Code Snippets
═══════════════════════════════════════════════════════════════

## ✅ CHECKPOINT 1: Environment Setup (15 minutes)

### Step 1: Fork Repository
```
1. Go to: https://github.com/WHEREISDAN/NJS-Firebase-SaaS-Boilerplate
2. Click "Fork" button (top right)
3. Click "Create Fork"
```

### Step 2: Import to Project IDX
```
1. Go to: idx.google.com
2. Click "New Workspace" → "Import from GitHub"
3. Select your forked repo from the list (DO NOT paste URL)
4. Click "Import"
5. Wait 3-5 minutes for setup
```

### Step 3: Create Firebase Project
```
1. Go to: console.firebase.google.com
2. Click "Add Project"
3. Name: "HRBiz-Live"
4. Disable Analytics (optional)
5. Click "Create Project"
```

### Step 4: Enable Firebase Services
```
# Authentication
Build → Authentication → Get Started
Enable: ✅ Google, ✅ Email/Password, ✅ GitHub

# Firestore
Build → Firestore Database → Create Database
Location: us-central1
Mode: Test mode (for now)

# Storage
Build → Storage → Get Started
Location: us-central1
Mode: Test mode

# Get Config
Settings (⚙️) → Project Settings → General
Scroll to "Your apps" → Click </> (Web)
App nickname: "HRBiz Web"
✅ Also set up Firebase Hosting
Copy the firebaseConfig object
```

### Step 5: Configure Environment
```bash
# In Project IDX, create/edit .env.local

NEXT_PUBLIC_FIREBASE_API_KEY="AIzaSy..."
NEXT_PUBLIC_FIREBASE_AUTH_DOMAIN="hrbiz-live.firebaseapp.com"
NEXT_PUBLIC_FIREBASE_PROJECT_ID="hrbiz-live"
NEXT_PUBLIC_FIREBASE_STORAGE_BUCKET="hrbiz-live.appspot.com"
NEXT_PUBLIC_FIREBASE_MESSAGING_SENDER_ID="123456789"
NEXT_PUBLIC_FIREBASE_APP_ID="1:123456789:web:abc123"

# Stripe (from stripe.com/dashboard)
NEXT_PUBLIC_STRIPE_PUBLISHABLE_KEY="pk_test_..."
STRIPE_SECRET_KEY="sk_test_..."
STRIPE_WEBHOOK_SECRET="whsec_..."

NEXT_PUBLIC_BASE_URL="http://localhost:3000"
```

### Step 6: Test Setup
```bash
# In Project IDX terminal
npm install
npm run dev

# Open web preview, test Google sign-in
# Check Firebase Console → Authentication → Users
```

✅ CHECKPOINT: App running, authentication working


═══════════════════════════════════════════════════════════════
## ✅ CHECKPOINT 2: Branding & Architecture (30 minutes)
═══════════════════════════════════════════════════════════════

### 1. Create Firestore Schema (TypeScript Types)

File: `src/lib/firebase/schema.ts` (CREATE NEW FILE)

```typescript
// Firestore Collections Schema for HRBiz

export interface Client {
  id: string;
  companyName: string;
  ein: string; // Employer Identification Number
  primaryContact: {
    name: string;
    email: string;
    phone: string;
  };
  address: {
    street: string;
    city: string;
    state: string;
    zip: string;
  };
  employeeCount: number;
  industry: string;
  createdAt: Date;
  updatedAt: Date;
}

export interface Employee {
  id: string;
  clientId: string; // Reference to Client
  name: string;
  email: string;
  role: string;
  hireDate: Date;
  sb294Status: 'pending' | 'notified' | 'acknowledged';
  sb294NotifiedAt?: Date;
  sb294AcknowledgedAt?: Date;
  emergencyContact?: {
    name: string;
    relationship: string;
    phone: string;
  };
  createdAt: Date;
  updatedAt: Date;
}

export interface ComplianceLog {
  id: string;
  clientId: string;
  type: 'SB553' | 'SB294' | 'SB642' | 'PAGA' | 'FMLA' | 'GENERAL';
  title: string;
  description: string;
  timestamp: Date;
  performedBy: string; // User ID or name
  pdfUrl?: string; // Firebase Storage URL
  status: 'completed' | 'pending' | 'overdue';
  dueDate?: Date;
  completedAt?: Date;
}

export interface IncidentReport {
  id: string;
  clientId: string;
  reportDate: Date;
  incidentDate: Date;
  redactedType: string; // "Harassment", "Violence", "Discrimination"
  description: string; // Redacted/anonymized
  reportedBy: string; // Role, not name (e.g., "Manager", "Employee")
  status: 'open' | 'investigating' | 'resolved' | 'closed';
  assignedTo?: string;
  resolutionNotes?: string;
  closedAt?: Date;
}

export interface TrainingCourse {
  id: string;
  title: string;
  description: string;
  complianceType: 'SB294' | 'SB553' | 'HARASSMENT_PREVENTION' | 'GENERAL';
  duration: number; // minutes
  videoUrl?: string;
  contentSections: CourseSection[];
  quizQuestions: QuizQuestion[];
  passingScore: number; // percentage (e.g., 80)
  certificateTemplate: string;
  isActive: boolean;
  createdAt: Date;
  updatedAt: Date;
}

export interface CourseSection {
  title: string;
  content: string; // HTML or markdown
  videoUrl?: string;
  duration: number; // minutes
  order: number;
}

export interface QuizQuestion {
  question: string;
  options: string[];
  correctAnswer: number; // index of correct option (0-based)
  explanation: string;
  order: number;
}

export interface CourseEnrollment {
  id: string;
  userId: string;
  courseId: string;
  clientId?: string;
  progress: number; // 0-100
  currentSection: number;
  quizAttempts: number;
  quizScore?: number;
  startedAt: Date;
  completedAt?: Date;
  certificateId?: string;
  status: 'in_progress' | 'completed' | 'failed';
}

export interface Certificate {
  id: string;
  userId: string;
  userName: string;
  courseId: string;
  courseName: string;
  issueDate: Date;
  certificateNumber: string; // e.g., "HRBIZ-HP-2026-001"
  pdfUrl: string; // Firebase Storage URL
  verified: boolean;
  expiresAt?: Date; // For courses requiring renewal
}

export interface Template {
  id: string;
  title: string;
  description: string;
  category: 'SB294' | 'SB553' | 'SB642' | 'PAGA' | 'FORMS' | 'POSTERS';
  fileType: 'pdf' | 'docx' | 'xlsx';
  downloadUrl: string; // Firebase Storage URL
  thumbnailUrl?: string;
  tags: string[];
  downloadCount: number;
  createdAt: Date;
  updatedAt: Date;
  featured: boolean;
}

export interface BlogPost {
  id: string;
  title: string;
  slug: string;
  excerpt: string;
  content: string; // Markdown or HTML
  author: string;
  authorId: string;
  category: 'SB294' | 'SB553' | 'SB642' | 'PAGA' | 'COMPLIANCE_NEWS' | 'GUIDES';
  tags: string[];
  featuredImage?: string;
  publishedAt: Date;
  updatedAt: Date;
  status: 'draft' | 'published' | 'archived';
  views: number;
}

export interface AffiliateClick {
  id: string;
  userId?: string; // Optional - track logged-in users
  productId: string;
  productName: string;
  affiliateUrl: string;
  timestamp: Date;
  referrer?: string;
  userAgent?: string;
  converted: boolean;
  conversionDate?: Date;
  commission?: number;
}
```


### 2. Update Site Metadata

File: `src/app/layout.tsx` (or `app/layout.tsx`)

```typescript
import { Metadata } from 'next'

export const metadata: Metadata = {
  title: 'HRBiz - LA Compliance Shield',
  description: 'Navigate California\'s 2026 labor mandates with confidence. Automated compliance audits, harassment prevention training, and expert consultation for Los Angeles small businesses.',
  keywords: 'SB 294, SB 553, SB 642, PAGA, harassment prevention, LA compliance, California labor law, workplace training',
  authors: [{ name: 'HRBiz Compliance' }],
  openGraph: {
    title: 'HRBiz - LA Compliance Shield',
    description: 'California labor compliance made simple for LA small businesses',
    url: 'https://hrbiz.org',
    siteName: 'HRBiz',
    locale: 'en_US',
    type: 'website',
  },
}
```


### 3. Update Navbar Navigation

File: `src/components/Navbar.tsx` (or similar - find the nav component)

```typescript
export function Navbar() {
  return (
    <nav className="border-b">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="flex justify-between h-16">
          <div className="flex">
            <Link href="/" className="flex items-center">
              <span className="text-2xl font-bold text-red-600">HRBiz</span>
            </Link>
            
            <div className="hidden sm:ml-6 sm:flex sm:space-x-8">
              <NavLink href="/">Home</NavLink>
              <NavLink href="/resources">Free Resources</NavLink>
              <NavLink href="/training">Training</NavLink>
              <NavLink href="/blog">Compliance Blog</NavLink>
              
              {/* REMOVED: Pricing, Dashboard */}
              
              {/* NEW: External links */}
              <NavLink 
                href="https://cal.com/hrbiz" 
                external
                className="text-red-600 font-semibold"
              >
                Book Consultant
              </NavLink>
              <NavLink 
                href="https://donate.stripe.com/test_hrbiz" 
                external
                className="bg-red-600 text-white px-4 rounded"
              >
                Donate
              </NavLink>
            </div>
          </div>
          
          <div className="flex items-center">
            <AuthButton />
          </div>
        </div>
      </div>
    </nav>
  );
}

interface NavLinkProps {
  href: string;
  children: React.ReactNode;
  external?: boolean;
  className?: string;
}

function NavLink({ href, children, external, className = "" }: NavLinkProps) {
  if (external) {
    return (
      <a
        href={href}
        target="_blank"
        rel="noopener noreferrer"
        className={`inline-flex items-center px-1 pt-1 text-sm font-medium ${className}`}
      >
        {children}
      </a>
    );
  }
  
  return (
    <Link
      href={href}
      className={`inline-flex items-center px-1 pt-1 text-sm font-medium ${className}`}
    >
      {children}
    </Link>
  );
}
```


### 4. Create Resources Page

File: `src/app/resources/page.tsx` (CREATE NEW FILE)

```typescript
'use client';

import { useEffect, useState } from 'react';
import { collection, getDocs, query, orderBy } from 'firebase/firestore';
import { db } from '@/lib/firebase'; // Adjust import path as needed
import { Template } from '@/lib/firebase/schema';

export default function ResourcesPage() {
  const [templates, setTemplates] = useState<Template[]>([]);
  const [loading, setLoading] = useState(true);
  const [filter, setFilter] = useState<string>('ALL');

  useEffect(() => {
    async function fetchTemplates() {
      try {
        const q = query(
          collection(db, 'templates'),
          orderBy('featured', 'desc'),
          orderBy('createdAt', 'desc')
        );
        
        const snapshot = await getDocs(q);
        const data = snapshot.docs.map(doc => ({
          id: doc.id,
          ...doc.data()
        })) as Template[];
        
        setTemplates(data);
      } catch (error) {
        console.error('Error fetching templates:', error);
      } finally {
        setLoading(false);
      }
    }
    
    fetchTemplates();
  }, []);

  const categories = ['ALL', 'SB294', 'SB553', 'SB642', 'PAGA', 'FORMS', 'POSTERS'];
  
  const filteredTemplates = filter === 'ALL' 
    ? templates 
    : templates.filter(t => t.category === filter);

  if (loading) {
    return (
      <div className="min-h-screen flex items-center justify-center">
        <div className="text-xl">Loading resources...</div>
      </div>
    );
  }

  return (
    <div className="min-h-screen bg-gray-50 py-12">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="text-center mb-12">
          <h1 className="text-4xl font-bold text-gray-900 mb-4">
            Free Compliance Templates
          </h1>
          <p className="text-xl text-gray-600 max-w-3xl mx-auto">
            Download ready-to-use templates for California labor compliance. 
            All documents are updated for 2026 mandates.
          </p>
        </div>

        {/* Category Filter */}
        <div className="flex flex-wrap justify-center gap-4 mb-8">
          {categories.map(cat => (
            <button
              key={cat}
              onClick={() => setFilter(cat)}
              className={`px-4 py-2 rounded-lg font-medium transition ${
                filter === cat
                  ? 'bg-red-600 text-white'
                  : 'bg-white text-gray-700 hover:bg-gray-100'
              }`}
            >
              {cat === 'ALL' ? 'All Templates' : cat}
            </button>
          ))}
        </div>

        {/* Templates Grid */}
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
          {filteredTemplates.map(template => (
            <div 
              key={template.id}
              className="bg-white rounded-lg shadow-md hover:shadow-xl transition p-6"
            >
              {template.featured && (
                <span className="inline-block bg-yellow-400 text-yellow-900 text-xs font-bold px-2 py-1 rounded mb-3">
                  ⭐ FEATURED
                </span>
              )}
              
              <h3 className="font-bold text-xl mb-2 text-gray-900">
                {template.title}
              </h3>
              
              <p className="text-gray-600 mb-4 text-sm">
                {template.description}
              </p>
              
              <div className="flex items-center justify-between mb-4">
                <span className="text-sm font-semibold text-red-600">
                  {template.category}
                </span>
                <span className="text-xs text-gray-500 uppercase">
                  {template.fileType}
                </span>
              </div>
              
              <div className="flex flex-wrap gap-2 mb-4">
                {template.tags.map(tag => (
                  <span 
                    key={tag}
                    className="text-xs bg-gray-100 text-gray-600 px-2 py-1 rounded"
                  >
                    {tag}
                  </span>
                ))}
              </div>
              
              <a 
                href={template.downloadUrl}
                download
                className="block w-full bg-red-600 hover:bg-red-700 text-white text-center px-4 py-3 rounded-lg font-medium transition"
              >
                Download {template.fileType.toUpperCase()}
              </a>
              
              <p className="text-xs text-gray-500 text-center mt-2">
                Downloaded {template.downloadCount} times
              </p>
            </div>
          ))}
        </div>

        {filteredTemplates.length === 0 && (
          <div className="text-center py-12">
            <p className="text-xl text-gray-600">
              No templates found in this category yet.
            </p>
          </div>
        )}
      </div>
    </div>
  );
}
```


### 5. Seed Sample Template Data

**Option A: Firebase Console (Manual)**
```
1. Go to Firebase Console → Firestore Database
2. Click "Start collection" → Collection ID: "templates"
3. Add document with auto-ID
4. Add these fields:

title: "SB 294 Know Your Rights Notice"
description: "Annual workplace rights notification template for California employers"
category: "SB294"
fileType: "pdf"
downloadUrl: "[Upload PDF to Storage first, then paste URL here]"
tags: ["SB 294", "2026", "notification", "required"]
downloadCount: 0
featured: true
createdAt: [Current timestamp]
updatedAt: [Current timestamp]

5. Repeat for more templates
```

**Option B: Script to Seed Data** 

File: `scripts/seed-templates.ts` (CREATE NEW FILE)

```typescript
import { collection, addDoc, serverTimestamp } from 'firebase/firestore';
import { db } from '@/lib/firebase';

const sampleTemplates = [
  {
    title: "SB 294 Know Your Rights Notice",
    description: "Annual workplace rights notification template for California employers. Includes English and Spanish versions.",
    category: "SB294",
    fileType: "pdf",
    downloadUrl: "https://firebasestorage.googleapis.com/...", // Replace with actual URL
    tags: ["SB 294", "2026", "notification", "required", "bilingual"],
    downloadCount: 0,
    featured: true,
  },
  {
    title: "SB 553 Violence Prevention Plan Template",
    description: "Comprehensive workplace violence prevention plan template compliant with California SB 553.",
    category: "SB553",
    fileType: "docx",
    downloadUrl: "https://firebasestorage.googleapis.com/...",
    tags: ["SB 553", "violence prevention", "safety", "required"],
    downloadCount: 0,
    featured: true,
  },
  {
    title: "SB 642 Pay Transparency Notice",
    description: "Job posting pay range disclosure template for compliance with California SB 642.",
    category: "SB642",
    fileType: "pdf",
    downloadUrl: "https://firebasestorage.googleapis.com/...",
    tags: ["SB 642", "pay transparency", "job postings"],
    downloadCount: 0,
    featured: false,
  },
  {
    title: "PAGA Self-Audit Checklist",
    description: "Comprehensive checklist to identify and remediate potential PAGA violations.",
    category: "PAGA",
    fileType: "xlsx",
    downloadUrl: "https://firebasestorage.googleapis.com/...",
    tags: ["PAGA", "audit", "self-assessment"],
    downloadCount: 0,
    featured: true,
  },
];

async function seedTemplates() {
  const templatesRef = collection(db, 'templates');
  
  for (const template of sampleTemplates) {
    await addDoc(templatesRef, {
      ...template,
      createdAt: serverTimestamp(),
      updatedAt: serverTimestamp(),
    });
  }
  
  console.log('✅ Seeded', sampleTemplates.length, 'templates');
}

// Run this once to populate Firestore
seedTemplates().catch(console.error);
```


═══════════════════════════════════════════════════════════════
## ✅ CHECKPOINT 3: Deploy to Production (15 minutes)
═══════════════════════════════════════════════════════════════

### Step 1: Install Firebase CLI
```bash
npm install -g firebase-tools
firebase login
```

### Step 2: Initialize Firebase Hosting
```bash
firebase init hosting

# Select:
# ✅ Use existing project → HRBiz-Live
# ✅ Public directory: out (or .next if not using export)
# ✅ Configure as SPA: Yes
# ✅ Overwrite index.html: No
# ✅ Set up automatic deploys with GitHub: No (for now)
```

### Step 3: Build Your App
```bash
npm run build
```

### Step 4: Deploy!
```bash
firebase deploy

# Your app will be live at:
# https://hrbiz-live.web.app
# https://hrbiz-live.firebaseapp.com
```

### Step 5: Custom Domain (Optional)
```
1. Go to Firebase Console → Hosting
2. Click "Add custom domain"
3. Enter: hrbiz.org
4. Follow DNS verification steps
5. Wait 24-48 hours for SSL
```

✅ CHECKPOINT: App deployed to production!


═══════════════════════════════════════════════════════════════
## 🎯 VALIDATION CHECKLIST
═══════════════════════════════════════════════════════════════

After completing all steps, verify:

□ Firebase project created and services enabled
□ App running locally in Project IDX
□ Google authentication working
□ Navbar shows: Resources, Training, Blog, Book Consultant, Donate
□ Resources page displays template grid
□ At least 1 template in Firestore
□ Template downloads work
□ Site deployed to Firebase Hosting
□ Live URL accessible: https://hrbiz-live.web.app
□ Authentication works in production


═══════════════════════════════════════════════════════════════
## 🚨 TROUBLESHOOTING
═══════════════════════════════════════════════════════════════

### Problem: "Cannot read properties of undefined (reading 'firestore')"
**Solution:** Check that Firebase is initialized in `lib/firebase.ts`

### Problem: "Permission denied" on Firestore reads
**Solution:** Firestore Rules set to Test Mode? Check in Firebase Console

### Problem: Template downloads return 404
**Solution:** Ensure PDFs are uploaded to Firebase Storage and URLs are correct

### Problem: Build fails with TypeScript errors
**Solution:** Run `npm run type-check` to find issues

### Problem: Can't import repo to Project IDX
**Solution:** Use Method 1 (Fork-First) from the blueprint

### Problem: Firebase deploy fails
**Solution:** Run `firebase login --reauth` and try again


═══════════════════════════════════════════════════════════════
## 📞 NEXT STEPS AFTER DEPLOYMENT
═══════════════════════════════════════════════════════════════

1. **Content Creation**
   - Write 5 compliance blog posts
   - Upload 10 template PDFs to Storage
   - Create Firestore documents for each

2. **Training Platform**
   - Design course structure in Firestore
   - Upload training videos to Storage
   - Build course player UI

3. **Certificates**
   - Create PDF certificate template
   - Implement generation with Cloud Functions
   - Add verification system

4. **Payments**
   - Set up Stripe products
   - Implement checkout flow
   - Add customer portal

5. **Security**
   - Update Firestore rules (exit Test Mode)
   - Add rate limiting
   - Implement data validation

═══════════════════════════════════════════════════════════════

✅ You're ready to build HRBiz! Start with Checkpoint 1 and work through each section systematically.

Need help? Check the full HTML blueprint for detailed explanations!