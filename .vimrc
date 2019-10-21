syntax on
filetype on

colorscheme plastic

autocmd FileType cpp setlocal sw=4 ts=4 sts=4 expandtab
autocmd BufWritePre *.py,*.js,*.cpp,*.c,*.cc,*.cxx,*.h,*.hpp,*.hxx :call <SID>StripTrailingWhitespaces()

autocmd BufNewFile,BufRead *.c setfiletype cpp

nnoremap <silent> <F5> :call <SID>StripTrailingWhitespaces()<CR>
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

set hidden
