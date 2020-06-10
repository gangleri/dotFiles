set nocompatible

filetype off
filetype plugin indent on

syntax enable

set number

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
Plugin 'gmarik/Vundle.vim'

" VIM general
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tacahiroy/ctrlp-funky'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-scripts/AutoClose'
Plugin 'tpope/vim-surround'
Plugin 'sjl/gundo.vim'
Plugin 'airblade/vim-rooter'
Plugin 'ap/vim-buftabline'
Plugin 'vim-scripts/lastpos.vim'
Plugin 'vim-scripts/tComment'
Plugin 'vim-scripts/file-line'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'vim-scripts/voogle'
Plugin 'Chiel92/vim-autoformat'
Plugin 'Yggdroot/indentLine'
Plugin 'powerman/vim-plugin-viewdoc'
Plugin 'majutsushi/tagbar'
Plugin 'int3/vim-taglist-plus'
Plugin 'jimsei/winresizer.git'
Plugin 'marcweber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'tpope/vim-speeddating'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'powerline/fonts'
Plugin 'vim-scripts/csv.vim'
Plugin 'gangleri/vim-toggle-relative-line-numbers'
Plugin 'gangleri/vim-toggle-quick-fix'
Plugin 'gangleri/vim-touchpad-on-off'
Plugin 'gavinbeatty/dragvisuals.vim'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
Plugin 'ryanoasis/vim-devicons'
Plugin 'felixhummel/setcolors.vim'
Plugin 'exitface/synthwave.vim'
Plugin 'kamwitsta/nordisk'
Plugin 'yonchu/accelerated-smooth-scroll'
Plugin 'Shougo/deoplete.nvim'
Plugin 'zchee/deoplete-go', {'build': {'unix': 'make'}}
Plugin  'deoplete-plugins/deoplete-docker'
Plugin 'deoplete-plugins/deoplete-clang'
Plugin 'deoplete-plugins/deoplete-zsh'
Plugin 'dense-analysis/ale'
Plugin 'mbbill/undotree'
Plugin 'mileszs/ack.vim'
Plugin 'nicwest/vim-http'
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'junegunn/fzf'
Plugin 'SirVer/ultisnips'
Plugin 'pechorin/any-jump.vim'
Plugin 'skywind3000/vim-dict'

" Ansible
Plugin 'chase/vim-ansible-yaml'

" HTML Plugins
Plugin 'mattn/emmet-vim'
Plugin 'othree/html5-syntax.vim'
Plugin 'vim-scripts/HTML-AutoCloseTag'

" JavaScript/Node Plugins
Plugin 'pangloss/vim-javascript'
Plugin 'leshill/vim-json'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'moll/vim-node'

" TypeScript
Plugin 'HerringtonDarkholme/yats.vim'

" CSS Plugins
Plugin 'hail2u/vim-css3-syntax'

" C/C++
Plugin 'vim-scripts/c.vim'
Plugin 'vim-scripts/CRefVim'

" Elm
Plugin 'lambdatoast/elm.vim'

" Go
Plugin 'fatih/vim-go'
Plugin 'sebdah/vim-delve'

" Homebrew
Plugin 'bfontaine/Brewfile.vim'

" Rust
Plugin 'rust-lang/rust.vim'

" Crystal
Plugin 'rhysd/vim-crystal'

" Python
Plugin 'python-mode/python-mode'
Plugin 'fs111/pydoc.vim'
Plugin 'mitsuhiko/flask'

" Erlang
Plugin 'jimenezrick/vimerl'

" Elixir
Plugin 'elixir-lang/vim-elixir'
Plugin 'carlosgaldino/elixir-snippets'

" Open Poloicy Agent
Plugin 'tsandall/vim-rego'

" wasm
Plugin 'rhysd/vim-wasm'

" Fortran
Plugin 'vim-scripts/ratfor.vim'

" Lua
Plugin 'tbastos/vim-lua'

" Git
Plugin 'mhinz/vim-signify'
Plugin 'tpope/vim-fugitive'
Plugin 'rdolgushin/gitignore.vim'
Plugin 'mattn/gist-vim'
Plugin 'sjl/splice.vim'
Plugin 'rhysd/git-messenger.vim'
Plugin 'junegunn/gv.vim'

" Docker
Plugin 'ekalinin/Dockerfile.vim'

" Markdown
Plugin 'JamshedVesuna/vim-markdown-preview'

" Color schemes
" Plugin 'flazz/vim-colorschemes'
" Plugin 'nanotech/jellybeans.vim'
" Plugin 'rking/vim-detailed'
Plugin 'ajmwagar/vim-deus'

" Note taking
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-notes'

call vundle#end()

set background=dark
colorscheme nordisk
" colorscheme deus

" hi link EasyMotionTarget ErrorMsg
hi link EasyMotionShade  Comment

let g:Powerline_symbols = 'fancy'
let g:ycm_path_to_python_interpreter="/usr/bin/python"
let g:bufExplorerShowRelativePath=1   " Use relative paths in buffer explorer
let g:indentLine_color_term = 239
let g:indentLine_char = '┆'
let g:NERDTreeWinSize = 32
let g:pydiction_location = '~/.vim/bundle/pydiction/complete-dict'
let g:viewdoc_open='botright vnew'
let g:ctrlp_extensions = ['funky']
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:airline_powerline_fonts=1
let g:airline_theme='bubblegum'
let g:search_engine='https://duckduckgo.com/?q='
let g:smooth_scroll_duration=50
let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'
let g:airline#extensions#ale#enabled = 1
let g:go_auto_type_info = 1
let g:go_fmt_command = "goimports"
let g:delve_backend = "native"
let g:ale_linters = {'go': ['gometalinter'], 'javascript': ['eslint']}
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"
let g:deoplete#sources#go#gocode_binary = '/Users/alan/go/bin/gocode'

if has('nvim')
	" Enable deoplete on startup
	let g:deoplete#enable_at_startup = 1
endif

" Set a terminal color scheme
let g:terminal_color_0  = '#2e3436'
let g:terminal_color_1  = '#cc0000'
let g:terminal_color_2  = '#4e9a06'
let g:terminal_color_3  = '#c4a000'
let g:terminal_color_4  = '#3465a4'
let g:terminal_color_5  = '#75507b'
let g:terminal_color_6  = '#0b939b'
let g:terminal_color_7  = '#d3d7cf'
let g:terminal_color_8  = '#555753'
let g:terminal_color_9  = '#ef2929'
let g:terminal_color_10 = '#8ae234'
let g:terminal_color_11 = '#fce94f'
let g:terminal_color_12 = '#729fcf'
let g:terminal_color_13 = '#ad7fa8'
let g:terminal_color_14 = '#00f5e9'
let g:terminal_color_15 = '#eeeeec'

let vim_markdown_preview_github=1
let vim_markdown_preview_toggle=2
let vim_markdown_preview_temp_file=1

let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {}
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['vue'] = '﵂'
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git|vendor'
let g:ctrlp_max_files=0

let g:git_messenger_into_popup_after_show = 'true'

let g:notes_directories = ['~/Library/Mobile\ Documents/com~apple~CloudDocs/Notes']


runtime macros/matchit.vim          " use matchit that comes with vim
" set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
set rtp+=/usr/local/opt/fzf

" VIM settins
call matchadd('ColorColumn', '\%81v', 100) " mark when I go over 80 chars per line
set nowrap                          " Disable line wrapping, will now scroll horizontially for long linnes
set mouse=a
set showcmd                         " Have bottom line show details of command being executed
set autoindent                      " Copy indent from current line when starting a new line
set autoread
set cindent                         " Indent C style programs
set wildmode=longest,list,full      " How complection mode will operate, complete longest first, show list if more than 1 and complete next full match
set wildmenu                        " command line completion operate in enhanced mode
set number                          " show line numbers
set hidden                          " Hidden buffer has unsaved modifications and is not displayed in a window. Setting this allows editing other buffer without saving current changes
set ignorecase
set smartcase                       " Ignores case if the pattern contains lowercase letters only
set ruler                           " Show the line and column separated by a comma
set scrolloff=3                     " Minimal number of screen lines to keep above and below the cursor
set incsearch                       " When typing a search command show what matches as you type
set hlsearch                        " Highlight all matches of a previous search pattern
set title                           " Set the title of the window to the value contained in 'titlestring'
set titlestring=\%t\ %a%r%m titlelen=70 " Disable beep and flash
set vb t_vb=". c
set directory=$HOME/.vim/tmp//,.    " Keep swap files in one location
set nobackup                        " don't make backups before overwriting a file *
set nowritebackup                   " don't make backups before overwriting a file
set softtabstop=4                   " Number of spaces <Tab> counts for while performing edit like insert a <Tab> or using <BS>
set shiftwidth=4                    " Number of spaces to use for each step of (auto)indent. Used for cindent, >>,<< etc.
set tabstop=4                       " Number of spaces that <Tab> counts for in a file
set nofoldenable                    " All fold will be open
set laststatus=2                    " Sets when the last window will have a status line, set to always
set t_Co=256                        " Number of colors
set encoding=utf-8                  " Set the character encoding used inside VIM. Applies to text in buffers, registers, Strings in expressions etc.
set spelllang=en_us
set splitbelow
set guifont=Fira\ Code:h12
set pastetoggle=<F2>
set cmdheight=2
set signcolumn=yes

if has("termguicolors")
	set termguicolors
endif

" Normal mode key mappings
noremap ; :
nnoremap <Up> <NOP>
nnoremap <Down> <NOP>
nnoremap <Left> <NOP>
nnoremap <Right> <NOP>
nnoremap <f5> :!ctags -R<cr>
nnoremap <c-h> <c-w>h                       " Jump to window to the right of current
nnoremap <c-j> <c-w>j                       " Jump to window below current
nnoremap <c-k> <c-w>k                       " Jump to window above current
nnoremap <c-l> <c-w>l                       " Jump to window to the left of current
nnoremap <c-left> <c-w>h                    " Jump to window to the right of current
nnoremap <c-down> <c-w>j                    " Jump to window below current
nnoremap <c-up> <c-w>k                      " Jump to window above current
nnoremap <c-right> <c-w>l                   " Jump to window to the left of current
nnoremap <c-w>w :bd<cr>						" Close current buffer
nnoremap <silent><s-up> :m -2<cr>           " move line up 1
nnoremap <silent><s-down> :m +1<cr>         " move line down 1
nnoremap <silent><leader>s :set spell!<cr>  " toggle highlight of spelling mistakes
nnoremap <silent><leader>sm  i<c-x>
nnoremap <silent>go o<esc>                  " Insert newline below without entering insert mode
nnoremap <silent>gO O<esc>                  " Insert newline above without entering insert mode
nnoremap <silent>gu :GundoToggle<cr>
nnoremap <silent><leader>f :CtrlP<Enter>
nnoremap <silent><leader>fu :CtrlPFunky<cr>
nnoremap <silent><leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<cr>  " narrow the list down with a word under cursor
nnoremap <silent><leader>m :TagbarToggle<cr>
nnoremap <silent><leader><right> :bn<cr>
nnoremap <silent><leader><left> :bp<cr>
nnoremap <silent><leader>n :NERDTreeToggle<cr>
nnoremap <leader>nj :NiceJson<cr>
nnoremap <leader>mdp :call Vim_Markdown_Preview()<cr>

" Insert mode key mappings
inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>
inoremap <silent><expr> <c-space> coc#refresh()

if has("gui_running")
	inoremap <C-Space> <C-n>
else
	inoremap <Nul> <C-n>
endif

" Visual mode key mappings
vmap <expr> <RIGHT> DVB_Drag('right')
vmap <expr> <LEFT> DVB_Drag('left')
vmap <expr> <DOWN> DVB_Drag('down')
vmap <expr> <UP> DVB_Drag('up')
vmap <expr> D DVB_Duplicate()

vnoremap <silent> <Enter> :EasyAlign<cr>

" Auto commands
au BufNewFile,BufRead *rc setfiletype bash
au BufNewFile,BufRead *.go silent !gocode
au! BufNewFile,BufRead * if getline(1) =~ '/bin/env node' | set syntax=javascript | endif
au FileType go nmap <leader>ga :GoAlternate<cr>
au FileType go nmap <leader>gb :DlvToggleBreakpoint<cr>
au FileType go nmap <leader>gt :GoDeclsDir<cr>
au FileType go nmap <leader>gct :GoCoverageToggle -short<cr>
au FileType go nmap T :GoTest -short<cr>
au BufNewFile,BufRead Brewfile,.Brewfile set filetype=ruby syntax=brewfile
au BufRead,BufNewFile *.md setlocal textwidth=80

autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.css

au FileType * nmap H :nohlsearch<cr>

" Commands
command! NiceJson %!python -m json.tool
command! Grepl call OpenGoRepl()

function OpenGoRepl()
	split | terminal gore
	" split | terminal go-pry
endfunction

