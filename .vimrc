" ------ GENERAL SETTINGS ------ "
syntax on                                              " Enable syntax highlighting
filetype indent on                                     " Indent based on file type
let mapleader=" "

set confirm
set pumheight=5                                        " Limit CoC to 5 sugestions
set signcolumn=yes                                     " Always show sign column 
set tabstop=2 shiftwidth=2 softtabstop=2               " Indentation levels
set expandtab smarttab autoindent                      " Tab settings
set nobackup nowritebackup noundofile noswapfile       " Disable backups/swap files. We save often; VCS should be used for accidental edits/removals
set ignorecase smartcase incsearch hlsearch            " Text searching
set number relativenumber                              " Line Numbering
set wrap linebreak breakindent                         " Line wrapping - purely UI (not saved to file)
set showbreak=+++\                                     " When text is wrapped, prefix with '+++ ' to signify wrapping
set wildmode=list:full,full                        " Only affects command mode completion as CoC handles all other completions. Makes command mode completion work how we've configured CoC (tab auto select first option and fill)
set completeopt=menu,menuone,popup,noselect,noinsert " Auto-complete menu display settings
set complete-=i                                        " Stop Vim looking through header files for c lookups
set wildignore+=*.docx,*.jpg,*.png,*.gif,*.pdf         " Add to ignore list when searching for files/ content within files
set wildignore+=*.pyc,*.exe,*.flv,*.img,*.xlsx         " Above continued
set encoding=utf-8                                     " Document encoding
set path+=.,,**;                                       " Set path to be current dir, dir of current file and search them recursively
set laststatus=2                                       " Show status line at all times (regardless of # files open)
set colorcolumn=                                       " Set Colour Column line
set nospell                                            " Disable spell checking, we enable it ad-hoc when needed
set mouse=a                                            " Enable mouse support
set matchpairs+=<:>                                    " Enable matching for tags
set showmatch                                          " Show matching pairs of [],() and {} (and <> from above line)
set scroll=0                                           " Moves by 1/2 # of lines in window when using CTRL+D and CTRL+U
set ttyfast                                            " Enable fast scrolling
set background=dark
set viminfo='100,<9999,s100                            " Store info from no more than 100 files at a time, 9999 lines of text, 100kb of data. Useful for copying large amounts of data between files.
set noshowmode                                         " No need to notify mode changes, we have them visible perma
set termguicolors                                      " Enable use of all colours
set textwidth=0
set guicursor=n-v-c:block-nCursor
highlight SpellBad cterm=bold ctermbg=darkred          " Spelling error highlighting
let &t_SI = "\e[5 q"                                   " Blinking line in insert
let g:LargeFile=100                                    " Activate when file is > 100mb
set shiftround

" ------ PLUGINS ------ "
call plug#begin()
Plug 'vim-scripts/LargeFile'                        " Disables some background things Vim does when opening large files
Plug 'tpope/vim-repeat'                             " Repeat actions made by plugins with `.`
Plug 'tpope/vim-surround'                           " Replace surround paren/quote/etc.
Plug 'tpope/vim-sensible'                           " Sensible vim mappings
Plug 'tpope/vim-jdaddy'                             " JSON pretty print and object manipulation (gqaj/gqij)
Plug 'tpope/vim-fugitive'                           " Best git plugin for Vim
Plug 'tpope/vim-commentary'                         " Commenting shortcuts
Plug 'preservim/nerdtree'                           " Best Vim file explorer
Plug 'mhinz/vim-startify'                           " Vim Start Screen
Plug 'mhinz/vim-signify'                            " Show changed lines in a file managed by a VCS (git)
Plug 'mg979/vim-visual-multi'                       " Multi line editing shortcuts (ctrl+n,ctrl+arrows,q to skip, Q to remove)
Plug 'luochen1990/rainbow'                          " Rainbow parenthesis
Plug 'junegunn/gv.vim'                              " Git commit browser for Vim (dependancy: vim-fugitive)
Plug 'itchyny/lightline.vim'                        " Vim Status Line
Plug 'Xuyuanp/nerdtree-git-plugin'                  " Git plugin for NERDTree
Plug 'MattesGroeger/vim-bookmarks'                  " Vim bookmarking
Plug 'vim-scripts/ReplaceWithRegister'              " Replace in place with gr<MOTION>
Plug 'vim-scripts/Auto-Pairs'                       " Auto closing paren, quotes etc.
Plug 'vim-scripts/Align'                            " Dependency of SQLUtilities
Plug 'vim-scripts/SQLUtilities'                     " SQL Formatting (does other stuff, but not useful to us )
Plug 'iaalm/terminal-drawer.vim'                    " Terminal shortcut helper (auto-open, auto-focus, auto-close)
Plug 'markonm/traces.vim'                           " Preview substitutions
Plug 'itchyny/vim-cursorword'                       " Underline words that match word under cursor 
Plug 'machakann/vim-highlightedyank'                " Highlight what we yanked
Plug 'mbbill/undotree'                              " Visualise Vim's undo tree - need to do more reading on this one
Plug 'kana/vim-textobj-user'                        " Create custom text objects. Get better at Vim first, then we can enhance ourselves even further with customisation
Plug 'kana/vim-textobj-line'                        " Custom line object - believe this is dependant on vim-textobj-user
Plug 'sheerun/vim-polyglot'                         " Best Vim language pack
Plug 'sainnhe/sonokai'                              " Colorscheme
Plug 'OmniSharp/omnisharp-vim', {'do':':OmniSharpInstall' } " C# LSP
Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': 'npm ci'}     " LSP
Plug 'dense-analysis/ale' 
Plug 'zefei/vim-wintabs'
Plug 'romainl/vim-qf'
call plug#end()

" ------ Auto Updating Plugins Monthly ------ "
function! OnVimEnter() abort
  " Run PlugUpdate every month automatically when entering Vim.
  if exists('g:plug_home')
    let l:filename = printf('%s/.vim_plug_update', g:plug_home)
    if !filereadable(l:filename)
      call writefile([], l:filename)
    endif
    let l:this_month = strftime('%Y_%m')
    let l:contents = readfile(l:filename)
    if index(l:contents, l:this_month) < 0
      call execute('PlugUpdate')
      call writefile([l:this_month], l:filename, 'a')
    endif
  endif
endfunction

autocmd VimEnter * call OnVimEnter()

" ------ FIXING VIM 'FEATURES' ------ "

" Stop annoying error bells/visuals
autocmd GUIEnter * set vb t_vb= " Disable error bells and visual flash for GUI
autocmd VimEnter * set vb t_vb= " Same as above but terminal
                                " Fix colours
if !has('gui_running')
    set t_Co=256                " Set number of colours available
endif

" ------ Plugin Customisations ------ "

" ------ TermToggle ------ "
" This is a hack to configure the terminal to kill the terminal buffer if it
" is sent a quit command:
"   So if you only want to allow silent terminal closing, you should provide an
"   extra option: :term ++kill=term. This instructs Vim to send SIGTERM to the
"   running process if the terminal buffer needs to be closed
" In the single function of the terminal_drawer source code, a cmd argument is
" made and concatenates to term command. We hijack this to achieve our goal.
let g:terminal_drawer_shell="++kill=hup"

" ------ ALE ------ "
"  Let CoC do it's job
let g:ale_disable_lsp = 1
let g:ale_floating_preview = 1

" ------ COC ------ "
" ------ Extensions ------ "
let g:coc_user_config = {}
" Make tab auto select and fill the first entry
let g:coc_user_config['suggest.enablePreselect'] = v:false 
let g:coc_user_config['suggest.noselect'] = v:true
" Forward diagnostics to ALE to be displayed
let g:coc_user_config['diagnostic.displayByAle'] = v:true
" Disables powershell terminal from launching whenever you enter a ps1/powershell file 
"let g:coc_user_config['powershell.integratedConsole.showOnStartup'] = v:true

" Enable semantic tokens
let g:coc_user_config['semanticTokens.enable'] = v:true
let g:coc_user_config['semanticTokens.filetypes'] = [ "c", "python", "ts" ]


let g:coc_global_extensions=[ 'coc-angular', 'coc-clangd', 'coc-css', 'coc-highlight', 'coc-html', 'coc-json', 'coc-markdownlint', 'coc-jedi', 'coc-sh', 'coc-sql', 'coc-tsserver', 'coc-vimlsp', 'coc-xml' ]

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" GoTo code navivgation
autocmd FileType * nmap <silent> gd <Plug>(coc-definition)
autocmd FileType * nmap <silent> gi <Plug>(coc-implementation)

" Overwrite for C# files
autocmd FileType cs nmap <silent> <buffer> gd <Plug>(omnisharp_go_to_definition)
autocmd FileType cs nmap <silent> <buffer> gi <Plug>(omnisharp_find_implementations)

" Use K to show documentation in preview window
nnoremap K :call ShowDocumentation()<CR>
nnoremap <leader>K :call feedkeys('K', 'in')<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Show references 
nmap <leader>sr  <Plug>(coc-references)

" Fix comments in json files
autocmd FileType json syntax match Comment +\/\/.\+$+

" ------ Colorscheme ------ "
let g:sonokai_style = 'andromeda'
let g:sonokai_better_performance = 1
colorscheme sonokai

" ------ Bookmarks ------ "
let g:bookmark_sign = '♥'

" ------ Rainbow ------ "
let g:rainbow_active = 1
let g:rainbow_conf = {
\ 	'operators': '_,_',
\ 	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\ 	'separately': {
\ 		'*': {},
\ 		'markdown': {
\ 			'parentheses_options': 'containedin=markdownCode contained', 
\ 		},
\ 		'lisp': {
\ 			'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'], 
\ 		},
\ 		'haskell': {
\ 			'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/\v\{\ze[^-]/ end=/}/ fold'], 
\ 		},
\ 		'vim': {
\ 			'parentheses_options': 'containedin=vimFuncBody', 
\ 		}, 
\ 		'perl': {
\ 			'syn_name_prefix': 'perlBlockFoldRainbow', 
\ 		},
\ 		'stylus': {
\ 			'parentheses': ['start=/{/ end=/}/ fold contains=@colorableGroup'], 
\ 		},
\ 		'css': 0, 
\ 		'nerdtree': 0, 
\ 	},
\}

" ------ Status Line ------ "
let g:unite_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statusline = 0
let g:vimshell_force_overwrite_statusline = 0
let g:lightline = {
                \   'active': {
                \     'left': [ [ 'mode', 'paste' ], [ 'gitbranch', 'readonly', 'absolutepath', 'modified' ] ],
                \     'right': [ [ 'lineinfo' ], [ 'percent' ], [ 'filetype', 'fileencoding', 'fileformat', 'lineinfo', ] ], 
                \   },
                \   'component_function': {
                \     'gitbranch':'FugitiveHead',
                \   },
                \   'component': {
                \     'lineinfo': '%3l:%-2v%<',
                \   }
                \ }

" ------ Nerd Tree ------ "
" Map shortcut
nnoremap <leader>e :NERDTreeToggle<CR>
let NERDTreeShowBookmarks=1 
let NERDTreeShowHidden=1 
let NERDTreeQuitOnOpen=1

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if winnr() == winnr('h') && bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" Set git status indicators
let g:NERDTreeGitStatusIndicatorMapCustom = {
\  'Modified'  :'M',
\  'Staged'    :'S',
\  'Untracked' :'U',
\  'Renamed'   :'R',
\  'Unmerged'  :'U',
\  'Deleted'   :'X',
\  'Dirty'     :'D',
\  'Ignored'   :'I',
\  'Clean'     :'C',
\  'Unknown'   :'?',
\ }

" ------ Startify ------ "
let g:startify_session_dir = '$HOME/vimfiles/session'
let g:startify_files_number = 10

" ------ Indentation Guide ------ "
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2

" ------ SQLUtilities ------ " 
let g:sqlutil_align_comma = 1               " Display columns in select list how SSMS does
let g:sqlutil_align_keyword_right = 0       " Align keywords on start of word not end of word (see help for more info)
let g:sqlutil_keyword_case = '\U'           " Auto capitalise keywords 

" ------ Mappings ------ "
" Remap CTRL + '/' to comment line/selection
vmap <C-/> gc
nmap <C-/> gcc

" Format SQL
vmap <silent> gqas    :SQLUFormatter<CR>
nmap <silent> gqas    vip gqas

" Remove search highlight 
nmap <Esc> :noh<CR>

" Win tabs 
let g:wintabs_autoclose_vimtab = 1
" Navigate buffer tabgs with ctrl+h/l
map <C-H> <Plug>(wintabs_previous)
map <C-L> <Plug>(wintabs_next)

" Navigate window tabs with ctrl+w ctrl+h/l
map <C-W><C-H> :tabprevious<CR>
map <C-W><C-L> :tabnext<CR>

" Commands 
map <C-W>c <Plug>(wintabs_close)
map <C-W>u <Plug>(wintabs_undo)
map <C-W>t <Plug>(wintabs_only)
map <C-W>x <Plug>(wintabs_close_window)
map <C-W>o <Plug>(wintabs_only_window)
command! Tabc WintabsCloseVimtab
command! Tabo WintabsOnlyVimtab

nmap <leader>q <Plug>(qf_qf_toggle)
 
 
" ------ Useful Shortcuts ------ "
" Pretty Print Shortcut: `gqa`
" Format JSON: gqaj (j for json)
" Format SQL : gqas (s for SQL)


