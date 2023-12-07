# register if not existing

$PsCmdFile="path-to-task.ps1"
$TaskName="Task-On-Usb-Conn"

if (Get-ScheduledTask -TaskName $TaskName -ErrorAction SilentlyContinue ) {
    Write-Output "task already exists"
    return
}

$Action = New-ScheduledTaskAction -Execute 'Powershell.exe' -Argument "-ExecutionPolicy RemoteSigned -WindowStyle hidden -File $PsCmdFile"

$CIMTriggerClass = Get-CimClass -ClassName MSFT_TaskEventTrigger -Namespace Root/Microsoft/Windows/TaskScheduler:MSFT_TaskEventTrigger
$Trigger = New-CimInstance -CimClass $CIMTriggerClass -ClientOnly
# you can get query xml strings within the Event Viewer
# usb connection/disconnection events, EventId:  2003: plug in, 2102: plug out
$Trigger.Subscription = 
@"
<QueryList>
  <Query Id="0" Path="Microsoft-Windows-DriverFrameworks-UserMode/Operational">
    <Select Path="Microsoft-Windows-DriverFrameworks-UserMode/Operational">*[System[(Level=4 or Level=0) and (EventID=2003)]]</Select>
  </Query>
</QueryList>
"@
$Trigger.Enabled = $True 

Register-ScheduledTask -Action $Action -Trigger $Trigger -TaskName $TaskName
