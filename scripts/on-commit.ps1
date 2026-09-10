param(
    [Parameter(Mandatory = $true)]
    [string]$CommitSha
)


$ErrorActionPreference = 'Stop'

# Add your custom post-commit action below. This starter handler only reads
# Git metadata and prints it; it does not amend, push, or modify the repository.
$subject = git show -s --format=%s $CommitSha
$logPath = git rev-parse --git-path stackpr-post-commit.log
$timestamp = Get-Date -Format 'yyyy-MM-dd HH:mm:ss'

Add-Content -LiteralPath $logPath -Value "$timestamp | StackPR commit handler triggered | $CommitSha | $subject"

Write-Host ''
Write-Host 'StackPR commit handler triggered'
Write-Host "Commit:  $CommitSha"
Write-Host "Subject: $subject"
Write-Host "Log:     $logPath"

# Example custom action:
# & dotnet test .\YourSolution.sln
