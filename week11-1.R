#week11-1
#sort
x <- c(3,7,5,1,2,5)
sort(x)
sort(x, decreasing = TRUE)

#NA가 포함되어 있는 경우, NA는 출력되지 않음
length(x) <- 7
x
sort(x)
sort(x, na.last = TRUE)
sort(x, na.last = FALSE)

#벡터 자체를 소팅하지 않음. 소팅되었을 때 인덱스를 출력함
y <- c(33,11,55,22,44)
order(y)
y[order(y)]

sort(y)

y <- c(33,11,55,22,44)
z <- c("Superman","Batman","Ironman","Antman","Spiderman")
df <- data.frame(y,z)
df

#y열 기준 
order(df$y)
df[order(df$y),]
#내림차순
df[order(df$y,decreasing=TRUE),]
df[order(-df$y),]


y <- c(33,11,55,22,44)
z <- c("Superman","Batman","Ironman","Antman","Spiderman")
w <- c("can fly", "can not fly","can fly","cannot fly","can fly")
df <- data.frame(y,z,w)
df

df[order(df$w, df$y),]

#각 열마다 다르게 소팅하고 싶은 경우
#install.packages("dplyr")
library(dplyr)
df[order(desc(df$w),y),]

arrange(df, w, y)
arrange(df, desc(w), y)


#집단 요약
split()
unstack()

head(mtcars)
#am 변수를 가지고 집단으로 만들어봄
mtcars <- within(mtcars,
                 am <- factor(am,
                              levels = c(0,1),
                              labels = c("Automatic","Manual")))
head(mtcars)

g <- split(mtcars$mpg, f=mtcars$am)
g

mean(g[[1]])
mean(g[["Manual"]])

sapply(g,mean)

unstack(data.frame(mtcars$mpg, mtcars$am))

head(iris)
gg<- unstack(data.frame(iris$Sepal.Length, iris$Species))
head(gg)
str(gg)
