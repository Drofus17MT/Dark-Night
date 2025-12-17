$SOURCE_BP = "C:\GitHub\Dark-Night\Dias\BP Dia 20"
$TARGET_BP = "C:\Users\david\AppData\Roaming\Minecraft Bedrock\Users\Shared\games\com.mojang\development_behavior_packs\Dark Night BP"

$SOURCE_RP = "C:\GitHub\Dark-Night\RP"
$TARGET_RP = "C:\Users\david\AppData\Roaming\Minecraft Bedrock\Users\Shared\games\com.mojang\development_resource_packs\Dark Night RP"

Write-Host "=== Auto-Sync Activo ===" -ForegroundColor Green
Write-Host "Monitoreando: BP y RP" -ForegroundColor Cyan
Write-Host "Presiona Ctrl+C para detener`n" -ForegroundColor Yellow

# Sincronización inicial
Write-Host "[$(Get-Date -Format 'HH:mm:ss')] Sincronización inicial..." -ForegroundColor Magenta
robocopy $SOURCE_BP $TARGET_BP /MIR /R:1 /W:1 /NP /NFL /NDL | Out-Null
robocopy $SOURCE_RP $TARGET_RP /MIR /R:1 /W:1 /NP /NFL /NDL | Out-Null
Write-Host "[$(Get-Date -Format 'HH:mm:ss')] Listo!`n" -ForegroundColor Green

# Crear watchers
$watcher_BP = New-Object System.IO.FileSystemWatcher
$watcher_BP.Path = $SOURCE_BP
$watcher_BP.IncludeSubdirectories = $true
$watcher_BP.EnableRaisingEvents = $true
$watcher_BP.NotifyFilter = [System.IO.NotifyFilters]::LastWrite -bor [System.IO.NotifyFilters]::FileName -bor [System.IO.NotifyFilters]::DirectoryName

$watcher_RP = New-Object System.IO.FileSystemWatcher
$watcher_RP.Path = $SOURCE_RP
$watcher_RP.IncludeSubdirectories = $true
$watcher_RP.EnableRaisingEvents = $true
$watcher_RP.NotifyFilter = [System.IO.NotifyFilters]::LastWrite -bor [System.IO.NotifyFilters]::FileName -bor [System.IO.NotifyFilters]::DirectoryName

$lastSync = @{
    BP = [DateTime]::MinValue
    RP = [DateTime]::MinValue
}

$syncAction = {
    param($pack)
    
    $now = [DateTime]::Now
    if (($now - $script:lastSync[$pack]).TotalMilliseconds -lt 500) {
        return
    }
    
    $script:lastSync[$pack] = $now
    
    if ($pack -eq "BP") {
        robocopy $SOURCE_BP $TARGET_BP /MIR /R:1 /W:1 /NP /NFL /NDL | Out-Null
        Write-Host "[$(Get-Date -Format 'HH:mm:ss')] ✓ BP sincronizado" -ForegroundColor Green
    }
    else {
        robocopy $SOURCE_RP $TARGET_RP /MIR /R:1 /W:1 /NP /NFL /NDL | Out-Null
        Write-Host "[$(Get-Date -Format 'HH:mm:ss')] ✓ RP sincronizado" -ForegroundColor Cyan
    }
}

# Registrar eventos BP
$handlers = @()
$handlers += Register-ObjectEvent $watcher_BP "Changed" -Action { & $syncAction "BP" }
$handlers += Register-ObjectEvent $watcher_BP "Created" -Action { & $syncAction "BP" }
$handlers += Register-ObjectEvent $watcher_BP "Deleted" -Action { & $syncAction "BP" }
$handlers += Register-ObjectEvent $watcher_BP "Renamed" -Action { & $syncAction "BP" }

# Registrar eventos RP
$handlers += Register-ObjectEvent $watcher_RP "Changed" -Action { & $syncAction "RP" }
$handlers += Register-ObjectEvent $watcher_RP "Created" -Action { & $syncAction "RP" }
$handlers += Register-ObjectEvent $watcher_RP "Deleted" -Action { & $syncAction "RP" }
$handlers += Register-ObjectEvent $watcher_RP "Renamed" -Action { & $syncAction "RP" }

Write-Host "Esperando cambios..." -ForegroundColor Yellow

try {
    while ($true) {
        Start-Sleep -Seconds 1
    }
}
finally {
    $handlers | ForEach-Object { Unregister-Event -SourceIdentifier $_.Name }
    $watcher_BP.Dispose()
    $watcher_RP.Dispose()
}
