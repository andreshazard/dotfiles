" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
"Plugin 'git://git.wincent.com/command-t.git'
Plugin 'mileszs/ack.vim'
Plugin 'tpope/vim-surround'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'scrooloose/syntastic'
Plugin 'davidhalter/jedi-vim'
Plugin 'nvie/vim-flake8'
Plugin 'mhinz/vim-janah'
Plugin 'rstacruz/sparkup'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'mrtazz/simplenote.vim'
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

set nocompatible "To have all improvements from VI

filetype plugin on "To detect the type of file that is edited
filetype plugin indent on
runtime macros/matchit.vim

execute pathogen#infect()
syntax on


set pastetoggle=<f5> "for better pasting from clipboard
set rnu "Relative number

set smartindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

set nowrap
set number
set nowritebackup
set nobackup
set ignorecase
nmap <silent> <C-N> :silent noh<CR>

" Highlight search terms...
set hlsearch
set incsearch

set smartcase
set autoindent
set novb
set showcmd

" Intuitive backspacing in insert mode
set backspace=indent,eol,start

syntax enable

" disabled autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete

" To not use arrows
ino <down> <nop>
ino <left> <nop>
ino <right> <nop>
ino <up> <nop>
vno <down> <nop>
vno <left> <nop>
vno <right> <nop>
vno <up> <nop>

"Easy escape
inoremap jk <esc>
"Disable <esc> to force jk mapping

"For when I make mistakes
cmap W w
cmap Q q

"leader
let mapleader=","

"Copy and past from the clipboard
vmap <leader>y "+y
nmap <leader>p "+p

"Edit file on current directory
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>e :edit %%
map <leader>v :vsp %%

"Open Command T
let g:CommandTCursorStartMap='<leader>f'
noremap <leader>f :CommandTFlush<cr>\|:CommandT<cr>

" Jump to last cursor position unless it's invalid or in an event handler
autocmd BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\   exe "normal g`\"" |
\ endif

"This unsets the last search pattern register by hitting return
nnoremap <CR> :noh<CR><CR>

" Move around splits with <c-hjkl>
nnoremap <silent><C-J> <C-W><C-J>:call SplitResize()<CR>
nnoremap <silent><C-K> <C-W><C-K>:call SplitResize()<CR>
nnoremap <silent><C-L> <C-W><C-L>:call SplitResize()<CR>
nnoremap <silent><C-H> <C-W><C-H>:call SplitResize()<CR>

" Loation of splits
set splitright
set splitbelow


"NEOCOMPLCACHE SETTINGS for jedi-vim
let g:neocomplcache_enable_at_startup = 1
imap neosnippet#expandable() ? "(neosnippet_expand_or_jump)" : pumvisible() ? "" : "" - See more at: http://fromacoder.com/the-ultimate-python-autocompletion-for-vim/#sthash.UkvqQmZl.dpuf
smap neosnippet#expandable() ? "(neosnippet_expand_or_jump)" : - See more at: http://fromacoder.com/the-ultimate-python-autocompletion-for-vim/#sthash.UkvqQmZl.dpuf
let g:neocomplcache_force_overwrite_completefunc = 1
if !exists('g:neocomplcache_omni_functions')
  let g:neocomplcache_omni_functions = {}
  endif
  if !exists('g:neocomplcache_force_omni_patterns')
    let g:neocomplcache_force_omni_patterns = {}
    endif
    let g:neocomplcache_force_overwrite_completefunc = 1
    let g:neocomplcache_force_omni_patterns['python'] = '[^. t].w*'
    set ofu=syntaxcomplete#Complete
    au FileType python set omnifunc=pythoncomplete#Complete
    au FileType python let b:did_ftplugin = 1
    " Vim-jedi settings
    "let g:jedi#popup_on_dot = 0

"Enhance of adition and substraction
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

"Configuration for Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['pep8']
let g:syntastic_mode_map = { 'mode': 'active',
    \ 'active_filetypes': ['py'],
    \ 'pasive_filetyes': ['javac'] }

let g:syntastic_python_pep8_args='--ignore=E501,E127,E128'
"Hack because syntasttic_mode_map is not working to ignore java files
let g:loaded_syntastic_java_javac_checker = 1

"Awesome color scheme
autocmd ColorScheme janah highlight Normal ctermbg=235
colorscheme janah


"Resize splits automatically
if !exists("*SplitResize")
    function SplitResize()
        let hmax = max([winwidth(0), float2nr(&columns*0.66), 90])
        let vmax = max([winheight(0), float2nr(&lines*0.66), 25])
        exe "vertical resize" . (min([hmax, 140]))
        exe "resize" . (min([vmax, 60]))
    endfunction
endif



"Open simplenote on vertical window
let g:SimplenoteVertical=1

"Basic Maps
nnoremap - ddp
nnoremap _ ddkP

"Tranform word to uppercase
inoremap <c-u> <esc>viwUA

"Edit vimrc on a vertical split
nnoremap <leader>ev :vsplit $MYVIMRC<CR>

"Source vimrc
nnoremap <leader>sv :source $MYVIMRC<CR>

"fix training typo
iabbrev traning training

"Highlight current line when using rnu
highlight CursorLineNr ctermbg=LightBlue ctermfg=Black
