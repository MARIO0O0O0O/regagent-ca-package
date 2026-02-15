<#
.SYNOPSIS
    Module 2: Personnel Audit Laboratory - Plugin Configuration
    
.DESCRIPTION
    Installs and configures essential Obsidian community plugins for:
    - Data visualization (Charts, Dataview)
    - AI integration (Templater, Buttons)
    - Project management (Kanban, Tasks)
    - Diagrams (Excalidraw, Mermaid)
    - Enhanced tables and formatting
    
.NOTES
    Author: Human Resources
    Date: December 20, 2025
    Module: 2 of 5
    Requires: Module 1 completed
    
.PARAMETER VaultPath
    Path where the Obsidian vault is located
    Default: C:\Users\mespindola\Documents\HRM\PERSONNEL RECORD AUDIT PROJECT
#>

[CmdletBinding()]
param(
    [Parameter(Mandatory=$false)]
    [string]$VaultPath = "C:\Users\mespindola\Documents\HRM\PERSONNEL RECORD AUDIT PROJECT"
)

#Requires -Version 5.1

$ErrorActionPreference = "Stop"
$VerbosePreference = "Continue"

# Color output functions
function Write-Success { param([string]$Message); Write-Host "✓ $Message" -ForegroundColor Green }
function Write-Info { param([string]$Message); Write-Host "ℹ $Message" -ForegroundColor Cyan }
function Write-Warning { param([string]$Message); Write-Host "⚠ $Message" -ForegroundColor Yellow }
function Write-Error { param([string]$Message); Write-Host "✗ $Message" -ForegroundColor Red }

# Plugin download helper
function Get-ObsidianPlugin {
    param(
        [string]$PluginId,
        [string]$PluginName,
        [string]$VaultPath
    )
    
    try {
        $pluginDir = Join-Path $VaultPath ".obsidian\plugins\$PluginId"
        
        # Create plugin directory
        if (-not (Test-Path $pluginDir)) {
            New-Item -ItemType Directory -Path $pluginDir -Force | Out-Null
        }
        
        # GitHub releases API URL for the plugin
        $apiUrl = "https://api.github.com/repos/$PluginName/releases/latest"
        
        Write-Verbose "Fetching latest release for $PluginId from $apiUrl"
        
        # Get latest release info
        $release = Invoke-RestMethod -Uri $apiUrl -Headers @{
            "User-Agent" = "PowerShell-PersonnelAudit"
        }
        
        $version = $release.tag_name
        
        # Download main.js
        $mainJsUrl = "https://github.com/$PluginName/releases/download/$version/main.js"
        $mainJsPath = Join-Path $pluginDir "main.js"
        Invoke-WebRequest -Uri $mainJsUrl -OutFile $mainJsPath -UseBasicParsing
        
        # Download manifest.json
        $manifestUrl = "https://github.com/$PluginName/releases/download/$version/manifest.json"
        $manifestPath = Join-Path $pluginDir "manifest.json"
        Invoke-WebRequest -Uri $manifestUrl -OutFile $manifestPath -UseBasicParsing
        
        # Try to download styles.css (optional)
        try {
            $stylesUrl = "https://github.com/$PluginName/releases/download/$version/styles.css"
            $stylesPath = Join-Path $pluginDir "styles.css"
            Invoke-WebRequest -Uri $stylesUrl -OutFile $stylesPath -UseBasicParsing -ErrorAction SilentlyContinue
        } catch {
            # styles.css is optional, ignore errors
        }
        
        Write-Success "Downloaded plugin: $PluginId (version $version)"
        return $true
        
    } catch {
        Write-Warning "Failed to download $PluginId automatically: $($_.Exception.Message)"
        Write-Info "You can install this plugin manually from Obsidian's Community Plugins"
        return $false
    }
}

# Main execution
try {
    Write-Info "Starting Module 2: Plugin Configuration"
    Write-Info "Vault Path: $VaultPath"
    
    # Verify Module 1 completed
    $trackerPath = Join-Path $VaultPath ".module-tracker.json"
    if (-not (Test-Path $trackerPath)) {
        throw "Module 1 must be completed first. Run Module1_VaultFoundation.ps1"
    }
    
    $tracker = Get-Content $trackerPath | ConvertFrom-Json
    if (-not $tracker.module1.completed) {
        throw "Module 1 is not marked as completed. Please run Module1_VaultFoundation.ps1 first."
    }
    
    Write-Success "Module 1 verification passed"
    
    # Step 1: Define plugin list
    Write-Verbose "Step 1: Defining essential plugins..."
    
    $plugins = @(
        @{
            id = "dataview"
            name = "blacksmithgu/obsidian-dataview"
            description = "Advanced queries and data analysis"
            priority = "CRITICAL"
        },
        @{
            id = "templater-obsidian"
            name = "SilentVoid13/Templater"
            description = "Dynamic templates with variables and scripts"
            priority = "CRITICAL"
        },
        @{
            id = "obsidian-kanban"
            name = "mgmeyers/obsidian-kanban"
            description = "Kanban boards for task management"
            priority = "HIGH"
        },
        @{
            id = "obsidian-charts"
            name = "phibr0/obsidian-charts"
            description = "Create charts and graphs"
            priority = "HIGH"
        },
        @{
            id = "obsidian-excalidraw-plugin"
            name = "zsviczian/obsidian-excalidraw-plugin"
            description = "Hand-drawn style diagrams"
            priority = "HIGH"
        },
        @{
            id = "table-editor-obsidian"
            name = "tgrosinger/advanced-tables-obsidian"
            description = "Enhanced table editing"
            priority = "MEDIUM"
        },
        @{
            id = "obsidian-buttons"
            name = "shabegom/buttons"
            description = "Interactive buttons for actions"
            priority = "HIGH"
        },
        @{
            id = "obsidian-tasks-plugin"
            name = "obsidian-tasks-group/obsidian-tasks"
            description = "Advanced task management"
            priority = "MEDIUM"
        },
        @{
            id = "tag-wrangler"
            name = "pjeby/tag-wrangler"
            description = "Manage tags efficiently"
            priority = "LOW"
        },
        @{
            id = "obsidian-meta-bind-plugin"
            name = "mProjectsCode/obsidian-meta-bind-plugin"
            description = "Interactive UI elements"
            priority = "MEDIUM"
        }
    )
    
    Write-Info "Total plugins to install: $($plugins.Count)"
    
    # Step 2: Create plugins directory
    $pluginsDir = Join-Path $VaultPath ".obsidian\plugins"
    if (-not (Test-Path $pluginsDir)) {
        New-Item -ItemType Directory -Path $pluginsDir -Force | Out-Null
    }
    
    # Step 3: Attempt to download plugins
    Write-Info "Step 2: Downloading community plugins..."
    Write-Warning "This may take 2-3 minutes. Please be patient."
    Write-Host "`n"
    
    $successCount = 0
    $failCount = 0
    
    foreach ($plugin in $plugins) {
        Write-Host "  Installing: $($plugin.description) [$($plugin.priority)]" -ForegroundColor Cyan
        
        $result = Get-ObsidianPlugin -PluginId $plugin.id -PluginName $plugin.name -VaultPath $VaultPath
        
        if ($result) {
            $successCount++
        } else {
            $failCount++
        }
        
        Start-Sleep -Milliseconds 500  # Rate limiting
    }
    
    Write-Host "`n"
    Write-Info "Plugin installation complete: $successCount succeeded, $failCount require manual installation"
    
    # Step 4: Update community-plugins.json to enable plugins
    Write-Verbose "Step 3: Enabling community plugins in Obsidian config..."
    
    $enabledPlugins = $plugins | ForEach-Object { $_.id }
    $communityPluginsPath = Join-Path $VaultPath ".obsidian\community-plugins.json"
    $enabledPlugins | ConvertTo-Json | Set-Content -Path $communityPluginsPath -Encoding UTF8
    
    Write-Success "Enabled $($enabledPlugins.Count) community plugins"
    
    # Step 5: Create plugin configurations
    Write-Verbose "Step 4: Creating plugin configurations..."
    
    # Dataview configuration
    $dataviewConfig = @{
        "inlineQueryPrefix" = "="
        "inlineJsQueryPrefix" = "``$="
        "inlineQueriesInCodeblocks" = $true
        "enableDataviewJs" = $true
        "enableInlineDataview" = $true
        "enableInlineDataviewJs" = $true
        "prettyRenderInlineFields" = $true
        "dataviewJsKeyword" = "dataviewjs"
    } | ConvertTo-Json -Depth 10
    
    $dataviewConfigPath = Join-Path $VaultPath ".obsidian\plugins\dataview\data.json"
    if (Test-Path (Join-Path $VaultPath ".obsidian\plugins\dataview")) {
        Set-Content -Path $dataviewConfigPath -Value $dataviewConfig -Encoding UTF8
        Write-Success "Configured Dataview plugin"
    }
    
    # Templater configuration
    $templaterConfig = @{
        "command_timeout" = 5
        "templates_folder" = "09-Templates"
        "templates_pairs" = @(
            @("", "")
        )
        "trigger_on_file_creation" = $false
        "enable_system_commands" = $false
        "shell_path" = ""
        "script_folder" = ""
        "empty_file_template" = ""
        "syntax_highlighting" = $true
        "enabled" = $true
    } | ConvertTo-Json -Depth 10
    
    $templaterConfigPath = Join-Path $VaultPath ".obsidian\plugins\templater-obsidian\data.json"
    if (Test-Path (Join-Path $VaultPath ".obsidian\plugins\templater-obsidian")) {
        Set-Content -Path $templaterConfigPath -Value $templaterConfig -Encoding UTF8
        Write-Success "Configured Templater plugin"
    }
    
    # Step 6: Create plugin documentation
    Write-Verbose "Step 5: Creating plugin usage guides..."
    
    $pluginGuidePath = Join-Path $VaultPath "08-Knowledge-Base\Obsidian-Guide\Plugin-Overview.md"
    $pluginGuideContent = @"
# Obsidian Plugins - Overview

This vault uses several community plugins to enhance functionality for the personnel audit.

## 🔌 Installed Plugins

### Critical Plugins (Must Have)

#### 1. **Dataview**
**Purpose:** Query and analyze your audit data like a database

**Use Cases:**
- Generate lists of employees missing documents
- Create compliance dashboards
- Calculate completion percentages
- Filter files by criteria

**Example Query:**
``````dataview
TABLE 
  file.ctime as "Created",
  compliance-status as "Status"
FROM "01-Employees"
WHERE compliance-status = "incomplete"
``````

📚 **Learn More:** [[08-Knowledge-Base/Obsidian-Guide/Dataview-Tutorial|Dataview Tutorial]]

---

#### 2. **Templater**
**Purpose:** Create dynamic templates with variables and automation

**Use Cases:**
- Auto-generate employee audit notes
- Daily progress templates with date
- Pre-filled compliance checklists

**Example Template:**
``````
# Employee Audit: {{title}}
Date: <% tp.date.now("YYYY-MM-DD") %>
Status: 
- [ ] I-9 Form
- [ ] W-4
- [ ] Handbook Acknowledgment
``````

📚 **Learn More:** [[08-Knowledge-Base/Obsidian-Guide/Templater-Tutorial|Templater Tutorial]]

---

### High Priority Plugins

#### 3. **Obsidian Charts**
**Purpose:** Visualize audit data with charts and graphs

**Chart Types:**
- Bar charts (gap distribution)
- Pie charts (compliance percentages)
- Line charts (progress over time)

**Example:**
``````chart
type: bar
labels: [I-9, W-4, Training, Handbook]
series:
  - title: Missing
    data: [15, 8, 22, 5]
``````

---

#### 4. **Kanban**
**Purpose:** Visual task management

**Use Cases:**
- Daily audit workflow (To Do → In Progress → Done)
- Track remediation tasks
- Manage 90-day action plan

**How to Create:**
Right-click folder → "New Kanban Board"

---

#### 5. **Excalidraw**
**Purpose:** Create hand-drawn style diagrams

**Use Cases:**
- Information silo mapping
- Org charts
- Process flowcharts
- Compliance relationship diagrams

**How to Use:**
Command palette (Ctrl+P) → "Excalidraw: Create new drawing"

---

#### 6. **Buttons**
**Purpose:** Add interactive buttons to notes

**Use Cases:**
- "Run I-9 Audit" button
- "Open AI Assistant" button
- "Generate Report" button
- Info modals for complex topics

**Example:**
``````button
name Open AI Guide
type link
action obsidian://open?vault=Personnel%20Audit&file=AI-Guide
``````

📚 **Learn More:** [[08-Knowledge-Base/Obsidian-Guide/Creating-Buttons|Button Tutorial]]

---

### Medium Priority Plugins

#### 7. **Advanced Tables**
Makes editing Markdown tables much easier with spreadsheet-like features

#### 8. **Tasks**
Advanced task management with recurring tasks, due dates, priorities

#### 9. **Meta Bind**
Create interactive UI elements (dropdowns, checkboxes) in your notes

#### 10. **Tag Wrangler**
Efficiently manage and rename tags across your vault

---

## 🚀 Quick Start Guide

### First Time Setup

1. **Open Obsidian**
   - File → Open Vault
   - Select: ``$VaultPath``

2. **Enable Community Plugins**
   - Settings (gear icon) → Community Plugins
   - Click "Turn on community plugins"
   - Plugins should already be enabled from Module 2

3. **Verify Installation**
   - Settings → Community Plugins
   - Check all plugins are listed and enabled

4. **Restart Obsidian**
   - Restart to ensure all plugins load properly

---

## 🎓 Learning Resources

### For Each Plugin:

- **Dataview:** [[08-Knowledge-Base/Obsidian-Guide/Dataview-Tutorial|Full Tutorial]]
- **Templater:** [[08-Knowledge-Base/Obsidian-Guide/Templater-Tutorial|Full Tutorial]]
- **Charts:** [[08-Knowledge-Base/Obsidian-Guide/Charts-Tutorial|Full Tutorial]]
- **Buttons:** [[08-Knowledge-Base/Obsidian-Guide/Creating-Buttons|Full Tutorial]]

### Video Tutorials:

```button
name Watch: Dataview for Beginners
type link
action https://www.youtube.com/results?search_query=obsidian+dataview+tutorial
```

```button
name Watch: Templater Guide
type link
action https://www.youtube.com/results?search_query=obsidian+templater+tutorial
```

---

## ❓ Troubleshooting

**Plugins not working after installation:**
1. Settings → Community Plugins → Ensure "Turn on community plugins" is enabled
2. Restart Obsidian
3. Check each plugin is enabled in the list

**Dataview queries not showing results:**
- Make sure query is in a code block with \`\`\`dataview
- Check folder paths are correct
- Verify frontmatter fields exist

**Templater not executing:**
- Settings → Templater → Check "Trigger Templater on new file creation"
- Ensure templates are in ``09-Templates/`` folder

---

## 📋 Manual Installation (If Needed)

If any plugins failed to auto-install:

1. Open Obsidian
2. Settings → Community Plugins → Browse
3. Search for plugin name
4. Click Install
5. Click Enable

**Failed Plugins:** 
$failCount plugins may need manual installation. Check console output above.

---

*Updated: $(Get-Date -Format "yyyy-MM-dd HH:mm")*
*Module: 2 - Plugin Configuration*
"@
    
    # Ensure Knowledge Base directory exists
    $kbDir = Join-Path $VaultPath "08-Knowledge-Base\Obsidian-Guide"
    if (-not (Test-Path $kbDir)) {
        New-Item -ItemType Directory -Path $kbDir -Force | Out-Null
    }
    
    Set-Content -Path $pluginGuidePath -Value $pluginGuideContent -Encoding UTF8
    Write-Success "Created plugin overview guide"
    
    # Step 7: Update module tracker
    Write-Verbose "Step 6: Updating module tracker..."
    
    $tracker.module2 = @{
        "name" = "Plugin Configuration"
        "completed" = $true
        "timestamp" = (Get-Date -Format "o")
        "version" = "1.0"
        "plugins_installed" = $successCount
        "plugins_failed" = $failCount
    }
    
    $tracker | ConvertTo-Json -Depth 10 | Set-Content -Path $trackerPath -Encoding UTF8
    Write-Success "Updated module completion tracker"
    
    # Step 8: Create quick reference card
    $quickRefPath = Join-Path $VaultPath "08-Knowledge-Base\Obsidian-Guide\Quick-Reference.md"
    $quickRefContent = @"
# Obsidian Quick Reference Card

## 🔥 Most Used Features

### Linking
- \`[[Note Name]]\` - Link to another note
- \`[[Note#Heading]]\` - Link to heading
- \`![[Note]]\` - Embed another note
- \`![[image.png]]\` - Embed image

### Formatting
- \`**bold**\` - **bold**
- \`*italic*\` - *italic*
- \`~~strikethrough~~\` - ~~strikethrough~~
- \`==highlight==\` - ==highlight==
- \`- [ ] Task\` - Checkbox

### Tags
- \`#tag\` - Create tag
- Click tag to see all uses

### Dataview Queries
``````dataview
TABLE field1, field2
FROM "folder"
WHERE condition
``````

### Templater Variables
- \`<% tp.date.now() %>\` - Current date
- \`<% tp.file.title %>\` - File title

## ⌨️ Keyboard Shortcuts

| Action | Windows | Description |
|--------|---------|-------------|
| Command Palette | Ctrl+P | Access all commands |
| Quick Switcher | Ctrl+O | Open file quickly |
| Search | Ctrl+Shift+F | Global search |
| Graph View | Ctrl+G | See connections |
| New Note | Ctrl+N | Create new note |
| Settings | Ctrl+, | Open settings |

## 🎯 Common Tasks

### Create Employee Audit Note
1. Ctrl+P → "Templater: Create new note from template"
2. Select "Employee Audit Template"
3. Fill in employee name

### Run Compliance Query
1. Open \`03-Gap-Analysis/Dashboard.md\`
2. Dataview queries auto-update

### Create Button
``````button
name Button Text
type command
action Command Name
``````

---

*Print this page for quick reference!*
"@
    
    Set-Content -Path $quickRefPath -Value $quickRefContent -Encoding UTF8
    Write-Success "Created quick reference card"
    
    # Final Summary
    Write-Host "`n" -NoNewline
    Write-Host "╔════════════════════════════════════════════════════════════╗" -ForegroundColor Cyan
    Write-Host "║                                                            ║" -ForegroundColor Cyan
    Write-Host "║        MODULE 2: PLUGIN CONFIGURATION - COMPLETE ✓        ║" -ForegroundColor Green
    Write-Host "║                                                            ║" -ForegroundColor Cyan
    Write-Host "╚════════════════════════════════════════════════════════════╝" -ForegroundColor Cyan
    Write-Host "`n"
    
    Write-Host "📊 INSTALLATION SUMMARY:" -ForegroundColor Yellow
    Write-Host "   Total Plugins: $($plugins.Count)" -ForegroundColor White
    Write-Host "   Successfully Installed: $successCount" -ForegroundColor Green
    Write-Host "   Require Manual Install: $failCount" -ForegroundColor $(if ($failCount -gt 0) { "Yellow" } else { "Green" })
    Write-Host "`n"
    
    Write-Host "🔌 PLUGINS ENABLED:" -ForegroundColor Yellow
    foreach ($plugin in $plugins) {
        $status = if (Test-Path (Join-Path $VaultPath ".obsidian\plugins\$($plugin.id)")) { "✓" } else { "⚠" }
        $color = if ($status -eq "✓") { "Green" } else { "Yellow" }
        Write-Host "   $status $($plugin.id) - $($plugin.description)" -ForegroundColor $color
    }
    Write-Host "`n"
    
    if ($failCount -gt 0) {
        Write-Warning "Some plugins failed automatic installation."
        Write-Info "These can be installed manually from Obsidian (Settings → Community Plugins → Browse)"
        Write-Host "`n"
    }
    
    Write-Host "📚 DOCUMENTATION CREATED:" -ForegroundColor Yellow
    Write-Host "   ✓ Plugin Overview Guide" -ForegroundColor White
    Write-Host "   ✓ Quick Reference Card" -ForegroundColor White
    Write-Host "`n"
    
    Write-Host "🚀 NEXT STEPS:" -ForegroundColor Yellow
    Write-Host "   1. Open vault in Obsidian and restart the app" -ForegroundColor White
    Write-Host "   2. Settings → Community Plugins → Turn on community plugins" -ForegroundColor White
    Write-Host "   3. Verify plugins are enabled and working" -ForegroundColor White
    Write-Host "   4. Run Module 3: .\Module3_AIIntegration.ps1" -ForegroundColor White
    Write-Host "`n"
    
    Write-Success "Module 2 completed successfully!"
    
} catch {
    Write-Error "Module 2 failed: $($_.Exception.Message)"
    Write-Host "`nStack Trace:" -ForegroundColor Red
    Write-Host $_.ScriptStackTrace -ForegroundColor Red
    exit 1
}

# End of Module 2