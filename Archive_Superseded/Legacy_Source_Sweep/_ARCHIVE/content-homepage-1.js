// HRBiz Homepage Content - Ready to Use in Next.js Components

// ═══════════════════════════════════════════════════════════════
// HERO SECTION
// ═══════════════════════════════════════════════════════════════

export const heroContent = {
  headline: "Navigate California's 2026 Labor Mandates with Confidence",
  subheadline: "Expert compliance guidance for Los Angeles small businesses. From SB 294 to PAGA protection, we've got you covered.",
  primaryCTA: {
    text: "Get Your Free Compliance Audit",
    link: "/audit"
  },
  secondaryCTA: {
    text: "View 2026 Requirements",
    link: "/compliance-calendar"
  },
  trustSignals: [
    "500+ LA businesses protected",
    "100% compliance track record",
    "Certified HR professionals"
  ]
};

// ═══════════════════════════════════════════════════════════════
// PROBLEM/SOLUTION SECTION
// ═══════════════════════════════════════════════════════════════

export const problemSolution = {
  title: "The 2026 Compliance Challenge",
  problem: {
    title: "California Just Made HR More Complex",
    points: [
      {
        icon: "📅",
        text: "New mandates with strict deadlines (SB 294 by Feb 1, 2026)",
        penalty: "$500-$750 per employee violation"
      },
      {
        icon: "⚖️",
        text: "PAGA lawsuits targeting small businesses",
        penalty: "Average settlement: $80,000+"
      },
      {
        icon: "📋",
        text: "Complex documentation requirements",
        penalty: "Time-consuming and error-prone"
      },
      {
        icon: "🎓",
        text: "Mandatory training programs",
        penalty: "Penalties for non-completion"
      }
    ]
  },
  solution: {
    title: "Your Path from Liability to Protection",
    description: "HRBiz transforms complex California mandates into simple, actionable steps. We provide the tools, training, and templates LA businesses need to stay compliant—without the stress or expense of traditional consultants.",
    benefits: [
      {
        icon: "✅",
        title: "Automated Compliance",
        description: "Our platform tracks deadlines, generates documents, and alerts you to required actions—no manual tracking needed."
      },
      {
        icon: "🎓",
        title: "Online Training",
        description: "State-certified harassment prevention and safety training your employees can complete anytime, anywhere."
      },
      {
        icon: "📄",
        title: "Template Library",
        description: "50+ ready-to-use forms, notices, and policies updated for 2026 California requirements."
      },
      {
        icon: "👨‍💼",
        title: "Expert Support",
        description: "MPA-level guidance when you need it. Book consultations for complex situations or annual audits."
      }
    ]
  }
};

// ═══════════════════════════════════════════════════════════════
// SERVICES OVERVIEW
// ═══════════════════════════════════════════════════════════════

export const servicesOverview = {
  title: "Compliance Services Built for LA Businesses",
  subtitle: "Everything you need to meet California's 2026 mandates and protect your business from PAGA lawsuits",
  services: [
    {
      id: "harassment-prevention",
      icon: "🛡️",
      title: "Harassment Prevention Training",
      description: "California-mandated training for supervisors and employees. Interactive, online, with instant certificates.",
      features: [
        "AB 1825 & SB 1343 compliant",
        "2-hour supervisor / 1-hour employee courses",
        "English and Spanish versions",
        "Automatic renewal reminders"
      ],
      price: "From $29/employee",
      cta: "Start Training",
      link: "/services/harassment-prevention"
    },
    {
      id: "sb-294-compliance",
      icon: "📢",
      title: "SB 294 Know Your Rights",
      description: "Annual notice distribution system. We handle the paperwork, track acknowledgments, and maintain records.",
      features: [
        "Bilingual notice templates",
        "Digital distribution & tracking",
        "Emergency contact collection",
        "February 1 deadline alerts"
      ],
      price: "Free template download",
      cta: "Get Template",
      link: "/resources/sb-294"
    },
    {
      id: "violence-prevention",
      icon: "🚨",
      title: "SB 553 Violence Prevention Plan",
      description: "Complete workplace violence prevention plan development, training, and annual review.",
      features: [
        "Custom plan for your workplace",
        "Employee training program",
        "Incident response procedures",
        "Annual compliance review"
      ],
      price: "From $499",
      cta: "Build Your Plan",
      link: "/services/violence-prevention"
    },
    {
      id: "compliance-audit",
      icon: "🔍",
      title: "PAGA Protection Audit",
      description: "Comprehensive review of your HR files, policies, and practices to identify and fix PAGA vulnerabilities.",
      features: [
        "50-point compliance checklist",
        "Pay stub & wage analysis",
        "Meal/rest break verification",
        "Written action plan with deadlines"
      ],
      price: "From $799",
      cta: "Schedule Audit",
      link: "/services/audit"
    },
    {
      id: "monthly-support",
      icon: "💼",
      title: "Monthly Compliance Support",
      description: "Ongoing HR support with document review, employee handbook updates, and unlimited consultations.",
      features: [
        "Monthly compliance updates",
        "Unlimited email support",
        "Quarterly policy reviews",
        "Priority consultation scheduling"
      ],
      price: "From $199/month",
      cta: "Get Support",
      link: "/services/monthly-support"
    },
    {
      id: "templates",
      icon: "📚",
      title: "Document Templates",
      description: "Instantly download California-compliant forms, notices, policies, and checklists.",
      features: [
        "50+ templates for 2026",
        "Word & PDF formats",
        "Regular updates included",
        "Implementation guides"
      ],
      price: "Free with registration",
      cta: "Browse Templates",
      link: "/resources"
    }
  ]
};

// ═══════════════════════════════════════════════════════════════
// 2026 COMPLIANCE CALENDAR
// ═══════════════════════════════════════════════════════════════

export const complianceCalendar = {
  title: "2026 Compliance Calendar for LA Businesses",
  description: "Key deadlines you cannot miss. Download the full calendar or set up automated reminders.",
  deadlines: [
    {
      date: "February 1, 2026",
      mandate: "SB 294 Annual Notice",
      requirement: "Distribute Know Your Rights notice to all employees",
      penalty: "$500 per employee first offense, $750+ for repeat violations",
      status: "upcoming",
      action: "Download notice template"
    },
    {
      date: "March 30, 2026",
      mandate: "SB 294 Emergency Contacts",
      requirement: "Complete collection of employee emergency contact information (opt-in)",
      penalty: "Included in SB 294 penalties if not offered",
      status: "upcoming",
      action: "Get collection form"
    },
    {
      date: "Ongoing",
      mandate: "SB 553 Violence Prevention",
      requirement: "Maintain and annually review workplace violence prevention plan",
      penalty: "Cal/OSHA citations and fines",
      status: "continuous",
      action: "Create your plan"
    },
    {
      date: "Before Job Postings",
      mandate: "SB 642 Pay Transparency",
      requirement: "Include pay scale in all job postings (15+ employees)",
      penalty: "PAGA lawsuit exposure, civil penalties",
      status: "continuous",
      action: "Review job templates"
    },
    {
      date: "Every 2 Years",
      mandate: "Harassment Prevention Training",
      requirement: "All employees (1 hour); supervisors (2 hours)",
      penalty: "Exposure to harassment claims, reputational damage",
      status: "recurring",
      action: "Start training"
    }
  ]
};

// ═══════════════════════════════════════════════════════════════
// TESTIMONIALS / SOCIAL PROOF
// ═══════════════════════════════════════════════════════════════

export const testimonials = {
  title: "What LA Business Owners Say",
  reviews: [
    {
      name: "Maria Rodriguez",
      role: "Owner, Downtown LA Restaurant",
      company: "25 employees",
      quote: "HRBiz saved us from a potential PAGA nightmare. Their audit found issues with our pay stubs we didn't even know existed. Fixed everything before it became a lawsuit.",
      rating: 5,
      image: "/testimonials/maria-r.jpg" // placeholder
    },
    {
      name: "James Chen",
      role: "HR Manager, Tech Startup",
      company: "50 employees",
      quote: "The harassment prevention training was actually engaging—not just checking a box. Employees appreciated the real-world scenarios, and we got 100% completion in two weeks.",
      rating: 5,
      image: "/testimonials/james-c.jpg"
    },
    {
      name: "Sandra Martinez",
      role: "Owner, Healthcare Clinic",
      company: "15 employees",
      quote: "I was overwhelmed by all the new 2026 requirements. HRBiz broke it down into simple steps. Now we're compliant and I actually understand our obligations.",
      rating: 5,
      image: "/testimonials/sandra-m.jpg"
    }
  ]
};

// ═══════════════════════════════════════════════════════════════
// FAQ SECTION
// ═══════════════════════════════════════════════════════════════

export const faq = {
  title: "Common Questions About California Compliance",
  questions: [
    {
      question: "Do I really need to worry about PAGA lawsuits?",
      answer: "Yes. PAGA (Private Attorneys General Act) allows employees to sue on behalf of the state for labor code violations. Even small technical violations—like incomplete pay stubs or missed meal breaks—can result in $80,000+ settlements. The good news: most violations are preventable with proper systems."
    },
    {
      question: "What's the penalty for missing the February 1 SB 294 deadline?",
      answer: "SB 294 violations carry $500 per employee for first offense, $750+ for repeat violations. For a 20-person business, that's $10,000-$15,000 in potential penalties. The notice is free to distribute—there's no reason not to comply."
    },
    {
      question: "Can I just use online templates instead of paying for services?",
      answer: "Free templates are a great starting point (we offer them!), but they need customization for your specific situation. Improper implementation is worse than not having a policy at all—it creates evidence in a potential lawsuit. Our services include implementation guidance."
    },
    {
      question: "How long does harassment prevention training take?",
      answer: "California requires 2 hours for supervisors and 1 hour for employees. Our online training can be completed in one sitting or broken into modules. Most employees finish during a lunch break or slow period."
    },
    {
      question: "What if I have employees in multiple California cities?",
      answer: "Different cities (LA, San Francisco, Oakland) have additional local requirements beyond state law. We track these for you and ensure your policies cover all applicable jurisdictions."
    },
    {
      question: "Do I need a lawyer or can HRBiz handle everything?",
      answer: "HRBiz handles 90% of routine compliance needs. We recommend consulting an employment attorney for: active lawsuits, complex terminations, union matters, or when you need legal representation. We can refer you to trusted LA employment lawyers."
    }
  ]
};

// ═══════════════════════════════════════════════════════════════
// CALL-TO-ACTION SECTIONS
// ═══════════════════════════════════════════════════════════════

export const finalCTA = {
  primary: {
    title: "Don't Wait Until You're Facing a Lawsuit",
    subtitle: "Get your free compliance audit and see exactly where your business stands. No obligation, no sales pressure—just an honest assessment of your risks.",
    ctaText: "Get Free Audit",
    ctaLink: "/audit",
    features: [
      "15-minute call with HR expert",
      "Written summary of findings",
      "Prioritized action plan",
      "Template recommendations"
    ]
  },
  secondary: {
    title: "Questions About Your Specific Situation?",
    subtitle: "Schedule a 30-minute consultation to discuss your compliance concerns.",
    ctaText: "Book Consultation",
    ctaLink: "https://cal.com/hrbiz"
  }
};

// ═══════════════════════════════════════════════════════════════
// FOOTER CONTENT
// ═══════════════════════════════════════════════════════════════

export const footerContent = {
  tagline: "LA Compliance Made Simple",
  description: "Expert HR compliance guidance for Los Angeles small businesses navigating California's 2026 labor mandates.",
  links: {
    services: [
      { text: "Harassment Prevention Training", link: "/services/harassment-prevention" },
      { text: "SB 294 Compliance", link: "/services/sb-294" },
      { text: "Violence Prevention Plan", link: "/services/violence-prevention" },
      { text: "PAGA Audit", link: "/services/audit" }
    ],
    resources: [
      { text: "Free Templates", link: "/resources" },
      { text: "Compliance Blog", link: "/blog" },
      { text: "2026 Calendar", link: "/calendar" },
      { text: "Compliance Guides", link: "/guides" }
    ],
    company: [
      { text: "About HRBiz", link: "/about" },
      { text: "Our Approach", link: "/approach" },
      { text: "Contact Us", link: "/contact" },
      { text: "Book Consultation", link: "https://cal.com/hrbiz" }
    ]
  },
  contact: {
    email: "info@hrbiz.org",
    phone: "(323) 555-0199",
    address: "Los Angeles, CA"
  },
  social: {
    linkedin: "https://linkedin.com/company/hrbiz",
    twitter: "https://twitter.com/hrbiz_la"
  },
  legal: {
    disclaimer: "HRBiz provides HR compliance consulting services but is not a law firm and does not provide legal advice. For legal representation, please consult with a qualified employment attorney.",
    copyright: `© ${new Date().getFullYear()} HRBiz. All rights reserved.`,
    links: [
      { text: "Privacy Policy", link: "/privacy" },
      { text: "Terms of Service", link: "/terms" }
    ]
  }
};
