    param (
        [Parameter(Mandatory=$true)]
        [string]$AccountName,
        
        [Parameter(Mandatory=$true)]
        [string]$ProjectSlug,
        
        [Parameter(Mandatory=$true)]
        [string]$ApiKey,
        
        [Parameter(Mandatory=$true)]
        [string]$RepoCommit,
        
        [Parameter(Mandatory=$true)]
        [int]$TimeOutMins
        
    )
    
    $token = $ApiKey
    $headers = @{
      "Authorization" = "Bearer $token"
      "Content-type" = "application/json"
    }
    
    [datetime]$stop = ([datetime]::Now).AddMinutes($TimeOutMins)
    [bool]$dbCreated = $false
    
    while(!$dbCreated -and ([datetime]::Now) -lt $stop) {
    
        $project = Invoke-RestMethod -Uri "https://ci.appveyor.com/api/projects/$AccountName/$ProjectSlug" -Headers $headers -Method GET
        Write-host "Last project commit $project.build.commitId"
        Write-host "Last project status $project.build.status"
        $dbCreated = ($project.build.commitId -eq $RepoCommit) -and ($project.build.status -eq "success")
        if (!$dbCreated) {
            Start-sleep 5
        }
    }
    
    if (!$dbCreated) {
        throw "DB was not created in $TimeOutMins minutes"
    }
