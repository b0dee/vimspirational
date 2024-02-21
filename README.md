# Vimspirational

A custom vimrc

TL;DR - make vim an IDE. All the bells and whistles, none of the bloat*. See
reasoning.

*There are several plugins which add or require 'bloat' but the benefit out
weighted the cons for them and I've never noticed a slow down (if I did it
would've been removed)

## Features

| Feature | Description | Plugin Credit |
| ------- | ----------- | ------------- |
| [Dashboard/ Start Screen](#dashboard-start-screen) | A nice start screen/dashboard to Vim | [Mhinz - Startify](https://github.com/mhinz/vim-startify) |
| [Git integration](#git-integration) | Various levels of Git integration for Vim - Fugitive is the wrapper powering everything, see each plugin for their purpose | [TPope - Fugitive](https://github.com/tpope/vim-fugitive), [Mhinz - Signify](https://github.com/mhinz/vim-signify), [Junegunn - GV](https://github.com/junegunn/gv.vim) |
| [Language Server Protocol](#language-server-protocol) | Code completion and source navigation | [Neoclide - CoC](https://github.com/neoclide/coc.nvim) |
| [Linting](#linting) | Code smells, warnings and errors | [Dense-analysis - ALE](https://github.com/dense-analysis/ale), [OmniSharp](https://github.com/OmniSharp/omnisharp-vim) |
| [File Explorer](#file-explorer) | File browsing and management | [lambdalisue - Fern](https://github.com/lambdalisue/fern.vim) |
| Quick Fixes | Quickly preview and navigate compiler warnings/search results (vimgrep) | [Bfrg - QF Preview](https://github.com/bfrg/vim-qf-preview), [Romainl - QuickFix](https://github.com/romainl/vim-qf) |
| [Colour theme](#colour-theme) | A very pretty colourscheme - Vimspirational set to 'andromeda' | [Sainnhe - Sonokai](https://github.com/sainnhe/sonokai) |
| Language pack | Syntax highlighting | [Sheerun - Polyglot](https://github.com/sheerun/vim-polyglot) |
| [Rainbow Parenthesis](#rainbow-parenthesis) | Recognise where TF you are in nested hell | [Luochen1990 - Rainbow](https://github.com/luochen1990/rainbow) |
| Multi-line Editing | Multi line edits (helpful for [refactoring](https://code.visualstudio.com/docs/editor/refactoring#_rename-symbol) like in VSCode for languages not supported by LSP) | [mg979 - Visual Multi](https://github.com/mg979/vim-visual-multi) |
| Custom text objects | Create custom text objects, dependency of other textobject plugins | [kana - Textobj-User](https://github.com/kana/vim-textobj-user) & [again](https://github.com/kana/vim-textobj-line), [TPope - JDaddy](https://github.com/tpope/vim-jdaddy) |
| Large file handling | Settings to improve editing large files | [Charles Campbell - LargeFile](https://github.com/vim-scripts/LargeFile) |
| Repeat | Repeat actions made with plugins (Vimify plugins) | [TPope - Repeat](https://github.com/tpope/vim-repeat) |
| Surround | Add/Edit/Remove surrounding characters (quotes, tags, paren, brackets) | [TPope - Surround](https://github.com/tpope/vim-surround) |
| Sensible | Sensible Vim mappings the community agree on, likely overwritten some as a lot in there | [TPope - Sensible](https://github.com/tpope/vim-sensible) |
| Commentary | Comment shortcuts for Vim | [TPope - Commentary](https://github.com/tpope/vim-commentary) |
| [Debugging](#debugging) | Debugging within Vim | [puremourning - Vimspector](https://github.com/puremourning/vimspector) |
| Scrollbar | See where you are in a file | [noscript - Elevator](https://github.com/noscript/elevator.vim) ([with some contributions from myself](https://github.com/elevator.vim/pull/5)) |

## Vimspirational in action

### Dashboard/ Start Screen

![Startify](https://github.com/b0dee/vimspirational/raw/master/img/startify.png)

### Git Integration

![Fugitive](https://github.com/b0dee/vimspirational/raw/master/img/fugitive.png)

![Fugitive2](https://github.com/b0dee/vimspirational/raw/master/img/fugitive2.png)

![Fugitive_Diff](https://github.com/b0dee/vimspirational/raw/master/img/fugitive_diff.png)

![Fugitive_Commit](https://github.com/b0dee/vimspirational/raw/master/img/fugitive_commit.png)

### Language Server Protocol

Best seen using it. Open a file and use 'tab' key to start completion while
typing a word. Use 'gi' on a method to go to implementation, 'gd' to go to
definition, '<leader>sr' to show references.

### Linting

![ALE_Linting](https://github.com/b0dee/vimspirational/raw/master/img/ale.png)

### File Explorer

![Fern](https://github.com/b0dee/vimspirational/raw/master/img/fern.png)

### Colour theme

![Theme_Markdown](https://github.com/b0dee/vimspirational/raw/master/img/theme_markdown.png)

![Theme_Source_Code](https://github.com/b0dee/vimspirational/raw/master/img/theme_src_code.png)

### Debugging

![Vimspector](https://github.com/b0dee/vimspirational/raw/master/img/vimspector.png)

#### Vimspector Debugging Notes

For C Sharp programs, it uses netcoredbg. This requires you to point the program
to the dll of the project being run, and needs to be built first (make sure you
build it for Debug)

Example CSharp .vimspector.json
```json
{
  "configurations": {
    "launch - netcoredbg": {
      "adapter": "netcoredbg",
      "configuration": {
        "request": "launch",
        "program": "${workspaceRoot}/bin/Debug/net7.0/win7-x64/<project>.dll",
        "args": [],
        "stopAtEntry": false
      },
      "breakpoints": {
        "exception": {
          "user-unhandled": "",
          "all": ""
        }
      }
    }
  }
}
```

Get NextJS working with vscode-js-debug adapter using the following config:

```json
{
  "configurations": {
    "run - next-js-debug": {
      "adapter": "js-debug",
      "configuration": {
        "request": "launch",
        "program": "./node_modules/next/dist/bin/next",
        "timeout": 100000,
        "resolveSourceMapLocations": [
          "${workspaceFolder}/**",
          "!**/node_modules/**"
        ],
        "cwd": "${workspaceRoot}",
        "stopOnEntry": false
      }
    }
  }
}
```

## Reasoning

I tried VSCode with Vim mappings. Then tried to run a global command.
DENIED. (Went back to Vim)

NVChad recently popped up onto my radar and reignited my passion for
development, the good parts of VSCode with no bloat/limitations??
Or so I thought, using NeoVim quite happily - but short lived...

It crashed on me trying to run a :g command on a ~500mb file. Unacceptable.
Vim has performed this for me on larger files before.

But NVChad really impressed me with look and feel so I wanted to try replicate
that in OG Vim. Think of it as VimChad, NVChad's vimscript cousin.

I've moved over functionality I deemed essential to modern day development ecosystems
(Git integration, LSP, completion, linting, debugging, project tree for structure
viewing - not navigation!).

Also has my own personal preferences/ customisation

*NOT* open to PRs. Clone/fork and make it your own.
