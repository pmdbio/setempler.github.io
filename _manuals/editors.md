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

Syntax:

* `git clone git://github.com/JuliaLang/julia-vim.git`

## Atom

[Homepage](https://atom.io)

### Packages

* script
* vim-mode
* language-r
* language-julia
* language-rmarkdown (from [github](https://github.com/juba/language-rmarkdown))
* minimap
* minimap-git-diff
* minimap-cursorline
* minimap-highlight-selected

### Config

#### R `<-` shortcut

Insert R assignment string `" <- "` with a keybinding:

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

#### Ignore markdown whitespace

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

## Sublime Text 3

[Homepage](http://www.sublimetext.com)

### Setup

* Install [Package Control](https://packagecontrol.io/installation)
* Press `Cmd` + `Shift` + `p`
* Type `install`
* Select `Package Controll: Install Package`
* Choose from list

### Packages

* `DarkMaterial` - colors and theme
* `Colorsublime` - install colors from repository, see [colorsublime.com](http://colorsublime.com)
* `SublimeREPL` - read, evaluate, print loop, see [readthedocs](https://sublimerepl.readthedocs.org/en/latest/#structure-of-sublimerepl)
* `Git`
* `GitGutter` - check also supported themes
* `SublimeGit`
* `HexViewer`
* `Julia` and `JuliaCompletions`
* `MarkdownPreview

### User Configuration

Example for enhanced configuration:

```json
{
    "theme": "Dark-Material.sublime-theme",
    "color_scheme": "Packages/Theme - Dark Material/schemes/Dark-Material.tmTheme","overlay_scroll_bars": "enabled",
    "line_padding_top": 3,
    "line_padding_bottom": 3,
    "always_show_minimap_viewport": true,
    "bold_folder_labels": true,
    "highlight_line": true,
    "overlay_scroll_bars": "enabled",
    "remember_open_files": false,
    "show_encoding": true,
    "tab_size": 4,
    "translate_tabs_to_spaces": true,
    "rulers": [100],
    "ignored_packages":
    [
        "Vintage"
    ]
}
```

Syntax highlight defaults:

* Open a file with a certain extension
* Select in the menu (OSX):
    * View > Syntax > Open all with current extension as... > *select syntax*


