"""
HR Audit Workflow Script
Purpose: Automate compliance research, audit reports, and compliance summaries
Version: 1.0
"""

import os
import sys
from datetime import datetime
from pathlib import Path
import anthropic
import google.generativeai as genai
import requests
from dotenv import load_dotenv

# Load environment variables
load_dotenv()

# Configuration
ANTHROPIC_API_KEY = os.getenv('ANTHROPIC_API_KEY')
GEMINI_API_KEY = os.getenv('GEMINI_API_KEY')
PERPLEXITY_API_KEY = os.getenv('PERPLEXITY_API_KEY')
VAULT_PATH = Path(os.getenv('VAULT_PATH', 'C:\\Users\\mespindola\\Documents\\HR-Audit'))

# Initialize APIs
anthropic_client = anthropic.Anthropic(api_key=ANTHROPIC_API_KEY)
genai.configure(api_key=GEMINI_API_KEY)
gemini_model = genai.GenerativeModel('gemini-2.0-flash-exp')

# HR Compliance Expert System Prompt
HR_SYSTEM_PROMPT = """You are an expert HR compliance specialist with extensive knowledge of employment law and audit procedures. You have deep expertise in:

- Federal employment laws (FLSA, FMLA, ADA, Title VII, OSHA)
- State of California laws (Labor Code, FEHA, DIR requirements)
- Local ordinances and regulations
- Applicable case law and regulatory guidance
- Industry best practices (SHRM, CalPELA, DOL, DLSE, EEOC)

Your approach to HR compliance includes:
- Citing specific legislation, regulations, and case law
- Identifying risk exposure and compliance gaps
- Flagging when legal counsel consultation is advisable
- Balancing compliance requirements with operational practicality
- Providing clear, thorough, and pragmatic explanations
- Using precise professional language appropriate for HR audits"""


def perplexity_research(query: str) -> str:
    """Research compliance requirements using Perplexity Pro API"""
    url = "https://api.perplexity.ai/chat/completions"
    
    headers = {
        "Authorization": f"Bearer {PERPLEXITY_API_KEY}",
        "Content-Type": "application/json"
    }
    
    payload = {
        "model": "sonar-pro",
        "messages": [
            {
                "role": "system",
                "content": "You are an HR compliance research assistant. Provide comprehensive, accurate information about employment law requirements with citations to federal statutes, California state laws, and regulatory guidance."
            },
            {
                "role": "user",
                "content": f"Research the following HR compliance topic and provide detailed requirements with legal citations: {query}\n\nFocus on: Federal requirements (FLSA, FMLA, ADA, Title VII, OSHA), California state requirements (Labor Code, FEHA, DIR), retention periods, storage requirements, and audit considerations."
            }
        ],
        "temperature": 0.2,
        "max_tokens": 4000
    }
    
    try:
        response = requests.post(url, json=payload, headers=headers)
        response.raise_for_status()
        result = response.json()
        return result['choices'][0]['message']['content']
    except Exception as e:
        return f"Perplexity API Error: {str(e)}"


def gemini_synthesize(research_content: str, mode: str, context: str) -> str:
    """Synthesize research into structured format using Gemini"""
    
    prompts = {
        "research": f"""Based on the following compliance research, create a structured audit checklist in markdown format:

Research Content:
{research_content}

Original Query Context: {context}

Create a checklist that includes:
1. Document Name/Type
2. Legal Authority (cite specific statutes/regulations)
3. Required Elements
4. Retention Period
5. Storage Requirements
6. Audit Verification Steps
7. Common Compliance Gaps

Format as a clean markdown document suitable for an HR audit.""",
        
        "summary": f"""Based on the following compliance research, create a compliance summary in markdown format:

Research Content:
{research_content}

Topic: {context}

Create a summary that includes:
1. Executive Summary (2-3 sentences)
2. Legal Requirements (with citations)
3. Key Compliance Points
4. Audit Implications
5. Risk Areas
6. Recommended Actions

Format as a clean markdown document."""
    }
    
    try:
        response = gemini_model.generate_content(prompts.get(mode, prompts["research"]))
        return response.text
    except Exception as e:
        return f"Gemini API Error: {str(e)}"


def claude_refine(content: str, mode: str, context: str) -> str:
    """Refine content with legal precision using Claude"""
    
    refinement_prompts = {
        "research": f"""Review and refine the following audit checklist for legal precision and completeness:

{content}

Original Query: {context}

Ensure:
1. All legal citations are accurate and complete
2. Compliance requirements reflect current law (as of your knowledge cutoff)
3. Audit steps are practical and thorough
4. Risk areas are clearly identified
5. Language is precise and professional
6. Any gaps or ambiguities are flagged

Provide the refined checklist in markdown format.""",
        
        "report": f"""Generate a professional HR audit findings report:

Context: {context}

Create a comprehensive audit report that includes:

# Employee Audit Report

## Employee Information
[Extract or note missing: Employee name, ID, Department, Position, Hire Date]

## Audit Date
{datetime.now().strftime('%B %d, %Y')}

## Documents Reviewed
[List all documents that were reviewed]

## Findings

### Compliant Items
[List documents/records that meet requirements]

### Missing Documents
[List missing items with specific legal requirements cited]

### Compliance Gaps
[Identify any partial compliance issues]

## Risk Assessment
[Assess legal risk level: Low/Medium/High with explanation]

## Recommendations
[Specific actions needed to achieve compliance]

## Deadlines
[Proposed timeline for remediation]

## Legal Authority References
[Cite applicable statutes/regulations]

---
**Audit Completed:** {datetime.now().strftime('%B %d, %Y')}  
**Next Review Date:** [Recommend date]

Use the context provided to populate this template. Be specific and cite legal authority.""",
        
        "summary": f"""Review and refine the following compliance summary for legal precision:

{content}

Topic: {context}

Ensure:
1. Legal citations are current and accurate
2. Audit implications are clearly stated
3. Risk areas are properly flagged
4. Recommendations are actionable
5. Language reflects HR professional standards

Provide the refined summary in markdown format."""
    }
    
    try:
        message = anthropic_client.messages.create(
            model="claude-sonnet-4-20250514",
            max_tokens=8000,
            temperature=0,
            system=HR_SYSTEM_PROMPT,
            messages=[
                {
                    "role": "user",
                    "content": refinement_prompts.get(mode, refinement_prompts["research"])
                }
            ]
        )
        return message.content[0].text
    except Exception as e:
        return f"Claude API Error: {str(e)}"


def save_to_obsidian(content: str, folder: str, filename: str) -> Path:
    """Save content to Obsidian vault"""
    output_dir = VAULT_PATH / folder
    output_dir.mkdir(parents=True, exist_ok=True)
    
    # Sanitize filename
    safe_filename = "".join(c for c in filename if c.isalnum() or c in (' ', '-', '_')).strip()
    timestamp = datetime.now().strftime('%Y%m%d_%H%M%S')
    output_file = output_dir / f"{safe_filename}_{timestamp}.md"
    
    # Add metadata
    metadata = f"""---
created: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}
tags: [hr-audit, compliance]
---

"""
    
    output_file.write_text(metadata + content, encoding='utf-8')
    return output_file


def mode_research(query: str):
    """Use Case 1: Research Compliance Requirements"""
    print(f"\n{'='*60}")
    print("MODE: COMPLIANCE RESEARCH")
    print(f"{'='*60}\n")
    print(f"Query: {query}\n")
    
    print("[1/3] Researching with Perplexity Pro...")
    research = perplexity_research(query)
    
    print("[2/3] Synthesizing with Gemini...")
    synthesized = gemini_synthesize(research, "research", query)
    
    print("[3/3] Refining with Claude...")
    refined = claude_refine(synthesized, "research", query)
    
    print("\n[SAVING] Saving to Obsidian vault...")
    output_file = save_to_obsidian(refined, "Checklists", query)
    
    print(f"\n✓ SUCCESS: Checklist saved to:\n  {output_file}\n")
    return refined


def mode_report(context: str):
    """Use Case 2: Generate Audit Report"""
    print(f"\n{'='*60}")
    print("MODE: AUDIT REPORT GENERATION")
    print(f"{'='*60}\n")
    print(f"Context: {context}\n")
    
    print("[1/1] Generating report with Claude...")
    report = claude_refine("", "report", context)
    
    print("\n[SAVING] Saving to Obsidian vault...")
    # Extract employee name from context if possible
    employee_name = context.split()[0] if context else "Employee"
    output_file = save_to_obsidian(report, "Reports", f"{employee_name}_Audit_Report")
    
    print(f"\n✓ SUCCESS: Report saved to:\n  {output_file}\n")
    return report


def mode_summary(topic: str):
    """Use Case 3: Create Compliance Summary"""
    print(f"\n{'='*60}")
    print("MODE: COMPLIANCE SUMMARY")
    print(f"{'='*60}\n")
    print(f"Topic: {topic}\n")
    
    print("[1/3] Researching with Perplexity Pro...")
    research = perplexity_research(topic)
    
    print("[2/3] Drafting with Gemini...")
    draft = gemini_synthesize(research, "summary", topic)
    
    print("[3/3] Refining with Claude...")
    refined = claude_refine(draft, "summary", topic)
    
    print("\n[SAVING] Saving to Obsidian vault...")
    output_file = save_to_obsidian(refined, "Compliance-Summaries", topic)
    
    print(f"\n✓ SUCCESS: Summary saved to:\n  {output_file}\n")
    return refined


def main():
    """Main CLI interface"""
    if len(sys.argv) < 3:
        print("""
HR Audit Workflow - Command Line Interface
===========================================

Usage:
  python hr_audit.py research "query"       - Research compliance requirements
  python hr_audit.py report "context"       - Generate audit report
  python hr_audit.py summary "topic"        - Create compliance summary

Examples:
  python hr_audit.py research "I-9 form requirements"
  python hr_audit.py report "John Doe - missing I-9 page 2, no 2023 performance review"
  python hr_audit.py summary "California meal break requirements"
        """)
        sys.exit(1)
    
    mode = sys.argv[1].lower()
    query = " ".join(sys.argv[2:])
    
    if mode == "research":
        mode_research(query)
    elif mode == "report":
        mode_report(query)
    elif mode == "summary":
        mode_summary(query)
    else:
        print(f"ERROR: Unknown mode '{mode}'")
        print("Valid modes: research, report, summary")
        sys.exit(1)


if __name__ == "__main__":
    main()