autocmd! VimEnter * :TagbarToggle
set list lcs=tab:\|\ 

let g:indentLine_enabled = 1

augroup fmt
  autocmd!
  autocmd BufWritePre * Neoformat
augroup END
