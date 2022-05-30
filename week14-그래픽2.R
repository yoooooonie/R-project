#week14. 그래프
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
survival.prop <- prop.table(survival.by.class, margin=2) #열의 비율을 계산해서 margin=2
survival.prop
barplot(survival.prop, col=c("maroon", "skyblue"),
        xlab="Class", ylab="Ratio of Survivors", las=1,
        main="Survivors by Class(Ratio")
