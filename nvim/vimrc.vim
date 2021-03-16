call plug#begin('~/.dotfiles/nvim/plugged')
	" Theme
	Plug 'morhetz/gruvbox', { 'as': 'gruvbox' }

	Plug 'vim-syntastic/syntastic'
	Plug 'aklt/plantuml-syntax'

	Plug 'neoclide/coc.nvim', {'branch': 'release'}

	Plug 'preservim/nerdtree'
	Plug 'Xuyuanp/nerdtree-git-plugin'
	Plug 'ryanoasis/vim-devicons'
"
	Plug 'airblade/vim-gitgutter'
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'

	Plug 'terryma/vim-multiple-cursors'
	Plug 'preservim/nerdcommenter'

	Plug 'editorconfig/editorconfig-vim'

	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'

	Plug 'ap/vim-css-color'
	Plug 'tpope/vim-fugitive'
	Plug 'tpope/vim-eunuch'
	Plug 'mattn/emmet-vim'
	Plug 'mhinz/vim-grepper'

	Plug 'tyru/open-browser.vim'
	Plug 'weirongxu/plantuml-previewer.vim'
call plug#end()

let airline_powerline_fonts = 1

let coc_global_extensions = [
	" \ 'coc-emmet',
	" \ 'coc-html',
	" \ 'coc-css',
	\ 'coc-snippets',
	"\ 'coc-pairs',
	\ 'coc-tsserver',
	" \ 'coc-eslint', 
	" \ 'coc-prettier', 
	" \ 'coc-groovy', 
	\ 'coc-json', 
	\ 'coc-spell-checker',
	\ ]

command Reload execute ":source ~/.dotfiles/nvim/vimrc.vim"

source ~/.dotfiles/nvim/abbreviations.vim
source ~/.dotfiles/nvim/editor.vim
source ~/.dotfiles/nvim/nerdtree.vim
source ~/.dotfiles/nvim/shortcuts.vim
source ~/.dotfiles/nvim/coc.vim

" Coc
" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')
" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	elseif (coc#rpc#ready())
		call CocActionAsync('doHover')
	else
		execute '!' . &keywordprg . " " . expand('<cword>')
	endif
endfunction

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>fo  <Plug>(coc-format-selected)
nmap <leader>fo  <Plug>(coc-format-selected)

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>. <leader>aap
xmap <leader>. <leader>aap

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
