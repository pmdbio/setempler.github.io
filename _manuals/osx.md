---
layout: manual
title:  "osx"
---

Some tweaks for the OSX.

---

* TOC
{:toc}

---

## terminal

add keys for `tmux` resize:

* ctrl + up: `<ESC>[1;5A`
* ctrl + down: `<ESC>[1;5B`

## finder


```
defaults write com.apple.finder AppleShowAllFiles YES
```

## global OSX shortcuts

outcomment shortcuts in Sublime keymap
pref > keyboard > shortcuts > App Shortcuts
+ (Add)
Set All Application

*CMD SHIFT f*
Enter Full Screen / Exit Full Screen

*CTRL ALT Left/Right*
Next Tab (RStudio)
Next File (Sublime)
Show Next Tab (Finder)
Select Next Tab (Terminal)

Previous Tab ...

## automator

automator

right panel > service receives input
choose "no input"
right panel > ... in
choose "any application"

left panel > actions > Variables: search "launch"
choose "Launch Application"

right panel > launch application
choose application

save as Launch XYZ

goto keybindings > services > general
set keybinding for launcher

## brew

URL: http://brew.sh

INSTALL:

```bash
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

SOFTWARE EXAMPLE:

```bash
brew install git bash coreutils rsync
#brew update
#brew upgrade
brew tap homebrew/science
brew install R
```
