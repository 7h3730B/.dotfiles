" Some stuff stolen from https://github.com/jmutai/dotfiles/blob/master/.vimrc
" and https://github.com/nickjj/dotfiles/blob/master/.vimrc
" and https://github.com/ThePrimeagen/.dotfiles/blob/ca41b9e81a131cc0ac414d26d6703b5c21fd143a/nvim/.config/nvim/init.vim

call plug#begin('~/.vim/plugged')

Plug 'easymotion/vim-easymotion'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-speeddating'
Plug 'editorconfig/editorconfig-vim'
" Plug 'dylanaraps/wal'

" Automatically close brackets
Plug 'jiangmiao/auto-pairs'

Plug 'vimwiki/vimwiki'
Plug 'mattn/emmet-vim'

Plug 'dbeniamine/cheat.sh-vim'

Plug 'mbbill/undotree'

Plug 'tomasiser/vim-code-dark'
Plug 'projekt0n/github-nvim-theme'

Plug 'itchyny/lightline.vim'
Plug 'machakann/vim-highlightedyank'

Plug 'simrat39/symbols-outline.nvim'

" Fuzzy finder
Plug 'airblade/vim-rooter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
"
" dependencies
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
" telescope
Plug 'nvim-telescope/telescope.nvim'

Plug 'kyazdani42/nvim-web-devicons'

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

Plug 'mhinz/vim-rfc'

Plug 'junegunn/rainbow_parentheses.vim'

" Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'neovim/nvim-lspconfig'
Plug 'glepnir/lspsaga.nvim'
Plug 'hrsh7th/nvim-compe'
" Plug 'kabouzeid/nvim-lspinstall'
Plug 'simrat39/rust-tools.nvim'
" Debugging TODO: Look first if needed
" Plug 'mfussenegger/nvim-dap'

Plug 'wfxr/minimap.vim'

" Debugger
Plug 'puremourning/vimspector'
Plug 'szw/vim-maximizer'

" Git --
Plug 'mhinz/vim-signify'
"
" Automatically clear search highlights after you move your cursor.
Plug 'haya14busa/is.vim'

" Languages and file types.
" Plug 'cespare/vim-toml'
" Plug 'stephpy/vim-yaml'
Plug 'rust-lang/rust.vim'
" Plug 'rhysd/vim-clang-format'
" Plug 'godlygeek/tabular'
" Plug 'plasticboy/vim-markdown'
" Plug 'cakebaker/scss-syntax.vim'
" Plug 'chr4/nginx.vim'
" Plug 'chrisbra/csv.vim'
" Plug 'ekalinin/dockerfile.vim'
" Plug 'elixir-editors/vim-elixir'
" Plug 'Glench/Vim-Jinja2-Syntax'
" Plug 'jvirtanen/vim-hcl'
" Plug 'lifepillar/pgsql.vim'
" Plug 'othree/html5.vim'
" Plug 'pangloss/vim-javascript'
" Plug 'PotatoesMaster/i3-vim-syntax'
" Plug 'stephpy/vim-yaml'
" Plug 'tmux-plugins/vim-tmux'
" Plug 'tpope/vim-git'
" Plug 'tpope/vim-liquid'
" Plug 'tpope/vim-rails'
" Plug 'vim-python/python-syntax'
" Plug 'vim-ruby/vim-ruby'
" Plug 'wgwoods/vim-systemd-syntax'
" Plug 'towolf/vim-helm'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'

call plug#end()

let g:vimspector_enable_mappings = 'HUMAN'
let g:trans_bin = "~/.vim"

" Set the color scheme
colorscheme codedark

lua << EOF
require('github-theme').setup({
    themeStyle = "dimmed",
    commentStyle = "italic",
})
EOF

lua << EOF
require('rust-tools').setup({})
EOF

lua << EOF
require'nvim-web-devicons'.setup {
    -- your personnal icons can go here (to override)
    -- DevIcon will be appended to `name`
    override = {
    };
    default = true;
}
EOF

lua << EOF
local actions = require('telescope.actions')
require('telescope').setup {
    defaults = {
        mappings = {
            n = {
                ["q"] = actions.close
            },
        },
    }
}
EOF

lua << EOF
require'nvim-treesitter.configs'.setup {
    ensure_installed = "maintained",
    highlight = {
        enable = true,
        disable = {},
    },
    indent = {
        enable = true,
        disable = {},
    },
    ensure_installed = {
      "tsx",
      "toml",
      "php",
      "json",
      "yaml",
      "html",
      "css",
      "scss",
      "rust"
    },
}
EOF

lua << EOF
local saga = require 'lspsaga'

saga.init_lsp_saga {
    error_sign = '',
    warn_sign = '',
    hint_sign = '',
    infor_sign = '',
    border_style = "round",
}
EOF

lua << EOF
local nvim_lsp = require('lspconfig')
local protocol = require'vim.lsp.protocol'

local servers = { 'pyright', 'rust_analyzer', 'tsserver', 'clangd', 'cmake', 'dockerls', 'jsonls', 'vimls', 'html' }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup{}
end

protocol.CompletionItemKind = {
    '', -- Text
    '', -- Method
    '', -- Function
    '', -- Constructor
    '', -- Field
    '', -- Variable
    '', -- Class
    'ﰮ', -- Interface
    '', -- Module
    '', -- Property
    '', -- Unit
    '', -- Value
    '', -- Enum
    '', -- Keyword
    '﬌', -- Snippet
    '', -- Color
    '', -- File
    '', -- Reference
    '', -- Folder
    '', -- EnumMember
    '', -- Constant
    '', -- Struct
    '', -- Event
    'ﬦ', -- Operator
    '', -- TypeParameter
}
EOF

lua << EOF
require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  resolve_timeout = 800;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = {
    border = { '', '' ,'', ' ', '', '', '', ' ' }, -- the border option is the same as `|help nvim_open_win|`
    winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
    max_width = 120,
    min_width = 60,
    max_height = math.floor(vim.o.lines * 0.3),
    min_height = 1,
  };

  source = {
    path = true;
    buffer = true;
    calc = true;
    nvim_lsp = true;
    nvim_lua = true;
    vsnip = true;
    ultisnips = true;
    luasnip = true;
  };
}
EOF

set completeopt=menuone,noinsert,noselect
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

let g:completion_confirm_key = ""
imap <expr> <cr>  pumvisible() ? complete_info()["selected"] != "-1" ?
                 \ "\<Plug>(completion_confirm_completion)"  : "\<c-e>\<CR>" :  "\<CR>"

let g:user_emmet_mode='n'
let g:user_emmet_leader_key=','
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

let g:EasyMotion_startofline = 0 " keep cursor column when JK motion
let g:EasyMotion_smartcase = 1


" Enable relative line numbering
set rnu

" Store an undo buffer in a file in $HOME/.vimundo
set undofile
set undodir=~/.nvim/.vimundo
set undolevels=1000
set undoreload=10000

" rainbow
let g:rainbow#max_level = 16
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]

" set leader key
let g:mapleader = "\<Space>"

" minimap
let g:minimap_width = 20
let g:minimap_auto_start = 0

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


" rust
let g:rustfmt_autosave = 1
let g:rustfmt_emit_files = 1
let g:rustfmt_fail_silently = 0
let g:rust_clip_command = 'xclip -selection clipboard'

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

" mappings

imap <C-BS> <C-W>
" ANKI: Escape insert mode fast
imap jj <Esc>

" ANKI: use vim commentary
nnoremap <leader>/ :Commentary<CR>
vnoremap <leader>/ :Commentary<CR>

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
" ANKI: toggle symbols outline
map <c-s> :SymbolsOutline<CR>
" ANKI: Enter Visual line mode quickly
nmap <Leader><Leader> V
" ANKI: Open Files quickly
nnoremap <C-p> <cmd>Telescope find_files<CR>
" nmap <C-p> :Files<CR>
" ANKI: Open Fuzzy finder
" nnoremap <silent> <C-p> :FZF -m<CR>
" ANKI: Fuzzy lines
nnoremap <silent> <Leader>l :Lines<CR>

" ANKI: Copy the current buffer's path to your clipboard.
nmap <leader>cp :let @+ = expand("%")<CR>

" ANKI: Open Buffers quickly
nmap <leader>; <cmd>Telescope buffers<CR>

" ANKI: Fuzzy find help tags
nmap <leader>h <cmd>Telescope help_tags<CR>

" ANKI: Toggle relative line numbers
nmap <F6> :set invrelativenumber<CR>
"
" ANKI: Toggle spell check
map <F5> :setlocal spell!<CR>

" ANKI: Source current file
map <leader>sv :source ~/.config/nvim/init.vim<CR>

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

" ANKI: Toggle Markdown Preview 
nmap <leader>md <Plug>MarkdownPreviewToggle

" ANKI: Visual mode search for current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f', '')<CR>
" ANKI: Visual mode search for current selection backwards
vnoremap <silent> # :call VisualSelection('b', '')<CR>

" ANKI: search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace', '')<CR>

" ANKI: Open new tab
map <leader>tn :tabnew<cr>
" ANKI: tab only
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

" ANKI: jump to definition
" nmap <leader>gd <Plug>(coc-definition)
" ANKI: jump to references
" nmap <leader>gr <Plug>(coc-references)

" ANKI: Toggle Mximazing a pane
nnoremap <leader>m :MaximizerToggle!<CR>
" ANKI: launch vimspector
nnoremap <leader>dd :call vimspector#Launch()<CR>
" ANKI: open code vimspector panel
nnoremap <leader>dc :call GotoWindow(g:vimspector_session_windows.code)<CR>
" ANKI: open tabpage vimspector panel
nnoremap <leader>dt :call GotoWindow(g:vimspector_session_windows.tagpage)<CR>
" ANKI: open variables vimspector panel
nnoremap <leader>dv :call GotoWindow(g:vimspector_session_windows.variables)<CR>
" ANKI: open watches vimspector panel
nnoremap <leader>dw :call GotoWindow(g:vimspector_session_windows.watches)<CR>
" ANKI: open stack_trace vimspector panel
nnoremap <leader>ds :call GotoWindow(g:vimspector_session_windows.stack_trace)<CR>
" ANKI: open output vimspector panel
nnoremap <leader>do :call GotoWindow(g:vimspector_session_windows.output)<CR>
" ANKI: close vimspector
nnoremap <leader>de :call vimspector#Reset()<CR>

nnoremap <leader>dtcb :call vimspector#CleanLineBreakpoint()<CR>

" ANKI: vimspector step into
nmap <leader>dl <Plug>VimspectorStepInto
" ANKI: vimspector step over 
nmap <leader>dj <Plug>VimspectorStepOver
" ANKI: vimspector step out
nmap <leader>dk <Plug>VimspectorStepOut
" ANKI: vimspector restart
nmap <leader>d_ <Plug>VimspectorRestart
" ANKI: vimspector continue
nnoremap <leader>d<space> :call vimspector#Continue()<CR>

" ANKI: vimspector run to cursor
nmap <leader>drc <Plug>VimspectorRunToCursor
" ANKI: vimspector toggle breakpoint
nmap <leader>dbp <Plug>VimspectorToggleBreakpoint
" ANKI: vimspector toggle conditional breakpoint
nmap <leader>dcbp <Plug>VimspectorToggleConditionalBreakpoint

" ANKI: Toggle minimap
nmap <leader>u <cmd>MinimapToggle<CR>

" ANKI: back in jumplist
nmap <leader>o <C-o>
" ANKI: forware in jumplist
nmap <leader>i <C-i>

" ANKI: toggle undotree
nmap <leader>gu :UndotreeToggle<CR>

" See `:help vim.lsp.*` for documentation on any of the below functions
" ANKI: get declaration
nnoremap gD <cmd>lua vim.lsp.buf.declaration()<CR>
" ANKI: get definition
nnoremap gd <cmd>lua vim.lsp.buf.definition()<CR>
" ANKI: hover info lsp normal
nnoremap <leader>K <cmd>lua vim.lsp.buf.hover()<CR>
" ANKI: get implementation
nnoremap gi <cmd>lua vim.lsp.buf.implementation()<CR>
" ANKI: Signature help
nnoremap <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
" nnoremap <leader>wa <cmd>lua vim.lsp.buf.add_workspace_folder()<CR>
" nnoremap <leader>wr <cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>
" nnoremap <leader>wl <cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>
" ANKI: Type definition
nnoremap <leader>D <cmd>lua vim.lsp.buf.type_definition()<CR>
" ANKI:rename
nnoremap <leader>rn <cmd>lua vim.lsp.buf.rename()<CR>
" ANKI: code actions
nnoremap <leader>ca <cmd>lua vim.lsp.buf.code_action()<CR>
" ANKI: Refernces
nnoremap gr <cmd>lua vim.lsp.buf.references()<CR>
" nnoremap <leader>e <cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>
" ANKII: go to prev
nnoremap [d <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
" ANKII: go to next
nnoremap ]d <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
" nnoremap <leader>q <cmd>lua vim.lsp.diagnostic.set_loclist()<CR>
" ANKI: formatting
nnoremap <leader>gf <cmd>lua vim.lsp.buf.formatting()<CR>
" ANKI: Open GFiles
nnoremap <leader>p <cmd>GFiles<CR>

" ANKI: vertical split
nnoremap <leader>z/ <cmd>vsp<CR>
" ANKI: split
nnoremap <leader>z\ <cmd>sp<CR>

" ANKI: jump next diagnostic
nnoremap <C-j> <Cmd>Lspsaga diagnostic_jump_next<CR>
" ANKI: hover doc lspsaga
nnoremap K <Cmd>Lspsaga hover_doc<CR>
" ANKI: signature help
inoremap <C-k> <Cmd>Lspsaga signature_help<CR>
" ANKI: lsp_finder
nnoremap <leader>gh <Cmd>Lspsaga lsp_finder<CR>

" ANKI: Autocomplete
inoremap <silent><expr> <C-Space> compe#complete()
" ANKI: Autocomplete Confirm
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
" ANKI: Autocomplete close
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
" ANKI: Autocomplete scroll up 
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
" ANKI: Autocomplete scroll down
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

" ANKI: Easymotion move to char
map <leader>f <Plug>(easymotion-bd-f)
nmap <leader>f <Plug>(easymotion-overwin-f)

" ANKI: search for two characters 
nmap s <Plug>(easymotion-overwin-f2)
nmap s <Plug>(easymotion-s)

" ANKI: Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" ANKI: Move to word
map  <Leader><Leader>/ <Plug>(easymotion-bd-w)
nmap <Leader><Leader>/ <Plug>(easymotion-overwin-w)

" ANKI: Move l easy 
map <Leader>l <Plug>(easymotion-lineforward)
" ANKI: Move j easy 
map <Leader>j <Plug>(easymotion-j)
" ANKI: Move k easy 
map <Leader>k <Plug>(easymotion-k)
" ANKI: Move h easy 
map <Leader>h <Plug>(easymotion-linebackward)
" ANKI: Repeat easymotion
map <Leader>. <Plug>(easymotion-repeat)

nnoremap Y y$
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

function! GotoWindow(id)
    call win_gotoid(a:id)
    MaximizerToggle
endfunction

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
