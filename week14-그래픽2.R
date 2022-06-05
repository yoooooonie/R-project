#week14. 그래픽2
#원도표
#Titanic 승객수를 가지고 원도표 그리기
slice <- c(325,285,706,885)
lbl <- c("1st Class", "2nd Class", "3rd Class", "Crew")
pie(slice, labels = lbl, main = "Pie Chart of Titanic Passengers")

str(Titanic)
#
class <- margin.table(Titanic, margin=1)#새로운 요약 테이블 생성해줌
class
pie(class, main = "Pie Chart of Titanic Passengers")#labels 지정하지 않아 레이블 이름 가져옴

lbl <- paste(names(class), ":", class, sep="")
lbl

pie(class, labels = lbl, main = "Pie Chart of Titanic Passengers")

class.pct <- round(class/sum(class)*100, 1)#percent 보여줌
lbl <- paste(names(class), ":", class.pct,"%", sep="")
pie(class, labels = lbl, main = "Pie Chart of Titanic Passengers")

#color change
pie(class, labels = lbl, col=rainbow(length(class.pct)),
    main = "Pie Chart of Titanic Passengers")

#부채도표 겹쳐서 확실히 얼마나 차이나는지 보여줌
#install.packages("plotrix")
library(plotrix)
fan.plot(class, labels = names(class),
         main="Pie Chart of Titanic Passengers")






#막대도표
str(Titanic)
class <- margin.table(Titanic, margin = 1) #첫번째 차원 선택
class
barplot(class, main="Simple Bar chart")
barplot(class, 
        xlab="Class",
        ylab="Number of Passengers",
        main="Simple Bar chart") #기본으로 수직

#수평형태
barplot(class, horiz = TRUE,
        xlab="Class",
        ylab="Number of Passengers",
        main="Horizeontal Bar chart") 

#수직누적막대도표
survival.by.class <- margin.table(Titanic, margin=c(4,1))
survival.by.class
barplot(survival.by.class, 
        main="Stacked Bar Chart")

#수평누적막대도표(옆으로 배열됨)
barplot(survival.by.class, beside = TRUE,
        main="Grouped Bar Chart")
barplot(survival.by.class, beside = TRUE,
        names.arg = c("1st Class", "2nd Class", "3rd Class", "Crew"),
        cex.names = 0.75,#크기
        col = c("red", "green"),#색깔
        legend=TRUE,#범례
        ylab = "Survivors", las=1, ylim=c(0,1000),
        main="Grouped Bar Chart")

#범례위치 바꾸기
barplot(survival.by.class, beside = TRUE,
        names.arg = c("1st Class", "2nd Class", "3rd Class", "Crew"),
        cex.names = 0.75,#크기
        col = c("red", "green"),#색깔
        ylab = "Survivors", las=1, ylim=c(0,1000),
        main="Grouped Bar Chart")
legend(x=1,y=900, legend = c("Dead", "Alive"),
       #pch= ,모양인경우
       #lty = ,선 인 경우
       fill = c("red", "green"), title = "Status")


#막대의 높이를 동일하게 만들고 척도 비교하기
survival.by.class
survival.prop <- prop.table(survival.by.class, margin=2) #margin=2:열의 비율을 계산해서 
survival.prop
barplot(survival.prop, col=c("maroon", "skyblue"),
        xlab="Class", ylab="Ratio of Survivors", las=1,
        main="Survivors by Class(Ratio")

#install.packages("vcd")
library(vcd)
spine(t(survival.by.class), gp=gpar(fill=c("mistyrose", "lightblue")),
      main="Spine Plot of Survivors by Class") #t()로 행과열을 바꾸고 인자로 넘긴다

#사료에 종료에 따라 막대그래프로 보여주기
str(chickwts)
heights <- tapply(chickwts$weight, chickwts$feed, mean)
heights
barplot(heights, xlab="Feed Type", ylab="Mean Chichen Weights(g)",
        ylim=c(0,400), las=1, main="Chicken Weights by Feed Type")

#막대도표 꾸미는 옵션들 살펴보기
str(UCBAdmissions)
admission.by.dept <- margin.table(UCBAdmissions, c(1,3))
admission.by.dept

barplot(admission.by.dept, density = 15, angle = 135)#density = 인치당 사선의 개수 , angle = 사선의 각도
barplot(admission.by.dept, density = 55, angle = 45)#density = 인치당 사선의 개수 , angle = 사선의 각도
barplot(admission.by.dept, border = "red", col=c("lightblue", "mistyrose"))#border =테두리

#수평으로 만들기
barplot(admission.by.dept, beside=TRUE, space = c(0.3,2.0)) #막대간 간격, 집단간 간격, 기본0 or 1
barplot(admission.by.dept, beside=TRUE, space = c(0.1,3.0)) #막대간 간격, 집단간 간격, 기본0 or 1
barplot(admission.by.dept, axes = FALSE) #수직 좌표축이 출력되지 않음음
barplot(admission.by.dept, horiz=TRUE, axes = FALSE)




#히스토그램
str(iris)
#꽃받침 폭에 따른 히스토그램
hist(iris$Sepal.Width)
hist(iris$Sepal.Width, main = "Sepal.Width", las=1, breaks=20)#breaks 구간의 개수 설정. 100% 맞진 않지만 맞추려고 함
?hist
hist(iris$Sepal.Width, breaks=seq(2.0,4.4,0.2))
hist(iris$Sepal.Width, breaks=seq(2.0,4.4,0.2), labels = TRUE)#labels 값 보이기
hist(iris$Sepal.Width, breaks=seq(2.0,4.4,0.2), labels = TRUE,
     density = 50, angle = 100,#density = 인치당 사선의 개수 , angle = 사선의 각도
     xlim = c(2,4.5), ylim = c(0,40),
     xlab = "Sepal Width(Cm)"
     )
hist(iris$Sepal.Width, breaks=seq(2.0,4.4,0.2), labels = TRUE, prob=TRUE, #prob:확률밀도함수로 볼 수 있음
     col="gold", border="red",
     xlim = c(2,4.5), ylim = c(0,1.5),
     xlab = "Sepal Width(Cm)"
)

density(iris$Sepal.Width) #밀도 곡선
lines(density(iris$Sepal.Width), col="black", lwd=2)#밀도 곡선
quantile(iris$Sepal.Width) #100분위수 추출
rug(quantile(iris$Sepal.Width), col="purple", lwd=4)


#정규분포곡선 추가해서 그리기
hist(iris$Sepal.Width, breaks=seq(2.0,4.4,0.2), labels = TRUE, prob=TRUE, #prob:확률밀도함수로 볼 수 있음
     col="gold", border="red",
     xlim = c(2,4.5), ylim = c(0,1.5),
     xlab = "Sepal Width(Cm)"
)
x <- seq(min(iris$Sepal.Width), max(iris$Sepal.Width), length=40) #40개 사용한다
y <- dnorm(x, mean =mean(iris$Sepal.Width) , sd=sd(iris$Sepal.Width))
lines(x,y, col="chocolate", lwd=3)
box()#겉에 박스 테두리 





#밀도도표
str(iris)
ds <- density(iris$Sepal.Width)
plot(ds, main="Density of Sepal Width")
polygon(ds, col="pink", border = "red") #색깔 채우기
rug(iris$Sepal.Width, col="purple")#러그도표 추가됨

#install.packages("sm")
library(sm)
attach(iris)
sm.density.compare(x=Sepal.Width, group = Species, #3개의 꽃 종류별 그래프
                   xlab="Sepal Width(Cm)")
title(main="Distribution of Sepal Width by Iris Species")
legend("topright", legend = levels(Species), 
       lty = c("solid", "dashed", "dotted"), col=c("red", "green3", "blue"))




#상자도표
str(iris)
boxplot(iris$Sepal.Width,
        ylab="Sepal Width", main="Sepal Width of Iris", las=1)
#whisker:수염, box and whisker plot 박스 수염 도표
#이상점은 동그라미도 표현됨

boxplot.stats(iris$Sepal.Width)#아래수염끝, Q1, Q2, Q3, 위수염끝, conf : 95프로 신뢰구간, out:이상점

boxplot(Sepal.Width~Species, data=iris,
        ylab="Sepal width", main="Sepal width of Iris Species")

?boxplot
boxplot(Sepal.Width~Species, data=iris,
        notch=TRUE,border="red", las=1, #notch 95프로 신뢰구간이 v홈으로 파이는게 보인다
        col=c("pink", "purple","lightblue"),
        ylab="Sepal width", main="Sepal width of Iris Species")

boxplot(Sepal.Width~Species, data=iris,
        notch=TRUE,border="red", las=1, #notch 95프로 신뢰구간이 v홈으로 파이는게 보인다
        col=c("pink", "purple","lightblue"),
        names=c("Setosa", "Versicolor", "Virginica"), #이름 설정 가능 
        ylab="Sepal width", xlab="", main="Sepal width of Iris Species")


#가로로 그리기
boxplot(Sepal.Width~Species, data=iris, horizontal = TRUE, #가로로 그리기, xlab,ylab 을 바꿔줘야 함
        notch=TRUE,border="red", las=1, #notch : 95프로 신뢰구간이 v홈으로 파이는게 보인다
        col=c("pink", "purple","lightblue"),
        names=c("Setosa", "Versicolor", "Virginica"), #이름 설정 가능 
        xlab="Sepal width", ylab="", main="Sepal width of Iris Species")


#집단을 구분하는 변수가 여러개인 경우
str(mtcars)
#cyl, am factor로 변환
mtcars$cyl.factor <- factor(mtcars$cyl, 
                            levels = c(4,6,8), labels = c("4", "6","8"))
mtcars$am.factor <- factor(mtcars$am, 
                            levels = c(0,1), labels = c("Auto","Manual"))
boxplot(mpg~am.factor*cyl.factor, data=mtcars)
boxplot(mpg~am.factor*cyl.factor, data=mtcars,
        col=c("salmon","violet"), las=1, 
        xlab="Car Type", ylab="Milers per Gallon",
        main="Car Mileage by Type")

boxplot(mpg~am.factor*cyl.factor, data=mtcars,
        col=c("salmon","violet"), las=1, 
        varwidth=TRUE, #표본의 크기를 비교해서 볼 수 있다.
        at=c(1,2, 3.5,4.5, 6,7), #사이의 간격 위치로 지정
        xlab="Car Type", ylab="Milers per Gallon",
        main="Car Mileage by Type")
windows(width = 12, height = 8) #새로운 창 생성



#바이올린도표 : 상자도표+밀도도표
#install.packages("vioplot")
library(vioplot)
str(mtcars)

vioplot(mpg~cyl, data=mtcars)
vioplot(mpg~cyl, data=mtcars,
        col="gold", border="brown", colMed="magenta",
        names = c("4 cyl", "6 cyl","8 cyl"),
        xlab = "Number of Cylinders", ylab = "Miles per Gallon", main="Car Mileage by Cylinder")

#데이터가 각각 있는 경우 합쳐서 그래프 그리기
c4 <- mtcars$mpg[mtcars$cyl==4]
c6 <- mtcars$mpg[mtcars$cyl==6]
c8 <- mtcars$mpg[mtcars$cyl==8]

vioplot(c4, c6, c8,
        col="gold", border="brown", colMed="magenta",
        names = c("4 cyl", "6 cyl","8 cyl"),
        xlab = "Number of Cylinders", ylab = "Miles per Gallon", main="Car Mileage by Cylinder")

#산점도
#자동차 무게와 연비
x <- mtcars$wt
y <- mtcars$mpg
plot(x,y, pch=20, col="pink", ann=FALSE) #ann=FALSE 축제목 안나타나게
max(x); max(y)
plot(x,y, pch=20, col="pink", ann=FALSE,
     xlim=c(0,6), ylim=c(0,36))
vioplot(y, col="lightblue", rectCol = "gray", lty = 2, add = TRUE) #add = TRUE 기존 위에 추가
vioplot(x, col="tomato", rectCol = "brown", lty = 1, add = TRUE, horizontal = TRUE,#horizontal = TRUE 수평으로
        wex=6) #wex=6크기 키우기. 기본은 1
vioplot(x, col="tomato", rectCol = "brown", lty = 1, add = TRUE, horizontal = TRUE,
        wex=6, #wex=6크기 키우기. 기본은 1
        at=4)#위치치
title("Car Mieage vs. Car weight",
      xlab="Weight(1,000lbs)", ylab="Miles per Gallon")





#점도표
#모델별 연비
str(mtcars)
head(mtcars)
dotchart(mtcars$mpg)
dotchart(mtcars$mpg, labels = row.names(mtcars), cex = 0.7,
         xlab="Miles per Gallon", main="Mileage for Car Model")

cars <- mtcars[order(mtcars$mpg),]
cars

cars$cyl.f <- factor(cars$cyl, levels=c(4,6,8), labels = c("4cyl","6cyl","8cyl"))
cars

#그룹으로 묶어서 표에 나타냄
dotchart(mtcars$mpg, labels = row.names(mtcars), cex = 0.7,
         xlab="Miles per Gallon", main="Mileage for Car Model",
         groups = cars$cyl.f, gcolor = "red")#실린더를 범주로 추가

#cyl 별 색상지정
cars$colors[cars$cyl.f=="4cyl"] <- "maroon"
cars$colors[cars$cyl.f=="6cyl"] <- "deepskyblue"
cars$colors[cars$cyl.f=="8cyl"] <- "darkgreen"
head(cars)

dotchart(mtcars$mpg, labels = row.names(mtcars), cex = 0.7,
         xlab="Miles per Gallon", main="Mileage for Car Model",
         groups = cars$cyl.f, gcolor = "red",#실린더를 범주로 추가
         color = cars$colors,pch=19
         )

VADeaths #버지니아의 사망률률
dotchart(VADeaths)
dotchart(t(VADeaths), cex=0.8) #x,y 바꿈






#선도표
Orange
tree1 <- subset(Orange, Tree==1)
tree1
plot(tree1$age, tree1$circumference, xlab="Age(days)", ylab="Circumference(mm)", 
     main="Growth of Orange Tree 1")
plot(tree1$age, tree1$circumference, xlab="Age(days)", ylab="Circumference(mm)", 
     main="Growth of Orange Tree 1",
     type="l")#선도표
plot(tree1$age, tree1$circumference, xlab="Age(days)", ylab="Circumference(mm)", 
     main="Growth of Orange Tree 1",
     type="b")#선도표 + 점
plot(tree1$age, tree1$circumference, xlab="Age(days)", ylab="Circumference(mm)", 
     main="Growth of Orange Tree 1",
     type="o")#선도표 + 점 겹치게게


#집단별 선도표
Orange
xlim=range(Orange$age)
ylim=range(Orange$circumference)

plot(xlim, ylim, type="n",las=1, bty="l",#그래프 틀만 그리기 #bty="l"그래프 틀 생성
     xlab="Age(days)", ylab="Circumference(mm)", 
     main="Growth of Orange Tree")

ntree <- max(as.numeric(Orange$Tree))
ntree
colors <- c(1:ntree)+1
colors
linetype <- c(1:ntree)
linetype
plotchart <- c(1:ntree)+18
plotchart

for (i in 1:ntree){
  tree <- subset(Orange, Tree==i)
  lines(tree$age, tree$circumference,
        type="b",lwd=2,
        lty=linetype[i], col=colors[i], pch=plotchart[i])
}
legend(xlim[1], ylim[2], 1:ntree,
       col = colors, pch=plotchart, lty = linetype,
       title = "Trees")




#산점도
str(iris)
plot(iris$Petal.Length, iris$Petal.Width)
with(iris, plot(Petal.Length, Petal.Width))

plot(Petal.Width ~ Petal.Length, iris) #formula 방식 y~x

as.integer(iris$Species)
with(iris, plot(Petal.Length, Petal.Width,
                pch=as.integer(Species)+18))
legend(x=1.2, y=2.4, legend = c("Setosa","Versicolor","Virginica"), #x,y,좌표로 위치 지정
       pch=c(1:3)+18)


with(iris, plot(Petal.Length, Petal.Width,
                pch=as.integer(Species)+18))
legend(x=1.2, y=2.4, legend = as.character(levels(iris$Species)), #x,y,좌표로 위치 지정
       pch=c(1:length(levels(iris$Species)))+18)

#locator 옵션 사용
with(iris, plot(Petal.Length, Petal.Width,
                pch=as.integer(Species)+18))
legend(locator(1), legend = as.character(levels(iris$Species)), #locator 함수 호출하면 마우스로 x,y,좌표로 위치 지정가믕
       pch=c(1:length(levels(iris$Species)))+18)

#색깔
with(iris, plot(Petal.Length, Petal.Width,
                pch=as.integer(Species),
                col=as.integer(Species)))
palette()
legend(x=1.2, y=2.4, legend = as.character(levels(iris$Species)), 
       pch=1:length(levels(iris$Species)),
       col = 1:length(levels(iris$Species)))


with(iris, plot(Petal.Length, Petal.Width,
                pch=19,
                col=(as.integer(Species))+1))
legend(x=1.2, y=2.4, legend = as.character(levels(iris$Species)), 
       fill = c(1:length(levels(iris$Species)))+1)



#산점도
install.packages("car")
library(car)
scatterplot(mpg~wt | cyl , data=mtcars, boxplots="xy", lwd=2, pch=c(15,16,17),
            col=c("red","green","blue"))







#산점도 행렬
str(iris)
plot(iris[1:2])
plot(iris[1:4])

pairs(iris[1:4])
pairs(~Sepal.Length+Sepal.Width+Petal.Length+Petal.Width, data=iris)

pairs(~Sepal.Length+Sepal.Width+Petal.Length+Petal.Width, data=iris, upper.panel=NULL)

install.packages("psych")
library(psych)
pairs.panels(iris[1:4])

?points
pairs.panels(iris[1:4], pch=21, bg=c("red","green","blue")[iris$Species],
             lm=TRUE) #회귀선 그림

pairs.panels(iris[1:4], pch=as.numeric(iris$Species)+20, bg=c("red","green","blue")[iris$Species],
             lm=TRUE,
             hist.col = "gold") #histogram색 변경


#상관계수의 통계적 유의성 확인을 위해
install.packages("PerformanceAnalytics")
library(PerformanceAnalytics)
chart.Correlation(iris[1:4], pch=21, 
                  bg=c("red","green","blue")[iris$Species],lm=TRUE)
