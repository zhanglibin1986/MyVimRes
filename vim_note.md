
<!-- vim-markdown-toc GFM -->
* [My note](#my-note)
    * [保存文件](#保存文件)
    * [可视模式选择文本](#可视模式选择文本)
    * [复制](#复制)
        * [寄存器与复制粘贴缓冲区](#寄存器与复制粘贴缓冲区)
            * [数字寄存器](#数字寄存器)
            * [字母寄存器](#字母寄存器)
    * [剪切](#剪切)
    * [翻页：](#翻页)
    * [Subject search 搜索:](#subject-search-搜索)
    * [光标移动：](#光标移动)
    * [滚屏：](#滚屏)
    * [插入：](#插入)
    * [撤销和重做：u / ctrl+r](#撤销和重做u--ctrlr)
    * [大小写转换](#大小写转换)
    * [分屏：](#分屏)
        * [调整高度和宽度](#调整高度和宽度)
    * [同一个窗口打开多个文件](#同一个窗口打开多个文件)
    * [vim 缓冲区](#vim-缓冲区)
    * [文件浏览](#文件浏览)
    * [Subject tab](#subject-tab)
    * [map](#map)
    * [控制命令：](#控制命令)
* [插入模式下的命令](#插入模式下的命令)
    * [Subject 正则](#subject-正则)
        * [简单替换表达式](#简单替换表达式)
    * [Subject NERDTree](#subject-nerdtree)
        * [快捷键](#快捷键)
        * [Subject vim calendar](#subject-vim-calendar)
        * [Subject vim markdown](#subject-vim-markdown)
    * [Vim Plugins](#vim-plugins)
        * [生成目录插件vim-markdown-toc](#生成目录插件vim-markdown-toc)
            * [生成目录的命令](#生成目录的命令)
            * [更新已存在的 Table of Contents](#更新已存在的-table-of-contents)
            * [配置选项](#配置选项)
        * [vim对齐插件](#vim对齐插件)
    * [怎样编写一个 Shell 脚本 https://billie66.github.io/TLCL/book/zh/chap25.html](#怎样编写一个-shell-脚本-httpsbillie66githubiotlclbookzhchap25html)
        * [脚本文件格式](#脚本文件格式)
        * [可执行权限](#可执行权限)
        * [脚本的存放位置](#脚本的存放位置)
        * [脚本变量规则](#脚本变量规则)
        * [将命令的输出赋值给shell的变量](#将命令的输出赋值给shell的变量)
        * [shell打印当前时间](#shell打印当前时间)
        * [shell从文件读内容到变量](#shell从文件读内容到变量)
    * [vim折叠](#vim折叠)
        * [vim缩进调整](#vim缩进调整)
    * [subject hexo](#subject-hexo)
        * [评论和计数功能的实现](#评论和计数功能的实现)
    * [vim寄存器](#vim寄存器)
        * [vim命令](#vim命令)
        * [选中文本命令](#选中文本命令)
        * [git log](#git-log)
    * [软链接硬链接](#软链接硬链接)
        * [查看某个文件的软硬链接](#查看某个文件的软硬链接)
    * [vim 插入当前日期时间](#vim-插入当前日期时间)

<!-- vim-markdown-toc -->
# My note

`:help cmd` 命令帮助  

`:new + file`新建文件  

## 保存文件
* :w或 :write  
* :up 同上，但windows无效。  
* :w newfile.txt 另存为newfile文件  
* :x 保存并退出  
* :wq 同上  
* :q! 强制退出不保存  

## 可视模式选择文本
v/V/ctrl+v分别是逐字/逐行/区域选择  
此时进入可视模式，利用光标的移动可以选择对应的文字，最后按y复制，用p粘贴。可视模式中我们可以通过查找或其他移动光标的方式来选择。  
按o光标回到起点可反向选择。选择中可以切换选择模式。  
选中之后可以做的操作除了“y“复制以外，还可以有如下操作：  
`d剪切 c修改 r替换 I在选中文本前插入 A在选中文本后插入 gu选中区域转为小写 gU选中区域转为大写 g~大小写互调 > 向右缩进一个单位 < 向左缩进一个单位`  
  
区域选择模式可在多行行首或行末插入内容。方法是区块选中后，按I或A在文本前/后插入内容，然后按 `<Esc>` 即可。  
删除多行注释:ctrl+v进入列模式;选中要取消注释的多行；如果要删除“//”按下2x即可。  

## 复制
yaw 复制当前单词  
yw:拷贝当前字符至本单词末尾 vey效果相同  
y0:拷贝当前光标到行首  
y$:拷贝当前光标到行末  
yy:拷贝当前行  
nyy:从当前行开始拷贝n行  
粘贴按p
### 寄存器与复制粘贴缓冲区 
* 在Normal模式下操作d/y/x等命令时，通过在命令前面加入寄存器的名字如 "ayy，来将命令生成的内容放入指定的寄存器中，如上面的a寄存器中，而不是vim默认使用的""寄存器和"0寄存器。
* 粘贴时，通过在p命令的前面加入寄存器的名字如 "ap，来将寄存器中的内容放入到光标所在的位置行上或下。  
#### 数字寄存器

* 0 : 存放最近使用最多的y命令生成的文本内容,如果未显式指定其内容
* 1 - 9 : 存放最近使用的d行操作命令生成的文本内容,如果未显式指定其内容，并在9个寄存器间对内容进行轮流存放，即有新的内容时，将"1的内容推到"2, 2到3，3到4 ...
#### 字母寄存器
如果你打算将一段内容进行多次长时间的来回拷贝，则最好使用字母寄存器，因为他们的内容被你修改后不会被VIM自动修改掉，而数字寄存器的内容随着新操作的使用会覆盖掉你指定的内容。
* "a - "z : 每次指定这些寄存器之一时，产生的文本内容将覆盖掉寄存器中原有的内容
* "A - "Z : 每次指定这些寄存器之一时，产生的文本内容将追加到寄存器中原有的内容之后，如果选项'cpoptions'的值中有>符号，则在追加同时会进行行分割，可以通过命令： :set cpo+=>设置。


## 剪切
可视模式选择后按d剪切  
dd剪切本行
ndd剪切n行
:1,10d剪切1~10行
:1,10 m 20 将第1~10行移到第20行之后

Subject delete 删除
ns 删除当前n个字符，并进入插入模式。
多行删除 ，：1,10d
要删除多行的话，可以用 ：5, 9 de
dw  光标在单词首部，删除该单词
多行删除    
:1,$d 删除所有行
J   删除两行之间的空行


## 翻页：
ctrl+f,b,d,u

## Subject search 搜索:  
:%s/old/new/g           将所有出现的old替换为new  
:%s/onward/forward/gi   将所有onward替换为forward，大小写不敏感  
:%s/old/new/gc          替换前确认  
:2,35s/old/new/g        将第2行到第35行之间的old替换为new  
:5,$s/old/new/g         将第5行到文件结尾的old替换为new  
:%s/^/hello/g           在每一行开头加入hello  
:%s/$/Harry/g           在每一行结尾加入Harry  
:%s/ *$//g              删除每行末尾无用空格  
:g/string/d             删除所有包含string的行  
:v/string/d             删除所有不包含string的行  
:s/Bill/Steve/          替换当前行第一个Bill为Steve  
:s/Bill/Steve/g         替换当前行中所有Bill  
:%s/Bill/Steve/g        替换文件中所有Bill  
:%s/^M//g               删掉DOS保存文件中(^M)  
:%s/\r/\r/g             Transform DOS carriage returns in returns  
:%s#<[^>]\+>##g         删除html标签但是保留文本  
:%s/^\(.*\)\n\1$/\1/    删除所有连续出现过两次的行，保留一行  
Ctrl+a                  递增光标下的数字  
Ctrl+x                  递减光标下的数字  
ggVGg?                  文本转换为 Rot13  


## 光标移动：
`\`.`  跳转到最近修改过的位置并定位编辑点  
`\'.`  跳转到最近修改的位置的行首  
%   跳转到与之匹配的括号处k
\`\`  在前一次跳转位置与当前位置间切换
f/F 查找/反向查找本行字符,光标定位到该字符的位置。
t/T 查找/反向查找本行字符,光标定位到该字符前。
 
左下上右对应hjkl,前面加n则移动n个单位
w/W
e/E
b/B
^ 本行第一个非空白字符
0   本行第一个字符
n$  移动到第n行行尾
gg  移动到文件头
G   移动到文件末行
1G  移动到文件首行
nG  移动到第n行
ctrl+f/b    光标向下/上移动一个屏幕
ctrl+d/u    光标向下/上移动半个屏幕
ctrl+o      回退一步
ctrl+i      前进一步
H/M/L   跳转到屏幕顶端/中间/底部
n(/{           光标向上移动n句/段落
n)/}           光标向下移动n句/段落



## 滚屏：
ctrl+e/y文字向上向下滚动
z./zz 滚动屏幕使光标所在行居中，区别是前者光标会定位到行首而后者不会
z<cr>将光标所在行滚动至屏幕顶端（<cr>是回车键-.-!）



## 插入：
i,I
a,A
o,O
光标后面输入10个A：10aA<Esc>,相应光标处输入：10iA<Esc>。类似：8oABC<Esc>即输入10行ABC

ddp交换当前行和其下一行
xp交换当前字符和其后一个字符



## 撤销和重做：u / ctrl+r

## 大小写转换
* ~ 将光标下的字母改变大小写
* 3~    将光标位置开始的3个字母改变其大小写
* g\~\~   改变当前行字母的大小写
* U     将可视模式下选择的字母全改成大写字母
* u          将可视模式下选择的字母全改成小写
* gUU        将当前行的字母改成大写
* 3gUU       将从光标开始到下面3行字母改成大写
* guu       将当前行的字母全改成小写
* gUw       将光标后的单词改成大写。
* guw       将光标后的单词改成小写。

## 分屏：
* vim -On file1 file2 ...打开两个文件垂直分屏
* vim -on file1 file2 ...

* 打开文件后，:vs file 垂直分屏，:sp file 
* 按一下Ctrl+w 再通过hjkl控制上下左右屏
* ctrl+ww依次切换窗口      
* 关闭分屏：
    * ctrl+w c/:q
    * ctrl+w o只保留当前分屏，等效于:only
    * qall(qa)   #退出所有窗口
### 调整高度和宽度
* 设置等宽等高
    `ctrl + w + =`
* 调整高度为显示n行的高度
`:res[ize] n`
或：`z{nr}<CR>`
* 高度增加n行
`ctrl + w + n+`
* 高度减少n行  
`ctrl + w + n-`
* 设置屏为最大高度  
`ctrl + w + _`


* 调整宽度为n个字符的宽度
`vertical res[ize] n`
* 宽度增加n行
`ctrl + w + n>`
* 宽度减少n行  
`ctrl + w + n<`

## 同一个窗口打开多个文件
vim file1 file2 ...
切换：:bn下一个   :bp上一个
更简单的:n下一个    :N上一个
:n 跳至下一个文件，也可以直接指定要跳的文件，如:n c，可以直接跳到c文件

## vim 缓冲区
:e#或ctrl+^ 切换两个最近编辑的文件(不一定在同一个窗口)

:ls或:files列出缓冲区的所有文档,:b num 切换列表中序号为num的文件
:f name 另存为name的文档

## 文件浏览
:Ex /:E 开启目录浏览器

:Sex 水平分割当前窗口，并在一个窗口中开启目录浏览器
:shell 不关闭vim的情况下打开shell
exit从shell回到vim

## Subject tab
多标签打开vim：vim -p file1 file2 ...
向右切换tab：gt，向左切换tab：gT。编辑的时候想增加一个tab：tabnew filename
:tabe file在tab的形式打开文件
:tabnew filename 新建tab文件
:tabc关闭当前tab
:tabo关闭其他所有tab
:tabs查看所有打开的tab
:tabp前一个tab
:tabn后一个tab
:tabm 0/1把当前tab移动到第一/二个
:tabr 跳转到第一个标签页
:bufdo tab split    把buffer中的文件全转成tab

vim -d file1 file2 ...  #垂直打开多窗口,并且进行比较
vimdiff file1 file2 ..  #等同于上一句

vim中执行shell中的命令,只需要在":"后面加"!"再敲shell中的命令即可,如:":!ls"

## map
<Esc>代表Escape键:<CR>代表Enter键；<D>代表Command键。
Alt键可以使用<M-key>或<A-key>来表示。<C>代表Ctrl.
对于组合键，可以用<C-Esc>代表Ctrl-Esc；使用<S-F1>表示Shift-F1.

使用下表中不同形式的map命令，可以针对特定的模式设置键盘映射：

## 控制命令：
* :!command
* :!ls 列出当前目录下文件
* :suspend或Ctrl - Z 挂起vim，回到shell，按fg可以返回vim。  

# 插入模式下的命令
Ctrl-d 删除当前行的缩进

## Subject 正则
http://tanqisen.github.io/blog/2013/01/13/vim-search-replace-regex/
### 简单替换表达式

`:[range]s/from/to/[flags]`  
  
* `range`:搜索范围，如果没有指定范围，则作用于但前行。  
  
1. :1,10s/from/to/ 表示在第1到第10行（包含第1，第10行）之间搜索替换；  
1. :10s/from/to/ 表示只在第10行搜索替换；  
1. :%s/from/to/ 表示在所有行中搜索替换；  
1. 1,$s/from/to/ 同上。  
* `flags` 有如下四个选项：  
  
1. c confirm，每次替换前询问；  
2. e error， 不显示错误；  
3. g globle，不询问，整行替换。如果不加g选项，则只替换每行的第一个匹配到的字符串；  
4. i ignore，忽略大小写。  
这些选项可以合并使用，如cgi表示不区分大小写，整行替换，替换前询问。  

## Subject NERDTree
http://yang3wei.github.io/blog/2013/01/29/nerdtree-kuai-jie-jian-ji-lu/
o       在已有窗口中打开文件、目录或书签，并跳到该窗口

### 快捷键
* ctrl + w + h    光标 focus 左侧树形目录
* ctrl + w + l    光标 focus 右侧文件显示窗口
* ctrl + w + w    光标自动在左右侧窗口切换
* ctrl + w + r    移动当前窗口的布局位置

o       在已有窗口中打开文件、目录或书签，并跳到该窗口
go      在已有窗口 中打开文件、目录或书签，但不跳到该窗口
t       在新 Tab 中打开选中文件/书签，并跳到新 Tab
T       在新 Tab 中打开选中文件/书签，但不跳到新 Tab
i       split 一个新窗口打开选中文件，并跳到该窗口
gi      split 一个新窗口打开选中文件，但不跳到该窗口
s       vsplit 一个新窗口打开选中文件，并跳到该窗口
gs      vsplit 一个新 窗口打开选中文件，但不跳到该窗口
!       执行当前文件
O       递归打开选中 结点下的所有目录
x       合拢选中结点的父目录
X       递归 合拢选中结点下的所有目录
e       Edit the current dif

双击    相当于 NERDTree-o
中键    对文件相当于 NERDTree-i，对目录相当于 NERDTree-e

D       删除当前书签

P       跳到根结点
p       跳到父结点
K       跳到当前目录下同级的第一个结点
J       跳到当前目录下同级的最后一个结点
k       跳到当前目录下同级的前一个结点
j       跳到当前目录下同级的后一个结点

C       将选中目录或选中文件的父目录设为根结点
u       将当前根结点的父目录设为根目录，并变成合拢原根结点
U       将当前根结点的父目录设为根目录，但保持展开原根结点
r       递归刷新选中目录
R       递归刷新根结点
m       显示文件系统菜单
cd      将 CWD 设为选中目录

I       切换是否显示隐藏文件
f       切换是否使用文件过滤器
F       切换是否显示文件
B       切换是否显示书签

q       关闭 NerdTree 窗口
?       切换是否显示 Quick Help
切换标签页

:tabnew [++opt选项] ［＋cmd］ 文件      建立对指定文件新的tab
:tabc   关闭当前的 tab
:tabo   关闭所有其他的 tab
:tabs   查看所有打开的 tab
:tabp   前一个 tab
:tabn   后一个 tab

标准模式下：
gT      前一个 tab
gt      后一个 tab

MacVim 还可以借助快捷键来完成 tab 的关闭、切换
cmd+w   关闭当前的 tab
cmd+{   前一个 tab
cmd+}   后一个 tab
testefabcdefabcd 
abcdef



Subject leader key
http://vim.wikia.com/wiki/Mapping_keys_in_Vim_-_Tutorial_(Part_3)

Subject echo
:echo mapleader

Subject Mark 书签
ma – 创建一个书签，标记为a，如果你要创建全局书签，要用大写字母。
`a – 跳转到书签a所在的行、列位置，a是你创建时候使用的字母。
‘a – 跳转到书签a所在的行位置。
:marks – 显示所有的书签。
:marks a – 显示书签a的详细信息
`. – 跳转到上次修改的行、列位置。
‘. – 跳转到上次修改的行位置。

### Subject vim calendar
    1. 安装第三方实现：
       从 https://github.com/itchyny/calendar.vim 下载下来压缩包，解压。把里面的内容放到 ~/.vim/ 里面即可。
       使用方法可以参考压缩包中的doc文件(这个不好用，已卸载)
    2. 安装vim官方插件：从http://www.vim.org/scripts/script.php?script_id=52 下载calendar-vim;将其中的doc，autoload，plugin文件夹放到~/.vim文件夹下即可。打开vim，执行`:Calendar`  

    

### Subject vim markdown
    1.安装：
        先用vundle安装：
            Plugin 'godlygeek/tabular'
            Plugin 'plasticboy/vim-markdown'     
        安装之前需要先安装node.js和并且安装了npm.
        安装完node.js之后安装instant-markdown-d:
            $ sudo npm -g install instant-markdown-d
        安装vim-instant-markdown插件：    
            Plugin 'suan/vim-instant-markdown'
        安装完成后，只要vim打开了markdown类型的文件就会自动打开一个浏览器窗口实时预览.
        python-vim-instant-markdown插件是用python写的,windows,linux都可以使用，安装这个插件需要python2支持，查看vim是否有python支持:
        vim --version | grep +python
        安装依赖:
        Plugin 'isnowfy/python-vim-instant-markdown'
        或者将md_instant.vim和md_instant文件夹放到~/.vim/plugin/目录下，windows是vim安装目录的vimfiles/plugin文件夹。
    2.使用
        打开vim打开markdown文件后执行:Instantmd命令会自动打开一个浏览器窗口进行实时预览，如果浏览器没有自动打开窗口，可以访问http://localhost:7000/。
## Vim Plugins
### 生成目录插件vim-markdown-toc
Plugin 'mzlogin/vim-markdown-toc'
https://github.com/mzlogin/vim-markdown-toc
####生成目录的命令
1. `:GenTocGFM`  
生成 GFM 链接风格的 Table of Contents。  
适用于 GitHub 仓库里的 Markdown 文件，比如 README.md，也适用用于生成 GitBook 的 Markdown 文件。  
2. `:GenTocRedcarpet`  
生成 Redcarpet 链接风格的 Table of Contents。  
适用于使用 Redcarpet 作为 Markdown 引擎的 Jekyll 项目或其它地方。
3. `:UpdateToc`  
更新目录（默认保存文件时也会自动更新）  
#### 更新已存在的 Table of Contents  
通常不需要手动做这件事，保存文件时会自动更新已经存在的 Table of Contents。  
除非是在配置里关闭了保存时自动更新，并且维持插入 Table of Contents 前后的  
`<!-- vim-markdown-toc -->`此时可使用 `:UpdateToc` 命令手动更新。
#### 配置选项
以下所说的这些选项在vimrc文件中配置
1. `g:vmt_auto_update_on_save`  
默认值：1  
插件会自动更新已经存在的 Table of Contents，如果你不想要这个功能，可以在你的 vimrc 文件里加入如下内容关闭：  
let g:vmt_auto_update_on_save = 0  
2. g:vmt_dont_insert_fence  
默认值：0  
在默认情况下，:GenTocXXX 命令会在插入的 Table of Contents 前后加上 <!-- vim-markdown-toc -->，这是为了实现自动和手动更新 Table of Contents 功能。  
如果你不想看到它们，可以在 vimrc 文件里加入如下内容移除：  
let g:vmt_dont_insert_fence = 1  
需要注意的是移除之后插件将无法再帮你保存文件时自动更新 Table of Contents 了，也无法使用 :UpdateToc 命令了。这里如果还想更新 Table of Contents，只能先手动删除已经存在的，然后重新运行 :GenTocXXX 命令。  
3. g:vmt_cycle_list_item_markers  
默认值：0  
在默认情况下，所有 Table of Contents 项目前面的标记都是 *：  
* [Level 1](#level-1)
    * [Level 1-1](#level-1-1)
    * [Level 1-2](#level-1-2)
        * [Level 1-2-1](#level-1-2-1)
* [Level 2](level-2)
这里提供一个选项改变这个行为，如果设置：
let g:vmt_cycle_list_item_markers = 1
那标记将根据级别循环使用 *、- 和 +：
* [Level 1](#level-1)
    - [Level 1-1](#level-1-1)
    - [Level 1-2](#level-1-2)
        + [Level 1-2-1](#level-1-2-1)
* [Level 2](level-2)
这不会影响 Markdown 文档解析后的显示效果，只用于提升源文件的可读性。
### vim对齐插件
* 参考博客：http://www.wklken.me/posts/2015/06/07/vim-plugin-easyalign.html
* Github：https://github.com/junegunn/vim-easy-align
* 常用命令:
    * 命令模式下对齐段内所所有|:  
    `vipga *|`
## 怎样编写一个 Shell 脚本 https://billie66.github.io/TLCL/book/zh/chap25.html
这个教程也挺好的:http://www.runoob.com/linux/linux-shell-variable.html

### 脚本文件格式
下面是“hello world” 脚本：  
``` bash
#!/bin/bash
# This is our first script.
echo 'Hello World!'
```
这个#!字符序列是一种特殊的结构叫做 shebang。 这个 shebang 被用来告诉操作系统将执行此脚本所用的解释器的名字。每个 shell 脚本都应该把这一文本行 作为它的第一行。

让我们把此脚本文件保存为 hello_world。
### 可执行权限
下一步我们要做的事情是让我们的脚本可执行。使用 chmod 命令  
写完脚本后一定要赋予权限：chmod 755 ~/bin/sys_info_page  
或：`chmod +x ./test.sh`  #使脚本具有执行权限
对于脚本文件，有两个常见的权限设置；权限为755的脚本，则每个人都能执行，和权限为700的 脚本，只有文件所有者能够执行。注意为了能够执行脚本，脚本必须是可读的。  
### 脚本的存放位置
* ~/bin
一般个人脚本放在这个目录下
* /usr/local/bin
如果放到这个目录下，那么系统所有的用户都可以使用它
* /usr/local/sbin
一般存放系统管理员的脚本
* /usr/local
大多数情况下，本地支持的软件，不管是脚本还是编译过的程序，都应该放到 /usr/local 目录下， 而不是在 /bin 或 /usr/bin 目录下。这些目录都是由 Linux 文件系统层次结构标准指定，只包含由 Linux 发行商 所提供和维护的文件。

### [脚本变量规则](https://billie66.github.io/TLCL/book/zh/chap26.html)
* 定义一个变量  
``` bash
title="System Information Report"
```  
* **注意**
1. 变量名可由字母数字字符（字母和数字）和下划线字符组成。
1. 变量名的第一个字符必须是一个字母或一个下划线。
1. 变量名中不允许出现空格和标点符号;变量名，等号和变量值之间必须没有空格。
1. 可以在同一行中对多个变量赋值。
    `a=5 b="a string"`
1. 在参数展开过程中,可以用花括号把变量包起来。echo ${title} 可以避免上下文导致的歧义。
``` bash
$ filename="myfile"
$ touch $filename
$ mv $filename $filename1
mv: missing destination file operand after \`myfile'
Try \`mv --help' for more information.
```
这种尝试失败了，因为 shell 把 mv 命令的第二个参数解释为一个新的（并且空的）变量。通过这种方法 可以解决这个问题：

`[me@linuxbox ~]$ mv $filename ${filename}1`  
通过添加花括号，shell 不再把末尾的1解释为变量名的一部分。
* 定义只读变量
readonly myUrl
* 删除变量(不能删除只读变量)
unset variable_name
* 单引号和双引号
单引号里的任何字符都会原样输出，单引号字符串中的变量是无效的；  
单引号字串中不能出现单引号（对单引号使用转义符后也不行）。  
双引号里可以有变量  
双引号里可以出现转义字符  
`your_name='qinjx'  
str="Hello, I know your are \"$your_name\"! \n"`

* 获取字符串长度

string="abcd"

echo ${#string} #输出 4
* 提取子字符串
``` bash
string="runoob is a great site"  
echo ${string:1:4} # 输出 unoo
```
* 查找子字符串
``` bash
string="runoob is a great company"  
echo `expr index "$string" is`  # 输出 8
```
* 运算符
原生bash不支持简单的数学运算，但是可以通过其他命令来实现，例如 awk 和 expr，expr 最常用。
expr 是一款表达式计算工具，使用它能完成表达式的求值操作。

``` bash
val=`expr 2 + 2`

a=10 b=20

echo "a + b = `expr $a + $b`"
```
注意+两边的空格！
``` bash
echo "a * b = `expr $a \* $b`"


if [ $a -gt $b ]
then 
    echo echo "[ $a -gt $b ] is true"
else 
    echo echo "[ $a -gt $b ] is false"
fi
```

### 将命令的输出赋值给shell的变量
* git branch的输出
    ``` bash
    BreadTripMacPro:BreadBnb breadtripmacpro$ branch=$(git symbolic-ref HEAD | sed -e 's,.*/\(.*\),\1,')
    BreadTripMacPro:BreadBnb breadtripmacpro$ echo $branch
    master
    ```
    或者：  
    ``` bash
    BreadTripMacPro:BreadBnb breadtripmacpro$ c=$(git branch | grep "*")
    BreadTripMacPro:BreadBnb breadtripmacpro$ echo $c
    app build build.gradle gradle gradle.properties gradlew gradlew.bat local.properties settings.gradle test master
    BreadTripMacPro:BreadBnb breadtripmacpro$ branch1=${c:2}
    BreadTripMacPro:BreadBnb breadtripmacpro$ echo $branch1
    master
    ```
    实际应用：
    ``` bash
branch=$(git symbolic-ref HEAD | sed -e 's,.*/\(.*\),\1,')
if [ $branch = 'develop' ]
then
	curl -F "file=@/Users/Shared/Jenkins/Home/workspace/BreadtripBnbAndroid/app/build/outputs/apk/pub/release/app-pub-release.apk" -F "uKey=xxx" -F "_api_key=xxx" https://qiniu-storage.pgyer.com/apiv1/app/upload
fi
    ```
### shell打印当前时间
``` bash
$ echo `date +%Y-%m-%d\ %H:%M:%S`
2017-08-30 13:50:09
```
### shell从文件读内容到变量
有文件名为cm_time
mytime=$(cat cm_time)就把文件内容读到了mytime变量中

## vim折叠
http://vimcdoc.sourceforge.net/doc/usr_28.html#usr_28.txt
:set foldmethod=mark
可以使用:set foldenable命令来启动折叠。
vim将折叠等同于行来对待——你可以使用j或k命令，移动跳过包含多行的整个折叠；也可以使用y或d命令，复制或删除某个折叠。
通常在折叠处向左或向右移动光标，或者进入插入模式，都将会自动打开折叠。我们也可以使用以下命令定义快捷键，使用空格键关闭当前打开的折叠，或者打开当前关闭的折叠。  
按照折叠所依据的规则，可以分为manual（手工折叠）、indent（缩进折叠）、marker（标记折叠）和syntax（语法折叠）等几种。gtgt  
经调查set foldmethod=marker时比较好用。
折叠文件中的所有代码： 快捷按键 zm
取消文件中所有代码的折叠： 快捷按键 zr

:set foldmethod? 查看当前的折叠模式
zf创建折叠
zc折叠
zo打开折叠
za 打开关闭的折叠，或关闭打开的折叠
zd删除光标下的折叠
zD循环删除
zv 打开足够的折叠，使得当前行可见
zM 关闭所有 设置 'foldlevel' 为零
zR 打开所有 设置 'foldlevel' 为最大折叠级别
zE取消所有折叠
zj移动到下一个折叠处
zk移动到上一个折叠处

### vim缩进调整
>> 向右缩进  
<< 向左缩进

## subject hexo
浏览器同步插件：[hexo-browsersync](https://github.com/hexojs/hexo-browsersync)
运行hexo s时报错：
``` bash
FATAL Something's wrong. Maybe you can find the solution here: http://hexo.io/docs/troubleshooting.html
Template render error: (unknown path)
  Error: expected end of comment, got end of file
    at Object.exports.prettifyError (/szUsers/zhanglibin/myblog/node_modules/hexo/node_modules/nunjucks/src/lib.js:34:15)
```
原因：  
内容包含了`{#`。o
>查了一下，{# 是 nunjucks 的注释标记， http://mozilla.github.io/nunjucks/templating.html#comments。
>所以只有半个的话，就挂了。
>所以解决办法是 {% raw %}{#{% endraw %} 但是这样 post 内容就不是纯的 markdown 了。
### 评论和计数功能的实现
http://ibruce.info/2015/04/04/busuanzi/
https://zhiho.github.io/2015/09/29/hexo-next/

## vim寄存器
http://vimcdoc.sourceforge.net/doc/usr_24.html#24.6
<test 尖括号>
[test 尖括号]
{test 尖括号}
{test 尖括号}
(test 小括号)
"test 小括号"
### vim命令
* zz 将当前行定位到屏幕中间
* zt/z<CR> 将当前行定位到第一行
* zb 将当前行定位最后一行
* :verb set foldmethod? 查询
``` bash
foldmethod=expr
        Last set from ~/.vim/bundle/vim-markdown/after/ftplugin/markdown.vim
```
* :sh[ell]  启动一个shell外壳，执行完exit后回到vim

### 选中文本命令
* i + '/"/</[/{/( 选中以上范围内的内容，比如vi[是选中[]内的内容,yi(是复制括号中的内容
* a + '/"/</[/{/( 选中以上范围内的内容(包括'[]')，比如va[是选中[]内的内容(包括'[]'),yi(是复制括号中的内容(包括'[]')
### git log
git log --graph --oneline --all  
git log -2 显示两条记录  
git log --since="2017-08-01 00:00:00" 显示自从指定时间点到现在的log  

## 软链接硬链接
### 查看某个文件的软硬链接
## vim 插入当前日期时间
    `:.!date`  
    或`!!date`
    或`:r!date`

其实效果是一样的

2017年 9月14日 星期四 12时25分02秒 CST
2017年 9月14日 星期四 12时25分14秒 CST
2017年 9月14日 星期四 12时25分29秒 CST
