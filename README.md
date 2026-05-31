##### Sharp-Physics-1st-Paper
⚠️ README under construction

###### Project Structure

/cheat-sheets/ &nbsp;→ chapterwise cheat sheets. Unmaintained.  \
/assets/ &emsp;&emsp;&emsp;→ assets for this repository.  \
/textbook/ &emsp;&emsp; → compiled PDF textbook, built from /src.  \
/src &emsp;&emsp;&emsp;&emsp;&emsp;→ active work directory.

still in early stage. Structure system is being actively iterated.

###### Setup
Local setup. Run the following script.

***Linux***
```bash
#!/usr/bin/env bash
set -e

echo "[setup] Installing TeX Live for Sharp Physics..."

sudo apt-get update
sudo apt-get install -y \
    texlive-luatex \
    texlive-lang-other \
    texlive-science \
    texlive-pictures \
    texlive-latex-extra

echo "[setup] Done. Run 'bash src/build.sh' to compile."
```
***Mac***
```bash
#!/usr/bin/env bash
set -e

echo "[setup] Installing TeX Live for Sharp Physics..."

if ! command -v brew &>/dev/null; then
    echo "[setup] Homebrew not found. Installing..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

brew install --cask mactex-no-gui

echo "[setup] Refreshing PATH..."
eval "$(/usr/libexec/path_helper)"

echo "[setup] Done. Run 'bash src/build.sh' to compile."
```
***Windows***
```powershell
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
```
Then compile:
```bash
bash src/build.sh
```
###### File Naming Convention

Examples:
```
ch08-kinetic-theory.tex
ch09-thermodynamics.tex
ch10-ideal-gas.tex
```
Rules:
- Two digit chapter numbers for correct sorting (ch08 not ch8)
- Lowercase always
- Hyphens (-), not spaces or underscores
- No abbreviations unless listed below

Allowed abbreviations:
- chapter → ch

###### Contributing
Full contributing guide coming soon.

###### Status
Early stage. Content is being actively written.



Born out of frustration with poorly written textbooks.
