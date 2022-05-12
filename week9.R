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


months()
quarters()
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

plt$mday#경과된 날 수수
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




#날짜 lubridate
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

leap_year(2028)
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
