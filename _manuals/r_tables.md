---
layout: manual
title:  "R tables"
---

Table transformation in R.

---

* TOC
{:toc}

---

## reshape

### long 2 wide

```r
# multiple grouping, multiple value columns
reshape(df,
  direction = "wide",
  v.names = c("measurement", "measurement2"), # value columns to expand
  timevar = c("group", "treatment"),          # grouping columns to expand by
  idvar   = c("id"),                          # observation ids to align by
  drop    = c("notes", "unrelated")           # columns not to expand/keep
  )

# multiple grouping, single value columns
# see also ?dcast.data.table
reshape2::dcast(df,
  id + annotation + feature ~ group,
  value.var = "measurement"
  )

# single grouping, single value columns
tidyr::spread(df,
  key = group_column,
  value = value_column
  )
```

## apply

functions:

* `data.table`
* `ave`
* `by`
* `aggregate`
* `ddply`

helper:

* `transform`
