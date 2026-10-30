$Host.UI.RawUI.WindowTitle = "Servidor Minecraft PaperMC 26.3 - Henrique"
Set-Location -Path $PSScriptRoot

$javaBin = Join-Path $PSScriptRoot "jre\bin\java.exe"
if (-not (Test-Path $javaBin)) {
    $javaBin = "java"
}

$javaArgs = @(
    "-Xms8G",
    "-Xmx8G",
    "-XX:ActiveProcessorCount=2",
    "-XX:+UseG1GC",
    "-XX:+ParallelRefProcEnabled",
    "-XX:MaxGCPauseMillis=200",
    "-XX:+UnlockExperimentalVMOptions",
    "-XX:+DisableExplicitGC",
    "-XX:+AlwaysPreTouch",
    "-XX:G1NewSizePercent=30",
    "-XX:G1MaxNewSizePercent=40",
    "-XX:G1ReservePercent=20",
    "-XX:G1HeapWastePercent=5",
    "-XX:G1MixedGCCountTarget=4",
    "-XX:InitiatingHeapOccupancyPercent=15",
    "-XX:G1MixedGCLiveThresholdPercent=90",
    "-XX:G1RSetUpdatingPauseTimePercent=5",
    "-XX:SurvivorRatio=32",
    "-XX:+PerfDisableSharedMem",
    "-XX:MaxTenuringThreshold=1",
    "-Dusing.aikars.flags=https://mcflags.emc.gs",
    "-Daikars.new.flags=true",
    "-jar",
    "server.jar",
    "--nogui"
)

Write-Host "Iniciando Servidor PaperMC 26.3 (8GB RAM, 2 Cores) com Aikar's Flags..." -ForegroundColor Cyan
& $javaBin @javaArgs

Write-Host "`nServidor encerrado." -ForegroundColor Yellow
Read-Host -Prompt "Pressione ENTER para fechar a janela..."
