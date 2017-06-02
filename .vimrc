"########################################
"#
"# dein.vim
"#
"# win       : ~\vimfiles\bundles\repos\github.com\Shougo\dein.vim
"# mac, other: ~/.vim/bundles/repos/github.com/Shougo/dein.vim
"#
"########################################
if has('win32')
  let s:plugin_base=expand('~\vimfiles\bundles')
  let s:dein_dir=s:plugin_base.'\repos\github.com\Shougo\dein.vim'
else
  let s:plugin_base=expand('~/.vim/bundles')
  let s:dein_dir=s:plugin_base.'/repos/github.com/Shougo/dein.vim'
endif

if &compatible
  set nocompatible
endif
execute 'set runtimepath+='.s:dein_dir

if dein#load_state(s:plugin_base)
  call dein#begin(s:plugin_base)

  call dein#add(s:dein_dir)
  call dein#add('Shougo/unite.vim')
  call dein#add('Shougo/vimfiler.vim')
  call dein#add('Shougo/neocomplete.vim')
  call dein#add('itchyny/lightline.vim')
  call dein#add('kannokanno/previm')
  call dein#add('tyru/open-browser.vim')
  call dein#add('tomasr/molokai')

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

if dein#check_install()
  call dein#install()
endif

"########################################
"#
"# vim設定
"#
"########################################

"インデント設定
set cindent
set autoindent

"表示設定
syntax on
set number
set cursorline
set guioptions-=T
set guioptions-=m
set laststatus=2

"タブ設定
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

"改行コード、文字コード設定
set encoding=utf-8

"不要なファイルの生成抑止
set noundofile
set nobackup

" 自動折り返し無効化
set textwidth=0
autocmd FileType text setlocal textwidth=0

"<C-@>誤爆防止
inoremap <C-@> <Esc>

"タブ切り替え
noremap <C-n> gt
noremap <C-p> gT

"カレントディレクトリ変更
autocmd BufRead * lcd %:h

"カラースキーム
colorscheme molokai

"########################################
"#
"# plugin設定
"#
"########################################
"VimFiler
noremap <C-e> :VimFilerExplorer<CR>

"previm
autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
let g:previm_open_cmd=''

"neocomplete
"Note: This option must be set in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
