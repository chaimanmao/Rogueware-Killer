## 名称:
- [流氓软件终结者](https://liwei2.com/2015/11/27/378.html)
- 收集终结流氓软件的方法

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

#### 支持平台:
- Windows10
- 建议重装系统后使用此脚本

#### 目录介绍:
- malware-kill.zip->存放源版本(使用Bat编写)文件.
- cer目录->存放流氓软件的所有证书.
- directory-list目录->存放需要屏蔽的软件安装目录列表
- latestBlockhosts.txt->存放需要屏蔽的域名→hosts格式
- Kill-Rogueware.ps1->主脚本
- Restore-Status.ps1->恢复脚本
- 火绒拦截全家桶规则目录->存放火绒拦截全家桶规则.json->火绒安全软件配置文件

## PowerShell脚本用法:
- Windows系统默认不能执行Powershell脚本,第一次运行Powershell脚本需要做如下操作:
```PowerShell
    Set-ExecutionPolicy   UnRestricted  # 把脚本权限设置为最低
```
- 然后进入该脚本所在目录
```PowerShell
    Set-Location  "这里面是你下载的脚本目录"     
```
- 在PowerShell窗口中执行此脚本:
```PowerShell
    .\Kill-Rogueware.ps1
```
- 如果不想拉黑某个证书,比如CNNIC,在执行主脚本前到cer目录下删除cnnic.cer即可.
- 同理,如果想拉黑某个证书,可以把证书文件导出为.cer格式(.DER/X509)放在cer目录下运行脚本即可.
- 如果影响到了你的正常使用,执行恢复脚本:
```PowerShell
    .\Restore-Status.ps1
```


## 火绒安全软件规则用法:

- 打开[火绒安全软件](http://www.huorong.cn/)->软件设置->系统防御->自定义防护->导入->选择"火绒拦截全家桶规则.json"即可.

## 开源协议:
- 火绒拦截全家桶规则->http://bbs.huorong.cn/thread-12380-1-1.html
- malware-kil BAT version->[leave](https://liwei2.com/)
- hosts 来源参考->https://github.com/vokins/yhosts & 自己添加
- 所有源文件和源代码, 如果没有特殊声明, 都遵循 [雪碧软件协议](https://github.com/vizogood/Rogueware-Killer/blob/master/LICENSE).
