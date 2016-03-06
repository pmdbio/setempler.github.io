---
layout: default
title: manuals
permalink: /manuals/
---

# Manuals

{% for man in site.manuals %}* [{{ man.title }}]({{ man.url | prepend: site.baseurl }})
{% endfor %}

