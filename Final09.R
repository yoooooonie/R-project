#Chapter09 데이터 전처리
#9-1
x <- 5:10
x[c(1,2)] <- 2:3
x
x[-1]
x[-1] <- 1:5
x

#9-2
mtcars$weight[mtcars$wt > median(mtcars$wt)] <-'heavy'
mtcars$weight[mtcars$wt <= median(mtcars$wt)] <-'light'
head(mtcars)
tail(mtcars)


#9-3
mtcars[,order(colnames(mtcars))]


#9-4
#mtcars[mtcars$cyl=4,]
mtcars[mtcars$cyl==4,]
mtcars[-1:4,] #Incorrect
#mtcars[mtcars$cyl<=5]
mtcars[mtcars$cyl<=5,]
#mtcars[mtcars$cyl==4|6, ]
mtcars[mtcars$cyl==4|mtcars$cyl==6, ]
mtcars[mtcars$cyl %in% c(4,6), ]


#9-5
mtcars[1:15]
mtcars[1:15,]


#9-6 70%sample 샘플 추출
head(iris)
sample.index <- sample(1:nrow(iris), size=nrow(iris)*0.7)
iris[sample.index,]

library(dplyr)
slice_sample(iris, prop=0.7)



#9-7
names <- c('Gates','Jobs',"Bezos")
lapply(names, nchar)
sapply(names, nchar)


#9-8
lst1 <- list(A=matrix(1:12, nrow=3),B=matrix(1:12, nrow=2), C=1:12)
lst2 <- list(A=matrix(1:12, nrow=3),B=matrix(1:12, nrow=6), C=12:1)
identical(lst1, lst2)
mapply(identical, lst1, lst2)


#9-9
head(state.x77)
apply(state.x77, 2, mean)
apply(state.x77, 2, sd)


#9-10
install.packages('nycflights13')
library(nycflights13)
str(flights)
library(dplyr)

flights  %>% 
  group_by(dest) %>% 
  summarise(count=n(),
            dist=mean(distance, na.rm=TRUE),
            delay=mean(arr_delay, na.rm=TRUE)) %>% 
  filter(count>=50) %>% 
  slice_max(order_by = delay, n=10)



#9-11
library(nycflights13)
str(flights)
str(airlines)
str(airports)
library(dplyr)
#(a)
flights %>% 
  select(year:day, hour, origin, dest, tailnum, carrier) %>% 
  left_join(airlines, by='carrier')
#(b)
dest.popular <- flights %>% 
  count(dest, sort = TRUE) %>% 
  head(10)
dest.popular

flights %>% 
  semi_join(dest.popular, by='dest') %>% 
  left_join(airports, by=c('dest'='faa')) %>% 
  select(year:day, hour, origin, dest, name, tailnum, carrier)



#9-12
install.packages('gapminder')
library(gapminder)
str(gapminder)
str(country_codes)
library(dplyr)
#(a)
gapminder %>% 
  group_by(continent) %>% 
  summarise(cnt=n(), n.country=n_distinct(country))
#(b)
gapminder %>% 
  filter(year==2007) %>% 
  group_by(continent) %>% 
  summarise(lifeExp.med=median(lifeExp))
#(c)
gapminder %>% 
  filter(year==2007, country %in% c('France','Korea, Rep.','United States')) %>% 
  select('country','continent') %>% 
  left_join(country_codes, by='country')



#9-13
tbl1 <- tibble(name='Oliver',age=25)
tbl2 <- tibble(name=c('Oliver','Emma'), sex=c("Male",'Female'))
tbl3 <- tibble(name='Emma', grade='A')
lst <- list(age=tbl1, gender=tbl2, grade=tbl3)
lst
#(a)
library(purrr)
reduce(lst, full_join)

#(b)
accumulate(lst, full_join)


#9-14
library(dplyr)
tbl1 <- tibble(name=c('Mouse','Keyboard','USB'), price=c(30000,90000,50000))
tbl2 <- tibble(part=c('Mouse','Keyboard','Monitor'), quantity=c(20,30,10))
tbl3 <- tibble(product=c('Keyboard','USB','Webcam'),makein=c('Korea','USA','China'))
lst <- list(price=tbl1, quantity=tbl2, madein=tbl3)
lst
#(a)
library(purrr)
by <- list(c('name'='part'), c('name'='product'))
reduce2(lst, by, left_join)
#(b)
accumulate2(lst, by, left_join)



#9-15
library(dplyr)
library(purrr)
library(tidyr)
library(gapminder)
str(gapminder)
gapminder %>% group_by(continent) %>% 
  summarise(order_by(continent), 
            lifeExp.avg=mean(lifeExp))
#(a)
gapminder.nested <- gapminder %>% group_by(continent) %>% nest()
gapminder.nested

gapminder.nested %>%
  mutate(lifExp.avg=map_dbl(data, ~mean(.x$lifeExp))) %>% 
  ungroup()
#(b)
gapminder.nested %>% 
  mutate(model=map(data, ~lm(lifeExp~pop+gdpPercap+year, data=.x))) %>% 
  mutate(summary=map(model, summary)) %>% 
  mutate(R.squared=map_dbl(summary, 'r.squared')) %>% 
  ungroup()


#9-16

df16 <- data.frame(ID=c(1,1,2,2),
                   Type=c('T1','T2'),
                   X1=c(4,7,2,5),
                   X2=c(3,6,4,1))
df16
#(a)
library(reshape2)
df16.long <- melt(df16, id.vars = c('ID','Type'))
df16.long
#(b)
df16.wide1 <- dcast(df16.long, ID + Type ~ variable)
df16.wide1
df16.wide2 <- dcast(df16.long, ID + variable ~ Type)
df16.wide2
df16.wide3 <- dcast(df16.long, ID ~ variable + Type)
df16.wide3
#(c)
df16.c1 <- dcast(df16.long, ID~variable , mean)
df16.c1
df16.c2 <- dcast(df16.long, Type~variable , mean)
df16.c2
df16.c3 <- dcast(df16.long, ID ~ Type , mean)
df16.c3


#9-17
library(reshape2)
str(ChickWeight)
#(a)
df17 <- melt(ChickWeight, id.vars = c('Time','Chick','Diet'))
#df17 <- melt(ChickWeight, id.vars = 2:4)
df17
#(b)
#사육기간(Time)
dcast(df17, Time ~ variable, mean)
#사료 종류(Diet)
dcast(df17, Diet ~ variable, mean)
#사료 종류(Diet)와 사육 기간(Time)
dcast(df17, Diet+Time ~ variable, mean)


#9-18
library(tidyr)
str(relig_income)
gather(relig_income, 'income','count',!religion)
gather(relig_income, 'income','count',-religion)
pivot_longer(relig_income, !religion, names_to = 'income',values_to = 'count')


#9-19
library(tidyr)
str(table4b)
str(table2)
#(a)
head(table4b)
pivot_longer(table4b, c('1999','2000'), names_to = 'year',values_to = 'population')
gather(table4b, 'year','population',-country)
gather(table4b, 'year','population',2:3)
gather(table4b, 'year','population',c(2,3))
#(b)
head(table2)
pivot_wider(table2, names_from = type, values_from = count)
spread(table2, type, count)
