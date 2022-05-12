v <- 1:12
v
dim(v) <- c(3,4)
v

v <- 1:12
matrix(data=v, nrow=3, ncol = 4) #열의 방향으로 채워짐
matrix(data=v, nrow=3, ncol = 4, byrow = TRUE) #행의 방향으로 채워짐

rnames <- c("R1", "R2","R3")
colnames <- c("C1", "C2","C3","C4")

matrix(data=v, nrow = 3, ncol = 4,
       dimnames = list(rnames, colnames)) #열, 행 이름 지정 가능능


#같은 값을 넣고 싶을 때
matrix(0,3,4) #0으로 채워진 r3, c4개까지 생김김
?matrix
matrix(NA, 3, 4)

matrix(v, ncol=3) #r, c 중에 하나만 지정해줘도 계산해서 나머지 지정됨

#내부구조 봐볼까
mat <- matrix(v, ncol=4)
str(mat)

dim(mat) #행, 렬 수가 출력됨
dim(mat)[1] #행
dim(mat)[2] #열의 수

nrow(mat)
ncol(mat)
length(mat)#총 인자수수


#벡터를 가지고 행렬만들기
#rbind()
#cbind()
v1 <- c(1,2,3,4,5)
v2 <- c(6,7,8,9,10)
rbind(v1, v2)#행의 방향으로 결합된다
cbind(v1, v2)#열의 방향으로 결합된다

cbind(1:3, 4:6, matrix(7:12, 3,2)) #열의 방향으로 결합된다

rbind(matrix(1:6, 2,3), matrix(7:12, 2,3))#행의 방향으로 결합된다



#행렬 연산 : 각 원소들 간의 연산이 일어남
mtx <- matrix(1:6, 2,3)
mtx
mtx+4
mtx-2
mtx*3 
mtx/2




a <-matrix(1:6, 2,3)
b <-matrix(6:1, 2,3)
a
b
a+b
a-b
a*b
a/b
#행렬간 연산은 크기가 같아야 한다

c <- matrix(6:1, 3,2)
c
a
a+c
a*c

#정말 행렬 곱을 쓰고 싶으면 %*% 연산자를 써야 함
a <- matrix(1:6, 2,3)
a
b <- matrix(1:6, 3,2)
b
a %*% b #일반행렬곱 - 개수 맞아야 함
c <- matrix(1:6, 2,3)
c
a %*% c


mtx <- matrix(1:6, 2,3)
mtx
mtx %*% 1:3 #1:3이란 벡터를 행렬로 바꿔서 연산을 해줌
mtx %*% 1:2 #차원은 맞춰줘야 함함

mtx <- matrix(1:6, 2,3)
mtx
mtx + 1:3 #열의 방향으로 덧셈이 이루어 진다


mtx
rowSums(mtx)
colSums(mtx)
rowMeans(mtx)
colMeans(mtx)

mtx
t(mtx) #transpose
1:5 #벡터는 열의 모양을 갖는 행렬로 취급된다
t(1:5) #벡터는 열의 모양을 갖는 행렬로 취급된다, transpose하면 행을 갖는 행렬이 됨

mtx
mtx[2,]
t(mtx[2,])

#인덱스를 이용하여 행 또는 열 추출, 두개의 인덱스

v
mat <- matrix(v, 3, 4)
mat
str(mat)

mat[1,]
mat[,3]
#1차원의 벡터로 출력해 버린다 조심하기

mat[1,,drop=FALSE] #drop 옵션으로 행렬의 형태 그대로 출력하게 만듬
mat[,3,drop=FALSE] #drop 옵션으로 행렬의 형태 그대로 출력하게 만듬

mat[2:3,] #2,3번째 행과 모든 열
mat[,3:4] #3,4번째 열과 모든 행
mat[2:3,3:4]
mat[c(1,3),] #1,3번째 행과 모든 열
mat[,c(2,4)] #2,4번째 열과 모든 행, 인덱스는 새로이 부여됨

#음수인덱스는 해당 행,열이 제거된 행렬이 출력됨
mat[,c(2,3)] # 2,3번 열이 제거됨

mat
mat[1,3] <- 77 #인덱스를 찾아서 해당 위치의 값을 변경할 수 있음
mat

mat[2,]
mat[2,] <- c(22,55) #부족하면 재사용 귀칙으로 반복해서 채움
mat

mat[2:3, 3:4]
mat[2:3, 3:4] <- c(1,2,3,4) #열의 방향으로 채워짐 
mat

city.distance <- c(0,331,238,269,195,331,0,95,194,189,238,95,0,171,130,269,194,171,0,77,195,189,130,77,0)
length(city.distance)
city.distance.mat <- matrix(city.distance, 5,5, byrow=TRUE)
city.distance.mat

colnames(city.distance.mat) <- c("Seoul","Busan","Daegu","Gwangju","Jeonju")
rownames(city.distance.mat) <- c("Seoul","Busan","Daegu","Gwangju","Jeonju")
colnames(city.distance.mat)
rownames(city.distance.mat)
city.distance.mat

#서울부터 부산의 거리
city.distance.mat["Seoul","Busan"]
#서울부터 모든 도시의 거리
city.distance.mat["Seoul",]
#몇몇 도시만 보고 싶다
city.distance.mat[c("Seoul","Gwangju"),]


#배열 : 행렬의 일반화된 데이터 형식 | 행 열 테이블
# 3개 이상의 차원을 갖는다

a <- 1:24
a
dim(a) <- c(3,4,2) #차원을 부여함
a

#배열을 만드는 함수 array
array(1:12, c(2,3,2))

ary <- array(1:12, c(2,3,2))
ary
ary[1,3,2]
ary[,1,2]
ary[,1,2,drop=FALSE] #벡터 형식으로 말고 배열의 구조를 유지한 채로 출력하게 만듬 옵션 drop=FALSE
ary[2,,] #R에 의해서 결과에 필요없는 차원은 줄어서 결과가 출력됨됨
