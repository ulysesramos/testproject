Import-Module -name Pester -Force

GCM -Module Pester

# describe blocks are a grouping of it blocks
describe 'MVA Tests' {
    # actual test you're performing
    it 'true should be $true' {
        # code v. expected output
        # should is a function known as an assertion
        # assertion asserts that something should something
        $true | should be $true
    }
}

describe 'MVA Tests' {
    # context blocks serve as logical groups
    context 'Arithmetic' {
        it 'i plus i should be 2'{
            1 + 1 | should be 2
        }

        it '3 minus 2 should 1'{
            3 - 2 | should be 1
        }
    }

    context 'String matching'{
        it 'an I should not be in time - like assertion' {
            'team' | should not belike '*i*'
        }

        it 'an i should not be in team - match assertion' {
            'team' | should not match 'i'
        }
    }

    # a software development approach involving an arrange, act, and assert
    context 'AAA aproach' {
        
        $stringToTest = 'team'
        
        it 'an i should not be in team -like assertion' {
            $stringToTest | should not belike '*i*'
        }

        it 'an i should not be in team - like assertion' {
            $stringToTest | should belike '*i*'
        }

        it 'an i should not be in team - match assertion' {
            $stringToTest | should not match 'i'
        }
    }
}
# TEST Drives
# Export pester tests 
Invoke-Pester -Path "C:\source\repos\testproject2\Pesterex.ps1"