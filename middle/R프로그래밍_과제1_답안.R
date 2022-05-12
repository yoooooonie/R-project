
# 1
test1 <- c(9,4,7,9,10)
test2 <- c(10,5,8,7,9)
test3 <- c(8,3,6,9,10)

pmin(test1, test2, test3)

# 2
days <- factor(c("Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"))
days
count <- c(101, 55, 40, 65, 23, 112, 135)

library(forcats)
fct_relevel(grade, "Sun")

fct_reorder(days, count, .desc=TRUE)

# 3
mtx <- matrix(1:20000, 2000, 1000)
mtx[999, 5]
