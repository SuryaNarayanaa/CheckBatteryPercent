# CheckBattery.ps1
# This script checks the current battery percentage and shows a Windows pop-up if it's over 80%.

# Retrieve battery info using WMI
$battery = Get-WmiObject -Class Win32_Battery
$batteryLevel = $battery.EstimatedChargeRemaining

# For debugging/logging purposes
Write-Host "Battery level is: $batteryLevel%"

# If battery is over 80%, notify user
if ($batteryLevel -gt 80) {
    Add-Type -AssemblyName PresentationFramework
    [System.Windows.MessageBox]::Show(
        "Your battery is at $batteryLevel%. Please unplug the charger.",
        "Battery Reminder",
        0,
        "Warning"
    )
}
