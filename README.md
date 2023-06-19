# ggsaver
Easy Saving of ggplot2 Plots

## Overview
`ggsaver` is an R package that provides a function to easily save ggplot2 plots to a specified directory. The function can be used to save a series of related plots with minimal code. If no file extension is provided, the plot is saved as a PNG.

## Installation
```r
install.packages("devtools")
devtools::install_github("eric-stat/ggsaver")
```

## Example
```r
library(ggplot2)
save.plot = ggsaver("my_plots")

ggplot(mtcars, aes(mpg, disp)) + geom_point()
save.plot("mpg_vs_disp")

ggplot(mtcars, aes(hp, disp)) + geom_point()
save.plot("hp_vs_disp")
