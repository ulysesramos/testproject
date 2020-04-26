function Test-Function
{
    Write-Output "This is just a test"
}

function Write-TestDrive
{
    Param
    (
        [Parameter(Mandatory = $true)]
        [string]
        $Message,

        [Parameter(Mandatory = $true)]
        [string]
        $Path
    )

    if (test-path -Path "$Path\Test.txt")
    {
        Throw "Cannot place file here."
    }
    else 
    {
        Out-File -FilePath "$path\Test.txt" -InputObject $Message

        $return = Get-Content -Path "$path\Test.txt"

        return $return
    }
}


describe "This is to run function tests"{
    Context "Test-function tests" {
        it "Should write 'This is just a test'" {
            $result = Test-Function

            $result | Should Be "This is just a test"
        }

        it "Should output a string" {
            $result = Test-Function

            $result | should beoftype "String"
        }

        it "Should not throw" {
           { Test-Function } | Should not throw
        }
    }

    Context "Write-TestDrive Tests" {
        $messages = @(
            "This is just a test",
            "This is another test"
        )

        foreach ($message in $Messages)
        {
            It "Should return $message" {
                Mock -CommandName Test-Path -MockWith {$false}
                $result = Write-TestDrive -Message $message -Path $testDrive

                $result | Should be $message
            }

            It "Should throw"{
                Mock -CommandName Test-Path -MockWith {$true}

                {Write-TestDrive -Message $message -Path $testDrive} | Should Throw
            }
        }
    }
}