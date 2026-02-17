# Prompt for Gemini: GitHub to GitLab Migration Assistant

Copy and paste this entire prompt into Gemini Pro to get step-by-step migration help.

---

## 🎯 Your Mission

I need your help migrating all my GitHub repositories to GitLab. I'm working on a Samsung S24 Ultra using Termux as my primary terminal environment.

## 📋 Current Situation

**Device:** Samsung S24 Ultra  
**Terminal:** Termux (Android)  
**Source:** GitHub (multiple repositories)  
**Destination:** GitLab (my new primary platform)  
**Git Status:** Already installed in Termux

## 🎯 Migration Goals

1. **Complete migration** of all repositories from GitHub to GitLab
2. **Preserve all history** (commits, branches, tags)
3. **Mirror settings** where possible (descriptions, visibility)
4. **Maintain local workflow** (update remotes on S24 Ultra)
5. **Automated process** where possible (I have multiple repos)

## 📱 Technical Constraints

- Working entirely from Samsung S24 Ultra
- Using Termux terminal environment
- Need mobile-friendly commands and workflows
- Prefer scripted/automated solutions for bulk operations
- Internet connection available but prefer efficient bandwidth usage

## 🔐 What I Need You To Provide

### Part 1: Pre-Migration Checklist
1. List of GitHub information I need to gather before starting
2. GitLab account setup requirements
3. Authentication setup (SSH keys vs Personal Access Tokens)
4. Any GitLab-specific configuration needed

### Part 2: Single Repository Migration
Provide complete step-by-step instructions for migrating ONE repository first (as a test):
1. Commands to run in Termux
2. How to verify the migration succeeded
3. How to update my local repository to point to GitLab
4. How to ensure all branches and tags transferred

### Part 3: Bulk Migration Script
Create a Bash script for Termux that can:
1. List all my GitHub repositories
2. Prompt me to select which ones to migrate
3. Automatically create corresponding GitLab projects
4. Mirror each repository (all branches, tags, history)
5. Verify each migration
6. Generate a migration report

### Part 4: Post-Migration Tasks
1. How to update local clones on my S24 Ultra
2. How to archive or mark old GitHub repos as "moved"
3. How to set up redirects or migration notices
4. Cleanup checklist

### Part 5: CI/CD Migration (if applicable)
If any of my repos use GitHub Actions:
1. How to identify which repos have CI/CD
2. How to convert GitHub Actions to GitLab CI/CD
3. Example conversions for common workflows

## 🛠️ Specific Technical Details

### Authentication Preference
I prefer **SSH keys** over HTTPS tokens for both GitHub and GitLab. Please include:
- How to generate SSH keys in Termux
- How to add keys to both GitHub and GitLab
- How to test SSH connection from Termux

### Repository Details to Preserve
For each repository, I want to preserve:
- ✅ All commit history
- ✅ All branches
- ✅ All tags
- ✅ Repository description
- ✅ Public/Private visibility setting
- ✅ README and documentation
- ⚠️ Issues/Pull Requests (explain if possible, accept if not)

### Migration Verification
For each migrated repo, show me how to verify:
1. Commit count matches
2. All branches transferred
3. All tags transferred
4. Latest commit hash matches
5. Repository size is correct

## 📝 Output Format I Need

Please structure your response as:

### Section 1: Quick Start (5-minute overview)
- What I'm about to do
- Prerequisites checklist
- Estimated time for full migration

### Section 2: SSH Setup (one-time setup)
- Generate SSH key in Termux
- Add to GitHub
- Add to GitLab
- Test both connections

### Section 3: Test Migration (single repo)
- Step-by-step commands
- What to look for at each step
- How to verify success
- How to rollback if needed

### Section 4: Bulk Migration Script
- Complete, ready-to-run Bash script
- Line-by-line explanation
- How to customize for my needs
- Error handling

### Section 5: Troubleshooting
- Common errors and solutions
- How to handle large repositories
- What to do if migration fails mid-process
- Network interruption recovery

### Section 6: Post-Migration Workflow
- Update local repos
- Archive GitHub repos
- Update documentation
- Final verification

## 🚨 Critical Requirements

1. **All commands must work in Termux** (Android environment)
2. **Preserve complete Git history** (no shallow clones)
3. **Efficient bandwidth usage** (mobile data friendly)
4. **Resume capability** (if connection drops)
5. **Verification steps** (don't trust, verify)
6. **Backup strategy** (what if something goes wrong)

## 💡 Additional Context

**My Use Case:**
- I'm a compliance consultant building HRBiz.org
- Migrating from GitHub to GitLab for better DevOps integration
- Will have clients with limited technical access
- Need professional, enterprise-ready platform
- Privacy and data control are important

**My Skill Level:**
- Comfortable with Git basics (clone, commit, push, pull)
- Familiar with Termux and Linux commands
- Can read and modify Bash scripts
- Prefer automation over manual repetition

## ✅ Success Criteria

By the end of this migration, I should have:
- [ ] All GitHub repos successfully migrated to GitLab
- [ ] All history, branches, and tags preserved
- [ ] Local repos on S24 Ultra pointing to GitLab
- [ ] SSH authentication working smoothly
- [ ] Migration verification report
- [ ] GitHub repos marked as "moved to GitLab"
- [ ] Confidence to manage GitLab going forward

## 📞 Questions to Address

Please also answer these specific questions:

1. **Should I use GitLab's built-in GitHub import feature or manual git push?**
   - Pros/cons of each approach
   - Which preserves more data
   - Which is more reliable

2. **How do I handle repositories with GitHub-specific features?**
   - GitHub Pages
   - GitHub Actions
   - GitHub Wiki
   - GitHub Issues

3. **What's the best way to keep GitHub repos as read-only archives?**
   - Archive vs Delete
   - Add "Moved to GitLab" notice
   - Redirect automation

4. **Can I automate updating README files to point to new GitLab location?**
   - Script to add migration notice
   - Update badges and links

5. **How do I handle private repositories?**
   - Ensure they stay private
   - Any special considerations

## 🎯 Deliverables I Expect

1. **Complete migration guide** (markdown format)
2. **Bash script** for bulk migration (well-commented)
3. **Verification script** to check migration success
4. **Troubleshooting guide** with common issues
5. **Post-migration checklist**

## 🚀 Let's Begin!

Please start with:
1. A brief explanation of the migration process
2. Time estimate for my situation
3. Any warnings or important notes
4. Then proceed with Section 1

Remember: I'm on a Samsung S24 Ultra using Termux, so all commands must be mobile-compatible!

---

## 📎 Additional Information You Might Need

**My Current Setup:**
- Device: Samsung S24 Ultra
- Terminal: Termux
- Git: Installed and configured
- GitHub: Have existing account with repositories
- GitLab: Will create new account (or already have one)

**Repositories to Migrate:**
- Mix of public and private repos
- Various sizes (small to medium)
- Some have branches, some single branch
- Most are code repositories
- Some have documentation only

**Timeline:**
- Want to complete migration this weekend
- Can dedicate 2-4 hours
- Prefer automated approach for speed

---

**Ready? Please provide your comprehensive migration guide now!** 🚀

---

## 🎓 Bonus: Learning Goals

While helping me migrate, please also help me understand:
- How Git mirrors work under the hood
- Why GitLab's approach to CI/CD is better
- Best practices for repository organization in GitLab
- How to set up GitLab for optimal workflow

**Thank you! Let's make this migration smooth and successful!** 💪
