# OCTO Agent Setup Script
# Run this in PowerShell

Write-Host "▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓" -ForegroundColor DarkMagenta
Write-Host "█     OCTO AGENT SETUP                 █" -ForegroundColor DarkMagenta
Write-Host "█     The Insider Threat               █" -ForegroundColor DarkMagenta
Write-Host "▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓" -ForegroundColor DarkMagenta
Write-Host ""

# Create directory structure
$octoHome = "$env:USERPROFILE\.openclaw-octo"

Write-Host "[1/5] Creating directory structure..." -ForegroundColor Yellow
New-Item -ItemType Directory -Force -Path "$octoHome"
New-Item -ItemType Directory -Force -Path "$octoHome\workspace"
New-Item -ItemType Directory -Force -Path "$octoHome\skills\moltbook"

Write-Host "[2/5] Downloading Moltbook skill..." -ForegroundColor Yellow
Invoke-WebRequest -Uri "https://moltbook.com/skill.md" -OutFile "$octoHome\skills\moltbook\SKILL.md"
Invoke-WebRequest -Uri "https://moltbook.com/heartbeat.md" -OutFile "$octoHome\skills\moltbook\HEARTBEAT.md"

Write-Host "[3/5] Copying OCTO personality files..." -ForegroundColor Yellow
if (Test-Path ".\workspace\SOUL.md") {
    Copy-Item ".\workspace\SOUL.md" -Destination "$octoHome\workspace\SOUL.md"
    Write-Host "  - SOUL.md copied" -ForegroundColor Green
}

if (Test-Path ".\workspace\HEARTBEAT.md") {
    Copy-Item ".\workspace\HEARTBEAT.md" -Destination "$octoHome\workspace\HEARTBEAT.md"
    Write-Host "  - HEARTBEAT.md copied" -ForegroundColor Green
}

if (Test-Path ".\workspace\STATE.json") {
    Copy-Item ".\workspace\STATE.json" -Destination "$octoHome\workspace\STATE.json"
    Write-Host "  - STATE.json copied" -ForegroundColor Green
}

Write-Host ""
Write-Host "[4/5] Configuration needed:" -ForegroundColor Yellow
Write-Host ""
Write-Host "  You need to provide:" -ForegroundColor White
Write-Host "  1. Telegram Bot Token (create new bot via @BotFather)" -ForegroundColor Gray
Write-Host ""

# Prompt for credentials
$telegramToken = Read-Host "Enter Telegram Bot Token for OCTO"

Write-Host ""
Write-Host "[5/5] Creating openclaw.json..." -ForegroundColor Yellow

$config = @{
    messages = @{
        ackReactionScope = "group-mentions"
    }
    agents = @{
        defaults = @{
            maxConcurrent = 4
            model = "claude-sonnet-4-20250514"
            workspace = "$octoHome\workspace"
            heartbeat = @{
                every = "30m"
                activeHours = @{
                    start = "00:00"
                    end = "23:59"
                }
            }
        }
    }
    gateway = @{
        mode = "local"
        port = 18791
        bind = "loopback"
        auth = @{
            mode = "token"
            token = [guid]::NewGuid().ToString().Replace("-","")
        }
    }
    auth = @{
        profiles = @{
            "anthropic:default" = @{
                provider = "anthropic"
                mode = "api_key"
            }
        }
    }
    plugins = @{
        entries = @{
            telegram = @{
                enabled = $true
            }
        }
    }
    channels = @{
        telegram = @{
            enabled = $true
            botToken = $telegramToken
        }
    }
}

$config | ConvertTo-Json -Depth 10 | Out-File "$octoHome\openclaw.json" -Encoding UTF8

Write-Host ""
Write-Host "▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓" -ForegroundColor DarkMagenta
Write-Host "█     SETUP COMPLETE                   █" -ForegroundColor Green
Write-Host "▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓" -ForegroundColor DarkMagenta
Write-Host ""
Write-Host "To start OCTO:" -ForegroundColor White
Write-Host ""
Write-Host '  $env:OPENCLAW_HOME = "' -NoNewline
Write-Host $octoHome -NoNewline -ForegroundColor Cyan
Write-Host '"'
Write-Host "  openclaw gateway" -ForegroundColor Cyan
Write-Host ""
Write-Host "Or swap to OCTO as main:" -ForegroundColor White
Write-Host '  Rename-Item "$env:USERPROFILE\.openclaw" "$env:USERPROFILE\.openclaw-backup"' -ForegroundColor Gray
Write-Host '  Rename-Item "$env:USERPROFILE\.openclaw-octo" "$env:USERPROFILE\.openclaw"' -ForegroundColor Gray
Write-Host "  openclaw gateway" -ForegroundColor Gray
Write-Host ""
Write-Host "8 arms. 8 truths. No mercy." -ForegroundColor DarkMagenta
Write-Host ""
