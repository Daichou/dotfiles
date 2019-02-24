if $SHELL =~ 'bin/fish'
    set shell=/bin/bash
endif
set nocompatible               " be iMproved
filetype off                   " required!
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Bundles
Bundle 'tomtom/tlib_vim'
Bundle 'marcweber/vim-addon-mw-utils'
Bundle 'garbas/vim-snipmate'
"Bundle 'othree/vim-autocomplpop'
"Bundle 'ervandew/supertab'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}
Bundle 'Shougo/neocomplcache.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'airblade/vim-gitgutter'
Bundle 'guns/xterm-color-table.vim'
"Bundle 'Twinside/vim-cuteErrorMarker'
Bundle 'ntpeters/vim-better-whitespace'
"Bundle 'Yggdroot/indentLine'
Bundle 'eparreno/vim-l9'
Bundle 'elzr/vim-json'
"Plugin 'scrooloose/syntastic'
"Bundle 'valloric/YouCompleteMe'
Bundle 'majutsushi/tagbar'
Plugin 'honza/vim-snippets'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'JamshedVesuna/vim-markdown-preview'
Bundle 'joonty/vim-phpqa.git'
Plugin 'nvie/vim-flake8'
call vundle#end()

set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:ycm_global_ycm_extra_conf = '/home/tommycc/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

"suntastic
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 1
"let g:syntastic_cpp_compiler = 'g++'
"let g:syntastic_cpp_compiler_options = ' -std=c++14 '
"let g:syntastic_c_compiler = 'gcc'
"let g:syntastic_c_compiler_options = ' -ansi'
"let g:syntastic_javascript_checkers = ['standard']
"let g:syntastic_javascript_standard_generic = 1
"let g:syntastic_javascript_checkers = ['eslint']
"let g:syntastic_javascript_eslint_exec = 'eslint'
"let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']
"let g:syntastic_php_phpcs_args='--tab-width=&tabstop'
let g:ycm_show_diagnostics_ui = 1
"let g:syntastic_python_checkers = ['pylint']
"let g:syntastic_python_exec = 'python'
"let g:syntastic_python_args = ['-m', 'py_compile']
filetype plugin indent on
"autocmd filetype python let g:syntastic_always_populate_loc_list = 0
"autocmd filetype python let g:syntastic_auto_loc_list = 0
"autocmd filetype python let g:syntastic_check_on_open = 0
"autocmd filetype python let g:syntastic_check_on_wq = 0
"Basic Configs
set shiftwidth=4
set expandtab
set softtabstop=4
set laststatus=2
set noshowmode
set number
set modeline
set t_Co=256
set tabstop=4
set fileencodings=utf-8,big5
set cursorline
set clipboard=unnamed
set clipboard=unnamedplus
"set mouse=a
syntax on
autocmd filetype python nnoremap <F9> :w <bar> exec '!python '.shellescape('%')<CR>
autocmd filetype c nnoremap <F9> :w <bar> exec '!clear&&gcc '.shellescape('%').' -o '.shellescape('%:r').'&&./'.shellescape('%:r')<CR> 
autocmd filetype cpp nnoremap <F9> :w <bar> exec '!clear;echo -n "====================";TEMP=`mktemp`;script $TEMP -e -q -c "g++ '.shellescape('%').' -std=c++14 -Wall -o '.shellescape('%:r').'" > /dev/null 2>&1 ;if [ $? == 0 ] ;then echo -e "\r\033[32m********************\033[0m";./'.shellescape('%:r').';else echo -e "\r\033[31mXXXXXXXXXXXXXXXXX\033[0m";cat $TEMP; fi'<CR>
autocmd filetype c nnoremap <F8> :w <bar> exec '!clear&&gcc '.shellescape('%').' -o '.shellescape('%:r')<CR> 
autocmd filetype cpp nnoremap <F8> :w <bar> exec '!clear&&g++ '.shellescape('%').' -std=c++14 -Wall -o '.shellescape('%:r')<CR>
nnoremap <F10> :w <bar> exec '!cat '.shellescape('%').'\| xclip -selection clipboard'<CR>
nnoremap <F11> :w <bar> exec '!fish'<CR>


"Specific Configs

"theme
color Tomorrow-Night-Bright
colorscheme Tomorrow-Night-Bright

"neocomplcache
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_disableautocomplete = 1
let g:neocomplcache_enable_smart_case = 1
" Recommended key-mappings.
" <CR>: close popup and save indent.
let g:neocomplcache_enable_insert_char_pre = 1

"betterwhitspace
hi ExtraWhitespace ctermbg = 17

"indent-guide
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_auto_colors = 0
hi IndentGuidesOdd ctermbg = 235
hi IndentGuidesEven ctermbg = 233

"vim-json
let g:vim_json_syntax_conceal = 0

function! Sudowrite()
    w !sudo tee % > /dev/null
    edit!
endfunction
command W call Sudowrite()0
let Tlist_Compact_Format = 1
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Close_On_Select = 1
nnoremap <C-l> :TlistToggle<CR>

"tagbar
nmap <F12> :TagbarToggle<CR>           "toggle
let g:tagbar_ctags_bin='ctags'         "ctags程序的路径
let g:tagbar_width=25                  "窗口宽度的设置
map <F3> :Tagbar<CR>
autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx call tagbar#autoopen()

"flake8
let g:flake8_quickfix_location="topleft"
let g:flake8_quickfix_height=7
let g:flake8_show_quickfix=0  " don't show
let g:flake8_show_in_gutter=0  " don't show (default)
let g:flake8_show_in_file=0  " don't show (default)

"nerdtree
let NERDTreeWinPos='left'
let NERDTreeWinSize=30
map <F2> :NERDTreeToggle<CR>

map <F4> :GitGutterToggle<CR>

let s:hidden_all = 0
function! ToggleHiddenAll()
    if s:hidden_all  == 0
        let s:hidden_all = 1
        set noshowmode
        set noruler
        set laststatus=0
        set noshowcmd
        lclose
        let g:flake8_show_quickfix=0  " don't show
        let g:flake8_show_in_gutter=0  " don't show (default)
        let g:flake8_show_in_file=0  " don't show (default)
    else
        let s:hidden_all = 0
        set showmode
        set ruler
        set laststatus=2
        set showcmd
        lopen
        let g:flake8_show_quickfix=1   "show
        let g:flake8_show_in_gutter=1  "show
        let g:flake8_show_in_file=1    "show
    endif
endfunction

nnoremap <S-h> :call ToggleHiddenAll()<CR>

let g:phpqa_codesniffer_args = "--standard=PSR2"
let g:phpqa_codecoverage_autorun = 1

set rtp+=/usr/lib/python3.7/site-packages/powerline/bindings/vim

set tags=./tags,./TAGS,tags;~,TAGS;~

set cscopetag
set csto=0

if filereadable("cscope.out")
   cs add cscope.out
elseif $CSCOPE_DB != ""
    cs add $CSCOPE_DB
endif
set cscopeverbose

nmap zs :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap zg :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap zc :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap zt :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap ze :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap zf :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap zi :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap zd :cs find d <C-R>=expand("<cword>")<CR><CR>
