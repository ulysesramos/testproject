class human 
{
    [Guid]
    #  Forces the generation of a GUID when the class is instanciated
    hidden $ID = (New-Guid).Guid

    [ValidatePattern('^[a-z]')]
    [ValidateLength(3,15)]
    [string]
    $name

    [ValidateRange(0,100)]
    [INT]
    $height

    [ValidateRange(0,1000)]
    [int]
    $weight

    [void]Jump()
    {
        Write-Output -Message "You won't see this message"
        Return
    }

    [string]SayHello()
    {
        
        Return "Hello, nice to meet you"
    }

    [string]SayHello([string]$Name)
    {
            
        Return "Hey $Name. Its nice to meet you"
    }

}

# Instantiates a class
$ulyses = [Human]::new()

$Dude = [Human]::new()
$Dude.ID = (New-Guid).Guid
$Dude.ID

$ulyses | GM -force 
$ulyses.ID 

#[human] | FL *
[human] | gm -Force

# View Overloads via $mem.SayHello
$mem = [human]::new()
$mem.SayHello("ulyses")

<#
[ValidateNotNull()]
[ValidateNotNullOrEmpty()]
[ValidateCount()]
[ValidateSet()]
[AllowNull()]
[AllowEmptyCollection()]
[AllowEmptyString()]
[ValidateRange()]
[ValidatePattern()]
[ValidateLength()] 
#>