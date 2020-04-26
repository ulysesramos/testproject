Function Compare-Registry
{
    [Cmdletbinding()]
    Param
    (
        [Parameter(Mandatory = $True)]
        [string]
        $MyRegPath,
       
        [Parameter(Mandatory = $True)]
        [string]
        $StdRegPath, ##, Std = Standard

        [Parameter(Mandatory = $True)]
        [string]
        $RegResultsPath, ##, Std = Standard

        #[Parameter(Mandatory = $True)]
        #[string]
        #$EmailTo,

        [Parameter(Mandatory = $True)]
        [string]
        $SMTPServer #,

        #[Parameter(Mandatory = $True)]
        #[string]
        #$EmailFrom

        #[Parameter(Mandatory = $false)]
        #[credential]
        #$Credential

    )
 
    Get-ChildItem HKCU:\SOFTWARE\$app -recurse | Export-CliXML "$MyRegPath\MyReg.reg"
      
    
   # $MyRegistryArray = @(). The thought behind this is if I were to compare reg keys I would first need to create an empty array to store the my registry's exported keys
   # $StdRegistryArray = @(). To store the standard registry keys. 
   
   #$MyRegKeys = Extract registry keys from AKA "MyRegPath.reg"???
   #$StdRegKeys = Extract registry keys from $stdRegPath???

    #ForEarch (MyRegKey in MyRegKeys). Not sure how to do this bit.
     #{
        #$MyRegAnswer =
     #}    
     # $MyRegAnswerArray += $MyRegAnswer    
   
    #ForEarch (StdRegKey in StdRegKeys). Not sure how to do this bit.
     #{
        #$StdRegAnswer = 
     #}    
     # $StdRegAnswerArray += $StdRegAnswer

    ("$MyRegPath\MyReg.reg").CompareTo("$StdRegPath\Std.reg") | Export-Clixml -Path "$RegResultsPath\test.txt" # I know this wouldn't work if an Array was being used.

     # $RegResultsPath = ($MyRegistryArray).CompareTo($StdRegKeys) | Export-Clixml -Path "C:\test.txt"
    
        If (test-path -Path "$StdRegPath\Std.reg")
        {
            Return Send-MailMessage -To $EmailTo -Subject "Enjoy the comparison" -SmtpServer $SMTPServer -Attachments $RegResults -Subject test -from $EmailFrom -Credential $Credential -UseSsl
            
        }
        Else
        {
            Return Send-MailMessage -To $EmailTo -Subject "Dude where's my Reg?" -SmtpServer $SMTPServer -Attachments $RegResults -Subject test -from $EmailFrom -Credential $Credential -UseSsl
        }
    
}

$Params = @{
    MyRegPath = "C:\"

    StdRegPath = "C:\"

    RegResultsPath = "C:\"
    
    #EmailTo = "ulramos@microsoft.com"

    SMTPServer = "smtp-mail.outlook.com"
    
    #EmailFrom = "ulramos@microsoft.com"

    #Credential = "ulramos@microsoft.com"
}

Compare-Registry @Params 
