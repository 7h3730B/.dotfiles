" Some stuff stolen from https://github.com/jmutai/dotfiles/blob/master/.vimrc
" and https://github.com/nickjj/dotfiles/blob/master/.vimrc

call plug#begin('~/.vim/plugged')

Plug 'sheerun/vim-polyglot'

" Automatically close brackets
Plug 'jiangmiao/auto-pairs'

Plug 'vimwiki/vimwiki'

Plug 'tomasiser/vim-code-dark'

Plug 'itchyny/lightline.vim'
Plug 'machakann/vim-highlightedyank'

Plug 'simrat39/symbols-outline.nvim'

" Fuzzy finder
Plug 'airblade/vim-rooter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" File tree
Plug 'scrooloose/nerdtree'

Plug 'psliwka/vim-smoothie'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Markdown preview
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

Plug 'glts/vim-radical'
Plug 'glts/vim-magnum'

Plug 'ryanoasis/vim-devicons'

Plug 'joshdick/onedark.vim'

Plug 'tpope/vim-commentary'

Plug 'junegunn/rainbow_parentheses.vim'

" Git --
Plug 'mhinz/vim-signify'
"
" Automatically clear search highlights after you move your cursor.
Plug 'haya14busa/is.vim'

" Syntactic language support
Plug 'cespare/vim-toml'
Plug 'stephpy/vim-yaml'
Plug 'rust-lang/rust.vim'
Plug 'rhysd/vim-clang-format'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
"
" Languages and file types.
Plug 'cakebaker/scss-syntax.vim'
Plug 'chr4/nginx.vim'
Plug 'chrisbra/csv.vim'
Plug 'ekalinin/dockerfile.vim'
Plug 'elixir-editors/vim-elixir'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'godlygeek/tabular' | Plug 'tpope/vim-markdown'
Plug 'jvirtanen/vim-hcl'
Plug 'lifepillar/pgsql.vim'
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'stephpy/vim-yaml'
Plug 'tmux-plugins/vim-tmux'
Plug 'tpope/vim-git'
Plug 'tpope/vim-liquid'
Plug 'tpope/vim-rails'
Plug 'vim-python/python-syntax'
Plug 'vim-ruby/vim-ruby'
Plug 'wgwoods/vim-systemd-syntax'
Plug 'towolf/vim-helm'

call plug#end()

imap <C-BS> <C-W>
" ANKI: Escape insert mode fast
imap jj <Esc>

" Set the color scheme
colorscheme codedark

" Enable relative line numbering
set rnu

" Store an undo buffer in a file in $HOME/.vimundo
set undofile
set undodir=~/.nvim/.vimundo
set undolevels=1000
set undoreload=10000

" ANKI: use vim commentary
nnoremap <leader>/ :Commentary<CR>
vnoremap <leader>/ :Commentary<CR>

" rainbow
let g:rainbow#max_level = 16
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]

" set leader key
let g:mapleader = "\<Space>"

" Ignore JS/TS/Web Stack files
set wildignore+=*/node_modules/*

" Ignore C/C++ object files
set wildignore+=*.o,*.obj,*.out,*.elf,*.exe,*.app

" Ignore C#.NET files
set wildignore+=*.Cache,*/bin/*,*/tmp/*,*/obj/*

" Ignore Python files
set wildignore+=*/__pycache__/*,*.pyc

" Ignore .git directory
set wildignore+=*/.git/*

" Auto indentation
filetype plugin indent on

" Enable syntax highlighting
syntax on

" Disable swap file
set noswapfile

" Enable line numbers
set number

" Disable line wrapping
set nowrap

" Make backspace behave like in other editors
set backspace=indent,eol,start
set hidden  " Required to keep multiple buffers open multiple buffers
" Other options
set smarttab
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set smartindent
set cindent
set cmdheight=2
set wildmenu
set langmenu=en
set ignorecase
set smartcase
set hlsearch
set lazyredraw
set magic
set showmatch
set noerrorbells
set novisualbell
set t_vb=
set tm=500

if has('mouse')
    set mouse=a
endif

set encoding=utf-8
set clipboard=unnamedplus
set fileencoding=utf-8                  " The encoding written to file
set ruler  
set splitbelow                          " Horizontal splits will automatically be below
set splitright                          " Vertical splits will automatically be to the right
set whichwrap+=<,>,[,],h,l
set conceallevel=0                      " So that I can see `` in markdown files
set cursorline
set lbr
set tw=500

" ---------------------------------------------------------------
" airline

" enable tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''

" enable powerline fonts
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''

" Switch to your current theme
let g:airline_theme = 'codedark'

" Always show tabs
set showtabline=2

" We don't need to see things like -- INSERT -- anymore
set noshowmode

" Make vimwiki work with obsidian
let g:vimwiki_list = [{'path': '~/notes/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]


" ---------------------------------------------------------------
" signify

" Change these if you want
let g:signify_sign_add               = '+'
let g:signify_sign_delete            = '_'
let g:signify_sign_delete_first_line = '‾'
let g:signify_sign_change            = '~'

" I find the numbers disctracting
let g:signify_sign_show_count = 0
let g:signify_sign_show_text = 1

" ---------------------------------------------------------------
" mappings

" ANKI: resize window up
nnoremap <silent> <C-Up>    :resize -2<CR>
" ANKI: resize window down
nnoremap <silent> <C-Down>  :resize +2<CR>
" ANKI: resize window left
nnoremap <silent> <C-Left>  :vertical resize -2<CR>
" ANKI: resize window right
nnoremap <silent> <C-Right> :vertical resize +2<CR>

" ANKI: Move to the window left
nnoremap <C-h> <C-w>h
" ANKI: Move to the window up
nnoremap <C-j> <C-w>j
" ANKI: Move to the window down
nnoremap <C-k> <C-w>k
" ANKI: Move to the window right
nnoremap <C-l> <C-w>l

" ANKI: Safe quickly
nnoremap <Leader>w :w!<CR>
" ANKI: Safe with sudo permission
command W w !sudo tee % > /dev/null
map <c-s> :SymbolsOutline<CR>
" ANKI: Enter Visual line mode quickly
nmap <Leader><Leader> V
" ANKI: Open Files quickly
nmap <C-p> :Files<CR>
" ANKI: Open Fuzzy finder
nnoremap <silent> <C-p> :FZF -m<CR>
" ANKI: Fuzzy lines
nnoremap <silent> <Leader>l :Lines<CR>

" ANKI: Copy the current buffer's path to your clipboard.
nmap <leader>cp :let @+ = expand("%")<CR>

" ANKI: Open Buffers quickly
nmap <leader>; :Buffers<CR>

" ANKI: Toggle relative line numbers
nmap <F6> :set invrelativenumber<CR>
"
" ANKI: Toggle spell check
map <F5> :setlocal spell!<CR>

" ANKI: Source current file
map <leader>sv :source %<CR>

" rust
let g:rustfmt_autosave = 1
let g:rustfmt_emit_files = 1
let g:rustfmt_fail_silently = 0
let g:rust_clip_command = 'xclip -selection clipboard'

" ANKI: Open new file adjacent to current file
nnoremap <leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

"ANKI: Use arrow keys in visual mode for indenting
vmap <Left> <gv
"ANKI: Use arrow keys in visual mode for indenting
vmap <Right> >gv
"
" ANKI: show stats quickly
nnoremap <leader>q g<c-g>

" ANKI: Toggle Nerdtree
map <C-n> :NERDTreeToggle<CR>

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" Markdown preview

" set to 1, the nvim will auto close current preview window when change
" from markdown buffer to another buffer
let g:mkdp_auto_close = 1

" options for markdown render
" mkit: markdown-it options for render
" katex: katex options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: if disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: mean the cursor position alway show at the middle of the preview page
"   top: mean the vim top viewport alway show at the top of the preview page
"   relative: mean the cursor position alway show at the relative positon of the preview page
" hide_yaml_meta: if hide yaml metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
" content_editable: if enable content editable for preview page, default: v:false
" disable_filename: if disable filename header for preview page, default: 0
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false,
    \ 'disable_filename': 0
    \ }

" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '「${name}」'

" recognizvd filetypes
" these filetypes will have MarkdownPreview... commands
let g:mkdp_filetypes = ['markdown']

" ANKI: Toggle Markdown Preview 
nmap <leader>p <Plug>MarkdownPreviewToggle

" ANKI: Visual mode search for current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f', '')<CR>
" ANKI: Visual mode search for current selection backwards
vnoremap <silent> # :call VisualSelection('b', '')<CR>

" ANKI: search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace', '')<CR>

" ANKI: Open new tab
map <leader>tn :tabnew<cr>
" ANKI: tab onlye
map <leader>to :tabonly<cr>
" ANKI: close a tab
map <leader>tc :tabclose<cr>
" ANKI: move tab
map <leader>tm :tabmove 
" ANKI: Move to next tab
map <leader>t<leader> :tabnext 

" ANKI: Toggle between the last and current tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

" ANKI: Open a new tab with the current buffer's path
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \   exe "normal! g`\"" |
      \ endif
" Remember info about open buffers on close
set viminfo^=%

" ANKI: Move a line of text using ALT
nmap <M-j> mz:m+<cr>`z
" ANKI: Move a line of text using ALT
nmap <M-k> mz:m-2<cr>`z
" ANKI: Move a line of text using ALT
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
" ANKI: Move a line of text using ALT
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("Ag \"" . l:pattern . "\" " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction 
