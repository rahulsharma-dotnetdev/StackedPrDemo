param(
    [Parameter(Mandatory = $true)]
    [string]$CommitSha
)


$ErrorActionPreference = 'Stop'

# Add your custom post-commit action below. This starter handler only reads
# Git metadata and prints it; it does not amend, push, or modify the repository.
$subject = git show -s --format=%s $CommitSha

Write-Host ''
Write-Host 'StackPR commit handler triggered'
Write-Host "Commit:  $CommitSha"
Write-Host "Subject: $subject"

# Example custom action:
# & dotnet test .\YourSolution.sln
