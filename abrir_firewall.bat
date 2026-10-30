@echo off
title Liberar Firewall Minecraft (Administrador)
cd /d "%~dp0"
echo Solicitando privilegios de administrador para liberar o Firewall...
powershell -NoProfile -ExecutionPolicy Bypass -Command "Start-Process powershell -Verb RunAs -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File \"\"%~dp0firewall.ps1\"\"'"
echo Processo de liberacao enviado para confirmacao do UAC.
ping 127.0.0.1 -n 3 >nul
