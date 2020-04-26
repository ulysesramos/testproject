using module .\Common.psm1

Class PinRule
{
      ###### PinRule Element ######

    # Friendly Name for a parsing error with a particular element
    [string[]] $Name
    # Describes what actions Windows can perform when it encounters a PIN mismatch
    [string] $errorSetting
    [boolean] $Log
    

    ###### Certificate Element ######

    # Describes what actions Windows can perform when it encounters a PIN mismatch
    #[ValidateSet('File','Directory','Base64')]
    [string[]] $CertificateType
    # Separate to $CertificateFileLocation, $CertificateDirectoryLocation, $CertificateBase64Location
    [string[]] $CertificateLocation
    # Describe what action Windows performs when it encounters a PIN mismatch
    [datetime] $EndDate

    
    ###### Site Element ######

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
            This is the base class constructor
    #>
    PinRule ()
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