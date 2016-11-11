---
layout: manual
title:  "linux and unix command line tools"
---

Some useful linux and unix command line tools explained.

---

* TOC
{:toc}

---

## Archiving (`tar` et al.)

**Notes**

* compression: gzip > zip
* archiving: zip, tar
* `tar` program options can be provided without the `-` prefix
* `unzip` does not need the full file name provided, `.zip` can be omitted

**Commands**

```bash
### list
# option `-t` for `tar` and `-l` for `unzip` and `gunzip`
tar tf file.tar
tar tzf file.tar.gz
gunzip -l file.gz
unzip -l file.zip

### extract
# option `-x` for `tar`
# prevent deletion of input files with `-c` option for `gunzip`
tar xf file.tar.gz
gzip -dc file.gz > file
zcat file.gz > file
gunzip -c file.gz > file
unzip file.zip -d target/directory/

## compress
# option `-c` for `tar`
# optimize by using `cat` with `gzip`
tar jcf file.tar.bz folder # bzip2
tar zcf file.tar.gz folder # gzip
cat file1 file2 | gzip > files.gz
gzip -c file1 file2 > files.gz
zip -r folder.zip folder

## encryption
# archive and encrypt
tar cz directory/ | gpg -c -o directory.tar.gpg
# decrypt and unarchive
gpg -d directory.tar.gpg | tar xz
```

---

## Command Line History (`history`)

```bash
!find # run most recent 'find' command
!N    # run command from history line N
!-N   # run Nth previous command
```

---

## Encryption (`gpg`)

**Notes**

* [gnupg manual][gpgman]
* [gpg chart][gpgchart]
* create a [passphrase][pw] using [Diceware][dw]
* public [pgp server][mit] from MIT
* gpg manual [section][gpgmanio]

```bash
### create a private/public key pair
gpg --gen-key

### import/export
gpg --import public.key
gpg --export -a "user id" > public.key
gpg --export-secret-key -a "user id" > private.key
gpg --keyserver certserver.pgp.com --search key "name"
gpg --keyserver certserver.pgp.com --recv-key "key id"
gpg --keyserver certserver.pgp.com --send-key "user id"

### edit
gpg --list-keys
gpg --list-secret-keys
gpg --edit-key "user id"
```

---

## Finding files (`find`)

```bash
# non readable
find . ! -perm -g+r
find . ! -readable

# exact permission
find . -perm 770  # exact for user, group, world
find . -perm -660 # exact for user, group
find . -perm -g+r  # exact for group
```

---

## HPC Workload Manager (`slurm`)

**Notes**

See information on the [homepage][slurm]
**Commands**

```bash
### get information

# show queues, and update every *N*th second
smap -i N
squeue -i N

# queue details
squeue -j ID[,ID,...] # per job
       -p NAME        # per partition
       -l             # increase output

# tabular info
sinfo -i N            # as in squeue
      -p NAME 
      -l

# list info
scontrol show -d                    # more details
              job|node|partition ID

### control jobs

# stop jobs
scancel -t PENDING|RUNNING|SUSPENDED # by state
        -n NAME                      # by job name
        -p NAME                      # by partition name
        -w node[1-5,7]               # by hostname

# modify
scontrol suspend|resume|hold ID

### submit job scripts

sbatch -J NAME              # jobname
       -p PARTITION[,...]   # partition
       -n N                 # number of tasks
       -c N                 # number of cpus per task
       -N N                 # number of hosts
       -w HOST[,...]        # host list
       -d afterok:ID[,...]  # dependency
       -t HH:MMSS           # runtime
       -o STDOUT            # stdout (and stderr if not specified)
       -e STDERR            # stderr
       --mem MB             # memory
       -a 0-N[%M]           # number of array jobs [at a time]
                            # %j = job ID
                            # %A = array ID
                            # %a = array index
```

---

## Terminal Multiplexing (`tmux`)

**Notes**

Hierarchy is *Session* > *Window* > *Panel*

**Commands**

```bash
### list sessions
tmux ls
### new
tmux new[-session] [-s ID] [-n WID]
### attach
tmux a[ttach-session] [-t ID]
### rename
tmux rename[-session] [-t ID] NEWID
```

**Keyboard Shortcuts**

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

---

## User Modification (`usermod` et al.)

```bash
### add group
groupadd [options] name
# `-g 1234` - group id (numeric)

### add user
useradd [options] name
# `-d /home/dir` - home folder
# `-u 1234` - user id (numeric)
# `-g 1234` - primary group name or id (numeric)
# `-m` - create home
# `-s /bin/bash` - shell
# `-G users,admin,foo` - secondary groups
# `-c "User name or comment"` - comment

### modify group
groupmod [options] name
# `-n newname` - new group name
# `-g 1234` - new group id (numeric)

### modify user
usermod [options] name
# `-l newname` - change login name
# `-c "New comment" - change comment
# `-d /home/new [-m]` - change and move home
# `-a -G group` - add to new group
# `-g group` - change primary group
```

[gpgman]: https://www.gnupg.org/gph/en/manual/book1.html
[gpgchart]: http://irtfweb.ifa.hawaii.edu/~lockhart/gpg/
[pw]: https://theintercept.com/2015/03/26/passphrases-can-memorize-attackers-cant-guess/
[dw]: http://world.std.com/~reinhold/diceware.html
[mit]: https://pgp.mit.edu
[gpgmanio]: https://www.gnupg.org/gph/en/manual/x457.html
[slurm]: http://slurm.schedmd.com/slurm.html