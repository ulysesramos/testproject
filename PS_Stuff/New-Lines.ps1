
PrintStars($numberOfLines) { }
Function  New-Lines
{

  $number = Read-Host “How many lines of star to print (Enter 0 to exit)”
 # $i = $n -as [int]    Ensure int
     If ($number -ge 1) {
        Return "good"
        # while ($true) { }
        #I believe I need to use a foreach in here
       something something 1..$number | % {if($_ % 2 -eq 0 ) {"$_ is even"} } -ForegroundColor Green
      something something 1..$number | % {if($_ % 2 -eq 1 ) {"$_ is odd"} } -ForegroundColor Yellow

     }


     Elseif ($number -eq 0) {
        Return "exiting"
     }

 
     Elseif ([string] -or ($Number -lt 0)) 
     {
        Return "Please enter a positive number or zero to exit"
     }


   #  Else {
    #     Write-Output "Please enter a positive number or zero to exit" -ErrorAction SilentlyContinue
     #}
    
}



New-Lines