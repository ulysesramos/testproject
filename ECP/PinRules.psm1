Class PinRules
{
    # Duration or NextUpdate must be PRESENT (MANDATORY)
    
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
            This is the base class constructor
    #>
    PinRules.psm1 ()
    {
    }

    #region Methods

    <#
        .SYNOPSIS
            The class initializer
        .DESCRIPTION
            Extracts all of the settings from the Rule that are needed to
            instantiate the base class
        .PARAMETER StigRule
            The Rule to convert
    #>
    hidden [void] InvokeClass ( [System.string] $Rule )
    {
        $this.Name = $Rule.Name
    }
}