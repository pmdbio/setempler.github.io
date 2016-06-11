---
layout: manual
title:  "___testing"
---

---

Content:

* TOC
{:toc}

---

## example: bash

Text  
New `line` with more text ...  
New line

### highlight

{% highlight bash %}
#
OFS=$IFS     # store field separator
IFS="${2: }"
unset a i j
while read line
do
  a=A$i
  unset $a
  declare -a $a='($line)'
  i=$((i+1))
done < $1
{% endhighlight %}

### highlight rouge

```bash
##
OFS=$IFS     # store field separator
IFS="${2: }"
unset a i j
while read line
do
  a=A$i
  unset $a
  declare -a $a='($line)'
  i=$((i+1))
done < $1
```

## gist

{% gist 7a148a432e3938f6692f bash2Darray.sh %}

## example r

### highlight

{% highlight r %}
setClass("N", slots = c(n = "numeric", i = "integer"),
         validity = function (object) {
           valid <- any(object@n < 0, na.rm = TRUE)
           if (valid) return("Negative values are not allowed.") else TRUE } )
{% endhighlight %}

### highlight rouge

```r
setClass("N", slots = c(n = "numeric", i = "integer"),
         validity = function (object) {
           valid <- any(object@n < 0, na.rm = TRUE)
           if (valid) return("Negative values are not allowed.") else TRUE } )
```
