Function New-CertificatePinningRule { 
    [Cmdletbinding(DefaultParameterSetName="set1")] 
    
    Param(

    ################ Pin Rules Element ################ 

        # Represent as a DataTime data type in UTC
        # NextUpdate takes precendent if both are duration and NextUpdate are specified
        [Parameter(ParameterSetName="set1", Mandatory=$true)]
        [Parameter(ParameterSetName="set2", Mandatory=$true)]
        [Parameter(ParameterSetName="set3", Mandatory=$false)]
        #[datetime]
        $Duration,
        
        
        [Parameter(ParameterSetName="set1", Mandatory=$false)]
        [Parameter(ParameterSetName="set2", Mandatory=$true)]
        [Parameter(ParameterSetName="set3", Mandatory=$true)]
        #[datetime]
        $NextUpdate,

        # LogEndDate takes precedence over LogDuration
        # If Neither is used Duration or NextUpdate is used
        [Parameter()]
        [datetime]
        $LogEndDate,
    
        # If Neither is used Duration or NextUpdate is used
        [Parameter()]
        [datetime]
        $LogDuration,

        # Friendly Name for Pin Rules
        [Parameter()]
        [string]
        $ListIdentifier,

################ Pin Rule Element ################ 

        # Friendly Name for a parsing error with a particular element
        [Parameter()]
        [string[]]
        $Name,

        # Describe what action Windows performs when it encounters a PIN mismatch
        [Parameter()]
        [ValidateSet('Revoked','InvalidName','None')]
        [string]
        $errorSetting,

        [Parameter()]
        [bool]
        $Log,

################ Certificate Element ################ 

        # Describe what action Windows performs when it encounters a PIN mismatch
        [Parameter(Mandatory=$True)]
        [ValidateSet('File','Directory','Base64')]
        [string[]]
        $CertificateType,

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
        [Parameter(Mandatory=$True)]
        [string[]]
        $CertificateLocation,

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
        [Parameter()]
        [ValidateSet('Revoked','InvalidName','None')]
        [datetime]
        $EndDate,

################ Site Element ################ 

        # DNS name to be matched for this pin rule
        [Parameter(Mandatory=$true)]
        [String[]]
        $Domain,

        # Allows wildcard matching for left-hand DNS labels
        # ".xyz.com" or "*.xyz.com" would enable matching to domain name "123.abc.xyz.com"
        [Parameter()]
        [bool]
        $AllSubdomains,

        [Parameter(Mandatory=$true)]
        [String]
        $LocalContentPath
    )
$XMLWriter = [System.XMl.XmlTextWriter]::new("$localContentPath\hPinning.xml",$null)
$xmlWriter.WriteStartDocument()
$xmlWriter.WriteStartElement('PinRules')

    # What the logic????
switch ("$_" -eq $true) {
    ($null -eq $duration) {$XMLWriter.WriteAttributeString('Duration', "$Duration")}
    ($null -eq $NextUpdate) {$XMLWriter.WriteAttributeString('NextUpdate', "$NextUpdate")}
    ($null -eq $LogEndDate) {$XMLWriter.WriteAttributeString('LogEndDate', "$LogEndDate")}
    ($null -eq $LogDuration) {$XMLWriter.WriteAttributeString('LogDuration',"$LogDuration")}     
    ($null -eq $ListIdentifier) {$XMLWriter.WriteAttributeString('ListIdentifier', "$ListIdentifier")}
    ($null -ne $pinRuleElement) {
        ($pinRuleElement = foreach($ruleElement in $name)
            {
                $xmlWriter.WriteStartElement('PinRule')
                $xmlWriter.WriteAttributeString('Log', "$Log")
                $XmlWriter.WriteAttributeString('Error', "$errorSetting")
                $xmlWriter.WriteAttributeString('Name', "$ruleElement")
        
                    switch ("$_" -eq $true) {
                        ($null -ne $certificateElement) {
                            ($certificateElement = foreach($certElement in $certificateType)
                                {
                                    $xmlWriter.WriteStartElement('Certificate')
                                    # ForEach certelement ; Foreach certificateLocation
                                    $xmlWriter.WriteAttributeString("$certElement", "$certificateLocation")
                                    $xmlWriter.WriteEndElement()

                                        switch ("$_" -eq $true) {
                                            ($null -ne $siteteElement) {
                                                ($siteElement = foreach($site in $domain)
                                                    {
                                                        $xmlWriter.WriteStartElement('Site')
                                                        foreach($listedSite in $site)
                                                        {
                                                                If ($true -eq $AllSubdomains )
                                                                {
                                                                    $xmlWriter.WriteAttributeString('AllSubdomains', 'true')
                                                                }
                                                                Else
                                                                {
                                                                    $xmlWriter.WriteAttributeString('AllSubdomains', 'false')
                                                                }
                                                            $xmlWriter.WriteAttributeString('Domain', "$listedsite")
                                                        }
                                                        $xmlWriter.WriteEndElement()
                                                    }
                                                )
                                            }
                                        }
                                }
                            )
                        } 
                    }
                $xmlWriter.WriteEndElement()
            }
        )
    } 
}

$xmlWriter.WriteEndElement()
$xmlWriter.WriteEndDocument()
$xmlWriter.Flush()
$xmlWriter.Close()
}

New-CertificatePinningRule -Duration 'P28D' -ListIdentifier 'PinRulesExample' -ErrorSetting 'None' -Log $true -Name 'AllCertificateAttributes','test' -CertificateType 'file','Directory' -CertificateLocation 'Single.cer', 'multiple.cer' -Domain 'abc.com' -AllSubdomains $true -LocalContentPath 'C:\test'

Start-Process 'iexplore.exe' -ArgumentList "$localContentPath\hPinning.xml"