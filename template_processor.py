#!/usr/bin/env python3
"""
Template Processor
Extracts text, genericizes content, creates templates
"""

import os
import sys
import re
import shutil
from pathlib import Path

# Genericization patterns
REPLACEMENTS = {
    # Company names
    r'\b(Sapphos Environmental|Button Nose Grooming|ABC Company|XYZ Corp(?:oration)?)\b': '[COMPANY NAME]',
    
    # Dates
    r'\b(January|February|March|April|May|June|July|August|September|October|November|December)\s+\d{1,2},?\s+\d{4}\b': '[EFFECTIVE DATE]',
    r'\b\d{1,2}/\d{1,2}/\d{4}\b': '[DATE]',
    r'\b\d{4}-\d{2}-\d{2}\b': '[DATE]',
    
    # Personal names
    r'\b(John|Jane|Mike|Sarah|David|Maria|Robert|Jennifer|James|Lisa|Michael|Mary|William|Patricia|Richard|Linda)\s+[A-Z][a-z]+\b': '[EMPLOYEE NAME]',
    
    # Contact info
    r'\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b': '[EMAIL]',
    r'\b\(?\d{3}\)?[-.\s]?\d{3}[-.\s]?\d{4}\b': '[PHONE]',
    
    # Addresses
    r'\b\d+\s+[A-Z][a-z]+\s+(Street|St|Avenue|Ave|Road|Rd|Boulevard|Blvd|Lane|Ln|Drive|Dr)\b': '[STREET ADDRESS]',
    r'\b(Los Angeles|San Francisco|San Diego|Sacramento|Oakland)\b(?=,?\s+(CA|California))': '[CITY]',
    
    # Dollar amounts
    r'\$\d{1,3}(?:,\d{3})*(?:\.\d{2})?\b': '[AMOUNT]',
    
    # Positions
    r'\b(Manager|Director|Supervisor|Coordinator|Administrator|CEO|CFO|President|VP)\b': '[POSITION]',
}

def genericize_text(text):
    """Apply genericization patterns"""
    if not text:
        return text, 0
    
    changes_count = 0
    for pattern, replacement in REPLACEMENTS.items():
        text, count = re.subn(pattern, replacement, text)
        changes_count += count
    
    return text, changes_count

def process_text_file(filepath, output_dir, data_dir):
    """Process text file"""
    try:
        with open(filepath, 'r', encoding='utf-8') as f:
            content = f.read()
        
        template_content, changes = genericize_text(content)
        
        filename = os.path.basename(filepath)
        name, ext = os.path.splitext(filename)
        
        # Save original
        data_file = os.path.join(data_dir, filename)
        os.makedirs(data_dir, exist_ok=True)
        shutil.copy2(filepath, data_file)
        
        # Save template
        template_name = f"{name}_TEMPLATE{ext}"
        template_file = os.path.join(output_dir, template_name)
        os.makedirs(output_dir, exist_ok=True)
        
        with open(template_file, 'w', encoding='utf-8') as f:
            f.write(template_content)
        
        print(f"  ✅ {filename} ({changes} changes)")
        return True
    
    except Exception as e:
        print(f"  ❌ {os.path.basename(filepath)}: {e}")
        return False

def process_binary_file(filepath, output_dir, data_dir):
    """Process binary file - copy as-is"""
    try:
        filename = os.path.basename(filepath)
        
        # Save to data
        data_file = os.path.join(data_dir, filename)
        os.makedirs(data_dir, exist_ok=True)
        shutil.copy2(filepath, data_file)
        
        # Copy to output
        output_file = os.path.join(output_dir, filename)
        os.makedirs(output_dir, exist_ok=True)
        shutil.copy2(filepath, output_file)
        
        print(f"  ✅ {filename}")
        return True
    
    except Exception as e:
        print(f"  ❌ {os.path.basename(filepath)}: {e}")
        return False

def main():
    if len(sys.argv) != 4:
        sys.exit(1)
    
    input_file = sys.argv[1]
    output_dir = sys.argv[2]
    data_dir = sys.argv[3]
    
    ext = Path(input_file).suffix.lower()
    
    if ext in ['.txt', '.md', '.html']:
        process_text_file(input_file, output_dir, data_dir)
    else:
        process_binary_file(input_file, output_dir, data_dir)

if __name__ == "__main__":
    main()
