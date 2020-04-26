Test-Path TestDrive:\

describe 'testDrive Demo' {
   
    BeforeAll{
        Add-Content -Path TestDrive:\testfile.txt -value 'testfile'
    }

    AfterAll {
        Write-Output (Get-Content -path TestDrive:\testfile.txt)
    }
    it 'testDrive exists' {
        'TestDrive' | should exist
    }

    it 'the file exists'{
        'TestDrive:\testfile.txt' | should exist
    }
}