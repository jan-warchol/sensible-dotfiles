" let arrow keys move cursor across newlines
set whichwrap+=<,>,[,]

" highlight search matches (clear the highlighting with C-l)
set hlsearch
" unlike Vim's default, this coloring won't interfere with syntax highlighting
highlight Search cterm=reverse ctermfg=NONE ctermbg=NONE

" use space, the most prominent key, as the beginning of user-defined commands
let mapleader = "\<Space>"
nnoremap <Leader>q :q<CR>  " surprisingly easier to type than :q<Enter>

