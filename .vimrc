syntax on
filetype on

colorscheme plastic

call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-abolish'
Plug 'kana/vim-operator-user'
Plug 'rhysd/vim-clang-format'

call plug#end()

autocmd FileType cpp setlocal commentstring=//\ %s
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

set nowritebackup
set noswapfile
set hidden
set number
set relativenumber

let g:clang_format#command = "clang-format-8"

command Cf ClangFormat

