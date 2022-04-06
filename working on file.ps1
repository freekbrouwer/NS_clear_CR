$ACRNAME="CRFreekDev"
$RepoName="hello-world"
$JSON=(az acr repository list --name $ACRNAME --output json|ConvertFrom-json)
#(Get-Content "C:\temp\output.txt"|ConvertFrom-Json)
$Regex="^([0-9])\.([0-9])\.([0-9]+)$"
ForEach ($Manifest in $JSON)
{
   $Retention_period =(Get-Date).adddays(-30)
   [datetime]$Image_date = $Manifest.timestamp #hier gaat het dus fout
   $Difference_Date = ($Retention_period) - ($Image_date)
   $Invalidtags =($Manifest.tags -notmatch $Regex)
   
      if (($Invalidtags.Count -eq 0) -and ($difference_date.Days -gt 30))
     

{         Write-Host "command here"$manifest.digest.Substring(7)         #.substring 7 haalt de eertse 7 characters weg in dit geval "sha256:"                           }
     #else not realy needed
}
}
