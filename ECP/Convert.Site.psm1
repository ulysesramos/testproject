using module .\Common.psm1
using module .\PinRule.psm1

Class Site : PinRule
{
        # DNS name to be matched for this pin rule
        [String[]] $Domain

        # Allows wildcard matching for left-hand DNS labels
        # ".xyz.com" or "*.xyz.com" would enable matching to domain name "123.abc.xyz.com"
        [bool] $AllSubdomains

        [String] $LocalContentPath
    
    <#
        .SYNOPSIS
            Default constructor
        .DESCRIPTION
            Converts a string into a PinRules element
        .PARAMETER Rule
            The rule to convert
    #>
    AccountPolicyRule ( [system.string] $Rule )
    {
        $this.InvokeClass( $Rule )
    }
}
