# Script PowerShell para criar regras no Firewall do Windows
# Executa como Administrador

Write-Host "======================================================" -ForegroundColor Cyan
Write-Host "   Configurando Firewall para Servidor Minecraft" -ForegroundColor Cyan
Write-Host "======================================================" -ForegroundColor Cyan

try {
    # Remove regras antigas caso existam para evitar duplicidade
    Remove-NetFirewallRule -DisplayName "Minecraft Paper Server" -ErrorAction SilentlyContinue
    Remove-NetFirewallRule -DisplayName "Minecraft Paper Server UDP" -ErrorAction SilentlyContinue
    Remove-NetFirewallRule -DisplayName "Minecraft BlueMap Web" -ErrorAction SilentlyContinue
    Remove-NetFirewallRule -DisplayName "Minecraft Simple Voice Chat" -ErrorAction SilentlyContinue

    # Cria regra de entrada TCP 25565 (Jogo)
    New-NetFirewallRule -DisplayName "Minecraft Paper Server" `
                        -Direction Inbound `
                        -LocalPort 25565 `
                        -Protocol TCP `
                        -Action Allow `
                        -Description "Permite conexões de clientes ao servidor Minecraft PaperMC" `
                        -ErrorAction Stop | Out-Null
    Write-Host "[OK] Regra TCP porta 25565 liberada com sucesso." -ForegroundColor Green

    # Cria regra de entrada UDP 25565
    New-NetFirewallRule -DisplayName "Minecraft Paper Server UDP" `
                        -Direction Inbound `
                        -LocalPort 25565 `
                        -Protocol UDP `
                        -Action Allow `
                        -Description "Permite tráfego UDP na porta 25565 para Minecraft/Bedrock/Query" `
                        -ErrorAction Stop | Out-Null
    Write-Host "[OK] Regra UDP porta 25565 liberada com sucesso." -ForegroundColor Green

    # Cria regra para BlueMap (Porta 8100 TCP)
    New-NetFirewallRule -DisplayName "Minecraft BlueMap Web" `
                        -Direction Inbound `
                        -LocalPort 8100 `
                        -Protocol TCP `
                        -Action Allow `
                        -Description "Permite acesso web ao mapa 3D do BlueMap" `
                        -ErrorAction Stop | Out-Null
    Write-Host "[OK] Regra TCP porta 8100 (BlueMap Web) liberada com sucesso." -ForegroundColor Green

    # Cria regra para Simple Voice Chat (Porta 24454 UDP)
    New-NetFirewallRule -DisplayName "Minecraft Simple Voice Chat" `
                        -Direction Inbound `
                        -LocalPort 24454 `
                        -Protocol UDP `
                        -Action Allow `
                        -Description "Permite tráfego de voz do Simple Voice Chat" `
                        -ErrorAction Stop | Out-Null
    Write-Host "[OK] Regra UDP porta 24454 (Simple Voice Chat) liberada com sucesso." -ForegroundColor Green

    Write-Host "`nFirewall liberado com sucesso!" -ForegroundColor Green
    Start-Sleep -Seconds 3
} catch {
    Write-Host "`n[ERRO] Falha ao configurar Firewall: $_" -ForegroundColor Red
    Write-Host "Certifique-se de executar como Administrador." -ForegroundColor Yellow
    Read-Host -Prompt "Pressione ENTER para fechar..."
}
