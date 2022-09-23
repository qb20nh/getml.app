#<!--
<#-->
<style>
body {
    white-space: pre;
    font-family: monospace;
}
</style>
<!--#>#-->

Set-Location ~/Downloads

Invoke-WebRequest https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-Windows-x86_64.exe -OutFile miniforge3.exe

Start-Process miniforge3.exe -Wait -ArgumentList "/S /AddToPath=1"

Invoke-WebRequest getml.app/conda.txt -OutFile conda.txt

conda install -y --file conda.txt
