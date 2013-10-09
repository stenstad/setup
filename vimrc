runtime bundle/vim-pathogen/autoload/pathogen.vim

" Enable filetype detection
filetype on
" Load plugin files for each filetype (.vim/after/ftplugin/*.vim)
filetype plugin on
" Load indent file for each filetype (.vim/after/indent/*.vim)
filetype plugin indent on

" Filetype overrides
au BufRead,BufNewFile Capfile set filetype=ruby
au BufRead,BufNewFile profile set filetype=sh
au BufRead,BufNewFile bigip.conf set filetype=tcl


"set ofu=syntaxcomplete#Complete

" sudo rewrite
ca w!! w !sudo tee >/dev/null "%"

" map CTRL-E to end-of-line (insert mode)
imap <C-e> <esc>$i<right>
" map CTRL-A to beginning-of-line (insert mode)
imap <C-a> <esc>1i

" Quick visual mode
imap <C-v> <esc>v

let g:EasyMotion_leader_key = '<Leader>'



syntax enable

" Load pathogen
call pathogen#infect()
call pathogen#helptags()

" Remove all unwanted whitespaces on save
autocmd BufWritePre * :%s/\r\+$//e " Windows newlines
autocmd BufWritePre * :%s/\s\+$//e

" Rebind <leader>
let mapleader = ","
let g:EasyMotion_leader_key = '<Leader>'
nmap ; :CtrlPBuffer<CR>

" Turn on line numbers
" set relativenumber

" Indent the next line similiar to current line
set autoindent
" Use same indentation characters as current line
set copyindent
" Use spaces instead of tabs for indentation
set expandtab
" Use 4 spaces for indentation
set shiftwidth=4
" Round all indentations to multiple of shiftwidth
set shiftround
" Set tabs to be equivalent to 4 spaces (fixes retab)
set tabstop=4

" Long lines handling
set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=80,100

" Display ruler with current possition
set ruler

" Display statusline
set laststatus=2

" Set how many lines that should be displayed above/under cursor
set scrolloff=7

" Show hidden unwanted characters
set list
set listchars=tab:►\ ,trail:·,nbsp:□

" Hightlight paired brackets
set showmatch

" Highlight all matches for a search
set hlsearch
" Search as you type
set incsearch
" Replace all occurences on each line
set gdefault
" Only search case sensitive if a letter is uppercase
set ignorecase
set smartcase

" Increase history and amount of undos to 1000
set history=1000
set undolevels=1000

" Create undo files
"set undofile

" Don't create backup or swap files
set nobackup
set noswapfile

" Enable wildmenu (inline file explorer in command line)
set wildmenu
set wildmode=list:longest,full

" Update window title with path to open file
set title

" Adjust bells to avoid sound, visual only
set visualbell
set noerrorbells

" Map shift+h/shift+l for navigate between tabs
map <S-h> gT
map <S-l> gt

" Allow opening of more files in tabs with -p
set tabpagemax=50

" Replace a word with last yanked text
nmap <leader>r "_diwP

" Toggle line numbers on/off
map <leader>l :call ToggleLineNumberingStyle()<CR>
function! ToggleLineNumberingStyle()
    if &number
        set relativenumber
    else
        set number
    endif
endfunction

" Toggle paste mode
map <leader>p :set invpaste<CR>

" Configure solarized to 256 color terminal with dark backgoun
"set background=dark
set t_Co=256
let g:solarized_termcolors=256
let g:solarized_contrast="high"
colorscheme railscast

set nocompatible
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
let g:neocomplcache_enable_at_startup = 1

"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Enable heavy features.
" Use camel case completion.
"let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
"let g:neocomplcache_enable_underbar_completion = 1

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  "return neocomplcache#smart_close_popup() . "\<CR>"
  " For no inserting <CR> key.
  return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplcache#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplcache#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplcache#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplcache#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplcache_enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplcache_enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplcache_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

" Neosnippets

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'


