set lazyredraw
set wildcharm=<C-z>
set wildignorecase
set wildmenu
set wildoptions=pum

set hlsearch
set incsearch

set termguicolors
color jellybeans

" Status line
set laststatus=2
set statusline=
set statusline+=[%n]
set statusline+=\ %<%f
set statusline+=\ %h%w%m
set statusline+=%=
set statusline+=%y
set statusline+=\ %l:%c
set statusline+=\ %P

" Key bindings
let mapleader="\<Space>"
let maplocalleader="\<Bslash>"

nnoremap <leader>b :Buffers<CR>
nnoremap <leader>ev :e $MYVIMRC<CR>
nnoremap <leader>g :G<CR>
nnoremap <leader>m :make<CR>

" Pear tree
let g:pear_tree_smart_openers = 1
let g:pear_tree_smart_closers = 1
let g:pear_tree_smart_backspace = 1

" FZF
nnoremap <leader>fc :Commits<CR>
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fg :Rg<CR>
nnoremap <leader>ft :Tags<CR>
nnoremap <leader>fv :GFiles<CR>

" EditorConfig
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']
