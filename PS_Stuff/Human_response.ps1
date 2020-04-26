class Human2
{
    [string]
    $Name

    [string]SayName()
    {
        Return "Hi My name is $($this.Name)"
    }
}

$uly = [Human2]::new()

$uly
