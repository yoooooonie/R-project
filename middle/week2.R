
#작업환경 패키지
installed.packages()
colnames(installed.packages())
installed.packages()[,c("Package","Version")]

search()

m <- matrix(1:6, 3, 2)
m
t(m)
t <- function(x) x+100
t(m)


#사용자가 만든 함수랑 기존package에 있는 함수랑 
#내가 정의한 함수는 [1] ".GlobalEnv" 에 들어 있어서 실행됨
#search() 함수는 다음과 같은 인자들을 가지고 있고 이 순서대로 탐색하여 함수를 찾음
#base 패키지가 가장 마지막에 있어서 t() 함수가 내가 지정한 함수로 실행된 것임
search()
#[1] ".GlobalEnv"        "tools:rstudio"     "package:stats"     "package:graphics"  "package:grDevices"
#[6] "package:utils"     "package:datasets"  "package:methods"   "Autoloads"         "package:base"   



#같은 이름의 함수를 사용해서 생기는 문제를 방지하지 위해 모든 패키지에 name space를 갖도록 함
#패키지 이름+콜론2개(::)를 연산자로 사용해서 함수를 지정하면 해당 패키지의 함수를 사용할 수 있게 됨
base::t(m)

#메모리에 적재가 되어 있어야 사용이 가능하다
#해서 libaray()함수를 이용해서 패키지를 메모리에 올려야 한다
library(lattice)
search()
xyplot(dist~speed, data=cars)


#메모리에서 패키지를 지우고 싶다 detach(package:패키지이름)사용
detach(package:lattice)
search()
xyplot(dist~speed, data=cars)



#R 개발자들이 본인이 개발한 패키지를 공유한다. 그들의 패키지는 구글이나 cran 등에서 찾을 수 있다
#새로운패키지를 설치하고 싶으면 intall.packages("ggplot2") 하면 필요한 패키지들까지 전부 끌고와서 설치가 됨
install.packages("ggplot2")
#패키지가 설치된 경로를 보고 싶으면  .libPaths()  
.libPaths()
#기본패키지 경로 "C:/Users/hyuscec-2/Documents/R/win-library/4.1"
#추가설치 패키지 경로 C:/Program Files/R/R-4.1.2/library

#도움말 찾는 법
help(package="ggplot2") #방법1
library(help=ggplot2) #방법2 소스 영역에 있는 내용
#방법3
library(ggplot2)
ls("package:ggplot2")

search()
#package:datasets 기본포함된 데이터셋
#보고 싶으면 data() 전체 리스트가 보여짐. 추가로 설치한 패키지의 데이터셋도 보임
data()

head(AirPassengers) #first 6th
head(AirPassengers,10) #first 10th
tail(cars) #last 6th

help(cars)

data(package="MASS")#데이터 셋 MASS의 컬럼설명
data(Animals, package="MASS")
head(Animals)

#하나하나 불러서 보기 귀찮다. 그럼 메모리에 적재해서 보면된다
library(MASS)
head(UScrime)
head(Rabbit)

save.image("chapter2.R")



#도움말
help.start()
getwd()
help(median)
?median
args(median)
#> args(median)
#function (x, na.rm = FALSE, ...) 
#na는 결측값을 이야기 함
#결측값을 제거하지 않고 그대로 두고 계산하는 것이 기본으로 되어 있음
#하지만 na.rm =True로 놓고 계산함. NA 값으로 계산하면 NA가 나오니까

#예제 확인가능
example(median)

#함수이름을 정확히 모를 때,조금만 생각날 때
help.search("xyplot")
??xyplot
apropos("plot")

hero.vector <- c("Super","Spider","Bat")
apropos("vec")

#정규표현식(regular expression)으로 검색어를 입력할 수 있음
apropos("*vec*")
?regex

#example
apropos("q$") # q로 끝나는
apropos("[7-9]")#7-9의 숫자가 들어가는 거 검색
apropos("xy+") #xy 포함한 거 검색

#웹 도움말
#https://search.r-project.org/
#https://rseek.org/ google 검색엔진 바탕 r 결과 

RSiteSearch("topicmodel")

#install.packages("sos") #install
library(sos) #메모리에 올리기
findFn("social network analysis") #도움말 검색해서 보기좋게 matrix로 

#데이터구조
c(1,2,3,4,5)#vector

c("A","B","C","A","B")
factor(c("A","B","C","A","B"))

matrix(1:12 ,3,4) #행이 3열이 4개

array(1:12, c(2,3,2))
array(1:8, c(1,4,2)) #행,열,차원

data.frame(product=c("A","B","C"),
           price=c(100,200,300))

list(x=c("A","B","C","A","B"),
     y=matrix(1:12 ,3,4),
     z=data.frame(product=c("A","B","C"),
                  price=c(100,200,300)))


