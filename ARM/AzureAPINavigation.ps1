https://management.azure.com/subscriptions/{subscription-id}/providers/{provider-name}?&api-version={api-version}

((Get-AzureRMResourceProvider -ProviderNamespace 'Microsoft.Compute').ResourceTypes | Where-Object {$_.ResourceTypeNAme -eq 'virtualMachines'}).ApiVersions