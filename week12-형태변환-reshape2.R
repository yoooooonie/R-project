#reshape2
#install.packages("reshape2")
library(reshape2)

#wide format example
smiths

#wide format to long format, 식별자변수 지정하지 않음. 문자열이 있으면 식별자변수로 사용
melt(data = smiths)

#식별자변수 지정 가능
?melt
melt(data = smiths, id.vars = "subject")
melt(data = smiths, id.vars = "weight") #error가 남
#측정변수를 지정할 수 있음
melt(data = smiths, measure.vars = c(2:5))
melt(data = smiths, measure.vars = c("time","age","weight","height")) 
melt(data = smiths, id.vars = "subject", measure.vars = c("time","age","weight","height")) 

#열의 이름을 지정할 수 있음
melt(data = smiths, id.vars = "subject", measure.vars = c("time","age","weight","height"),
     variable.name = "var", value.name = "val") 


smiths.long <- melt(data = smiths, id.vars = "subject", measure.vars = c("time","age","weight","height"),
     variable.name = "var", value.name = "val") 
smiths.long

#long format to wide format
?dcast
dcast(data=smiths.long, formula=subject~var, value.var = "val")

head(airquality)
aq.long <- melt(airquality, id.vars = c("Month","Day"))
tail(aq.long)
aq.long <- melt(airquality, id.vars = c(5:6))
tail(aq.long)

aq.wide <- dcast(aq.long, Month+Day~variable,
                 value.var = "value")
head(aq.wide)


dcast(aq.long, Month~variable) #Month만 가지고는 제대로 되지 않음
dcast(aq.long, Month~variable,
      fun.aggregate = mean, na.rm=TRUE)



