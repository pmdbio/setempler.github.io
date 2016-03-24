---
layout: manual
title: "contrasts in linear models"
---

Overview of contrasts in linear models and usage in **R**.

---

Content:

* TOC
{:toc}

---

## Example data


```r
f <- gl(n = 3, k = 2, labels = c("control", "low", "high"))
f
```

```
## [1] control control low     low     high    high   
## Levels: control low high
```

## Dummy / indicator contrasts (`contr.treatment`)

Conditional mean between one classification and intercept (reference level).


```r
model.matrix(~ f, contrasts.arg = list(f = "contr.treatment"))
```

```
##   (Intercept) flow fhigh
## 1           1    0     0
## 2           1    0     0
## 3           1    1     0
## 4           1    1     0
## 5           1    0     1
## 6           1    0     1
## attr(,"assign")
## [1] 0 1 1
## attr(,"contrasts")
## attr(,"contrasts")$f
## [1] "contr.treatment"
```

## Deviation / effect contrasts (`contr.sum`)

Measures the distance between individual levels and the mean of all the levels.


```r
model.matrix(~ f, contrasts.arg = list(f = "contr.sum"))
```

```
##   (Intercept) f1 f2
## 1           1  1  0
## 2           1  1  0
## 3           1  0  1
## 4           1  0  1
## 5           1 -1 -1
## 6           1 -1 -1
## attr(,"assign")
## [1] 0 1 1
## attr(,"contrasts")
## attr(,"contrasts")$f
## [1] "contr.sum"
```

## Helmert contrasts (`contr.helmert`)

Compare the current level with the average of the all the levels that preceded it. Thus Helmert contrast coding is especially appropriate if there is a natural order to the categories because then sequential comparisons of this sort make sense.


```r
model.matrix(~ f, contrasts.arg = list(f = "contr.helmert"))
```

```
##   (Intercept) f1 f2
## 1           1 -1 -1
## 2           1 -1 -1
## 3           1  1 -1
## 4           1  1 -1
## 5           1  0  2
## 6           1  0  2
## attr(,"assign")
## [1] 0 1 1
## attr(,"contrasts")
## attr(,"contrasts")$f
## [1] "contr.helmert"
```

## `contr.poly`

tba


```r
model.matrix(~ f, contrasts.arg = list(f = "contr.poly"))
```

```
##   (Intercept)           f.L        f.Q
## 1           1 -7.071068e-01  0.4082483
## 2           1 -7.071068e-01  0.4082483
## 3           1 -7.850462e-17 -0.8164966
## 4           1 -7.850462e-17 -0.8164966
## 5           1  7.071068e-01  0.4082483
## 6           1  7.071068e-01  0.4082483
## attr(,"assign")
## [1] 0 1 1
## attr(,"contrasts")
## attr(,"contrasts")$f
## [1] "contr.poly"
```

## Literature

* [r blog][blog]
* [unc.edu][unc]
* [wikipedia][wikipedia]

[blog]: http://www.r-bloggers.com/using-and-interpreting-different-contrasts-in-linear-models-in-r/
[unc]: http://www.unc.edu/courses/2006spring/ecol/145/001/docs/lectures/lecture26.htm
[wikipedia]: https://en.wikipedia.org/wiki/Categorical_variable
