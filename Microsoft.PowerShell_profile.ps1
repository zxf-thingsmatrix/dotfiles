# 添加环境变量函数
function Set-Env{
    param(
        [System.EnvironmentVariableTarget]
        [Parameter(Mandatory)]
        $Target,

        [string]
        [Parameter(Mandatory)]
        $Name,

        [string]
        [AllowEmptyString()]
        [Parameter(Mandatory)]
        $Value
    )

    $NewValue = [Environment]::GetEnvironmentVariable($Name, $Target)
    If($NewValue){
        $NewValue = "$NewValue;$Value"
    }Else{
        $NewValue = $Value
    }
    Write-Host("${Target}: $Name -> $NewValue")
    
    [Environment]::SetEnvironmentVariable($Name, $NewValue, $Target)
}
# 提权函数
function Sudo() { 
    if ($Args.Length -eq 1) { 
        Start-Process -FilePath $Args[0] -NoNewWindow -PassThru -Wait
    }
    ElseIf ($Args.Length -gt 1) { 
        $process = Start-Process -FilePath $Args[0] -Args $Args[1..$args.Length] -NoNewWindow -PassThru -Wait
        $process.ExitCode
    }
    Else {
        Write-Host 'Can not find arguments.'
    }
}
function Sudow() { 
    if ($Args.Length -eq 1) { 
        Start-Process $Args[0] -Verb RunAs
    } ElseIf ($Args.Length -gt 1) { 
        Start-Process $Args[0] -Args $Args[1..$args.Length] -Verb RunAs
    }Else{
        Write-Host 'Can not find arguments.'
    }
}
function Cd-Parent {
    Set-Location ..
}


# alias
New-Alias -Name .. -Value Cd-Parent
New-Alias -Name grep -Value Select-String

Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete
Set-PSReadLineOption -PredictionSource History
Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward

# 启用 PSFzf 
Import-Module PSFzf
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t' -PSReadlineChordReverseHistory 'Ctrl+r'
#Set-PSReadLineKeyHandler -Key Tab -ScriptBlock { Invoke-FzfTabCompletion }

# 启用 zoxide
Invoke-Expression (& {
  	$hook = if ($PSVersionTable.PSVersion.Major -lt 6) { 'prompt' } else { 'pwd' }
	(zoxide init --hook $hook powershell) -join "`n"
})
