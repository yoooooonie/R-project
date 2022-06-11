#Y2022012 ¾çÀ±¹Ì
#1
score <-c(100, 95, 45, 77, 60, 30, 85, 49)
score
score[score<50] <- 50
score

#2
cha <- c("a", "b", "c", "d", "e", "f", "g", "h", "i","j")
cha
cha[1:length(cha) %% 3 == 0] <- "ZZZ"
cha

#3
x <- c("A", "B", "C")
x
rep(paste("Tipe",x,sep=" "),1:3)

#4
month.abb
mtx <- matrix(month.abb,3,4)
mtx
mtx[,2,drop=FALSE]


#5
x <- 1:12
mtx <- matrix(x,3,4)
mtx
mtx[2,] <- 200
mtx

#6
month.abb
month.name
lst <- list(month.abb=month.abb, month.name=month.name)
lst
lst[["month.abb"]][9] <- "September"
lst

#7
x <- 1:3
y <- 4:6
z <- 7:9
library(tibble)
tbl <- tibble(data=list(tibble(x,y),
                        tibble(y,z),
                        tibble(z,x)))
tbl
tbl$data

#8
data("USArrests")
head(USArrests)
subset(USArrests,subset=(UrbanPop >mean(UrbanPop)),select = c(Murder,UrbanPop))

#9
fruits <-  c("Apple", "Banana", "Orange")
amount <-  c(10, 20, 30)
sprintf("%s %s boxes",fruits,amount)

#10
library(stringr)
sent3 <-  sentences[1:3]
sent3
#(a)
gsub(pattern="the", replacement="THE", x=sent3, ignore.case = TRUE)
#(b)
str_replace_all(sent3, "the|The", "THE")

