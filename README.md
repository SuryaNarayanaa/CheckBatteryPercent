# Battery Check Script

A simple PowerShell script to **monitor your laptop battery** and **pop up a reminder** if it goes above 80%. This helps prolong battery health by letting you unplug the charger before it fully reaches 100%.

**Useful for Laptops with no built-in battery protection or those that lack manufacturer battery limit settings like HP OMEN**

---

## Prerequisites
- **Windows 11** (or Windows 10).
- **PowerShell** (preinstalled on Windows).
- **Task Scheduler** (preinstalled).

---

## Script

Create a file called `CheckBattery.ps1` and paste:

```powershell
# CheckBattery.ps1
$battery = Get-WmiObject -Class Win32_Battery
$batteryLevel = $battery.EstimatedChargeRemaining

Write-Host "Battery level is: $batteryLevel%"

if ($batteryLevel -gt 80) {
    Add-Type -AssemblyName PresentationFramework
    [System.Windows.MessageBox]::Show(
        "Battery is at $batteryLevel%. Please unplug the charger.",
        "Battery Reminder"
    )
}
```
## How to Use

## Setup Instructions
### 1. Initial Setup
1. Save the script
   - Create `CheckBattery.ps1` file
   - Recommended location: `C:\Scripts\CheckBattery.ps1`
2. Test the script
   - Right-click the file
   - Select "Run with PowerShell"
   - Verify that it shows battery percentage

### 2. Automated Monitoring
1. Launch Task Scheduler
   - Press `Win + R`
   - Enter `taskschd.msc`
   - Click OK

2. Create New Task
   - Click "Create Task" in right panel
   - Name: "Battery Check"
   - Choose security options as needed

3. Configure Trigger
   - Tab: "Triggers"
   - New Trigger: "On a schedule"
   - Settings:
     - Repeat every: 10 minutes
     - Duration: 1 day

4. Set Action
   - Tab: "Actions"
   - New Action: "Start a program"
   - Details:
     - Program/script: `powershell.exe`
     - Arguments: `-ExecutionPolicy Bypass -File "C:\Scripts\CheckBattery.ps1"`

5. Finalize
   - Save the task
   - Test run it once

### Important Notes

#### Limitations
- This is a notification-only solution
- Cannot physically control charging

#### Additional Options
- For hardware-level battery limits:
  - Check HP BIOS settings
  - Use HP Omen Command Center

### Notes
- This script cannot physically stop charging. For true 80% caps, check your HP BIOS or HP Omen Command Center.
- Adjust the 80% threshold or the check interval as needed.
