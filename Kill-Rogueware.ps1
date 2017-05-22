<#
.SYNOPSIS  
all malware go to hell!

.DESCRIPTION
run this script will lead your PC to unable to smoothly install the some malwares 
if you mind , don't run it . 

.EXAMPLE
.\Kill-Rogueware.ps1 (runas admin)

.NOTES
author:Vizo
date:  2017/2/28

.LINK
source project:https://liwei2.com/2015/11/27/378.html
latest project:https://github.com/vizogood/Rogueware-Killer
#>

# check for permissions 
$currentWi = [Security.Principal.WindowsIdentity]::GetCurrent()
$currentWp = [Security.Principal.WindowsPrincipal]$currentWi
if ( -not $currentWp.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    $boundPara = ($MyInvocation.BoundParameters.Keys | foreach {
            '-{0} {1}' -f $_ , $MyInvocation.BoundParameters[$_]} ) -join ' '
    $currentFile = (Resolve-Path  $MyInvocation.InvocationName).Path
    $fullPara = $boundPara + ' ' + $args -join ' '
    Start-Process "$psHome\powershell.exe"   -ArgumentList "$currentFile $fullPara" -verb runas
    return
}
Write-Host "any key to continue" -ForegroundColor Red -BackgroundColor White
[Console]::Readkey() | Out-Null ;

$PSScriptRoot
$program = "C:\Program Files"
$programx86 = "C:\Program Files (x86)"
$appdata = Get-Childitem env:APPDATA | % { $_.Value } 

# block digital certificate
try {
    ForEach ($file in Dir "$PSScriptRoot\cer") {
        certutil -f -addstore -user "Disallowed" "$PSScriptRoot\Cer\$file"
    }
}catch {
    Write-Host "set Certificates limit failed ! " -ForegroundColor Red
}Finally {
    Write-Host "set Certificates limit successfully !  " -ForegroundColor Green
}

# set directory permissions
Write-Host "setting directory permission limit" -ForegroundColor Green

# Baidu 
$baiduDirectoryList= New-Object System.Collections.ArrayList
for($line=0;$line -le (Get-Content "./directory-list/baidu-directory-list.txt").Length-1 ;$line+=1){
    $baiduDirectoryList.add((Get-Content "./directory-list/baidu-directory-list.txt")[$line]) | Out-Null
}

for($i=0;$i -le $baiduDirectoryList.Count;$i+=1){
    New-Item "$baiduDirectoryList[i]"  -ItemType Directory
    icacls.exe "$baiduDirectoryList[i]" /deny Everyone:F
}

New-Item "$program\Baidu\BaiduAn"    -ItemType Directory
New-Item "$program\Baidu\BaiduSd"    -ItemType Directory
New-Item "$appdata\Baidu"            -ItemType Directory
New-Item "$programx86\Baidu\BaiduAn" -ItemType Directory
New-Item "$programx86\Baidu\BaiduSd" -ItemType Directory
icacls.exe "$program\Baidu\BaiduAn" /deny Everyone:F
icacls.exe "$program\Baidu\BaiduSd" /deny Everyone:F
icacls.exe "$appdata\Baidu" /deny Everyone:F
icacls.exe "$programx86\Baidu\BaiduAn" /deny Everyone:F
icacls.exe "$programx86\Baidu\BaiduSd" /deny Everyone:F
for ($i = 1; $i -le 9; $i++ ) {
    for ($j = 0; $j -le 9; $j++ ) {
        New-Item "$program\BaiduSd$i.$j" -ItemType Directory
        attrib +s +h "$program\BaiduSd$i.$j"
        icacls.exe "$program\BaiduSd$i.$j" /grant Everyone:F
    }
}
for ($i = 1; $i -le 9; $i++ ) {
    for ($j = 0; $j -le 9; $j++ ) {
        New-Item "$programx86\BaiduSd$i.$j" -ItemType Directory
        attrib +s +h "$programx86\BaiduSd$i.$j"
        icacls.exe "$programx86\BaiduSd$i.$j" /grant Everyone:F
    }
}




# QiHoo 360d
New-Item "$program\360\360safe" -ItemType Directory
New-Item "$program\360\360sd" -ItemType Directory
New-Item "$programx86\360\360safe" -ItemType Directory
New-Item "$programx86\360\360sd" -ItemType Directory
icacls.exe "$program\360\360safe" /deny Everyone:F
icacls.exe "$program\360\360sd" /deny Everyone:F
icacls.exe "$programx86\360\360safe" /grant Everyone:F
icacls.exe "$programx86\360\360sd" /grant Everyone:F

# Kingsoft
New-Item "$program\ksafe" -ItemType Directory
New-Item "$program\kingsoft\kingsoft antivirus" -ItemType Directory
New-Item "$programx86\ksafe" -ItemType Directory
New-Item "$programx86\kingsoft\kingsoft antivirus" -ItemType Directory
icacls.exe "$program\ksafe" /grant Everyone:F
icacls.exe "$program\kingsoft\kingsoft antivirus" /grant Everyone:F
icacls.exe "$programx86\ksafe" /grant Everyone:F
icacls.exe "$programx86\kingsoft\kingsoft antivirus" /grant Everyone:F

# Tencent 
New-Item "$program\Tencent\QQPCMgr" -ItemType Directory
New-Item "$appdata\Tencent\QQPCMgr" -ItemType Directory
New-Item "$programx86\Tencent\QQPCMgr"  -ItemType Directory
icacls.exe "$program\Tencent\QQPCMgr" /grant Everyone:F
icacls.exe "$appdata\Tencent\QQPCMgr" /grant Everyone:F
icacls.exe "$programx86\Tencent\QQPCMgr" /grant Everyone:F

# Rising
New-Item "$program\Rising" -ItemType Directory
New-Item "$program\Rising\Rav" -ItemType Directory
New-Item "$programx86\Rising" -ItemType Directory
New-Item "$programx86\Rising\Rav" -ItemType Directory
icacls.exe "$program\Rising\Rav" /grant Everyone:F
icacls.exe "$program\Rising" /grant Everyone:F
icacls.exe "$programx86\Rising\Rav" /grant Everyone:F
icacls.exe "$programx86\Rising" /grant Everyone:F
Write-Host "`n"
Write-Host "set directory permission limit successfully" -ForegroundColor Green

# block IP and URLs
Get-content "$PSScriptRoot\latest-block-hosts.txt" | Add-content "C:\Windows\System32\drivers\etc\hosts" -Force
Write-Host "`n"
Write-Host "set hosts successfully" -ForegroundColor Green

Write-Host "`n"
Write-Host "all done!" -ForegroundColor Yellow
[Console]::Readkey() | Out-Null ;







