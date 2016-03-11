---
layout: manual
title:  "tar, gzip and friends"
---

## differences

compression: gzip > zip
archiving: zip, tar

## list

```bash
tar tf file.tar
tar tzf file.tar.gz
gunzip -l file.gz
unzip -l file.zip
```

## extract

* `tar xf file.tar.gz`  
    a `-` before options is optional (at least version > 1.27.1)  
    `-z` detected automatically

* `gzip -dc > file`  
    same as `zcat file.gz > file` 
    and `gunzip -c > file`

* `unzip file[.zip] -d target/directory/`

## compress

* `cat file1 file2 | gzip > file.gz`  
    better than: `gzip -c file1 file2 > file.gz`

* `zip -r folder[.zip] folder`  
    recursive all files in folder to folder.zip

* `tar jcf file.tar.bz folder` # bzip2  
    `tar zcf file.tar.gz folder` # gzip  
    `c` : create

## encryption

* `tar cz directory/ | gpg -c -o directory.tar.gpg`
* `gpg -d directory.tar.gpg | tar xz`

