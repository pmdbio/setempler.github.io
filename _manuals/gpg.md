---
layout: post
title:  "gpg"
---

## links

* [gnupg manual][gpgman]

* [gpg chart][gpgchart]

## create a private/public key pair

* [passphrase][pw]

{% highlight bash %}
gpg --gen-key
{% endhighlight %}

## import/export 

* https://pgp.mit.edu
* https://www.gnupg.org/gph/en/manual/x457.html

{% highlight bash %}
gpg --import public.key
gpg --export -a "user id" > public.key
gpg --export-secret-key -a "user id" > private.key
gpg --keyserver certserver.pgp.com --search key "name"
gpg --keyserver certserver.pgp.com --recv-key "key id"
gpg --keyserver certserver.pgp.com --send-key "user id"
{% endhighlight %}

## edit

{% highlight bash %}
gpg --list-keys
gpg --list-secret-keys
gpg --edit-key "user id"
{% endhighlight %}

[gpgman]: https://www.gnupg.org/gph/en/manual/book1.html
[gpgchart]: http://irtfweb.ifa.hawaii.edu/~lockhart/gpg/
[pw]: http://irtfweb.ifa.hawaii.edu/~lockhart/gpg/
