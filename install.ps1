# Install conda and pytorch<!--
<#--><style>
body {
    white-space: pre;
    font-family: monospace;
}
</style><!--#>#-->

$OriginalPR = $ProgressPreference

$ProgressPreference = 'SilentlyContinue'

Write-Host -NoNewline "1/3 Downloading conda installer..."

Set-Location ~/Downloads

Invoke-WebRequest https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-Windows-x86_64.exe -OutFile miniforge3.exe

Write-Host "Done"

Write-Host -NoNewline "2/3 Installing miniforge..."

Start-Process miniforge3.exe -Wait -ArgumentList "/S /AddToPath=1"

Write-Host "Done"

Write-Host -NoNewline "3/3 Installing packages..."

Start-Process -Wait powershell -ArgumentList '-command "pip3 install torch torchvision torchaudio pandas opencv-python jupyterlab ipywidgets matplotlib --extra-index-url https://download.pytorch.org/whl/cu116"'

Write-Host "Done"

$ProgressPreference = $OriginalPR
