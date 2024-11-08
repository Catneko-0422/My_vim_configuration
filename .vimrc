set nocompatible              
filetype off                  

set rtp+=%USERPROFILE%/vimfiles/bundle/vundle.vim/
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'flazz/vim-colorschemes'

Plugin 'The-NERD-tree'
"NERDTree 配置:F2快捷键显示当前目录树
map <F2> :NERDTreeToggle<CR>
let NERDTreeWinSize=25

Plugin 'gabrielelana/vim-markdown'
Plugin 'tyru/open-browser.vim'
Plugin 'kannokanno/previm'
Plugin 'mattn/emmet-vim'
Plugin 'Chiel92/vim-autoformat'

call vundle#end()            
filetype plugin indent on    

nnoremap ¡ : NERDTreeToggle<CR>

let g:previm_open_cmd = 'open -a Google\ Chrome'

let g:user_emmet_expandabbr_key = '<c-e>'

noremap <F3> :Autoformat<CR>
au BufWrite * :Autoformat
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 0


" 語法識別
syntax enable

" 顯示行數
set number

" 支援 256 色
" set t_Co=256

" 終端機背景色 : dark / light
set background=dark

colorscheme molokai

" 搜尋，高亮標註
set hlsearch

" 配置檔案路徑，讓 find 指令更好用
set path=.,/usr/include,,**

" ts = tabstop
set ts=4 "縮排 4 格

" tab 替換成空格
set expandtab

" 自動縮排 ｜ autoindent / smartindent / cindent
set autoindent " 跟上一行的縮進一致

inoremap ;; <ESC>

" 執行程式
nmap <F5> :call CompileRun()<CR>
func! CompileRun()
        exec "w"
if &filetype == 'python'
            exec "!time python3 %"
elseif &filetype == 'java'
            exec "!javac %"
            exec "!time java %<"
elseif &filetype == 'sh'
            :!time bash %
endif
    endfunc

" JSON 文字格式化 
" command! JSONFormat :execute '%!python -m json.tool' 

command! JSONFormat :execute '%!python -m json.tool'
\ | :execute '%!python -c "import re,sys;chr=__builtins__.__dict__.get(\"unichr\", chr);sys.stdout.write(re.sub(r\"\\\\u[0-9a-f]{4}\", lambda x: chr(int(\"0x\" + x.group(0)[2:], 16)).encode(\"utf-8\"), sys.stdin.read()))"'
\ | :set ft=javascript
\ | :1

" XML 文字格式化
command! XMLFormat :execute '%!xmllint --format -'

" 常用的文字替代
command! Br2line :execute '%s/<br>/---/g'
