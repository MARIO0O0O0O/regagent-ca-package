# --- CONFIG: Base Folder ---
$baseFolder = "C:\Users\mespindola\Documents\SEI_Chargeability_Presentation"

# --- CREATE FOLDER STRUCTURE ---
$folders = @(
    "$baseFolder\01_Presentation",
    "$baseFolder\00_Resources\data"
)
foreach ($f in $folders) {
    if (-not (Test-Path $f)) { New-Item -ItemType Directory -Path $f | Out-Null }
}

# --- CREATE PLACEHOLDER CSV FILES ---

# KPI Scorecard
$kpiCSV = "$baseFolder\00_Resources\data\chargeability_data.csv"
@"
Employee,Chargeability,Utilization
Alice,75,80
Bob,68,70
Charlie,82,85
Dana,77,79
"@ | Set-Content $kpiCSV

# Radar Chart
$radarCSV = "$baseFolder\00_Resources\data\radar_data.csv"
@"
CoreCompetency,Score
Technical,80
ClientRelations,70
ProjectMgmt,75
Innovation,85
Leadership,78
"@ | Set-Content $radarCSV

# Gantt Chart
$ganttCSV = "$baseFolder\00_Resources\data\timeline_data.csv"
@"
Task,Start,Duration
Policy Design,1,2
System Setup,3,4
Manager Training,7,1
Employee Communication,8,1
Go-Live,10,1
Quarterly Audit,11,2
"@ | Set-Content $ganttCSV

# Equity Heatmap
$heatmapCSV = "$baseFolder\00_Resources\data\equity_heatmap.csv"
@"
Demographic,Chargeability
Women,65
Men,75
Disabled,60
Non-Disabled,78
Older,68
Younger,80
"@ | Set-Content $heatmapCSV

# --- OUTPUT PPT PATH ---
$outputPPT = "$baseFolder\SEI_Chargeability_Presentation.pptx"

# --- CREATE POWERPOINT COM OBJECT ---
$powerpoint = New-Object -ComObject PowerPoint.Application
$powerpoint.Visible = -1  # msoTrue
$presentation = $powerpoint.Presentations.Add()

# --- FUNCTION: Add Table from CSV ---
function Add-TableFromCSV {
    param([string]$title, [string]$csvFile)
    if (-not (Test-Path $csvFile)) { Write-Warning "$csvFile not found"; return }

    $data = Import-Csv $csvFile
    $rows = $data.Count + 1
    $cols = $data[0].PSObject.Properties.Count

    $slide = $presentation.Slides.Add($presentation.Slides.Count + 1, 1)
    $slide.Shapes[1].TextFrame.TextRange.Text = $title

    $table = $slide.Shapes.AddTable($rows, $cols, 50, 150, 600, 300).Table

    # Headers
    $i = 1
    foreach ($prop in $data[0].PSObject.Properties.Name) {
        $table.Cell(1,$i).Shape.TextFrame.TextRange.Text = $prop
        $i++
    }

    # Data
    $r = 2
    foreach ($row in $data) {
        $i = 1
        foreach ($prop in $row.PSObject.Properties.Name) {
            $table.Cell($r,$i).Shape.TextFrame.TextRange.Text = $row.$prop
            $i++
        }
        $r++
    }
}

# --- FUNCTION: Add Radar Chart ---
function Add-RadarChart {
    param([string]$title, [string]$csvFile)
    if (-not (Test-Path $csvFile)) { Write-Warning "$csvFile not found"; return }

    $data = Import-Csv $csvFile

    $slide = $presentation.Slides.Add($presentation.Slides.Count + 1, 1)
    $slide.Shapes[1].TextFrame.TextRange.Text = $title

    $chartShape = $slide.Shapes.AddChart(82, 50, 150, 600, 400) # Radar chart
    $chart = $chartShape.Chart

    while ($chart.SeriesCollection().Count -gt 0) { $chart.SeriesCollection(1).Delete() }

    $seriesName = $data[0].PSObject.Properties.Name[1]
    $categories = $data | ForEach-Object { $_.$($data[0].PSObject.Properties.Name[0]) }
    $values = $data | ForEach-Object { [double]$_.$($data[0].PSObject.Properties.Name[1]) }

    $chart.SeriesCollection().NewSeries() | Out-Null
    $chart.SeriesCollection(1).Name = $seriesName
    $chart.SeriesCollection(1).Values = $values
    $chart.SeriesCollection(1).XValues = $categories
}

# --- FUNCTION: Add Gantt Chart ---
function Add-GanttChart {
    param([string]$title, [string]$csvFile)
    if (-not (Test-Path $csvFile)) { Write-Warning "$csvFile not found"; return }

    $data = Import-Csv $csvFile

    $slide = $presentation.Slides.Add($presentation.Slides.Count + 1, 1)
    $slide.Shapes[1].TextFrame.TextRange.Text = $title

    $chartShape = $slide.Shapes.AddChart(5, 50, 150, 600, 400) # Stacked Bar
    $chart = $chartShape.Chart
    while ($chart.SeriesCollection().Count -gt 0) { $chart.SeriesCollection(1).Delete() }

    foreach ($row in $data) {
        $series = $chart.SeriesCollection().NewSeries()
        $series.Name = $row.Task
        $series.Values = $row.Duration
        $series.XValues = $row.Start
    }
}

# --- FUNCTION: Add Equity Heatmap Table ---
function Add-EquityHeatmap {
    param([string]$title, [string]$csvFile)
    if (-not (Test-Path $csvFile)) { Write-Warning "$csvFile not found"; return }

    $data = Import-Csv $csvFile
    $rows = $data.Count + 1
    $cols = $data[0].PSObject.Properties.Count

    $slide = $presentation.Slides.Add($presentation.Slides.Count + 1, 1)
    $slide.Shapes[1].TextFrame.TextRange.Text = $title

    $table = $slide.Shapes.AddTable($rows, $cols, 50, 150, 600, 300).Table

    # Headers
    $i = 1
    foreach ($prop in $data[0].PSObject.Properties.Name) {
        $table.Cell(1,$i).Shape.TextFrame.TextRange.Text = $prop
        $i++
    }

    # Data + color scale
    $r = 2
    foreach ($row in $data) {
        $i = 1
        foreach ($prop in $row.PSObject.Properties.Name) {
            $value = $row.$prop
            $table.Cell($r,$i).Shape.TextFrame.TextRange.Text = $value
            if ($i -eq 2) { # Color scale based on value
                if ([double]$value -ge 75) { $table.Cell($r,$i).Shape.Fill.ForeColor.RGB = 0x00FF00 } # green
                elseif ([double]$value -ge 65) { $table.Cell($r,$i).Shape.Fill.ForeColor.RGB = 0xFFFF00 } # yellow
                else { $table.Cell($r,$i).Shape.Fill.ForeColor.RGB = 0xFF0000 } # red
            }
            $i++
        }
        $r++
    }
}

# --- GENERATE SLIDES ---
Add-TableFromCSV -title "KPI Scorecard" -csvFile $kpiCSV
Add-RadarChart -title "Performance Radar" -csvFile $radarCSV
Add-GanttChart -title "Implementation Timeline" -csvFile $ganttCSV
Add-EquityHeatmap -title "Equity Audit Heatmap" -csvFile $heatmapCSV

# --- SAVE PPT ---
$presentation.SaveAs($outputPPT)
$presentation.Close()
$powerpoint.Quit()
Write-Host "Presentation created at $outputPPT"
