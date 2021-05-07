let NERDTreeRespectWildIgnore=1
let NERDTreeShowHidden=1
let NERDTreeMinimalUI=1
let NERDTreeStatusline=''
let NERDTreeDirArrows = 1
let NERDTreeIgnore=['\.pyc$', '\.o$', '\.obj$', '\.svn$', '\.swp$', '\.class$', '\.hg$', '\.DS_Store$', '.nvimlog$', '^node_modules$']

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

" Start NERDTree when Vim starts with a directory argument.
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
"    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif
