class TimeUtilities
{
    static [string]$Time = "The Time is $((Get-Date).ToShortTimeString())"
}

[TimeUtilities]::Time