#2022012양윤미
#1
point <- c(70,125,99,101,55,88,156,90) 
point
pmin(point,100)


#2
start <- as.Date('2030/1/1',format='%Y/%m/%d')
start
Sys.setlocale("LC_TIME","C")
format(seq(start, by=1, length.out=7) , format='%B %d (%a), %Y')
Sys.setlocale()#원래 기본 상태로 돌아옴


#3
library(lubridate)
startDate=ymd("2022-3-1")
endDate=ymd('2022-6-22')
startDate
endDate
startDate-endDate


#4 later
library(readr)
iris
write_delim(x=iris, file = "iris.txt", delim=";")
df4 <- read_delim(file = "iris.txt", delim = ";")




#5later
txt <- c("happy birthday to you", "good morning")
countWords <- function(txt){
  strsplit(txt[i],seq=' ')
  apply(txt, FUN=count())

  txt
}
?strsplit


#6
set.seed(123)
nrow(iris)
#(a)
sample.index <- sample(1:nrow(iris), size=nrow(iris)*0.05)
iris[sample.index,]

#(b)
library(dplyr)
slice_sample(iris, prop=0.05)


#7
library(gapminder)
str(gapminder)
str(country_codes)
library(dplyr)
anti <- anti_join(country_codes, gapminder, by="country")





#8 later
library(purrr)
library(stringr)
str(sentences)
sent3 <- sentences[1:3]
sent3
sent3 %>% sapply(length)
  
an1 <-strsplit(sent3, split = " ")
length(an1[[2]])
unlist(lapply(an1,length))


#9
library(reshape2)
library(tidyr)
smiths
smiths.long <- gather(smiths,
                  key=variable, value = value, time:height)



#10
str(ToothGrowth)
boxplot(len~supp, data=ToothGrowth,
        col=c('red','blue'), border='black',
        las=1, 
        main='The Effect of Vitamin C on Tooth Growth in Guinea Pigs',
        xlab='Supplement Type',
        ylab='Tooth Length',
        cex.lab=0.9, cex.axis=0.7)
