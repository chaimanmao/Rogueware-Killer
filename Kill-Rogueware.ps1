<#
.SYNOPSIS  
all malware go to hell!

.DESCRIPTION
run this script will lead your PC to unable to smoothly install the some malwares 

.EXAMPLE
.\Kill-Rogueware.ps1 (runas admin)

.NOTES
author:Vizo
date:  2017/2/28

.LINK
source project:https://liwei2.com/2015/11/27/378.html
latest project:https://github.com/vizogood/Rogueware-Killer
#>

#......check for permissions............................................ 
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
#......block digital certificate........................................
try {
    ForEach ($file in Dir "$PSScriptRoot\cer") {
        certutil -f -addstore -user "Disallowed" "$PSScriptRoot\Cer\$file"
    }
}catch {
    Write-Host "set Certificates limit failed ! " -ForegroundColor Red
}


#......set directory permissions........................................
$appData = Get-Childitem env:APPDATA | % { $_.Value }
$program ="C:\Program Files"
$programx86="C:\Program Files"
# baidu 
$baidu_directory_list= New-Object System.Collections.ArrayList
for($line=0;$line -lt (Get-Content "./directory-list/baidu-directory-list.txt").Count ;$line+=1){
    $baidu_directory_list.add(((Get-Content "./directory-list/baidu-directory-list.txt")[$line]).replace("appData","$appData"))  | Out-Null
}
for($i=0;$i -lt $baidu_directory_list.Count-1;$i+=1){
    New-Item $baidu_directory_list[$i]  -type Directory
    icacls.exe $baidu_directory_list[$i] /deny Everyone:F
}
for ($i = 1; $i -le 9; $i++ ) {
    for ($j = 0; $j -le 9; $j++ ) {
        New-Item $program\BaiduSd$i.$j -type Directory
        attrib +s +h $program\BaiduSd$i.$j
        icacls.exe $program\BaiduSd$i.$j /grant Everyone:F
    }
}
for ($i = 1; $i -le 9; $i++ ) {
    for ($j = 0; $j -le 9; $j++ ) {
        New-Item $programx86\BaiduSd$i.$j -type Directory
        attrib +s +h $programx86\BaiduSd$i.$j
        icacls.exe $programx86\BaiduSd$i.$j /grant Everyone:F
    }
}

# qiHoo 360
$qihoo360_directory_list= New-Object System.Collections.ArrayList
for($line=0;$line -lt (Get-Content "./directory-list/qihoo360-directory-list.txt").Count ;$line+=1){
    $qihoo360_directory_list.add(((Get-Content "./directory-list/qihoo360-directory-list.txt")[$line]).replace("appData","$appData"))  | Out-Null
}
for($i=0;$i -lt $qihoo360_directory_list.Count-1;$i+=1){
    New-Item $qihoo360_directory_list[$i]  -type Directory
    icacls.exe $qihoo360_directory_list[$i] /deny Everyone:F
}
# kingsoft
$kingsoft_directory_list= New-Object System.Collections.ArrayList
for($line=0;$line -lt (Get-Content "./directory-list/kingsoft-directory-list.txt").Count ;$line+=1){
    $kingsoft_directory_list.add(((Get-Content "./directory-list/kingsoft-directory-list.txt")[$line]).replace("appData","$appData"))  | Out-Null
}
for($i=0;$i -lt $kingsoft_directory_list.Count-1;$i+=1){
    New-Item $kingsoft_directory_list[$i]  -type Directory
    icacls.exe $kingsoft_directory_list[$i] /deny Everyone:F
}
# tencent 
$tencent_directory_list= New-Object System.Collections.ArrayList
for($line=0;$line -lt (Get-Content "./directory-list/tecent-directory-list.txt").Count ;$line+=1){
    $tencent_directory_list.add(((Get-Content "./directory-list/tecent-directory-list.txt")[$line]).replace("appData","$appData"))  | Out-Null
}
for($i=0;$i -lt $tencent_directory_list.Count-1;$i+=1){
    New-Item $tencent_directory_list[$i]  -type Directory
    icacls.exe $tencent_directory_list[$i] /deny Everyone:F
}
# rising
$rising_directory_list= New-Object System.Collections.ArrayList
for($line=0;$line -lt (Get-Content "./directory-list/rising-directory-list.txt").Count ;$line+=1){
    $rising_directory_list.add(((Get-Content "./directory-list/rising-directory-list.txt")[$line]).replace("appData","$appData"))  | Out-Null
}
for($i=0;$i -lt $rising_directory_list.Count-1;$i+=1){
    New-Item $rising_directory_list[$i]  -type Directory
    icacls.exe $rising_directory_list[$i] /deny Everyone:F
}
Write-Host "set directory permission limit successfully" -ForegroundColor Green
Write-Host "\n"



#......block IP and URLs...................................................
try{
    Get-content "$PSScriptRoot\latest-block-hosts.txt" | Add-content "C:\Windows\System32\drivers\etc\hosts" -Force
}catch{
    Write-Host "set hosts failed ! " -ForegroundColor Red
}Finally{
    Write-Host "set hosts successfully" -ForegroundColor Green
    Write-Host "\n"
}

Write-Host "all done!" -ForegroundColor Yellow
[Console]::Readkey() | Out-Null;