call plug#begin('~/.vim/plugged')

Plug 'kyoz/purify', { 'rtp': 'vim' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'kien/rainbow_parentheses.vim'






"Plug '~/my-prototype-plugin'"
call plug#end()
sy on
colorscheme purify

scriptencoding utf-8
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8

set background=dark
set title
set number
set magic
set autoindent
set ttyfast
set cmdheight=2
set switchbuf=useopen
set shell=bash
set backspace=indent,eol,start
set timeout timeoutlen=1000 ttimeoutlen=100
set pastetoggle=<F12>
set modeline
set modelines=3
set foldmethod=manual
set nofoldenable
set nojoinspaces
set autoread

set cursorline
set cursorcolumn

set showmode
set showcmd
set showmatch

set incsearch
set hlsearch

set smartcase
set ignorecase
set smartindent
set smarttab
set tabstop=2
set shiftwidth=2
set softtabstop=2

set expandtab
set noshiftround
set textwidth=88
set colorcolumn=88,99
set fillchars+=vert:\   
set laststatus=2
set statusline=%f%m%r%h%w\ %y\ enc:%{&enc}\ ff:%{&ff}\ fenc:%{&fenc}%=(ch:%3b\hex:%2B)\ col:%2c\ line:%2l/%L\ [%2p%%]
set t_Co=256
set completeopt=menu,preview
set wildmenu
set wildmode=longest,list
set linespace=3
set guifont=Fira\ Code:h12

"AriLines"
let g:airline_theme='purify'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

"Rainbow Parentheses"
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax   * RainbowParenthesesLoadRound
au Syntax   * RainbowParenthesesLoadSquare
au Syntax   * RainbowParenthesesLoadBraces

hi MatchParen ctermbg=darkred ctermfg=white

au FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
au FileType json setlocal ts=2 sts=2 sw=2 expandtab

"NETRW"
let g:netrw_banner = 0
let g:netrw_liststyle = 2
let g:netrw_browse_split = 1
let g:netrw_altv = 1
let g:netrw_winsize = 13


hi Cursor ctermfg=White ctermbg=Yellow cterm=bold
hi CursorColumn ctermfg=White ctermbg=Yellow cterm=bold
imap jj <Esc>
hi StatusLine ctermbg=0 cterm=NONE

"Auto compl"
function! Smart_TabComplete()
  let line = getline('.')
  let substr = strpart(line, -1, col('.')+1)
  let substr = matchstr(substr, "[^ \t]*$")
  if (strlen(substr)==0)
    return "\<tab>"
  endif
  let has_period = match(substr, '\.') != -1
  let has_slash  = match(substr, '\/') != -1
  if (!has_period && !has_slash)
    return "\<C-X>\<C-P>"
  elseif ( has_slash )
    return "\<C-X>\<C-F>"
  else
    return "\<C-X>\<C-O>"
  endif
endfunction

inoremap <tab> <c-r>=Smart_TabComplete()<CR>

function! InsertTabWrapper(direction)
 let col = col('.')-1
 if !col || getline('.')[col - 1] !~ '\k'
  return "\<tab>"
 elseif "backward" == a:direction
  return "\<c-p>"
 else
  return "\<c-n>"
 endif
endfunction
inoremap <tab>   <c-r>=InsertTabWrapper   ('forward')<cr>
inoremap <s-tab> <c-r>=InsertTabWrapper   ('forward')<cr>

"OverLength"
hi OverLength ctermbg=darkred ctermfg=white
hi ColorColumn ctermfg=White ctermbg=Red cterm=bold

match OverLength /\%>88v.\+/
autocmd BufWinEnter * call matchadd('CursorColumn', '\%>'.&l:textwidth.'v.\+', -1)
call matchadd('ColorColumn', '\(\%88v\|\%99v\)')

