# 1. 다섯 명의 학생을 대상으로 세 차례 시험을 치른 후 다음과 같이 성적을 기록하였다. 
# 각 학생별 최저 점수를 산출하는 코드를 작성하시오.
# test1 <- c(9,4,7,9,10)
# test2 <- c(10,5,8,7,9)
# test3 <- c(8,3,6,9,10)

test1 <- c(9,4,7,9,10)
test2 <- c(10,5,8,7,9)
test3 <- c(8,3,6,9,10)

test1.min <- min(test1)
test2.min <- min(test2)
test3.min <- min(test3)

#1 답안
test1.min
test2.min
test3.min

# 2. 아래의 days 변수와 count 변수를 이용하여 다음을 수행하시오(forcats 패키지 사용). 
# (a) 등급 Sun 레벨의 위치를 맨 앞으로 이동시키시오.
# (b) count 변수값의 내림차순으로 days 레벨을 정렬하시오.
# days <- factor(c("Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"))
# count <- c(101, 55, 40, 65, 23, 112, 135)

days <- factor(c("Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"))
count <- c(101, 55, 40, 65, 23, 112, 135)
library(forcats)

#2(a) 답안
fct_relevel(days, "Sun") 
#2(b) 답안
fct_reorder(days, .x=count, .desc = TRUE) 


# 3. 1부터 20,000까지의 숫자 벡터를 이용하여 행이 2,000개고 열이 1,000개인 행렬을 생성하고
# mtx라는 변수에 저장하시오. 그리고 그로부터 999번째 행 5번째 열에 있는 값을 추출하시오.

#3 답안
mtx <- matrix(1:20000, 2000, 1000)
str(mtx)
mtx[999,5]
