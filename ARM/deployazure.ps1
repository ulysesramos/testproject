function New-AzureRMDeployment 
{
    [CmdletBinding()]
    Param(
        [parameter(Mandatory = $true)]
        [String]
        $Location,

        [Parameter(Mandatory = $true)]
        [String]
        $ResourceGroupName,

        [Parameter(Mandatory = $true)]
        [System.String]
        $resourceDeploymentName,

        [Parameter(Mandatory = $true)]
        [System.String]
        $TemplateFile 
    )

    try{
        $ResourceGroup = Get-AzureRmResourceGroup -Name $ResourceGroupName -Location $Location -ErrorAction SilentlyContinue
        If ([System.String]::IsNullOrEmpty($ResourceGroup.ResourceId))
        {
            #Add write-verbose "$($ResourceGroupName) does not exist. Creating $($ResourceGroupName)."
            #Add write-verbose "Deploying $($ResourceGroupName) to Azure Tenant $($tenantName)"
            New-AzureRmResourceGroup `
            -Name $ResourceGroupName `
            -Location $Location `
            -ErrorAction SilentlyContinue

            New-AzureRmResourceGroupDeployment `
            -Name $resourceDeploymentName `
            -ResourceGroupName $resourceGroupName `
            -TemplateFile $TemplateFile `
            -Verbose -Force
        }
        else 
        {
            #Add write-verbose "$($ResourceGroupName) already exists"
            #Add write-verbose "Deploying $($ResourceGroupName) to Azure Tenant $($tenantName)"
            New-AzureRmResourceGroupDeployment `
            -Name $resourceDeploymentName `
            -ResourceGroupName $resourceGroupName `
            -TemplateFile $TemplateFile `
            -Verbose -Force
        }
    }
    catch {
        throw 'You currently not logged into Azure. Please login: Login-AzureRMAccount and try again.'
    }
}

New-AzureRMDeployment -Location 'eastus2' -ResourceGroupName 'pluralsight-arm-simple-iaas-test' -ResourceDeploymentNAme 'pluralsight-arm-paas-test-deployment' -TemplateFile 'C:\source\repos\testproject2\ARM\Completed\contosoIaaS.json' -Verbose
