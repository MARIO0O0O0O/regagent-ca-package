<#
.SYNOPSIS
    Module 2: Personnel Audit Laboratory - Plugin Configuration
#>

[CmdletBinding()]
param(
    [Parameter(Mandatory=$false)]
    [string]$VaultPath = "C:\Users\mespindola\Documents\HRM\PERSONNEL RECORD AUDIT PROJECT"
)

#Requires -Version 5.1

$ErrorActionPreference = "Stop"
$VerbosePreference = "Continue"

# Output functions using braces to prevent colon errors
function Write-Success { param([string]$Message); Write-Host "[OK] $Message" -ForegroundColor Green }
function Write-Info { param([string]$Message); Write-Host "[INFO] $Message" -ForegroundColor Cyan }
function Write-Warning { param([string]$Message); Write-Host "[WARN] $Message" -ForegroundColor Yellow }
function Write-Error { param([string]$Message); Write-Host "[ERROR] $Message" -ForegroundColor Red }

function Get-ObsidianPlugin {
    param([string]$PluginId, [string]$PluginName, [string]$VaultPath)
    try {
        $pluginDir = Join-Path $VaultPath ".obsidian\plugins\$PluginId"
        if (-not (Test-Path $pluginDir)) { New-Item -ItemType Directory -Path $pluginDir -Force | Out-Null }
        $apiUrl = "https://api.github.com/repos/$PluginName/releases/latest"
        $release = Invoke-RestMethod -Uri $apiUrl -Headers @{"User-Agent" = "PowerShell-PersonnelAudit"}
        $version = $release.tag_name
        
        $mainJsUrl = "https://github.com/$PluginName/releases/download/$version/main.js"
        Invoke-WebRequest -Uri $mainJsUrl -OutFile (Join-Path $pluginDir "main.js") -UseBasicParsing
        
        $manifestUrl = "https://github.com/$PluginName/releases/download/$version/manifest.json"
        Invoke-WebRequest -Uri $manifestUrl -OutFile (Join-Path $pluginDir "manifest.json") -UseBasicParsing
        
        try {
            $stylesUrl = "https://github.com/$PluginName/releases/download/$version/styles.css"
            Invoke-WebRequest -Uri $stylesUrl -OutFile (Join-Path $pluginDir "styles.css") -UseBasicParsing -ErrorAction SilentlyContinue
        } catch {}

        Write-Success "Downloaded ${PluginId} version ${version}"
        return $true
    } catch {
        # Using ${} prevents the "Drive" parsing error with colons
        Write-Warning "Failed to download ${PluginId}: $($_.Exception.Message)"
        return $false
    }
}

try {
    Write-Info "Starting Module 2: Plugin Configuration"
    
    $trackerPath = Join-Path $VaultPath ".module-tracker.json"
    if (-not (Test-Path $trackerPath)) { 
        Write-Error "Module 1 not found at: ${trackerPath}"
        throw "Module 1 must be completed first." 
    }
    
    $tracker = Get-Content $trackerPath | ConvertFrom-Json
    
    $plugins = @(
        @{id="dataview"; name="blacksmithgu/obsidian-dataview"; desc="Data analysis"}
        @{id="templater-obsidian"; name="SilentVoid13/Templater"; desc="Templates"}
        @{id="obsidian-kanban"; name="mgmeyers/obsidian-kanban"; desc="Kanban"}
        @{id="obsidian-charts"; name="phibr0/obsidian-charts"; desc="Charts"}
        @{id="obsidian-excalidraw-plugin"; name="zsviczian/obsidian-excalidraw-plugin"; desc="Diagrams"}
        @{id="table-editor-obsidian"; name="tgrosinger/advanced-tables-obsidian"; desc="Tables"}
        @{id="obsidian-buttons"; name="shabegom/buttons"; desc="Buttons"}
        @{id="obsidian-tasks-plugin"; name="obsidian-tasks-group/obsidian-tasks"; desc="Tasks"}
    )

    $pluginsDir = Join-Path $VaultPath ".obsidian\plugins"
    if (-not (Test-Path $pluginsDir)) { New-Item -ItemType Directory -Path $pluginsDir -Force | Out-Null }

    $successCount = 0
    foreach ($plugin in $plugins) {
        $res = Get-ObsidianPlugin -PluginId $plugin.id -PluginName $plugin.name -VaultPath $VaultPath
        if ($res) { $successCount++ }
        Start-Sleep -Milliseconds 200
    }

    $enabledPlugins = $plugins | ForEach-Object { $_.id }
    $communityPluginsPath = Join-Path $VaultPath ".obsidian\community-plugins.json"
    $enabledPlugins | ConvertTo-Json | Set-Content -Path $communityPluginsPath -Encoding UTF8

    Write-Host "`n--- INSTALLATION COMPLETE ---" -ForegroundColor Green
    Write-Host "Success: $successCount / $($plugins.Count)"
    
    $tracker.module2 = @{ "completed" = $true; "timestamp" = (Get-Date -Format "o") }
    $tracker | ConvertTo-Json | Set-Content -Path $trackerPath -Encoding UTF8
    Write-Success "Module 2 finished!"

} catch {
    Write-Error "Failed: $($_.Exception.Message)"
}