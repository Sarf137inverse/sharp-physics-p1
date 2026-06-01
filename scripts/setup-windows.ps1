# Run this in PowerShell as Administrator

Write-Host "[setup] Installing TeX Live for Sharp Physics..."

if (-not (Get-Command choco -ErrorAction SilentlyContinue)) {
    Write-Host "[setup] Chocolatey not found. Installing..."
    Set-ExecutionPolicy Bypass -Scope Process -Force
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
    Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
}

choco install texlive -y

Write-Host "[setup] Refreshing environment..."
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")

Write-Host "[setup] Done. Run 'bash src/build.sh' in Git Bash to compile."