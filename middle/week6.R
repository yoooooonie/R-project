#week6
#DataFrame 생성

v1 <- c("A001","A002","A003")
v2 <- c("Mouse","Keyboard","USB")
v3 <- c(30000,90000,50000)
data.frame(v1,v2,v3)

#행의 이름 설정해서 생성하기
data.frame(row.names = v1,v2,v3)

#행의 이름 설정해서 생성하기
product <- data.frame(id = v1,name=v2,price=v3)
product

#생성된 데이터의 내부 구조 보기
str(product)

#문자데이터가 factor 형태로 저장되는데,
#stringAsFactors=FALSE 옵션을 주면 문자로 저장된다
product <- data.frame(id = v1,name=v2,price=v3, stringsAsFactors = FALSE)

mat <- matrix(c(1,3,5,7,9,
              2,4,6,8,10,
              2,3,5,7,11), ncol = 3)
mat

#matrix to dataframe
as.data.frame(mat)

number <- as.data.frame(mat)
number
colnames(number) <- c("odd","even","prime")

#list to dataframe
v1 <- c("A001","A002","A003")
v2 <- c("Mouse","Keyboard","USB")
v3 <- c(30000,90000,50000)
lst <- list(v1,v2,v3)
lst

prd <- as.data.frame(lst)
prd
colnames(prd)
colnames(prd) <- c("id","name","price")

#행의개수 출력
nrow(prd)
#열의개수 출력
ncol(prd)
#열의 개수 반환
length(prd)








#데이터프레임 확장
id <- c("A001","A002","A003")
name <- c("Mouse","Keyboard","USB")
price <- c(30000,90000,50000)
product <- data.frame(id,name,price, 
                      stringsAsFactors = FALSE)
product

#새로운 행 추가
product <- rbind(product,
      c("A004","Monitor",250000))
product
#새로운 행들을 추가 데이터프레임 형태로 된 새로운 행들을 추가 하는 것도 가능
new.rows <- data.frame(id=c("A005","A006"), 
                       name=c("Meomory", "CPU"),
                       price=c(35000,320000))
new.rows
product <- rbind(product, new.rows)
product

#새로운 열 추가
product <- cbind(product, 
                 madein=c("Korea","China","China","Korea","Korea","USA"))
product

#다른 방법으로 열 추가하기1
product$madein2 <- c("Korea","China","China","Korea","Korea","USA")
product

new.cols <- data.frame(manufacture=c("Logitech","Logitech","Samsung","Samsung","Samsung","Intel"),
                       quantity=c(20,15,50,30,40,10))
new.cols
#다른 방법으로 열 추가하기2
product <- cbind(product, new.cols)
product


#컬럼명이 중복되도 추가 가능하다
cols1 <- data.frame(x=c("a","b","c"),
                    y=c(1,2,3))
cols2 <- data.frame(x=c("alpha","beta","gamma"),
                    y=c(100,200,300))
cols1
cols2

#컬럼명이 중복되도 추가 가능하다
cbind(cols1,cols2)
#바람직하지 않지만 가능함. 주의해서 컬럼명을 확인할 것

#여러개의 dataframe을 한번에 bind 가능
df1 <- data.frame(sex="female",months=1, weight=3.5)
df2 <- data.frame(sex="male",months=3, weight=4.8)
df3 <- data.frame(sex="male",months=4, weight=5.3)
df4 <- data.frame(sex="female",months=9, weight=9.4)
df5 <- data.frame(sex="female",months=7, weight=8.3)
lst <- list(df1,df2,df3,df4,df5)
lst
str(lst)
lst[[1]]
lst[[2]]
#리스트 안에 있는 원소로(dataframe)로 dataframe을 만들 수 있음
rbind(lst[[1]],lst[[2]])

#많은 수의 작업을 할 때
#데이터가 데이터프레임일 때
do.call(rbind, lst) #rbind를 수행. lst에 있는 원소를 가지고 차례로 돌아가면서 수행행

#데이터가 리스트형태 일 때
lst1 <- list(sex="female",months=1, weight=3.5)
lst2 <- list(sex="male",months=3, weight=4.8)
lst3 <- list(sex="male",months=4, weight=5.3)
lst4 <- list(sex="female",months=9, weight=9.4)
lst5 <- list(sex="female",months=7, weight=8.3)
lst1 <- list(lst1,lst2,lst3,lst4,lst5)
lst1

lst1[[1]]
#리스트를 데이터프레임으로 만들어 줘야함
as.data.frame(lst[[1]])

#리스트가 데이터프레임으로 변함
lapply(lst1,as.data.frame)

#리스트를 데이터프레임으로 만들어 줘야함
#리스트가 데이터프레임으로 변함 아래 한 문장으로 해결됨
do.call(rbind,lapply(lst1,as.data.frame))











#데이터프레임 인덱싱1
?state
state.abb
state.area
state.name
state.region

#데이터프레임 생성
us.state <- data.frame(state.abb, state.name, state.region, state.area,
                       stringsAsFactors = FALSE)
us.state
str(us.state)

us.state[[2]]
str(us.state[[2]])

us.state[2]#데이터프레임의 형태

us.state[c(2,4)]#데이터프레임의 형태

#두번째 열을 출력하고 싶다
us.state[,2]

us.state[,2,drop=FALSE] #기존의 형태 그대로 출력력

us.state[,c(2,4)]#두번째,네번째 열을 출력

#name열을 출력하고 싶다 방법 3가지
us.state[["state.name"]]
us.state$state.name
us.state[,"state.name"]

us.state[c("state.name", "state.area")]#데이터프레임의 형태 #리스트인덱싱
us.state[,c("state.name", "state.area")]#데이터프레임의 형태 #행렬인덱싱

#기본제공 데이터셋 미국의 주에 대한 정보들이 있음
state.x77
str(state.x77)
head(state.x77)
#행렬형식이기 때문에 데이터프레임으로 변경
states <- data.frame(state.x77)
str(states)
row.names(states)
states$Name <- row.names(states)
row.names(states) <- NULL
head(states)

#조건을 넣어서 dataframe을 출력
rich.states <- states[states$Income>5000,
                      c("Name","Income")]
rich.states

large.states <- states[states$Area>100000,
                      c("Name","Area")]
large.states

#두 데이터 프레임 합치기  merge 
merge(rich.states, large.states)
?merge
#all =FALSE 옵션이 기본이며 교집합 부분에 해당하는 데이터를 가져와서 합친다
#all =True  합집합으로 데이터를 생성한다.
merge(rich.states, large.states, all=TRUE)










#데이터프레임 인덱싱2
#데이터프레임에 속한 컬럼명에 접근하려면 
#데이터프레임이름$컬럼명 으로 접근

head(iris)

r <- iris$Sepal.Length / iris$Sepal.Width
head(r)

#변수이름만을 가지고 데이터프레임 내의 변수로 접근할 수 있도록 함
r2 <- with(iris, Sepal.Length/Sepal.Width)
head(r2)

#여러개의 작업을 할 수도 있음
with(iris, {
  print(summary(Sepal.Length))
  plot(Sepal.Length, Sepal.Width)
  plot(Petal.Length, Petal.Width)
})

#단점은 함수 내에서 이루어진 할당은 함수 밖에서 사용할 수 없다(with 함수 내에서만 가능)
with(iris,{
  stats <- summary(Sepal.Length)
  stats
})
stats

#단점은 함수 내에서 이루어진 할당은 함수 밖에서 사용하고 싶으면, <<-  연산자 사용
with(iris,{
  stats.keep <<- summary(Sepal.Length)
  stats.nokeep <- summary(Sepal.Length)
})
stats.keep
stats.nokeep

#with()랑 비슷하나 좀 더 할 수 있음 데이터프레임 내에서 변수 할당할 때 사용
iris$Sepal.Ratio <- iris$Sepal.Length / iris$Sepal.Width
head(iris)

iris <- within(iris,
       Sepal.Ratio2 <- Sepal.Length/Sepal.Width)
head(iris)

#굉장히 자주 사용한다. 하루종일 이 데이터로 작업한다. 메모리에 올려서 빠르게 접근 가능
attach(iris)
search()
#탐색경로에 속하게 된다 => 참조없이 바로 사용이 가능하다

r <- Sepal.Length/Sepal.Width
head(r)

#탐색경로에서 제외할 때,
detach(iris)
search()

#탐색경로에 넣을 때는 주의가 많이 필요하다. 원본데이터프레임이 아니라 복사복이 메모리에 적재된다
#원래 데이터를 접근해서 변경하면 메모리에 복재된 데이터는 변경되지 않는다.
#두 데이터 간의 차이가 발생할 수 있다.

attach(iris) #복사본이 탐색경로에 지정됨. 메모릴에 적재됨.
iris$Sepal.Length <- 0 #원본에 값을 0으로 변경
head(iris$Sepal.Length) #바뀐 값 확인
Sepal.Length #메모리에 있는 값 확인. 원본과 다름
detach(iris)


#메모리에 복제된 값에 작업을 해도 원본과 다르다
attach(iris)
Sepal.Width <- Sepal.Width * 10 #변수에 값을 넣는 것 같지만, 새로운 변수를 선언하는 것과 같음
head(Sepal.Width)
ls()
head(iris$Sepal.Width)
detach(iris)
rm(Sepal.Width)


#데이터프레임을 메모리에 올렸을 떄, 가지고 있는 변수명이 중복되어 문제가 발생할 수 있다
Sepal.Length <- c(4.5,5.3,6.7)
Sepal.Length
attach(iris)#동일한 변수명을 가지고 있을 때 경고 메시지 발생생

#R에서 내가 생각한 변수와 다른 변수를 사용할 수 있다
plot(Sepal.Length, Sepal.Width)
Sepal.Length #내가 따로 선언한 변수로 인지하고 있다
#이름이 중복될 떄는 먼저 선언된 변수가 우선권을 가진다
#내가 따로 선언한 변수가 iris 메모리로 올린것보다 우선권을 가져서 그렇다





#데이터프레임 인덱싱3
?subset()
#subset(데이터프레임이름,조건,가져올컬럼명)
head(mtcars)

subset(mtcars, subset = (mpg>30), mpg)
subset(mtcars, subset=(cyl==4 & am==0), select=c(mpg, hp, wt))

#조건에 함수도 사용 가능하다
subset(mtcars, subset = (mpg>mean(mpg)), select = c(mpg, hp, wt))

#가져올 컬럼명 지정할 때, -인덱스 사용하면 빼고 사용 가능
head(USArrests)
cor(USArrests)#상관계수 구해줌줌

subset(USArrests, select = -UrbanPop)
#가져올 컬럼명 지정할 때, -인덱스 사용하면 빼고 사용 가능
cor(subset(USArrests, select = -UrbanPop))
cor(subset(USArrests, select = -c(UrbanPop,Rape)))

#SQL문장을 사용할 수 있게 해준다
#install.packages("sqldf") #패키지 설치
library(sqldf)
data("mtcars")
sqldf("select * from mtcars where mpg>30", row.names=TRUE) #row.names=TRUE : 행의 이름도 같이 출력됨
sqldf("select * from mtcars where cyl=6 order by mpg", row.names = TRUE)
sqldf("select avg(mpg) as avg_mpg, avg(wt) as avg_wt, gear from mtcars 
      where cyl in (4,6) group by gear")

data("iris") #데이터 불러오기
#distinct 사용해서 종류 알 수 있음
sqldf("select distinct Species from iris") 
sqldf("select * from iris limit 3")
#SQL에서는 변수명에 . 을 사용할 수 없다
#대신에 []를 이용해서 수행함
sqldf("select avg([Sepal.Length]) from iris where Species='setosa'")
#대신에 "[]""를 이용해서 수행할 수 있으나 전체 쿼리문은 ''로 감싸야 함 주의할 것
sqldf('select avg("Sepal.Length") from iris where Species="setosa"')





#데이터프레임 tibble
library(tibble)
search()

v1 <- c("A001","A002","A003")
v2 <- c("Mouse","Keyboard","USB")
v3 <- c(30000,90000,50000)

#tibble 함수로 데이터프레임형식으로 만들 수 있다
product <- tibble(id=v1, name=v2, price=v3)
str(product)
product

#tibble 아니고 tribble임 헷갈리지 말 것
#작은 크기의 데이터셋을 생성할 때 편리하게 쓸 수 있다.
tribble(
  ~id, ~name, ~price,
  "A001","Mouse",30000,
  "A002","Keyboard",90000,
  "A003","USB",50000,
)

#List 열을 가지고 있는 tibble set을 만들 수 있다.
tb <- tibble(id=c(1,2,3),
             data=list(tibble(x=1,y=2),
                       tibble(x=4:5,y=6:7),
                       tibble(x=10)))
tb
tb$data
tb$data[[2]]

#기존의 dataframe 형태를 tibble 형태로 바꾸기
str(iris)
head(iris)
as_tibble(iris)
#tibble은 데이터 전체를 보이는 것이 아니라 화면에 보일 정도만 출력하고 간단하게 보여준다

#메이저리거 정보 들어있는 패키지
install.packages("Lahman")
library(Lahman)
str(Batting)
head(Batting)
Batting.tbl <- as_tibble(Batting)
Batting.tbl

#출력되는 개수 조절하려면
print(Batting.tbl, n=20)
print(Batting.tbl, n=3, width=Inf)

class(Batting.tbl)
Batting.df <- as.data.frame(Batting.tbl)
class(Batting.df)
