#Chapter10
#10-1
library(RColorBrewer)
rows <- rep(1:4, each=7)
cols <- rep(7:1, times=4)
rows <- rows[1:(length(rows)-2)]
cols <- cols[1:(length(cols)-2)]             
plot(rows, cols, xlim = c(0.9,4.5), ylim=c(0.5,7.5),
     type='n', xaxt='n',yaxt='n', ann=FALSE)
points(rows, cols,pch=0:25, col=brewer.pal(7,'Dark2'),cex=5)
text(rows, cols, 0:25, pos=4, offset=2, cex=1.5)
title('Plotting Symbol(pch)')


#10-2
y <- seq(2,-3)
y
plot(0,0, xlim=c(-2,2), ylim=c(-2,2),
     type='n',xaxt='n',yaxt='n',ann=FALSE)
dev.off()
for (i in 1:6 ) abline(a=y[i], b=1, col=i, lty=i, lwd=2)
legend('topleft', inset=0.01, cex=1,
       legend = c('solid','dashed','dotted','dotdash','longdast','towdash'),
       col=c(1:6), lty=1:6, lwd=2)
title('Line Type(lty)',lwd=2)

#10-3
str(ToothGrowth)
boxplot(len~supp+dose, data=ToothGrowth,
        col=c('orange','yellow'), border='black',
        las=1, at=c(1,2,3.5,4.5,6,7),
        main='Tooth Grouwth of Guinea Pigs',
        xlab='Vitamin C (delivery method and dose)',
        ylab='Tooth Length',
        cex.lab=0.9, cex.axis=0.7)
legend(0.5,33,legend=c('Orange Juice','Ascorbic Acid'),
       fill = c('orange','yellow'))


#10-4
library(ggplot2)
str(economics)
plot(economics$date, economics$unemploy, type = 'o',cex=0.1,
     main='Unemployment Trend',col.main='tomato',
     xlab='Year',
     ylab='Number of Unemployed (thousands)',
     cex.lab=0.9, cex.axis=0.7)

lines(lowess(economics$date, economics$unemploy), lty=1, lwd=2, col='blue')
unemp.lm <- lm(unemploy~date, data=economics)
lines(x=economics$date, y=fitted(unemp.lm),lty=2, lwd=2, col='red')
legend('topleft', inset=0.05, title='Fitted Lines', legend=c('local','linear'),
       lty = c(1,2), lwd=2, col=c('blue','red'), bty = 'n', cex=0.9)




#10-5
library(ggplot2)
old.par <- par(mfrow=c(2,1))
plot(economics$date, economics$unemploy, type='l', lwd=2,
     main='Unemployment Trend',col.main='tomato',cex.lab=0.9, cex.axis=0.7,
     xlab='Year',ylab='Unemployed')
plot(economics$date, economics$pce, type='l', lwd=2,
     main='Expenditure Trend',col.main='darkgreen',cex.lab=0.9, cex.axis=0.7,
     xlab='Year',ylab='Expenditure')
par(old.par)



#10-6
str(VADeaths)
library(RColorBrewer)
barplot(VADeaths, beside=TRUE, ylim=c(0,100), las=1, cex.names=0.9,
        col = brewer.pal(5, 'Set2'),
        main='Death Rate by Population and Age Group',lwd=2,
        xlab='Population Group',
        ylab='Death Rates (per 1,000 population)')
legend(x=1,y=100, legend = rownames(VADeaths), horiz = TRUE,
       title='Ages', fill = brewer.pal(5,'Set2'))




#10-7
library(ggplot2)
str(diamonds)
hist(diamonds$price,breaks =30, col='cornflowerblue', border='pink',
     xlim=c(0,20000), ylim=c(0,14000), 
     main='Diamonds Price', xlab='Price(dollars)',ylab = 'Frequency')
rug(quantile(diamonds$price),col='red',lwd=3)



#10-8
library(car)
str(Salaries)
levels(Salaries$rank)
Salaries$color[Salaries$rank=='AsstProf'] <- 'chocolate'
Salaries$color[Salaries$rank=='AssocProf'] <- 'springgreen4'
Salaries$color[Salaries$rank=='Prof'] <- 'royalblue'
plot(Salaries$yrs.since.phd, Salaries$salary, pch=21, cex=1, yaxt='n', las=1,
     col='wheat', bg=Salaries$color, cex.axis=0.75, ylim=c(50000,250000),
     main='Salary vs. Years Since Ph.D by Rank', 
     xlab='Years Since Ph.D',ylab = 'Salary (dollars)',
     col.main='brown', col.lab='maroon')
axis(side=2, cex.axis=0.75, las=2, at=seq(50000,250000,50000),
     labels = c('50K','100K','150K','200K','250K')
     )
legend('topleft', inset=0.05,bty = 'n', pch=21, pt.cex = 1, cex = 0.7,
       legend = c('Assistant Prof','Associate Prof','Full Prof'),
       col='wheat', pt.bg = c('chocolate','springgreen4','royalblue'))



#10-9
library(ggplot2)
install.packages('hexbin')
library(hexbin)
plot(hexbin(diamonds$price, diamonds$carat, xbin=40), colramp=rainbow,
     main='Carat vs. Price of Diamonds',
     xlab='Price',ylab='Carat')




#10-10
str(chickwts)
library(RColorBrewer)
stripchart(chickwts$weight ~ chickwts$feed, method='jitter','jitter'=0.1,
            las=1, pch=19, col=brewer.pal(6,'Set2'), vertical=TRUE, 
           main='Chicken Weights by Feed Type',
           ylab='Weight (g)')
