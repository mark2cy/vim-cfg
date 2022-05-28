" https://blog.maxkit.com.tw/2017/07/vim-plugins-vim-ide.html
" update vim if PluginInstall error, sudo apt install vim


""""""""""
" 基礎配置
""""""""""
"default leader key is \ and can be redefined by mapleader
"let mapleader=",'  , new leader key is ,
cs add cscope.out




syntax on " 支持語法高亮
"set backspace=2 " 映射backspace, 適用於MAC
set laststatus=2 " 永遠開啟狀態列
set encoding=utf-8 " 支持utf8



set termencoding=utf-8
set fillchars+=stl:\ ,stlnc:\
set term=xterm-256color " 支持256色
set t_Co=256
set noautoindent " 關閉自動縮排
set number " 開啟行數
set hlsearch " 高亮搜索
set incsearch " 開啟全域搜索
set ignorecase " 搜索無視大小寫
set cursorline " 高亮所在行
set expandtab " tab 轉為空格
set tabstop=4 " tab 輸出兩個空格
set shiftwidth=4
"set mouse=a " 支持滑鼠
set wildmenu " 指令提示菜單
" au BufRead,BufNewFile *.vue set filetype=html " 以html來對待vue

" ----------------------- colorscheme --------------------------"
colorscheme elflord " vim scheme, evening, elflord, onedark
"highlight command must run after colorscheme to avoid overwirte
hi Comment ctermfg=lightcyan




"-- 摺疊配置 --
set foldcolumn=1
set foldlevelstart=99
setlocal foldmethod=marker
setlocal foldmarker={,}
nnoremap <Space> za " 使用空白件折疊





" ------------- screen/window control --------------"
nnoremap <TAB> :wincmd w<CR>
" Ctrl w + \ - virtical split
" Ctrl w + - - horizon split
" nnoremap <C-w>\ <C-w>v   ":vsp
" nnoremap <C-w>- <C-w>s   ":sp



""""""""""
" Vundle配置
" install plugin
"  :PluginInstall
" unstall plugin
"  1.delete the in "Plugin xxx"
"  2.:PluginUpdate  in vim
" 
" :BundleList -列举出列表中(.vimrc中)配置的所有插件
" :BundleInstall -安装列表中全部插件
" :BundleInstall! -更新列表中全部插件
" :BundleSearch foo -查找foo插件
" :BundleSearch! foo -刷新foo插件缓存
" :BundleClean -清除列表中没有的插件
" :BundleClean! -清除列表中没有的插件
"
""""""""""

set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" 插件
Plugin 'gmarik/Vundle.vim' " 插件管理器本人

"Plugin 'lambdalisue/nerdfont.vom'  "nerdfont
Plugin 'ryanoasis/vim-devicons' " 目錄icon
" 系統字體需要支持特殊字元, 推薦nerdfonts
" download nerdfonts from git.
" Copy the downloaded files to ~/.local/share/fonts ( or run install.sh )
" execute fc-cache -f -v

" Plugin 'mattn/emmet-vim' " 快速插入html
"Plugin 'tpope/vim-surround' " 快速包圍
Plugin 'chrisbra/Colorizer' " 顏色提示
Plugin 'scrooloose/nerdtree' " 樹形目錄
Plugin 'jistr/vim-nerdtree-tabs' " 樹型目錄強化
Plugin 'Xuyuanp/nerdtree-git-plugin' " show git status


" Plugin 'jiangmiao/auto-pairs' " 自動補全對稱符
" Plugin 'itchyny/lightline.vim' " 下方狀態列表
Plugin 'bling/vim-airline' " enhanced status bar
Plugin 'vim-airline/vim-airline-themes'

" Plugin 'scrooloose/nerdcommenter' " 快速註解
" Plugin 'joshdick/onedark.vim' " vim 主題
" Plugin 'Glench/Vim-Jinja2-Syntax' " python Jinja 模塊語法高亮



Plugin 'majutsushi/tagbar' " tagbar like the taglist, just try the different tools
Plugin 'fholgado/minibufexpl.vim' " MiniBufExplorer
Plugin 'pseewald/nerdtree-tagbar-combined' "put nerdtree and tagbar in vertical
Plugin 'tpope/vim-fugitive'  "work with gitgutter
Plugin 'airblade/vim-gitgutter'

Plugin 'inkarkat/vim-ingo-library' " vim-mark's library
Plugin 'inkarkat/vim-mark' " multiple highlight


" to be check..
Plugin 'ctrlpvim/ctrlp.vim'
"Plugin 'christoomey/vim-tmux-navigator'

" Plugin 'prettier/vim-prettier' " 一鍵排版
" 需安裝prettier, npm install -g prettier

" Plugin 'Valloric/YouCompleteMe' " 補全提示
" vim 需要支持python
" 安裝方式: cd ~/.vim/bundle/YouCompleteMe &&  python3 install.py --ts-completer

call vundle#end()
filetype plugin indent on

""""""""""
" 插件配置
""""""""""


" -- airline 主題 --
"set laststatus=2 , configured already.
let g:airline_powerline_fonts = 1
let g:airline_detect_paste=1

let g:airline#extensions#tagbar#enabled = 1 " (:help tagbar-statusline)
let g:airline#extensions#tagbar#flags= '' " (default) , 'f', 's', 'p'

"let g:airline_theme='solarized'
let g:airline_solarized_dark_text=1
    "let g:airline_solarized_dark_inactive_background=1
    "let g:airline_solarized_dark_inactive_border=1
    "let g:airline_solarized_enable_command_color=1
set ambiwidth=double "double width for star
let g:airline#extensions#nerdtree_statusline=1
let g:airline#extensions#branch#enabled=1



" -- NERDTree 配置 --
map <C-n> :NERDTreeToggle<CR>  "Ctrl-n to on/off NerdTree
let NERDTreeAutoCenter=1
let NERDTreeShowHidden=1
"let NERDTreeWinSize=31
let g:nerdtree_tabs_open_on_console_startup=0
let NERDTreeShowBookmarks=0
" let NERDTreeIgnore=['\.pyc','\~$','\.swp']
let NERDTreeQuitOnOpen=0
let g:NERDTreeChDirMode=2
let NERDTreeMapActivateNode='<space>'
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCompactSexyComs = 1
"NerdTreeStatusline


" 沒有文件開啟的時候關閉nerdtree
autocmd QuitPre * if empty(&bt) | lclose | endif


" -- NERDTree Git Status config --
let g:NERDTreeGitStatusUseNerdFonts=1
let g:NERDTreeGitStatusIndicatorMapCustom = {
                 \ 'Modified'  :'✹',
                 \ 'Staged'    :'✚',
                 \ 'Untracked' :'✭',
                 \ 'Renamed'   :'➜',
                 \ 'Unmerged'  :'═',
                 \ 'Deleted'   :'✖',
                 \ 'Dirty'     :'✗',
                 \ 'Ignored'   :'☒',
                 \ 'Clean'     :'✔︎',
                 \ 'Unknown'   :'?',
                 \ }



" ==========================================
" tagbar
" ==============================================
"nmap <Leader>tb :TagbarToggle<CR> "toggle
let g:tagbar_ctags_bin='ctags'     "ctags程序的路径
let g:tagbar_width=30               "window width
let g:tagbar_vertical=25            "set vertical for nerdtree-tagbar-=combined work
let g:tagbar_compact=1
map <F3> :TagbarClose<CR>
"autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx call tagbar#autoopen()  "如果是c语言的程序的话，tagbar自动开启

" nerdtree-tagbar-combind --
nmap <F7> :ToggleNERDTreeAndTagbar<CR>


" -- MiniBufExplorer 配置 --
let g:miniBufExplBuffersNeeded = 0
let g:miniBufExplMapWindowNavVim = 1   
let g:miniBufExplMapWindowNavArrows = 1   
let g:miniBufExplMapCTabSwitchBufs = 1   
let g:miniBufExplModSelTarget = 1  
let g:miniBufExplMoreThanOne=0

map <F11> :MBEbp<CR> " previous buffer
map <F12> :MBEbn<CR> " next

"---------GIT SETTINGS--------------
hi clear SignColumn
let g:airline#extensions#hunks#non_zero_only = 0
set updatetime=500

let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified ='~'
let g:gitgutter_sign_removed ='✖'
"let g:gitgutter_sign_removed_first_line ="^^"
"let g:gitgutter_sign_removed_aabove_and_below = '{'
"let g:gitgutter_sign_modified_removed ='ww'
highlight GitGutterAdd ctermfg=blue
highlight GitGutterChange ctermfg=green
highlight GitGutterDelete ctermfg=red



" set updatetime=100 , default checking duration is 4000ms, modify the
" parameter to speed up the checking rate.


"-----------TMUX SETTINGS--------------
let g:tmux_navigator_save_on_switch = 2

" -- vim-mark 配置 --
" let g:mwDefaultHighlightingPalette = 'extended'  " or, 'maximum'
" let g:mwDefaultHighlightingNum = 9
" customized color
" highlight MarkWordN ctermbg=Cyan ctermfg=Black guibg=#8CCBEA guifg=Black 
" let g:mwAutoLoadMarks = 0  " To enable the automatic restore of marks from a previous Vim session ( 0/1 )
" let g:mwAutoSaveMarks = 0 " To turn off the automatic persistence of marks across Vim sessions 
" Mark saving command
" :MarkSave







