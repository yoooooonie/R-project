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


