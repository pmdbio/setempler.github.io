---
layout: manual
title:  "editors"
---

Introduction to editor configuration.

---

Content:

* TOC
{:toc}

---

## Vim

**Plugin Manager**

Install [Vundle](https://github.com/VundleVim/Vundle.vim), a vim plugin manager via:

```bash
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

Add configuration settings and a list of plugins to `.vimrc`, e.g.:

```
set nocompatible                                " be iMproved, required
filetype off                                    " required
set rtp+=~/.vim/bundle/Vundle.vim               " set runtime path
call vundle#begin()                             " vundle#begin('~/some/path/here'); plugins begin 
Plugin 'VundleVim/Vundle.vim'                   " required
Plugin 'tpope/vim-fugitive'                     " source: github repo
Plugin 'L9'                                     " source: ttp://vim-scripts.org/vim/scripts.html
Plugin 'git://git.wincent.com/command-t.git'    " source: git
Plugin 'file:///home/gmarik/path/to/plugin'     " source: local
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}      " runtime path for scripts in sub directories
Plugin 'ascenator/L9', {'name': 'newL9'}        " set different name to avoid conflicts
Plugin 'JuliaLang/julia-vim'
Plugin 'jalvesaq/Nvim-R'                        " requires vim > 7.4.999something
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'severin-lemaignan/vim-minimap'          " requires python
call vundle#end()                               " required; plugins end
filetype plugin indent on                       " required; indent is optional
```

Then start vim and install plugins from your config file with:

```
:PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
```

Some more commands are:

```
:PluginList       - lists configured plugins
:PluginUpdate     - update installed plugins, same as `:PluginInstall!`
:PluginSearch foo - searches for foo; append `!` to refresh local cache
:PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
:h vundle         - for more details or wiki for FAQ
```

---

## Sublime Text 3

[Homepage](http://www.sublimetext.com)

**Application Icon**

* [YabataDesign](https://github.com/YabataDesign/sublime-text-icon)

**Package Manager**

* Install [Package Control](https://packagecontrol.io/installation)
* Press `Cmd` + `Shift` + `p`
* Type `install`
* Select `Package Controll: Install Package`
* Choose from list, e.g.
    * Themes
        * `DarkMaterial` - colors and theme
        * `[Afterglow](https://github.com/YabataDesign/afterglow-theme)` blue
        * Alpenglow
    * Syntax
        * `MarkdownExtended`
        * `Julia` and `JuliaCompletions`
    * Development
        * `SublimeREPL` - read, evaluate, print loop, see [readthedocs](https://sublimerepl.readthedocs.org/en/latest/#structure-of-sublimerepl)
        * `MarkdownPreview` - preview Markdown documents
        * `Git` - run git commands
        * `GitGutter` - highlight `git diff` in the gutter (line counter)
    * Other
        * `HexViewer`
        * `Colorsublime` - install colors from repository, see [colorsublime.com](http://colorsublime.com)

**Configuration - User**

```json
{
    // view settings
    "always_show_minimap_viewport": true,
    "bold_folder_labels": true,
    "highlight_line": true,
    "rulers": [ 100 ],
    "show_encoding": true,
    "line_padding_bottom": 3,
    "line_padding_top": 3,
    "overlay_scroll_bars": "enabled",

    // edit settings
    "tab_size": 4,
    "translate_tabs_to_spaces": true,

    // other settings
    "ignored_packages": [ "Vintage" ],
    "remember_open_files": false,

    // theme settings

    //"theme": "Dark-Material.sublime-theme",
    //"color_scheme": "Packages/Theme - Dark Material/schemes/Dark-Material.tmTheme",

    "theme": "Afterglow-blue.sublime-theme",
    "color_scheme": "Packages/Theme - Afterglow/Afterglow.tmTheme",
    "tabs_small": true,
    "status_bar_brighter": true,
    "color_inactive_tabs": true

}
```

**File type: Markdown Extended**

* Open a file with a `.md` extension
* Select in the menu (OSX):
    * View > Syntax > Open all with current extension as... > *select syntax*

```json
{
    "extensions": [ "md" ],
    "color_scheme": "Packages/Theme - Afterglow/Afterglow-markdown.tmTheme",
    "draw_centered": false,
    "draw_indent_guides": false,
    "trim_trailing_white_space_on_save": false,
    "word_wrap": true
}
```

---

## Atom

[Homepage](https://atom.io)

**Packages**

* `script`
* `vim-mode`
* `language-r`
* `language-julia`
* `language-rmarkdown` (from [github](https://github.com/juba/language-rmarkdown))
* `minimap`
* `minimap-git-diff`
* `minimap-cursorline`
* `minimap-highlight-selected`

**Config Keyboard Shortcuts**

To insert R assignment string `" <- "` with a keybinding,

```bash
# ~/.atom/init.coffee
atom.commands.add 'atom-text-editor',
    'custom:insert-rrow': ->
        atom.workspace.getActiveTextEditor()?.insertText(' <- ')
```

```bash
# ~/.atom/keymap.cson
'atom-text-editor':
    'alt--': 'custom:insert-rrow'
```

**Ignore markdown whitespace**

Do not remove trailing whitespace from markdown files:

* open `~/.atom/keymap.cson`
* go to file `config.cson`
* add the following:

```json
".md.text":
    editor:
        softWrap: false
    whitespace: 
        removeTrailingWhitespace: false
        ignoreWhitespaceOnCurrentLine: false
```
