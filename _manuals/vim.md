---
layout: manual
title:  "vim"
---

Control the `vim` editor.

---

* TOC
{:toc}

---

## modes

```
i (I)     insert at cursor (line start)
a (A)     append at cursor (line end)
o (O)     open new line after (before) cursor
```

## syntax

**{ [ n ] action } { n } move**

## action

```
J         join next n lines
r<c>      replace next n letters each by c
x         delete following character
X         delete previous character
c         change
d         delete
dd        delete line
y         copy
yy        copy line
p         put after cursor
P         put before cursor
u         undo
ctrl + r  redo action
.         repeat action
>> (<<) (un)indent
```

## move

```
         gg
   ctrl + b
   ctrl + u
          k
0 ^ B b h   l e w E W $
          j
   ctrl + d
   ctrl + f
          G
```

## navigate

```
gt          next tab
gT          prev tab
<n>gt       nth tab
%           matching bracket
^ws (:sp)   split horizontal
^wv (:vs)   split vertical
^wq         close current window
^ww         rotate/switch window
^wn         select nth window (?)
/PATTERN    search
n           search next
N           search previous
```

## file

```

:diffthis
:diffoff
:e file     open file
:tabe file  open file in tab
:ls         list opened
:b <path>   switch to path
:bn (:bp)   next (prev) path
:b<n>       nth path
:!cmd       shell command
:r file     read from file
:r!cmd      read from shell command
```

## substitute

```
:<m>[,<n>]s/PATTERN/REPLACEMENT/[g]
```
* `m` = start (line number, `.` current, `+/-` lines)
* `n` = stop (..., `$` end)
* `g` = global (multiple per line)

## r-plugin

```
\rf            start R
\rq            quit
\s{s|e}        send selection + echo
\l             send line
\d             send line and move
\o             send line and insert output
\r{left|right} send part of line
\s{s|e}        send selection | + echo
\p{p|e}        send paragraph | + echo
\a{a|e}        send file | + echo
\f{f|e}        send function | + echo

\rl   ls()
\rm   rmall()
\ra   args()
\re   examples()
\rh   help()
\rn   names()
\rp   print()
\rs   summary()
\rg   plot()
```
