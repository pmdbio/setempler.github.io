---
layout: manual
title:  "user modification"
---

## add

```bash
groupadd [options] name
```

* `-g 1234` - group id (numeric)

```bash
useradd [options] name
```

* `-d /home/dir` - home folder
* `-u 1234` - user id (numeric)
* `-g 1234` - primary group name or id (numeric)
* `-m` - create home
* `-s /bin/bash` - shell
* `-G users,admin,foo` - secondary groups
* `-c "User name or comment"` - comment

## modify

```bash
groupmod [options] name
```

* `-n newname` - new group name
* `-g 1234` - new group id (numeric)

```bash
usermod [options] name
```

* `-l newname` - change login name
* `-c "New comment" - change comment
* `-d /home/new [-m]` - change and move home
* `-a -G group` - add to new group
* `-g group` - change primary group
