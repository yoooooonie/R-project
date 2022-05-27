#week13 
#그래픽
#graphics 패키지가 기본으로 설치되어 있다
#volcano eruption data
str(faithful)

plot(faithful) #고수준

eruptions.long <- faithful[faithful$eruptions>3,]
points(eruptions.long, col="red", pch=19) #저수준, 고수준이 먼저 수행되어 있어야 함
#points(eruptions.long, col="red"#색깔 pch=19#모양)
dev.off() #삭제


#회귀선
faithful.lm <- lm(waiting ~ eruptions, data=faithful)
lines(x=faithful$eruptions, y=fitted(faithful.lm), col="blue") #저수준
#수직선
abline(v=3, col="purple") #v=3인 곳에 수직선
#평균선
abline(h=mean(faithful$waiting), col="green")
abline(faithful.lm, col="pink")
?abline

#그래프 생성 및 저장
str(cars)
plot(cars)
plot(cars$speed, cars$dist)

#x축이 factor인 경우
str(ToothGrowth)
plot(ToothGrowth$supp, ToothGrowth$len) #상대도표 형태로 두 집단별 분포가 보임

#dataframe 제공한 경우 산점도 그려짐 matrix 형태로 
str(iris)
plot(iris[,1:4])

#시계열데이터인 경우
str(nhtemp)
plot(nhtemp)

#모자이크 도표
#버클리대학 입학 데이터
str(UCBAdmissions)
plot(UCBAdmissions)

#모델객체도 그림 그려줌
#회귀모형
str(faithful)
faithful.lm <- lm(waiting ~ eruptions, data = faithful)
class(faithful.lm)
plot(faithful.lm)

#그래프 파일로 저장하기
plot(faithful)
#rstudio 화면에서 export
#확인하기
list.files(pattern = "Rplot.jpeg")
library(pander)
openFileInOS("Rplot.jpeg")


#새로운 윈도우 창 만들어서 거기에 출력하고 저장함. 열어서 확인까지
windows(width = 12, height=8)
plot(faithful)
savePlot(filename = "Rplot2", type = "pdf")
list.files(pattern = "Rplot2.pdf")
openFileInOS("Rplot2.pdf")

#아래 함수들 사용 가능
?png
?pdf
?postscript

library(pander)
png("Rplot3.png", width=648, height = 432)
plot(faithful)
dev.off()
list.files(pattern = "Rplot3.png")
openFileInOS("Rplot3.png")




#그래프 파라미터 설정
plot(faithful)

#제목과 축
plot(faithful,
     main="Old Faithful Geyser",
     sub="Yellowstone National Park",
     xlab="Eruption time(m)",
     ylab="Waiting time(m)")

?par
#label
#las :  the style of axis labels.
plot(faithful, las=0)
plot(faithful, las=1)
plot(faithful, las=2)
plot(faithful, las=3)


#테두리
?par
#"o" (the default), "l", "7", "c", "u", or "]" 
plot(faithful, bty="o")
plot(faithful, bty="n")
plot(faithful, bty="l")
plot(faithful, bty="]")


#심볼과 선
?pch : 심볼
#21~25번은 테두리와 색깔 따로 지정 가능
plot(faithful, pch=3)
plot(faithful, pch=8, col="green")
plot(faithful, pch=25, col="red", bg="purple")

#lty : 선
#(0=blank, 1=solid (default), 2=dashed, 3=dotted, 4=dotdash, 5=longdash, 6=twodash)
str(LakeHuron) #시계열
plot(LakeHuron) #solid
plot(LakeHuron, lty="dotted")
plot(LakeHuron, lty="dashed")
plot(LakeHuron, lty="dotdash")
plot(LakeHuron, lty=8)


#그래프 유형 
?plot
# "p" for points,
# "l" for lines,
# "b" for both,
# "c" for the lines part alone of "b",
# "o" for both ‘overplotted’,
# "h" for ‘histogram’ like (or ‘high-density’) vertical lines,
# "s" for stair steps,
# "S" for other steps, see ‘Details’ below,
# "n" for no plotting.

str(pressure)
plot(pressure)
plot(pressure, type="p")
plot(pressure, type="l")
plot(pressure, type="o")


x <- 1:10
y1 <- exp(1:10)
y2 <- exp(10:1)
plot(x,y1, xlab = "x", ylab="y", type="n")#고수준
lines(x, y1, type = "o", pch=21, col="red")#저수준
lines(x, y2, type = "o", pch=22, col="blue")#저수준



plot(faithful, type="n")
grid()
points(faithful, pch=19, col="blue")



plot(faithful, pch=19, col="blue")
grid()


#색상
#google.com search "colors in r"
colors()
palette()
palette(rainbow(6))
palette()
palette("default")
palette()
#col="white", col="#FFFFFF", col=rgb(1,1,1), col=hsv(0,0,1)#채도색조명도

n <- 12
pie(rep(1, n), col=1:n) #8가지 들어있음

#그라데이션
rainbow()
hear.colors() #빨+노
terrain.colors() #초+파+노
topo.colors()#초+파+노
cm.colors() #cyan +mazenta
gray()

pie(rep(1, n), col=rainbow(n)) 
pie(rep(1, n), col=heat.colors(n)) 
pie(rep(1, n), col=terrain.colors(n)) 
pie(rep(1, n), col=gray(level = seq(0,1,length=n)))
pie(rep(1, n), col=gray(level = seq(0,1,length=n),
                        alpha = seq(0,1,length=n))) 

pie(rep(1, n), col=rainbow(n, alpha = seq(0,1,length=n))) 

#다양한 색
library(RColorBrewer)
?RColorBrewer
display.brewer.all()
display.brewer.pal(3, "Dark2")
display.brewer.pal(9, "Blues")

n <- 9
pie(rep(1,n), col=brewer.pal(n, "Greens"))
pie(rep(1,n), col=brewer.pal(n, "BuGn"))


plot(faithful,pch=21, col="tomato",
     main="Old Faithful Geyser",
     sub="Yellowstone National Park",
     xlab="Eruption time(m)",
     ylab="Waiting time(m)",
     col.main="navy", col.sub="purple",col.lab="royalblue",col.axis="brown"
     )

#크기
#ces
x <- seq(0.5,1.5,0.25)
y <- rep(1, length(x))
plot(x,y,pch=19, cex=x,col="green",
     main="Effects of cex on symbol and text size")
text(x,y+0.1, labels = x, cex=x)


plot(x,y,pch=19, cex=x,col="green",
     main="Effects of cex on symbol and text size",
     cex.main=1.5, cex.lab=1.0, cex.axis=0.75)

#선의 두께
plot(LakeHuron, lwd=1)
plot(LakeHuron, lwd=3)

#글꼴, 글씨체
windowsFonts()
plot(faithful,pch=21, col="tomato",
     main="Old Faithful Geyser",
     sub="Yellowstone National Park",
     xlab="Eruption time(m)",
     ylab="Waiting time(m)",
     family="sans")

#기존 글꼴 변경하기
windowsFonts(
  A=windowsFont("Arial Black"),
  B=windowsFont("Book Antiqua"),
  C=windowsFont("Clisto MT")
)

plot(faithful,pch=21, col="tomato",
     main="Old Faithful Geyser",
     sub="Yellowstone National Park",
     xlab="Eruption time(m)",
     ylab="Waiting time(m)",
     family="C")

?par
#1 corresponds to plain text (the default), 2 to bold face, 3 to italic and 4 to bold italic.

plot(faithful,pch=21, col="cornflowerblue",
     main="Old Faithful Geyser",
     sub="Yellowstone National Park",
     xlab="Eruption time(m)",
     ylab="Waiting time(m)",
     family="serif", font.main=4, font.sub=1, font.lab=3, font.axis=2)





#그래프 배치
windows()
windows(width = 12, height = 8)
plot(faithful,pch=21, col="cornflowerblue",
     main="Old Faithful Geyser",
     sub="Yellowstone National Park",
     xlab="Eruption time(m)",
     ylab="Waiting time(m)",
     family="serif", font.main=4, font.sub=1, font.lab=3, font.axis=2)

#margin
par("mai")
old.par <- par(mai=c(1,0.5,1,0.2))
par("mai")
par(old.par)
par("mai")


par("mar")
old.par <- par(mai=c(5,4,4,2)+0.2)#바꾸기 전 값 넣어두기
par("mar")
par(old.par)
par("mar")


#그래프 영역 설정
# xlim()
# ylim()
# range()함수로 결정해서 그래프 영역 설정

x1 <- 1:10
y1 <- log(x1)
x2 <- 1:10
y2 <- sqrt(x2)

plot(x1,y2,type = "l", col="red", xlab="X",ylab="Y")
lines(x2, y2, lty="dashed", col="blue")

range(y1)
range(y2)

xlim <- range(c(x1, x2))
ylim <- range(c(y1, y2))
plot(x1, y1, xlim=xlim, ylim=ylim,
     type = "l", col="red", xlab="X",ylab="Y")
lines(x2, y2, lty="dashed", col="blue")


#창에서 여러 그래프 보여주기 행부터 채워짐
par("mfrow")
old.par <- par(mfrow=c(2,2))
par("mfrow")
plot(faithful, pch=19, col="blue", main="First:Old Faithful")
plot(pressure, type="l", col="red", main="Second")
plot(LakeHuron,  col="green", lwd=2, main="Third")
plot(ToothGrowth$supp, ToothGrowth$len, col="orange", main="Fourth")

#열 기준으로 그래프 넣으려면
old.par <- par(mfcol=c(2,2))
par("mfcol")
plot(faithful, pch=19, col="blue", main="First:Old Faithful")
plot(pressure, type="l", col="red", main="Second")
plot(LakeHuron,  col="green", lwd=2, main="Third")
plot(ToothGrowth$supp, ToothGrowth$len, col="orange", main="Fourth")

#그래프 넣는 순서 지정할 수 있음, 행렬형태로 설정
matrix(c(1,1,4,2,3,4), 2,3,byrow = TRUE)
old.par <- par(no.readonly = TRUE) #기존의 설정 저장
layout(matrix(c(1,1,4,2,3,4), 2,3,byrow = TRUE))
layout.show(4)
plot(faithful, pch=19, col="blue", main="First:Old Faithful")
plot(pressure, type="l", col="red", main="Second")
plot(LakeHuron,  col="green", lwd=2, main="Third")
plot(ToothGrowth$supp, ToothGrowth$len, col="orange", main="Fourth")
par(old.par)

#행의 높이와 열의 폭 설정
old.par <- par(no.readonly = TRUE) #기존의 설정 저장
layout(matrix(c(1,1,4,2,3,4), 2,3,byrow = TRUE), 
       widths = c(1,1,1.5), height=c(2,1))#행의 높이와 열의 폭 설정
plot(faithful, pch=19, col="blue", main="First:Old Faithful")
plot(pressure, type="l", col="red", main="Second")
plot(LakeHuron,  col="green", lwd=2, main="Third")
plot(ToothGrowth$supp, ToothGrowth$len, col="orange", main="Fourth")
par(old.par)

#그래프 요소 추가
plot(faithful,
     main="Old Faithful Geyser",
     sub="Yellowstone National Park",
     xlab="Eruption time(m)",
     ylab="Waiting time(m)",
     xlim=c(1,6), ylim=c(40,100),
     las=1, bty="l", pch=21, col="dimgray", bg="maroon",
     family="serif", 
     font.main=4, font.sub=3, font.axis=2,
     cex.main=1.5, cex.lab=1.0, cex.axis=0.75,
     col.main="tomato", col.sub="orange",
     col.lab="firebrick", col.axis="khaki4")


#제목과 축 (저수준 함수에서)
?title
?par
#고수준 함수에서 제목과 축을 설정할 수 있는데, 저수준함수에서 하려면 일단 고수준함수 선언할 때 
#ann 옵션에 FALSE로 선언
?axis
#사용자가 축 설정할 수 있음 

str(state.x77)
states <- data.frame(state.x77)
attach(states)

old.par <- par(no.readonly = TRUE) #기존의 설정 저장
par()
par(mar=c(5,4,4,8)+0.2)

plot(Murder, Life.Exp, pch=20, col="tomato", ylim=c(35, 75),
     yaxt="n",col.axis="darkorchid4",
     cex.axis=0.75, ann=FALSE)
points(Murder, HS.Grad, pch=22, col="blue", bg="skyblue")

axis(side=2, at=seq(68,76,2), labels = seq(68,76,2),
     col.axis="red",cex.axis=0.75, las=2)
axis(side = 4, at=seq(35,70,5), labels = seq(35,70,5),
     col.axis="blue",cex.axis=0.75, las=2, tck=-0.02) #tck 를 음수로 지정하여 그래프 바깥쪽으로 나오도록 한다.

mtext(text = "High School \nGraduates\n(percent)",
      side = 4, line = 3, cex = 0.9, las=2, col = "tan4")
title(main="Murder vs. Life Expectancy vs. High School Graduates",
      xlab="Murder(rate per 100,000 population)",
      ylab="Life Expectancy(years)",
      col.main="maroon", col.lab="tan4", cex.lab=0.9)

par(old.par)
detach(states)



#범례
?legend
# "bottomright", "bottom", "bottomleft", "left", "topleft", "top", "topright", "right" and "center"
#inset 옵션 같이 지정 가능


str(Orange)
tree1 <- subset(Orange, Tree==1)
tree2 <- subset(Orange, Tree==2)

xlim <- range(c(tree1$age, tree2$age))
ylim <- range(c(tree1$circumference, tree2$circumference))

plot(tree1$age, tree1$circumference, type="b",
     xlim=xlim, ylim=ylim, 
     pch=16, lty=1, col="red",
     main="Growth of Orange Tree",
     xlab="Age(days)", ylab="Circumference(mm)")
lines(tree2$age, tree2$circumference, type = "b",
      pch=15, lty=2, col="blue")

#범례추가
legend("topleft", inset = 0.05, title="Tree ID",
       legend = c("Tree 1", "Tree 2"), 
       lty = c(1,2), 
       pch=c(16,15), 
       col=c("red", "blue"))

#그래프 요소 추가 보조눈금
#install.packages("Hmisc")
library(Hmisc)
minor.tick(nx=3, ny=3, tick.ratio = 0.5)#눈금 사이 지정, tick.ratio=0.5 주 눈금의 50프로


#텍스트
?text

plot(1:5, 1:5, type="n", xaxt="n", yaxt="n",ann=FALSE) #출력 다 안해해
text(2,2, font=1, col="red", cex=1.0,
     labels="Default text:Sans text with plain(font=1)")
text(3,3, font=2, col="darkgreen", cex=1.2, family="mono",
     labels="Mono text with bold(font=2)")
text(4,4, font=3, col="blue", cex=1.4, family="serif",
     labels="Serif text with italic(font=3)")
text(2,4, font=2, col="blue", cex=1.4, family="HersheyScript",
     labels="HersheScript text (srt=25)", srt=25)
mtext(text="Windows Fonts:Sans, Mono, Serif, and HersheyScript",
      side=1, line=1, col="deeppink")


str(mtcars)
attach(mtcars)
plot(wt, mpg, pch=19, col="royalblue",
     main="Car Mileage vs. Car Weight",
     xlab="Weight(1,1000lbs)", ylab = "Mileage(Miles per Gallon)")
text(wt, mpg, row.names(mtcars), cex = 0.6, pos=4, col="maroon")
detach(mtcars)

