# Connect-PnPOnline –Url 'https://company.sharepoint.com/sites/<my_site>/' -AppId '123' -AppSecret 'C123'
Connect-PnPOnline -Url https://company.sharepoint.com/sites/<my_site> -ClientId 123 -ClientSecret "C123"

Get-PnPSite 'https://schindlerglobal.sharepoint.com/sites/<my_site>/myfolder/'
Write-Host $a.__Name
Write-Host 'test'


$outputPath = "C:\temp\specificFiles.csv"
$DocLibs = Get-PnPList | Where-Object {$_.BaseTemplate -eq 101} 
$results = @()
foreach ($DocLib in $DocLibs) {
    $AllItems = Get-PnPListItem -List $DocLib -Fields "FileRef", "File_x0020_Type", "FileLeafRef"
    foreach ($Item in $AllItems) {
        if (($Item["FileLeafRef"] -like "*ABC*") -or ($Item["FileLeafRef"] -like "*BCD*")) {
            Write-Host "File found. Path:" $Item["FileRef"] -ForegroundColor Green
                $results += New-Object PSObject -Property @{
                Path          = $Item["FileRef"]
                FileName      = $Item["FileLeafRef"]
                FileExtension = $Item["File_x0020_Type"]
            }
        }
    }
}
$results | Export-Csv -Path $outputPath -NoTypeInformation