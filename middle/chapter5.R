#No.1
lst <- list(1:12)
mtx <- matrix(1:12, nrow=4)
df <- data.frame(x=1:4, y=5:8, z=9:12)

length(lst)
length(mtx)
length(df)

#No.2
mtcars[1:4]
mtcars[,1:4]
mtcars[-c(5,6,7,8,9,10,11)]
mtcars[c("mpg","cyl","disp","hp")]
mtcars[-5:11]
mtcars[-c(5:11)]


#no.3
name <- c("Potter","Elsa","Gates","Wendy","Ben")
sex <- factor(c("F","M","F","M","F"))
math <- c(85,76,99,88,67)

df3 <- data.frame(name, sex, math)
df3

#성별 바꾸기
levels(df3$sex)
levels(df3$sex) <- c("M","F")
df3

str(df3) #변수확인


#No.4
#(a)
df3$state <- c(76,73,95,82,55)
df3

state <- c(76,73,95,82,55)
df3 <- cbind(df3, state)
df3

#(b)
df3$score <- (df3$math+df3$state)/2
df3

df3$score <- round((df3$math+df3$state)/2,1)
df3

df3$score <- with(df, round((math+state)/2,1))
df3

#(c)
df3$grade[df3$score>=90]<- "A"
df3$grade[df3$score>=80 & df3$score<90]<- "B"
df3$grade[df3$score>=70 & df3$score<80]<- "C"
df3$grade[df3$score<70]<- "D"
df3

#(d)
df3$grade <- factor(df3$grade, levels=c("A","B","C","D"), ordered = TRUE)
df3
str(df3)


#No.5
library(tibble)
x <- 1:5
y <- 3
z <- x^2 + y
tibble(x,y,z)


#No.6
head(iris)
str(iris)
#(a)
iris[-5]
iris.new <-iris[-c(5)]
str(iris.new)
#(b)
with(iris.new, mean(Sepal.Length))
with(iris.new, mean(Sepal.Width))
with(iris.new, mean(Petal.Length))
with(iris.new, mean(Petal.Width))
with(iris.new, mean(iris.new))

colMeans(iris.new)

#No.7
str(beaver1)
str(beaver2)
beaver1$id <- 1
beaver2$id <- 2
head(beaver1)
head(beaver2)
beaver12 <- rbind(beaver1, beaver2)
head(beaver12)
head(beaver12[,c(5,1:4)])

beaver12 <- beaver12[,c(5,1:4)]
str(beaver12)

subset(beaver12, subset=(activ==1))

#No.8
str(VADeaths)
class(VADeaths)
df8 <- data.frame(VADeaths)
class(df8)
df8
row.names(df8)
df8$Age <- row.names(df8)
df8
row.names(df8) <- NULL
df8
df8$Average <-rowMeans(df8[1:4])
df8
df8 <- df8[,c(5,6,1:4)]
df8

#No.9
str(USArrests)
class(USArrests)

head(USArrests)

n <- c(0:9)
USArrests[c((5*n)-4),]

seq(1,50,5)
USArrests[seq(1,50,5),]

nrow(subset(USArrests, subset=(Murder>15)))

row.names(subset(USArrests, subset=(Murder>mean(Murder))))

row.names(subset(USArrests, subset=(Murder==max(Murder))))
row.names(subset(USArrests, 
                 subset=(Murder==min(Murder))))

row.names(USArrests)[which.max(USArrests$Murder)]     
row.names(USArrests)[which.min(USArrests$Murder)]     

#No.10
search()
#install.packages("MASS")
library(MASS)
head(mammals)
str(mammals)
median(mammals$body)
mammals$size[mammals$body > median(mammals$body)] <- "Large"
head(mammals)
mammals$size[mammals$body < median(mammals$body)] <- "Small"
mammals$size <- ifelse(mammals$body>median(mammals$body), "large", "small")
head(mammals)


row.names(subset(mammals, subset=(mammals$size=="Large")))
subset(mammals, subset=(mammals$size=="Large"))


mammals[which.max(mammals$body),]
mammals[which.min(mammals$body),]


mammals$brain.percent <- with(mammals, round(brain/(body*1000)*100,2))

mammals

mammals[which.max(mammals$brain.percent),]
mammals[which.min(mammals$brain.percent),]

mammals[mammals$brain.percent>median(mammals$brain.percent) & (mammals$size=="large")]

subset(mammals, subset=(mammals$brain.percent2>median(mammals$brain.percent2) & (mammals$size=="large")))

mammals$brain.percent2 <- with(mammals, brain/(body*1000)*100)       
mammals       
       
       
#No.11
data(mtcars)
search()
install.packages("sqldf")
library(sqldf)
sqldf("select * from mtcars where mpg>30")
sqldf("select * from mtcars where mpg>30", row.names = TRUE)
sqldf("select * from mtcars where cyl=6 order by mpg", row.names = TRUE)

head(mtcars)
subset(mtcars, subset = (mpg>30))
subset(mtcars, subset = (cyl==6))[order(subset(mtcars, subset = (cyl==6))$mpg),]

#(b)
data(iris)
sqldf("select * from iris where [Sepal.Length] between 4.5 and 4.9
      and Species in ('versicolor','virginica')")
subset(iris, subset =(Sepal.Length>4.5 $ Sepal.Length<4.9 
       & Species %in% c('versicolor','virginica')))

sqldf("select avg([Sepal.Length]) as avg_Sepal_length, Species from iris group by Species ")
sapply(split(iris$Sepal.Length, iris$Species), mean)
