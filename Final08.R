#chapter 08 함수와 논리흐름 제어
#8-1
even <-function(x) (x%%2==0)
c(-5:5, Inf, -Inf, NA, NaN)
even(c(-5:5, Inf, -Inf, NA, NaN))


#8-2
cnteven <- function(x) {
  ecnt <- 0
  ocnt <- 0
  cnt <- 0
  for(val in x){
    cnt <- cnt+1
    print(cnt)
    #if(!is.na(val %% 2 ==0)&(val %% 2 ==0)) cnt <- cnt+1
    ifelse(val %% 2 == 0, ecnt <- ecnt+1, ocnt <- ocnt+1)
    print(ecnt)
    print(ocnt)
    }
}
c(-5:5, Inf, -Inf, NA, NaN)
cnteven(c(-5:5, Inf, -Inf, NA, NaN))
length(c(-5:5, Inf, -Inf, NA, NaN))


#8-3
test3 <- function(x){
  ifelse(x > pi, TRUE, FALSE)
}
test3(c(3, 1:5))  


#8-4
norm4 <- function(x){
  x <- x[!is.na(x)]
  z <- (x-mean(x))/sd(x)
  return(z)
}
?norm
test4 <- c(1,2,3,4,5,NA)
norm4(test4)
?sd


#8-5
remove5 <- function(x, rem=';',rep=''){
  gsub(rem, rep, x)
}
?replace
?gsub
gsub(';','',sen5)

sen5 <- 'I saw her standing there; Misery; Anna (Go to him); Chains; Boys; Ask me why'
sen5
remove5(sen5)

#8-6
printclass <- function(x){
  if(is.data.frame(x)|is.matrix(x)){
    for (i in 1:ncol(x)) cat(colnames(x)[i], 'is', class(x[,i]),'\n')
  }
  else cat("It's neither a data frame nor a matrix.",'\n')

}
printclass(iris)
printclass(LakeHuron)


#8-7
# fun7 <- function(x, med=FALSE){
#   mean=round(mean(x, na.rm=TRUE),1)
#   sd=round(sd(x,na.rm = TRUE),1)
#   median=round(median(x,na.rm=TRUE),1)
#   if(med!=TRUE){
#     cat('Mean is',mean,'\b, and Standard Deviation is',sd,'\b.')
#   } else {
#     cat('Mean is',mean,'\b, and Standard Deviation is',sd,'\b.\n')
#     cat('Also Median is', median,'\b.')
#   }
# }

fun7 <- function(x, med=FALSE){
  mean=round(mean(x, na.rm=TRUE),1)
  sd=round(sd(x,na.rm = TRUE),1)
  cat('Mean is',mean,'\b, and Standard Deviation is',sd,'\b.\n')
  if(med==TRUE){
    median=round(median(x,na.rm=TRUE),1)
    cat('Also Median is', median,'\b.')
  }
}
fun7(1:50)
fun7(1:50, med=TRUE)


#8-8
alice <- c('Alice', 'was', 'beginning', 'to','get','very','tired','of','sitting','by','her','sister','on','the','bank',
           'and','of','having','nothing','to','do','once','or','twice','she','had','peeped','into','the','book',
           'her','sister','was','reding','but','it','had','no','pictures','or','conversations','in','it','and','what',
           'is','the','use','of','a','book','thought','Alice','without','pictures','or','conversations')
count.letters <- function(x){
  n.char <- nchar(x)
  for(i in min(n.char):max(n.char)){
    cat('These words have', i, 'letter(s) :\n')
    print(toString(unique(alice[n.char==i])))
  }
}
count.letters(alice)

# to.count.letters <- function(x){
#   n.char <- nchar(x)
#   for(i in min(n.char):max(n.char)){
#     cat('These words have', i, 'letter(s) :\n')
#     print(unique(alice[n.char==i]))
#   }
# }
# 
# ne.count.letters(alice)
# to.ne.count.letters(alice)
# to.count.letters(alice)


#8-9
library(car)
class(Salaries$salary)
(a)
mean.salary <- mean(Salaries$salary)
mean.salary
(b)
sd.salary <- sd(Salaries$salary)
sd.salary
df9 <- Salaries$salary[(Salaries$salary>mean.salary-2*sd.salary) & (Salaries$salary<mean.salary+2*sd.salary)]
head(df9)
length(Salaries$salary)
length(df9)
mean(df9)
(c)
df9.3 <- Salaries$salary[(Salaries$salary>mean.salary-3*sd.salary) & (Salaries$salary<mean.salary+3*sd.salary)]
head(df9.3)
length(df9.3)
mean(df9.3)


cal.mean <- function(x, remove.outlier=FALSE, mult.outlier=2){
  if(remove.outlier==TRUE){
    outlier.index <- (x > mean(x, na.rm=TRUE) + mult.outlier * sd(x, na.rm = TRUE)) | 
                     (x < mean(x, na.rm=TRUE) - mult.outlier * sd(x, na.rm = TRUE))
    x.new <- x[!outlier.index]
    result <- mean(x.new, na.rm=TRUE)
  } else {
    result <- mean(x, na.rm=TRUE)
  }
  return(result)
}
cal.mean(Salaries$salary)
cal.mean(Salaries$salary, remove.outlier=TRUE)
cal.mean(Salaries$salary, remove.outlier=TRUE, mult.outlier = 3)


#8-10
for (i in 1:12) {
  cat('The month of',month.name[i],'\n')
}

#8-11
vector11 <- c('Superman','Batman','Spiderman')
for (i in vector11){
  cat('Hello',i,'\b...\n')
}
for (i in vector11){
  cat(sprintf('Hello %s...\n',i))
}


#8-12
fun12 <- function(x) sample(c('H',"T"), size=1)
nflip <- 0
nhead <- 0
repeat{
  if(nhead>=10) break
  else {
    if(fun12()=='H') {
      nhead <- nhead+1
    } else nhead <- 0
  }
  nflip <- nflip + 1
}
nflip


#8-13
fun13 <- function() paste(sample(LETTERS, size = 3, replace=TRUE), collapse = '')

nflip13 <- 0
df13 <- data.frame(nflip13=numeric(), result=character())
flag <- TRUE
while(flag){
  nflip13 <- nflip13 + 1
  result <- fun13()
  rbind(df13, nflip13=nflip13, result=result)
  cat(nflip13,':', result,'\n')
  if(result=='ABC') flag <- FALSE
}
nflip13

