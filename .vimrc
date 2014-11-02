syntax on
set cindent
set number
set autoindent 
set incsearch

command -bang W w<bang>
command -bang Q q<bang>
command -bang WQ wq<bang>
command -bang Wq wq<bang>

imap jj <Esc>

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
