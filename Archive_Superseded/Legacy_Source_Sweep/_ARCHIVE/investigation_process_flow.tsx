import React from 'react';
import { ArrowDown, FileText, Users, CheckCircle, AlertCircle, Shield } from 'lucide-react';

export default function InvestigationProcessFlow() {
  const phases = [
    {
      phase: "Phase 1",
      title: "Complaint Intake (Day 0-1)",
      icon: FileText,
      color: "bg-blue-500",
      steps: [
        "Complaint received by EEO Officer/HR",
        "Document complaint details",
        "Assess severity and immediate risks",
        "Implement interim protective measures if needed",
        "Notify complainant investigation will proceed"
      ]
    },
    {
      phase: "Phase 2",
      title: "Investigation (Days 2-[Timeline])",
      icon: Users,
      color: "bg-purple-500",
      steps: [
        "Assign qualified investigator",
        "Gather evidence (emails, documents, records)",
        "Interview complainant",
        "Interview respondent",
        "Interview witnesses",
        "Conduct site visits if applicable",
        "Assess credibility of all parties"
      ]
    },
    {
      phase: "Phase 3",
      title: "Findings & Determination",
      icon: CheckCircle,
      color: "bg-green-500",
      steps: [
        "Apply preponderance of evidence standard",
        "Determine: Sustained, Not Sustained, or Unfounded",
        "Document findings in written report",
        "Include credibility assessments",
        "Recommend remedial action if violations found"
      ]
    },
    {
      phase: "Phase 4",
      title: "Remedial Action",
      icon: AlertCircle,
      color: "bg-orange-500",
      steps: [
        "Implement disciplinary action if warranted",
        "Separate parties if necessary",
        "Restore denied opportunities",
        "Provide training if appropriate",
        "Update policies if needed"
      ]
    },
    {
      phase: "Phase 5",
      title: "Notification",
      icon: FileText,
      color: "bg-indigo-500",
      steps: [
        "Notify complainant of outcome",
        "Notify respondent of findings and discipline",
        "Remind both parties: no retaliation",
        "Maintain confidentiality of details"
      ]
    },
    {
      phase: "Phase 6",
      title: "Post-Investigation Monitoring",
      icon: Shield,
      color: "bg-teal-500",
      steps: [
        "Monitor for retaliation",
        "Follow up with complainant",
        "Assess effectiveness of remedies",
        "Document all follow-up actions",
        "Respond immediately to new issues"
      ]
    }
  ];

  return (
    <div className="min-h-screen bg-gradient-to-br from-slate-50 to-slate-100 p-8">
      <div className="max-w-5xl mx-auto">
        <div className="text-center mb-12">
          <h1 className="text-4xl font-bold text-slate-800 mb-3">
            Harassment Investigation Process
          </h1>
          <p className="text-xl text-slate-600">
            Sapphos Environmental Inc. - 6-Phase Investigation Framework
          </p>
          <div className="mt-4 inline-block bg-amber-100 border-l-4 border-amber-500 px-4 py-2">
            <p className="text-sm text-amber-800">
              <strong>Commitment:</strong> Prompt, Fair, Thorough, and Impartial Investigations
            </p>
          </div>
        </div>

        {/* Process Flow */}
        <div className="space-y-6">
          {phases.map((phase, index) => {
            const Icon = phase.icon;
            return (
              <div key={index}>
                <div className="bg-white rounded-lg shadow-lg overflow-hidden transform transition-all hover:shadow-xl">
                  {/* Phase Header */}
                  <div className={`${phase.color} px-6 py-4 text-white`}>
                    <div className="flex items-center gap-3">
                      <Icon className="w-8 h-8" />
                      <div>
                        <div className="text-sm font-semibold opacity-90">{phase.phase}</div>
                        <div className="text-xl font-bold">{phase.title}</div>
                      </div>
                    </div>
                  </div>

                  {/* Phase Steps */}
                  <div className="p-6">
                    <ul className="space-y-3">
                      {phase.steps.map((step, stepIndex) => (
                        <li key={stepIndex} className="flex items-start gap-3">
                          <div className="mt-1 w-2 h-2 rounded-full bg-slate-400 flex-shrink-0"></div>
                          <span className="text-slate-700 leading-relaxed">{step}</span>
                        </li>
                      ))}
                    </ul>
                  </div>
                </div>

                {/* Arrow between phases */}
                {index < phases.length - 1 && (
                  <div className="flex justify-center py-3">
                    <ArrowDown className="w-8 h-8 text-slate-400" />
                  </div>
                )}
              </div>
            );
          })}
        </div>

        {/* Key Principles */}
        <div className="mt-12 grid md:grid-cols-3 gap-6">
          <div className="bg-blue-50 border-l-4 border-blue-500 p-4 rounded">
            <h3 className="font-bold text-blue-900 mb-2">Confidentiality</h3>
            <p className="text-sm text-blue-800">
              Information shared on need-to-know basis only. Investigation records kept in separate Litigation/Investigations File.
            </p>
          </div>

          <div className="bg-green-50 border-l-4 border-green-500 p-4 rounded">
            <h3 className="font-bold text-green-900 mb-2">No Retaliation</h3>
            <p className="text-sm text-green-800">
              Complainants, witnesses, and participants protected from retaliation. Good-faith complaints protected even if not substantiated.
            </p>
          </div>

          <div className="bg-purple-50 border-l-4 border-purple-500 p-4 rounded">
            <h3 className="font-bold text-purple-900 mb-2">Fair Process</h3>
            <p className="text-sm text-purple-800">
              Both parties have opportunity to be heard. Evidence evaluated using preponderance of evidence standard. No predetermined outcome.
            </p>
          </div>
        </div>

        {/* Timeline Note */}
        <div className="mt-8 bg-white border-2 border-slate-300 rounded-lg p-6 text-center">
          <div className="text-lg font-bold text-slate-800 mb-2">
            Target Timeline
          </div>
          <p className="text-slate-600">
            Investigations completed within approximately <span className="font-bold text-blue-600">[TIMELINE]</span> days, 
            absent extenuating circumstances. Complainant will be notified if additional time is needed.
          </p>
        </div>

        {/* Contact Information */}
        <div className="mt-8 bg-slate-800 text-white rounded-lg p-6">
          <h3 className="text-xl font-bold mb-4">Questions or Need to Report?</h3>
          <div className="grid md:grid-cols-2 gap-4 text-sm">
            <div>
              <p className="font-semibold mb-1">EEO Officer</p>
              <p className="text-slate-300">[EEO_OFFICER_NAME]</p>
              <p className="text-slate-300">[EEO_OFFICER_PHONE]</p>
              <p className="text-slate-300">[EEO_OFFICER_EMAIL]</p>
            </div>
            <div>
              <p className="font-semibold mb-1">HR Director</p>
              <p className="text-slate-300">[HR_DIRECTOR_NAME]</p>
              <p className="text-slate-300">[HR_DIRECTOR_PHONE]</p>
              <p className="text-slate-300">[HR_DIRECTOR_EMAIL]</p>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}