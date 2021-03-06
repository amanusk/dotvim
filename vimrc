" Excute pathiogen
execute pathogen#infect()
call pathogen#helptags()

"set term=nxterm

" Set tab stop - how many columns a tab counts for. Linux kernel code expects each tab to be eight columns wide. Visual Studio expects each tab to be four columns wide. This is the only command here that will affect how existing text displays
" Set soft tab stop - how many columns vim uses when you hit Tab in insert mode. If softtabstop is less than tabstop and expandtab is not set, vim will use a combination of tabs and spaces to make up the desired spacing. If softtabstop equals tabstop and expandtab is not set, vim will always use tabs. When expandtab is set, vim will always use the appropriate number of spaces
" Set tab indentation - how many columns text is indented with the reindent operations (<< and >>) and automatic C-style indentation
" Set no expand tab - when expandtab is set, hitting Tab in insert mode will produce the appropriate number of spaces
:set tabstop=4 softtabstop=4 shiftwidth=4 expandtab

" add yaml stuffs
au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" Indent following lines to the indentation of previous line.
set autoindent

" set indentation
set cindent

" Display when in Insert, Append or Replace mode on the bottom side
set showmode

" Show line numbers on right side of each line
set number

" Display line and column numbers in bottom right side
set ruler

" filetype
filetype plugin indent on

set nocompatible
set backspace=2
set foldmethod=marker

" set color sheme
colorscheme default
" Use 256 colours (Use this setting only if your terminal supports 256
" colours)
set t_Co=256

" Hide the mouse when typing text
set mousehide

" Ebanle mouse
set mouse=a

" Make shift-insert work like in Xterm
map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>


" Switch on syntax highlighting if it wasn't on yet.
if !exists("syntax_on")
    syntax on
endif

" Switch on search pattern highlighting.
set hlsearch

" Set font
"set gfn=Courier\ 10\ Pitch\ 12
"set gfn=Courier\ 10\ Pitch\ 10

""""""""""""""""" Tlist
" Open the taglist window when Vim starts.
"autocmd VimEnter * Tlist " instead of let Tlist_Auto_Open=1
" Place the taglist window on the right side.
let Tlist_Use_Right_Window=1
" Show tags for the current buffer only.
let Tlist_Show_One_File=1
" Open tagbar if already opened in new tab
" autocmd BufEnter * nested :call tagbar#autoopen(0)


"Tags plugin
map <F3> :TagbarToggle<CR>

"Nerd tree plugin
map <F2> :NERDTreeTabsToggle<cr>


" set split to right and below instead of left and above
set splitright
set splitbelow

" toggle hidden chrachters: Deprecated
" nmap <leader>l :set list!<CR>

" Launch white space removal
nmap _$ :call <SID>StripTrailingWhitespaces()<CR>

" remove white spaces accross the file
function! <SID>StripTrailingWhitespaces()
    " save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history,
    let @/=_s
    call cursor(l, c)
endfunction"

" open files easly
map <leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
map <leader>sp :sp <C-R>=expand("%:p:h") . "/" <CR>
map <leader>vsp :vsp <C-R>=expand("%:p:h") . "/" <CR>
map <leader>et :tabe <C-R>=expand("%:p:h") . "/" <CR>

" run Wrap to change the wrapping to words
command! -nargs=* Wrap set wrap linebreak nolist
Wrap

" map numbers on of toggle
map <leader>nu :set nu!<CR>

" Move easyly between visual lines
map <C-j> gj
map <C-k> gk


" some iretating commands
command! Q q
command! W w
command! Wq wq
command! WQ wq
command! WA wa
command! Wa wa
command! Qa qa
command! QA qa

" Highlight white spaces
highlight RedundantSpaces ctermbg=green guibg=lightgreen
match RedundantSpaces /\s\+$/

" Refresh the page
map <F5> :edit <cr>

"All kinds of addings to make word complete easier
set completeopt=longest,menuone
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' : '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <M-,> pumvisible() ? '<C-n>' : '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

" set vertical column to 80 characters
set colorcolumn=80

" always show statusline
set laststatus=2

" Open you vimrc from everywhere
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
" Source your vimrc
nnoremap <leader>sv :source $MYVIMRC<cr>
" Do not sort by name
let g:tagbar_sort = 0
" Set width to 30
let g:tagbar_width = 30

" Continue where you left off on each file
if has("autocmd")
    autocmd BufReadPost *
                \ if line("'\"") > 1 && line("'\"") <= line("$") |
                \   exe "normal! g`\"" |
                \ endif
endif

set relativenumber
augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
    autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" if has("autocmd")
" 	filetype on
" 	augroup my_autocmds
" 		autocmd!
" 		" Toggle insert/visual line numbers
" 		" autocmd InsertEnter * :set number | :set norelativenumber
" 		" autocmd InsertLeave * :set number | :set relativenumber
" 	augroup END
" endif

" Run NERDTreeTabs by default
" let g:nerdtree_tabs_open_on_console_startup=1

" Set NERDTree to 30
let NERDTreeWinSize = 20


" Airline additions
" let g:airline_extensions = ['csv','whitespace']
" let g:airline#extensions#csv#column_display = 'Name'
" Do not show branch
let g:airline_section_b = ''
" Do not show encoding
let g:airline_section_y = ''

"let g:csv_no_conceal = 1
" set clipboard=unnamedplus

autocmd FileType python map <buffer> <leader>8 :call Pep8()<CR>
autocmd BufNewFile,BufRead *.cl   set syntax=cpp
autocmd BufNewFile,BufReadPost *.ino,*.pde set filetype=cpp

" :SW sudo saves the file
" (useful for handling the permission-denied error)
command! SW w !sudo tee % > /dev/null

" This is totally awesome - remap jj to escape in insert mode.  You'll never type jj anyway, so it's great!
inoremap jj <esc>
nnoremap JJJJ <nop>

" Ignore compiled files
set wildignore=*.o,*~,*.pyc,.*.swp
if has("win16") || has("win32")
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
else
    set wildignore+=.git\*,.hg\*,.svn\*
endif

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Make sure that extra margin on left is removed
set foldcolumn=0

" Enable Ctrl-A/Ctrl-X to work on octal and hex numbers, as well as characters
set nrformats=octal,hex ",alpha


" Use for snippets
"
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-b>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Add space after comment
" let g:NERDSpaceDelims = 1

" vim-instant-markdown
let g:instant_markdown_autostart = 0

" au BufNewFile,BufRead *.vy set filetype=python
" set term=screen-256color
" set term=ansi


" Table mode
function! s:isAtStartOfLine(mapping)
    let text_before_cursor = getline('.')[0 : col('.')-1]
    let mapping_pattern = '\V' . escape(a:mapping, '\')
    let comment_pattern = '\V' . escape(substitute(&l:commentstring, '%s.*$', '', ''), '\')
    return (text_before_cursor =~? '^' . ('\v(' . comment_pattern . '\v)?') . '\s*\v' . mapping_pattern . '\v$')
endfunction


inoreabbrev <expr> <bar><bar>
            \ <SID>isAtStartOfLine('\|\|') ?
            \ '<c-o>:TableModeEnable<cr><bar><space><bar><left><left>' : '<bar><bar>'
inoreabbrev <expr> __
            \ <SID>isAtStartOfLine('__') ?
            \ '<c-o>:silent! TableModeDisable<cr>' : '__'

" Help menu
inoremap <F1> <Esc>
noremap <F1> :call MapF1()<CR>

" Open help menu of F1
function! MapF1()
    if &buftype == "help"
        exec 'quit'
    else
        exec 'help'
    endif
endfunction

" Ale configs
let g:ale_set_balloons = 1
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_list_window_size = 5
" Jump to next ale error/warning
nmap <silent> <leader>k <Plug>(ale_previous_wrap_error)
nmap <silent> <leader>j <Plug>(ale_next_wrap_error)
nmap <silent> <leader>J <Plug>(ale_next_wrap_warning)
nmap <silent> <leader>K <Plug>(ale_previous_wrap_warning)
let g:ale_markdown_remark_lint_options = "-u preset-lint-recommended"

" Toggle ALE quick list
noremap <Leader>l :call QFixToggle()<CR>

function! QFixToggle()
    if exists("g:qfix_win")
        cclose
        unlet g:qfix_win
    else
        copen 10
        let g:qfix_win = bufnr("$")
    endif
endfunction

" ALE fixers
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'typescript': ['tsserver', 'eslint'],
\   'json': ['jq', 'jsonlint'],
\   'vue': ['eslint']
\}

let g:ale_fixers = {
\    'javascript': ['eslint', 'prettier'],
\    'typescript': ['prettier', 'eslint'],
\    'vue': ['eslint'],
\    'scss': ['prettier'],
\    'html': ['prettier'],
\    'json': ['prettier'],
\    'solidity': ['prettier']
\}

let g:ale_fix_on_save = 1

let g:EditorConfig_exec_path = '/usr/bin/editorconfig'

" Neocomplete
source $HOME/.vim/neocomp.vim
" Golang
autocmd BufRead,BufNewFile *.go source $HOME/.vim/govim.vim
" Rust
autocmd BufRead,BufNewFile *.rs source $HOME/.vim/rustvim.vim
" TypeScript
autocmd FileType typescript source $HOME/.vim/ts.vim
" JavaScript
autocmd FileType javascript  source $HOME/.vim/js.vim
" Python
autocmd FileType python source $HOME/.vim/pyvim.vim
" Latex
source $HOME/.vim/texvim.vim
" Convert files
source $HOME/.vim/convert.vim
" Grammarous
" source /User/amanusk/.vim/grammer.vim
" InstantRst
" source /User/amanusk/.vim/instantrt.vim

" Add rls to path
set runtimepath+=/Users/amanusk/.vim-plugins/LanguageClient-neovim

let g:ackprg = 'ag --nogroup --nocolor --column -w'

" hard time on
let g:hardtime_default_on = 0


" Disable quick fix window and use ale
let g:tsuquyomi_disable_quickfix = 1

" Required for operations modifying multiple buffers like rename.
set hidden

" Which version of rls to run
let g:LanguageClient_serverCommands = {
    \ 'javascript': ['javascript-typescript-stdio'],
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'nightly-2019-07-10-x86_64-apple-darwin', 'rls'],
    \ }

" Use completing with rls
set completefunc=LanguageClient#complete
function LC_maps()
  if has_key(g:LanguageClient_serverCommands, &filetype)
    nnoremap <silent> gc :call LanguageClient#textDocument_hover()<CR>
    nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
    nnoremap <silent> gr :call LanguageClient#textDocument_rename()<CR>
  endif
endfunction

autocmd FileType * call LC_maps()


" Solidity tabs
autocmd BufNewFile,BufRead *.sol setlocal shiftwidth=4 softtabstop=4 expandtab
autocmd BufNewFile,BufRead *.sol setlocal autoindent
autocmd BufNewFile,BufRead *.sol setlocal cindent
autocmd BufNewFile,BufRead *.sol setlocal smartindent

" Disalbe ale for lates
" let g:ale_pattern_options = {
" \   '.*\.tex$': {'ale_enabled': 0},
" \}
