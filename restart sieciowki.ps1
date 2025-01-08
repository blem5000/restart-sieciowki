#Get-PnpDevice | where {$_.Status -notLike "Error" -and $_.FriendlyName -like "*AX211*"}

Start-Sleep 3
$wifi = Get-PnpDevice | where {$_.FriendlyName -like "*AX211*"}
if($wifi.Status -notlike "OK"){
    Disable-PnpDevice $wifi.InstanceId -Confirm:$false
    Start-Sleep 3
    Enable-PnpDevice $wifi.InstanceId -Confirm:$false
    }
else{
    Write-Host "Nie ma co restartować, status" $wifi.FriendlyName "jest" $wifi.Status
    }