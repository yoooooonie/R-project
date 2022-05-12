num <- 0:30
num
#index는 1부터 시작한다

prime <- c(2,3,5,7,13,17,19)
prime[3]
prime[1:3]
prime[4:6]
prime[6:3]
prime[c(1,1,4,6)]

prime[c(1,3,5,7)]
prime[c(7,5,3,1)]

indices <- c(1,3,5,7)
prime[indices]

#마이너스가 붙은 인덱스틑 없애달라는 뜻
prime[1]
prime[-1]
prime2 <- prime[-2]
prime2

length(prime)
prime[1:(length(prime)-1)]

#인덱스를 이용해서 그 위치에 숫자 넣기
prime <- c(2,4,5,7,11,14,17,18)
prime
prime[2] <- 3
prime[c(6,8)] <- c(13,19)
prime

#인덱스를 지정해서 숫자들을 넣을 수 있다
prime <- c(2,3,5,7,11,13,17,19)
prime
length(prime)
#없는인덱스도 R이 만들어서 넣어준다
prime[9] <- 23
prime
prime[c(10,11)] <- c(29,31)
prime
#아예 순서대로 아닌 건넌 인덱스에도 막 넣어둘 수 있다. 중간에 빈 인덱스는 NA로 채움
prime[15] <- 47
prime



#논리연산으로 하는 법
prime <- c(2,3,5,7,11,13,17,19)
prime < 10
prime[prime < 10]
prime %% 2 == 0
prime[prime %% 2 == 0] #True인 인덱스의 값만 출력력











#예시 문제
seq_along(prime) #length 만큼의 정수를 시퀀셜하게 출력함
seq_along(prime) %% 2 == 0
prime[seq_along(prime) %% 2 == 0]
prime[seq_along(prime) %% 3 == 0]

c(FALSE, TRUE) #가 연속으로 계속 사용됨. c(FALSE, TRUE,FALSE, TRUE,FALSE, TRUE,...)
prime[c(FALSE, TRUE)] #매 2번째가 출력됨
prime[c(FALSE,FALSE, TRUE)] #매 3번째가 출력됨



#논리값을 받아서 TRUE의 경우를 반환함
which()
which.max()
which.min()


rainfall <- c(21.6,23.6,45.8,77.0,102.2,133.3,327.9,348.0,137.6,49.3,53.0,24.9)
length(rainfall)
#강수량이 100보다 큰 달
rainfall>100
#강수량이 100보다 큰 달 index
which(rainfall>100) 
#강수량이 100보다 큰 달 name
month.name[which(rainfall>100)]
month.abb[which(rainfall>100)]
which.max(rainfall)
month.name[which.max(rainfall)]
which.min(rainfall)
month.name[which.min(rainfall)]

#월별 강수량이 100보다 큰 경우의 강수량
rainfall>100
rainfall[rainfall>100]
max(rainfall)
min(rainfall)
rainfall[which.min(rainfall)]




#벡터의 각각 값에 이름을 지정할 수 있다
traffic.death <- c(842,729,786,751,844,851,702)
traffic.death
names(traffic.death) <- c("MON","TUE","WED","THU","FRI","SAT","SUN")
traffic.death
#이름이 지정되면 이름을 주면 인덱스 번호 대신 사용 가능
traffic.death["SAT"]
traffic.death[c("TUE","FRI","SUN","MON")]
weekend <- c("MON","TUE","WED")
traffic.death[weekend]



#사망자수가 800명이 넘는 요일 출력하기
traffic.death>800
names(traffic.death[traffic.death>800])

