# Vimspirational

A custom vimrc

TL;DR - make vim an IDE. All the bells and whistles, none of the bloat*. See reasoning.

*There are several plugins which add or require 'bloat' but the benefit out weighted the cons for them and I've never noticed a slow down (if I did it would've been removed)

## Features

| Feature | Description | Plugin Credit |
| ------- | ----------- | ------------- | 
| Dashboard/ Start Screen | A nice start screen/dashboard to Vim | [Mhinz - Startify](https://github.com/mhinz/vim-startify) |
| Git integration | Various levels of Git integration for Vim - Fugitive is the wrapper powering everything, see each plugin for their purpose | [TPope - Fugitive](https://github.com/tpope/vim-fugitive), [Mhinz - Signify](https://github.com/mhinz/vim-signify), [Junegunn - GV](https://github.com/junegunn/gv.vim), [Xuyuanp - NerdTree Git Plugin](https://github.com/xuyuanp/nerdtree-git-plugin) |
| Language Server Protocol | Code completion and source navigation | [Neoclide - CoC](https://github.com/neoclide/coc.nvim) | 
| Linting | Code smells, warnings and errors | [Dense-analysis - ALE](https://github.com/dense-analysis/ale), [OmniSharp](https://github.com/OmniSharp/omnisharp-vim) |
| Vim x IDE Tab/windows | Make Vim buffers, windows and tabs more logical | [Zefei - WinTabs](https://github.com/zefei/vim-wintabs) |
| File Explorer | File browsing and management | [Preservim - NERDTree](https://github.com/preservim/nerdtree) | 
| Quick Fix Navigation | Quickly navigate compiler warnings/search results (vimgrep) | [Bfrg - QF Preview](https://github.com/bfrg/vim-qf-preview) |
| Colour theme | A very pretty colourscheme - Vimspirational set to 'andromeda' | [Sainnhe - Sonokai](https://github.com/sainnhe/sonokai) |
| Language pack | Syntax highlighting | [Sheerun - Polyglot](https://github.com/sheerun/vim-polyglot) |
| Rainbow Parenthesis | Recognise where TF you are in nested hell | [Luochen1990 - Rainbow](https://github.com/luochen1990/rainbow) |
| Multi-line editing | Multi line edits (helpful for [refactoring](https://code.visualstudio.com/docs/editor/refactoring#_rename-symbol) like in VSCode for languages not supported by LSP) | [mg979 - Visual Multi](https://github.com/mg979/vim-visual-multi) |
| Custom text objects  | Create custom text objects, dependency of other textobject plugins | [kana - Textobj-User](https://github.com/kana/vim-textobj-user) & again[https://github.com/kana/vim-textobj-line] 
| JSON Object maniuplation | Mappings for working with JSON objects in Vim | [TPope - JDaddy](https://github.com/tpope/vim-jdaddy) |
| Large file handling | Settings to improve editing large files | [Charles Campbell - LargeFile](https://github.com/vim-scripts/LargeFile)
| Repeat | Repeat actions made with plugins (Vimify plugins) | [TPope - Repeat](tpope/vim-repeat) |
| Surround | Add/Edit/Remove surrounding characters (quotes, tags, paren, brackets) | [TPope - Surround](tpope/vim-surround) |
| Sensible | Sensible Vim mappings the community agree on, likely overwritten some as a lot in there | [TPope - Sensible](tpope/vim-sensible) | 
| Commentary | Comment shortcuts for Vim | [TPope - Commentary](tpope/vim-commentary) |


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
