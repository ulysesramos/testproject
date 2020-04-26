using module .\Common.psm1
using module .\PinRule.psm1

Class PinRules : PinRule
{
        # Represent as a DataTime data type in UTC
        # NextUpdate takes precendent if both are duration and NextUpdate are specified
        [datetime] $Duration
        [datetime] $NextUpdate
        # LogEndDate takes precedence over LogDuration
        # If Neither is used Duration or NextUpdate is used
        [datetime] $LogEndDate
        # If Neither is used Duration or NextUpdate is used
        [datetime] $LogDuration
        # Friendly Name for Pin Rules
        [string] $ListIdentifier

        
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
