using module .\Common.psm1
using module .\PinRule.psm1

Class Certificate : PinRule
{
        # Describe what action Windows performs when it encounters a PIN mismatch
        #[ValidateSet('File','Directory','Base64')]
        [string[]] $CertificateType

        <#
            # Number of files align with array of $CertificateFileLocation
            [Parameter()]
            [ValidateSet('File')]
            [int]
            $CertificateFile,

            # Number of files align with array of $CertificateDirectoryLocation
            [Parameter()]
            [ValidateSet('Directory')]
            [int]
            $CertificateDirectory,

            # Number of files align with array of $CertificateBase64Location
            [Parameter()]
            [ValidateSet('Base64')]
            [int]
            $CertificateBase64,
        #>

        # Separate to $CertificateFileLocation, $CertificateDirectoryLocation, $CertificateBase64Location
        [string[]] $CertificateLocation

        <#
            # Build Array
            [Parameter(Mandatory=$True)]
            [string[]]
            $CertificateFileLocation,

            # Build Array
            [Parameter(Mandatory=$True)]
            [string[]]
            $CertificateDirectoryLocation,

            # Build Array
            [Parameter(Mandatory=$True)]
            [string[]]
            $CertificateBase64Location,
        #>

        # Describe what action Windows performs when it encounters a PIN mismatch
        [datetime] $EndDate
        
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
