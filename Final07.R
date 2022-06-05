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
