# Plot eigenvalues and percentages of variation of an ordination object
# Kaiser rule and broken stick model
# Usage:
# evplot(ev)
# where ev is a vector of eigenvalues

# License: GPL-2 
# Author: Francois Gillet, 25 August 2012

evplot <- function(ev)
{
	# Broken stick model (MacArthur 1957)
	n <- length(ev)
	bsm <- data.frame(j=seq(1:n), p=0)
	bsm$p[1] <- 1/n
	for (i in 2:n) bsm$p[i] <- bsm$p[i-1] + (1/(n + 1 - i))
	bsm$p <- 100*bsm$p/n
	# Plot eigenvalues and % of variation for each axis
	op <- par(mfrow=c(2,1))
	barplot(ev, main="特征根", col="bisque", las=2)
	abline(h=mean(ev), col="red")
	legend("topright", "平均特征根", lwd=1, col=2, bty="n")
	barplot(t(cbind(100*ev/sum(ev), bsm$p[n:1])), beside=TRUE, 
		main="% 变差", col=c("bisque",2), las=2)
	legend("topright", c("% 特征根", "断棍模型"), 
		pch=15, col=c("bisque",2), bty="n")
	par(op)
}