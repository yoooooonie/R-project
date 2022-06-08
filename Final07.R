#Chapter07 입력과 출력
#7-1
d1 <- c(21.0, 18.2)
d2 <- c(14.8, 14.7, 14.0, 13.8)
d3 <- c(10.9, 10.6, 10.5)
d4 <- c(9.7,9.2)
KPL <- c(d1,d2,d3,d4)
KPL
model <- c(rep('A',2), rep('B',4),rep('C',3),rep('D',2))
df1 <- data.frame(KPL, model)
df1
rm(list=ls())

#7-2
print(pi, digits = 20)
3.1415926535897931
format(pi, digits=20)
3.1415926535897931

#7-3
url <- "http://www.statsci.org/data/general/cherry.txt"
cherry <- read.table(url, header=TRUE)
str(cherry)

head(cherry)
mean(cherry$Height)

#7-4
url4 <- "http://www.statsci.org/data/general/flicker.txt"
eyes <- read.table(url4, header=TRUE)
str(eyes)
head(eyes)
tail(eyes)
subset(eyes, subset = (Colour=='Brown'))
mean(subset(eyes, subset = (Colour=='Brown'))$Flicker)

#7-5
url5 <- "https://www.itl.nist.gov/div898/strd/univ/data/PiDigits.dat"
nist <- read.table(url5, skip=60)
str(nist)
head(nist)
cnt <- table(nist)
percentage <- cnt/5000
percentage

#7-6
url6 <- 'http://jse.amstat.org/datasets/draft70mn.dat.txt'
df6 <- read.fwf(url6, widths = c(-1, rep(c(-1,3),12)),n=31)
head(df6)
tail(df6)
colnames(df6)<-month.abb
colnames(df6)
#df6$day <- rownames(df6)
df6$day <- 1:31
head(df6)
#생일이 2월 29일 인 사람의 번호 = 31+29=
df6$Feb[29]
median(df6$Jan, na.rm = TRUE)
median(df6$Dec, na.rm = TRUE)

#7-7
install.packages('readxl')
library(readxl)
airqualSeoul <- read_excel('C:/Users/kwkan/Downloads/확정자료엑셀다운.xls',
                           col_types=c(rep('text',3), rep('numeric',7)), sheet=1)
head(airqualSeoul)
subset(airqualSeoul, subset = (측정소명=='성북구'))
colMeans(subset(airqualSeoul, subset = (측정소명=='성북구'))['PM2.5'], na.rm=TRUE)
colMeans(subset(airqualSeoul, subset = (측정소명=='종로구'))['PM2.5'], na.rm=TRUE)

#7-8
url8 <- 'https://www.ssa.gov/oact/babynames'
