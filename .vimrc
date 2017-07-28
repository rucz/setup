" for gvim/windows
" unmap <C-Y>
" set lines=45
" set columns=150

let mapleader='-'
set tabstop=4
set shiftwidth=4
set expandtab
set nu
execute pathogen#infect()
syntax on
filetype plugin indent on
set ignorecase          " case insensitive searching
set smartcase           " but become case sensitive if you type uppercase characters
set hlsearch

" solarized colour scheme setup "
" let g:solarized_termcolors=256
set background=dark
colorscheme solarized
nnoremap <Leader>d :set<Space>background=dark<CR>
nnoremap <Leader>l :set<Space>background=light<CR>

" NERD_tree "
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p
nnoremap <Leader>e :NERDTreeToggle<CR>
" Quick exit when using NERD_tree "
command Q qa

" Fast buffer switching "
nnoremap <Leader>b :ls!<CR>:b<Space>
nnoremap <Leader>- :b<Space>#<CR>
nnoremap <Leader>1 :b<Space>1<CR>
nnoremap <Leader>2 :b<Space>2<CR>
nnoremap <Leader>3 :b<Space>3<CR>
nnoremap <Leader>4 :b<Space>4<CR>
nnoremap <Leader>5 :b<Space>5<CR>
nnoremap <Leader>6 :b<Space>6<CR>
nnoremap <Leader>7 :b<Space>7<CR>
nnoremap <Leader>8 :b<Space>8<CR>
nnoremap <Leader>9 :b<Space>9<CR>

" use the tab key to bring up a menu and rotate through possible completions
set wildchar=<Tab>
set wildmenu
set wildmode=full

" It's useful to show the buffer number in the status line.
set laststatus=2 " statusline=%02n:%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P

" set statusline=%t       "tail of the filename
set statusline=%-.100F  "full filename of the current buffer, left aligned, 100 characters max.
set statusline+=%=      "left/right separator
set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{&ff}] "file format
set statusline+=%h      "help file flag
set statusline+=%m      "modified flag
set statusline+=%r      "read only flag
set statusline+=%y      "filetype
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file

"Better window navigation
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

function! DoPrettyXML()
    " save the filetype so we can restore it later
    let l:origft = &ft
    set ft=
    " delete the xml header if it exists. This will
    " permit us to surround the document with fake tags
    " without creating invalid xml.
    1s/<?xml .*?>//e
    " insert fake tags around the entire document.
    " This will permit us to pretty-format excerpts of
    " XML that may contain multiple top-level elements.
    0put ='<PrettyXML>'
    $put ='</PrettyXML>'
    silent %!xmllint --format -
    " xmllint will insert an <?xml?> header. it's easy enough to delete
    " if you don't want it.
    " delete the fake tags
    2d
    $d
    " restore the 'normal' indentation, which is one extra level
    " too deep due to the extra tags we wrapped around the document.
    silent %<
    " back to home
    1
    " restore the filetype
    exe "set ft=" . l:origft
endfunction
command! PrettyXML call DoPrettyXML()

" set mouse=a
set mouse+=a
if &term =~ '^screen'
    " tmux knows the extended mouse mode
    set ttymouse=xterm2
endif

" write a read-only file!
cmap w!! w !sudo tee % >/dev/null
