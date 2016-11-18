---
layout: manual
title:  "bash"
---

Information on the bourne again shell (bash).

---

* TOC
{:toc}

---

## Environment

**interactive login**

Invoked by

* `/bin/login`, e.g. `ssh` without command, or local text console (tty)
* `bash --login`
* `Terminal.app` from macOS

using

* `/etc/profile`
* `~/.bash_profile`
* `~/.bash_login`
* `~/.profile`

**interactive non-login**

Invoked by

* `bash` from prompt, excluding option `-c` and `file` argument
* `/bin/su`
* a terminal emulator, e.g.  `xterm`, `console` or `gnome-terminal`

using

* `/etc/bashrc`
* `~/.bashrc`

**non-interactive**

Invoked by

* `bash file`

using the parent environment.

## Variables

**Methods**

```bash
### declare
declare S                  # string
declare A                  # array
declare -a AA              # array, associative

### assign
S="string"
A[0]="value"
AA["key value"]="value"
S=${X:-$Y}                 # supply default value ($Y), if $X is empty

### append
S+="text"                  # append string
A+=("value")               # append element

### remove pattern
# from front
${S#pattern}               # shortest
${S##pattern}              # longest
# from behind
${S%pattern}
${S%%pattern}

### replace pattern
# any
${S/pattern/replacement}   # shortest
${S//pattern/replacement}  # longest
# from front
${S/#pattern/replacement}
${A[@]/#/new_prefix}
# from behind
${S/%pattern/replacement}
${A[@]/%/new_suffix}

### sizes and indices
${#S}                      # string length
${#A[0]}                   # string length
${#A[@]}                   # array size
${!A[@]}                   # array indices (0-based)
${!Aa[@]}                  # array keys

### subset
${S:2}                     # from front
${S:(-3)}                  # from behind
${S:2:1}                   # from front by length
${A[@]:2:1}                # from index by elements

### print
printf '%s\n' ${A[@]}
```

**Examples**

```bash
${V/#*.} # file ending
${V##*.} # file ending
${V##*/} # basename
```
