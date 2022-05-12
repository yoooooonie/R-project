#Week10
#입력
#데이터 프레임 형태로 불러옴
read.csv(file="product.csv")
?read.csv

read.csv(file="product_no_header.csv")
read.csv(file="product_no_header.csv", header=FALSE)

#각 라인은 레코드로 구성되어 있고, 구분자로 구분 되어 있다.

?read.table
read.table(file = "product.txt", header=TRUE)
read.table(file = "product_colon.txt", header=TRUE, sep=":")

#결측값으로 인식하고 싶으면, NA를 결측값으로 인식하도록 해야함 아니면 그냥 문자로 인식
read.table(file = "product_missing.txt", header=TRUE)
read.table(file = "product_missing.txt", header=TRUE,
           na.strings = ".")

#고정된 길이로 구분되는 경우
read.fwf(file = "product_fix.txt", widths = c(4,-1,10,8))
#열의 이름 주고 싶으면
read.fwf(file = "product_fix.txt", widths = c(4,-1,10,8),
         col.names = c("id", "name","price"))

#데이터구조가 복잡하고 정형화되지 않은 경우
readLines(con="word.txt")
readLines(con="word.txt", n=2) #읽어올 라인 길이 입력

#what 인수에 어떤 형식으로 읽어올지 지정
scan(file = "word.txt", what = character())
#패턴을 지정할 수 있다
scan(file = "word.txt", what = list(character(), numeric(), numeric()))
#패턴을 지정할 수 있다
scan(file = "word.txt", what = list(date=character(), 
                                    buy=numeric(), 
                                    sell=numeric()))
#패턴을 지정할 수 있다, 특정 라인만 읽도록 지정 가능
scan(file = "word.txt", what = list(date=character(), 
                                    buy=numeric(), 
                                    sell=numeric()),
     nlines = 2)

#패턴을 지정할 수 있다, 특정 라인만 읽도록 지정 가능
scan(file = "word.txt", what = list(date=character(), 
                                   buy=numeric(), 
                                   sell=numeric()),     
     skip=3)

     
#install.packages("openxlsx")
library(openxlsx)
read.xlsx(xlsxFile = "product.xlsx", sheet = 1)

#출력
pi
sqrt(3)
print(pi)
print(sqrt(3))
#각 인수에 적합한 형태로 출력해준다
print(matrix(c(1,2,3,4), ncol=2))
print(list("Batman","Spiderman","Ironman"))

#print 함수는 여러 인자를 받지 못함
print("The Square root of 3 is", sqrt(3), ".")
#cat은 여러 인자 받음
cat("The Square root of 3 is", sqrt(3), ".")
#이스케이프 시퀀스 지정 가능
cat("The Square root of 3 is", sqrt(3), "\b.")
#커서 다음줄로 옮기기 위한 지정 필요
#console에서 실행해보면 차이점 알 수 있음
cat("The Square root of 3 is", sqrt(3), "\b.","\n")

name <- "Jenny"
cat("Hello",name, "\b.\n","Isn\'t it","\t","A Lovely day")

hero <- list("Batman","Spiderman","Ironman")
#리스트는 바로 출력 불가 unlist 사용
cat(hero)
cat(unlist(hero))

pi
pi*100
pi/100
print(pi, digits = 3)
print(pi*100, digits = 3)

#cat 함수로 출력 자리수 지정하는 경우는 format 사용
cat(format(pi, digits = 3),"\n")

pnorm(-3:3)
#유효자리수 3개로 가장 작은 숫자를 일단 맞추고 나머지를 맞춤 그래서 소수 5째 자리까지 출력
print(pnorm(-3:3), digits = 3)

z <- c(0,1.64,1.96,2.58)
ptbl <- data.frame(Z=z, Lower=pnorm(-z), Upper=pnorm(z))
ptbl
print(ptbl, digits = 3) #각 열 별로 자리수가 다름 각 열의 값 중 작은 수에 맞춤

#파일로 저장하기
prime <- c(2,3,5,7,11,13,17,19)
cat(prime, file="prime.txt", sep="\t", "\n")

#기존파일에 추가하기
id <- c("A001","A002","A003")
name <- c("Mouse", "Keyboard","USB")
price <- c(30000,90000,50000)
cat(id, file = "product_cat.txt", sep="\t","\n")
cat(name, file = "product_cat.txt", sep="\t",append = TRUE, "\n")
cat(price, file = "product_cat.txt", sep="\t",append = TRUE, "\n")

#연결객체를 먼저 생성하고 붙이기
con <- file("product_cat2.txt", open = "w")
cat(id, file = con, sep = "\t", "\n")
cat(name, file = con, sep = "\t", "\n")
cat(price, file = con, sep = "\t", "\n")
close(con)

#출력 결과 파일로 저장
fah <- readline("Fahrenheit ?")
32
fah <- as.numeric(fah)
print(paste("Fahrenheit=", fah))
cel <- (fah-32)/1.8
print(paste("Celsius=",cel))

sink("Fahrenheit_output.txt")
#출력 결과 파일로 저장
fah <- readline("Fahrenheit ?")
32
fah <- as.numeric(fah)
print(paste("Fahrenheit=", fah))
cel <- (fah-32)/1.8
print(paste("Celsius=",cel))
sink()

head(Orange)
write.csv(x=Orange, file = "orange.csv")
#행이름 필요 없으면
write.csv(x=Orange, file = "orange.csv", row.names = FALSE)

write.table(x=Orange, file = "orange.txt", sep=";", row.names = FALSE)

rm(list=ls())
ls()
z <- c(0,1.64,1.96,2.58)
ptbl <- data.frame(Z=z, Lower=pnorm(-z), Upper=pnorm(z))
ptbl
#중간 데이터 저장하기
save(ptbl, file="ptbl.RData")
rm(ptbl)
ls()
ptbl
#저장된 데이터 가져오기
load("ptbl.RData")
ptbl

#파일 검색
list.files()
#하위 파일까지 검색
list.files(recursive = TRUE)
#숨겨진 파일까지 다 보고 싶다
list.files(all.files = TRUE)
#패턴 넣어서 찾기
list.files(pattern = "*.R")
list.dirs()
#경로 지정해서 찾기
list.files(path = "./middle")

file.create("temp.txt")
file.exists("temp.txt")
file.remove("temp.txt")


#readr
#install.packages('pander')
library(pander)
openFileInOS("product.csv")

#install.packages("tidyverse")
library(readr)

read_csv(file = "product.csv") #첫 행에 열이름이 있는 경우

read_csv(file = "product_no_header.csv",
         col_names = c('id','name','price')) #첫 행에 열이름이 없는 경우 지정

#첫 행에 열이름이 없는 경우
openFileInOS("product_no_header.csv")
read_csv(file = "product_no_header.csv")

#결측값이 있는 경우 결측값이 뭔지 지정해줘야 함
openFileInOS("product_missing.csv")
read_csv(file = "product_missing.csv",
         na='.')

#주석이 포함되어 있는 경우
openFileInOS("product_comment.csv")
read_csv(file = "product_comment.csv",
         comment='#')

#주석을 skip 인수로 제외하고 불러올 수 있음 몇 라인 제외
read_csv(file = "product_comment.csv",
         skip=1)

#구분자가 달라도 가능 구분자 지정 가능
openFileInOS("product.txt")
read_delim(file = "product.txt", delim=" ")

#첫 행에 열이름이 없는 경우
read_delim(file = "product_no_header.csv", delim=",",
           col_names = c('id','name','price'))

#고정된 열의 너비를 가지고 있는 경우
openFileInOS("product_fix.txt")

#비어있는 부분을 기준으로 열을 가져옴
read_fwf(file = "product_fix.txt", 
         col_positions = fwf_empty("product_fix.txt",
                                   col_names = c('id','name','price'))) 

#내가 입력한 열의 개수로 열을 가져옴
read_fwf(file = "product_fix.txt", 
         col_positions = fwf_widths(widths = c(5,10,8),
                                    col_names = c('id','name','price'))) 


#시작위치와 종료위치를 지정하면서 가져옴
read_fwf(file = "product_fix.txt", 
         col_positions = fwf_positions(start = c(1,6,16),
                                       end = c(5, 15, 23),
                                       c('id','name','price')))

#몇개 열만 가져올 수 있음
read_fwf(file = "product_fix.txt", 
         col_positions = fwf_positions(start = c(6,16),
                                       end = c(15, 23),
                                       c('name','price')))

#시작, 종료 위치를 알면 그것만 가져올 수 있음
read_fwf(file = "product_fix.txt", 
         col_positions = fwf_cols(name=c(6,15),price=c(16,23)))


#필드가 공백으로 구분된 경우 편히 가져올 수 있음
read_table(file = "product_fix.txt", 
           col_names = c('id','name','price'))
openFileInOS("product.txt")
read_table(file = "product.txt", 
           col_names = c('id','name','price'))

#라인단위로 읽어올 수 있음
openFileInOS("word.txt")
read_lines(file="word.txt")
#원하는 라인만 읽음
read_lines(file="word.txt", skip=1, n_max=3)

#하나의 원소로 불러오기 가능
read_file(file = "word.txt")

#기본 패키지에 포함된 Orange 이고 데이터프레임 형식
Orange

write_csv(x=Orange, file = "orange.csv")
read_csv(file="orange.csv")

write_delim(x=Orange, file = "orange2.txt", delim=";")
read_delim(file='orange2.txt', delim = ";")

#저장하기
write_lines(x=Orange$circumference, file = 'c.txt')
read_lines("c.txt")

#숫자의 앞이나 뒤에 있는 문자를 제거하고 숫자로 반환
parse_number("$100")
class(parse_number("$100"))
parse_number("30%")
parse_number("60.5Kg")
parse_number("Salary per year : $250,000")


#함수
transLength <- function(x){
  tlength <- round(x*0.9144, digits = 1)
  result <- paste(tlength, "m", sep="")
  return(result)
}

ls()

y <- c(100,150,200)
transLength(y)

#R에서는 함수역시 객체이다 다른 객체에 할당함으로 복사 가능 ()괄호는 없어야 함
trans2 <- transLength
trans2
trans2(y)

#return 없애고 적재하면 리턴 값 없음 하지만 수행은 되어 있고 값은 있음
transLength <- function(x){
  tlength <- round(x*0.9144, digits = 1)
  result <- paste(tlength, "m", sep="")
}
transLength(y)
print(transLength(y))

#return 없애고 적재하면 리턴 값 없음 하지만 수행은 되어 있고 값은 있음 꼭 return을 할 필요는 없음
transLength <- function(x){
  tlength <- round(x*0.9144, digits = 1)
  paste(tlength, "m", sep="")
}
transLength(y)

#숫자가 아닌경우 종료하기 추가
transLength <- function(x){
  if(!is.numeric(x)) return("Not a Number")
  tlength <- round(x*0.9144, digits = 1)
  paste(tlength, "m", sep="")
}
transLength("ABC")


#함수 만들어 보기 중괄호 없이 만들 수 있음
f1 <- function(x,y) {x+y}
f2 <- function(x,y) x+y

f1(1,3)
f2(1,3)

transLength <- function(x) paste(round(x*0.9144, digits = 1),"m", sep="")
transLength(y)

#길이변환 함수 만들기 
transLength <- function(x, multi, unit){
  if(!is.numeric(x)) return("Not a Number")
  tlength <- round(x*multi, digits = 1)
  paste(tlength, unit, sep="")
}
transLength(y, multi=3, unit="ft")
transLength(y, multi=36, unit="inch")
transLength(y)

#초기값 설정
transLength <- function(x, multi=0.9144, unit="m"){
  if(!is.numeric(x)) return("Not a Number")
  tlength <- round(x*multi, digits = 1)
  paste(tlength, unit, sep="")
}
transLength(y)
transLength(y, multi=3, unit="ft")

#내부함수 사용하는 인수들 정할 수 있다
transLength <- function(x, multi=0.9144, unit="m", ...){
  if(!is.numeric(x)) return("Not a Number")
  tlength <- round(x*multi, ...)
  paste(tlength, unit, sep="")
}
transLength(y, digits=2)
transLength(y)

#내부함수 인수 초기화 or 지정
transLength <- function(x, multi=0.9144, unit="m", digits=1){
  if(!is.numeric(x)) return("Not a Number")
  tlength <- round(x*multi, digits = digits)
  paste(tlength, unit, sep="")
}
transLength(y)

#내부함수에 초기 함수를 설정할 수 있음
transLength <- function(x, multi=0.9144, unit="m", FUN=round, ...){
  tlength <- FUN(x*multi, ...)
  paste(tlength, unit, sep="")
}
transLength(y)
transLength(y, FUN=signif, digits = 3)
transLength(y, FUN=floor)

ls()

x <- 11:15
scopetest <- function(x){
  cat("This is x :", x, "\n")
  rm(x)
  cat("This is after removing x :", x, "\n")
}
scopetest(x=15:11)
#함수내에 있던 x 삭제하고, 이후에는 글로벌 선언된 x를 찾아서 프린트 함




#논리흐름 제어
x <- pi
y <- 3
if(x>y) x
if(x<y) x #출력결과 없음

if(x<y) x else y
if(x>y) x else y

#벡터는 조건문에 들어갈 수 없고, 들어가더라도 처음 인자만 조건에 들어감
x <- pi
y <- 1:5
if(x<y) x else y #the condition has length > 1 and only the first element will be used
if(x>y) x else y

#벡터 연산을 통해서 
test <- c(TRUE, FALSE, TRUE, TRUE, FALSE )
yes <- 1:5
no <- 0
ifelse(test, yes, no) #test가 조건, 조건의 결과가 TRUE 이면 yes, FALSE이면 no 출력

ifelse(x>y, x , y)

#첫번째 조건에 따라 2번째 이후 수행
center <- function(x, type){
  switch(type, 
         mean=mean(x),
         median=median(x),
         trimmed=mean(x, trim=0.1)#절삭평균
  )
}
x <- c(2,3,5,7,11,13,17,19,23,29)
center(x, "mean")
center(x, "median")
center(x, "trimmed")

center <- function(x, type){
  switch(type, 
         mean=mean(x),
         median=median(x),
         trimmed=mean(x, trim=0.1),#절삭평균
         "Choose one of mean, median, trimmed."
  )
}
center(x, "other")

repeat print("hello")
break # 중지
next #다음

i <- 5
repeat {if(i>25) break
  else {print(i)
    i <- i+5}
}

i <- 5
while(i<=25){
  print(i)
  i <- i + 5
}

#for (var in list) statement
for (i in seq(from=5, to=25, by=5)) print(i) 
for  (i in seq(from=5, to=25, by=5)) i 

i <- 1
for  (i in seq(from=5, to=25, by=5)) i 
i

