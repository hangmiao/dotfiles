syntax on
colorscheme mustang  

" set background=dark
" hi Comment ctermfg=LightBlue
" highlight Comment    ctermfg=119
" highlight Identifier ctermfg=99AA00


filetype off
filetype plugin indent on
execute pathogen#infect()
set nocompatible
set modelines=0

" set nowrap
" Automatic word wrapping
set tw=79
set formatoptions+=t
set splitright " By default, split to the right

" Word wrap without line breaks
:set wrap
:set linebreak
:set nolist  " list disables linebreak

set title " Display filename in titlebar

set nu
set lisp
set autoindent
set smartindent
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set cindent
set shiftwidth=2
set clipboard+=unnamed 
set ignorecase
set smartcase
" set gdefault
set incsearch
set showmatch " show matching brackets (),{},[]
set mat=5 " show matching brackets for 0.5 seconds
set hlsearch
set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set noshowmode
let mapleader = ","


set pastetoggle=<F2>

" Spell check toggle
map <F6> :setlocal spell! spelllang=en_us<CR>

map <F4> :set list!<CR>
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮
highlight SpecialKey term=standout ctermbg=yellow guibg=yellow
highlight RedundantSpaces term=standout ctermbg=Grey guibg=#ffddcc


" Bubble single lines
nmap <C-k> [e
nmap <C-j> ]e

" Bubble multiple lines
vmap <C-k> [egv
vmap <C-j> ]egv

" ----------- Line Numbering -------------------------
set rnu   
set numberwidth=2
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

" ----------- Vundle Setup ----------------------------
set rtp+=~/.vim/bundle/vundle/
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'Valloric/YouCompleteMe'
Bundle 'uguu-org/vim-matrix-screensaver'
Bundle 'tpope/vim-surround'
Bundle 'Lokaltog/powerline'
Bundle 'kien/ctrlp.vim'
Bundle 'rking/ag.vim'
Bundle 'tpope/vim-unimpaired'

let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']   


let g:Powerline_symbols = 'fancy'
let g:Powerline_stl_path_style = 'short'


"-------------- My Functions --------------------------
function! RubySyntax()
  :w
  !ruby -c %
endfunction

function! RubyRun()
  :w
  !ruby %
endfunction

function! ShellList()
  !ls -lah
endfunction

" ------------- My Remappings -------------------------
nnoremap <silent> H :bp<CR>
nnoremap <silent> L :bn<CR>
inoremap jj <ESC>
nnoremap / /\v
vnoremap / /\v
nnoremap <leader><space> :noh<cr>
nnoremap <leader>c :call RubySyntax()<cr>
nnoremap <leader>r :call RubyRun()<cr>
nnoremap <leader>l :call ShellList()<cr>
nnoremap <space> :
nnoremap <leader>q q:
noremap <tab> %
vnoremap <tab> %
map <F7> 15j<CR>
map <F8> 15k<CR>

"Shortcut for The Silver Searcher, aka Ag
nnoremap \ :Ag<SPACE>

" CtrlP
let g:ctrlp_cmd = 'CtrlP'
" nmap <Space>o :CtrlP<cr>
set runtimepath^=~/.vim/bundle/ctrlp.vim

" Shortcut to opening a virtual split to right of current pane
" Makes more sense than opening to the left
nmap <leader>bv :bel vsp

" Ctags. Check the current folder for tags file and keep going one directory up all
" the way to the root folder. SO you can be in any sub-folder in your project and it'll be able to find the
" tags files. 
set tags=tags;/
nnoremap <leader>. :CtrlPTag<cr>

" ------------- Random Stuff ---------------------------
set cmdheight=1
set shortmess=a
hi EasyMotionShade ctermfg=234

" MiniBufExpl Colors
hi MBENormal               guifg=#808080 guibg=fg
hi MBEChanged              guifg=#CD5907 guibg=fg
hi MBEVisibleNormal        guifg=#5DC2D6 guibg=fg
hi MBEVisibleChanged       guifg=#F1266F guibg=fg
hi MBEVisibleActiveNormal  guifg=#A6DB29 guibg=fg
hi MBEVisibleActiveChanged guifg=#F1266F guibg=fg
let g:EasyMotion_leader_key = '<Leader>'

"if exists("did_load_filetypes")  
"    finish
"endif

" Source the vimrc file after saving it. So don't have to reload Vim to see the changes.
" Autocmd that resources your vimrc always use autocmd-nested so Powerline
" doesn't break.
augroup MyAutoCmd
  autocmd!
  autocmd MyAutoCmd BufWritePost $MYVIMRC nested source $MYVIMRC
augroup END


"Automatically change current directory to that of the file in the buffer
autocmd BufEnter * cd %:p:h
" Wipe out all buffers
nmap <silent> <Leader>da :1,9000bwipeout<cr>

" ------------- FileTypes and Indentation --------------
augroup myfiletypes
    " Clear out old autocmds in group.
    autocmd!

    " Set filetypes
    au BufNewFile,BufRead *.js.erb set filetype=javascript.ruby
    au BufNewFile,BufRead *.j setf objj
    au BufNewFile,BufRead Jakefile setf javascript
    au BufNewFile,BufRead *.god setf ruby 

    " File type specific behaviour
    autocmd FileType cpp,php,ruby,eruby,yaml,html,xhtml,xml set sw=2 ts=2 expandtab
    autocmd FileType objj,javascript,javascript.ruby set sw=4 ts=4 expandtab
    autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType make set sw=8 ts=8 noexpandtab

    autocmd FileType c setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab
    autocmd FileType cpp setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab
    autocmd FileType objc setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab
    autocmd FileType java setlocal shiftwidth=2 tabstop=8 softtabstop=2 expandtab

    " Treat .rss files as XML
    autocmd BufNewFile,BufRead *.rss setfiletype xml
augroup END


" :set cursorline
" :set cursorcolumn



" Backups {{{

set backup                        " enable backups
set noswapfile                    " it's 2015, Vim.

set undodir=~/.vim/tmp/undo//     " undo files
set backupdir=~/.vim/tmp/backup// " backups
set directory=~/.vim/tmp/swap//   " swap files

" Don't explode when editing crontab files.
set backupskip=/tmp/*,/private/tmp/*"

" Make those folders automatically if they don't already exist.
if !isdirectory(expand(&undodir))
    call mkdir(expand(&undodir), "p")
endif
if !isdirectory(expand(&backupdir))
    call mkdir(expand(&backupdir), "p")
endif
if !isdirectory(expand(&directory))
    call mkdir(expand(&directory), "p")
endif

" }}}





" Highlight Word {{{
" Show different colors of words highlighted simultaneously using <leader>N where N is
" a number from 1-6.

function! HiInterestingWord(n) " {{{
    " Save our location.
    normal! mz

    " Yank the current word into the z register.
    normal! "zyiw

    " Calculate an arbitrary match ID.  Hopefully nothing else is using it.
    let mid = 86750 + a:n

    " Clear existing matches, but don't worry if they don't exist.
    silent! call matchdelete(mid)

    " Construct a literal pattern that has to match at boundaries.
    let pat = '\V\<' . escape(@z, '\') . '\>'

    " Actually match the words.
    call matchadd("InterestingWord" . a:n, pat, 1, mid)

    " Move back to our original location.
    normal! `z
endfunction " }}}

" Mappings {{{

nnoremap <silent> <leader>1 :call HiInterestingWord(1)<cr>
nnoremap <silent> <leader>2 :call HiInterestingWord(2)<cr>
nnoremap <silent> <leader>3 :call HiInterestingWord(3)<cr>
nnoremap <silent> <leader>4 :call HiInterestingWord(4)<cr>
nnoremap <silent> <leader>5 :call HiInterestingWord(5)<cr>
nnoremap <silent> <leader>6 :call HiInterestingWord(6)<cr>

" }}}
" Default Highlights {{{

hi def InterestingWord1 guifg=#000000 ctermfg=16 guibg=#ffa724 ctermbg=214
hi def InterestingWord2 guifg=#000000 ctermfg=16 guibg=#aeee00 ctermbg=154
hi def InterestingWord3 guifg=#000000 ctermfg=16 guibg=#8cffba ctermbg=121
hi def InterestingWord4 guifg=#000000 ctermfg=16 guibg=#b88853 ctermbg=137
hi def InterestingWord5 guifg=#000000 ctermfg=16 guibg=#ff9eb8 ctermbg=211
hi def InterestingWord6 guifg=#000000 ctermfg=16 guibg=#ff2c4b ctermbg=195

" }}}

" }}}
" MarkChanged {{{

sign define line_changed text=+ texthl=DiffAdded

function! MarkChanged(s, e)
    for i in range(a:s, a:e)
        exe ":sign place " . i . " line=" . i . " name=line_changed file=" . expand("%:p")
    endfor
endfunction

function! MarkUnchanged(s, e)
    for i in range(a:s, a:e)
        call cursor(i, 0)
        silent! sign unplace
    endfor
endfunction

command! -range MarkChanged call MarkChanged(<line1>, <line2>)
command! -range MarkUnchanged call MarkUnchanged(<line1>, <line2>)

" nnoremap <leader>m :MarkChanged<cr>
" vnoremap <leader>m :MarkChanged<cr>
" nnoremap <leader>M :MarkUnchanged<cr>
" vnoremap <leader>M :MarkUnchanged<cr>

" }}}
" MS to UTC {{{

function! MS2UTC(ms)
    let seconds = strpart(a:ms, 0, strlen(a:ms) - 3)
    return substitute(system("date -ur " . seconds), "\n\n*", "", "")
endfunction

function! MS2UTCWord()
    return MS2UTC(expand("<cword>"))
endfunction

nnoremap <leader>U :echo MS2UTCWord()<cr>

" }}}



" Quick editing ----------------------------------------------------------- {{{

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>et :vsplit ~/.tmux.conf<cr>

" }}}



" Resize splits when the window is resized
au VimResized * :wincmd =

" When in command line mode, make ctrl+a, ctrl+e work
cnoremap <c-a> <home>
cnoremap <c-e> <end>

" Insert the current datestamp
:nnoremap <F5> "=strftime("%B %d, %Y")<CR>P
:inoremap <F5> <C-R>=strftime("%B %d, %Y")<CR>

":noremap <C-j> <C-w>j
":noremap <C-k> <C-w>k
":noremap <C-h> <C-w>h
":noremap <C-l> <C-w>l



" Refresh web pages after saving file
autocmd BufWriteCmd *.html,*.css,*.gtpl,*.sass,*.erb :call Refresh_firefox()
function! Refresh_firefox()
  if &modified
    write
    silent !echo  'vimYo = content.window.pageYOffset;
          \ vimXo = content.window.pageXOffset;
          \ BrowserReload();
          \ content.window.scrollTo(vimXo,vimYo);
          \ repl.quit();'  |
          \ nc -w 1 localhost 4242 2>&1 > /dev/null
  endif
endfunction

" sudo to save file with temporary privileges
command! W w !sudo tee % &>/dev/null


