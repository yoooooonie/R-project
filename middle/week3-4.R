
#범주형데이터를 처리할 때
#
review <- c("GOOD","GOOD","Indifferent","Bad","GOOD","Bad")
review
review.factor <- factor(review)
review.factor      #레벨이 추출됨 

str(review.factor)

# Factor w/ 3 levels "Bad","GOOD","Indifferent": 2 2 3 1 2 1
# 알파벳 순서대로 Bad :1 GOOD:2 Indifferent:3 으로 매칭되어 숫자가 할당됨
#R은 내부적으로 팩터를 숫자로 저장함
as.numeric(review.factor)
# > as.numeric(review.factor)    숫자로 저장됨이 확인
# [1] 2 2 3 1 2 1       


eventday <- c("M","M","T","W","M","W","Th","F","T")
eventday.factor <- factor(eventday)
eventday.factor
#처음에 생성된 레벨 이외에는 나중에 데이터를 추가해도 레벨이 추가되지 않음
#그래서 레벨을 추가할 수 있음
eventday.factor <- factor(eventday,
                          levels = c("M","T","W","Th","F","S","Su"))
eventday.factor
#레벨의 순서를 지정할 수 있다. 미리 지정 안하면 알파벳 순서를 따름

levels(review.factor)
levels(review.factor) <- c("B","G","I") #레벵의 이름을 바꿀 수 있다
levels(review.factor)
review.factor

#레벨의 개수를 알고 싶을 때
nlevels(review.factor)
length(levels(review.factor))

#서열벡터 만들기
eval <- c("Medium","Low","High","Medium","High")
eval.factor <- factor(eval)
eval.factor

#서열벡터 만들기 순서를 만들어 줌 선언해줌
eval.ordered <- factor(eval, levels=c("Low", "Medium","High"), ordered = TRUE)
eval.ordered

#table을 이용해서 빈도를 확인
table(eval.factor)
table(eval.ordered)
#보여지는 순서가 달라짐을 확인 가능



#성별로 이루어진 데이터
sex <- c(2,1,2,2,1,0)

sex.factor <- factor(sex,levels=c(1,2), labels = c("Male", "Female"))
sex.factor

table(sex.factor)
table(sex)


#forcats 
c("Vegetables","Fruits","Vegetables","Grains","Fruits","Vegetables","Dairy","Fruits","Proteins","Fruits")
food <- factor(c("Vegetables","Fruits","Vegetables","Grains","Fruits","Vegetables","Dairy","Fruits","Proteins","Fruits"))
food

install.packages("forcats")
library(forcats)
fct_inorder(food)
fct_infreq(food)

fct_relevel(food,
            "Fruits","Vegetables","Grains","Proteins","Dairy" )
#한가지 레벨만 순서 지정할 수도 있음
fct_relevel(food, "Proteins","Dairy")
fct_relevel(food, "Proteins",after = 3)#Proteins가 3번째로 갈 수 있음
fct_relevel(food, "Proteins",after = Inf)#Proteins가 젤 마지막으으로 갈 수 있음



value <- c(1000,1500,1200,700,2000,2000,1350,2500,15000,3000)
value
food
fct_reorder(food, .x=value) #leves가 오름차순으로 정렬됨
#vegetables가 3개 있는데, 3개 값의 중위값인 2000원이 대표값, 요약값으로 오름차순 정렬됨  leves가
fct_reorder(food, .x=value, .fun = mean) #다른값, 평균으로 대표값이 됨
fct_reorder(food, .x=value, .desc = TRUE) #내림차순으로 정렬됨 leves가

fct_recode(food, Fats="Proteins", Fats="Dairy")#레벨명을 바꿀 수 있음 Proteins, Dairy -> Fats
