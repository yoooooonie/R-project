#Week9 날짜
Sys.Date() #현재날짜
class(Sys.Date())#별도의 형식 
date()
Sys.time()

#YYYY-MM-DD or YYYY/MM/DD의 형태인 경우 날짜 객체로 변환해줌
as.Date("2025-12-31")#날짜 객체로 변환해줌
as.Date("2025/12/31")#날짜 객체로 변환해줌
as.Date("12/31/2025", format("%m/%d/%Y")) #형식이 안 맞는 경우 format 지정해줘야함

?strptime

d <- as.Date("2025-12-31")
d
format(d, format="%m/%d/%Y")

today <- Sys.Date()
today
format(today, format="%Y/%m/%d %A %a")

d <- as.Date("2025-12-31")
d
weekdays(d)

#날짜도 연산이 가능함, 벡터 연산도 됨
d+7
d+1:7

weekdays(d+1:7)

seq(d, d+31, 2)

start <- as.Date("2025-01-01")
end <- as.Date("2025-01-31")
seq(start, end, by=1)
seq(start, by=1, length.out=7)
seq(start, by="7 days", length.out=7)
seq(start, by="week", length.out=7)
seq(start, by="month", length.out=7)
seq(start, by="year", length.out=7)
seq(start, by="10 years", length.out=7)
#2월은 조심하기
seq(from=as.Date("2025-01-30"), by="month", length.out=6)


#months()
#quarters()
qrt <- seq(start, by="3 months", length.out=4)
quarters(qrt)
months(qrt)

Sys.getlocale()
Sys.setlocale("LC_TIME","C")
months(qrt)
Sys.setlocale("LC_TIME","Korean_Korea.949")
Sys.setlocale()#원래 기본 상태로 돌아옴
months(qrt)


pct <- as.POSIXct("2025/03/15, 15:03:04", 
                  format="%Y/%m/%d, %H:%M:%S")
pct
class(pct)
as.integer(pct)#1970년 1월 1일부터 경과된 초(second)

#리스트구조
plt <- as.POSIXlt("2025/03/15, 15:03:04", 
                  format="%Y/%m/%d, %H:%M:%S")
plt
class(plt)
unclass(plt)

plt$mday#경과된 날 수
plt$mon
plt$year

dposix <- as.Date("2025/03/15")
dposix
as.POSIXlt(dposix)$wday
as.POSIXlt(dposix)$yday
as.POSIXlt(dposix)$year+1900

strptime("2025-12-31", format="%Y-%m-%d")
class(strptime("2025-12-31", format="%Y-%m-%d"))
strptime("2025-12-31", format="%Y-%m-%d")$year+1900

moon <- as.POSIXct("1969/7/20, 20:17:39", format="%Y/%m/%d, %H:%M:%S",
                   tz="UTC")
moon
format(moon, "The time of the Apollo landing was %Y/%m/%d, at %H:%M:%S.")

#따로 있는 경우 
y <- 2020
m <- 12
d <- 31
ISOdate(y,m,d)
class(ISOdate(y,m,d))
as.Date(ISOdate(y,m,d))

years <- c(2025:2028)
months <- c(1,4,7,10)
days <- c(12,19,25,17)
ISOdate(years, months, days)

#1970년 1월 1일 이후부터 경과한 날의 수로 저장됨 이러한 경우를 Julian date라고 한다
jdate <- as.Date("2025-12-31")
jdate
as.integer(jdate)
julian(jdate)

as.integer(as.Date("1970-01-01"))
as.integer(as.Date("1969-12-31"))

#julian date to date format
as.Date(as.integer(jdate), origin="1970-1-1")

moon <- as.POSIXct("1969/7/20, 20:17:39", format="%Y/%m/%d, %H:%M:%S",
                   tz="UTC")
moon
class(moon)
moon+ 60*60*2
moon+ 60*60*24*7
moon- 60*60*24*7

as.Date(moon)+7

#서울 올림픽 개최일 - 2018 평창올림픽 개최일
start <- as.Date("1988-9-17")
end <- as.Date("2018-2-9")
end-start


today <- Sys.Date()
Dooly <- as.Date("1983-4-22")
difftime(today, Dooly, units="days")
difftime(today, Dooly, units="weeks")

isTRUE(Dooly>today)
Sys.time() > moon
Sys.Date() > moon
Sys.Date() > as.Date(moon)




#날짜 lubridate/루브리데이트/
#install.packages("lubridate")
library(lubridate)
today()
now()

ymd("2030-3-15")
mdy("3-15-2030")
dmy("15032030")
dmy("1532030")
dmy("0112030")
dmy("01012030")
dmy("010130")
dmy("010187")
ymd("30-3-15")
ymd("2030년3월15일일")
mdy("3월 15일, 2030년년")
dmy("13-March-2030")
dmy("13th-march-2030")

mdy("March 15th, 2030") #이건 안되넹 , locale을 바꾸고 실행하면 정상 동작
Sys.setlocale("LC_TIME","C")
mdy("March 15th, 2030") #이건 안되넹 , locale을 바꾸고 실행하면 정상 동작
Sys.setlocale()
ymd(20300315)

"2030-3-15 23:11:59"
ymd_hms("2030-3-15 23:11:59")
ymd_hm("2030-3-15 23:11")
ymd_h("2030-3-15 23")

years <- c(2030,2031,2032,2033)
months <- c(1,4,7,10)
days <- c(12,19,25,17)
hours <- c(3,7,11,20)
mins <- c(5,12,33,59)
secs <- c(15,5,27,55)

dt <- data.frame(years, months, days, hours, mins, secs)
dt

make_date(year=years, month = months, day = days)
make_datetime(year=years, month = months, day = days,
              hour = hours, min = mins, sec = secs)

ymd("2030-3-15")
as_datetime(ymd("2030-3-15"))
ymd_hms("2030-3-15 23:11:23")
as_date(ymd_hms("2030-3-15 23:11:23"))


#날짜 구성요소
datetime <- ymd_hms("1969/07/20, 20:17:39")
datetime
year(datetime)
month(datetime)
mday(datetime) 
hour(datetime)
minute(datetime)
second(datetime)
yday(datetime) #1969년에 몇번째 날인가
wday(datetime)

Sys.setlocale("LC_TIME","C")
month(datetime, label=TRUE)
wday(datetime, label=TRUE, abbr=FALSE)
Sys.setlocale()

month(datetime, label = TRUE)
wday(datetime, label = TRUE)

datetime
year(datetime) <- 2030
datetime
month(datetime) <- 8
datetime
hour(datetime) <- hour(datetime)+1
datetime
update(datetime, year=2031, month=8,hour=11)
update(datetime, yday=1)

#quarter 분기
datetime <- ymd_hms("1969/07/20, 20:17:39")
datetime
semester(datetime)
quarter(datetime)
am(datetime)
pm(datetime)

#반올림, 내림, 올림
datetime
round_date(datetime, unit = "year")
round_date(datetime, unit = "month")
round_date(datetime, unit = "day")
round_date(datetime, unit = "week")
round_date(datetime, unit = "hour")
round_date(datetime, unit = "second")
floor_date(datetime, unit = "month")
ceiling_date(datetime, unit = "month")

years(1)
months(1)
months(3)
days(7)
weeks(2)
hours(c(12,24))
minutes(1:5)
seconds(seq(0,10,by=2))

10*(months(6)+days(2))
days(60)+hours(12)+minutes(15)
library(lubridate)
moon<- ymd("1969/07/20")
moon
moon+days(10000)
moon+months(1000)
moon-years(100)

mars <- ymd("2021/02/18")
mars
mars-moon

interval(moon, mars)
class(interval(moon, mars))

moon %--% mars
as.period(moon %--% mars)

as.duration(moon %--% mars)

class(as.period(moon %--% mars))
class(as.duration(moon %--% mars))

dyears(1) #초로 표현됨
ddays(1)
dweeks(1)
dhours(1)

2*dyears(1)
dyears(1)+dweeks(4)+dhours(2)


ymd("2029-01-01")+years(1)
ymd("2029-01-01")+dyears(1)

#윤년 때문에 다른 결과 나올 수 있음
ymd("2028-01-01")+years(1)
ymd("2028-01-01")+dyears(1) 

leap_year(2028) #윤년여부
leap_year(2029)

years(1)/days(1)

(ymd("2028-01-01") %--% ymd("2029-01-01"))/ddays(1)

#현재 사용중인 시간대 확인
Sys.timezone()
OlsonNames() #전체 시간대 리스트

kst <- ymd_hm("2030-3-15 15:30", tz="Asia/Seoul")
kst

utc <- ymd_hm("2030-3-15 6:30")
utc

kst-utc

#시간대 변환 with_tz()
#새해를 맞이하는 뉴욕시간
ny <-  ymd_hms("2030-01-01 00:00:00", tz="America/New_York")
ny
with_tz(ny, tzone="Asia/Seoul")





#Week10
#입력
#데이터 프레임 형태로 불러옴
getwd()
setwd('C:/R/files')
read.csv(file="product.csv")
?read.csv

read.csv(file="filesproduct_no_header.csv")
read.csv(file="product_no_header.csv", header=FALSE)

#각 라인은 레코드로 구성되어 있고, 구분자로 구분 되어 있다.

?read.table
read.table(file = "product.txt", header=TRUE)
read.table(file = "product_colon.txt", header=TRUE, sep=":")

#결측값으로 인식하고 싶으면, NA를 결측값으로 인식하도록 해야함 아니면 그냥 문자로 인식
read.table(file = "product_missing.txt", header=TRUE)
read.table(file = "product_missing.txt", header=TRUE,
           na.strings = ".")

#행이름 설정
#010을 그냥 입력받으면 numeric으로 인식. colClass로 형태를 지정해줌.
read.table('brand-eval.csv', header = TRUE, row.names = 'BrandID', sep=',',
           colClasses = c("character","character",'numeric','numeric','numeric'))

#고정된 길이로 구분되는 경우, -1은 공백을 의미함
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


#readr #tibble 형식으로 받음
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

#주석을 skip 인수로 제외하고 불러올 수 있음 몇 라인까지 제외
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
#원하는 라인만 읽음 1라인까지 빼고 3라인까지 읽기
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
cat("Hello",name, "\b,\n","Isn\'t it","\t","A Lovely day")

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
sink("Fahrenheit_output.txt")
fah <- readline("Fahrenheit ?")
32
fah <- as.numeric(fah)
print(paste("Fahrenheit=", fah))
cel <- (fah-32)/1.8
print(paste("Celsius=",cel))
sink()

#출력 결과 파일로 저장
sink("Fahrenheit_output.txt")
source('FahToCel.R')
sink()

sink("Fahrenheit_output.txt", append = TRUE)
source('FahToCel.R')
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
#dput(ptbl, file='ptbl.txt')
#dump('ptbl', file='ptbl.txt')
rm(ptbl)
ls()
ptbl
#저장된 데이터 가져오기
load("ptbl.RData")
ptbl


#기본 패키지에 포함된 Orange 이고 데이터프레임 형식
Orange

library(readr)
write_csv(x=Orange, file = "orange.csv")
read_csv(file="orange.csv")

write_delim(x=Orange, file = "orange2.txt", delim=";")
read_delim(file='orange2.txt', delim = ";")

#저장하기
write_lines(x=Orange$circumference, file = 'c.txt')
read_lines("c.txt")




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
transLength(y)
transLength

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
y <- 1:5~%X
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

#몇번 던져야 연속으로 앞면이 10번 나오는가?
flip <- function() sample(x=c('H','T'), size=1)
nflip <- 0
nhead <- 0
while (nhead<10) {
  if(flip()=='H'){
    nhead <- nhead+1
  } else{
    nhead <- 0
  }
  nflip <- nflip+1
}
nflip



#for (var in list) statement
for (i in seq(from=5, to=25, by=5)) print(i) 
for (i in seq(from=5, to=25, by=5)) i 

i <- 1
for  (i in seq(from=5, to=25, by=5)) i 
i

rm(list=ls())





#Week11
#데이터 유형 변환
#mode 는 객체가 물리적으로 저장되는 형태
#numeric, character, logical, list, function
#하나의 형태만 가질 수 있다

mode(1.414)
mode(c(1:3))
mode("Batman")
mode(c("Batman", "Superman","Spiderman"))
mode(factor("High","Medium","Low"))
mode(as.Date("2030-12-31"))
mode(5>2)
mode(list(1.23, "Apple",c(2,3,4,5)))
mode(data.frame(x=1:3, y=c("H","M","L")))
mode(mean)

# > mode(1.414)
# [1] "numeric"
# > mode(c(1:3))
# [1] "numeric"
# > mode("Batman")
# [1] "character"
# > mode(c("Batman", "Superman","Spiderman"))
# [1] "character"
# > mode(factor("High","Medium","Low"))
# [1] "numeric"
# > mode(as.Date("2030-12-31"))
# [1] "numeric"
# > mode(5>2)
# [1] "logical"
# > mode(list(1.23, "Apple",c(2,3,4,5)))
# [1] "list"
# > mode(data.frame(x=1:3, y=c("H","M","L")))
# [1] "list"
# > mode(mean)
# [1] "function"


#class 숫자로는 물리적으로 하나의 형태로 저장되더라도 동시에 여러개로 나타날 수 있다
d <- as.Date("2030-12-31")
mode(d)
length(d)
class(d)
#class가 date 이기 때문에 일반 숫자가 아니라 날짜로 인지한다
as.integer(d)
d+1

#class에 따라서 처리하는 방법을 결정한다

print.Date()
print.data.frame()
print.lm()
methods(print)

as.character()
as.numeric()
as.integer()
as.logical()
#변환이 불가하면 NA 출력
as.numeric(1.414)
as.integer(1.414)
as.character(1.414)
as.numeric("gold")

as.numeric(c("-1","1.414", "3.14"))
as.numeric(c("-1","1.414", "3.14", "and"))
as.character(11:15)

as.numeric(TRUE)
as.numeric(FALSE)


#데이터 구조 변환 -벡터 행렬 리스트 데이터프레임 간의 변환
#데이터 변환
as.data.frame()
as.list()
as.matrix()
as.vector()
as.factor()

#현재의 데이터 구조 확인
is.data.frame()
is.list()
is.matrix()
is.vector()
is.factor()

#vector
vec <- 1:6
vec
as.list(vec)
list(vec)
#하나의 열을 가진 행렬 만들기
cbind(vec)
# > #하나의 열을 가진 행렬 만들기
#   > cbind(vec)
# vec
# [1,]   1
# [2,]   2
# [3,]   3
# [4,]   4
# [5,]   5
# [6,]   6

as.matrix(vec)
rbind(vec)

matrix(vec, 2,3)
as.data.frame(vec)
as.data.frame(rbind(vec))

#matrix
mat <- matrix(1:6, 2,3)
mat
as.vector(mat)
as.list(mat)
list(mat)
as.data.frame(mat)

#list
lst <- list(odd=c(1,3,5), even=c(2,4,6))
lst
unlist(lst)
as.vector(lst)

lst2 <- list(odd=c(1,3,5), even=c(2,4,6), count=c("one", "two", "three"))
lst2
#문자가 있으면 전체가 다 문자로 바뀜
unlist(lst2)
#matrix 만들기 리스트를 벡터로 바꾸고 다음에 matrix로 변환해야함
matrix(unlist(lst),3,2,dimnames=list(NULL, names(lst)))
matrix(lst)
as.matrix(lst)       

as.data.frame(lst) #숫자 문자 섞여서 상관없음
as.data.frame(lst2)
str(as.data.frame(lst2))

#data frame
dfm <- data.frame(odd=c(1,3,5), even=c(2,4,6))
dfm
dfm[,1]
dfm[[1]]
str(dfm[,1])#행을 추출하면 벡터
str(dfm[[1]])
dfm[1,]
str(dfm[1,])#열을 추출하면 dataframe
as.matrix(dfm)
as.vector(as.matrix(dfm))
dfm2 <- data.frame(odd=c(1,3,5), even=c(2,4,6), count=c("one", "two", "three"))
dfm2
as.vector(as.matrix(dfm2))#문자가 있으면 전체가 다 문자로 바뀜
#dataframe->list
as.list(dfm2)
as.matrix(dfm2)



#결합 - 데이터셋 결합 | 열 결합 | 행 결합 | 공통 열에 의한 결합
#yahoo의 주가 데이터 다운로드 하여 주가 데이터 옆에 환율 데이터 까지 넣는 법
#install.packages("quantmod")
#finance.yahoo.com에서 가져옴
#finance.yahoo.com: Samsung Electronics(005930.ks), KRW 개별 종목의 코드, 환율
library(quantmod)
sec <- getSymbols(Symbols = "005930.ks",
                  from="2021-10-01",
                  to="2021-12-31",
                  auto.assign = FALSE)
sec <- as.data.frame(sec)
str(sec)
head(sec)

head(sec[c("005930.KS.Close", "005930.KS.Volume")])

sec <- cbind(date=rownames(sec),
             symbol="005930.KS",
             sec[c("005930.KS.Close", "005930.KS.Volume")])
rownames(sec) <- NULL #행이름 지우기
colnames(sec)[c(3,4)] <- c("close", "volume")
head(sec)

#현대자동차 주가정보 다운로드
hmc <- getSymbols(Symbols = "005387.KS",
                  from="2021-10-01",
                  to="2021-12-31",
                  auto.assign = FALSE)
hmc <- as.data.frame(hmc)
head(hmc)
hmc <- cbind(date=rownames(hmc),
             symbol="005387.KS",
             hmc[c("005387.KS.Close", "005387.KS.Volume")])
rownames(hmc) <- NULL
colnames(hmc)[c(3,4)] <- c("close", "volume")

#행의 방향으로 결함
stock <- rbind(sec, hmc)
head(stock)
stock


#merge로 환율 데이터 옆에 붙이기
#finance.yahoo.com
fx <- getSymbols(Symbols = "KRW=X",
                 from="2021-10-01",
                 to="2021-12-31",
                 auto.assign = FALSE)
#데이터프레임 형태로 변환
fx <- as.data.frame(fx)
str(fx)
head(fx["KRW=X.Close"])
fx <- cbind(date=rownames(fx),
            fx[c("KRW=X.Close")])
head(fx)
rownames(fx) <- NULL
colnames(fx)[c(2)] <- "close"

#공통된 날짜 기준으로 merge
#공통 열 이름 확인
intersect(names(sec), names(fx))

report <- merge(sec, fx, by="date")
report

#두개의 벡터를 인수를 받아서 인수가 동일한 인덱스를 반환함, 2번째 벡터의 인덱스를 반환한다
#없으면 NA
match()
v <- c(10,9,8,7,6,5,4,3,2,1)
match(7,v)
match(c(11,5,3,1,0), v)

head(mtcars)
car <- mtcars
car["name"] <- rownames(car)
rownames(car) <- NULL
head(car)

highhp.car <- car[car$hp>145,]
highhp.car
lightwt.car <- car[car$wt<3.2,]
lightwt.car

#힘이 좋으면서 가벼운 차 위의 2dataframe 합치기
index <- match(highhp.car$name, lightwt.car$name)
index

lightwt.car[na.omit(index),]
#%in%연산자 사용 가능 일치하는지 논리값으로 반환함
v <- c(10,9,8,7,6,5,4,3,2,1)
7 %in% v
c(1,2,3) %in% v
c(11,5,0) %in% v

index2 <- highhp.car$name %in% lightwt.car$name
index2
highhp.car[index2,]



#subset | 인덱싱 | $ [[ ]] [ ] | 무작위 표본(random sample) 추출 | 결측값 | 구간별 범주화
str(mtcars)
mtcars$mpg
mtcars[["mpg"]]
mtcars[[1]]
mtcars["mpg"]
mtcars[c(1,4)]
mtcars[c("mpg","hp")]

mtcars[-c(2,3,4)]
mtcars[-1]
mtcars[1] <- NULL
mtcars

mtcars[c(-1, 2)]
# Error in `[.default`(mtcars, c(-1, 2)) : 
#   only 0's may be mixed with negative subscripts

str(iris)
iris[1:5,]
iris[,c(1,4)]

iris[,1] # 한줄이라서 벡터 형식으로 출력됨 R은 간단하게 나타내려고 함
iris[,1, drop=FALSE] #원래의 dataframe 형식으로 출력됨

#원래 형태로 하고 싶으면 행렬인덱싱보다 리스트 인덱싱을 쓰는 것이 안전하다
iris[1]

iris[1:5,c(1,4)]

#조건에 따라서 만드는 경우
iris[iris$Sepal.Length>7,]
iris[iris$Sepal.Length>7,c(1,2,5)]

subset(iris, subset=(Sepal.Length>7),
       select =c(1,2,5)) 

#랜덤 샘플링 할 때 #비복원추출
sample(x=1:10, size=5)
sample(x=10, size=5)
#복원추출
sample(x=10, size = 5, replace = TRUE)

#무작위
sample(10)

#sample이 일정하게 나오면 좋겠다. seed 지정
set.seed(1)
sample(x=10, size = 5, replace=TRUE)

sample(x=10, size = 5, replace=TRUE)

set.seed(1)
sample(x=10, size = 5, replace=TRUE)

sample(iris,3) #5개의 열에서 3개의 열을 무작위 추출함, 보통 이건 필요 없지.

set.seed(1)
index <- sample(nrow(iris),3)
index
iris[index,]

#데이터셋에 중복된 값 제거하고 subset 생성하기
duplicated(c(1,2,3,1,1,3,4))

id <- c("A001","A002","A003")
name <- c("Mouse","Keyboard","USB")
price <- c(30000,90000,50000)
product <- data.frame(id=id, name=name, price=price)
product

product <- rbind(product, c("A001","Mouse",30000))
product

#방법1
duplicated(product)
product[-duplicated(product), ]
#방법2
product[!duplicated(product), ]
#방법3
which(duplicated(product))
index <- which(duplicated(product))
product[-index,]
#방법4
unique(product)

#결측값 찾기
#방법1
str(airquality)
complete.cases(airquality) #행에 결측값이 있으면 FALSE, 없으면 TRUE
airquality.nona <- airquality[complete.cases(airquality),]
str(airquality.nona)

#방법2
airquality.nona2 <- na.omit(airquality)
str(airquality.nona2)


#범주화 하기
#cut 사용하면 factor 형식으로 바꿔줌
cut(x=iris$Sepal.Width, breaks=c(0,1,2,3,4,5))
cut(x=iris$Sepal.Width, breaks=5)#임의로 5개의 구간을 나눔, 동일한 간격

#빈도 계산을 위해서는 table 사용
iris.cut <- cut(x=iris$Sepal.Width, breaks=c(0,1,2,3,4,5))
table(iris.cut)
summary(iris.cut)

#table 열에 이름 지정
iris.cut <- cut(x=iris$Sepal.Width,
                breaks = c(0,1,2,3,4,5),
                labels = c("smaller","small","medium","big","biger"))
table(iris.cut)



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




#week11-2
head(airquality)

#install.packages("dplyr")
library(dplyr)
?dplyr
air <- filter(airquality, Month==6)
head(air)

airquality[airquality$Month==6,]
subset(airquality, subset = (Month==6))

air <- filter(airquality, Month==6, Temp>90)
air <- filter(airquality, Month==6 & Temp>90)
head(air)

air <- filter(airquality, Ozone>80 | Temp>90)
head(air)

#원하는 행 추출
slice(airquality, 6:10)
#n():dataframe의 행번호 
slice(airquality, (n()-4):n())

#여러 열을 지정가능 순서대로 arrange됨, 오름차순
arrange(airquality, Temp, Month, Day)
arrange(airquality, desc(Temp), Month, Day)
?arrange
airquality[order(airquality$Temp,airquality$Month,airquality$Day),]
with(airquality, airquality[order(Temp,Month,Day),])


#원하는 열을 원하는 순서대로 선택
air <- select(airquality, Month, Day, Temp)
head(air)
air <- select(airquality, Temp:Day)
head(air)
#원하지 않는 열 빼기
air <- select(airquality, -(Temp:Day))
head(air)
#선택하면서 열이름 바꿀수도 있음
air <- select(airquality, Solar=Solar.R)
head(air)
#이름만 변경하려면 rename()을 써서 특정 열의 이름 변경
air <- rename(airquality, Solar=Solar.R)
head(air)

#중복되지 않는 값 출력
distinct(select(airquality, Month))
unique(airquality$Month)

#새로운 열을 추가할 때 사용
air <- mutate(airquality,
              Temp.c=(Temp-32)/1.8,
              Diff=Temp.c-mean(Temp.c))
head(air)

#base package 포함된 transform()
#함수 내에서 바로 생성된 인자는 바로 사용하지 못함
transform(airquality,
          Temp.c=(Temp-32)/1.8,
          Diff=Temp.c-mean(Temp.c))
air <- transform(airquality,
                 Temp.c=(Temp-32)/1.8)
head(air)

#요약통계
summarise(airquality, 
          Mean=mean(Temp, na.rm = TRUE),
          Median=median(Temp, na.rm = TRUE),
          SD=sd(Temp, na.rm = TRUE),#표준편차
          Max=max(Temp, na.rm = TRUE),
          Min=min(Temp, na.rm = TRUE),
          N=n(),#열의 개수
          Distinct.Month=n_distinct(Month),#고유한 값의 개수
          Distinct.First=first(Month),#첫번째 값
          Distinct.Last=last(Month)
)

#무작위 추출, 지정된 개수, 지정된 비율로, 비복원 추출이 기본
sample_n(airquality, 5)
sample_frac(airquality, 0.05)
sample_frac(airquality, 0.05, replace = TRUE) #복원추출
set.seed(1)#시드 지정하면 할때 마다 같은 값 나옴

#
air.group <- group_by(airquality, Month)
class(air.group)
air.group


summarise(air.group,
          Mean.Temp=mean(Temp, na.rm=TRUE))
summarise(air.group,
          Mean.Temp=mean(Temp, na.rm=TRUE),
          sd.Temp=sd(Temp, na.rm = TRUE),
          Days=n())

#pipe operator %>%
#결과를 다음에 첫 인자로 전달 가능
iris %>% head
head(iris)

1:10 %>% mean
mean(1:10)


#배운거 쭉 순서대로 진행함
a1 <- select(airquality, Ozone, Temp, Month)
head(a1)
a2 <- group_by(a1, Month)
head(a2)
a2
a3 <- summarise(a2,
                Mean.ozone=mean(Ozone,na.rm=TRUE),
                Mean.Temp=mean(Temp, na.rm=TRUE))
a3
a4 <- filter(a3, Mean.ozone>40 | Mean.Temp>80)
a4

#pipe operator 사용해서 똑같이 해보기
air <- airquality %>%
  select( Ozone, Temp, Month) %>%
  group_by(Month) %>%
  summarise(Mean.ozone=mean(Ozone,na.rm=TRUE),
            Mean.Temp=mean(Temp, na.rm=TRUE)) %>%
  filter(Mean.ozone>40 | Mean.Temp>80)
air


#조인
df1 <- data.frame(x=1:6, y=month.name[1:6])
df2 <- data.frame(x=7:12, y=month.name[7:12])
df1
df2
#base package의 rbind와 같음
df3 <- bind_rows(df1, df2)
df3

df4 <- data.frame(z=month.abb)
df4
#열의 방향으로 결합, #base package의 cbind와 같음
df5 <- bind_cols(df3, df4)
df5
cbind(df3,df4)

#inner join 공통열을 포함하는 데이터셋이 생성됨 교집합
band_members
band_instruments
#by 인수를 지정안하면 모든 열을 조인함
inner_join(band_members, band_instruments)
#by 인수를 지정
inner_join(band_members, band_instruments, by="name")

#outer join 한쪽 데이터셋에만 있어도 포함 합집합
left_join(band_members, band_instruments, by="name")#왼쪽 데이터셋 기준
right_join(band_members, band_instruments, by="name")#오른쪽 데이터셋 기준
full_join(band_members, band_instruments, by="name")#왼쪽,오른쪽 둘 모두 데이터셋 기준
#보통 left join을 처음에 고려함

band_instruments2
#행이름 다른경우 지정
full_join(band_members, band_instruments2, by=c("name"="artist"))
#행이름 유지하려면 
full_join(band_members, band_instruments2, by=c("name"="artist"),keep=TRUE)

#공통열이 일치하는 경우 추출
semi_join(band_members, band_instruments, by="name")
#공통열이 일치하지 않는 경우 추출
anti_join(band_members, band_instruments, by="name")











#week12
#Apply Family

?apply

x <- matrix(1:20, 4,5)
x
#각 행, 열을 돌아가면서 함수를 수행
apply(x, MARGIN = 1, FUN=max) #margin1:행, 2:열
apply(x, MARGIN = 2, FUN=min) #margin1:행, 2:열

y <- array(1:24, c(4,3,2))
y
apply(y, 1, paste, collapse=",")
apply(y, 2, paste, collapse=",")
apply(y, 3, paste, collapse=",")

#margin에 2개 이상의 벡터 넣을 수 있음
apply(y, c(1,2), paste, collapse=",")
apply(y, c(1,2,3), paste, collapse=",")

Titanic
str(Titanic)
apply(Titanic, 1, sum)#Class
apply(Titanic, 2, sum)#Sex
apply(Titanic, 3, sum)#Age
apply(Titanic, 4, sum)
apply(Titanic, "Survived", sum)

apply(Titanic, c("Class", "Survived"), sum)
apply(Titanic, c(1,4), sum)

#List에 사용
lapply() #결과가 List
sapply() #결과가 단순화 시켜짐

exams <- list(s20=c(78,89,91,85,95,98),
              s21=c(85,86,97,99,90),
              s22=c(98,96,78,90,93,85,92),
              s23=c(98,96,91,88,93,99))
exams
lapply(exams, length) #학기별 학생수
sapply(exams, length) #학기별 학생수

sapply(exams, mean) #학기별 평균
sapply(exams, sd) #학기별 표준편차

sapply(exams, range) #학기별 최소,최대값 출력이 2개면 행렬로 만들어줌

head(iris)
#dataframe은 열을 하나씩 넘겨줌
lapply(iris, class)
sapply(iris, class)

sapply(iris, mean)
sapply(iris, function(x) ifelse(is.numeric(x),mean(x),NA))

#using many dataset
mapply(rep, 1:4, 4:1)
rep(1,4)
rep(2,3)
rep(3,2)
rep(4,1)


#purr map()
#install.packages("purrr")
library(purrr)
exams <- list(s20=c(78,89,91,85,95,98),
              s21=c(85,86,97,99,90),
              s22=c(98,96,78,90,93,85,92),
              s23=c(98,96,91,88,93,99))
exams
map(.x=exams, .f=mean)#수행결과는 항상 list로 반환

map_lgl() #logical
map_int() #integer
map_dbl() #double
map_chr() #character

#숫자 벡터 형식으로 출력
map_dbl(exams, mean) 

#절삭평균 상하 30프로 제외한 평균 구해짐
map_dbl(exams, mean, trim=0.3) 

# %>%와 함께 사용하면 
exams %>%
  map_dbl(mean, trim=0.3)

exams %>%
  map(range) #원소로 부터 최소값과 최대값 출력
exams %>%
  map(range) %>%
  map_dbl(diff)

#가산점 주기
exams %>%
  map(function(x) x*1.1) 

#포뮬러 형식으로 선언하기
exams %>%
  map(~.x*1.1) 

exams %>%
  map(~.*1.1) 

fruits <- c("Apple","Banana","Strawberry")
fruits %>%
  map_chr(paste,"Juice",sep="-")
fruits %>%
  map_chr(~paste(.x,"Juice",sep="-"))



lst <- list(list(num=1:3, letters[1:3]), 
            list(num=101:103, chr=letters[4:6]),
            list(),
            list(num=c(9,99), chr=letters[7:9]))
lst

#이름으로 데이터 가져오기
lst %>%
  map("num")

lst %>%
  map("num", .default="???") #null 대신 출력 값 지정

lst %>%
  map("chr", .default="???") #null 대신 출력 값 지정

lst %>%
  map("chr", .default=NA) 
lst %>%
  map(2, .default=NA) 

lst %>%
  map(c(2,2)) #2번째, 2번째 값을 추출
lst %>%
  map_chr(c(2,2)) #2번째, 2번째 값을 추출, chr 아닌 값 있으면 에러

lst %>%
  map_chr(c(2,2),.default=NA) #2번째, 2번째 값을 추출

#문자과 숫자가 섞여 나오면
lst %>%
  map(list("num"))
lst %>%
  map(list("num",3))
lst %>%
  map_int(list("num",3), .default=NA)


str(USArrests)
#평균값
USArrests %>%
  map_dbl(mean)
#최대 최소
USArrests %>%
  map_dbl(range) #error
USArrests %>%
  map(range)
USArrests %>%
  map_dfr(range) #tibble 형식으로 출력

#회귀분석
str(mtcars)
models <- mtcars %>%
  split(.$am) %>% #변속이 유형에 따라 2개의 subset 만듬
  map(~lm(mpg~wt, data=.))
models

#auto am
model0 <- summary(models$`0`)
str(model0)
names(model0)
model0$r.squared

#자동변속기 유형별 rsquared
models %>%
  map(summary) %>%
  map_dbl(function(x) x$r.squared)
models %>%
  map(summary) %>%
  map_dbl(~.$r.squared)
models %>%
  map(summary) %>%
  map_dbl("r.squared")

mtcars %>%
  split(.$am) %>%
  map(~lm(mpg~wt, data=.)) %>% 
  map(summary) %>% 
  map_dbl("r.squared")


#purr map2()
#여러인수를 가지고 있는 함수를 반복적용 해준다
a <- list(1,2,3)
map(.x=a, function(x) x*1.1)
map_dbl(.x=a, function(x) x*1.1)

map2_*() #인수 2개
pmap_*() #인수 3개


a <- list(1,2,3)
b <- list(10,20,30)
map2(.x=a, .y=b, .f=function(x,y) y-x)
#fomular 형식
map2(.x=a, .y=b, .f=~.y-.x)
map2_dbl(.x=a, .y=b, .f=~.y-.x)
#map2_int(.x=a, .y=b, .f=~.y-.x)

set.seed(123)
map2(b,a,rnorm, n=5) #b:평균, a:표준편차, 추출할 표본개수:5개
?rnorm  #rnorm(n, mean = 0, sd = 1) 

set.seed(123)
list(rnorm(mean=10, sd=1, n=5),
     rnorm(mean=20, sd=2, n=5),
     rnorm(mean=30, sd=3, n=5)
)



str(mtcars)
by.am <- mtcars %>% 
  split(.$am) 
by.am

models <- by.am %>% 
  map(~lm(mpg~wt, data=.))
models

#예측값 구하기 predict 인수가 2개니까 map2
map2(models, by.am, predict)
list(predict(models$`0`, by.am$`0`))
list(predict(models$`1`, by.am$`1`))

#3개의 데이터셋을 활용
a <- list(1,2,3)
b <- list(10,20,30)
c <- list(100,200,300)
pmap(.l=list(a,b,c),.f=sum)
pmap(list(a,b,c),sum)

pmap_dbl(list(a,b,c), 
         function(x,y,z) y-x+z)
pmap(list(a,b,c), ~..2-..1+..3)

pmap_dbl(list(alpha=a, beta=b, gamma=c),
         function(gamma, beta, alpha) beta-alpha+gamma)

plus <- function(x,y) x+y
pmap_dbl(list(a,b,c), plus) #error
plus2 <- function(x,y,...) x+y #가변 변수 선언가면 확장성 있음
pmap_dbl(list(a,b,c), plus2)

#무작위 표본 추출하기
args <- list(mean=c(0,5,10),
             sd=c(1,2,3),
             n=c(1,3,5))
set.seed(123)
args %>% 
  pmap(rnorm)

set.seed(123)
list(rnorm(mean=0, sd=1, n=1),
     rnorm(mean=5, sd=2, n=3),
     rnorm(mean=10, sd=3, n=5))

#dataframe형식
args.df <- data.frame(mean=c(0,5,10),
                      sd=c(1,2,3),
                      n=c(1,3,5))
set.seed(123)
args.df %>% 
  pmap(rnorm)

#list 이름 없이 넣으면 rnorm 인자 순서대로 인식 됨
args2 <- list(c(0,5,10),
              c(1,2,3),
              c(1,3,5))
set.seed(123)
args2 %>% 
  pmap(rnorm)
?rnorm




#reduce
library(purrr)
#1,3에 적용 다음 5에 적용 다음 7에 적용
reduce(.x=c(1,3,5,7), .f=`*`) #연산자는 백틱? esc 아래키로 감싸서 사용

paste2 <- function(u,v,sep=".") paste(u, v, sep=sep)
letters[1:4] %>% 
  reduce(paste2)

dfs <- list(data.frame(name="Superman", age=30),
            data.frame(name=c("Spiderman","Wonderwoman"), sex=c("M","F")),
            data.frame(name="Batman", grade="A"))
dfs            

library(dplyr)
dfs %>% 
  reduce(.f=bind_rows)

#교집합찾기
vs <- list(c(1,3,5,6,7,8,10),
           c(2,3,7,8,10),
           c(1,2,3,5,7,9,10))
vs
vs %>% 
  reduce(intersect)

set.seed(123)
x <- sample(10)
x
x %>% 
  reduce(`+`)
x %>% 
  accumulate(`+`) #과정을 볼 수 있다

#3개의 인수를 전달할 수 있다.
paste2 <- function(u,v,sep=".") paste(u, v, sep=sep)
letters[1:4] %>% 
  reduce(paste2)

reduce2(.x=letters[1:4],.y=c("-",".","-"),.f=paste2)
accumulate2(.x=letters[1:4],.y=c("-",".","-"),.f=paste2) #과정을 볼 수 있다




#reshape2
#install.packages("reshape2")
library(reshape2)

#wide format example
smiths

#wide format to long format, 식별자변수 지정하지 않음. 문자열이 있으면 식별자변수로 사용
melt(data = smiths)

#식별자변수 지정 가능
?melt
melt(data = smiths, id.vars = "subject")
melt(data = smiths, id.vars = "weight") #error가 남
#측정변수를 지정할 수 있음
melt(data = smiths, measure.vars = c(2:5))
melt(data = smiths, measure.vars = c("time","age","weight","height")) 
melt(data = smiths, id.vars = "subject", measure.vars = c("time","age","weight","height")) 

#열의 이름을 지정할 수 있음
melt(data = smiths, id.vars = "subject", measure.vars = c("time","age","weight","height"),
     variable.name = "var", value.name = "val") 


smiths.long <- melt(data = smiths, id.vars = "subject", measure.vars = c("time","age","weight","height"),
                    variable.name = "var", value.name = "val") 
smiths.long

#long format to wide format
?dcast
dcast(data=smiths.long, formula=subject~var, value.var = "val")

head(airquality)
aq.long <- melt(airquality, id.vars = c("Month","Day"))
tail(aq.long)
aq.long <- melt(airquality, id.vars = c(5:6))
tail(aq.long)

aq.wide <- dcast(aq.long, Month+Day~variable,
                 value.var = "value")
head(aq.wide)


dcast(aq.long, Month~variable) #Month만 가지고는 제대로 되지 않음
dcast(aq.long, Month~variable,
      fun.aggregate = mean, na.rm=TRUE)



#week12 형태변환
#tidyr- gather(), spread()
install.packages("tidyr")
library(tidyr)
head(airquality)

#to make long format
?gather
aq.long <- gather(airquality,
                  key=Factor,
                  value = Measurement,
                  Ozone:Temp)
head(aq.long)


aq.long <- gather(airquality,
                  key=Factor,
                  value = Measurement,
                  -Month, -Day)
head(aq.long)

aq.long <- gather(airquality,
                  key=Factor,
                  value = Measurement,
                  Ozone,Temp,Solar.R, Wind)
head(aq.long)

airquality %>% gather(Factor, Measurement, Ozone:Temp)

?spread
aq.wide <- spread(data = aq.long, key=Factor, value = Measurement)
head(aq.wide)

aq.wide <- aq.long %>% spread(key=Factor, value = Measurement)

head(iris)
iris.long <- gather(iris, key=Element, value=Measurement,
                    -Species)
head(iris.long)
#두개의 열로 분할
?separate
iris.sep <- separate(data=iris.long, 
                     col=Element,
                     into = c("Part","Measures"))
head(iris.sep)

#두개의 열 합치기
?unite
iris.unite <- unite(data=iris.sep,
                    col=unite,
                    sep="-", #기본은 "_"
                    Part, Measures)
head(iris.unite)



#pivot_longer(), pivot_wider() #tibble 형태로 됨
head(airquality)
?pivot_longer
aq.long <- pivot_longer(airquality, 
                        cols = Ozone:Temp,
                        names_to = "Factor",
                        values_to = "Measurement")
head(aq.long)q~%

#long to wide
?pivot_wider
aq.wide <- pivot_wider(aq.long, 
                       names_from  = Factor,
                       values_from  = Measurement)
head(aq.wide)


#nest 셀 안에 또 다른 데이터셋을 저장함
?nest
df <- tibble(x=c(1,1,1,2,2,3),y=1:6,z=6:1)
df
#데이터프레임의 특이한 형태인 티블

df.nested <- nest(.data=df, ndata=c(y,z))
df.nested
df.nested$ndata
#list 형태이기에 추출할 때는 
df.nested$ndata[[2]]

#원래대로 돌리기 
unnest(df.nested, cols = ndata)

#여러개의 리스트를 갖는 데이터
head(iris)
iris.nested <- nest(iris, sepal=c("Sepal.Length","Sepal.Width"),
                    petal=c("Petal.Length","Petal.Width"))
iris.nested
iris.nested$sepal
iris.nested$petal


#group by 
head(mtcars)
library(dplyr)
library(tidyr) #nest()
mtcars.n <- mtcars %>% 
  group_by(cyl) %>% 
  nest()
mtcars.n


library(purrr)
mtcars.m <- mtcars.n %>% 
  mutate(model=map(data, ~lm(mpg~wt, data = .x))) %>% 
  arrange(cyl)
mtcars.m
mtcars.m$model

#회귀계수 추출하기
mtcars.m %>% 
  transmute(cyl, beta=map_dbl(model, ~coefficients(.)[[2]])) %>% 
  ungroup()







#week13 
#그래픽
#graphics 패키지가 기본으로 설치되어 있다
#volcano eruption data
str(faithful)

plot(faithful) #고수준

eruptions.long <- faithful[faithful$eruptions>3,]
points(eruptions.long, col="red", pch=19) #저수준, 고수준이 먼저 수행되어 있어야 함
#points(eruptions.long, col="red"#색깔 pch=19#모양)
dev.off() #삭제


#회귀선
faithful.lm <- lm(waiting ~ eruptions, data=faithful)
lines(x=faithful$eruptions, y=fitted(faithful.lm), col="blue") #저수준
#수직선
abline(v=3, col="purple") #v=3인 곳에 수직선
#평균선
abline(h=mean(faithful$waiting), col="green")
abline(faithful.lm, col="pink")
?abline

#그래프 생성 및 저장
str(cars)
plot(cars)
plot(cars$speed, cars$dist)

#x축이 factor인 경우
str(ToothGrowth)
plot(ToothGrowth$supp, ToothGrowth$len) #상대도표 형태로 두 집단별 분포가 보임

#dataframe 제공한 경우 산점도 그려짐 matrix 형태로 
str(iris)
plot(iris[,1:4])

#시계열데이터인 경우
str(nhtemp)
plot(nhtemp)

#모자이크 도표
#버클리대학 입학 데이터
str(UCBAdmissions)
plot(UCBAdmissions)

#모델객체도 그림 그려줌
#회귀모형
str(faithful)
faithful.lm <- lm(waiting ~ eruptions, data = faithful)
class(faithful.lm)
plot(faithful.lm)

#그래프 파일로 저장하기
plot(faithful)
#rstudio 화면에서 export
#확인하기
list.files(pattern = "Rplot.jpeg")
library(pander)
openFileInOS("Rplot.jpeg")


#새로운 윈도우 창 만들어서 거기에 출력하고 저장함. 열어서 확인까지
windows(width = 12, height=8)
plot(faithful)
savePlot(filename = "Rplot2", type = "pdf")
list.files(pattern = "Rplot2.pdf")
openFileInOS("Rplot2.pdf")

#아래 함수들 사용 가능
?png
?pdf
?postscript

library(pander)
png("Rplot3.png", width=648, height = 432)
plot(faithful)
#dev.off() 그래프 삭제
list.files(pattern = "Rplot3.png")
openFileInOS("Rplot3.png")




#그래프 파라미터 설정
plot(faithful)

#제목과 축
plot(faithful,
     main="Old Faithful Geyser",
     sub="Yellowstone National Park",
     xlab="Eruption time(m)",
     ylab="Waiting time(m)")

?par
#label
#las :  the style of axis labels.
plot(faithful, las=0)
plot(faithful, las=1)
plot(faithful, las=2)
plot(faithful, las=3)


#테두리
?par
#"o" (the default), "l", "7", "c", "u", or "]" 
plot(faithful, bty="o")
plot(faithful, bty="n")
plot(faithful, bty="l")
plot(faithful, bty="]")


#심볼과 선
?pch : 심볼
#21~25번은 테두리와 색깔 따로 지정 가능
plot(faithful, pch=3)
plot(faithful, pch=8, col="green")
plot(faithful, pch=25, col="red", bg="purple")

#lty : 선
#(0=blank, 1=solid (default), 2=dashed, 3=dotted, 4=dotdash, 5=longdash, 6=twodash)
str(LakeHuron) #시계열
plot(LakeHuron) #solid
plot(LakeHuron, lty="dotted")
plot(LakeHuron, lty="dashed")
plot(LakeHuron, lty="dotdash")
plot(LakeHuron, lty=8)


#그래프 유형 
?plot
# "p" for points,
# "l" for lines,
# "b" for both,
# "c" for the lines part alone of "b",
# "o" for both ‘overplotted’,
# "h" for ‘histogram’ like (or ‘high-density’) vertical lines,
# "s" for stair steps,
# "S" for other steps, see ‘Details’ below,
# "n" for no plotting.

str(pressure)
plot(pressure)
plot(pressure, type="p")
plot(pressure, type="l")
plot(pressure, type="o")


x <- 1:10
y1 <- exp(1:10)
y2 <- exp(10:1)
plot(x,y1, xlab = "x", ylab="y", type="n")#고수준
lines(x, y1, type = "o", pch=21, col="red")#저수준
lines(x, y2, type = "o", pch=22, col="blue")#저수준



plot(faithful, type="n")
grid()
points(faithful, pch=19, col="blue")



plot(faithful, pch=19, col="blue")
grid()


#색상
#google.com search "colors in r"
colors()
palette()
palette(rainbow(6))
palette()
palette("default")
palette()
#col="white", col="#FFFFFF", col=rgb(1,1,1), col=hsv(0,0,1)#채도색조명도

n <- 12
pie(rep(1, n), col=1:n) #8가지 들어있음

#그라데이션
rainbow()
hear.colors() #빨+노
terrain.colors() #초+파+노
topo.colors()#초+파+노
cm.colors() #cyan +mazenta
gray()

pie(rep(1, n), col=rainbow(n)) 
pie(rep(1, n), col=heat.colors(n)) 
pie(rep(1, n), col=terrain.colors(n)) 
pie(rep(1, n), col=gray(level = seq(0,1,length=n)))
pie(rep(1, n), col=gray(level = seq(0,1,length=n),
                        alpha = seq(0,1,length=n))) 

pie(rep(1, n), col=rainbow(n, alpha = seq(0,1,length=n))) 

#다양한 색
library(RColorBrewer)
?RColorBrewer
display.brewer.all()
display.brewer.pal(3, "Dark2")
display.brewer.pal(9, "Blues")

n <- 9
pie(rep(1,n), col=brewer.pal(n, "Greens"))
pie(rep(1,n), col=brewer.pal(n, "BuGn"))


plot(faithful,pch=21, col="tomato",
     main="Old Faithful Geyser",
     sub="Yellowstone National Park",
     xlab="Eruption time(m)",
     ylab="Waiting time(m)",
     col.main="navy", col.sub="purple",col.lab="royalblue",col.axis="brown"
)

#크기
#ces
x <- seq(0.5,1.5,0.25)
y <- rep(1, length(x))
plot(x,y,pch=19, cex=x,col="green",
     main="Effects of cex on symbol and text size")
text(x,y+0.1, labels = x, cex=x)


plot(x,y,pch=19, cex=x,col="green",
     main="Effects of cex on symbol and text size",
     cex.main=1.5, cex.lab=1.0, cex.axis=0.75)

#선의 두께
plot(LakeHuron, lwd=1)
plot(LakeHuron, lwd=3)

#글꼴, 글씨체
windowsFonts()
plot(faithful,pch=21, col="tomato",
     main="Old Faithful Geyser",
     sub="Yellowstone National Park",
     xlab="Eruption time(m)",
     ylab="Waiting time(m)",
     family="sans")

#기존 글꼴 변경하기
windowsFonts(
  A=windowsFont("Arial Black"),
  B=windowsFont("Book Antiqua"),
  C=windowsFont("Clisto MT")
)

plot(faithful,pch=21, col="tomato",
     main="Old Faithful Geyser",
     sub="Yellowstone National Park",
     xlab="Eruption time(m)",
     ylab="Waiting time(m)",
     family="C")

?par
#1 corresponds to plain text (the default), 2 to bold face, 3 to italic and 4 to bold italic.

plot(faithful,pch=21, col="cornflowerblue",
     main="Old Faithful Geyser",
     sub="Yellowstone National Park",
     xlab="Eruption time(m)",
     ylab="Waiting time(m)",
     family="serif", font.main=4, font.sub=1, font.lab=3, font.axis=2)





#그래프 배치
windows()
windows(width = 12, height = 8)
plot(faithful,pch=21, col="cornflowerblue",
     main="Old Faithful Geyser",
     sub="Yellowstone National Park",
     xlab="Eruption time(m)",
     ylab="Waiting time(m)",
     family="serif", font.main=4, font.sub=1, font.lab=3, font.axis=2)

#margin
par("mai")
old.par <- par(mai=c(1,0.5,1,0.2))
par("mai")
par(old.par)
par("mai")


par("mar")
old.par <- par(mai=c(5,4,4,2)+0.2)#바꾸기 전 값 넣어두기
par("mar")
par(old.par)
par("mar")


#그래프 영역 설정
# xlim()
# ylim()
# range()함수로 결정해서 그래프 영역 설정

x1 <- 1:10
y1 <- log(x1)
x2 <- 1:10
y2 <- sqrt(x2)

plot(x1,y2,type = "l", col="red", xlab="X",ylab="Y")
lines(x2, y2, lty="dashed", col="blue")

range(y1)
range(y2)

xlim <- range(c(x1, x2))
ylim <- range(c(y1, y2))
plot(x1, y1, xlim=xlim, ylim=ylim,
     type = "l", col="red", xlab="X",ylab="Y")
lines(x2, y2, lty="dashed", col="blue")


#창에서 여러 그래프 보여주기 행부터 채워짐
par("mfrow")
old.par <- par(mfrow=c(2,2))
par("mfrow")
plot(faithful, pch=19, col="blue", main="First:Old Faithful")
plot(pressure, type="l", col="red", main="Second")
plot(LakeHuron,  col="green", lwd=2, main="Third")
plot(ToothGrowth$supp, ToothGrowth$len, col="orange", main="Fourth")

#열 기준으로 그래프 넣으려면
old.par <- par(mfcol=c(2,2))
par("mfcol")
plot(faithful, pch=19, col="blue", main="First:Old Faithful")
plot(pressure, type="l", col="red", main="Second")
plot(LakeHuron,  col="green", lwd=2, main="Third")
plot(ToothGrowth$supp, ToothGrowth$len, col="orange", main="Fourth")

#그래프 넣는 순서 지정할 수 있음, 행렬형태로 설정
matrix(c(1,1,4,2,3,4), 2,3,byrow = TRUE)
old.par <- par(no.readonly = TRUE) #기존의 설정 저장
layout(matrix(c(1,1,4,2,3,4), 2,3,byrow = TRUE))
layout.show(4)
plot(faithful, pch=19, col="blue", main="First:Old Faithful")
plot(pressure, type="l", col="red", main="Second")
plot(LakeHuron,  col="green", lwd=2, main="Third")
plot(ToothGrowth$supp, ToothGrowth$len, col="orange", main="Fourth")
par(old.par)

#행의 높이와 열의 폭 설정
old.par <- par(no.readonly = TRUE) #기존의 설정 저장
layout(matrix(c(1,1,4,2,3,4), 2,3,byrow = TRUE), 
       widths = c(1,1,1.5), height=c(2,1))#행의 높이와 열의 폭 설정
plot(faithful, pch=19, col="blue", main="First:Old Faithful")
plot(pressure, type="l", col="red", main="Second")
plot(LakeHuron,  col="green", lwd=2, main="Third")
plot(ToothGrowth$supp, ToothGrowth$len, col="orange", main="Fourth")
par(old.par)

#그래프 요소 추가
plot(faithful,
     main="Old Faithful Geyser",
     sub="Yellowstone National Park",
     xlab="Eruption time(m)",
     ylab="Waiting time(m)",
     xlim=c(1,6), ylim=c(40,100),
     las=1, bty="l", pch=21, col="dimgray", bg="maroon",
     family="serif", 
     font.main=4, font.sub=3, font.axis=2,
     cex.main=1.5, cex.lab=1.0, cex.axis=0.75,
     col.main="tomato", col.sub="orange",
     col.lab="firebrick", col.axis="khaki4")


#제목과 축 (저수준 함수에서)
?title
?par
#고수준 함수에서 제목과 축을 설정할 수 있는데, 저수준함수에서 하려면 일단 고수준함수 선언할 때 
#ann 옵션에 FALSE로 선언
?axis
#사용자가 축 설정할 수 있음 

str(state.x77)
states <- data.frame(state.x77)
attach(states)

old.par <- par(no.readonly = TRUE) #기존의 설정 저장
par()
par(mar=c(5,4,4,8)+0.2)

plot(Murder, Life.Exp, pch=20, col="tomato", ylim=c(35, 75),
     yaxt="n",col.axis="darkorchid4",
     cex.axis=0.75, ann=FALSE)
points(Murder, HS.Grad, pch=22, col="blue", bg="skyblue")

axis(side=2, at=seq(68,76,2), labels = seq(68,76,2),
     col.axis="red",cex.axis=0.75, las=2)
axis(side = 4, at=seq(35,70,5), labels = seq(35,70,5),
     col.axis="blue",cex.axis=0.75, las=2, tck=-0.02) #tck 를 음수로 지정하여 그래프 바깥쪽으로 나오도록 한다.

mtext(text = "High School \nGraduates\n(percent)",
      side = 4, line = 3, cex = 0.9, las=2, col = "tan4")
title(main="Murder vs. Life Expectancy vs. High School Graduates",
      xlab="Murder(rate per 100,000 population)",
      ylab="Life Expectancy(years)",
      col.main="maroon", col.lab="tan4", cex.lab=0.9)

par(old.par)
detach(states)



#범례
?legend
# "bottomright", "bottom", "bottomleft", "left", "topleft", "top", "topright", "right" and "center"
#inset 옵션 같이 지정 가능


str(Orange)
tree1 <- subset(Orange, Tree==1)
tree2 <- subset(Orange, Tree==2)

xlim <- range(c(tree1$age, tree2$age))
ylim <- range(c(tree1$circumference, tree2$circumference))

plot(tree1$age, tree1$circumference, type="b",
     xlim=xlim, ylim=ylim, 
     pch=16, lty=1, col="red",
     main="Growth of Orange Tree",
     xlab="Age(days)", ylab="Circumference(mm)")
lines(tree2$age, tree2$circumference, type = "b",
      pch=15, lty=2, col="blue")

#범례추가
legend("topleft", inset = 0.05, title="Tree ID",
       legend = c("Tree 1", "Tree 2"), 
       lty = c(1,2), 
       pch=c(16,15), 
       col=c("red", "blue"))

#그래프 요소 추가 보조눈금
#install.packages("Hmisc")
library(Hmisc)
minor.tick(nx=3, ny=3, tick.ratio = 0.5)#눈금 사이 지정, tick.ratio=0.5 주 눈금의 50프로


#텍스트
?text

plot(1:5, 1:5, type="n", xaxt="n", yaxt="n",ann=FALSE) #출력 다 안해
text(2,2, font=1, col="red", cex=1.0,
     labels="Default text:Sans text with plain(font=1)")
text(3,3, font=2, col="darkgreen", cex=1.2, family="mono",
     labels="Mono text with bold(font=2)")
text(4,4, font=3, col="blue", cex=1.4, family="serif",
     labels="Serif text with italic(font=3)")
text(2,4, font=2, col="blue", cex=1.4, family="HersheyScript",
     labels="HersheScript text (srt=25)", srt=25)
mtext(text="Windows Fonts:Sans, Mono, Serif, and HersheyScript",
      side=1, line=1, col="deeppink")


str(mtcars)
attach(mtcars)
plot(wt, mpg, pch=19, col="royalblue",
     main="Car Mileage vs. Car Weight",
     xlab="Weight(1,1000lbs)", ylab = "Mileage(Miles per Gallon)")
text(wt, mpg, row.names(mtcars), cex = 0.6, pos=4, col="maroon")
detach(mtcars)





#week14. 그래픽2
#원도표
#Titanic 승객수를 가지고 원도표 그리기
slice <- c(325,285,706,885)
lbl <- c("1st Class", "2nd Class", "3rd Class", "Crew")
pie(slice, labels = lbl, main = "Pie Chart of Titanic Passengers")

str(Titanic)
#
class <- margin.table(Titanic, margin=1)#새로운 요약 테이블 생성해줌
class
pie(class, main = "Pie Chart of Titanic Passengers")#labels 지정하지 않아 레이블 이름 가져옴

lbl <- paste(names(class), ":", class, sep="")
lbl

pie(class, labels = lbl, main = "Pie Chart of Titanic Passengers")

class.pct <- round(class/sum(class)*100, 1)#percent 보여줌
lbl <- paste(names(class), ":", class.pct,"%", sep="")
pie(class, labels = lbl, main = "Pie Chart of Titanic Passengers")

#color change
pie(class, labels = lbl, col=rainbow(length(class.pct)),
    main = "Pie Chart of Titanic Passengers")

#부채도표 겹쳐서 확실히 얼마나 차이나는지 보여줌
#install.packages("plotrix")
library(plotrix)
fan.plot(class, labels = names(class),
         main="Pie Chart of Titanic Passengers")






#막대도표
str(Titanic)
class <- margin.table(Titanic, margin = 1) #첫번째 차원 선택
class
barplot(class, main="Simple Bar chart")
barplot(class, 
        xlab="Class",
        ylab="Number of Passengers",
        main="Simple Bar chart") #기본으로 수직

#수평형태
barplot(class, horiz = TRUE,
        xlab="Class",
        ylab="Number of Passengers",
        main="Horizeontal Bar chart") 

#수직누적막대도표
survival.by.class <- margin.table(Titanic, margin=c(4,1))
survival.by.class
barplot(survival.by.class, 
        main="Stacked Bar Chart")

#수평누적막대도표(옆으로 배열됨)
barplot(survival.by.class, beside = TRUE,
        main="Grouped Bar Chart")
barplot(survival.by.class, beside = TRUE,
        names.arg = c("1st Class", "2nd Class", "3rd Class", "Crew"),
        cex.names = 0.75,#크기
        col = c("red", "green"),#색깔
        legend=TRUE,#범례
        ylab = "Survivors", las=1, ylim=c(0,1000),
        main="Grouped Bar Chart")

#범례위치 바꾸기
barplot(survival.by.class, beside = TRUE,
        names.arg = c("1st Class", "2nd Class", "3rd Class", "Crew"),
        cex.names = 0.75,#크기
        col = c("red", "green"),#색깔
        ylab = "Survivors", las=1, ylim=c(0,1000),
        main="Grouped Bar Chart")
legend(x=1,y=900, legend = c("Dead", "Alive"),
       #pch= ,모양인경우
       #lty = ,선 인 경우
       fill = c("red", "green"), title = "Status")


#막대의 높이를 동일하게 만들고 척도 비교하기
survival.by.class
survival.prop <- prop.table(survival.by.class, margin=2) #margin=2:열의 비율을 계산해서 
survival.prop
barplot(survival.prop, col=c("maroon", "skyblue"),
        xlab="Class", ylab="Ratio of Survivors", las=1,
        main="Survivors by Class(Ratio")

#install.packages("vcd")
library(vcd)
spine(t(survival.by.class), gp=gpar(fill=c("mistyrose", "lightblue")),
      main="Spine Plot of Survivors by Class") #t()로 행과열을 바꾸고 인자로 넘긴다

#사료에 종료에 따라 막대그래프로 보여주기
str(chickwts)
heights <- tapply(chickwts$weight, chickwts$feed, mean)
heights
barplot(heights, xlab="Feed Type", ylab="Mean Chichen Weights(g)",
        ylim=c(0,400), las=1, main="Chicken Weights by Feed Type")

#막대도표 꾸미는 옵션들 살펴보기
str(UCBAdmissions)
admission.by.dept <- margin.table(UCBAdmissions, c(1,3))
admission.by.dept

barplot(admission.by.dept, density = 15, angle = 135)#density = 인치당 사선의 개수 , angle = 사선의 각도
barplot(admission.by.dept, density = 55, angle = 45)#density = 인치당 사선의 개수 , angle = 사선의 각도
barplot(admission.by.dept, border = "red", col=c("lightblue", "mistyrose"))#border =테두리

#수평으로 만들기
barplot(admission.by.dept, beside=TRUE, space = c(0.3,2.0)) #막대간 간격, 집단간 간격, 기본0 or 1
barplot(admission.by.dept, beside=TRUE, space = c(0.1,3.0)) #막대간 간격, 집단간 간격, 기본0 or 1
barplot(admission.by.dept, axes = FALSE) #수직 좌표축이 출력되지 않음음
barplot(admission.by.dept, horiz=TRUE, axes = FALSE)




#히스토그램
str(iris)
#꽃받침 폭에 따른 히스토그램
hist(iris$Sepal.Width)
hist(iris$Sepal.Width, main = "Sepal.Width", las=1, breaks=20)#breaks 구간의 개수 설정. 100% 맞진 않지만 맞추려고 함
?hist
hist(iris$Sepal.Width, breaks=seq(2.0,4.4,0.2))
hist(iris$Sepal.Width, breaks=seq(2.0,4.4,0.2), labels = TRUE)#labels 값 보이기
hist(iris$Sepal.Width, breaks=seq(2.0,4.4,0.2), labels = TRUE,
     density = 50, angle = 100,#density = 인치당 사선의 개수 , angle = 사선의 각도
     xlim = c(2,4.5), ylim = c(0,40),
     xlab = "Sepal Width(Cm)"
)
hist(iris$Sepal.Width, breaks=seq(2.0,4.4,0.2), labels = TRUE, prob=TRUE, #prob:확률밀도함수로 볼 수 있음
     col="gold", border="red",
     xlim = c(2,4.5), ylim = c(0,1.5),
     xlab = "Sepal Width(Cm)"
)

density(iris$Sepal.Width) #밀도 곡선
lines(density(iris$Sepal.Width), col="black", lwd=2)#밀도 곡선
quantile(iris$Sepal.Width) #100분위수 추출
rug(quantile(iris$Sepal.Width), col="purple", lwd=4)


#정규분포곡선 추가해서 그리기
hist(iris$Sepal.Width, breaks=seq(2.0,4.4,0.2), labels = TRUE, prob=TRUE, #prob:확률밀도함수로 볼 수 있음
     col="gold", border="red",
     xlim = c(2,4.5), ylim = c(0,1.5),
     xlab = "Sepal Width(Cm)"
)
x <- seq(min(iris$Sepal.Width), max(iris$Sepal.Width), length=40) #40개 사용한다
y <- dnorm(x, mean =mean(iris$Sepal.Width) , sd=sd(iris$Sepal.Width))
lines(x,y, col="chocolate", lwd=3)
box()#겉에 박스 테두리 





#밀도도표
str(iris)
ds <- density(iris$Sepal.Width)
plot(ds, main="Density of Sepal Width")
polygon(ds, col="pink", border = "red") #색깔 채우기
rug(iris$Sepal.Width, col="purple")#러그도표 추가됨

#install.packages("sm")
library(sm)
attach(iris)
sm.density.compare(x=Sepal.Width, group = Species, #3개의 꽃 종류별 그래프
                   xlab="Sepal Width(Cm)")
title(main="Distribution of Sepal Width by Iris Species")
legend("topright", legend = levels(Species), 
       lty = c("solid", "dashed", "dotted"), col=c("red", "green3", "blue"))




#상자도표
str(iris)
boxplot(iris$Sepal.Width,
        ylab="Sepal Width", main="Sepal Width of Iris", las=1)
#whisker:수염, box and whisker plot 박스 수염 도표
#이상점은 동그라미도 표현됨

boxplot.stats(iris$Sepal.Width)#아래수염끝, Q1, Q2, Q3, 위수염끝, conf : 95프로 신뢰구간, out:이상점

boxplot(Sepal.Width~Species, data=iris,
        ylab="Sepal width", main="Sepal width of Iris Species")

?boxplot
boxplot(Sepal.Width~Species, data=iris,
        notch=TRUE,border="red", las=1, #notch 95프로 신뢰구간이 v홈으로 파이는게 보인다
        col=c("pink", "purple","lightblue"),
        ylab="Sepal width", main="Sepal width of Iris Species")

boxplot(Sepal.Width~Species, data=iris,
        notch=TRUE,border="red", las=1, #notch 95프로 신뢰구간이 v홈으로 파이는게 보인다
        col=c("pink", "purple","lightblue"),
        names=c("Setosa", "Versicolor", "Virginica"), #이름 설정 가능 
        ylab="Sepal width", xlab="", main="Sepal width of Iris Species")


#가로로 그리기
boxplot(Sepal.Width~Species, data=iris, horizontal = TRUE, #가로로 그리기, xlab,ylab 을 바꿔줘야 함
        notch=TRUE,border="red", las=1, #notch : 95프로 신뢰구간이 v홈으로 파이는게 보인다
        col=c("pink", "purple","lightblue"),
        names=c("Setosa", "Versicolor", "Virginica"), #이름 설정 가능 
        xlab="Sepal width", ylab="", main="Sepal width of Iris Species")


#집단을 구분하는 변수가 여러개인 경우
str(mtcars)
#cyl, am factor로 변환
mtcars$cyl.factor <- factor(mtcars$cyl, 
                            levels = c(4,6,8), labels = c("4", "6","8"))
mtcars$am.factor <- factor(mtcars$am, 
                           levels = c(0,1), labels = c("Auto","Manual"))
boxplot(mpg~am.factor*cyl.factor, data=mtcars)
boxplot(mpg~am.factor*cyl.factor, data=mtcars,
        col=c("salmon","violet"), las=1, 
        xlab="Car Type", ylab="Milers per Gallon",
        main="Car Mileage by Type")

boxplot(mpg~am.factor*cyl.factor, data=mtcars,
        col=c("salmon","violet"), las=1, 
        varwidth=TRUE, #표본의 크기를 비교해서 볼 수 있다.
        at=c(1,2, 3.5,4.5, 6,7), #사이의 간격 위치로 지정
        xlab="Car Type", ylab="Milers per Gallon",
        main="Car Mileage by Type")
windows(width = 12, height = 8) #새로운 창 생성



#바이올린도표 : 상자도표+밀도도표
#install.packages("vioplot")
library(vioplot)
str(mtcars)

vioplot(mpg~cyl, data=mtcars)
vioplot(mpg~cyl, data=mtcars,
        col="gold", border="brown", colMed="magenta",
        names = c("4 cyl", "6 cyl","8 cyl"),
        xlab = "Number of Cylinders", ylab = "Miles per Gallon", main="Car Mileage by Cylinder")

#데이터가 각각 있는 경우 합쳐서 그래프 그리기
c4 <- mtcars$mpg[mtcars$cyl==4]
c6 <- mtcars$mpg[mtcars$cyl==6]
c8 <- mtcars$mpg[mtcars$cyl==8]

vioplot(c4, c6, c8,
        col="gold", border="brown", colMed="magenta",
        names = c("4 cyl", "6 cyl","8 cyl"),
        xlab = "Number of Cylinders", ylab = "Miles per Gallon", main="Car Mileage by Cylinder")

#산점도
#자동차 무게와 연비
x <- mtcars$wt
y <- mtcars$mpg
plot(x,y, pch=20, col="pink", ann=FALSE) #ann=FALSE 축제목 안나타나게
max(x); max(y)
plot(x,y, pch=20, col="pink", ann=FALSE,
     xlim=c(0,6), ylim=c(0,36))
vioplot(y, col="lightblue", rectCol = "gray", lty = 2, add = TRUE) #add = TRUE 기존 위에 추가
vioplot(x, col="tomato", rectCol = "brown", lty = 1, add = TRUE, horizontal = TRUE,#horizontal = TRUE 수평으로
        wex=6) #wex=6크기 키우기. 기본은 1
vioplot(x, col="tomato", rectCol = "brown", lty = 1, add = TRUE, horizontal = TRUE,
        wex=6, #wex=6크기 키우기. 기본은 1
        at=4)#위치치
title("Car Mieage vs. Car weight",
      xlab="Weight(1,000lbs)", ylab="Miles per Gallon")





#점도표
#모델별 연비
str(mtcars)
head(mtcars)
dotchart(mtcars$mpg)
dotchart(mtcars$mpg, labels = row.names(mtcars), cex = 0.7,
         xlab="Miles per Gallon", main="Mileage for Car Model")

cars <- mtcars[order(mtcars$mpg),]
cars

cars$cyl.f <- factor(cars$cyl, levels=c(4,6,8), labels = c("4cyl","6cyl","8cyl"))
cars

#그룹으로 묶어서 표에 나타냄
dotchart(mtcars$mpg, labels = row.names(mtcars), cex = 0.7,
         xlab="Miles per Gallon", main="Mileage for Car Model",
         groups = cars$cyl.f, gcolor = "red")#실린더를 범주로 추가

#cyl 별 색상지정
cars$colors[cars$cyl.f=="4cyl"] <- "maroon"
cars$colors[cars$cyl.f=="6cyl"] <- "deepskyblue"
cars$colors[cars$cyl.f=="8cyl"] <- "darkgreen"
head(cars)

dotchart(mtcars$mpg, labels = row.names(mtcars), cex = 0.7,
         xlab="Miles per Gallon", main="Mileage for Car Model",
         groups = cars$cyl.f, gcolor = "red",#실린더를 범주로 추가
         color = cars$colors,pch=19
)

VADeaths #버지니아의 사망률률
dotchart(VADeaths)
dotchart(t(VADeaths), cex=0.8) #x,y 바꿈






#선도표
Orange
tree1 <- subset(Orange, Tree==1)
tree1
plot(tree1$age, tree1$circumference, xlab="Age(days)", ylab="Circumference(mm)", 
     main="Growth of Orange Tree 1")
plot(tree1$age, tree1$circumference, xlab="Age(days)", ylab="Circumference(mm)", 
     main="Growth of Orange Tree 1",
     type="l")#선도표
plot(tree1$age, tree1$circumference, xlab="Age(days)", ylab="Circumference(mm)", 
     main="Growth of Orange Tree 1",
     type="b")#선도표 + 점
plot(tree1$age, tree1$circumference, xlab="Age(days)", ylab="Circumference(mm)", 
     main="Growth of Orange Tree 1",
     type="o")#선도표 + 점 겹치게게


#집단별 선도표
Orange
xlim=range(Orange$age)
ylim=range(Orange$circumference)

plot(xlim, ylim, type="n",las=1, bty="l",#그래프 틀만 그리기 #bty="l"그래프 틀 생성
     xlab="Age(days)", ylab="Circumference(mm)", 
     main="Growth of Orange Tree")

ntree <- max(as.numeric(Orange$Tree))
ntree
colors <- c(1:ntree)+1
colors
linetype <- c(1:ntree)
linetype
plotchart <- c(1:ntree)+18
plotchart

for (i in 1:ntree){
  tree <- subset(Orange, Tree==i)
  lines(tree$age, tree$circumference,
        type="b",lwd=2,
        lty=linetype[i], col=colors[i], pch=plotchart[i])
}
legend(xlim[1], ylim[2], 1:ntree,
       col = colors, pch=plotchart, lty = linetype,
       title = "Trees")




#산점도
str(iris)
plot(iris$Petal.Length, iris$Petal.Width)
with(iris, plot(Petal.Length, Petal.Width))

plot(Petal.Width ~ Petal.Length, iris) #formula 방식 y~x

as.integer(iris$Species)
with(iris, plot(Petal.Length, Petal.Width,
                pch=as.integer(Species)+18))
legend(x=1.2, y=2.4, legend = c("Setosa","Versicolor","Virginica"), #x,y,좌표로 위치 지정
       pch=c(1:3)+18)


with(iris, plot(Petal.Length, Petal.Width,
                pch=as.integer(Species)+18))
legend(x=1.2, y=2.4, legend = as.character(levels(iris$Species)), #x,y,좌표로 위치 지정
       pch=c(1:length(levels(iris$Species)))+18)

#locator 옵션 사용
with(iris, plot(Petal.Length, Petal.Width,
                pch=as.integer(Species)+18))
legend(locator(1), legend = as.character(levels(iris$Species)), #locator 함수 호출하면 마우스로 x,y,좌표로 위치 지정가믕
       pch=c(1:length(levels(iris$Species)))+18)

#색깔
with(iris, plot(Petal.Length, Petal.Width,
                pch=as.integer(Species),
                col=as.integer(Species)))
palette()
legend(x=1.2, y=2.4, legend = as.character(levels(iris$Species)), 
       pch=1:length(levels(iris$Species)),
       col = 1:length(levels(iris$Species)))


with(iris, plot(Petal.Length, Petal.Width,
                pch=19,
                col=(as.integer(Species))+1))
legend(x=1.2, y=2.4, legend = as.character(levels(iris$Species)), 
       fill = c(1:length(levels(iris$Species)))+1)



#산점도
install.packages("car")
library(car)
scatterplot(mpg~wt | cyl , data=mtcars, boxplots="xy", lwd=2, pch=c(15,16,17),
            col=c("red","green","blue"))







#산점도 행렬
str(iris)
plot(iris[1:2])
plot(iris[1:4])

pairs(iris[1:4])
pairs(~Sepal.Length+Sepal.Width+Petal.Length+Petal.Width, data=iris)

pairs(~Sepal.Length+Sepal.Width+Petal.Length+Petal.Width, data=iris, upper.panel=NULL)

install.packages("psych")
library(psych)
pairs.panels(iris[1:4])

?points
pairs.panels(iris[1:4], pch=21, bg=c("red","green","blue")[iris$Species],
             lm=TRUE) #회귀선 그림

pairs.panels(iris[1:4], pch=as.numeric(iris$Species)+20, bg=c("red","green","blue")[iris$Species],
             lm=TRUE,
             hist.col = "gold") #histogram색 변경


#상관계수의 통계적 유의성 확인을 위해
install.packages("PerformanceAnalytics")
library(PerformanceAnalytics)
chart.Correlation(iris[1:4], pch=21, 
                  bg=c("red","green","blue")[iris$Species],lm=TRUE)


