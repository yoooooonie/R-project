#Week 5
#리스트 생성

list(0.68,0.9544,0.9974)

#List는 여러 형태의 원소를 가질 수 있다
list(1.23, "Apple", c(2,3,5,7), matrix(1:6, ncol = 3), mean)

lst <- list()
lst
lst[[1]] <- 1.23
lst[[2]] <- "Apple"
lst[[3]] <- c(2,3,5,7)
lst[[4]] <- matrix(1:6, ncol = 3)
lst[[5]] <- mean
lst

#이름을 갖도록 할 수 있다
lst1 <- list(0.68,0.9544,0.9974)
lst1
names(lst1) <- c("sigma1","sigma2","sigma3")
lst1
names(lst1)


#원소의 개수 알기
length(lst1)

#리스트 끼리의 결합 
worldcup1 <- list("Brazil","South Africa", "Germany")
worldcup2 <- list("Korea", "France", "USA")

worldcup1
worldcup2

#리스트 끼리의 결합 c()를 사용하면 됨
c(worldcup1,worldcup2)

a <- list(1,2,3,4,5,6,7)
a
mean(a) #mean 함수 사용 불가능 mean은 벡터에 사용하는 함수
#mean 함수 사용 불가능 mean은 벡터에 사용하는 함수
#unlist()로 벡터 형으로 변환 후 계산
mean(unlist(a))
min(unlist(a))
max(unlist(a))

#리스트 인덱싱1 
#[[]] : 자료 내에 포함된 자료의 값, 데이터 유형을 그대로 가져옴
#[] : 자료 자체를 추출함, 원소를 가져옴, 내부의 데이터 유형에 접근이 불가함. 리스트로 나옴

product <- list("A002", "Mouse", 30000)
product

product[[3]]
product[[2]] #내부에 있는 값 "Mouse" 를 가져옴

product[3]
product[2]

class(product[[3]])
class(product[3])

#숫자랑 연산을 하고 싶다! 하면 [[]]사용해야 겠지?
product[[3]]*0.9
product[3]*0.9

product[c(1,2)] #첫번째 두번째 원소가 리스트 형태로 출력됨
#논리값 사용가능
product[c(FALSE, TRUE, FALSE)]
#minus index 사용가능
product[-1]

#이름 지정하기
product1 <- list(id="A002", name="Mouse", price=30000)
product1
#이름으로 값 불러오기 가능
product1[["name"]]
#이름이 잇는 경우는 $를 사용해서 접근 가능
product1$name

product1[c("name", "price")]

#없는거 호출하면 NULL을 반환함
product1[["fourth"]] 
product1$fourth#없는거 호출하면 NULL을 반환함
product1[[4]]#없는거 호출하면 error

product1[c(4,2,5)] #존재하지 않는 벡터값을 줌, 없는 인덱스는 NULL을 반환환
product1[c("fourth", "name","rich")]#존재하지 않는 이름을 인덱스로 줌, 없는 인덱스는 NULL을 반환환

#중첩된 리스트로 생성이 가능
lst2 <- list(one=1, two=2, three=list(alpha=3.1, beta=3.2))
lst2

lst2[["three"]]
lst2[["three"]]$beta
lst2$three$beta
lst2[["three"]][["beta"]]

#리스트 인덱싱2
#리스트 원소 변경 추가 삭제

pdt <- list(id="A001", name="Mouse", price=30000)
pdt
pdt[[3]] <- 40000
pdt
pdt[["price"]] <- 41000
pdt
pdt$price <- 42000
pdt
#원소가 하나인 경우는 [[]],[] 동일 함
pdt[3] <- 43000
pdt
pdt["price"] <- 44000
pdt

#여러개의 값을 할당하는 경우는 [[]]써야함
pdt[[3]] <- c(30000,40000)
pdt
#리스트 구조로 만들어서 할당해줘야 함
pdt[3] <- list(c(31000,41000))
pdt

pdt[1:3] <-  list("A002", "Keyboard", 90000)
pdt

#원소 추가
pdt[[4]] <- c("Domestic", "Export")
pdt
#추가한 원소에 이름 지정
pdt$madein <- c("Korea", "China")
pdt
#원소 추가하면서 이름 지정
pdt[["madein2"]] <- c("Korea", "China")
pdt
pdt["madein3"] <- list(c("Korea","China"))
pdt

#여러 원소 한번에 추가하는 경우
pdt[8:11] <- list(0.12,0.15,0.22,0.27)
pdt

#빈 리스트 만든 다음에 여러 데이터 밀어넣기 중요!!!!
names <- c("Mon", "Tue", "Wed","Thu","Fri","Sat","Sun")
values <- c(842,729,786,751,844,851,702)
traffic.death <- list()
traffic.death
traffic.death[names] <- values
traffic.death


#특정 원소 제거
traffic.death[["Fri"]] <- NULL
traffic.death["Fri"] <- NULL
traffic.death

#여러개 원소 제거
traffic.death[c("Mon","Wed")] <- NULL
traffic.death

#조건을 만족하는 원소 제거
#숫자가 750보다 작은 경우 삭제
traffic.death <750
traffic.death[traffic.death<750] <- NULL
traffic.death
