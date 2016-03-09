---
layout: post
title:  "Format LibreOffice cross reference text"
date:   2016-03-08
categories: libreoffice macro
---

In LibreOffice (version 5.0.5), one needs to format each cross reference field
with a character style manually, if desired. A solution is to use a macro to
apply the style on all fields in a document, as in the following example.

## Installation

* Tools > Macros > Organize Macros > LibreOffice Basic > Select 'My Macros'
* 'New' > Paste macro code from below (overwrite all existing text) > Save
* Customize Toolbar (e.g. 'Formatting') > Add > LibreOffice Macros >
Choose 'XRef' command

## Macro Code:

Exchange the style name (default: `Internet Link` in the `XRef` subroutine)
to your preferences.

{% gist 096c689cddd8afd6982b %}

## Credit

Modified after [www_MKRD_info](https://forum.openoffice.org/en/forum/viewtopic.php?f=7&t=44614#p355072)
