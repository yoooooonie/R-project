
# 1
score <- c(100, 95, 45, 77, 60, 30, 85, 49)
pmax(score, 50)

# 2
cha <- letters[c(1:10)]
cha
cha[seq_along(cha) %% 3 == 0] <- "ZZZ"
cha

# 3
x <- c("A", "B", "C") 
x
paste("Type", rep(x, times=c(1, 2, 3)))

# 4
mtx <- matrix(month.abb, 3, 4)
mtx
mtx[,2,drop=FALSE]

# 5
x <- 1:12
mtx <- matrix(x, 3, 4)
mtx
mtx[2,] <- c(200)
mtx

# 6
lst <- list(month.abb=month.abb, month.name=month.name)
lst
lst[[1]][9] <- "September"
lst

# 7
x <- 1:3
y <- 4:6
z <- 7:9
library(tibble)
tbl <- tibble(data=list(tibble(x, y), tibble(y, z), tibble(z, x)))
tbl
tbl$data

# 8
str(USArrests)
USArrests[USArrests$UrbanPop > mean(USArrests$UrbanPop), c("Murder", "UrbanPop")]

# 9
fruits <- c("Apple", "Banana", "Orange")
amount <- c(10, 20, 30)
sprintf("%s %s boxes", fruits, amount)

# 10
library(stringr)
sent3 <- sentences[1:3]
sent3

gsub(pattern="The|the", replacement="THE", x=sent3)
str_replace_all(string=sent3, pattern="The|the", replacement="THE")
