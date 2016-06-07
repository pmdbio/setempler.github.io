---
layout: manual
title:  "commands"
---

Some useful command usages.

---

* TOC
{:toc}

---

## find

```bash
# non readable
find . ! -perm -g+r
find . ! -readable

# exact permission
find . -perm 770  # exact for user, group, world
find . -perm -660 # exact for user, group
find . -perm -g+r  # exact for group
```

## history

```bash
!find # run most recent 'find' command
!N    # run command from history line N
!-N   # run Nth previous command
```

## tmux

Session > Window > Panel

```bash
# list sessions
tmux ls
# new
tmux new[-session] [-s ID] [-n WID]
# attach session
tmux a[ttach-session] [-t ID]
# rename
tmux rename[-session] [-t ID] NEWID
```

```
ctrl + b, l     # last window
ctrl + b, d     # detach
ctrl + b, ,     # rename window
ctrl + b, $     # rename session
ctrl + b, &     # kill window
ctrl + b, x     # kill panel
ctrl + b, :     # prompt
  move-window -t N # move window to position
```
