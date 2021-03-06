set encoding=utf-8

" Cursor line highlight
au InsertEnter * set cul
au InsertLeave * set nocul

" Scroll offset
set scrolloff=5

" Better copy & paste
set pastetoggle=<F2>
set clipboard=unnamed

set bs=2 " make backspace behave like normal again

set hidden " Easier to use hidden buffer

" Rebind <Leader> key
let mapleader = ","

" More useful enter key bindings in normal mode
" nmap <CR> o<esc>
" nmap <S-CR> O<esc>

" Fix Y
map Y y$

" Quick pair mappings
nmap <leader>" i""<esc>i
nmap <leader>( i()<esc>i
nmap <leader>[ i[]<esc>i
nmap <leader>{ i{}<esc>i
nmap <leader>_ i____<esc>hi
nmap <leader>' i''<esc>i

" Bind nohl
" Removes highlight of your last search
noremap <C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>
inoremap <C-n> :nohl<CR>

" bind Ctrl+<movement> keys to move around the windows, instead of using Ctrl+w + <movement>
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h


" easier moving between tabs
 map <Leader>n <esc>:tabprevious<CR>
 map <Leader>m <esc>:tabnext<CR>

" Text bubbling single lines.
nmap <C-Up> ddkP
nmap <C-Down> ddp

" Text bubling several lines
vmap <C-Up> xkP'[V']
vmap <C-Down> xp'[V']

"Selection shifting left right
vmap <C-Right> xp`[v`]
vmap <C-Left> xhP`[v`]

" Fix it so quit and save will still work if if forget to let go of shift.
nmap :Q :q
nmap :W :w

"Commands to edit .vimrc
nmap <leader>ev :e $MYVIMRC<CR>
nmap <leader>sv :so $MYVIMRC<CR>

" map sort function to a key
vnoremap <Leader>s :sort<CR>

" easier moving of code blocks
vnoremap < <gv " better indentation
vnoremap > >gv " better indentation

" Color scheme
" mkdir -p ~/.vim/colors && cd ~/.vim/colors
" wget -O wombat256mod.vim http://www.vim.org/scripts/download_script.php?src_id=13400
set t_Co=256
color wombat256mod



" Showing line numbers and length
set number " show line numbers
set tw=79 " width of document (used by gd)
set nowrap " don't automatically wrap on load
set fo-=t " don't automatically wrap text when typing

let &colorcolumn=join(range(81,1000),",")
augroup ColorCol
    autocmd ColorScheme * highlight ColorColumn ctermbg=000000 guibg=000000
augroup END

" easier formatting of paragraphs
vmap Q gq
nmap Q gqap


" Useful settings
set history=700
set undolevels=700


" Real programmers don't use TABs but spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab


" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase


" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
set nobackup
set nowritebackup
set noswapfile

" No annoying error sounds
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Spell Checking
set spelllang=en_gb
nmap <leader>ss :setlocal spell!<cr>
nmap <leader>p 1z=


" Install any plugin into a .vim/bundle/plugin-name/ folder
call pathogen#infect()
filetype off
syntax on
filetype plugin indent on



" =======================================================================


" Settings for ctrlp
nmap <C-b> :CtrlPBuffer<CR>
let g:ctrlp_working_path_mode = 'r'
let g:ctrlp_max_height = 30
set wildignore+=*/htmlcov/*
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*
set wildignore+=*build/*


" Settings for python-mode
let g:pymode_rope = 0
let g:pymode_virtualenv = 1
let g:pymode_breakpoint = 0
let g:pymode_syntax = 1
let g:pymode_syntax_builtin_objs = 0
let g:pymode_syntax_builtin_funcs = 0
map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

" Settings for vim-powerline
set laststatus=2
let g:Powerline_symbols = 'unicode'
set fillchars+=stl:\ ,stlnc:\

" Settings for jedi-vim
let g:jedi#use_tabs_not_buffers = 0
let g:jedi#popup_on_dot = 1

function! ShowDefWindow(action)
    if pumvisible()
        if a:action == 'show'
            return ':let g:jedi#show_functon_definition = "1"'
        endif
    endif
    return a:action
endfunction

inoremap <silent><C-d> <C-O>=ShowDefWindow('show')

" Better navigating through omnicomplete option list
" See http://stackoverflow.com/questions/2170023/how-to-map-keys-for-popup-menu-in-vim
set completeopt=longest,menuone
function! OmniPopup(action)
    if pumvisible()
        if a:action == 'j'
            return "\<C-N>"
        elseif a:action == 'k'
            return "\<C-P>"
        endif
    endif
    return a:action
endfunction

inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>


" Python folding
" mkdir -p ~/.vim/ftplugin
" wget -O ~/.vim/ftplugin/python_editing.vim http://www.vim.org/scripts/download_script.php?src_id=5492
set nofoldenable
