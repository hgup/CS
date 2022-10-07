# Gantt Charts

- `nrow` counts the number of rows in a matrix

- `mySchedule$from` to access it and use`...[5]` to access the fifth row element under the `from` column. Hence, make sure that the column names are unique.

- `nchar(str)` gives the number of characters in a string

- `subset(dataset, conditions)` is used to get a subset of the `dataset` by supplying a "vector of bools" `true/false` called `conditions`

- when accessing data from a dataset (eg. `myScheduleData`) use the following syntax

  ```R
  myScheduleData[rows,cols]
  # eg. of rows: c(1,2,3), blank for all rows
  # eg. of cols: c("from","to"), blank for all cols

- `ylim` can also be given  as `c(n,1)` for the opposite order
- `segments` ???