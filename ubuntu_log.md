
<!-- vim-markdown-toc GFM -->
* [给Github账号添加一个本机的SSH keys](#给github账号添加一个本机的ssh-keys)
* [命令eval](#命令eval)
* [[SSH keys](https://wiki.archlinux.org/index.php/SSH_keys_(%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87))](#ssh-keyshttpswikiarchlinuxorgindexphpssh_keys_e7ae80e4bd93e4b8ade69687)
* [安装vundle](#安装vundle)
* [ubuntu第一次安装提交github遇到的问题记录](#ubuntu第一次安装提交github遇到的问题记录)

<!-- vim-markdown-toc -->
* gdebi
* 用gdebi安装了搜狗输入法、lantern、chrome
×　ubuntu预装了python 2.7和3.5.
* 安装了xclip

## [给Github账号添加一个本机的SSH keys](https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/#generating-a-new-ssh-key)

``` bash
zhanglibin@zhanglibin:~$ ssh-keygen -t rsa -b 4096 -C "zhanglibinhebei@gmail.com"   #-t rsa指定生成的key的type是rsa;-b指定生成的key的比特数，rsa一般默认2048就足够了；-C 是公钥key的备注，会生成在公钥的最后面。
Generating public/private rsa key pair.
Enter file in which to save the key (/home/zhanglibin/.ssh/id_rsa): y
Enter passphrase (empty for no passphrase): 
Enter same passphrase again: 
Your identification has been saved in y.
Your public key has been saved in y.pub.
The key fingerprint is:
SHA256:gGYs98gYdf/8kSqR8++BDkuMAKPmYGFTLOJzvOzLRn4 zhanglibinhebei@gmail.com
The key\'s randomart image is:
+---[RSA 4096]----+
|  ... .          |
|...+ o .         |
|o+B * . .        |
|.+o& o . +   .   |
|oo= = . S o o    |
|=  + . o + + .   |
| .+   . = + o    |
|  .+ E . = . .   |
|  .oo   . ..o    |
+----[SHA256]-----+
zhanglibin@zhanglibin:~$ ls
Desktop  Downloads  Public  y  y.pub  模板  视频  图片  文档  音乐  #生成的y是私钥，y.pub是公钥
zhanglibin@zhanglibin:~$ mv y id_rsa_github #改名
zhanglibin@zhanglibin:~$ mv y.pub id_rsa_github.pub #改名
```
提示中建议把key存放在/home/zhanglibin/.ssh/id_rsa这里，结果手抖，敲成了y。
``` bash
    zhanglibin@zhanglibin:~$ mkdir .ssh
    zhanglibin@zhanglibin:~$ mv id_rsa_github* .ssh
```
后来才知道，最好的方式是先创建好.ssh目录，然后在.ssh目录下执行以上命令。  
按照github help里面的引导，下面要执行的命令是：  

``` bash
zhanglibin@zhanglibin:~$ eval "$(ssh-agent -s)"
Agent pid 6288)
```


## 命令eval
* 用法：eval command-line
&6sa0j
   
eval主要用在对参数的特殊处理上面的，一般的命令行，shell处理参数就只执行一遍，像转义和变量转变；但加上eval后就可以对参数经行两遍处理； 
eval eval command-line 这样就能对参数进行三次编译。  
eval命令会计算(evalue)它的参数，这些参数作为表达式计算后重新组合为一个字符串，然后作为一个命令被执行。  
eval最常见的用法是将动态生成的命令行计算并执行。例如：
``` bash
zhanglibin@zhanglibin:~$ name=zhangyuxi
zhanglibin@zhanglibin:~$ cmd="echo Hello $name\!"
zhanglibin@zhanglibin:~$ eval $cmd
Hello zhangyuxi!
zhanglibin@zhanglibin:~$ $cmd
Hello zhangyuxi\!
```

``` bash
zhanglibin@zhanglibin:~/.ssh$ ssh-keygen -f id_rsa_github -p
Enter new passphrase (empty for no passphrase): 
    Enter same passphrase again: 
    Your identification has been saved with the new passphrase.)
zhanglibin@zhanglibin:~$ ssh-add ~/.ssh/id_rsa_github
    Identity added: /home/zhanglibin/.ssh/id_rsa_github (/home/zhanglibin/.ssh/id_rsa_github)
    zhanglibin@zhanglibin:~$ xclip -sel clip < ~/.ssh/id_rsa_github.pub
```


## [SSH keys](https://wiki.archlinux.org/index.php/SSH_keys_(%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87))
SH 密钥对可以让您方便的登录到 SSH 服务器，而无需输入密码。由于您无需发送您的密码到网络中，SSH 密钥对被认为是更加安全的方式。再加上使用密码短语 (passphrase) 的使用，安全性会更上一层楼。
同时，我们可以使用 SSH agent 来帮助我们记住密码短语，无需我们记住每一个密钥对的密码短语，减轻了我们的负担。)


## [安装vundle](https://github.com/VundleVim/Vundle.vim)

1. mkdir -p ~/.vim/bundle/
2. git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
3. vim ~/.vimrc 在文件开头添加如下内容:
   ``` bash
   set nocompatible              " be iMproved, required
   filetype off                  " required

   " set the runtime path to include Vundle and initialize
   set rtp+=~/.vim/bundle/Vundle.vim
   call vundle#begin()
    " alternatively, pass a path where Vundle should install plugins
    "call vundle#begin('~/some/path/here')
    
    " let Vundle manage Vundle, required
    Plugin 'VundleVim/Vundle.vim'
    
    " The following are examples of different formats supported.
    " Keep Plugin commands between vundle#begin/end.
    " plugin on GitHub repo
    Plugin 'tpope/vim-fugitive'
    " plugin from http://vim-scripts.org/vim/scripts.html
    " Plugin 'L9'
    " Git plugin not hosted on GitHub
    Plugin 'git://git.wincent.com/command-t.git'
    " git repos on your local machine (i.e. when working on your own plugin)
    Plugin 'file:///home/gmarik/path/to/plugin'
    " The sparkup vim script is in a subdirectory of this repo called vim.
    " Pass the path to set the runtimepath properly.
    Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
    " Install L9 and avoid a Naming conflict if you've already installed a
    " different version somewhere else.
    " Plugin 'ascenator/L9', {'name': 'newL9'}
    
    " All of your Plugins must be added before the following line
    call vundle#end()            " required
    filetype plugin indent on    " required
    " To ignore plugin indent changes, instead use:
    "filetype plugin on
    "
    " Brief help
    " :PluginList       - lists configured plugins
    " :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
    " :PluginSearch foo - searches for foo; append `!` to refresh local cache
    " :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
    "
    " see :h vundle for more details or wiki for FAQ
    " Put your non-Plugin stuff after this line
    ```
再输入
`:PluginInstall`
4. 注意最好在.vimrc配置文件中加入：`set shell=/bin/bash`

## ubuntu第一次安装提交github遇到的问题记录
git add .后：
``` bash
zhanglibin@zhanglibin:~/mygithub/MyVimRes$ git commit -m 'ubuntu change'

*** Please tell me who you are.

Run

  git config --global user.email "you@example.com"
    git config --global user.name "Your Name"

    to set your account's default identity.
    Omit --global to set the identity only in this repository.

    fatal: unable to auto-detect email address (got 'zhanglibin@zhanglibin.(none)')
```
好吧，我就按照提示来配置了邮件和名字，这个邮件和名字应该是用来在github仓库中显示谁提交了代码的。
``` bash
zhanglibin@zhanglibin:~/mygithub/MyVimRes$ git config --global user.email "zhanglibinhebei@gmail.com"
zhanglibin@zhanglibin:~/mygithub/MyVimRes$ git config --global user.name "zhanglibin"
zhanglibin@zhanglibin:~/mygithub/MyVimRes$ git commit -m 'ubuntu first commit'
[master 4b3f2f6] ubuntu first commit
 2 files changed, 160 insertions(+)
 create mode 100755 shell/commit_vimres_ubuntu.sh
 create mode 100644 ubuntu_log.md
zhanglibin@zhanglibin:~/mygithub/MyVimRes$
```
commit 成功了！接下来push

``` bash
zhanglibin@zhanglibin:~/mygithub/MyVimRes$ git push
warning: push.default 尚未设置，它的默认值在 Git 2.0 已从 'matching'
变更为 'simple'。若要不再显示本信息并保持传统习惯，进行如下设置：

  git config --global push.default matching

若要不再显示本信息并从现在开始采用新的使用习惯，设置：

  git config --global push.default simple

当 push.default 设置为 'matching' 后，git 将推送和远程同名的所有
本地分支。

从 Git 2.0 开始，Git 默认采用更为保守的 'simple' 模式，只推送当前
分支到远程关联的同名分支，即 'git push' 推送当前分支。

参见 'git help config' 并查找 'push.default' 以获取更多信息。
（'simple' 模式由 Git 1.7.11 版本引入。如果您有时要使用老版本的 Git，
为保持兼容，请用 'current' 代替 'simple'）

fatal: unable to access 'https://github.com/zhanglibin1986/MyVimRes.git/': Failed to connect to 127.0.0.1 port 42487: 拒绝连接

```
出现了错误！
那么就先根据提示采用保守的simple模式吧
``` bash
zhanglibin@zhanglibin:~/mygithub/MyVimRes$ git config --global push.default simple
zhanglibin@zhanglibin:~/mygithub/MyVimRes$ git push
Username for 'https://github.com': zhanglibin1986
Password for 'https://zhanglibin1986@github.com': 
对象计数中: 5, 完成.
Delta compression using up to 4 threads.
压缩对象中: 100% (5/5), 完成.
写入对象中: 100% (5/5), 3.52 KiB | 0 bytes/s, 完成.
Total 5 (delta 1), reused 0 (delta 0)
remote: Resolving deltas: 100% (1/1), completed with 1 local object.
To https://github.com/zhanglibin1986/MyVimRes.git
   9ffd318..4b3f2f6  master -> master
zhanglibin@zhanglibin:~/mygithub/MyVimRes$
```
最后还输入了github的用户名和密码。但是我已经提前配好了Github的ssh keys啊！
先写到这里，权做记录这一天的折腾过程。这两天好好研究一下git。但愿能再写一片比较好的git博客出来。


