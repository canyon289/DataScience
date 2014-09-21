# Statistical Inference Course Project



##Set Parameters for exponential distribution and simulation

```r
lambda = .2
n = 40
sim = 10000
```

##Simulating the mean of a thousand trials


```r
set.seed(1)
means = replicate(sim, expr = mean(rexp(n,lambda)))
```

##Theoretical Distribution Mean

```r
1/lambda
```

```
## [1] 5
```
##Simulated Mean

```r
mean(means)
```

```
## [1] 5.003
```
As you can see the results are quite close

##Similarly
##Theoretical Variance

```r
1/lambda^2
```

```
## [1] 25
```


```r
var(means)*n
```

```
## [1] 24.58
```



```r
library(ggplot2)
ggplot(data.frame(means), aes(x=means, color="red")) + geom_density() + stat_function(fun = dnorm, aes(color = "blue"), arg = list(mean = 1/lambda, sd=sqrt(lambda^-2/n))) + scale_colour_manual("Legend title", values = c("red", "blue"), labels = c("Theoretical","Simulated"))+ggtitle("Comparison of Simulated Distribution to Theoretical Distribution")
```

![plot of chunk plot](./Assignment1_files/figure-html/plot.png) 

##The confidence intervals of the mean estimate

```r
mean(means) + c(-1,1)*sd(means)/sqrt(40)*qnorm(.975)
```

```
## [1] 4.760 5.246
```



