[DSCLocalConfigurationManager()]
# Configuration is only a keyword - like function
                # An arbitrary name the script creator assigned
Configuration SetLCMPush
{
    Node $computername
    {
        # Changed to setting - LCM's are now noted at the top
        Settings
        {
            AllowModuleOverwrite = True
            ConfigurationMode = 'ApplyAndMonitor'
            RefreshMode = 'Push'
        }
        
    }
}

$computername = 'DSCS04'

