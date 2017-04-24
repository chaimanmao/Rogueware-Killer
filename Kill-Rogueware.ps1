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
if( -not $currentWp.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)){
    $boundPara = ($MyInvocation.BoundParameters.Keys | foreach{
        '-{0} {1}' -f  $_ ,$MyInvocation.BoundParameters[$_]} ) -join ' '
    $currentFile = (Resolve-Path  $MyInvocation.InvocationName).Path
    $fullPara = $boundPara + ' ' + $args -join ' '
    Start-Process "$psHome\powershell.exe"   -ArgumentList "$currentFile $fullPara" -verb runas
    return
}
Write-Host "any key to continue" -ForegroundColor Red -BackgroundColor White
[Console]::Readkey() | Out-Null ;

write-Host "
                 -------��å�����ս���-------
   -----------------------------------------------------------
   ��      �ٶ�ɱ��    ����   �ٶ���ʿ   ��   �ٶ�������     ��
   -----------------------------------------------------------
   ��   �ٶ��ֻ�����    ���� 360��ȫ��ʿ ��     360ɱ��      ��
   -----------------------------------------------------------
   ��   QQ���Թܼ�     ����   ����ɱ��   ��  ���ǳ�Ʒ�������� ��
   -----------------------------------------------------------
   ��      ��ɽ����    ��   ��ɽ�ֻ����� ��  ��ɽ��Ʒ�������� ��
   -----------------------------------------------------------
   ��    �Ա�������    ����   ��ɽ��ʿ   ��       Ѹ��       ��
   -----------------------------------------------------------
   ��  Ѹ�����μ�����  ����  Ѹ����Ϸ���� ��     Ѹ��Ӱ��     ��
   -----------------------------------------------------------
                       ����C�鿴 CNNIC����
   -----------------------------------------------------------
                       Powered by  Vizo
   
            I have a dream: all malware go to hell ! 
   -----------------------------------------------------------             
" -ForegroundColor Green

$isUserWantToSeeCNNIC = Read-Host "����C�鿴CNNIC����,�س���������������:"
if ($isUserWantToSeeCNNIC -eq "C"){
    Write-Host "
                CNNIC���й�����������Ϣ����
                2015�꣬��CNNIC���е�һ���м�CA�����ַ�����Google�����ļ�֤��
                ����������������ǩ����CNNIC֤����GitHub�����м��˹���
                ����ָ������Դ�ܿ��������𳤳��й�
                �����û�ѡ��������CNNIC�䷢������֤��
                ��������CNNIC����֤���䷢Ȩ���ĵ���
                2015��4��2�գ�Google�������ٳ���CNNIC���䷢�ĵ���֤��
                4��4�գ���Google֮����MozillaҲ�������ٳ���CNNIC���䷢�ĵ���֤��
                2016��8�£�CNNIC�ٷ���վ�ѷ������з��еĸ�֤�飬������DigiCert�䷢��֤��
                ����Wikipedia " -ForegroundColor Yellow 
}
Write-Host "`n"
Write-Host "������������ʼ." -ForegroundColor "Red"
[Console]::Readkey() | Out-Null ;

$PSScriptRoot
$program = "C:\Program Files"
$programx86 = "C:\Program Files (x86)"
$appdata = Get-Childitem env:APPDATA | %{ $_.Value } 

# block digital certificate
ForEach($file in Dir "$PSScriptRoot\Cer"){
    certutil -f -addstore -user "Disallowed" "$PSScriptRoot\Cer\$file"
}
Write-Host "`n"
Write-Host "set Certificates limit successfully " -ForegroundColor Green

# set directory permissions
Write-Host "`n"
Write-Host "setting directory permission limit" -ForegroundColor Green
# Baidu 
New-Item "$program\Baidu\BaiduAn"    -ItemType Directory
New-Item "$program\Baidu\BaiduSd"    -ItemType Directory
New-Item "$appdata\Baidu"            -ItemType Directory
New-Item "$programx86\Baidu\BaiduAn" -ItemType Directory
New-Item "$programx86\Baidu\BaiduSd" -ItemType Directory
for($i = 1;$i -le 9;$i++ ){
     for($j = 0;$j -le 9; $j++ ){
         New-Item "$program\BaiduSd$i.$j" -ItemType Directory
         attrib +s +h "$program\BaiduSd$i.$j"
         cacls "$program\BaiduSd$i.$j" /e /d Everyone
     }
}
for($i = 1;$i -le 9;$i++ ){
     for($j = 0;$j -le 9; $j++ ){
         New-Item "$programx86\BaiduSd$i.$j" -ItemType Directory
         attrib +s +h "$programx86\BaiduSd$i.$j"
         cacls "$programx86\BaiduSd$i.$j" /e /d Everyone
     }
}
cacls "$program\Baidu\BaiduAn" /e /d Everyone
cacls "$program\Baidu\BaiduSd" /e /d Everyone
cacls "$appdata\Baidu" /e /d Everyone
cacls "$programx86\Baidu\BaiduAn" /e /d Everyone
cacls "$programx86\Baidu\BaiduSd" /e /d Everyone

# QiHoo 360d
New-Item "$program\360\360safe" -ItemType Directory
New-Item "$program\360\360sd" -ItemType Directory
New-Item "$programx86\360\360safe" -ItemType Directory
New-Item "$programx86\360\360sd" -ItemType Directory
cacls "$program\360\360safe" /e /d Everyone
cacls "$program\360\360sd" /e /d Everyone
cacls "%ProgramFiles(x86)%\360\360safe" /e /d Everyone
cacls "%ProgramFiles(x86)%\360\360sd" /e /d Everyone

# Kingsoft
New-Item "$program\ksafe" -ItemType Directory
New-Item "$program\kingsoft\kingsoft antivirus" -ItemType Directory
New-Item "$programx86\ksafe" -ItemType Directory
New-Item "$programx86\kingsoft\kingsoft antivirus" -ItemType Directory
cacls "$program\ksafe" /e /d Everyone
cacls "$program\kingsoft\kingsoft antivirus" /e /d Everyone
cacls "$programx86\ksafe" /e /d Everyone
cacls "$programx86\kingsoft\kingsoft antivirus" /e /d Everyone

# Tencent 
New-Item "$program\Tencent\QQPCMgr" -ItemType Directory
New-Item "$appdata\Tencent\QQPCMgr" -ItemType Directory
New-Item "$programx86\Tencent\QQPCMgr"  -ItemType Directory
cacls "$program\Tencent\QQPCMgr" /e /d Everyone
cacls "$appdata\Tencent\QQPCMgr" /e /d Everyone
cacls "$programx86\Tencent\QQPCMgr" /e /d Everyone

# Rising
New-Item "$program\Rising" -ItemType Directory
New-Item "$program\Rising\Rav" -ItemType Directory
New-Item "$programx86\Rising" -ItemType Directory
New-Item "$programx86\Rising\Rav" -ItemType Directory
cacls "$program\Rising\Rav" /e /d Everyone
cacls "$program\Rising" /e /d Everyone
cacls "$programx86\Rising\Rav" /e /d Everyone
cacls "$programx86\Rising" /e /d Everyone
Write-Host "`n"
Write-Host "set directory permission limit successfully" -ForegroundColor Green

# block IP and URLs
Get-content "$PSScriptRoot\latestBlockhosts.txt" | Add-content "C:\Windows\System32\drivers\etc\hosts" -Force
Write-Host "`n"
Write-Host "set hosts successfully" -ForegroundColor Green

Write-Host "`n"
Write-Host "all done!" -ForegroundColor Yellow
[Console]::Readkey() | Out-Null ;







