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

*login shell*  

* from another host (ssh)  
* from local text console (tty)  
* OSX Terminal

*interactive shell*

* terminal (emulator), e.g. gnome-terminal, xterm

*environment files*

* `/etc/profile`: login shell
* `~/.bash_profile`: login shell
* `~/.profile`: login shell (others: `.login`, `.zlogin`)
* `~/.bashrc:` interactive shell

## Variables

* string variable example: `$V`
* array variable example: `${A[@]}`

### define

```bash
# strings
declare S
S=string
S+=text # concatenate

# defaults
S=${X:-default} # if $X is empty, use 'default'

# array
declare -a A
A[0]=value
A+=(value) # append

# associative array
declare -A Aa
Aa[key]=value
Aa["spaced key"]=value
Aa+=(value) # append
```

### remove pattern

```bash
# from front
${S#pattern}  # shortest
${S##pattern} # longest
# from behind
${S%pattern}  # shortest
${S%%pattern} # longest
```

### replace pattern

```bash
${S/pattern/replacement}  # shortest
${S//pattern/replacement} # longest

${S/#pattern/replacement} # from front
${A[@]/#/new_prefix}

${S/%pattern/replacement} # from behind
${A[@]/%/new_suffix}
```

### sizes and indices

```bash
${#S}     # string length
${#A[@]}  # array size
${#A[0]}  # string length

${!A[@]}  # array indices (0-based)
${!Aa[@]} # keys
```

### subset

```bash
${S:2}      # from front
${S:(-3)}   # from behind
${S:2:1}    # from front by length
${A[@]:2:1} # from index by elements
```

### print

```bash
printf '%s\n' ${A[@]}
```

### examples

```bash
${V/#*.} # file ending
${V##*.} # file ending
${V##*/} # basename
```

