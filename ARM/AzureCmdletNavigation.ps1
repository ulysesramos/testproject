# ARM Templates URL
# https://github.com/Azure/azure-resource-manager-schemas

# ARM Quickstart templates
# https://github.com/Azure/azure-quickstart-templates

# Wrorld Class ARM Templates
# https://azure.microsoft.com/en-us/documentation/articles/best-practices-resource-manager-design-templates/

# Outputs a table of ProviderTypes to Resources
Get-AzureRmResourceProvider | `
    Select-Object ProviderNamespace,ResourceTypes | `
    Sort-Object ProviderNamespace

# Outputs a table of Resources to Locations
Get-AzureRmResourceProvider -ProviderNamespace Microsoft.Compute | `
    Select-Object ResourceTypes, Locations | `
    Sort-Object ResourceTypes

# Gets a resource's available api versions
((Get-AzureRMResourceProvider -ProviderNamespace 'Microsoft.Compute').ResourceTypes | Where-Object {$_.ResourceTypeNAme -eq 'virtualMachines'}).ApiVersions

### Gets a Resource's Locations
{

    ((Get-AzureRmResourceProvider `
        -ProviderNamespace "$resourceProviderNamespace").ResourceTypes | `
        Where-Object {$_.ResourceTypeName -eq "$resourceTypeName"}).Locations | `
        Sort-Object
    }

# Azure Resources are referred to by their ResourceID

# Get available Azure Extensions
Add-AzureAccount
Select-AzureSubscription -SubscriptionId '8d2f1433-442b-4d43-a2b1-d3d01ac45a47'
Get-AzureVMAvailableExtension | select-object Publisher,ExtensionName,Version | Sort-Object ExtensionName

# View Built-in Roles
Get-AzureRmRoleDefinition | select-object Name

# View RBAC Role Actions to a particualr role
(Get-AzureRmRoleDefinition -Name 'Virtual Machine Contributor').Actions