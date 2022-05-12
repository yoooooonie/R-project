#No.3-1
mtx <- matrix(1:12, 3,4)
mtx
dimnames(mtx) <- list(letters[1:3], letters[1:4])
mtx

#No.3-2
mtx[,c(1,3)]
mtx[,c(2,4)]
mtx.c <- cbind(mtx[,c(1,3)],mtx[,c(2,4)])
mtx.c

#No.3-3
3*mtx
mtx+3
mtx+mtx.c
mtx-mtx.c
mtx*mtx.c
mtx/mtx.c
mtx %*% mtx.c

#No.3-4
matrix(1:4, nrow=2)^(1:4)

#No.3-5
mtx3 <- cbind(x=c(1:10), x2=2*c(1:10),x3=3*c(1:10),x4=4*c(1:10),x5=5*c(1:10))
mtx3
row.names(mtx3) <- letters[1:10]
mtx3
sum(mtx3["h",])

#No.3-6
mtx6 <- matrix(1:9999, ncol = 9)
mtx6[c(1109:1111),c(8,9)]
tail(mtx6)
#mtx6[-3:,-2:]
#´ä
dim(mtx6)
mtx6[(dim(mtx6)[1]-2):dim(mtx6)[1], (dim(mtx6)[2]-1):dim(mtx6)[2]]

#No.3-7
x <- c(1:3)
y <- x^2
z <- letters[1:3]

mtx7 <- cbind(x,y,z)
mtx7


#No.3-8
mtx8 <- matrix(1:12, nrow=3,ncol=4)
mtx8
t(t(mtx8))
mtx8 %*% matrix(1,ncol(mtx8))
mtx8 %*% diag(ncol(mtx8))

#No.3-9
head(matrix(1:10000, 1000) )
matrix(1:10000, 1000)[777,3]

#No.3-10
#(a)
mtx10 <- matrix(c(0.43,0.04,0.01,0.49,0.72,0.52,0.08,0.24,0.47), nrow=3, ncol=3)
row.names(mtx10) <- c("lower","middle","upper")
colnames(mtx10) <- c("lower","middle","upper")
mtx10

#(b)
rowSums(mtx10)

#(c)
mtx10.2 <- mtx10 %*% mtx10
mtx10.2[,"upper"]
