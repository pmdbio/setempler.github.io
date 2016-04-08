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

* Install [Package Control](https://packagecontrol.io)
* Press `Cmd` + `Shift` + `p`
* Type `install`
* Select `Package Controll: Install Package`
* Choose from list

* Install `Colorsublime`
* Press `Cmd` + `Shift` + `p`
* Type `install`
* Select `Colorsublime: Install Theme`
* Choose from list
* Add to `Preferences` > `Settings - User`
  ```json
"color_scheme": "Packages/Theme - Flatland/Flatland Dark.tmTheme",
"theme": "Flatland Dark.sublime-theme",
```

### Packages

* [Colorsublime](http://colorsublime.com) - check themes
* [Sublime REPL](https://sublimerepl.readthedocs.org/en/latest/#structure-of-sublimerepl)
* Git
* GitGutter - check also supported themes
* SublimeGit
* HexViewer
* Julia and JuliaCompletions
