$ACRNAME="CRFreekDev"
$RepoName="hello-world"
$JSON=(az acr repository list --name $ACRNAME --output json|ConvertFrom-json)
#$JSON=(Get-Content "C:\temp\output.txt"|ConvertFrom-Json)
$Regex="^([0-9]+)\.([0-9]+)\.([0-9]+)$"
[datetime]$Image_date = $inputs.timestamp
az account set --subscription "DEV-infoplus"
ForEach ($Manifest in $JSON)
{ 
   $inputs =(az acr repository show-manifests --name "$ACRNAME" --repository $RepoName --output json | ConvertFrom-Json)
   $Retention_period =(Get-Date).adddays(-30)
   [datetime]$Image_date = $inputs.timestamp  #<-- hier gaat het fout. kanniet converten to datetime
   $Difference_Date = ($Retention_period) - ($Image_date)
   $Invalidtags =($inputs.tags -notmatch $Regex) 

      if (($Invalidtags.Count -eq 0) -and ($difference_date.Days -gt 30))
      {
        Write-Host "command here"$manifest.digest.Substring(7)
        #.substring 7 haalt de eertse 7 characters weg in dit geval "sha256:"
         
         
      } 
     #else not realy needed
} 

#loop hier vast op datetime. wil niet converten.
#komt nu  omdat de info vanuit een commando word gehaald ipv get-content.
#output van commando is gelijk aan output van file 
#zie regel 12

