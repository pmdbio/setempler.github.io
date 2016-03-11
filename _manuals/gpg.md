---
layout: manual
title:  "gpg"
---

## links

* [gnupg manual][gpgman]
* [gpg chart][gpgchart]

## create a private/public key pair

Create a [passphrase][pw] using [Diceware][dw].  
Then run:

```bash
gpg --gen-key
```

## import/export 

* public [pgp server][mit] from MIT 
* gpg manual [section][gpgmanio]

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

[gpgman]: https://www.gnupg.org/gph/en/manual/book1.html
[gpgchart]: http://irtfweb.ifa.hawaii.edu/~lockhart/gpg/
[pw]: https://theintercept.com/2015/03/26/passphrases-can-memorize-attackers-cant-guess/
[dw]: http://world.std.com/~reinhold/diceware.html
[mit]: https://pgp.mit.edu
[gpgmanio]: https://www.gnupg.org/gph/en/manual/x457.html
