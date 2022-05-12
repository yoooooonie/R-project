#No.6-1
txt1 <- c("Happy","Birthday","to","You")
length(txt1)
nchar(txt1)
sum(nchar(txt1))+length(txt1)

#No.6-2
txt2 <- paste(txt1, collapse = " ")
length(txt2)
nchar(txt2)


#No.6-3
LETTERS
paste(LETTERS[1:10], 1:10, sep=" ")
paste(LETTERS[1:10], 1:10, sep="")

#No.6-4
paste(c("red","blue"),"pen")
paste(c("red","blue"),"pen",sep="-")
paste(c("red","blue"),"pen",collapse = "; ")
paste(c("red","blue"),"pen",sep="-", collapse = "; ")

#No.6-5
txt5 <- "Good Morning"
txt5.s <- strsplit(txt5, split = " ")
txt5.s
list(txt5.s[[1]][1],txt5.s[[1]][2])


#No.6-6
txt6 <- c("Yesterday is history, tomorrow is a mystery, today is a gift!",
  "That's why we call it the present -from Kung Fu Panda")
strsplit(txt6, split = ",? -? ?")
strsplit(txt6, split = ",? -?")






#No.6-7
c1 <- c(1,2,3,4,5,6)
outer(c1, c1,FUN=paste)


#No.6-8
ssn <- c("941215-1234567","850605-2345678","760830-1357913")
substring(ssn,  8) <- "*******"
ssn
#답
paste(substr(ssn, 1, 7),"*******",sep="")

#No.6-9
data("USArrests")
str(USArrests)

index <- grep("New", row.names(USArrests))
index
USArrests[index,]
colMeans(USArrests[index,])

#No.6-10
txt6 <- c("a","ab","acb","accb","acccb","accccb")
grep("ac?b",txt6,value = TRUE) #없거나 1개
grep("ac*b",txt6,value = TRUE) #있어도 되고 없어도 되고
grep("ac+b",txt6,value = TRUE) # 1개이상

#No.6-14
#install.packages("stringr")
library(stringr)
search()
data(sentences)

str14 <- sentences[1:3]
str14 <- str_replace_all(str14, "The", replacement = "THE")
str14 <- str_replace_all(str14, "the", replacement = "THE")
str14
#답
str_replace_all(str14, fixed("the", ignore_case = TRUE), "THE")
