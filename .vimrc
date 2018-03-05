"syntax on
set number
set autoindent 
set incsearch
filetype indent plugin on
command -bang W w<bang>
command -bang Q q<bang>
command -bang WQ wq<bang>
command -bang Wq wq<bang>

imap jj <Esc>

set t_Co=256

" Tell vim to remember certain things when we exit
"  '10  :  marks will be remembered for up to 10 previously edited files
"  "100 :  will save up to 100 lines for each register
"  :20  :  up to 20 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
"  n... :  where to save the viminfo files
set viminfo='10,\"100,:20,%,n~/.viminfo

function! ResCur()
        if line("'\"") <= line("$")
        normal! g`"
        return 1
        endif
endfunction

augroup resCur
        autocmd!
        autocmd BufWinEnter * call ResCur()
augroup END

set incsearch
set hlsearch
set backspace=indent,eol,start
"set tw=79
"set noexpandtab
"set shiftwidth=2
"set softtabstop=2
au FileType c,cpp set autoindent
set ruler
"colorscheme ron
set autoread

"au FileType c,cpp set tw=79 tabstop=4
"au FileType python,javascript set ts=4 autoindent shiftwidth=4 shiftwidth=4 tabstop=4

set tabstop=8
set noexpandtab
"
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

imap jj <Esc>
nmap <C-R> <C-Y>

set tags=./tags,tags;

" I have pink completion menu..
hi	Pmenu		ctermbg=DarkGrey	guibg=DarkGrey
hi	PmenuSel	ctermbg=Blue		guibg=Grey		ctermfg=Black
hi	PmenuSbar	ctermbg=Gray		guibg=Grey
hi	PmenuThumb	ctermbg=Black		ctermfg=DarkBlue	guibg=White

au FileType asm,vmasm set syntax=c
au FileType vim let b:comment_str="\" "
au FileType c,cpp,verilog_systemverilog let b:comment_str="// "
au FileType tex,plaintex,bib let b:comment_str="% "
au FileType vhdl let b:comment_str="-- "
"au FileType python,javascript set ts=4 autoindent shiftwidth=4 shiftwidth=4 expandtab
"au FileType html set ts=2 autoindent shiftwidth=2 shiftwidth=2 expandtab
au FileType gitcommit set tw=72
au BufRead *0000-*.patch set filetype=mail
au FileType asm,vmasm let b:comment_str="@ "
au FileType asm,vmasm set syntax=c

au FileType c,cpp,verilog_systemverilog let b:comment_str="// "
noremap <silent> <F8> :s/^/<C-R>=escape(b:comment_str,'\/')<CR>/<CR>:let @/=""<CR>
noremap <silent> <F9> :s/^\([[:blank:]]*\)<C-R>=escape(b:comment_str,'\/')<CR>/\1/<CR>:let @/=""<CR>

let g:jellybeans_background_color = "0xffffff"
let g:jellybeans_background_color_256 = "0xffffff"
let g:solarized_termcolors=256
colorscheme jellybeans

" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>

set vb
"set tabstop=4
"set scrolloff=20

" Showing trailing whitespace
set listchars=tab:>~,trail:~
set list 

command! -complete=file -nargs=1 Rpdf :r !pdftotext -nopgbrk <q-args> - |fmt -csw78

" Highlighter over 80 characters
"au FileType asm,c,cpp highlight Overlength ctermbg=red ctermfg=white guibg=#592929
"au FileTYpe asm,c,cpp match Overlength /\%81v.\+/

set clipboard=unnamed
