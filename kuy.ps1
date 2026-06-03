function Show-Menu {
    Clear-Host
    Write-Host "==========================================================" -ForegroundColor Red
    Write-Host "    FPS & CPU OPTIMIZER [500FPS++ INPUT LATENCY EDITION]  " -ForegroundColor Red
    Write-Host "    * ปรับ DataQueueSize 16 / เมาส์คีย์บอร์ดดีเลย์ 0 * " -ForegroundColor Yellow
    Write-Host "==========================================================" -ForegroundColor Red
    Write-Host " [1] รันโหมด UNLEASH 500FPS++ + INPUT LATENCY ZERO" -ForegroundColor Green
    Write-Host " [2] รันโหมด RESTORE ALL VALUES (คืนค่าเริ่มต้นโรงงานทั้งหมด)" -ForegroundColor Yellow
    Write-Host " [3] ออกจากโปรแกรม (Exit)" -ForegroundColor White
    Write-Host "==========================================================" -ForegroundColor Red
}

function Optimize-System {
    Clear-Host
    Write-Host "=== เริ่มต้นยิงคำสั่ง 500FPS++ HARDCORE INJECTION ===" -ForegroundColor Red
    echo ""

    # 1. Multimedia Class Scheduler (ล็อกโควตาความแรงให้เกมสูงสุด)
    Write-Host "[HARDCORE 1] Maxing Out Multimedia Games Key..." -ForegroundColor Yellow
    $MMTasks = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games"
    if (-not (Test-Path $MMTasks)) { New-Item -Path $MMTasks -Force }
    Set-ItemProperty -Path $MMTasks -Name "GPU Priority" -Value 8 -Type DWord
    Set-ItemProperty -Path $MMTasks -Name "Priority" -Value 6 -Type DWord
    Set-ItemProperty -Path $MMTasks -Name "Scheduling Category" -Value "High" -Type String
    Set-ItemProperty -Path $MMTasks -Name "SFIO Priority" -Value "High" -Type String

    # 2. System Responsiveness & Network Throttling
    echo ""
    Write-Host "[HARDCORE 2] Unshackling System Responsiveness & Network Limits..." -ForegroundColor Yellow
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" -Name "SystemResponsiveness" -Value 0 -Type DWord
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" -Name "NetworkThrottlingIndex" -Value 4294967295 -Type DWord

    # 3. CPU Quantum (สับเวลาให้ CPU รีดพลังให้หน้าต่างเกมเต็มเม็ดเต็มหน่วย)
    echo ""
    Write-Host "[HARDCORE 3] Forcing Win32PrioritySeparation to 38..." -ForegroundColor Yellow
    Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\PriorityControl" -Name "Win32PrioritySeparation" -Value 38 -Type DWord

    # 4. MOUSE & KEYBOARD LATENCY TWEAKS (ลดดีเลย์เป็น 0 และปรับ Queue Size เป็น 16)
    echo ""
    Write-Host "[HARDCORE 4] Optimizing Mouse & Keyboard DataQueueSize to 16..." -ForegroundColor Cyan
    # ปรับแต่งระดับ Hardware Service (ต้องระบุประเภทเป็น DWord)
    Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\mouclass" -Name "MouseDataQueueSize" -Value 16 -Type DWord
    Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\kbdclass" -Name "KeyboardDataQueueSize" -Value 16 -Type DWord
    
    Write-Host "[HARDCORE 4.1] Dropping Input Delays to 0..." -ForegroundColor Cyan
    # ปรับการตอบสนองคีย์บอร์ดในระดับ User Profile
    Set-ItemProperty -Path "HKCU:\Control Panel\Accessibility\Keyboard Response" -Name "DelayBeforeAcceptance" -Value 0 -Type String
    Set-ItemProperty -Path "HKCU:\Control Panel\Accessibility\Keyboard Response" -Name "Flags" -Value 122 -Type String
    Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name "MenuShowDelay" -Value "0" -Type String

    # 5. Memory Management & Kernel Tweaks (ล็อกข้อมูลลงแรมตรงๆ ขจัดจังหวะหน่วง)
    echo ""
    Write-Host "[HARDCORE 5] Optimizing Kernel Memory Management for Maximum FPS..." -ForegroundColor Yellow
    $MemMgmt = "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management"
    Set-ItemProperty -Path $MemMgmt -Name "DisablePagingExecutive" -Value 1 -Type DWord
    Set-ItemProperty -Path $MemMgmt -Name "LargeSystemCache" -Value 0 -Type DWord

    # 6. ปิดระบบประหยัดพลังงานและการหน่วงเวลาของระบบการ์ดจออนบอร์ด/เครือข่าย
    echo ""
    Write-Host "[HARDCORE 6] Disabling Power Throttling & Latency Hooks..." -ForegroundColor Yellow
    $PowerControl = "HKLM:\SYSTEM\CurrentControlSet\Control\Power"
    if (-not (Test-Path "$PowerControl\PowerThrottling")) { New-Item -Path "$PowerControl\PowerThrottling" -Force }
    Set-ItemProperty -Path "$PowerControl\PowerThrottling" -Name "PowerThrottlingOff" -Value 1 -Type DWord

    # 7. Windows 11 POTATO UI EXTRA (ขยี้หน้าตา Windows ให้กากสนิท ทึบ 100% ไม่ใช้แอนิเมชัน)
    echo ""
    Write-Host "[HARDCORE 7] Shredding Windows 11 Visual UI into Potato Mode..." -ForegroundColor Red
    Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" -Name "VisualFXSetting" -Value 2 -Type DWord
    Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name "UserPreferencesMask" -Value ([byte[]](144,18,2,128,16,0,0,0)) -Type Binary
    Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Name "EnableTransparency" -Value 0 -Type DWord
    Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "TaskbarAnimations" -Value 0 -Type DWord
    Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name "DragFullWindows" -Value 0 -Type String
    Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "ListviewAlphaSelect" -Value 0 -Type DWord
    Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "ListviewShadow" -Value 0 -Type DWord

    # 8. Background Apps, GameDVR & Xbox Component Extinction
    echo ""
    Write-Host "[HARDCORE 8] Terminating Background Apps & GameDVR Services..." -ForegroundColor Yellow
    $BGApps = "HKCU:\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications"
    if (-not (Test-Path $BGApps)) { New-Item -Path $BGApps -Force }
    Set-ItemProperty -Path $BGApps -Name "GlobalUserDisabled" -Value 1 -Type DWord
    Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\GameDVR" -Name "AppCaptureEnabled" -Value 0 -Type DWord
    Set-ItemProperty -Path "HKCU:\System\GameConfigStore" -Name "GameDVR_Enabled" -Value 0 -Type DWord
    if (-not (Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\GameDVR")) { New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\GameDVR" -Force }
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\GameDVR" -Name "AllowGameDVR" -Value 0 -Type DWord

    # 9. Services & Windows Search Terminate
    echo ""
    Write-Host "[HARDCORE 9] Killing High-CPU Windows Services..." -ForegroundColor Yellow
    Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control" -Name "WaitToKillServiceTimeout" -Value "2000" -Type String
    Set-Service -Name "WSearch" -StartupType Disabled
    Stop-Service -Name "WSearch"

    echo ""
    Write-Host "==========================================================" -ForegroundColor Red
    Write-Host " [SUCCESS] สิ้นสุดกระบวนการปรับแต่งระดับ HARDCORE + LOW LATENCY แล้ว!" -ForegroundColor Green
    Write-Host " หากมีตัวหนังสือสีแดงแปลว่าคำสั่งนั้นติดขัดระบบ ซึ่งถือเป็นเรื่องปกติในบางสเปก" -ForegroundColor DarkYellow
    Write-Host " **จำเป็นต้องรีสตาร์ทคอมพิวเตอร์ 1 ครั้ง** เพื่อให้เห็นผลลัพธ์สูงสุด" -ForegroundColor Yellow
    Write-Host "==========================================================" -ForegroundColor Red
    Read-Host "กด Enter เพื่อกลับไปเมนูหลัก..."
}

function Restore-System {
    Clear-Host
    Write-Host "=== เริ่มต้นคืนค่าระบบและหน้าตา Windows ทั้งหมด ===" -ForegroundColor Yellow
    echo ""

    $MMTasks = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games"
    if (Test-Path $MMTasks) {
        Set-ItemProperty -Path $MMTasks -Name "GPU Priority" -Value 8 -Type DWord
        Set-ItemProperty -Path $MMTasks -Name "Priority" -Value 2 -Type DWord
        Set-ItemProperty -Path $MMTasks -Name "Scheduling Category" -Value "Medium" -Type String
        Set-ItemProperty -Path $MMTasks -Name "SFIO Priority" -Value "Normal" -Type String
    }

    Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" -Name "SystemResponsiveness" -Value 20 -Type DWord
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" -Name "NetworkThrottlingIndex" -Value 10 -Type DWord
    Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\PriorityControl" -Name "Win32PrioritySeparation" -Value 2 -Type DWord
    
    # คืนค่าเมาส์และคีย์บอร์ดเดิมโรงงาน (ค่ามาตรฐานคือ 100)
    Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\mouclass" -Name "MouseDataQueueSize" -Value 100 -Type DWord
    Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\kbdclass" -Name "KeyboardDataQueueSize" -Value 100 -Type DWord
    Set-ItemProperty -Path "HKCU:\Control Panel\Accessibility\Keyboard Response" -Name "DelayBeforeAcceptance" -Value 1000 -Type String
    Set-ItemProperty -Path "HKCU:\Control Panel\Accessibility\Keyboard Response" -Name "Flags" -Value 126 -Type String

    $MemMgmt = "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management"
    Set-ItemProperty -Path $MemMgmt -Name "DisablePagingExecutive" -Value 0 -Type DWord
    Set-ItemProperty -Path $MemMgmt -Name "LargeSystemCache" -Value 0 -Type DWord

    $PowerControl = "HKLM:\SYSTEM\CurrentControlSet\Control\Power"
    if (Test-Path "$PowerControl\PowerThrottling") { Set-ItemProperty -Path "$PowerControl\PowerThrottling" -Name "PowerThrottlingOff" -Value 0 -Type DWord }

    Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" -Name "VisualFXSetting" -Value 0 -Type DWord
    Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name "UserPreferencesMask" -Value ([byte[]](158,30,7,128,18,0,0,0)) -Type Binary
    Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Name "EnableTransparency" -Value 1 -Type DWord
    Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "TaskbarAnimations" -Value 1 -Type DWord
    Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name "DragFullWindows" -Value 1 -Type String
    Set-ItemProperty -Path "HKCU:\Control Panel\Desktop\" -Name "MenuShowDelay" -Value "400" -Type String

    $BGApps = "HKCU:\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications"
    if (Test-Path $BGApps) { Set-ItemProperty -Path $BGApps -Name "GlobalUserDisabled" -Value 0 -Type DWord }
    Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\GameDVR" -Name "AppCaptureEnabled" -Value 1 -Type DWord
    Set-ItemProperty -Path "HKCU:\System\GameConfigStore" -Name "GameDVR_Enabled" -Value 1 -Type DWord
    if (Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\GameDVR") { Remove-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\GameDVR" -Name "AllowGameDVR" }

    Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control" -Name "WaitToKillServiceTimeout" -Value "5000" -Type String
    Set-Service -Name "WSearch" -StartupType Automatic
    Start-Service -Name "WSearch"

    echo ""
    Write-Host "==========================================================" -ForegroundColor Cyan
    Write-Host " [SUCCESS] คืนค่าเริ่มต้นของระบบ Windows 11 ทั้งหมดสำเร็จ!" -ForegroundColor Green
    Write-Host " **กรุณารีสตาร์ทคอมพิวเตอร์** เพื่อให้เอฟเฟกต์หน้าตากลับมาทำงานปกติ" -ForegroundColor Yellow
    Write-Host "==========================================================" -ForegroundColor Cyan
    Read-Host "กด Enter เพื่อกลับไปเมนูหลัก..."
}

# ลูปเมนูหลัก
do {
    Show-Menu
    $input = Read-Host "กรุณาเลือกหมายเลข (1-3)"
    switch ($input) {
        '1' { Optimize-System }
        '2' { Restore-System }
        '3' { $running = $false }
        default { Write-Host "ตัวเลือกไม่ถูกต้อง..." -ForegroundColor Red; Start-Sleep -Seconds 1 }
    }
} while ($input -ne '3')
