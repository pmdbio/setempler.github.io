---
layout: manual
title:  "tar, gzip and friends"
---

About (un)archiving, (de)compressing and de-/encrypting files.

---

* TOC
{:toc}

---

## differences

compression: gzip > zip
archiving: zip, tar

## list

```bash
# tar
tar tf file.tar
tar tzf file.tar.gz
# gzip
gunzip -l file.gz
# zip
unzip -l file.zip
```

* the relevant options are `[-]t` for `tar` and `-l` for `gunzip` and `unzip`
* in `tar`, the options can be provided without prefixed `-`  
  the option `-z` is detected automatically
* in `unzip`, the file argument can be provided without `.zip` ending

## extract

```bash
# tar
tar xf file.tar.gz
# gzip
gzip -dc file.gz > file
zcat file.gz > file
gunzip -c file.gz > file
# zip
unzip file.zip -d target/directory/
```

* the relevant options are `[-]x` for `tar`
* the option `-c` for `gunzip` prevents deletion of the archive after extraction

## compress

```bash
# tar
tar jcf file.tar.bz folder # bzip2
tar zcf file.tar.gz folder # gzip
# gzip
cat file1 file2 | gzip > files.gz
gzip -c file1 file2 > file.gz
# zip
zip -r folder.zip folder
```

* the relevant options are `[-]c` for `tar`
* in `gzip` the method using `cat` is more optimal

## encryption

```bash
# archive and encrypt
tar cz directory/ | gpg -c -o directory.tar.gpg
# decrypt and unarchive
gpg -d directory.tar.gpg | tar xz
```
