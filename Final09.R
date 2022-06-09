#Chapter09 데이터 전처리
#9-1
x <- 5:10
x[c(1,2)] <- 2:3
x
x[-1]
x[-1] <- 1:5
x

#9-2
mtcars$weight[mtcars$wt > median(mtcars$wt)] <-'heavy'
mtcars$weight[mtcars$wt <= median(mtcars$wt)] <-'light'
head(mtcars)
tail(mtcars)


#9-3
mtcars[,order(colnames(mtcars))]


#9-4
#mtcars[mtcars$cyl=4,]
mtcars[mtcars$cyl==4,]
mtcars[-1:4,] #Incorrect
#mtcars[mtcars$cyl<=5]
mtcars[mtcars$cyl<=5,]
#mtcars[mtcars$cyl==4|6, ]
mtcars[mtcars$cyl==4|mtcars$cyl==6, ]
mtcars[mtcars$cyl %in% c(4,6), ]


#9-5
mtcars[1:15]
mtcars[1:15,]


#9-6
head(iris)
sample.index <- sample(1:nrow(iris), size=nrow(iris)*0.7)
iris[sample.index,]

library(dplyr)
slice_sample(iris, prop=0.7)



#9-7
names <- c('Gates','Jobs',"Bezos")
lapply(names, nchar)
sapply(names, nchar)


#9-8
lst1 <- list(A=matrix(1:12, nrow=3),B=matrix(1:12, nrow=2), C=1:12)
lst2 <- list(A=matrix(1:12, nrow=3),B=matrix(1:12, nrow=6), C=12:1)
identical(lst1, lst2)
mapply(identical, lst1, lst2)


#9-9
head(state.x77)
apply(state.x77, 2, mean)
apply(state.x77, 2, sd)


#9-10
install.packages('nycflights13')
library(nycflights13)
head(flights)
str(flights)
library(dplyr)

table(flights)

flights  %>% 
  count(flights[,'dest'], flights$dest)


df10 <- flights['dest','count','dist','delay']
























