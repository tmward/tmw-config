" vim-plug configuration
call plug#begin('$HOME/.local/share/nvim/plugins')

Plug 'Olical/conjure'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'morhetz/gruvbox'
Plug 'neomake/neomake'
Plug 'sbdchd/neoformat'
Plug 'jalvesaq/Nvim-R'
Plug 'tpope/vim-fugitive'
Plug 'janet-lang/janet.vim'
Plug 'jpalardy/vim-slime'
Plug 'tpope/vim-unimpaired'
Plug 'vimwiki/vimwiki'

call plug#end()

" enable mouse to be able to resize panes
set mouse=a
" set leader to space
map <SPACE> <leader>
"number lines
set nu
" Search customization
set incsearch
set ignorecase
" Formatting options
" number of spaces a <Tab> counts for
set tabstop=4
" number of spaces to use for each step of (auto)indent
set shiftwidth=4
" spaces now > tab :(
set expandtab
" for git, writing, general life, wrap at 72 chars
set textwidth=72

" color preferences
set background=dark
colorscheme gruvbox
" this makes colors much more bright and vivid
set termguicolors

" make splits happen more normally
set splitbelow
set splitright

" sets the format program to par
" gq command calls par
" gw still calls vims internal formatter
" sets width of 72 and -q means to understand quoting like in emails
set formatprg=par\ -q\ -w72

" markdown as default file-format for vimwiki
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]
" prevent vimwiki from treating all md as a vimwiki
let g:vimwiki_global_ext = 0

" fix colorscheme with markdown
" autocmd FileType vimwiki set ft=markdown

" custom things for nvim-R
" make it so it opens csv previews with visidata
let R_csv_app = 'terminal:vd'
" make underscore still work and 2 underscores mean a <-
let R_assign = 2
" make python highlighting work
let g:markdown_fenced_languages = ['r', 'python']
let g:rmd_fenced_languages = ['r', 'python']
" only open zathura on first invocation of pdflatex
let R_openpdf = 1

" open the fix list automatically
let g:neomake_open_list = 2
let g:neomake_python_enabled_makers = ['pylint']
let g:neomake_markdown_enabled_makers = ['vale']
" settings for neoformatter
" for python to use black
let g:neoformat_enabled_python = ['black']
let g:neoformat_enabled_r = ['styler']

" settings for vim-slime
let g:slime_target = "neovim"
