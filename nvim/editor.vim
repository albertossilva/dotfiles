if has("termguicolors")
	set termguicolors
endif

syntax enable
let g:gruvbox_italic=1
set background=dark
colorscheme gruvbox

if has("gui_macvim")
	set guifont=JetBrainsMono\ Nerd\ Font\ Mono:h16
	set lines=60 columns=130
	set spl=en spell
else
	set clipboard+=unnamedplus
endif

set smartindent
set tabstop=2
set shiftwidth=2
set expandtab
set title
set titlestring=%{expand(\"%:~:.:f\")}\ (%{strftime('%Y-%m-%d\ %H:%M',getftime(expand('%')))})
set fdm=syntax

function MapToggle(key, opt)
	let cmd = ':set '.a:opt.'! \| set '.a:opt."?\<CR>"
	exec 'nnoremap '.a:key.' '.cmd
	exec 'inoremap '.a:key." \<C-O>".cmd
endfunction
command -nargs=+ MapToggle call MapToggle(<f-args>)

" Change invisible characters
set listchars=tab:→\ ,space:·,nbsp:␣,trail:•,precedes:«,extends:»
set list

set nocompatible
set path+=**
set showcmd
set nowrap
set cursorline
set exrc
set modeline
set hidden
set nobackup
set nowritebackup
set cmdheight=1
set updatetime=300
set shortmess+=c
set number relativenumber
set nofoldenable

set wildmenu
set wildignore+=*/tmp/*,*/.git/*,*/dist/*,*/build/*,*/node_modules/*,*/coverage/*,*/.nyc_output/*,*.so,*.swp,*.zip,*.pyc,*.o,*.obj,*.svn,*.swp,*.class,*.hg,*.DS_Store,.nvimlog,*.min.*,*/.stack-work/*
set encoding=UTF-8

" open new split panes to right and below
set splitright
set splitbelow

