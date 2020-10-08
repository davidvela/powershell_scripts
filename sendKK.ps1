param($minutes = 6000)

$myshell = New-Object -com "Wscript.Shell"

for ($i = 0; $i -lt $minutes; $i++) {
  Start-Sleep -Seconds 4.
  $myshell.sendkeys(".")
}