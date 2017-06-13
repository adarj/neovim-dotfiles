autocmd! VimEnter * :TagbarToggle
set list lcs=tab:\|\ 

augroup fmt
  autocmd!
  autocmd BufWritePre * Neoformat
augroup END
