#Week7 텍스트
x <- "We have a dream"
x
nchar(x)#문자의 개수
length(x)#원소의 개수

y <- c("We","have","a","dream")
y
nchar(y)
length(y)
nchar(y[4])

letters
#텍스트 내림차순
sort(letters, decreasing = TRUE)

#대문자로 변경 or 소문자로 변경
fox.says <- "It's only with the HEART that one can See Rightly"
tolower(fox.says)
toupper(fox.says)
#일반적으로 소문자로 바꿔서 많이 사용함

#텍스트 분할
fox.said <- "what is essential is invisible to the eye"
#구분자를 지정하여 문자열 분할 리스트 형식으로 출력함
strsplit(fox.said, split =" ")
strsplit(fox.said, split ="")#알파벳 단위로 나눌 수도 있음 공백도 문자열이 됨

#리스트 아닌 형태로 출력하고 싶으면 벡터형식으로 출력됨
fox.said.words <- unlist(strsplit(fox.said, split = " "))
fox.said.words

fox.said.words[3]
unlist(strsplit(fox.said, split = " "))[[3]]
strsplit(fox.said, split = " ")[[1]][3]


p1 <- "You come at four in the afternoon, then at three I shall begin to be happy"
p2 <- "One runs the risk of weeping a little, if one lets himeself be tamed"
p3 <- "What makes the desert beautiful is that somewhere it hides a well"
littleprince <- c(p1, p2, p3)
littleprince

strsplit(littleprince, split = " ")
strsplit(littleprince, split = " ")[[3]][5]

#중복제거를 하고 싶다
fox.said <- "what Is Essential is invisible to the eye"
fox.said.words <- strsplit(fox.said, split =" ")[[1]]
fox.said.words
#Is와 is가 다른 단어로 인식됨
unique(fox.said.words)
unique(tolower(fox.said.words))


#인수들에 주어진 단어들을 결합해서 새로운 인수 생성
paste("Everybody","wants","to","fly")

paste(c("Everybody","wants","to","fly"), "Everybody","wants","to","fly")

fox.said.words
paste(fox.said.words)

#공백 이외의 다른 구분자로 결합하고 싶을 때
paste("Everybody","wants","to","fly", sep="-")
paste("Everybody","wants","to","fly", sep="")
paste0("Everybody","wants","to","fly")

#숫자여도 문자로 변환하여 처리해줌
paste(pi, sqrt(pi))
paste("25 dgree Celsius is", 25*1.8+32, "dgree Fahrenheit")

#텍스트의 paste 함수 벡터 연산처럼 됨
heroes <- c("Batman", "Captain America","Hulk")
colors <- c("Black","Blue","Green")
paste(heroes, colors,sep="*")

paste("Type",1:5)
paste(1:5,"Type")
paste(heroes, "Wants","to","fly")
paste("Wants",heroes, "to","fly")
paste("Wants","to","fly",heroes)

paste(c("Everybody","Wants","to","fly"), collapse = " ")
paste(heroes, "Wants","to","fly")
paste(heroes, "Wants","to","fly", collapse = ", and")

paste(heroes, "Wants","to","fly", sep="-")
paste(heroes, "Wants","to","fly", sep="-", collapse = ";")

paste(month.abb, 1:12)
paste(month.abb, 1:12, sep="_")
paste(month.abb, 1:12, sep="_", collapse ="-" )#상위수준에서 재결함

unlist(strsplit(paste(month.abb, 1:12, sep="_", collapse ="-" ), split = "-"))[12]


#outer() 모든 인자의 곱을 행렬 형식으로 구해줌
outer(c(1,2,3),c(1,2,3))
#옵션을 설정하면 다른 연산도 가능
asian.countries <- c("Korea","China","Japan")
info <- c("GDP","Population","Area")
outer(asian.countries, info, FUN=paste, sep="-")
#행렬을 벡터로 바꿀 수 있다
out <- outer(asian.countries, info, FUN=paste, sep="-")
as.vector(out)

x <- outer(asian.countries, asian.countries, FUN=paste, sep="-")
x
x[!lower.tri(x)] #아래 삼각형(lower.tri)의 반대(!)


customer <- "Jobs"
buysize <- 10
deliveryday <- 3
paste("Hello,", customer, "your order of",buysize, 
      "product(s) will be delivered within",deliveryday, "day(s).")

#프린트 좀 편하게 사용할 수 있는 함수
sprintf("Hello, %s your order of %s product(s) will be delivered within %s day(s).", 
        customer, buysize, deliveryday)

#고객이 여러명일 때
customer1 <- c("Jobs", "Gates","Bezos")
buysize1 <- c(10,7,12)
deliveryday1 <- c(3,2,7.5)
sprintf("Hello, %s your order of %s product(s) will be delivered within %s day(s).", 
        customer1, buysize1, deliveryday1)

?sprintf
sprintf("Hello, %s your order of %s product(s) will be delivered within %.1f day(s).", 
        customer1, buysize1, deliveryday1)


#문자열의 부분집합을 출력 substr()
substr("yangyoonmi", 2, 5)
substr("Data Analytics", start=1, stop=4)
substr("Data Analytics", start=6, stop=14)
substr("Data Analytics", start=6, stop=20)

#숫자부터 끝까지 출력 substring()
substring("Data Analytics", 6)

#벡터 연산 가능하다
class <- c("Data Analytics", "Data Mining","Data Visulization")
substr(class, 1, 4)
substring(class, 6)

substr(class, c(2:4), c(12,14))
substr(class, c(2:4), 12)
substr(class, c(2:4), 14)

countries <- c("Korea, KR","Inites States, US","China, CN")
substr(countries, nchar(countries)-1, nchar(countries))

#특정 문자열 포함한 텍스트 찾기 grep()
head(islands)
landmasses <- names(islands)
landmasses

grep(pattern = "New", x=landmasses)
landmasses[grep(pattern = "New", x=landmasses)]

grep(pattern = "New", x=landmasses, value = TRUE)

#두 개의 단어로 이루어진 나라 찾기
landmasses[grep(pattern = " ", landmasses)]
grep(pattern = " ", landmasses, value = TRUE)


#문자열을 새로운 문자열로 대체
txt <- "Data Analytics is useful. Data Analytics is also interesting."
#일치하는 처음 문자만 바꿔줌
sub(pattern = "Data", replacement = "Business", x=txt)
#일치하는 모든 문자를 바꿔줌
gsub(pattern = "Data", replacement = "Business", x=txt)

x <- c("product.csv", "customer.csv","supplier.csv")
gsub(pattern = ".csv", replacement = "", x=x)


#정규표현식
words <- c("at","bat","cat","chaenomeles","chase","chasse","cheap","check","cheese","chick","hat")
grep(pattern = "che", words, value = TRUE)
grep(pattern = "at", words, value = TRUE)

#대괄호 안에 있는 내용을 포함된 것을 출력 각각 포함되어 있는 것들
grep("[ch]", words, value = TRUE)
grep("[at]", words, value = TRUE)

#ch|at ch또는 at 를 포함한 것 출력
grep("ch|at", words, value = TRUE)
#다양한 활용
grep("ch(e|i)ck", words, value = TRUE)

#      ?(0또는 1인가? 없어도 되고 1번 있어도 되고 
#      ) * +  정규표현식 활용 봅시다
grep("chas?e", words, value = TRUE) # ?(0또는 1인가? 없어도 되고 1번 있어도 되고 
grep("chas*e", words, value = TRUE)# *(0또는 1이상인가? 없어도 되고 1번이상 있어도 되고 
grep("chas+e", words, value = TRUE)# + (1이상인가? )

grep("ch(a*|e*)se", words, value = TRUE)

#  ^: 문자열의 시작  $ :문자열의 끝
grep("^c", words, value = TRUE)
grep("t$", words, value = TRUE)

grep("^c.*t$", words, value = TRUE) #  .은 어떠한 문자도 가능 *은 0또는 1회 이상 출현
grep("^[hc]?at", words, value = TRUE) # h 또는 c로 시작,  ?: 앞에 나오는 것이 0 or over 1

words2 <- c("12 Dec","OK","http://", "<TITLE>Time?</TITLE>","12345","Hi there")
grep("[[:alnum:]]", words2, value=TRUE) #알파벳과 숫자의 조합
grep("[[:alpha:]]", words2, value=TRUE) #알파벳문자
grep("[[:digit:]]", words2, value=TRUE) #숫자가 포함된 것
grep("[[:punct:]]", words2, value=TRUE) #문장부호가 포함된 것
grep("[[:space:]]", words2, value=TRUE) #space가 포함된 것

# \w : 단어
# \d : 숫자
# \s : space
grep("\\w", words2, value=TRUE) #단어 문자가 포함된 것
grep("\\w+", words2, value=TRUE) #단어 문자가 1개 이상 포함된 것
grep("\\d+", words2, value=TRUE) #숫자가 1개 이상 포함된 것
grep("\\s+", words2, value=TRUE) #공백이 1개 이상 포함된 것

?regex  #Regular Expressions as used in R





#정규표현식 패턴검출 패턴위치 패턴추출 패턴치환 패턴분할
string <- c("data analytics is useful", "business analytics is helpful","visualization of data is interesting for data scientists")
string

grep(pattern = "data", x=string)
grep(pattern = "data", x=string, value = TRUE)

string[grep(pattern = "data", x=string)]

grep("useful|helpful", string, value = TRUE)
grep("useful|helpful", string, value = TRUE, invert=TRUE) #반대의 결과를 출력력

#패턴이 존재하면 TRUE, 없으면 FALSE
grepl(pattern = "data", x=string)
string[grepl(pattern = "data", x=string)]

state.name
grepl("New", state.name, ignore.case = TRUE) #대소문자 구분없이 옵션
state.name[grepl("New", state.name, ignore.case = TRUE)]
sum(grepl("New", state.name, ignore.case = TRUE))

#매칭된 시작위치, 길이 
regexpr(pattern = "data", text=string)
gregexpr(pattern = "data", text=string)#모든 매칭 결과

#패턴추출
regmatches(x=string, m=regexpr("data", string))
regmatches(x=string, m=gregexpr("data", string))
#패턴 이외 다른 것들 추출
regmatches(x=string, m=gregexpr("data", string), invert = TRUE)


#대체 replace
sub(pattern = "data", replacement = "text", x=string)
gsub(pattern = "data", replacement = "text", x=string)

#분할
strsplit(x=string, split = " ")
unlist(strsplit(x=string, split = " "))

unique(unlist(strsplit(x=string, split = " ")))



#정규표현식 stringr패키지  tidyverse
#install.packages("stringr")
library(stringr)

string <- c("data analytics is useful", 
            "business analytics is helpful",
            "visualization of data is interesting for data scientists")

str_detect(string = string, pattern = "data")
#패턴이 존재하면 TRUE, 없으면 FALSE
grepl(pattern = "data", x=string)

str_detect(string, "DATA") #대소문자 구별한다다
str_detect(string, fixed("DATA", ignore_case = TRUE)) #대소문자 구별안하고 싶으면

#3개의 원소중에서 a.z 를 찾고 싶은데... 아래처럼 하면 안됨됨
str_detect(c("abz", "ayz", "a.z"), "a.z") 
#. 이 정규표현식에서 전부를 의미함 진짜로 .을 원하면, fixed로 감싸줌
str_detect(c("abz", "ayz", "a.z"), fixed("a.z")) 
str_detect(c("abz", "ayz", "a.z"), "a\\.z") #\\ 사용해도 됨

#위치 첫 매칭이 일어난 시작과 끝 위치 regexpr()비슷함 
str_locate(string, "data")
#위치 모든 매칭이 일어난 시작과 끝 위치 리스트 형태 gregexpr() 비슷함
str_locate_all(string, "data")


#매칭 문자열 추출
str_extract(string, "data")
str_extract_all(string, "data") #리스트 형식
str_extract_all(string, "data", simplify = TRUE) #행렬 형식으로 출력하고 싶으면 옵션 준다

unlist(str_extract_all(string, "data"))

#str_match()
#str_match_all()
sentences5 <- sentences[1:5]
sentences5

#'관사 단어' 사용된 추출
str_extract(sentences5, "(a|A|the|The) (\\w+)")
str_match(sentences5, "(a|A|the|The) (\\w+)")
str_match_all(sentences5, "(a|A|the|The) (\\w+)")

#치환
string
str_replace(string, "data", replacement = "text")
str_replace_all(string, "data", replacement = "text")
#sub()
#gsub()

#분할
str_split(string, " ")
unlist(str_split(string, " "))
unique(unlist(str_split(string, " ")))
#split()

str_split(string, " ")
str_split(string, " ", n=3) #n은 분할 개수
str_split(string, " ", n=3, simplify = TRUE) #simplify=TRUE 행렬로 출력

#공백포함 길이
str_length(string)

#특정문자 출현 횟수
str_count(string, "data")
str_count(string, "\\w+") #단어개수

#padding
str_pad(string=c("a","abc","abcde"), width = 6, side = "left", pad = " ")
str_pad(string=c("a","abc","abcde"), width = 10, side = "right", pad = "*")

mon <- 1:12
mon
str_pad(mon, width = 2, side = "left", pad = "0")

#양쪽에 공백을 삭제
str_trim()

string <- c("data analytics is useful", 
            "business analytics is helpful",
            "visualization of data is interesting for data scientists")

str_pad1 <- str_pad(string, width = max(str_length(string)), side = "both", pad = " ")
str_pad1

str_trim(str_pad1, side = "both")

#base패키지의 paste()
#text결합
str_c("data", "mining",sep=" ")

#붙이는 벡터의 원소 수가 다를 때 재사용 규칙을 따른다
str.mining <- str_c(c("data mining", "text mining"),
                    "is useful", sep=" ")
str.mining

str_c(str.mining, collapse = ";")
str_c(str.mining, collapse = "\n")
cat(str_c(str.mining, collapse = "\n"))

#문자열 일부 추출
str_sub(string=str.mining, start=1, end = 4)
#문자열 일부 대체,치환
str_sub(str.mining, 5,5) <- "-"
str.mining

#start, end위치에 -숫자 넣으면 문자 끝부터 
str_sub("abcdefg", -2)
str_sub("abcdefg", end=-3)
