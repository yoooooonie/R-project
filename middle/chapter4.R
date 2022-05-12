#NO.1
length(list(list(alpha=pi, beta=sqrt(pi)), gamma=letters, delta=NULL))
length(list(alpha=pi, beta=sqrt(pi),gamma=letters, delta=NULL))

#No.2
prob.list<- list(c(3,5,7), c("A", "B","C"))
prob.list[[2]][1] <- "Alpha"
prob.list

#No.3
score <- list(math=list(95,90), writing=list(90,85), reading=list(85,80))
score
mean(unlist(score))

#No.4
no4 <- list(alpha=0:4, beta=sqrt(1:5), gamma=log(1:5))
no4$alpha <- no4$alpha+1
no4
 
#No.5
no5 <- list(L=letters[1:5],M=month.name[1:5])
no5[[2]][-c(3)]

#No.6
lst <- list(month.name, month.abb)
lst

#(a)
names(lst) <- c("mon.name","mon.abb")
lst
#(b)
length(lst$mon.name)+length(lst$mon.abb)
#(c)
lst$mon.num <- c(1:12)
lst

#No.7
lst1 <- list("X","Y","Z","x","y","z")
lst2 <- list("x","y","z")

?setdiff
setdiff(lst1, lst2)

#No.8
lst <- list(a=1, b=2)
pi
newlist <- c(list(a=1, b=2), pi)
newlist
newlist[[3]]

#No.9
lst <- list(first=1, second=2, third=list(third.one=3.1, third.two=3.2))
lst[1:2]
lst[-3]
lst[c("first","second")]
lst[c(TRUE, TRUE, FALSE)]
lst[1,2]
lst[c(1,2)]

lst$second
lst$s
lst[[2]]
lst[["second"]]
lst[["s"]]

lst[["third"]][["third.one"]]
lst[[c("third", "third.one")]]
lst[["third"]]$third.one
lst[[3]][[1]]
lst[[3]]["third.one"]
lst[[3]][["third.one"]]

#No.10
lst10 <- list("Apple",NULL, "Orange")
lst10
lst10[2] <- NULL
lst10[2]

#No.11
lst11 <- list(-2.4,0.4,5.7,12.5,17.8,22.2,24.9,25.7,21.2,14.8,7.2,0.4)
names(lst11) <- month.abb
lst11
#(a)
lst11[lst11<0]

#(b)
lst11[lst11<mean(unlist(lst11))]

#(c)
lst11[lst11<mean(unlist(lst11))] <- NULL
lst11
