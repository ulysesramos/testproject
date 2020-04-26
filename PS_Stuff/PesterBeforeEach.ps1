describe 'BeforeAfter Demo' {
    BeforeAll {
        Write-Output "i AM IN THE BFORE BLOCK"
        Add-Content -Path testdrive:\foofile.txt -value 'foo'
        Add-content -Path Testdrive:\nofoofile.txt -value 'not here'
    }
    
    AfterAll {
        Write-Output 'I am in the Afterall block'
    }
    BeforeEach {
        Write-Output ' Before each block'
    }
    AfterEach {
        Write-Output ' in the after each block'
    }
}