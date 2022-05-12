#벡터 생성 - Week3
c(1,2,3,4,5,6,7,8,9,10)
c("We","love","data","analytics")
c(TRUE, FALSE, TRUE, FALSE)

odd <- c(1,3,5,7,9)
even <- c(2,4,6,8)
odd
even
c(odd,even) #벡터도 포함할 수 있다. 순서는 그대로 가진다
#> c(odd,even)
#[1] 1 3 5 7 9 2 4 6 8

3:9
#> 3:9
#[1] 3 4 5 6 7 8 9

5:-3
#> 5:-3
#[1]  5  4  3  2  1  0 -1 -2 -3

?seq() #일단 도움말 보고

seq(from=5, to=-3, by=-2)
seq(from=5, to=8.5, by=0.5) #소수점 가능
#> seq(from=5, to=8.5, by=0.5)
#[1] 5.0 5.5 6.0 6.5 7.0 7.5 8.0 8.5

seq(from=5, to=20, length.out=2)
#> seq(from=5, to=20, length.out=2)
#[1]  5 20

?rep()
rep(c(1,2,3), times=3)
rep(c(1,2,3), each=3)
#> rep(c(1,2,3), each=3)
#[1] 1 1 1 2 2 2 3 3 3

rep(c(1,2,3), times=c(2,3,2))
#> rep(c(1,2,3), times=c(2,3,2))
#[1] 1 1 2 2 2 3 3

rep(c(1,2,3), length.out=8) #벡터의 인자가 8개 까지만 반복
#> rep(c(1,2,3), length.out=8) # times와 length.out은 같이 못함
#[1] 1 2 3 1 2 3 1 2

#벡터는 포함한 데이터의 유형이 동일해야함
#숫자랑 문자가 있으면 다 문자로 R이 변환함
num <- c(1,2,3)
cha <- c("q","w","e")
c(num, cha)
#> c(num, cha) 다 문자로 R이 변환함
#[1] "1" "2" "3" "q" "w" "e"

?str()
str(num)
str(cha)
#> str(cha)
#chr [1:3] "q" "w" "e"     [1:3] : 1차원 이라는 것
# 2차원이나 3차원이면 ,로 구분함
#또한 인덱스 번호를 나타냄

length(num)

pi
LETTERS
letters
month.name
month.abb

month <- c(12,9,3,5,1)
month.name[month] #벡터에 있는 인자에 해당하는 인덱스에 있는 name 가져옴

#벡터 연산
1+2
"+"(1,2)

c(2,3,4) + c(4,5,6)
c(2,3,4) * c(4,5,6)
c(20,30,40) / c(4,5,8)
c(20,30,40) %% c(4,5,8) #나머지 연산자
c(20,30,40) %/% c(3,4,7) #몫을 취하는 연산자
c(20,30,40) + c(1,2) #배수 개수 만큼 있으면 재사용해서 연산
#> c(20,30,40) + c(1,2)
#[1] 21 32 41
#Warning message:
#  In c(20, 30, 40) + c(1, 2) :
#  longer object length is not a multiple of shorter object length

c(20,30,40) +2

#==,!=, <,>,<=,>=,!x, x|y, x&y, isTRUE()

v <- pi
w <- 10/3
v == w
v != w
v < w
v > w
!(v == w)
(v < w) | (v > w)
(v == w) | (v > w)
(v == w) & (v > w)

y <- c(0,25,50,75,100)
z <- c(50,50,50,50,50)
y==z
y!=z
y==50
y>50

TRUE=1
FALSE=0

as.numeric(TRUE)

sum(y>50) #조건을 만족하는 것의 개수를 셀 수 있다

any(-3:3 > 0) #TRUE가 있으면 TRUE
all(-3:3 > 0) #모두 TRUE면 TRUE

sqrt(2)^2 == 2   #생각으론 같아야 하지만, FALSE 로 나옴
sqrt(2)^2 - 2
identical(sqrt(2)^2 , 2)
#R에서는 부동소수점수 로 저장되기에 미세한 차이가 날 수 있다.
all.equal(sqrt(2)^2 , 2)#작은 오차를 무시하고 비교하고 싶으면 사용
all.equal(sqrt(2)^2 , 3) #다른 이유에 대해서 설명을 함

isTRUE(all.equal(sqrt(2)^2 , 3)) #결과를 TRUE, FALSE로 보고 싶으면 사용

#문자열의 덧셈(paste), 벡터 인자 재사용도 동일
fruit <- c("apple","banana","strawberry")
food <- c("cake", "pie","cheese")
paste(fruit, food)
paste(fruit, "juice")
