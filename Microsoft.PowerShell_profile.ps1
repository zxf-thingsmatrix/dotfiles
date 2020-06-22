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
function Sudo {
    param (
        [string]
        [Parameter(Mandatory)]
        $Program
    )
    Start-Process $Program -Verb RunAs
}

function Cd-Parent {
    Set-Location ..
}


# ===================================================================================
New-Alias -Name .. -Value Cd-Parent
New-Alias -Name grep -Value Select-String