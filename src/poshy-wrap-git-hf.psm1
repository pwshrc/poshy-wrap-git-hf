#!/usr/bin/env pwsh
$ErrorActionPreference = "Stop"
Set-StrictMode -Version Latest


if (-not (Test-Command git-hf) -and (-not (Get-Variable -Name PWSHRC_FORCE_MODULES_EXPORT_UNSUPPORTED -Scope Global -ValueOnly -ErrorAction SilentlyContinue))) {
    return
}

[string] $git_bin = $null
if (Test-Command hub) {
    $git_bin = "hub"
} elseif (Test-Command git) {
    $git_bin = "git"
}

function Invoke-GitHubflow {
    & $git_bin hf @args
}
Set-Alias -Name ghf -Value Invoke-GitHubflow
Export-ModuleMember -Function Invoke-GitHubflow -Alias ghf

function Invoke-GitHubflowFeature {
    & $git_bin hf feature @args
}
Set-Alias -Name ghff -Value Invoke-GitHubflowFeature
Export-ModuleMember -Function Invoke-GitHubflowFeature -Alias ghff

function Invoke-GitHubflowRelease {
    & $git_bin hf release @args
}
Set-Alias -Name ghfr -Value Invoke-GitHubflowRelease
Export-ModuleMember -Function Invoke-GitHubflowRelease -Alias ghfr

function Invoke-GitHubflowHotfix {
    & $git_bin hf hotfix @args
}
Set-Alias -Name ghfh -Value Invoke-GitHubflowHotfix
Export-ModuleMember -Function Invoke-GitHubflowHotfix -Alias ghfh

function Invoke-GitHubflowSupport {
    & $git_bin hf support @args
}
Set-Alias -Name ghfs -Value Invoke-GitHubflowSupport
Export-ModuleMember -Function Invoke-GitHubflowSupport -Alias ghfs

function Invoke-GitHubflowUpdate {
    & $git_bin hf update @args
}
Set-Alias -Name ghfu -Value Invoke-GitHubflowUpdate
Export-ModuleMember -Function Invoke-GitHubflowUpdate -Alias ghfu
