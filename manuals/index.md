---
layout: default
---

# manuals ...

Find some useful information about software and programming on the following pages:

{% for man in site.manuals %}
* **[{{ man.title }}]({{ man.url | prepend: site.baseurl }})**
{% endfor %}

