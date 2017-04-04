## 名称:
- [流氓软件终结者](https://liwei2.com/2015/11/27/378.html)
- 收集一切终结流氓软件的方法

## 说明:
#### 感谢 原作者leave 

#### 我为什么要把流氓软件终结者重新制作一遍?
- 当前为PowerShell制作,exe傻瓜版正在制作中.
- 我恨流氓软件.
- 原作者因为时间关系不能维护更新.



#### 对于恶意软件分类:
1. 未经用户许可擅自安装并自动（开机）修改或增添额外服务（service）或进程（process）的叫流氓软件（rogueware）。
2. 满足条件1，并且盗取用户信息，破坏系统稳定运行的叫恶意软件（malware）。
3. 满足条件1 & 2，并且在单机自我复制，影响同类型软件（可执行文件，宏文件等）的叫病毒(virus)。
4. 满足条件1 & 2 & 3，并且在网络中（不同主机间）自我复制，影响相同服务或进程的叫蠕虫（worm)。 

> 作者：螺哥  来源：知乎  链接：https://www.zhihu.com/question/21491140/answer/18404252


#### 目录介绍:
- malware-kill.zip->存放源版本(使用Bat编写)文件.
- Cer目录->存放流氓软件的所有证书.
- latestBlockhosts.txt->存放需要屏蔽的域名→hosts格式
- Kill-Malware.ps1->主脚本
- Restore-Status.ps1->恢复脚本
- 两个.ps1脚本为GBK编码(PowerShell输出中文真蛋疼),除此之外UTF-8. 
- 火绒拦截全家桶规则目录->存放火绒拦截全家桶规则.json->火绒安全软件配置文件


## PowerShell脚本用法:

- Windows系统默认不能执行Powershell脚本,第一次运行Powershell脚本需要做如下操作:
```powershell
    Set-ExecutionPolicy   UnRestricted  # 把脚本权限设置为最低
```
- 然后进入该脚本所在目录
```powershell
    Set-Location  "这里面是你下载的脚本目录"     
```
- 在PowerShell窗口中执行此脚本:
```Shell
    .\Kill-malware.ps1
```

- 如果影响到了你的正常使用,执行恢复脚本:
```Shell
    .\Restore-Status.ps1
```

- 如果不想拉黑某个证书,比如CNNIC,在执行主脚本前到Cer目录下删除cnnic.cer即可.


## 火绒安全软件规则用法:

- 打开[火绒安全软件](http://www.huorong.cn/)->软件设置->系统防御->自定义防护->导入->选择"火绒拦截全家桶规则.json"即可.

## 开源协议:
- 火绒拦截全家桶规则:http://bbs.huorong.cn/thread-12380-1-1.html
- malware-kil BAT脚本作者[leave](https://liwei2.com/) 
- hosts来源:https://github.com/vokins/yhosts & 自己添加
- PowerShell源文件->MIT


