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

map2_*() #2개
pmap_*() #3개


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


