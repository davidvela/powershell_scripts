Add-Type -AssemblyName System.Windows.Forms 

$position = [System.Windows.Forms.Cursor]::Position  
$position.X++  
[System.Windows.Forms.Cursor]::Position = $position 

    while(1) {  
    $position = [System.Windows.Forms.Cursor]::Position  
    $position.X++  
    [System.Windows.Forms.Cursor]::Position = $position  

    $time = Get-Date;  
    $shorterTimeString = $time.ToString("HH:mm:ss");  

    Write-Host $shorterTimeString "Mouse pointer has been moved 1 pixel to the right"  
    #Set your duration between each mouse move
    Start-Sleep -Seconds 5  
    }  

