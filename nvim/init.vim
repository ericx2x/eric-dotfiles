"execute any changes to this file with the command below
":so %
set nocompatible               " be iMproved

filetype off                   " required!
call plug#begin()

"Plug 'git@github.com:moll/vim-node.git'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'f-person/git-blame.nvim'
Plug 'neoclide/coc-eslint'
Plug 'neoclide/coc-tsserver'
Plug 'morhetz/gruvbox'
Plug 'rust-lang/rust.vim'
Plug 'catppuccin/nvim', {'as': 'catppuccin'}
Plug 'ellisonleao/gruvbox.nvim'
Plug 'posva/vim-vue'
Plug 'racer-rust/vim-racer'
"Plug 'rcticicestudio/nord-vim'
"Plug 'git@github.com:ajh17/VimCompletesMe.git'
"Plug 'lyuts/vim-rtags'
Plug 'leafgarland/typescript-vim'


Plug 'easymotion/vim-easymotion'
Plug 'vim-scripts/Indent-Guides'
Plug 'preservim/nerdtree'
"Plug 'cscope.vim'
Plug 'bogado/file-line'
Plug 'tpope/vim-repeat'
Plug 'godlygeek/tabular'
"Plug 'yaifa.vim'

" github Plugs
"Plug 'Lokaltog/vim-powerline'
"Plug 'Shougo/neocomplcache'
"Plug 'Shougo/neosnippet'
"Plug 'vim-scripts/JavaScript-Indent'
"Plug 'Valloric/YouCompleteMe'
Plug 'airblade/vim-gitgutter'
Plug 'bling/vim-airline'
Plug 'corntrace/bufexplorer'
"Plug 'docker/docker' , {'rtp': '/contrib/syntax/vim/'}
Plug 'kien/ctrlp.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'ggreer/the_silver_searcher'
Plug 'BurntSushi/ripgrep'
"Plug 'rking/ag.vim'
"Plug 'git@github.com:albfan/ag.vim.git' "makes searching at the root enable for whatever reason
Plug 'airblade/vim-rooter'
"Plug 'marijnh/tern_for_vim'
Plug 'mattn/gist-vim'
Plug 'mattn/webapi-vim'
Plug 'mileszs/ack.vim'
Plug 'mustache/vim-mustache-handlebars'
"Plug 'ntpeters/vim-better-whitespace'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'branch': 'release/0.x'
  \ }
"Plug 'chemzqm/vim-jsx-improve'
"Plug 'pangloss/vim-javascript'
"Plug 'Emigre/vim-javascript'
"Plug 'Emigre/vim-jsx'
Plug 'reinh/vim-makegreen'
Plug 'rizzatti/dash.vim'
Plug 'rizzatti/funcoo.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/syntastic'
Plug 'plasticboy/vim-markdown'
Plug 'tpope/vim-surround'
"Themes
Plug 'vim-scripts/Colour-Sampler-Pack'
"Plug 'sjl/badwolf'
Plug 'dracula/vim',{ 'name': 'dracula' }
Plug 'chriskempson/base16-vim'
"Plug 'ParamagicDev/vim-medic_chalk'
"base16-default-dark
Plug 'vim-scripts/Liquid-Carbon'
Plug 'mhartington/oceanic-next'
Plug 'altercation/vim-colors-solarized'
Plug 'NLKNguyen/papercolor-theme'
"end themes
"Plug 'wincent/Command-T'
Plug 'yaroot/vissort'
Plug 'tfnico/vim-gradle'
Plug 'shime/vim-livedown'
Plug 'heavenshell/vim-jsdoc'
"Plug 'xolox/vim-session'"didn't work?
Plug 'Yggdroot/indentLine'
"Plug 'myusuf3/numbers.vim'
Plug 'bfrg/vim-cpp-modern'
if executable('ctags')
  Plug 'majutsushi/tagbar'
endif

call plug#end()            " required
"filetype plugin indent on     " required!

" General {
filetype plugin indent on   " Automatically detect file types.
syntax on                   " syntax highlighting
set mouse=a                 " automatically enable mouse usage
scriptencoding utf-8
autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif
" always switch to the current file directory.

"set autowrite                  " automatically write a file when leaving a modified buffer
"set shortmess+=filmnrxoOtT      " abbrev. of messages (avoids 'hit enter')
"set viewoptions=folds,options,cursor,unix,slash " better unix / windows compatibility
"set virtualedit=onemore         " allow for cursor beyond last character
set history=5000                " Store a ton of history (default is 20)
set nospell                       " spell checking off
set hidden                      " allow buffer switching without saving

" Setting up the directories {
set backup                      " backups are nice ...
if has('persistent_undo')
  set undofile                "so is persistent undo ...
  set undolevels=1000         "maximum number of changes that can be undone
  set undoreload=10000        "maximum number lines to save for undo on a buffer reload
endif
" Could use * rather than *.*, but I prefer to leave .files unsaved
au BufWinLeave *.* silent! mkview  "make vim save view (state) (folds, cursor, etc)
au BufWinEnter *.* silent! loadview "make vim load view (state) (folds, cursor, etc)
" }
" }

" Vim UI {
"set t_Co-256 "this may or maynot be needed for certain color sschemes.
set background=dark         " Assume a dark background
colorscheme catppuccin       " load a colorscheme
"set termguicolors
set tabpagemax=15               " only show 15 tabs
set showmode                    " display the current mode
set number                       "show line numbers
set nocursorline                  " highlight current line
"let g:indentLine_setConceal = 0
"make cursor line change depending on insert mode or not
"autocmd InsertEnter,InsertLeave * set cul!


"cursor crosshairs
":set cursorcolumn


if has('cmdline_info')
  set ruler                   " show the ruler
  set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " a ruler on steroids
  set showcmd                 " show partial commands in status line and
  " selected characters/lines in visual mode
endif

if has('statusline')
  set laststatus=2

  " Broken down into easily includeable segments
  set statusline=%<%f\    " Filename
  set statusline+=%w%h%m%r " Options
  set statusline+=\ [%{&ff}/%Y]            " filetype
  set statusline+=\ [%{getcwd()}]          " current dir
  set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
endif

set backspace=indent,eol,start  " backspace for dummies
set linespace=0                 " No extra spaces between rows
set nu                          " Line numbers on
set showmatch                   " show matching brackets/parenthesis
set incsearch                   " find as you type search
set hlsearch                    " highlight search terms
set winminheight=0              " windows can be 0 line high
set ignorecase                  " case insensitive search
set smartcase                   " case sensitive when uc present
set wildmenu                    " show list instead of just completing
set wildmode=list:longest,full  " command <Tab> completion, list matches, then longest common part, then all.
set whichwrap=b,s,h,l,<,>,[,]   " backspace and cursor keys wrap to
set scrolljump=5                " lines to scroll when cursor leaves screen
set scrolloff=3                 " minimum lines to keep above and below cursor
set foldenable                  " auto fold code
set nolist                      " write ':set nolist' to remove annoying dollar signs
"set listchars=tab:,.,trail:.,extends:#,nbsp:. " Highlight problematic whitespace   

" }
" Use '' to copy to clipboard much more reliably than "+y
vmap '' :w !pbcopy<CR><CR>

" Formatting {
set wrap
"set colorcolumn=80              " show margin at 80
set tabstop=8                   " an indentation every 4 columns
set softtabstop=2               " let backspace delete indent
set shiftwidth=2                " use indents of 4 spaces
set expandtab                   " spaces and not tabs

" Remove trailing whitespaces and ^M chars
" autocmd BufWritePre  *.{cpp,h,c,conf,restdown,md,java,js,python,twig,xml,yml,rb,py,pm,pl,md,etc}  call StripTrailingWhite()
"autocmd BufWritePre  *.* call StripTrailingWhite()

"function! StripTrailingWhite()
"let l:winview = winsaveview() silent! %s/\s\+$//
"call winrestview(l:winview)
"endfunction

"set lines?
"set columns?
"turn off the bell
set noeb vb t_vb=

" Enable paste togle
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode
" copy a highlighted portion to eh paste buffer
"command -range Copy silent '<,'>w ! pbcopy
" }


" Key (re)Mappings {

"The default leader is '\', but many people prefer ',' as it's in a standard
"location. I presonally prefer spacebar
"nnoremap <SPACE> <Nop>
let mapleader = "\<Space>"
noremap <leader>s :w<cr>

" Making it so ; works like : for commands. Saves typing and eliminates :W style typos due to lazy holding shift.
"nnoremap ; :
" Change my :wq habbits so I dont quickly quit out without thinking about session
"nnoremap : {
"nnoremap { :

" Easier moving in tabs and windows
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
map <C-L> <C-W>l<C-W>_
map <C-H> <C-W>h<C-W>_

" Wrapped lines goes down/up to next row, rather than next line in file.
nnoremap j gj
nnoremap k gk

" Switch between buffers faster
"nnoremap <silent> [ :bp<CR>
"nnoremap <silent> ]] :bn<CR>
"map <C-K> :bnext<CR>
"map <C-J> :bprev<CR>
nnoremap <C-k> 3<C-u>
nnoremap <C-j> 3<C-d>
nnoremap 9 3<C-u>
nnoremap 8 3<C-d>
nnoremap <C-u> 9<C-u>
nnoremap <C-d> 9<C-d>
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

" Yank from the cursor to the end of the line, to be consistent with C and D.
nnoremap Y y$

"paste without yanking (necessary to press p without grabbing text you dont want!)
vnoremap p "_dP

" paste fast leader key remap
nmap <leader>p "+p

"clearing highlighted search
nmap <silent> <leader>/ :nohlsearch<CR>

"delete with copying to vim clipboard
nmap x "_d

"ented to make newlines from normal mode
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>
" Shortcuts
" Change Working Directory to that of the current file
cmap cwd lcd %:p:h
cmap cd. lcd %:p:h

" visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv
" For when you forget to sudo.. Really Write the file.
"cmap w!! w !sudo tee % >/dev/null

" Some helpers to edit mode
" http://vimcasts.org/e/14

"noremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>;w :e %%
map <leader>;s :sp %%
map <leader>;v :vsp %%
"map <leader>;t :tabe %%" don't seem to need these typeof tabs because tab key remaps to move buffers and tab shows at top plugin takes over

" Adjust viewports to the same size
map <Leader>= <C-w>=
" }

" Plugins {
" Buffer explorer {
nmap <leader><Tab> :BufExplorer<CR>
" }

" airline {
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#buffer_idx_mode = 1
"nmap <leader>1 <Plug>AirlineSelectTab1
"nmap <leader>2 <Plug>AirlineSelectTab2
"nmap <leader>3 <Plug>AirlineSelectTab3
"nmap <leader>4 <Plug>AirlineSelectTab4
"nmap <leader>5 <Plug>AirlineSelectTab5
"nmap <leader>6 <Plug>AirlineSelectTab6
"nmap <leader>7 <Plug>AirlineSelectTab7
"nmap <leader>8 <Plug>AirlineSelectTab8
"nmap <leader>9 <Plug>AirlineSelectTab9
"let g:airline#extensions#tabline#show_buffers = 1
" }

" gist-vim {
let g:gist_clip_command = 'pbcopy'
" }

" vim-livedown {
nmap <leader>m :LivedownPreview<CR>
" }

" vim-markdown {
" disable folding
let g:vim_markdown_folding_disabled=1
" }

" NerdTree {
let NERDTreeMapToggleHidden=1
noremap <C-e> :NERDTreeToggle<CR>:NERDTreeMirror<CR>
noremap <leader>e :NERDTreeFind<CR>
"to refresh just hit 'r' while nerdtree is active
nmap <leader>nt :NERDTreeFind<CR>

let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1
" }
" nerdtree open directory of current file
autocmd BufEnter * lcd %:p:h
" Ack (The Silver Searcher) {
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
  " bind K to grep word under cursor
  nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
  "command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
  nnoremap \ :Ag<SPACE>
endif

"function! Ag(args) abort
"execute "silent! grep!" shellescape(a:args)
"cwindow
"redraw!
"endfunction

"command -nargs=+ -complete=file Ag call Ag(<q-args>)
" }

" syntastic settings {
"
"let g:syntastic_check_on_open=1
"let js_syn_checkers = []
"if (findfile('.eslintrc', '.;') != '')
"    call add(js_syn_checkers, 'eslint')
"endif
"if (findfile('.jscsrc', '.;') != '')
"    call add(js_syn_checkers, 'jscs')
"endif

"let g:syntastic_javascript_checkers = js_syn_checkers
"let g:syntastic_javascript_checkers = ['eslint', 'jscs']
"let g:syntastic_auto_loc_list=1
" }

" Ctags {
set tags=./tags;/,~/.vimtags
" }

" TagBar {
"nnoremap <silent> <leader>tt :TagbarToggle<CR>
"}

" Vim Indent Guides {
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4
"}
" Vim Better Whitespace {
"autocmd FileType * autocmd BufWritePre <buffer> StripWhitespace

" }

" OmniComplete {
if has("autocmd") && exists("+omnifunc")
  autocmd Filetype *
        \if &omnifunc == "" |
        \setlocal omnifunc=syntaxcomplete#Complete |
        \endif
endif

hi Pmenu  guifg=#000000 guibg=#F8F8F8 ctermfg=black ctermbg=Lightgray
hi PmenuSbar  guifg=#8A95A7 guibg=#F8F8F8 gui=NONE ctermfg=darkcyan ctermbg=lightgray cterm=NONE
hi PmenuThumb  guifg=#F8F8F8 guibg=#8A95A7 gui=NONE ctermfg=lightgray ctermbg=darkcyan cterm=NONE

" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menu,preview,longest
" }
" javascript.vim {
"set compiler=nodeunit
" }

"" neocomplcache {
"let g:neocomplcache_enable_at_startup = 1
"let g:neocomplcache_enable_camel_case_completion = 1
"let g:neocomplcache_enable_smart_case = 1
"let g:neocomplcache_enable_underbar_completion = 1
"let g:neocomplcache_min_syntax_length = 3
"let g:neocomplcache_enable_auto_delimiter = 1

"" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 0

"" SuperTab like snippets behavior.
"imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

"" Plugin key-mappings.
"imap <C-k>     <Plug>(neocomplcache_snippets_expand)
"smap <C-k>     <Plug>(neocomplcache_snippets_expand)
"inoremap <expr><C-g>     neocomplcache#undo_completion()
"inoremap <expr><C-l>     neocomplcache#complete_common_string()


"" <CR>: close popup
"" <s-CR>: close popup and save indent.
"inoremap <expr><CR>  pumvisible() ? neocomplcache#close_popup() : "\<CR>"
"inoremap <expr><s-CR> pumvisible() ? neocomplcache#close_popup() "\<CR>" : "\<CR>"
"" <TAB>: completion.
"inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

"" <C-h>, <BS>: close popup and delete backword char.
"inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
"inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
"inoremap <expr><C-y>  neocomplcache#close_popup()
"inoremap <expr><C-e>  neocomplcache#cancel_popup()

"" Enable omni completion.
"autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
"autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
"autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
"autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

"" Enable heavy omni completion.
"if !exists('g:neocomplcache_omni_patterns')
"let g:neocomplcache_omni_patterns = {}
"endif
"let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::'
""autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
"let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
"let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'

"" For snippet_complete marker.
"if has('conceal')
"set conceallevel=2 concealcursor=i
"endif

"" }
"" }


" GUI Settings {
" GVIM- (here instead of .gvimrc)
if has('gui_running')
  set guioptions-=T           " remove the toolbar
  set lines=40                " 40 lines of text instead of 24,
  if has("gui_gtk2")
    set guifont=Menlo:h11
  else
    set guifont=Menlo:h11
  endif
  if has('gui_macvim')
    set transparency=5          " Make the window slightly transparent
  endif
else
  if &term == 'xterm' || &term == 'screen'
    set t_Co=256                 " Enable 256 colors to stop the CSApprox warning and make xterm vim shine
  endif
  "set term=builtin_ansi       " Make arrow and other keys work
endif
" }
" Functions {

function! InitializeDirectories()
  let separator = "."
  let parent = $HOME
  let prefix = '.vim'
  let dir_list = {
        \ 'backup': 'backupdir',
        \ 'views': 'viewdir',
        \ 'swap': 'directory' }

  if has('persistent_undo')
    let dir_list['undo'] = 'undodir'
  endif

  for [dirname, settingname] in items(dir_list)
    let directory = parent . '/' . prefix . dirname . "/"
    if exists("*mkdir")
      if !isdirectory(directory)
        call mkdir(directory)
      endif
    endif
    if !isdirectory(directory)
      echo "Warning: Unable to create backup directory: " . directory
      echo "Try: mkdir -p " . directory
    else
      let directory = substitute(directory, " ", "\\\\ ", "g")
      exec "set " . settingname . "=" . directory
    endif
  endfor
endfunction
call InitializeDirectories()


" Word wrapping {
set formatoptions-=t
set textwidth=0
set wrapmargin=0
set wrap
"echo "word wrapping is turned off."
" Word wrapping {
" }
"autocmd VimEnter * set path+=**
"autocmd VimEnter * set wildignore+=**/node_modules/**

" Wildmenu
set path+=**
set wildmenu
set wildmode=list:longest,full
set wildignore+=**/vendor/**
set wildignore+=**/node_modules/**
set conceallevel=0
"set ma
:autocmd BufWinEnter * setlocal modifiable


"Hotkey to toggle scroll cursor center on/off
:nnoremap <Leader>zz :let &scrolloff=999-&scrolloff<CR>

"Always keep cursor center screen.
augroup VCenterCursor
  au!
  au BufEnter,WinEnter,WinNew,VimResized *,*.*
        \ let &scrolloff=winheight(win_getid())/2
augroup END


"Make Vim Fast!

":profile start profile.log
":profile func *
":profile file *
" At this point do slow actions
":profile pause
":noautocmd qall!

"Ag searches from project directory root and not current open directory/file.
let g:ag_working_path_mode="r"

"Paste faster doesn't seem to work though
set noswapfile

"remap d and c to not cut highlighted text
nnoremap d "_d
vnoremap d "_d

nnoremap c "_c
vnoremap c "_c

"solution to issue with vim bg not being transparent
hi Normal guibg=NONE ctermbg=NONE


"Use system wide clipboard
set clipboard^=unnamed,unnamedplus " Use same clipboard as macOS/Linux


"Easy Motion Setup Overwin Addons
" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" F{char}{char} to move to {char}{char}
" nmap F <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>j <Plug>(easymotion-bd-f)
nmap <Leader>j <Plug>(easymotion-overwin-f)
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)
map  <nowait> <Leader><Leader>b <Plug>(easymotion-bd-w)
nmap <nowait> <Leader><Leader>b <Plug>(easymotion-overwin-w)
map  <nowait> <Leader>b <Plug>(easymotion-bd-w)
nmap <nowait> <Leader>b <Plug>(easymotion-overwin-w)
map  <nowait> <Leader>n <Plug>(easymotion-bd-w)
nmap <nowait> <Leader>n <Plug>(easymotion-overwin-w)

map <Leader> <Plug>(easymotion-prefix)

"find and replace shortcut
noremap <nowait> <leader>r :%s/

"save sessions on with hotkeys
noremap <leader>q :mksession! ~/vim_session <bar> :q <cr> " Quick write session
"noremap <leader>q :noautocmd <cr> " quit without writing a session ":noautocmd
noremap <leader>s :mksession! ~/vim_session <bar> :w <cr>  " Quick write session
noremap <leader>t :source ~/vim_session <cr>     " And load session with F3
":command Wq mksession! ~/vim_session <bar> :wq <cr>
":command WQ mksession! ~/vim_session <bar> :wq <cr>
":autocmd BufWinLeave * :mksession! ~/vim_session 

"replace :bd with leader x
noremap <leader>x :bd<cr>
noremap <leader>o <C-o><cr>"restore closed tab

"coc (autocomplete definition)
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gr <Plug>(coc-references)
nnoremap <C-p> :GFiles<CR>

"for vue files
autocmd BufRead,BufNewFile *.vue setfiletype html

"MDX files concealing no longer
let g:indentLine_setConceal = 0
set conceallevel=0
" default ''.
" n for Normal mode
" v for Visual mode
" i for Insert mode
" c for Command line editing, for 'incsearch'
let g:indentLine_concealcursor = ""
au FileType markdown setl conceallevel=0

nmap <Leader>0 <Plug>(Prettier)

"Git blame
let g:gitblame_enabled = 1
let g:gitblame_message_template = '<summary> • <date> • <author>'

" use <tab> to trigger completion and navigate to the next complete item
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()

inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"
