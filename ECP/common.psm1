# Describes what actions can be associated with ErrorSetting or EndDate properties within ECP
enum settings {
    Revoked
    InvalidName
    None
    }

<#
    .SYNOPSIS
        This enum describes a PinRuleType

    .DESCRIPTION
        The RuleType enum describes a PinRuleType, the value of a specific type of Pin rule.

    .EXAMPLE
        PinRuleType = [PinRuleType]::Certificate

    .NOTES
        This enum requires PowerShell v5 or above.
#>
Enum RuleType
{
    PinRules
    Certificate
    Site
}

#endregion
#region Footer
Foreach ($supportFile in (Get-ChildItem -Path $PSScriptRoot -Exclude $MyInvocation.MyCommand.Name))
{
    Write-Verbose "Loading $($supportFile.FullName)"
    . $supportFile.FullName
}
#endregion
Export-ModuleMember -Function '*' -Variable '*'
