"PLUGIN-setting {{{
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-fugitive'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'nvie/vim-flake8'
Plugin 'davidhalter/jedi-vim'
Plugin 'altercation/vim-colors-solarized.git'
Plugin 'NLKNguyen/copy-cut-paste.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'leafgarland/typescript-vim'
Plugin 'MaxMEllon/vim-jsx-pretty'
Plugin 'jparise/vim-graphql'
Plugin 'prettier/vim-prettier'
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
"}}}

"BASIC-setting {{{
syntax enable
set nocompatible "To have all improvements from VI
set pastetoggle=<f5> "for better pasting from clipboard
set rnu "Relative number

set background=light
"colorscheme solarized

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
set nohlsearch
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

" Flake8
let g:syntastic_python_flake8_args='--ignore=E501'
autocmd BufWritePost *.py call flake8#Flake8()
hi QuickFixLine cterm=bold gui=bold ctermfg=NONE ctermbg=226 guifg=NONE guibg=NONE

" JediVim
let g:jedi#auto_initialization = 1
let g:jedi#popup_on_dot = 1

"clean search when sourcing
noh
"}}}

" FILETYPE-testific settings {{{
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
hi StatusLine ctermbg=white ctermfg=red
highlight Pmenu ctermbg=white guibg=red

"aireline theme
"let g:airline_theme='badwolf'

"ctrlp settings
let g:ctrlp_match_window='button,order:ttb,min:1,max:20,results:20'
let g:ctrlp_custom_ignore='node_modules\|DS_Store\|git'

"Configuration for Syntastic
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
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

"{{{ Cycle through relativenumber + number, number (only), and no numbering.
if !exists("*Cycle_Numbering")
  function! Cycle_Numbering() abort
    if exists('+relativenumber')
      execute {
            \ '00': 'set relativenumber   | set number',
            \ '01': 'set norelativenumber | set number',
            \ '10': 'set norelativenumber | set nonumber',
            \ '11': 'set norelativenumber | set number' }[&number . &relativenumber]
    else
      " No relative numbering, just toggle numbers on and off.
      set number!
    endif
  endfunction
endif
"}}}

" MAPPINGS {{{

"Open simplenote on vertical window
let g:SimplenoteVertical=1

"leader
let mapleader=","
let maplocalleader="\\"

"Basic Maps
nnoremap - ddp
nnoremap _ ddkP

"Tranform word to uppercase
inoremap <c-u> <esc>viwUE

"Edit vimrc on a vertical split
nnoremap <leader>ev :vsplit $MYVIMRC<CR>

"Source vimrc
nnoremap <leader>sv :source $MYVIMRC<CR>

"fix trailing white space
nnoremap <leader>w :FixWhitespace<CR>

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

"Syntastic
nnoremap <leader>sr :SyntasticReset<CR>

"This unsets the last search pattern register by hitting return
"nnoremap <CR> :noh<CR>

" Move around splits with <c-hjkl>
nnoremap <silent><C-J> <C-W><C-J>:call SplitResize()<CR>
nnoremap <silent><C-K> <C-W><C-K>:call SplitResize()<CR>
nnoremap <silent><C-L> <C-W><C-L>:call SplitResize()<CR>
nnoremap <silent><C-H> <C-W><C-H>:call SplitResize()<CR>

"sudo to write
cmap w!! w !sudo tee % >/dev/null

"switch relative number
nnoremap <leader>nn :call Cycle_Numbering()<CR>

"Use tab and shift-tab to cycle through Splits.
nnoremap <Tab> <C-W>w
nnoremap <S-Tab> <C-W>W

"Add blank line below
nnoremap [a o<esc>k

"Add blank line above
nnoremap [A O<esc>j

"Don't use <c-i> as tab
nnoremap <C-I> <C-I>

"CtrlP on Buffer
nnoremap <leader>b :CtrlPBuffer<CR>

"Run Test
nnoremap <leader>t :w <CR> :!clear & python3 -m pytest -v % <CR>
nnoremap <leader>dt :w <CR> yiw :!clear & python3 -m pytest -s -v % -k <C-r>0 <CR>
nnoremap <leader><leader> :!!<CR>

"}}}

" SWITCH BETWEEN TEST AND PRODUCTION CODE {{{
function! OpenTestAlternate()
  let new_file = AlternateForCurrentFile()
  exec ':e ' . new_file
endfunction
function! AlternateForCurrentFile()
  let current_file = expand("%")
  let new_file = current_file
  let in_test = match(current_file, '^tests/') != -1
  let going_to_test = !in_test
  let in_src = match(current_file, '\<blueprints\>') != -1 || match(current_file, '\<models\>') != -1 || match(current_file, '\<commons\>') != -1  || match(current_file, '\<services\>') != -1
  if going_to_test
    if in_src
      let new_file = substitute(new_file, '^src/', '', '')
    end
    let new_file = substitute(new_file, expand("%:t"), "test_" . expand("%:t"), "")
    let new_file = 'tests/' . new_file
  else
    let new_file = substitute(new_file, 'test_', '', '')
    let new_file = substitute(new_file, '^tests/', 'src/', '')
  endif
  return new_file
endfunction
nnoremap <leader>. :call OpenTestAlternate()<cr>
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

