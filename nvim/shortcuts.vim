" Tab navigation like everything.
nnoremap <C-S-tab> :tabprevious<CR>
nnoremap <C-tab>   :tabnext<CR>
nnoremap <C-t>     :tabnew<CR>

map <F3> :NERDTreeFind<CR>
map <F4> :NERDTreeToggle<CR>
map <F5> :NERDTreeRefreshRoot<CR>
map <F6> <ESC>:exec &mouse!=""? "set mouse=" : "set mouse=nvc"<CR>
map <F7> :set number norelativenumber<CR>
map <F8> :set number relativenumber<CR>
MapToggle <F9> list

" Navigate around splits with a single key combo.
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-j> <C-w><C-j>

" Cycle through splits.
nnoremap <S-Tab> <C-w>w

" Don not use arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Center screen on finding
nnoremap n nzz
nnoremap N Nzz

" Moving lines
nnoremap <C-j> :m .+1<CR>
nnoremap <C-k> :m .-2<CR>
inoremap <C-j> <ESC>:m .+1<CR>==gi
inoremap <C-k> <ESC>:m .-2<CR>==gi

let g:NERDCreateDefaultMappings = 1
let g:NERDSpaceDelims = 1

" FZF
nnoremap <silent> <Leader><Leader> :Files<cr>
nnoremap <silent> <Leader>C        :Colors<CR>
nnoremap <silent> <Leader><Enter>  :Buffers<CR>
nnoremap <silent> <Leader>L        :Lines<CR>
nnoremap <silent> <Leader>ag       :Ag<CR>
xnoremap <silent> <Leader>ag       y:Ag<CR>
nnoremap <silent> <Leader>rg       :Rg<CR>
xnoremap <silent> <Leader>rg       y:Rg<C>
nnoremap <silent> <Leader>y        :History<CR>

inoremap <expr> <c-x><c-t> fzf#complete('tmuxwords.rb --all-but-current --scroll 500 --min 5')
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
inoremap <expr> <c-x><c-d> fzf#vim#complete#path('blsd')
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" Cancel search with ESC
nnoremap <silent> <Esc> :nohlsearch<Bar>:echo<CR>
