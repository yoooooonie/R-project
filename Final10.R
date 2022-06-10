#Chapter10
#10-1
library(RColorBrewer)
rows <- rep(1:4, each=7)
cols <- rep(7:1, times=4)
rows <- rows[1:(length(rows)-2)]
cols <- cols[1:(length(cols)-2)]             
plot(rows, cols, xlim = c(0.9,4.5), ylim=c(0.5,7.5),
     type='n', xaxt='n',yaxt='n', ann=FALSE)
points(rows, cols,pch=0:25, col=brewer.pal(7,'Dark2'),cex=2)
text(rows, cols, 0:25, pos=4, offset=2, cex=1.5)
title('Plotting Symbol(pch)')
