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
