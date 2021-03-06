set nocompatible              " required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'Lokaltog/vim-powerline'
Plugin 'L9'
Plugin 'scrooloose/syntastic'		"每次保存文件时Vim都会检查代码的语法
"Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree' " 加入NERDTree
" 这个插件可以显示文件的Git增删状态
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'Align'
Plugin 'junegunn/vim-easy-align'
"markdown插件
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
"markdown实时预览插件
"Plugin 'suan/vim-instant-markdown'
"vim-markdown-toc目录生成插件
Plugin 'mzlogin/vim-markdown-toc'
Plugin 'CodeFalling/fcitx-vim-osx'
"Install Plugins:run :PluginInstall
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
set shell=/bin/bash
set nu                      "显示行号"
syntax on                  "命令打开语法高亮度。
set ts=4                    "set tabstop 的缩写。 一个tab键所占的列数，linux 内核代码建议每个tab占用8列,所以不设置的话默认是占8列(ps：:set list 可以查看tab符号）
set shiftwidth=4 "这个量是每行的缩进深度，一般设置成和tabstop一样的宽度"
set expandtab               "set expandtab 输入tab时自动将其转化为空格(取消expandtab::set noexpandtab
autocmd FileType python set expandtab                   "只想在Python文件中将Tab展开成空格
"autocmd InsertEnter * se cul    " 用横线高亮当前行
set smartindent      "智能缩进"
set cindent     "C语言风格缩进"
set autoindent "自动缩进"
inoremap jk <ESC>			"将ESC映射为jk
set fileformat=unix			"以unix格式储存文件，避免在推送到Github或分享给其他用户时出现文件转换问题。
set encoding=utf-8
set backspace=2             "0是Vi compatible兼容模式，不能删除非本次插入模式键入的内容；1是:set backspace=indent,eol；2 same as “:set backspace=indent,eol,start
set ignorecase smartcase    "搜索智能忽略大小写

"设置markdown折叠相关
"使用语法高亮定义代码折叠
"set foldmethod=marker
"set foldmethod=syntax
set foldmethod=manual
"打开文件是默认不折叠代码
"http://vimcdoc.sourceforge.net/doc/options.html#'foldlevelstart'
set foldlevelstart=99
"au BufRead *.py map <buffer> <F5> :w<CR>:!/usr/bin/env python % <CR>    ".vimrc文件里加这个配置，按F5即可运行当前.py文件

imap <C-CR> <ESC>o
"inoremap ( ()<ESC>i
"inoremap ' ''<ESC>i
"inoremap [ []<ESC>i
"inoremap { {}<ESC>i
" Ctrl+N 打开/关闭
map <F2> :NERDTreeToggle<CR>
"map <C-n> :NERDTreeToggle<CR>


" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

":BundleList              -列举列表(也就是.vimrc)中配置的所有插件  
":BundleInstall          -安装列表中的全部插件  
":BundleInstall!         -更新列表中的全部插件  
":BundleSearch foo   -查找foo插件  
":BundleSearch! foo  -刷新foo插件缓存  
":BundleClean           -清除列表中没有的插件  
":BundleClean!          -清除列表中没有的插件
if has ('gui_running')
    colorscheme wombat256
    "colorscheme 
endif


"把空格设置为leader键
let mapleader = " " 
nnoremap <Leader>b :echo "Hello"<CR>
"nnoremap <C-W> :echo "Hello"<CR>
"nnoremap <C-W><C-W> :echo "Success"<CR>
"ctrl + w + w 在nerdtree侧栏打开时切换焦点
nnoremap <Leader>a <C-W><C-W> 
nnoremap <Leader>l :EasyAlign *|
"set omnifunc=syntaxcomplete#Complete
"输入```时，出一对，并且中间留空行光标定位到空行的插入模式
"ab ``` ```<CR><CR>```<ESC>ki
iab font <font color=></font><ESC>F=a
iab img {% asset_img  %}<ESC>0fgla
iab bl {% blockquote %}{% endblockquote %}<ESC>F}

let g:input_toggle = 1
function! Fcitx2en()
   let s:input_status = system("fcitx-remote")
   if s:input_status == 2
      let g:input_toggle = 1
      let l:a = system("fcitx-remote -c")
   endif
endfunction

function! Fcitx2zh()
   let s:input_status = system("fcitx-remote")
   if s:input_status != 2 && g:input_toggle == 1
      let l:a = system("fcitx-remote -o")
      let g:input_toggle = 0
   endif
endfunction

"设置 Vim ttimeoutlen 选项为较小值（如100），否则退出插入模式时会有较严重的延迟
set timeoutlen=150 ttimeoutlen=0
"离开插入模式时切换为英文
autocmd InsertLeave * call Fcitx2en()
"进入插入模式时切换为中文
"autocmd InsertEnter * call Fcitx2zh()
"iab xdt <c-r>=strftime("%H:%M")<cr>
