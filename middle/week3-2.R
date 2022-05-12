

#infinite number Inf

3/0
5-Inf
Inf*Inf
Inf*(-Inf)

a <- Inf
is.infinite(a)

1.8*10^305 #컴퓨터가 인지할 수 있는 가장 큰 수. 이 수 이상은 무한대로 인지지
is.infinite(10^(305:310))

Inf/Inf
Inf*0
is.nan(NaN+3)
is.nan(NA)

#결측값 = NA  Not Available
k <- NA
sqrt(k)
is.na(k)

is.na(z)
is.na(NaN)
k == NA #사용하지 마시게 


z <- 1:5
sum(z)
prod(z)
max(z)
min(z)
mode(z)
mean(z)
median(z)
range(z)
sd(z)

#벡터에 NA 값이 있는 경우 NA로 반환하기에 na.rm = TRUE 먼저 설정해야함
w <- c(1,2,3,4,5,NA)
sum(w)
sum(w, na.rm = TRUE)
sum(na.omit(w))

v <- c(NA, NA, NA, NA, NA)
v
sum(v, na.rm = TRUE)
prod(v, na.rm = TRUE)
max(v, na.rm = TRUE)
min(v, na.rm = TRUE)


traffic.death <- c(842,729,786,751,844,851,702)


cumsum(traffic.death)#누적썸
cumprod(c(1,2,3,4))#누적
cummax()#
cummin()#

#결측값을 빼고 계산되지 않음
cumsum(c(1,3,5,NA,3))#누적

traffic.death
diff(traffic.death)  #뒷자리에서 앞자리 뺀것들의 벡터로 나옴
diff(c(1,3,5,NA,3))
diff(1:5, lag=2)#2칸씩 떨어진 것의 차이를 구함


p <- 1:10
q <- 6:15
union(p,q)#합집합
intersect(p,q)#교집합
setdiff(p,q)#차집합
setdiff(q,p)#차집합
setequal(p,q)
setequal(q,p)
is.element(setdiff(p,q),q)
