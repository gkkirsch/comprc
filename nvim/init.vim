filetype off
set encoding=UTF-8

call plug#begin("~/.config/nvim/autoload")
Plug 'ryanoasis/vim-devicons' " dev icons for vim
Plug 'kyazdani42/nvim-web-devicons'
Plug 'francoiscabrol/ranger.vim' " Ranger
Plug 'rafi/awesome-vim-colorschemes' " Vim color schemes
Plug 'rbgrouleff/bclose.vim'
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdcommenter' " Comment support
Plug 'elixir-editors/vim-elixir' " Elixir support for vim
Plug 'pangloss/vim-javascript' " Javascript support for vim
Plug 'maxmellon/vim-jsx-pretty'
Plug 'vim-ruby/vim-ruby' " ruby syntax
Plug 'tpope/vim-fugitive' " Vim git integration
Plug 'christoomey/vim-tmux-navigator' " used for pane nav with tmux
Plug 'w0rp/ale' " Async Linting
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'MattesGroeger/vim-bookmarks'
Plug 'machakann/vim-highlightedyank'
Plug 'Pocco81/TrueZen.nvim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug '/usr/local/opt/fzf'
Plug 'glepnir/dashboard-nvim'
Plug 'gennaro-tedesco/nvim-peekup'
Plug 'windwp/windline.nvim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'sidebar-nvim/sidebar.nvim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim' " Vim plugin for fzf
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'AckslD/nvim-neoclip.lua'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'arcticicestudio/nord-vim'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
"Plug 'autozimu/LanguageClient-neovim', {
    "\ 'branch': 'next',
    "\ 'do': 'bash install.sh',
    "\ }

let g:rg_command = 'rg --vimgrep -S'
let g:jsx_ext_required = 0 "Allow JSX in normal js file

call plug#end()

"LUA SCRIPTS
lua require('init')

"Dashboard"
let g:dashboard_default_executive ='telescope'

syntax on
colorscheme onedark " Theme
highlight Normal ctermbg=None

hi! link SignColumn LineNr
let mapleader = "\<Space>"
set ruler               " Show the line and column numbers of the cursor.
set showtabline=0       " Hide the buffer tabline at the top of the screen
set formatoptions+=o    " Continue comment marker in new lines.
set textwidth=0         " Hard-wrap long lines as you type them.
set modeline            " Enable modeline.
set mouse=nvi
set linespace=0         " Set line-spacing to minimum.
set nojoinspaces        " Prevents inserting two spaces after punctuation on a join (J)
" More natural splits
set splitbelow          " Horizontal split below current.
set splitright          " Vertical split to right of current.
if !&scrolloff
  set scrolloff=3       " Show next 3 lines while scrolling.
endif
if !&sidescrolloff
  set sidescrolloff=5   " Show next 5 columns while side-scrolling.
endif
set display+=lastline
set nostartofline       " Do not jump to first character with page commands.
set noerrorbells                " No beeps
set backspace=indent,eol,start  " Makes backspace key more powerful.
set showcmd                     " Show me what I'm typing
set showmode                    " Show current mode.
set noswapfile                  " Don't use swapfile
set nobackup            	" Don't create annoying backup files
set nowritebackup            	" Don't create annoying backup files
set encoding=utf-8              " Set default encoding to UTF-8
set autowrite                   " Automatically save before :next, :make etc.
set autoread                    " Automatically reread changed files without asking me anything
set laststatus=2
set fileformats=unix,dos,mac    " Prefer Unix over Windows over OS 9 formats
set showmatch                   " Do not show matching brackets by flickering
set incsearch                   " Shows the match while typing
set hlsearch                    " Highlight found searches
set ignorecase                  " Search case insensitive...
set smartcase                   " ... but not when search pattern contains upper case characters
set autoindent
set tabstop=2 shiftwidth=2 expandtab
set gdefault            " Use 'g' flag by default with :s/foo/bar/.
set magic               " Use 'magic' patterns (extended regular expressions).
set number              " shows the line numbers
set clipboard=unnamed
set nohlsearch          " turns the searched term highlight off

nmap <leader><s-w> :set wrap!<cr>
nmap <Leader>c :let @+=expand('%:p')<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""PERFORMANCE TESTING""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:loaded_matchparen        = 1
let g:loaded_matchit           = 1
let g:loaded_logiPat           = 1
let g:loaded_rrhelper          = 1
let g:loaded_tarPlugin         = 1
let g:loaded_gzip              = 1
let g:loaded_zipPlugin         = 1
let g:loaded_2html_plugin      = 1
let g:loaded_shada_plugin      = 1
let g:loaded_spellfile_plugin  = 1
let g:loaded_netrw             = 1
let g:loaded_netrwPlugin       = 1
let g:loaded_tutor_mode_plugin = 1
let g:loaded_remote_plugins    = 1

set timeoutlen=1000 ttimeoutlen=0

"set nonumber
set norelativenumber
set nocursorcolumn
set nocursorline

set synmaxcol=200
set lazyredraw
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



""""""""""""""""
""" Ranger
"""""""""""""""""
nmap <leader>0 :syntax on<CR>
let g:ranger_command_override = 'ranger --cmd="unmap a" --cmd="map R rename_append"  --cmd="map D console mkdir " --cmd="map T console touch " --cmd="set show_hidden=true"'
let g:ranger_map_keys = 0
nmap <leader>n :RangerWorkingDirectory<CR>
nmap <leader><s-n> :RangerCurrentFile<CR>
let g:NERDTreeHijackNetrw = 0
let g:ranger_replace_netrw = 1

nmap <leader>o :e#<CR>


""""""""""""""""""""
""" Netrw
""""""""""""""""""""
set splitright
set splitbelow
nmap <leader>\ :vsplit .<CR>
nmap <leader>- :split .<CR>
nmap <leader>\| :vsplit %:h/<CR>
nmap <leader>_ :split %:h/<CR>


""""""""""""""""""""
""" Focus Mode
""""""""""""""""""""

nmap <leader>v :TZFocus<CR>

""""""""""""""""""""
"""Quick Scope
""""""""""""""""""""
" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" Trigger a highlight only when pressing f and F.
let g:qs_highlight_on_keys = ['f', 'F']


"""""""""""""""""
""" Snippets
"""""""""""""""""
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDirectories = ['UltiSnips', $HOME.'/.vim/my-snippets/UltiSnips']



"""""""""""""""""
""" FZF
"""""""""""""""""

let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -l ""'
let s:ag_options = ' --hidden '
let g:ag_working_path_mode="r"

let g:fzf_action = {
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-space': 'split',
      \ 'ctrl-v': 'vsplit' }
let g:fzf_history_dir = '~/.local/share/fzf-history' " Enable per-command history.
let g:esearch = {'use': 'visual'} " Esearch with visual text
let g:ag_apply_qmappings=1
let g:ag_mapping_message=1
nmap <leader>p :Files<CR>
nmap <leader><s-p> :Files!<CR>




"""""""""""""""""
"Bookmarks
"""""""""""""""""
let g:bookmark_sign = '🔖'
let g:bookmark_annotation_sign = '💬'

highlight BookmarkSign ctermbg=NONE ctermfg=160
highlight BookmarkLine ctermbg=13 ctermfg=56

highlight BookmarkAnnotationSign ctermbg=NONE ctermfg=33
highlight BookmarkAnnotationLine ctermbg=31 ctermfg=15

let g:bookmark_highlight_lines = 1
let g:bookmark_show_toggle_warning = 0
let g:bookmark_location_list = 1 " Use the location list to show all bookmarks
let g:bookmark_manage_per_buffer = 0
let g:bookmark_save_per_working_dir = 0
let g:bookmark_auto_save = 0

"""""""""""""""""
"Additional colors
"""""""""""""""""
hi Search cterm=NONE ctermfg=15 ctermbg=31
hi Visual  ctermfg=White ctermbg=31 cterm=none
hi HighlightedyankRegion cterm=reverse gui=reverse



"""""""""""""""""
""" TELESCOPE """
"""""""""""""""""
nnoremap <leader>t <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <Leader>f :lua require'telescope.builtin'.live_grep()<cr>
nnoremap <leader>; <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <leader>y :Telescope neoclip<cr>

command! -nargs=* Ag call fzf#run({
\ 'source':  printf('ag --nogroup --column --color "%s"',
\                   escape(empty(<q-args>) ? '^(?=.)' : <q-args>, '"\')),
\ 'sink*':    function('<sid>ag_handler'),
\ 'options': '--ansi --expect=ctrl-t,ctrl-v,ctrl-x --delimiter : --nth 4.. '.
\            '--multi --bind=ctrl-a:select-all,ctrl-d:deselect-all '.
\            '--color hl:68,hl+:110',
\ 'down':    '50%'
\ })

""""""""""""""""
"" Deoplete (autocomplete)
""""""""""""""""
"let g:deoplete#enable_at_startup = 1


""""""""""""""""
"" Linting
""""""""""""""""

let g:ale_linter_aliases = {'jsx': 'css'}
let g:ale_elixir_elixir_ls_release = expand("~/.elixir-ls/release")
let g:ale_fixers = {'elixir': ['mix_format'], 'javascript': ['prettier', 'eslint'], 'ruby': ['rubocop'], 'jsx': ['stylelint', 'eslint'], '*': ['remove_trailing_lines', 'trim_whitespace']}
let g:ale_linters = {'elixir': ['elixir-ls', 'credo', 'dogma'], 'css': ['stylelint'], 'javascript': ['prettier', 'eslint'], 'jsx': ['stylelint', 'eslint']}
let g:ale_sign_column_always = 1
let g:ale_fix_on_save = 1
let g:ale_lint_on_save = 1
let g:ale_linters.elixir = ['elixir-ls', 'credo', 'dogma']
let g:ale_linters.javascript = ['prettier', 'eslint']
let g:ale_elixir_elixir_ls_config = {'elixirLS': {'dialyzerEnabled': v:false}}
set completeopt=menu,menuone,preview,noselect,noinsert
let g:ale_completion_enabled = 1
let g:ale_javascript_prettier_options = '--single-quote --trailing-comma none --arrow-parens avoid --bracket-spacing true'


let g:ale_echo_msg_error_str = nr2char(0xf421) . ' '
let g:ale_echo_msg_warning_str = nr2char(0xf420) . ' '
let g:ale_echo_msg_info_str = nr2char(0xf05a) . ' '
let g:ale_echo_msg_format = '%severity%  %linter% - %s'
let g:ale_sign_column_always = 1
let g:ale_sign_error = g:ale_echo_msg_error_str
let g:ale_sign_warning = g:ale_echo_msg_warning_str
let g:ale_statusline_format = [
      \ g:ale_echo_msg_error_str . ' %d',
      \ g:ale_echo_msg_warning_str . ' %d',
      \ nr2char(0xf4a1) . '  ']


""""""""""""""""""
"""" Navigation
""""""""""""""""""
noremap L $
noremap H 0

"""""""""""""""""""""""
""" Search and Replace
"""""""""""""""""""""""
" Search and replace word under cursor
nmap <Leader>r :%s/<C-r><C-w>//gc<left><left><left>
" Search and replace word in clipboard
nmap <Leader><s-r> :%s/<C-r>0//gc<left><left><left>

""""""""""""""""""""
""" Buffers/Windows
""""""""""""""""""""
nmap <C-w>] :bnext<CR>
nmap <C-w>[ :bprev<CR>
nmap <C-w>x :bd<CR>
nmap <leader>x :bd<CR>
nmap <leader>q :wq<CR>
nmap <leader>w :w<CR>
nmap <leader><s-w> :noa w<CR>
nmap <leader><s-e> :edit!<CR>
nmap <leader>h <C-W>h<C-W>_
nmap <leader>l <C-W>l<C-W>_
nmap <Leader>a <Plug>BookmarkShowAll

nmap <C-h> <C-W>h<C-W>
nmap <C-l> <C-W>l<C-W>

nmap <C>l <C-W>l<C-W>_
nmap <C>h <C-W>h<C-W>_

"""""""""""""""""""""
""" Quick File Edits
"""""""""""""""""""""
nmap <leader>sv :source $MYVIMRC<cr>
nmap <leader>es :UltiSnipsEdit<cr>


""""""""""""""""""""""""""""""""""""""""""
"""""""""" PRETTIER """"""""""""""""""""""

command! -nargs=0 Prettier :CocCommand prettier.formatFile

"""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""
""""""""   COC LSP COMPLETION """""""""""""
"""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""
set encoding=utf-8
set hidden
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c

if has("nvim-0.5.0") || has("patch-8.1.1564")
  set signcolumn=number
else
  set signcolumn=yes
endif

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

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

autocmd CursorHold * silent call CocActionAsync('highlight')
nmap <leader>rn <Plug>(coc-rename)
augroup mygroup
  autocmd!
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>ac  <Plug>(coc-codeaction)
nmap <leader>qf  <Plug>(coc-fix-current)
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)
command! -nargs=0 Format :call CocAction('format')
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
