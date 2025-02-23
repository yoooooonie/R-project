#No.2-1
1:10
10:1
c(1:10,9:1)

#No.2-2
seq(0,1,0.1)
seq(0,1,length.out=10)

#No.2-3
x <- 1:10
y <- 3:1
names(x) <- letters[1:10]
x
x+y

#No.2-4
signif(pi, digits=3)
round(pi)
round(pi, digits = 3)
ceiling(pi)
trunc(pi)

#No.2-5
heights <- c(179,161,165,185,158)
weights <- c(75,72,60,100,65)
#(a)
bmi <- weights/((heights/100)^2)
bmi
#(b)
weights[bmi>25]

#No.2-6
vec <- c(2,5,3)
?rep
rep(vec,5)
rep_len(vec,10)
rep(vec,c(2,5,3))

#No.2-7
c(TRUE,TRUE,FALSE,FALSE) & c(TRUE,FALSE,TRUE,FALSE)
c(TRUE,TRUE,FALSE,FALSE) | c(TRUE,FALSE,TRUE,FALSE)
c(TRUE,TRUE,FALSE,FALSE) + 1:4

#No.2-8
sum(c(1:100) %% 7 ==0)

#No.2-9
rep(c("a","b","c"),3)
rep(c(1,3,5),c(1,3,5))
rep(0:2, rep(2,3))
rep(seq(1:3),times=3) + rep(0:2,each=3)

#No.2-10
none.true <- c(FALSE,FALSE,FALSE)
some.true <- c(FALSE,1,FALSE)
all.true <- c(1,1,1)
true.missing <- c(1,1,NA)
false.missing <- c(NA,0,NA)
mixed <- c(1,0,NA)
any(none.true)
all(none.true)
any(some.true)
all(some.true)

#No.2-11
x <- 1:10
mean(x)
sd(x)
standard.x <- (x-mean(x))/sd(x)
mean(standard.x)
sd(standard.x)

#No.2-12
exam1 <- c(9,4,7,9)
exam2 <- c(10,5,8,7)
exam3 <- c(8,3,6,9)

pmax(exam1,exam2,exam3)


#No.2-13
dice1 <- factor(c(3,2,5,1,5,6,5), levels = c(1,2,3,4,5,6)  ,labels = c("one","two", "three", "four","five","six"))

table(dice1)                
                
#No.2-14
library(forcats)
grade <- factor(c("A","B","C","D","F"))
count <- c(11,25,30,5,2)
fct_relevel(grade,"F")
fct_reorder(grade,count,.desc=TRUE )
