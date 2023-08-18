syntax on
set laststatus=2
set t_Co=256
set hlsearch
set binary
set list
" set number
set splitbelow
set cursorline
set autoindent
set clipboard=unnamed
set display=lastline
let mapleader = ","
let &t_ut=''
let g:polyglot_disabled = ['csv']
xnoremap p pgvy

call plug#begin()

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'preservim/tagbar'
Plug 'lukas-reineke/indent-blankline.nvim'
"Plug 'mileszs/ack.vim'
" Initialize plugin system
"Plug 'nvim-tree/nvim-web-devicons' " optional
Plug 'nvim-tree/nvim-tree.lua'
Plug 'f-person/git-blame.nvim'
call plug#end()

let g:airline_theme='powerlineish'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_tabs = 0
let g:airline#extensions#tabline#switch_buffers_and_tabs = 0
let g:airline#extensions#whitespace#enabled = 0

let g:gitblame_enabled = 0
let g:gitblame_date_format = '%x'

let g:indentLine_enabled = 1
"command! -bang -nargs=* Rg call fzf#vim#grep('rg --vimgrep --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1, fzf#vim#with_preview(), <bang>0)

"let g:ackprg = 'rg --vimgrep --type-not sql --smart-case'

"nnoremap <C-m> :NERDTreeToggle<CR>


function! RipgrepFzf(query, fullscreen)
  let transformer = "| awk -F: 'BEGIN { OFS = FS } {$3 = $3 \":shortened-path:\" $2 \":\" $3; print}'"
  let command_fmt = 'rg  --vimgrep  --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--disabled', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  let spec = fzf#vim#with_preview(spec, 'down:40%', 'ctrl-/')
  call fzf#vim#grep(initial_command, 1, spec, a:fullscreen)
endfunction
command! -nargs=* -bang Rg call RipgrepFzf(<q-args>, <bang>0)

nmap <F8> :TagbarToggle<CR>


nnoremap <leader>m :NvimTreeToggle<CR>
nnoremap <leader>d :Files<CR>
nnoremap <leader>f :Rg<CR>
nnoremap <leader>b :bn<CR>  
nnoremap <leader>v :bp<CR>  
nnoremap <leader>s :GitBlameToggle <CR>  

if version >= 700
  map <C-t> <Esc>:tabnew<CR>
" map <C-d> <Esc>:tabclose<CR>
  map <C-b> <Esc>:bd!<CR> 
endif

colorscheme gruvbox
set background=dark

nnoremap <C-h> :Rg <C-R><C-W><CR>
nnoremap <F3> :set hlsearch!<CR>
vmap <C-y> "+y<CR>

"let NERDTreeMapOpenInTab='<ENTER>'

lua require'nvim-tree'.setup()
set mouse=

set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set nofoldenable


