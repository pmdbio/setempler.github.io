---
layout: manual
title: "__testing R markdown"
---

---

Content:

* TOC
{:toc}

---

## testing


```r
plot(1,1)
```

![center](/images/testing2/unnamed-chunk-1-1.png)


```r
print("foo")
```

```
## [1] "foo"
```


```r
print(t)
```

```
## function (x) 
## UseMethod("t")
## <bytecode: 0x7fca351bedc0>
## <environment: namespace:base>
```


```r
print # without {r} markdown
```
