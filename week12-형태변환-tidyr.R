#week12 형태변환
#tidyr- gather(), spread()
install.packages("tidyr")
library(tidyr)
head(airquality)

#to make long format
?gather
aq.long <- gather(airquality,
                  key=Factor,
                  value = Measurement,
                  Ozone:Temp)
head(aq.long)


aq.long <- gather(airquality,
                  key=Factor,
                  value = Measurement,
                  -Month, -Day)
head(aq.long)

aq.long <- gather(airquality,
                  key=Factor,
                  value = Measurement,
                  Ozone,Temp,Solar.R, Wind)
head(aq.long)

airquality %>% gather(Factor, Measurement, Ozone:Temp)

?spread
aq.wide <- spread(data = aq.long, key=Factor, value = Measurement)
head(aq.wide)

aq.wide <- aq.long %>% spread(key=Factor, value = Measurement)

head(iris)
iris.long <- gather(iris, key=Element, value=Measurement,
                    -Species)
head(iris.long)
#두개의 열로 분할
?separate
iris.sep <- separate(data=iris.long, 
                     col=Element,
                     into = c("Part","Measures"))
head(iris.sep)

#두개의 열 합치기
?unite
iris.unite <- unite(data=iris.sep,
                    col=unite,
                    sep="-", #기본은 "_"
                    Part, Measures)
head(iris.unite)



#pivot_longer(), pivot_wider() #tibble 형태로 됨
head(airquality)
?pivot_longer
aq.long <- pivot_longer(airquality, 
                        cols = Ozone:Temp,
                        names_to = "Factor",
                        values_to = "Measurement")
head(aq.long)

#long to wide
?pivot_wider
aq.wide <- pivot_wider(aq.long, 
                       names_from  = Factor,
                       values_from  = Measurement)
head(aq.wide)


#nest 셀 안에 또 다른 데이터셋을 저장함
?nest
df <- tibble(x=c(1,1,1,2,2,3),y=1:6,z=6:1)
df
#데이터프레임의 특이한 형태인 티블

df.nested <- nest(.data=df, ndata=c(y,z))
df.nested
df.nested$ndata
#list 형태이기에 추출할 때는 
df.nested$ndata[[2]]

#원래대로 돌리기 
unnest(df.nested, cols = ndata)

#여러개의 리스트를 갖는 데이터
head(iris)
iris.nested <- nest(iris, sepal=c("Sepal.Length","Sepal.Width"),
                    petal=c("Petal.Length","Petal.Width"))
iris.nested
iris.nested$sepal
iris.nested$petal


#group by 
head(mtcars)
library(dplyr)
mtcars.n <- mtcars %>% 
  group_by(cyl) %>% 
  nest()
mtcars.n


library(purrr)
mtcars.m <- mtcars.n %>% 
  mutate(model=map(data, ~lm(mpg~wt, data = .x))) %>% 
  arrange(cyl)
mtcars.m
mtcars.m$model

#회귀계수 추출하기
mtcars.m %>% 
  transmute(cyl, beta=map_dbl(model, ~coefficients(.)[[2]])) %>% 
  ungroup()
