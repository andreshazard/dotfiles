"PLUGIN-setting {{{
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'scrooloose/syntastic'
Plugin 'davidhalter/jedi-vim'
Plugin 'nvie/vim-flake8'
Plugin 'andreshazard/vim-janah'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'mrtazz/simplenote.vim'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-airline/vim-airline'
Plugin 'andreshazard/vim-logreview'
Plugin 'andreshazard/vim-freemarker'
Plugin 'mattn/emmet-vim'
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


filetype plugin on "To detect the type of file that is edited
filetype plugin indent on
runtime macros/matchit.vim
execute pathogen#infect()
"}}}

"BASIC-setting {{{
syntax enable
set nocompatible "To have all improvements from VI
set pastetoggle=<f5> "for better pasting from clipboard
set rnu "Relative number

set smartindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

set wrap
set number
set nowritebackup
set nobackup
set ignorecase

" Highlight search terms...
set hlsearch
set incsearch

set smartcase
set autoindent
set novb
set showcmd

" Intuitive backspacing in insert mode
set backspace=indent,eol,start

" Loation of splits
set splitright
set splitbelow

"mouse resize
"set mouse=a
set ttyfast
set ttymouse=xterm2

"clean search when sourcing
noh
"}}}

" FILETYPE-specific settings {{{
augroup filetype_python
    autocmd FileType python nnoremap <buffer> <localleader>c I#<esc>
    autocmd FileType python :iabbrev <buffer> iff if:<left>
augroup END

augroup filetype_javascript
    autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType javascript nnoremap <buffer> <localleader>c I//<esc>
    autocmd FileType javascript :iabbrev <buffer> iff if ()<left><left>
augroup END

augroup filetype_markdown
    "add header option parameter
    autocmd FileType markdown onoremap ih :<c-u>execute "normal! ?^[==\|--]\\+$\r:nohlsearch\rkvg_"<cr>
augroup END

augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
    autocmd FileType vim setlocal foldlevelstart=0
augroup END
" }}}

" Jump to last cursor {{{
autocmd BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\   exe "normal g`\"" |
\ endif
"}}}

"Enhance of adition and substraction {{{
function! AddSubtract(char, back)
   let pattern = &nrformats =~ 'alpha' ? '[[:alpha:][:digit:]]' : '[[:digit:]]'
   call search(pattern, 'cw' . a:back)
   execute 'normal! ' . v:count1 . a:char
   silent! call repeat#set(":\<C-u>call AddSubtract('" .a:char. "', '" .a:back. "')\<CR>")
endfunction

nnoremap <silent>         <C-a> :<C-u>call AddSubtract("\<C-a>", '')<CR>
nnoremap <silent> <Leader><C-a> :<C-u>call AddSubtract("\<C-a>", 'b')<CR>
nnoremap <silent>         <C-x> :<C-u>call AddSubtract("\<C-x>", '')<CR>
nnoremap <silent> <Leader><C-x> :<C-u>call AddSubtract("\<C-x>", 'b')<CR>
"}}}

"STATUSLINE-setting {{{
"To always see status line
set laststatus=2

"aireline theme
let g:airline_theme='badwolf'

"Configuration for Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
"}}}

"Resize splits automatically {{{
if !exists("*SplitResize")
    function SplitResize()
        let hmax = max([winwidth(0), float2nr(&columns*0.66), 90])
        let vmax = max([winheight(0), float2nr(&lines*0.66), 25])
        exe "vertical resize" . (min([hmax, 140]))
        exe "resize" . (min([vmax, 60]))
    endfunction
endif
"}}}

"MAPPINGS {{{
"Open simplenote on vertical window
let g:SimplenoteVertical=1

"leader
let mapleader=","
let maplocalleader="\\"

"Basic Maps
nnoremap - ddp
nnoremap _ ddkP

"Tranform word to uppercase
inoremap <c-u> <esc>viwUA

"Edit vimrc on a vertical split
nnoremap <leader>ev :vsplit $MYVIMRC<CR>

"Source vimrc
nnoremap <leader>sv :source $MYVIMRC<CR>

"Open log files
nnoremap <leader>es :tabedit ~/TR/target/tomcat6x/logs/spark.log<CR>
nnoremap <leader>ec :tabedit ~/TR/target/catalina.out<CR>

"fix trailing white space
nnoremap <leader>w :FixWhitespace<CR>

"run line as a Ex Command, to study vimscripting
nnoremap <leader>rc v$hyq:p<cr>

"fix training typo
iabbrev traning training

"Copy and past from the clipboard
vnoremap <leader>y "+y
nnoremap <leader>p "+p

"Easy escape
inoremap jk <esc>

"For when I make mistakes
cnoremap W w
cnoremap Q q

"Begin and end of the line easier
nnoremap H ^
nnoremap L g_
vnoremap H ^
vnoremap L g_

"Center screen when searching
nnoremap n nzzzv
nnoremap N Nzzzv

"easy fold
nnoremap <space> za

"Edit file on current directory
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>e :edit %%
map <leader>v :vsp %%

"Open Command T
let g:CommandTCursorStartMap='<leader>f'
nnoremap <leader>f :CommandTFlush<cr>\|:CommandT<cr>

"This unsets the last search pattern register by hitting return
nnoremap <CR> :noh<CR><CR>

" Move around splits with <c-hjkl>
nnoremap <silent><C-J> <C-W><C-J>:call SplitResize()<CR>
nnoremap <silent><C-K> <C-W><C-K>:call SplitResize()<CR>
nnoremap <silent><C-L> <C-W><C-L>:call SplitResize()<CR>
nnoremap <silent><C-H> <C-W><C-H>:call SplitResize()<CR>

"sudo to write
cmap w!! w !sudo tee % >/dev/null

"FTL plugin mappings
"nmap <leader>fl <Plug>FTLList
"nmap <leader>fb <Plug>FTLBigList
"nmap <leader>fi <Plug>FTLIf
"nmap <leader>fs <Plug>FTLSwitch
"nmap <leader>fa <Plug>FTLAssign

"Log Review Plugin
nnoremap <leader>bf :call FoldStackBelow()<CR>

"switch relative number
nnoremap <leader>nn :call mappings#numbers#cycle_numbering()<CR>

"switch transparency
nnoremap <leader>tt :call mappings#numbers#cycle_transparent()<CR>

"Use tab and shift-tab to cycle through Splits.
nnoremap <Tab> <C-W>w
nnoremap <S-Tab> <C-W>W

"Add blank line below
nnoremap [a o<esc>k

"Add blank line above
nnoremap [A O<esc>j


"}}}

"Awesome color scheme {{{
autocmd ColorScheme janah highlight Normal ctermbg=235
colorscheme janah
"Make background transperent
hi Normal guibg=NONE ctermbg=NONE
"}}}

" Indent if we're at the beginning of a line. Else, do completion. {{{
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <expr> <tab> InsertTabWrapper()
inoremap <s-tab> <c-n>
"}}}
"

