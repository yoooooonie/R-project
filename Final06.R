#6장 텍스트 날짜
#No.6-1
txt1 <- c("Happy","Birthday","to","You")
length(txt1)
nchar(txt1)
sum(nchar(txt1))+length(txt1)

#No.6-2
txt2 <- paste(txt1, collapse = " ")
length(txt2)
nchar(txt2)

#No.6-3
LETTERS
paste(LETTERS[1:10], 1:10, sep=" ")
paste(LETTERS[1:10], 1:10, sep="")

#No.6-4
paste(c("red","blue"),"pen")
paste(c("red","blue"),"pen",sep="-")
paste(c("red","blue"),"pen",collapse = "; ")
paste(c("red","blue"),"pen",sep="-", collapse = "; ")

#No.6-5
txt5 <- "Good Morning"
txt5.s <- strsplit(txt5, split = " ")
txt5.s
list(txt5.s[[1]][1],txt5.s[[1]][2])


#No.6-6
txt6 <- c("Yesterday is history, tomorrow is a mystery, today is a gift!",
          "That's why we call it the present -from Kung Fu Panda")
strsplit(txt6, split = ",? -? ?")
strsplit(txt6, split = ",? -?")


#No.6-7
c1 <- c(1,2,3,4,5,6)
outer(c1, c1,FUN=paste)


#No.6-8
ssn <- c("941215-1234567","850605-2345678","760830-1357913")
substring(ssn,  8) <- "*******"
ssn
#답
paste(substr(ssn, 1, 7),"*******",sep="")

#No.6-9
data("USArrests")
str(USArrests)

index <- grep("New", row.names(USArrests))
index
USArrests[index,]
colMeans(USArrests[index,])

#No.6-10
txt6 <- c("a","ab","acb","accb","acccb","accccb")
grep("ac?b",txt6,value = TRUE) #없거나 1개
grep("ac*b",txt6,value = TRUE) #있어도 되고 없어도 되고
grep("ac+b",txt6,value = TRUE) # 1개이상


#6-11
#텍스트 '12/25/2030 23:59:59', '1/25/2031 23:59:59', '2/25/2031 23:59:59'를
#데이터프레임의 Datetime 변수에 저장한 후 이를 날짜 형식으로 변환하시오

?strptime

df6 <- data.frame(Datetime=c('12/25/2030 23:59:59', '1/25/2031 23:59:59', '2/25/2031 23:59:59'))
df6$Datetime

df6$Datetime <- strptime(df6$Datetime, 
                        format='%m/%d/%Y %H:%M:%S')
df6
str(df6)

#6-12
#seq() 함수를 이용하여 2030년 6월 1일부터 7일간의 날짜를 생성하고 다음과 같은 형식으로 출력하시오.
#'토-0601' 
start <- as.Date('2030/6/1',format='%Y/%m/%d')
format(seq(start, by=1, length.out=7) , format='%a-%m%d')

#6-13
#2030년 12월 25일, 2031년 1월 25일, 2032년 2월 25일을 다음과 같은 형식으로 출력하시오.
"December 25, 2030"

date6 <- as.Date(c('2030-12-25','2031-1-25','2032-2-25'))
date6
Sys.setlocale("LC_TIME","C")
?strptime
format(date6,'%B %d, %Y')
Sys.setlocale()#원래 기본 상태로 돌아옴

#6-14
#다음 텍쇼ㅡ트는 stringr 패키지에 포함된 sentences 데이터셋으로부터 처음 세 개 텍스트를 추출한 것이다.
#여기에 포함된 'The/the'를 모두 'THE'로 변경하시오(stringr 패키지 사용)
"The birch canoe slid on the smooth planks."
"Glue the sheet to the dark blur background."
"It's easy to tell the depth of a well"

library(stringr)
sen3 <- sentences[1:3]
sen3
str_replace_all(sen3, "the|The", replacement = "THE" )
str_replace_all(sen3, fixed('the', ignore_case = TRUE),"THE")

#No.6-14
#install.packages("stringr")
library(stringr)
search()
data(sentences)

str14 <- sentences[1:3]
str14 <- str_replace_all(str14, "The", replacement = "THE")
str14 <- str_replace_all(str14, "the", replacement = "THE")
str14
#답
str_replace_all(str14, fixed("the", ignore_case = TRUE), "THE")


#6-15
#다음 텍스트를 날짜 데이터로 변환하시오(lubridate 패키지 사용)
d1 <- 'January 1,2030'
d2 <- '2030-Mar-21'
d3 <- c('August 15(2030)','July 17 (2030)')
d4 <- '7-Jun-2030'
d5 <- '12/30/30'
library(lubridate)
Sys.setlocale("LC_TIME","C")
mdy(d1)
as.Date(mdy(d1))
ymd(d2)
as.Date(ymd(d2))
mdy(d3)
as.Date(mdy(d3))
Sys.setlocale()
dmy(d4)
as.Date(dmy(d4))
mdy(d5)
as.Date(mdy(d5))
