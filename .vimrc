" ################################
" #                              #
" #      GENERAL SETTINGS        #
" #                              #
" ################################
syntax on                                              " Enable syntax highlighting
set updatetime=100
filetype indent on                                     " Indent based on file type
" Set leader to space
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
set noruler
set completeopt=menuone,popup,noselect,noinsert " Auto-complete menu display settings
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
set guicursor=n-v-c:block-Cursor,r-cr:hor30
highlight SpellBad cterm=bold ctermbg=darkred          " Spelling error highlighting
let &t_SI = "\e[5 q"                                   " Blinking line in insert
let g:LargeFile=100                                    " Activate when file is > 100mb
set shiftround
autocmd GUIEnter * set vb t_vb= " Disable error bells and visual flash for GUI
autocmd VimEnter * set vb t_vb= " Same as above but terminal

" ################################
" #                              #
" #           PLUGINS            #
" #                              #
" ################################

call plug#begin()

" Git integration
Plug 'tpope/vim-fugitive'                           " Best git plugin for Vim
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/gv.vim'                              " Git commit browser for Vim (dependancy: vim-fugitive)
Plug 'idanarye/vim-merginal'

" Project Explorer
Plug 'lambdalisue/fern.vim'                         " File explorer 
Plug 'lambdalisue/fern-hijack.vim'                  " Make fern default FE
Plug 'lambdalisue/fern-git-status.vim'              " Fern git status 
Plug 'lambdalisue/fern-mapping-git.vim'             " Fern git integration
Plug 'hrsh7th/fern-mapping-collapse-or-leave.vim'   " Fix using h key in fern drawer (when at root and all collapsed go up a dir)

" LSP 
Plug 'OmniSharp/omnisharp-vim', {'do':':OmniSharpInstall' } " C# LSP
Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': 'npm ci'}     " LSP

" Debugger
Plug 'puremourning/vimspector'                      " Debugging 

" Linting
Plug 'dense-analysis/ale' 

" Colour Scheme
Plug 'sainnhe/sonokai'                              " Colorscheme

" DBMS
Plug 'tpope/vim-dadbod'
Plug 'kristijanhusak/vim-dadbod-ui'

" Text Objects
Plug 'kana/vim-textobj-user'                        " Create custom text objects. Get better at Vim first, then we can enhance ourselves even further with customisation
Plug 'kana/vim-textobj-line'                        " Custom line object - believe this is dependant on vim-textobj-user
Plug 'tpope/vim-jdaddy'                             " JSON pretty print and object manipulation (gqaj/gqij)
Plug 'wellle/targets.vim'
Plug 'tpope/vim-surround'                           " Replace surround paren/quote/etc.

" Motions
Plug 'vim-scripts/ReplaceWithRegister'              " Replace in place with gr<MOTION>

" Utilities
Plug 'tpope/vim-repeat'                             " Repeat actions made by plugins with `.`
Plug 'mg979/vim-visual-multi'                       " Multi line editing shortcuts (ctrl+n,ctrl+arrows,q to skip, Q to remove)
Plug 'tpope/vim-commentary'                         " Commenting shortcuts
Plug 'MattesGroeger/vim-bookmarks'                  " Vim bookmarking
Plug 'tpope/vim-dotenv'                           " Dotenv file integration so can save connection details safely
Plug 'tpope/vim-obsession'                        " session management
Plug 'gcmt/taboo.vim'
Plug 'mbbill/undotree'                              " Visualise Vim's undo tree - need to do more reading on this one

" UI/UX
Plug 'mhinz/vim-startify'                           " Vim Start Screen
Plug 'markonm/traces.vim'                           " Preview substitutions
Plug 'itchyny/vim-cursorword'                       " Underline words that match word under cursor 
Plug 'machakann/vim-highlightedyank'                " Highlight what we yanked
Plug 'vim-scripts/Auto-Pairs'                       " Auto closing paren, quotes etc.
Plug 'itchyny/lightline.vim'                        " Vim Status Line
Plug 'luochen1990/rainbow'                          " Rainbow parenthesis
Plug 'b0dee/elevator.vim'                        " Vim scrollbar - using my fork for QOL improvements
Plug 'romainl/vim-cool'
Plug 'tpope/vim-endwise'
Plug 'romainl/vim-qf'
Plug 'bfrg/vim-qf-preview'
Plug 'sheerun/vim-polyglot'                         " Best Vim language pack (syntax highlighting)

" Configuration Changes
Plug 'vim-scripts/LargeFile'                        " Disables some background things Vim does when operating on large files
Plug 'tpope/vim-sensible'                           " Sensible vim mappings
call plug#end()

" Auto Update Plugins Monthly 
function! OnVimEnter() abort
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

" ################################
" #                              #
" #    Plugin Customisation      #
" #                              #
" ################################

" Merginal
let g:merginal_resizeWindowToBranchLen = 1
let g:merginal_showCommands = 0

" Elevator
let g:elevator#timeout_msec = 0
let g:elevator#show_on_enter = v:true
let g:elevator#highlight = 'PmenuThumb'

" ALE
let g:ale_disable_lsp = 1 "  Let CoC do it's job
let g:ale_linters = { 'cs': ['OmniSharp'] }
let g:ale_cursor_detail = 1
let g:ale_floating_preview = 1

" OmniSharp
let g:OmniSharp_coc_snippet = 1

" CoC
let g:coc_user_config = {
  \ 'suggest.enablePreselect': v:false,
  \ 'suggest.noselect': v:true,
  \ 'diagnostic.displayByAle': v:true,
  \ 'semanticTokens.enable': v:true,
  \ 'semanticTokens.filetypes': [ "c", "python", "ts", "cs" ],
  \ 'javascript.suggest.autoImports': v:true,
  \ 'typescript.suggest.autoImports': v:true,
\ }

let g:coc_global_extensions= [ 
  \ 'coc-angular',
  \ 'coc-clangd',
  \ 'coc-css',
  \ 'coc-highlight',
  \ 'coc-html',
  \ 'coc-json',
  \ 'coc-markdownlint',
  \ 'coc-jedi',
  \ 'coc-sh',
  \ 'coc-sql',
  \ 'coc-tsserver',
  \ 'coc-vimlsp',
  \ 'coc-xml' 
\ ]

" Fix comments in json files
autocmd FileType json syntax match Comment +\/\/.\+$+

" Colorscheme 
let g:sonokai_style = 'andromeda'
let g:sonokai_better_performance = 1
colorscheme sonokai

" Bookmarks
let g:bookmark_sign = '♥'

" Rainbow
let g:rainbow_active = 1
let g:rainbow_conf = {
  \	'operators': '_,_',
  \	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
  \	'separately': {
  \		'*': {},
  \		'markdown': {
  \			'parentheses_options': 'containedin=markdownCode contained', 
  \		},
  \		'lisp': {
  \			'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'], 
  \		},
  \		'haskell': {
  \			'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/\v\{\ze[^-]/ end=/}/ fold'], 
  \		},
  \		'vim': {
  \			'parentheses_options': 'containedin=vimFuncBody', 
  \		}, 
  \		'perl': {
  \			'syn_name_prefix': 'perlBlockFoldRainbow', 
  \		},
  \		'stylus': {
  \			'parentheses': ['start=/{/ end=/}/ fold contains=@colorableGroup'], 
  \		},
  \		'css': 0, 
  \	},
\ }

" Status Line
let g:lightline = {
  \ 'colorscheme': 'sonokai',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ], [ 'gitbranch', 'readonly', 'pwd', 'relativepath', 'modified' ] ],
  \   'right': [ [ 'now' ], [ 'lineinfo', 'percent' ], [ 'filetype', 'fileencoding', 'fileformat'  ] ], 
  \ },
  \ 'inactive': { 
  \   'right': [ [ 'now' ], [ 'lineinfo', 'percent' ], []], 
  \ },
  \ 'component_function': {
  \   'gitbranch':'FugitiveHead',
  \   'pwd': 'RelativeOrAbsolutePath',
  \   'now': 'Now'
  \ },
  \ 'component': {
  \   'lineinfo': '%3l:%-2v%<',
  \ },
  \ 'tabline': {
  \   'left': [ [ 'tabs' ] ],
  \   'right': [ [ ] ],
  \ }
\ }

" Startify
let g:startify_session_dir = g:plug_home . '/session'
let g:startify_files_number = 10

" QF Preview 
let g:qfpreview = {
  \ 'close':"\<Esc>",
  \ 'next':'j',
  \ 'previous':'k'
\}

augroup qfpreview
  autocmd!
  " Preview quickfix under cursor
  autocmd FileType qf nmap <silent><buffer> p <plug>(qf-preview-open)
  autocmd FileType qf nmap <silent><buffer> <Esc> :cclose<CR>
  autocmd FileType qf nmap <silent><buffer> q :cclose<CR>

  " Auto open quickfix window in c/lwindow mode (auto closes when no more errors
  " in list)
  " The default autocmd (... nested cwindow) does not auto select quickfix window 
  " unlike the actual :cwindow command
  " We can emulate this with the <C-w>b command - can't find any docs on this but 
  " it seems to auto switch to quickfix window. 
  " Follow up with 'p' which previews the quickfix location
  autocmd QuickFixCmdPost [^l]* cwindow 
    \ | call feedkeys("\<C-w>b", 'in') 
    \ | let b:gitgutter_was_enabled = gitgutter#utility#getbufvar(expand('<abuf>'), 'enabled') 
    \ | call feedkeys("p") 
  autocmd QuickFixCmdPost    l* lwindow 
    \ | call feedkeys("\<C-w>b", 'in') 
    \ | let b:gitgutter_was_enabled = gitgutter#utility#getbufvar(expand('<abuf>'), 'enabled') 
    \ | call feedkeys("p") 
augroup END

" Fern
let g:fern#hide_cursor=1
let g:fern#default_hidden = 1
let g:fern_git_status#disable_ignored=1
let g:fern_git_status#disable_untracked=1
let g:fern_git_status#disable_submodules=1

augroup Fern
  autocmd!
  autocmd FileType fern nmap <buffer><silent> <C-R> <Plug>(fern-action-reload)
  autocmd FileType fern nmap <buffer><silent> r <Plug>(fern-action-rename)
  autocmd FileType fern vmap <buffer><silent> r <Plug>(fern-action-rename)
  autocmd FileType fern nmap <buffer><silent> m <Plug>(fern-action-move)
  autocmd FileType fern nmap <buffer><silent> dd <Plug>(fern-action-remove)
  autocmd FileType fern nmap <buffer><silent> a <Plug>(fern-action-new-path)
  autocmd FileType fern nmap <buffer><silent> i <Plug>(fern-action-new-path)
  autocmd FileType fern nmap <buffer><silent> I <Plug>(fern-action-new-path)
  autocmd FileType fern nmap <buffer><silent> C <Plug>(fern-action-enter)
  autocmd FileType fern nmap <buffer><silent> h <Plug>(fern-action-collapse-or-leave)
  autocmd FileType fern nmap <buffer><silent> cd <Plug>(fern-action-cd)
augroup END

" If another buffer tries to replace Fern, put it in the other window, and bring back Fern.
" Need to troubleshoot/fix this
autocmd BufEnter * if winnr() == winnr('h') && bufname('#') =~ 'fern:\/\/.*' && bufname('%') !~ 'fern:\/\/.*' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" DadBod UI
autocmd FileType dbout set nowrap

" Vimspector
let g:vimspector_enable_mappings = 'HUMAN'
let g:vimspector_install_gadgets=[ '--all', 'netcoredbg', 'vscode-js-debug' ]
set noequalalways
let g:vimspector_base_dir = g:plug_home . '/vimspector'
if has('win32')
  let g:vimspector_base_dir = substitute(g:vimspector_base_dir, '/', '\', 'g')
endif
let &runtimepath = &runtimepath . ',' . g:vimspector_base_dir


" ################################
" #                              #
" #      CUSTOM FUNCTIONS        #
" #                              #
" ################################

function! ExecuteOrDebug()
  if &filetype == "sql" 
    if mode()  == 'v'
      execute "visual \<Plug>(DBUI_ExecuteQuery)"
    else
      execute "normal \<Plug>(DBUI_ExecuteQuery)"
    endif
  else 
    if &filetype == "cs"
      echom "Building project."
      let l:build_output = split(system("dotnet build -v quiet --nologo -c Debug"), "\n")
      for line in l:build_output
        if match(line,':') == -1 || match(line, 'Time Elapsed') >= 0
          " Informational line, i.e. build time/success/failure, warnings, errors,
          echom trim(line)
        elseif match(line, ' : ') != -1 && match(line, '[') == -1
          " Package warning
          let [ file, error ] = split(line, ' : ')
          echom file . ':'
          echom '    ' . error
        elseif match(line, '):') != -1
          " Code warning/error
          echom split(line, '[')[0]
          echom 
        endif
      endfor
    endif
    echom "Finished build. Launching debug session."
    execute "normal \<Plug>(omnisharp_debug_project)"
  endif
endfunction

function! Now() abort
  return strftime('%d/%m %H:%M')
endfunction

function! RelativeOrAbsolutePath() abort
  let cwd = getcwd()
  if has('win32') 
    let l:home = substitute($HOME, '\\', '\\\\', 'g')
    let cwd = substitute(cwd, l:home, '~', "")
  endif
  return cwd
endfunction

function! ShowDocumentation()
  if coc#rpc#ready() && CocAction('hasProvider', 'hover') && !coc#float#has_float()
    silent call CocActionAsync('doHover')
  else
    silent call feedkeys('K', 'in')
  endif
endfunction

function! RenameSymbol() abort
  if &filetype == "cs"
    execute "normal \<Plug>(omnisharp_rename)"
  else
  endif
    execute "normal \<Plug>(coc-rename)"
endfunction

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


" ################################
" #                              #
" #           MAPPINGS           #
" #                              #
" ################################
nmap <silent> <leader>e :Fern . -drawer -toggle -keep -reveal=%<CR>

" Use <ctrl> + 't' to create a new tab
noremap <silent><C-T> :tabedit<CR>
noremap! <silent><C-T> :tabedit<CR>
" Navigate tabs with ctrl+w ctrl+h/l
noremap <silent><C-H> :tabprevious<CR>
noremap <silent><C-L> :tabnext<CR>
noremap! <silent><C-H> :tabprevious<CR>
noremap! <silent><C-L> :tabnext<CR>

" Make ctrl + backspace work like normal in insert and command mode
noremap! <C-BS> <C-W>

" LSP symbol renaming
autocmd FileType * noremap <silent><F2> :call RenameSymbol()<CR>

" Run current SQL file (in DADBOD-UI) or start debugging session
autocmd FileType * map <silent><F5> :call ExecuteOrDebug()<CR>
autocmd FileType * imap <silent><F5> <Esc>:call ExecuteOrDebug()<CR>

" GoTo code navivgation
autocmd FileType * nmap <silent> gd <Plug>(coc-definition)
autocmd FileType * nmap <silent> gi <Plug>(coc-implementation)

" Overwrite for C# files
autocmd FileType cs nmap <silent> <buffer> gd <Plug>(omnisharp_go_to_definition)
autocmd FileType cs nmap <silent> <buffer> gi <Plug>(omnisharp_find_implementations)
autocmd FileType cs nmap <silent> <buffer> gpi <Plug>(omnisharp_preview_implementations)

" Use K to show documentation in preview window
nnoremap <silent>K :call ShowDocumentation()<CR>

" Show references 
nmap <silent><leader>sr  <Plug>(coc-references)

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": v:true` in your configuration file
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


" short hands for Git Gutter magic
cnoreabbrev ShowChanges GitGutterLineHighlightsEnable
cnoreabbrev HideChanges GitGutterLineHighlightsDisable
cnoreabbrev ToggleChanges GitGutterLineHighlightsToggle
cnoreabbrev Stage GitGutterPreviewHunk

