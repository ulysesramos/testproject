. "C:\source\repos\testproject2\dostuff.ps1"

describe 'Get-Thing' {
    $result = Get-Thing
    
    it 'should return "I got the thing"' {
        $result | should be 'I got the thing'
    }
}
