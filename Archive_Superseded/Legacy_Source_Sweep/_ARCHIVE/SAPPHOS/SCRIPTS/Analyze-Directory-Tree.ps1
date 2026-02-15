# Directory Tree Analysis Script - FIXED VERSION
# Purpose: Map current file structure and identify fragmentation in Obsidian vault
# Date: December 29, 2025
# Fixed: Removed Unicode characters for Windows compatibility

Write-Host "`n================================================================================" -ForegroundColor Cyan
Write-Host "DIRECTORY TREE ANALYSIS - C:\Users\mespindola" -ForegroundColor Cyan
Write-Host "================================================================================`n" -ForegroundColor Cyan

$UserPath = "C:\Users\mespindola"
$OutputFile = "C:\Users\mespindola\Documents\SCRIPTS\Directory-Tree-Analysis.txt"

# Function to get directory tree with size info
function Get-DirectoryTree {
    param(
        [string]$Path,
        [int]$Depth = 0,
        [int]$MaxDepth = 4,
        [string]$Prefix = "",
        [System.IO.StreamWriter]$Writer
    )
    
    if ($Depth -gt $MaxDepth) { return }
    
    try {
        # Get directories
        $dirs = Get-ChildItem -Path $Path -Directory -ErrorAction SilentlyContinue | 
                Where-Object { $_.Name -notmatch '^(AppData|\..*|ntuser|NTUSER)' } |
                Sort-Object Name
        
        # Get files
        $files = Get-ChildItem -Path $Path -File -ErrorAction SilentlyContinue | 
                 Where-Object { $_.Name -notmatch '^(ntuser|NTUSER)' } |
                 Sort-Object Name
        
        # Calculate total size
        $totalSize = 0
        $dirs | ForEach-Object { 
            $size = (Get-ChildItem -Path $_.FullName -Recurse -File -ErrorAction SilentlyContinue | 
                    Measure-Object -Property Length -Sum).Sum
            if ($size) { $totalSize += $size }
        }
        $files | ForEach-Object { $totalSize += $_.Length }
        
        $sizeStr = if ($totalSize -gt 1GB) { "{0:N2} GB" -f ($totalSize / 1GB) }
                   elseif ($totalSize -gt 1MB) { "{0:N2} MB" -f ($totalSize / 1MB) }
                   elseif ($totalSize -gt 1KB) { "{0:N2} KB" -f ($totalSize / 1KB) }
                   else { "$totalSize bytes" }
        
        $indent = "  " * $Depth
        $line = "$indent$Prefix$(Split-Path $Path -Leaf)/ [$sizeStr]"
        Write-Host $line -ForegroundColor Yellow
        $Writer.WriteLine($line)
        
        # Process directories
        for ($i = 0; $i -lt $dirs.Count; $i++) {
            $isLast = ($i -eq ($dirs.Count - 1)) -and ($files.Count -eq 0)
            $newPrefix = if ($isLast) { "|__ " } else { "|-- " }
            Get-DirectoryTree -Path $dirs[$i].FullName -Depth ($Depth + 1) -MaxDepth $MaxDepth -Prefix $newPrefix -Writer $Writer
        }
        
        # Process files (only show important ones at each level)
        $importantFiles = $files | Where-Object { 
            $_.Extension -match '\.(md|ps1|txt|xlsx|docx|pdf|json|yaml)$' -or 
            $_.Name -match '(README|LICENSE|\.env|config)'
        }
        
        for ($i = 0; $i -lt $importantFiles.Count; $i++) {
            $file = $importantFiles[$i]
            $isLast = ($i -eq ($importantFiles.Count - 1))
            $filePrefix = if ($isLast) { "|__ " } else { "|-- " }
            
            $fileSize = if ($file.Length -gt 1MB) { "{0:N2} MB" -f ($file.Length / 1MB) }
                       elseif ($file.Length -gt 1KB) { "{0:N2} KB" -f ($file.Length / 1KB) }
                       else { "$($file.Length) bytes" }
            
            $fileLine = "$indent  $filePrefix$($file.Name) [$fileSize]"
            Write-Host $fileLine -ForegroundColor Gray
            $Writer.WriteLine($fileLine)
        }
        
        # Show count of other files if any
        $otherFiles = $files | Where-Object { 
            $_.Extension -notmatch '\.(md|ps1|txt|xlsx|docx|pdf|json|yaml)$' -and 
            $_.Name -notmatch '(README|LICENSE|\.env|config)'
        }
        if ($otherFiles.Count -gt 0) {
            $otherLine = "$indent  |__ ... and $($otherFiles.Count) other files"
            Write-Host $otherLine -ForegroundColor DarkGray
            $Writer.WriteLine($otherLine)
        }
        
    } catch {
        Write-Host "$indent  [Access Denied or Error: $($_.Exception.Message)]" -ForegroundColor Red
        $Writer.WriteLine("$indent  [Access Denied]")
    }
}

# Create output file
$writer = [System.IO.StreamWriter]::new($OutputFile)

try {
    Write-Host "Starting directory analysis..." -ForegroundColor Cyan
    Write-Host "Max depth: 4 levels" -ForegroundColor Cyan
    Write-Host "Output file: $OutputFile`n" -ForegroundColor Cyan
    
    $writer.WriteLine("=" * 80)
    $writer.WriteLine("DIRECTORY TREE ANALYSIS")
    $writer.WriteLine("Generated: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')")
    $writer.WriteLine("Path: $UserPath")
    $writer.WriteLine("=" * 80)
    $writer.WriteLine("")
    
    Get-DirectoryTree -Path $UserPath -MaxDepth 4 -Writer $writer
    
    Write-Host "`n================================================================================" -ForegroundColor Green
    Write-Host "ANALYSIS COMPLETE!" -ForegroundColor Green
    Write-Host "================================================================================`n" -ForegroundColor Green
    
    Write-Host "Results saved to: $OutputFile" -ForegroundColor Yellow
    
    # Now analyze specific areas
    Write-Host "`n================================================================================" -ForegroundColor Cyan
    Write-Host "OBSIDIAN VAULT ANALYSIS" -ForegroundColor Cyan
    Write-Host "================================================================================`n" -ForegroundColor Cyan
    
    $vaultPath = "C:\Users\mespindola\Documents\HR-Audit"
    
    if (Test-Path $vaultPath) {
        Write-Host "Analyzing vault structure..." -ForegroundColor Yellow
        
        $writer.WriteLine("")
        $writer.WriteLine("=" * 80)
        $writer.WriteLine("OBSIDIAN VAULT DETAILED ANALYSIS")
        $writer.WriteLine("=" * 80)
        $writer.WriteLine("")
        
        # Count files by type
        $mdFiles = Get-ChildItem -Path $vaultPath -Filter "*.md" -Recurse -File -ErrorAction SilentlyContinue | Measure-Object
        $scriptFiles = Get-ChildItem -Path $vaultPath -Filter "*.ps1" -Recurse -File -ErrorAction SilentlyContinue | Measure-Object
        $jsonFiles = Get-ChildItem -Path $vaultPath -Filter "*.json" -Recurse -File -ErrorAction SilentlyContinue | Measure-Object
        
        $summary = @"
Vault Statistics:
- Total .md files: $($mdFiles.Count)
- Total .ps1 files: $($scriptFiles.Count)
- Total .json files: $($jsonFiles.Count)

"@
        Write-Host $summary -ForegroundColor Cyan
        $writer.WriteLine($summary)
        
        # Find fragmented areas
        Write-Host "Identifying potential fragmentation..." -ForegroundColor Yellow
        $writer.WriteLine("Potential Fragmentation Issues:")
        $writer.WriteLine("")
        
        $allDirs = Get-ChildItem -Path $vaultPath -Directory -Recurse -ErrorAction SilentlyContinue
        $fragmentedDirs = $allDirs | Where-Object {
            $fileCount = (Get-ChildItem -Path $_.FullName -File -ErrorAction SilentlyContinue | Measure-Object).Count
            $fileCount -gt 0 -and $fileCount -lt 3
        } | Select-Object -First 10
        
        if ($fragmentedDirs) {
            Write-Host "`nDirectories with few files (potential fragmentation):" -ForegroundColor Yellow
            $fragmentedDirs | ForEach-Object {
                $fileCount = (Get-ChildItem -Path $_.FullName -File -ErrorAction SilentlyContinue | Measure-Object).Count
                $relPath = $_.FullName.Replace($vaultPath, "HR-Audit")
                $msg = "  - $relPath ($fileCount files)"
                Write-Host $msg -ForegroundColor Gray
                $writer.WriteLine($msg)
            }
        }
        
        # Check for duplicate folder names
        Write-Host "`nChecking for duplicate/similar folder names..." -ForegroundColor Yellow
        $writer.WriteLine("")
        $writer.WriteLine("Duplicate/Similar Folder Names:")
        
        $folderNames = $allDirs | Group-Object -Property Name | Where-Object { $_.Count -gt 1 }
        if ($folderNames) {
            $folderNames | ForEach-Object {
                $msg = "  - '$($_.Name)' appears $($_.Count) times"
                Write-Host $msg -ForegroundColor Yellow
                $writer.WriteLine($msg)
                $_.Group | ForEach-Object {
                    $relPath = $_.FullName.Replace($vaultPath, "HR-Audit")
                    $submsg = "    * $relPath"
                    Write-Host $submsg -ForegroundColor DarkGray
                    $writer.WriteLine($submsg)
                }
            }
        } else {
            Write-Host "  No duplicate folder names found." -ForegroundColor Green
            $writer.WriteLine("  No duplicate folder names found.")
        }
        
    } else {
        Write-Host "Vault path not found: $vaultPath" -ForegroundColor Red
        $writer.WriteLine("Vault path not found: $vaultPath")
    }
    
    # Analyze Documents folder
    Write-Host "`n================================================================================" -ForegroundColor Cyan
    Write-Host "DOCUMENTS FOLDER ANALYSIS" -ForegroundColor Cyan
    Write-Host "================================================================================`n" -ForegroundColor Cyan
    
    $docsPath = "C:\Users\mespindola\Documents"
    $writer.WriteLine("")
    $writer.WriteLine("=" * 80)
    $writer.WriteLine("DOCUMENTS FOLDER ANALYSIS")
    $writer.WriteLine("=" * 80)
    $writer.WriteLine("")
    
    if (Test-Path $docsPath) {
        # Check for project-related files outside vault
        $projectFiles = Get-ChildItem -Path $docsPath -File -Recurse -ErrorAction SilentlyContinue | 
                       Where-Object { 
                           $_.Name -match '(audit|personnel|employee|compliance|FMLA|ADA|charter|tina)' -and
                           $_.FullName -notmatch 'HR-Audit'
                       } | Select-Object -First 20
        
        if ($projectFiles) {
            Write-Host "Project-related files found OUTSIDE vault:" -ForegroundColor Yellow
            $writer.WriteLine("Project-related files found OUTSIDE vault:")
            $writer.WriteLine("")
            $projectFiles | ForEach-Object {
                $relPath = $_.FullName.Replace("C:\Users\mespindola\", "")
                $msg = "  - $relPath"
                Write-Host $msg -ForegroundColor Yellow
                $writer.WriteLine($msg)
            }
        } else {
            Write-Host "No project files found outside vault." -ForegroundColor Green
            $writer.WriteLine("No project files found outside vault.")
        }
    }
    
} finally {
    $writer.Close()
}

Write-Host "`n================================================================================" -ForegroundColor Green
Write-Host "ANALYSIS SAVED TO: $OutputFile" -ForegroundColor Green
Write-Host "================================================================================`n" -ForegroundColor Green

# Offer to open the file
$response = Read-Host "Would you like to open the analysis file now? (Y/N)"
if ($response -eq 'Y' -or $response -eq 'y') {
    notepad $OutputFile
}