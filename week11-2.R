head(airquality)

#install.packages("dplyr")
library(dplyr)
?dplyr
air <- filter(airquality, Month==6)
head(air)

airquality[airquality$Month==6,]
subset(airquality, subset = (Month==6))

air <- filter(airquality, Month==6, Temp>90)
air <- filter(airquality, Month==6 & Temp>90)
head(air)

air <- filter(airquality, Ozone>80 | Temp>90)
head(air)

#원하는 행 추출
slice(airquality, 6:10)
#n():dataframe의 행번호 
slice(airquality, (n()-4):n())

#여러 열을 지정가능 순서대로 arrange됨, 오름차순
arrange(airquality, Temp, Month, Day)
arrange(airquality, desc(Temp), Month, Day)
?arrange
airquality[order(airquality$Temp,airquality$Month,airquality$Day),]
with(airquality, airquality[order(Temp,Month,Day),])


#원하는 열을 원하는 순서대로 선택
air <- select(airquality, Month, Day, Temp)
head(air)
air <- select(airquality, Temp:Day)
head(air)
#원하지 않는 열 빼기
air <- select(airquality, -(Temp:Day))
head(air)
#선택하면서 열이름 바꿀수도 있음
air <- select(airquality, Solar=Solar.R)
head(air)
#이름만 변경하려면 rename()을 써서 특정 열의 이름 변경
air <- rename(airquality, Solar=Solar.R)
head(air)

#중복되지 않는 값 출력
distinct(select(airquality, Month))
unique(airquality$Month)

#새로운 열을 추가할 때 사용
air <- mutate(airquality,
             Temp.c=(Temp-32)/1.8,
             Diff=Temp.c-mean(Temp.c))
head(air)

#base package 포함된 transform()
#함수 내에서 바로 생성된 인자는 바로 사용하지 못함
transform(airquality,
          Temp.c=(Temp-32)/1.8,
          Diff=Temp.c-mean(Temp.c))
air <- transform(airquality,
          Temp.c=(Temp-32)/1.8)
head(air)

#요약통계
summarise(airquality, 
          Mean=mean(Temp, na.rm = TRUE),
          Median=median(Temp, na.rm = TRUE),
          SD=sd(Temp, na.rm = TRUE),#표준편차
          Max=max(Temp, na.rm = TRUE),
          Min=min(Temp, na.rm = TRUE),
          N=n(),#열의 개수
          Distinct.Month=n_distinct(Month),#고유한 값의 개수
          Distinct.First=first(Month),#첫번째 값
          Distinct.Last=last(Month)
          )

#무작위 추출, 지정된 개수, 지정된 비율로, 비복원 추출이 기본
sample_n(airquality, 5)
sample_frac(airquality, 0.05)
sample_frac(airquality, 0.05, replace = TRUE) #복원추출
set.seed(1)#시드 지정하면 할때 마다 같은 값 나옴

#
air.group <- group_by(airquality, Month)
class(air.group)
air.group


summarise(air.group,
          Mean.Temp=mean(Temp, na.rm=TRUE))
summarise(air.group,
          Mean.Temp=mean(Temp, na.rm=TRUE),
          sd.Temp=sd(Temp, na.rm = TRUE),
          Days=n())

#pipe operator %>%
#결과를 다음에 첫 인자로 전달 가능
iris %>% head
head(iris)

1:10 %>% mean
mean(1:10)


#배운거 쭉 순서대로 진행함
a1 <- select(airquality, Ozone, Temp, Month)
head(a1)
a2 <- group_by(a1, Month)
head(a2)
a2
a3 <- summarise(a2,
                Mean.ozone=mean(Ozone,na.rm=TRUE),
                Mean.Temp=mean(Temp, na.rm=TRUE))
a3
a4 <- filter(a3, Mean.ozone>40 | Mean.Temp>80)
a4

#pipe operator 사용해서 똑같이 해보기
air <- airquality %>%
  select( Ozone, Temp, Month) %>%
  group_by(Month) %>%
  summarise(Mean.ozone=mean(Ozone,na.rm=TRUE),
            Mean.Temp=mean(Temp, na.rm=TRUE)) %>%
  filter(Mean.ozone>40 | Mean.Temp>80)
air


#조인
df1 <- data.frame(x=1:6, y=month.name[1:6])
df2 <- data.frame(x=7:12, y=month.name[7:12])
df1
df2
#base package의 rbind와 같음
df3 <- bind_rows(df1, df2)
df3

df4 <- data.frame(z=month.abb)
df4
#열의 방향으로 결합, #base package의 cbind와 같음
df5 <- bind_cols(df3, df4)
df5
cbind(df3,df4)

#inner join 공통열을 포함하는 데이터셋이 생성됨 교집합
band_members
band_instruments
#by 인수를 지정안하면 모든 열을 조인함
inner_join(band_members, band_instruments)
#by 인수를 지정
inner_join(band_members, band_instruments, by="name")

#outer join 한쪽 데이터셋에만 있어도 포함 합집합
left_join(band_members, band_instruments, by="name")#왼쪽 데이터셋 기준
right_join(band_members, band_instruments, by="name")#오른쪽 데이터셋 기준
full_join(band_members, band_instruments, by="name")#왼쪽,오른쪽 둘 모두 데이터셋 기준
#보통 left join을 처음에 고려함

band_instruments2
#행이름 다른경우 지정
full_join(band_members, band_instruments2, by=c("name"="artist"))
#행이름 유지하려면 
full_join(band_members, band_instruments2, by=c("name"="artist"),keep=TRUE)

#공통열이 일치하는 경우 추출
semi_join(band_members, band_instruments, by="name")
#공통열이 일치하지 않는 경우 추출
anti_join(band_members, band_instruments, by="name")



















