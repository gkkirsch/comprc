filetype off

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree' " Directory structure
let g:NERDTreeMapJumpPrevSibling="" " To allow tmux/vim navigation
let g:NERDTreeMapJumpNextSibling="" " To allow tmux/vim navigation
let NERDTreeShowHidden=1 " Display ignored files in NERDTree
autocmd bufenter * if (winnr("$") == 1
      \ && exists("b:NERDTree")
      \ && b:NERDTree.isTabTree())
      \ | q | endif " Automatically close vim if NERDTree is only buffer left
autocmd VimEnter * NERDTree " Automatically start NERDTree on open
let g:NERDTreeWinSize=40
map <leader>n :NERDTreeToggle<CR>

Plug 'elixir-editors/vim-elixir' " Elixir support for vim
Plug 'slashmili/alchemist.vim' " Elixir support for vim
Plug 'scrooloose/nerdcommenter' " Comment support
Plug 'pangloss/vim-javascript' " Javascript support for vim
Plug 'mxw/vim-jsx' " Jsx support for vim
Plug 'vim-ruby/vim-ruby' " ruby syntax
Plug 'leafgarland/typescript-vim' " Typescript support

Plug 'tpope/vim-fugitive' " Vim git integration
Plug 'airblade/vim-gitgutter' " Vim gutter integration

Plug 'ryanoasis/vim-devicons' " dev icons for vim
Plug 'rbgrouleff/bclose.vim'
Plug 'tpope/vim-vinegar' " Vinegar
Plug 'itchyny/lightline.vim' " File info at bottom of vim
Plug 'rafi/awesome-vim-colorschemes' " Vim color schemes
Plug 'tmux-plugins/vim-tmux-focus-events' " Tmux and vim integration
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " Fuzzy finder for file names/content
Plug 'junegunn/fzf.vim' " Vim plugin for fzf
Plug 'christoomey/vim-tmux-navigator' " used for pane nav with tmux
Plug 'tpope/vim-repeat' " Plugin to add support for repeating surround commands (and other plugins)
Plug 'backdoer/splitjoin.vim' " fork of splitjoin including elixir functions
Plug 'tpope/vim-abolish' " String case coercion
Plug 'chiedo/vim-case-convert'
Plug 'kana/vim-textobj-user' " Define custom text objects
Plug 'andyl/vim-textobj-elixir' " Elixir text objects

call plug#end()

""""""""""""""""""
"""" Core
""""""""""""""""""
syntax on
let mapleader = "\<Space>"
colorscheme onedark " Theme
set re=1 " This uses a different regex engine more suited for ruby
set clipboard=unnamed "Use system clipboard
set backspace=2 " make backspace work like most other programs
set incsearch " Allow incremental search
set autoread " Auto-reload changed files
set hidden " allow multiple buffers
set shiftwidth=2 " when indenting with '>', use 2 spaces width
set noswapfile " Disable .swp files
let &number=1 " Show current line number (using let syntax just because...)
set ignorecase " ignore case in search
set smartcase " honor case if capital present
set wrap
nnoremap <leader><s-w> :set wrap!<cr>
"set nofoldenable " Enables code folding
"set foldmethod=syntax
"set foldlevel=1


""""""""""""""""""""
""" Netrw
""""""""""""""""""""
set splitright
set splitbelow
noremap <leader>\ :vsplit .<CR>
noremap <leader>d :e .<CR>
noremap <leader>- :split .<CR>
noremap <leader>t :tabf .<CR>
noremap <leader>\| :vsplit %:h/<CR>
noremap <leader>_ :split %:h/<CR>
noremap <leader><s-b> :tabnew <CR>
noremap <leader><s-d> :Explore<CR>
noremap <leader><s-t> :tabf %:h/<CR>
"noremap <leader>v :vsplit .<CR>
"noremap <leader>d :e .<CR>
"noremap <leader>x :split .<CR>
"noremap <leader>t :tabf .<CR>
"noremap <leader><s-v> :vsplit %:h/<CR>
"noremap <leader><s-x> :split %:h/<CR>
"noremap <leader><s-d> :E<CR>
"noremap <leader><s-t> :tabf %:h/<CR>


"""""""""""""""""
""" FZF
"""""""""""""""""
" For File search
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -l ""'
" For Ag full text search
" Default options are --nogroup --column --color
let s:ag_options = ' --hidden '

let g:fzf_action = {
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-space': 'split',
      \ 'ctrl-v': 'vsplit' }
let g:fzf_history_dir = '~/.local/share/fzf-history' " Enable per-command history.
let g:esearch = {'use': 'visual'} " Esearch with visual text
let g:ag_apply_qmappings=1
let g:ag_mapping_message=1
" Open file finder
noremap <leader>p :Files<CR>
" Open file finder full screen
noremap <leader><s-p> :Files!<CR>
" Ag search full-screen
noremap <leader>f :Ag<CR>
" Ag search
noremap <leader><s-f> :Ag!<CR>
command! -bang -nargs=* Ag
      \ call fzf#vim#ag(<q-args>,
      \   s:ag_options,
      \  <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up:60%')
      \          : fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:50%:hidden', '?'),
      \  <bang>0)

command! -bang -nargs=* Files
      \ call fzf#vim#files(<q-args>,
      \   <bang>0 ? fzf#vim#with_preview('up:60%')
      \           : fzf#vim#with_preview('right:50%:hidden', '?'),
      \   <bang>0) "Ag will show file names with a preview

"""""""""""""""""
""" Lightline
"""""""""""""""""
let g:lightline = {
      \ 'component_function': {
      \   'filename': 'LightLineFilename'
      \ }
      \ }
function! LightLineFilename()
  return expand('%')
endfunction
set laststatus=2 " always enable lightline even if nerdtree isn't toggled

""""""""""""""""""
"""" Navigation
""""""""""""""""""
" Horizontal
noremap L $
noremap H 0
" Tabs
nnoremap <C-n> gt
nnoremap <C-p> gT

""""""""""""""""
""" Tests
""""""""""""""""
" Elixir
au FileType elixir call s:elixir_test_bindings()
function! s:elixir_test_bindings()
  nnoremap <buffer> <Leader>a :execute "!clear && mix test %\\:" . line(".")<CR>
  nnoremap <buffer> <Leader><s-a> :execute "!clear && mix test %"<CR>
endfunction
" Ruby
au FileType ruby call s:ruby_test_bindings()
function! s:ruby_test_bindings()
  nnoremap <buffer> <Leader>a :execute "!clear && bin/rspec %\\:" . line(".")<cr>
  nnoremap <buffer> <Leader><s-a> :!clear && bin/rspec %<cr>
endfunction
" JS
au FileType javascript call s:js_test_bindings()
function! s:js_test_bindings()
  nnoremap <buffer> <Leader>a :execute "!clear && npm run test %\\:" . line(".")<cr>
  nnoremap <buffer> <Leader><s-a> :!clear && npm run test %<cr>,
endfunction

"""""""""""""""""""
""" Transformations
"""""""""""""""""""
" Elixir
au FileType elixir call s:elixir_transformation_bindings()
function! s:elixir_transformation_bindings()
  " Switch string map to atom map
  vnoremap <leader>a :s/"\([a-z_0-9]*\)" =>/\=submatch(1).':'/g<CR>
  " Switch atom map to string map
  vnoremap <leader>s :s/\([a-z_0-9]*\):/\='"'.submatch(1).'" =>'/g<CR>
  " Switch atom map to json object
  vnoremap <leader>j :s/\([a-z_0-9]*\):/\='"'.submatch(1).'":'/g \| :'<,'>s/%{/{/g <CR>
  " Switch json object to elixir atom map
  vnoremap <leader>e :s/"\([a-z_0-9]*\)":/\=submatch(1).':'/g \| :'<,'>s/{/%{/g <CR>
endfunction

" General
vnoremap crs :CamelToSnakeSel!<CR>
vnoremap crc :SnakeToCamelSel!<CR>

nnoremap <Leader>sw :Sur / /<left><left>
nnoremap <Leader>sl :SurL / /<left><left>

" Surround each line in a file with a front and a back
command! -nargs=* SurL :call SurroundLines(<f-args>)
function SurroundLines(front, back)
  let command = "normal i" . a:front[1:] . "\<Esc>La" . a:back[1:] . "\<Esc>jH"
  while line('.') < line('$')
    execute command
  endwhile
  execute command
endfunction

" Surround each word in a line with a front and a back
command! -nargs=* Sur :call SurroundWords(<f-args>)
function SurroundWords(front, back)
  let command = "normal i" . a:front[1:] . "\<Esc>Ea" . a:back[1:] . "\<Esc>W"
  while col('.') < strwidth(getline('.'))
    execute command
  endwhile
  execute command
endfunction

"vnoremap <Leader>r :'<,'>s/\%Vfoo\%V/bar/g<left><left><left><left><left><left>
nnoremap <S-k> :s/ /\r/g<cr>


"""""""""""""""""""""""
""" Things to Remember
"""""""""""""""""""""""
" run bash command
" :! [bash command]
"
" run bash command with output printed into file
" :.! [bash command] 
"
" takes file back in time
" :earlier 15m 
"
" reverses earlier command
" :later 15m
"
" edit permissioned file
" :w !sudo tee %
"
" reselects last visual selection
" gv
"
" create HTML render of current file
" :%TOhtml
"
" open up html of website
" vim http://stackoverflow.com/
"
" Set bookmark
" m [char]
"
" Go to bookmark
" ' [char]
"
" Multiple Clipboards
" " [char] [operation]
"
" Record macro
" q [letter]
"
" Run macro
" @ [letter]
