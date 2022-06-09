#week11-1
#sort
x <- c(3,7,5,1,2,5)
sort(x)
sort(x, decreasing = TRUE)

#NA가 포함되어 있는 경우, NA는 출력되지 않음
length(x) <- 7
x
sort(x)
sort(x, na.last = TRUE)#NA가 가장 뒤에 위치
sort(x, na.last = FALSE)#NA가 가장 앞에 위치

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
cars <- within(mtcars,
                 am <- factor(am,
                              levels = c(0,1),
                              labels = c("Automatic","Manual")))
head(cars)

g <- split(cars$mpg, f=cars$am)
g

mean(g[[1]])
mean(g[["Manual"]])

#g에 있는 컬럼에 mean을 수행
sapply(g,mean)

#집단별로 분할된 리스트 반환
unstack(data.frame(mtcars$mpg, mtcars$am))

head(iris)
gg<- unstack(data.frame(iris$Sepal.Length, iris$Species))
head(gg)
str(gg)
summary(gg)

#처리할 벡터, 집단을 나타내는 팩터, 적용할 함수 3가지 인자 받음
tapply(X=iris$Sepal.Length, INDEX = iris$Species, FUN=mean)
tapply(X=iris$Sepal.Length, INDEX = iris$Species, FUN=length)

str(mtcars)
with(mtcars,tapply(mpg, list(cyl ,am), mean))
#tapply(mtcars$mpg, list(mtcars$cyl ,mtcars$am), mean)
with(mtcars,tapply(mpg, list(Cylincer=cyl ,Transmission=am), mean))


with(mtcars, 
     aggregate(x=mpg, by=list(Cylincer=cyl ,Transmission=am), 
                       FUN=mean))

aggregate(mtcars[1:6], list(Group.cyl=mtcars$cyl ,Group.am=mtcars$am), 
               FUN=mean)

aggregate(iris[1:4], list(Species=iris$Species), mean)


by(data=iris, INDICES = iris$Species, FUN=summary)
by(iris, iris$Species, function(x) mean(x$Sepal.Length))

#단순 합계용
rowsum(iris[-5], iris$Species)


#범주형 변수가 주어지면 변수가 몇개인가 알려줌
table(mtcars$gear)
table(mtcars$am)
table(mtcars$am, mtcars$gear)

#균일한 구간으로 나눔
mpg.cut <- cut(mtcars$mpg, breaks = 5)
#범주형 변수가 주어지면 변수가 몇개인가 알려줌
table(mpg.cut)

#2차원 교차표
xtabs(formula = ~am+gear, data=mtcars)
aggregate(formula=mpg~cyl+am, data=mtcars, FUN=mean)
