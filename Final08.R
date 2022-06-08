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
