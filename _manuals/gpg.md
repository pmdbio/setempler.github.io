---
layout: post
title:  "gpg"
---


* https://www.gnupg.org/gph/en/manual/book1.html
* http://irtfweb.ifa.hawaii.edu/~lockhart/gpg/

## create a private/public key pair

* passphrase 
  
  https://theintercept.com/2015/03/26/passphrases-can-memorize-attackers-cant-guess/

```bash
gpg --gen-key
```

## import/export 

* https://pgp.mit.edu
* https://www.gnupg.org/gph/en/manual/x457.html

```bash
gpg --import public.key
gpg --export -a "user id" > public.key
gpg --export-secret-key -a "user id" > private.key
gpg --keyserver certserver.pgp.com --search key "name"
gpg --keyserver certserver.pgp.com --recv-key "key id"
gpg --keyserver certserver.pgp.com --send-key "user id"
```

## edit

```bash
gpg --list-keys
gpg --list-secret-keys
gpg --edit-key "user id"
```
