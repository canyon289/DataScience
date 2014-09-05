# Reproducible Research: Peer Assessment 1


## Loading and preprocessing the data

Set working directory for my computer

```r
setwd("C:/Users/canyon/Documents/GitHub/DataScience/Reproducible Research/RepData_PeerAssessment1-master")
```

Load csv

```r
steps = read.csv("activity.csv")
```

## What is mean total number of steps taken per day?
Load packages

```r
library(ggplot2)
library(lubridate)
```

Split date column into day, month, year

```r
steps$day = day(steps$date)
steps$month = month(steps$date)
steps$year  = year(steps$date)
```

The mean of the totals steps taken per day is below

```r
mean(steps$steps, na.rm = T)
```

```
## [1] 37.38
```

```r
median(steps$steps, na.rm = T)
```

```
## [1] 0
```

## What is the average daily activity pattern?

```r
library(plyr)
```

```
## 
## Attaching package: 'plyr'
## 
## The following object is masked from 'package:lubridate':
## 
##     here
```

```r
avgsteps = ddply(steps, .(interval), summarise, msteps = mean(steps, na.rm = T))
qplot(interval, msteps, data = avgsteps)
```

![plot of chunk unnamed-chunk-6](./PA1_template_files/figure-html/unnamed-chunk-6.png) 

## Imputing missing values



## Are there differences in activity patterns between weekdays and weekends?
