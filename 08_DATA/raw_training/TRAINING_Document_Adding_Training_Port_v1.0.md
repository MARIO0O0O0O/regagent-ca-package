# Adding Training Portal to HRBiz (Post-Tuesday Launch)

## Overview
This guide helps you add the **interactive training system** to your HRBiz site after the initial marketing launch.

**Time Required:** 10-12 hours  
**When:** Friday-Sunday after Tuesday launch  
**Prerequisites:** Site already deployed and working

---

## Phase 1: Import Training Data (2 hours)

### Step 1: Set Up Firestore Collections

In Firebase Console (console.firebase.google.com):

1. Go to Firestore Database
2. Create these collections:
   - `courses`
   - `modules`
   - `enrollments`
   - `certificates`

### Step 2: Import Course Data

Use the `HRBiz_Training_Modules_Firestore_Ready.json` file I created.

**Option A: Manual (if <50 documents):**
1. Open Firestore Console
2. Click "Start collection" → name it "courses"
3. Paste course data from JSON

**Option B: Programmatic (recommended):**

Create `scripts/importTrainingData.js`:

```javascript
const admin = require('firebase-admin');
const serviceAccount = require('./serviceAccountKey.json');
const trainingData = require('./HRBiz_Training_Modules_Firestore_Ready.json');

admin.initializeApp({
  credential: admin.credential.cert(serviceAccount)
});

const db = admin.firestore();

async function importData() {
  // Import course
  await db.collection('courses').doc(trainingData.course.id).set(trainingData.course);
  console.log('Course imported');
  
  // Import modules
  for (const module of trainingData.modules) {
    await db.collection('modules').doc(module.id).set(module);
    console.log(`Module ${module.id} imported`);
  }
  
  console.log('All data imported successfully!');
}

importData();
```

Run: `node scripts/importTrainingData.js`

---

## Phase 2: Build Training Components (4 hours)

### Step 1: Create Training Player Component

File: `components/TrainingPlayer.jsx`

```jsx
import { useState, useEffect } from 'react';
import { doc, updateDoc, getDoc } from 'firebase/firestore';
import { db } from '@/lib/firebase';

export default function TrainingPlayer({ moduleId, enrollmentId, onComplete }) {
  const [module, setModule] = useState(null);
  const [timeSpent, setTimeSpent] = useState(0);
  const [canContinue, setCanContinue] = useState(false);
  const [showQuiz, setShowQuiz] = useState(false);
  const [quizAnswers, setQuizAnswers] = useState({});
  const [quizScore, setQuizScore] = useState(null);

  useEffect(() => {
    loadModule();
  }, [moduleId]);

  useEffect(() => {
    // Timer - require minimum time per module (3 min minimum)
    const timer = setInterval(() => {
      setTimeSpent(prev => {
        const newTime = prev + 1;
        if (newTime >= (module?.duration * 60 * 0.8)) { // 80% of stated duration
          setCanContinue(true);
        }
        return newTime;
      });
    }, 1000);

    return () => clearInterval(timer);
  }, [module]);

  const loadModule = async () => {
    const docRef = doc(db, 'modules', moduleId);
    const docSnap = await getDoc(docRef);
    if (docSnap.exists()) {
      setModule(docSnap.data());
    }
  };

  const handleQuizSubmit = () => {
    let correct = 0;
    const questions = module.quiz.questions;
    
    questions.forEach((q, idx) => {
      if (quizAnswers[q.id] === q.correctAnswer) {
        correct++;
      }
    });
    
    const score = Math.round((correct / questions.length) * 100);
    setQuizScore(score);
    
    if (score >= module.quiz.passingScore) {
      // Update enrollment progress
      updateProgress(score);
    }
  };

  const updateProgress = async (score) => {
    const enrollmentRef = doc(db, 'enrollments', enrollmentId);
    const enrollment = await getDoc(enrollmentRef);
    const data = enrollment.data();
    
    await updateDoc(enrollmentRef, {
      'progress.completedModules': [...data.progress.completedModules, moduleId],
      [`progress.quizScores.${moduleId}`]: score,
      'progress.lastUpdated': new Date()
    });
    
    onComplete(moduleId);
  };

  if (!module) return <div>Loading...</div>;

  return (
    <div className="training-player max-w-4xl mx-auto p-6">
      {/* Module Content */}
      <div className="module-header mb-6">
        <h1 className="text-3xl font-bold">{module.title}</h1>
        <div className="text-sm text-gray-600 mt-2">
          Duration: {module.duration} minutes | 
          Time spent: {Math.floor(timeSpent / 60)}:{(timeSpent % 60).toString().padStart(2, '0')}
        </div>
      </div>

      <div 
        className="module-content prose max-w-none bg-white p-8 rounded-lg shadow mb-6"
        dangerouslySetInnerHTML={{ __html: module.content }} 
      />

      {/* Quiz Section */}
      {module.quiz && canContinue && !showQuiz && (
        <button 
          onClick={() => setShowQuiz(true)}
          className="w-full bg-blue-600 text-white py-3 rounded-lg font-semibold hover:bg-blue-700"
        >
          Continue to Knowledge Check
        </button>
      )}

      {showQuiz && module.quiz && (
        <div className="quiz-section bg-gray-50 p-6 rounded-lg">
          <h2 className="text-2xl font-bold mb-4">Knowledge Check</h2>
          <p className="text-gray-600 mb-6">
            Answer the following questions. You must score {module.quiz.passingScore}% to continue.
          </p>
          
          {module.quiz.questions.map((question, idx) => (
            <div key={question.id} className="mb-6 bg-white p-4 rounded">
              <p className="font-semibold mb-3">{idx + 1}. {question.text}</p>
              {question.options.map((option, optIdx) => (
                <label key={optIdx} className="flex items-center mb-2 cursor-pointer">
                  <input
                    type="radio"
                    name={question.id}
                    value={optIdx}
                    checked={quizAnswers[question.id] === optIdx}
                    onChange={(e) => setQuizAnswers({
                      ...quizAnswers,
                      [question.id]: parseInt(e.target.value)
                    })}
                    className="mr-3"
                  />
                  <span>{option}</span>
                </label>
              ))}
              
              {quizScore !== null && (
                <div className={`mt-3 p-3 rounded ${
                  quizAnswers[question.id] === question.correctAnswer 
                    ? 'bg-green-100 text-green-800' 
                    : 'bg-red-100 text-red-800'
                }`}>
                  {question.explanation}
                </div>
              )}
            </div>
          ))}

          {quizScore === null ? (
            <button 
              onClick={handleQuizSubmit}
              disabled={Object.keys(quizAnswers).length < module.quiz.questions.length}
              className="w-full bg-green-600 text-white py-3 rounded-lg font-semibold hover:bg-green-700 disabled:bg-gray-300"
            >
              Submit Answers
            </button>
          ) : (
            <div className="text-center">
              <div className={`text-3xl font-bold mb-4 ${
                quizScore >= module.quiz.passingScore ? 'text-green-600' : 'text-red-600'
              }`}>
                Your Score: {quizScore}%
              </div>
              {quizScore >= module.quiz.passingScore ? (
                <p className="text-green-600 font-semibold">Passed! Continue to next module.</p>
              ) : (
                <button
                  onClick={() => {
                    setQuizScore(null);
                    setQuizAnswers({});
                  }}
                  className="bg-blue-600 text-white px-6 py-2 rounded-lg hover:bg-blue-700"
                >
                  Try Again
                </button>
              )}
            </div>
          )}
        </div>
      )}

      {/* Continue blocked message */}
      {!canContinue && (
        <div className="bg-yellow-50 border border-yellow-200 p-4 rounded-lg text-center">
          <p className="text-yellow-800">
            Please review the content above. You'll be able to continue in{' '}
            {Math.ceil((module.duration * 60 * 0.8 - timeSpent) / 60)} minutes.
          </p>
        </div>
      )}
    </div>
  );
}
```

### Step 2: Create Course Dashboard

File: `app/training/[courseId]/page.jsx`

```jsx
'use client';

import { useState, useEffect } from 'react';
import { useAuth } from '@/context/AuthContext';
import { collection, query, where, getDocs, doc, getDoc, setDoc } from 'firebase/firestore';
import { db } from '@/lib/firebase';
import TrainingPlayer from '@/components/TrainingPlayer';

export default function CoursePage({ params }) {
  const { user } = useAuth();
  const [course, setCourse] = useState(null);
  const [modules, setModules] = useState([]);
  const [enrollment, setEnrollment] = useState(null);
  const [currentModuleId, setCurrentModuleId] = useState(null);

  useEffect(() => {
    if (user) {
      loadCourse();
      loadOrCreateEnrollment();
    }
  }, [user, params.courseId]);

  const loadCourse = async () => {
    const courseDoc = await getDoc(doc(db, 'courses', params.courseId));
    if (courseDoc.exists()) {
      const courseData = courseDoc.data();
      setCourse(courseData);
      
      // Load all modules
      const modulePromises = courseData.modules.map(moduleId => 
        getDoc(doc(db, 'modules', moduleId))
      );
      const moduleDocs = await Promise.all(modulePromises);
      const moduleData = moduleDocs.map(d => ({ id: d.id, ...d.data() }));
      setModules(moduleData.sort((a, b) => a.orderIndex - b.orderIndex));
    }
  };

  const loadOrCreateEnrollment = async () => {
    const enrollmentId = `${user.uid}_${params.courseId}`;
    const enrollmentDoc = await getDoc(doc(db, 'enrollments', enrollmentId));
    
    if (enrollmentDoc.exists()) {
      const data = enrollmentDoc.data();
      setEnrollment({ id: enrollmentDoc.id, ...data });
      setCurrentModuleId(data.progress?.currentModule || modules[0]?.id);
    } else {
      // Create new enrollment
      const newEnrollment = {
        userId: user.uid,
        courseId: params.courseId,
        status: 'in_progress',
        startedAt: new Date(),
        progress: {
          completedModules: [],
          currentModule: modules[0]?.id,
          quizScores: {},
          lastUpdated: new Date()
        }
      };
      
      await setDoc(doc(db, 'enrollments', enrollmentId), newEnrollment);
      setEnrollment({ id: enrollmentId, ...newEnrollment });
      setCurrentModuleId(modules[0]?.id);
    }
  };

  const handleModuleComplete = async (moduleId) => {
    // Find next module
    const currentIndex = modules.findIndex(m => m.id === moduleId);
    const nextModule = modules[currentIndex + 1];
    
    if (nextModule) {
      setCurrentModuleId(nextModule.id);
    } else {
      // Course complete! Generate certificate
      await generateCertificate();
    }
  };

  const generateCertificate = async () => {
    // TODO: Implement certificate generation
    alert('Congratulations! Course completed. Certificate will be generated.');
  };

  if (!course || !enrollment) return <div>Loading...</div>;

  return (
    <div className="min-h-screen bg-gray-50 py-8">
      {/* Progress bar */}
      <div className="max-w-4xl mx-auto mb-6 px-6">
        <div className="bg-white rounded-lg shadow p-4">
          <div className="flex justify-between text-sm mb-2">
            <span>Progress</span>
            <span>
              {enrollment.progress.completedModules.length} / {modules.length} modules
            </span>
          </div>
          <div className="w-full bg-gray-200 rounded-full h-2">
            <div 
              className="bg-blue-600 h-2 rounded-full transition-all"
              style={{ 
                width: `${(enrollment.progress.completedModules.length / modules.length) * 100}%` 
              }}
            />
          </div>
        </div>
      </div>

      {/* Module navigation */}
      <div className="max-w-4xl mx-auto mb-6 px-6">
        <div className="bg-white rounded-lg shadow p-4">
          <h2 className="font-semibold mb-3">Course Modules</h2>
          <div className="space-y-2">
            {modules.map((module, idx) => (
              <button
                key={module.id}
                onClick={() => setCurrentModuleId(module.id)}
                disabled={idx > 0 && !enrollment.progress.completedModules.includes(modules[idx-1].id)}
                className={`w-full text-left px-4 py-2 rounded flex items-center justify-between ${
                  currentModuleId === module.id
                    ? 'bg-blue-100 text-blue-800'
                    : enrollment.progress.completedModules.includes(module.id)
                    ? 'bg-green-50 text-green-800'
                    : 'bg-gray-50 text-gray-600'
                } disabled:opacity-50`}
              >
                <span>
                  {idx + 1}. {module.title}
                </span>
                {enrollment.progress.completedModules.includes(module.id) && (
                  <span className="text-green-600">✓</span>
                )}
              </button>
            ))}
          </div>
        </div>
      </div>

      {/* Training player */}
      {currentModuleId && (
        <TrainingPlayer
          moduleId={currentModuleId}
          enrollmentId={enrollment.id}
          onComplete={handleModuleComplete}
        />
      )}
    </div>
  );
}
```

---

## Phase 3: Certificate Generation (3 hours)

### Option A: Client-Side PDF Generation (Simpler)

Install: `npm install jspdf`

File: `lib/certificateGenerator.js`

```javascript
import jsPDF from 'jspdf';
import { doc, setDoc } from 'firebase/firestore';
import { ref, uploadBytes, getDownloadURL } from 'firebase/storage';
import { db, storage } from './firebase';

export async function generateCertificate(userId, courseId, userData, courseData) {
  const certificateId = `cert-${Date.now()}-${userId}`;
  const certificateNumber = `HRB-2026-${String(Math.floor(Math.random() * 10000)).padStart(4, '0')}`;
  
  // Create PDF
  const doc = new jsPDF({
    orientation: 'landscape',
    unit: 'in',
    format: 'letter'
  });

  // Background
  doc.setFillColor(245, 245, 245);
  doc.rect(0, 0, 11, 8.5, 'F');
  
  // Border
  doc.setLineWidth(0.02);
  doc.setDrawColor(0, 102, 204);
  doc.rect(0.5, 0.5, 10, 7.5);
  
  // Title
  doc.setFontSize(36);
  doc.setTextColor(0, 102, 204);
  doc.text('Certificate of Completion', 5.5, 1.5, { align: 'center' });
  
  // Body
  doc.setFontSize(16);
  doc.setTextColor(0, 0, 0);
  doc.text('This certifies that', 5.5, 2.5, { align: 'center' });
  
  doc.setFontSize(24);
  doc.setFont(undefined, 'bold');
  doc.text(userData.name, 5.5, 3.2, { align: 'center' });
  
  doc.setFontSize(16);
  doc.setFont(undefined, 'normal');
  doc.text('has successfully completed', 5.5, 3.8, { align: 'center' });
  
  doc.setFontSize(20);
  doc.setFont(undefined, 'bold');
  doc.text(courseData.title, 5.5, 4.5, { align: 'center' });
  
  // Details
  doc.setFontSize(12);
  doc.setFont(undefined, 'normal');
  const today = new Date().toLocaleDateString('en-US', { 
    year: 'numeric', month: 'long', day: 'numeric' 
  });
  doc.text(`Date of Completion: ${today}`, 5.5, 5.5, { align: 'center' });
  doc.text(`Duration: ${courseData.duration} minutes`, 5.5, 5.9, { align: 'center' });
  doc.text(`Certificate Number: ${certificateNumber}`, 5.5, 6.3, { align: 'center' });
  
  // Footer
  doc.setFontSize(10);
  doc.setTextColor(100, 100, 100);
  doc.text('HRBiz.org - California Labor Compliance Training', 5.5, 7.5, { align: 'center' });
  doc.text(`Compliant with ${courseData.statute}`, 5.5, 7.8, { align: 'center' });

  // Convert to blob
  const pdfBlob = doc.output('blob');
  
  // Upload to Firebase Storage
  const storageRef = ref(storage, `certificates/${certificateId}.pdf`);
  await uploadBytes(storageRef, pdfBlob);
  const pdfUrl = await getDownloadURL(storageRef);
  
  // Save certificate record to Firestore
  const certificateData = {
    userId,
    courseId,
    certificateNumber,
    issueDate: new Date(),
    expiryDate: new Date(Date.now() + (730 * 24 * 60 * 60 * 1000)), // 2 years
    provider: 'HRBiz.org',
    competencies: courseData.description,
    duration: courseData.duration,
    pdfUrl,
    verificationCode: certificateNumber
  };
  
  await setDoc(doc(db, 'certificates', certificateId), certificateData);
  
  return { certificateId, pdfUrl, certificateNumber };
}
```

---

## Phase 4: Testing & Launch (3 hours)

### Test Checklist

- [ ] Can create account
- [ ] Can enroll in course
- [ ] Modules load correctly
- [ ] Timer prevents skipping
- [ ] Quiz accepts answers
- [ ] Quiz shows correct/incorrect feedback
- [ ] Can retry failed quizzes
- [ ] Progress saves automatically
- [ ] Certificate generates after completion
- [ ] Certificate can be downloaded
- [ ] Mobile responsive

### Launch Steps

1. Deploy training pages: `firebase deploy`
2. Test with 3 beta users
3. Collect feedback
4. Fix critical bugs
5. Add link from main site navigation
6. Announce "Training Portal Now Live"

---

## Quick Reference: Key Files

```
hrbiz/
├── components/
│   └── TrainingPlayer.jsx          # Main training UI
├── app/
│   └── training/
│       └── [courseId]/
│           └── page.jsx             # Course container
├── lib/
│   ├── certificateGenerator.js     # PDF generation
│   └── firebase.js                  # Firebase config
└── scripts/
    └── importTrainingData.js        # Data import script
```

---

## Next Features (Optional, Post-Launch)

- Admin dashboard to view completions
- Email notifications (SendGrid)
- Automated expiration reminders
- Multiple courses
- Company/group enrollments
- Compliance reports
- Integration with payroll/HR systems

---

## Estimated Costs

**Free Tier (0-10 users/month):**
- Firebase Hosting: Free
- Firestore: Free (50K reads/day)
- Storage: Free (1GB)
- Auth: Free

**Paid Tier (10-100 users/month):**
- Estimated: $25-50/month
- Firestore: ~$1-5
- Storage: ~$5-10
- Functions: ~$10-20
- SendGrid: ~$10-15

---

You now have everything needed to add the training portal! After Tuesday's marketing site launch, you can tackle this over Friday-Sunday and have a full-featured compliance training platform live.
