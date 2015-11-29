if $SHELL =~ 'bin/fish'
    set shell=/bin/bash
endif
set nocompatible               " be iMproved
filetype off                   " required!
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Bundles
Bundle 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}
Bundle 'tomtom/tlib_vim'
Bundle 'marcweber/vim-addon-mw-utils'
"Bundle 'garbas/vim-snipmate'
"Bundle 'othree/vim-autocomplpop'
Bundle 'Shougo/neocomplcache.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'airblade/vim-gitgutter'
"Bundle 'ervandew/supertab'
Bundle 'guns/xterm-color-table.vim'
Bundle 'Twinside/vim-cuteErrorMarker'
Bundle 'ntpeters/vim-better-whitespace'
Bundle 'Yggdroot/indentLine'
Bundle 'eparreno/vim-l9'
Bundle 'elzr/vim-json'
"Bundle 'nathanaelkane/vim-indent-guides'
call vundle#end()
filetype plugin indent on

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
syntax on
autocmd filetype python nnoremap <F9> :w <bar> exec '!python '.shellescape('%')<CR>
autocmd filetype c nnoremap <F9> :w <bar> exec '!clear&&gcc '.shellescape('%').' -o '.shellescape('%:r').'&&./'.shellescape('%:r')<CR> 
autocmd filetype cpp nnoremap <F9> :w <bar> exec '!clear;echo -n "====================";TEMP=`mktemp`;script $TEMP -e -q -c "g++ '.shellescape('%').' -std=c++11 -Wall -o '.shellescape('%:r').'" > /dev/null 2>&1 ;if [ $? == 0 ] ;then echo -e "\r\033[32m********************\033[0m";./'.shellescape('%:r').';else echo -e "\r\033[31mXXXXXXXXXXXXXXXXX\033[0m";cat $TEMP; fi'<CR>
autocmd filetype c nnoremap <F8> :w <bar> exec '!clear&&gcc '.shellescape('%').' -o '.shellescape('%:r')<CR> 
autocmd filetype cpp nnoremap <F8> :w <bar> exec '!clear&&g++ '.shellescape('%').' -std=c++11 -Wall -o '.shellescape('%:r')<CR>
nnoremap <F10> :w <bar> exec '!cat '.shellescape('%').'\| xclip -selection clipboard'<CR>
nnoremap <F11> :w <bar> exec '!fish'<CR>


"Specific Configs

"theme
color inkpot
colorscheme inkpot

"neocomplcache
let g:neocomplcache_enable_at_startup = 1
"let g:neocomplcache_disableautocomplete = 1
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
