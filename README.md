# Vimspirational

A custom vimrc

TL;DR - make vim an IDE. All the bells and whistles, none of the bloat*. See reasoning.

*There are several plugins which add or require 'bloat' but the benefit out weighted the cons for them and I've never noticed a slow down (if I did it would've been removed)

## Features

| Feature | Description | Plugin Credit |
| ------- | ----------- | ------------- | 
| [Dashboard/ Start Screen](#dashboard-start-screen) | A nice start screen/dashboard to Vim | [Mhinz - Startify](https://github.com/mhinz/vim-startify) |
| [Git integration](#Git-integration) | Various levels of Git integration for Vim - Fugitive is the wrapper powering everything, see each plugin for their purpose | [TPope - Fugitive](https://github.com/tpope/vim-fugitive), [Mhinz - Signify](https://github.com/mhinz/vim-signify), [Junegunn - GV](https://github.com/junegunn/gv.vim), [Xuyuanp - NerdTree Git Plugin](https://github.com/xuyuanp/nerdtree-git-plugin) |
| [Language Server Protocol](#language-server-protocol) | Code completion and source navigation | [Neoclide - CoC](https://github.com/neoclide/coc.nvim) | 
| [Linting](#Linting) | Code smells, warnings and errors | [Dense-analysis - ALE](https://github.com/dense-analysis/ale), [OmniSharp](https://github.com/OmniSharp/omnisharp-vim) |
| [Vim x IDE Tab/windows](#vim-x-ide-tabwindows) | Make Vim buffers, windows and tabs more logical | [Zefei - WinTabs](https://github.com/zefei/vim-wintabs) |
| [File Explorer](#file-explorer) | File browsing and management | [Preservim - NERDTree](https://github.com/preservim/nerdtree) | 
| [Quick Fix Navigation](#quick-fix-navigation) | Quickly navigate compiler warnings/search results (vimgrep) | [Bfrg - QF Preview](https://github.com/bfrg/vim-qf-preview), [Romainl - QuickFix](https://github.com/romainl/vim-qf) |
| [Colour theme](#colour-theme) | A very pretty colourscheme - Vimspirational set to 'andromeda' | [Sainnhe - Sonokai](https://github.com/sainnhe/sonokai) |
| [Language pack](#language-pack) | Syntax highlighting | [Sheerun - Polyglot](https://github.com/sheerun/vim-polyglot) |
| [Rainbow Parenthesis](#rainbow-parenthesis) | Recognise where TF you are in nested hell | [Luochen1990 - Rainbow](https://github.com/luochen1990/rainbow) |
| [Multi-line Editing](#multi-line-editing) | Multi line edits (helpful for [refactoring](https://code.visualstudio.com/docs/editor/refactoring#_rename-symbol) like in VSCode for languages not supported by LSP) | [mg979 - Visual Multi](https://github.com/mg979/vim-visual-multi) |
| [Custom text objects ](#custom-text-objects ) | Create custom text objects, dependency of other textobject plugins | [kana - Textobj-User](https://github.com/kana/vim-textobj-user) & [again](https://github.com/kana/vim-textobj-line) 
| [JSON Object maniuplation](#json-object-maniuplation) | Mappings for working with JSON objects in Vim | [TPope - JDaddy](https://github.com/tpope/vim-jdaddy) |
| [Large file handling](#large-file-handling) | Settings to improve editing large files | [Charles Campbell - LargeFile](https://github.com/vim-scripts/LargeFile)
| [Repeat](#repeat) | Repeat actions made with plugins (Vimify plugins) | [TPope - Repeat](https://github.com/tpope/vim-repeat) |
| [Surround](#surround) | Add/Edit/Remove surrounding characters (quotes, tags, paren, brackets) | [TPope - Surround](https://github.com/tpope/vim-surround) |
| [Sensible](#sensible) | Sensible Vim mappings the community agree on, likely overwritten some as a lot in there | [TPope - Sensible](https://github.com/tpope/vim-sensible) | 
| [Commentary](#commentary) | Comment shortcuts for Vim | [TPope - Commentary](https://github.com/tpope/vim-commentary) |


## Vimspirational in action

### Dashboard/ Start Screen

![Startify](https://github.com/b0dee/vimspirational/raw/master/img/startify.img]

### Git Integration

![Fugitive](https://github.com/b0dee/vimspirational/raw/master/img/fugitive.img]

![Fugitive2](https://github.com/b0dee/vimspirational/raw/master/img/fugitive2.img]

![Fugitive_Diff](https://github.com/b0dee/vimspirational/raw/master/img/fugitive_diff.img]

![Fugitive_Commit](https://github.com/b0dee/vimspirational/raw/master/img/fugitive_commit.img]

### Language Server Protocol
### Linting

![ALE_Linting](https://github.com/b0dee/vimspirational/raw/master/img/ale.img]

### Vim x IDE Tab/windows

![Wintabs_Tab1](https://github.com/b0dee/vimspirational/raw/master/img/wintabs_tab1.img]

![Wintabs_Tab2](https://github.com/b0dee/vimspirational/raw/master/img/wintabs_tab2.img]

### File Explorer

![NERDTree](https://github.com/b0dee/vimspirational/raw/master/img/nerdtree.img]

### Quick Fix Navigation
### Colour theme
### Language pack
### Rainbow Parenthesis
### Multi-line editing
### Custom text objects 
### JSON Object maniuplation
### Large file handling
### Repeat
### Surround
### Sensible
### Commentary

## Reasoning

I am no Vim guru but am proficient in small code bases. NVChad recently popped
up onto my radar and I used NeoVim quite happily, briefly. 

It crashed on me trying to run a :g command on a ~500mb file. Unacceptable.
Vim has performed this for me on larger files before. 

But NVChad really impressed me with look and feel so I wanted to try replicate
that in OG Vim. Think of it as VimChad, NVChad's vimscript cousin

Not all functionality has or will be ported, a lot relies heavily on plugins -
Vim can do most of it in-built, but plugins provide a better experience, i.e.
LSP completion

Also has my own personal preferences/ customisation

Open to PRs 







