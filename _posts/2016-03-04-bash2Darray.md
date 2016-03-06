---
layout: post
title:  "Faking 2D arrays in bash"
date:   2016-03-02
categories: bash array
---

Bash does not support 2 dimensional arrays.

A solution is (de)referencing of variables (line arrays in this case),
or to use an associative array and pseudo dimension separator.
See the following examples:

{% gist 7a148a432e3938f6692f %}

