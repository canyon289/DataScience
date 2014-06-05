#Question 1
library(datasets)
data(iris)
z = tapply(iris$Sepal.Length, iris$Species, mean)

#Question 2
apply(iris[,1:4], 2, mean)

#Question 3
data(mtcars)
tapply(mtcars$mpg, mtcars$cyl, mean)
tapply(mtcars["mpg"], mtcars["cyl"], mean)

#Question 4
a = tapply(mtcars$hp, mtcars$cyl, mean)
a["8"] - a["4"]
