

install.packages("plotly")
library(plotly)


# experimento completamente al azar 


x <- seq(1, 100, length=100)

fd <- dnbinom(x = x, size =20,  prob = 0.2)

plot_ly(x = x , y = fd, type = 'scatter', mode='lines', fill = 'tozeroy')



fp <- pgeom(x ,  prob = 0.5 )
plot_ly(x = x , y = fp, type = 'scatter', mode='lines', fill = 'tozeroy')


p1 =  3/7 # sea ninia exito
p2 = 4/7 # sea ninio fracaso

# x numero de ninios fracasos antes de 3 ninias 


dnbinom(2, size = 2,  prob = 3/7)

qnbinom(0.5, size = 3, prob = 3/7)

pnbinom(q = 3  , size = 2, prob = 3/7)



#https://gotellilab.github.io/Bio381/Lectures/Lecture12_13.html

#-------------------------------------------------
# negative binomial: number of failures (values of MyVec)
# in a series of (Bernouli) with p=probability of success 
# before a target number of successes (= size)
# generates a discrete distribution that is more 
# heterogeneous ("overdispersed") than Poisson
MyVec <- dnbinom(x=seq(0,40), size=5, prob=0.5)
names(MyVec) <- seq(0,40)
barplot(height=MyVec)

# geometric series is a special case where N= 1 success
# each bar is a constant fraction 1 - "prob" of the bar before it
MyVec <- dnbinom(x=seq(0,40), size=1, prob=0.1)
names(MyVec) <- seq(0,40)
barplot(height=MyVec)


# alternatively specify mean = mu of distribution and size, 
# the dispersion parameter (small is more dispersed)

MyVec <- dnbinom(x=seq(0,40),size=1,mu=5)
names(MyVec) <- seq(0,40)
barplot(height=MyVec)


# also have the "pnbinom", "qnbinom" and "rnbinom" functions
# Probability of drawing a 3 or smaller from a negative binomial:
pnbinom(q=3,size=1,mu=5)

# 5 percent lower value for a negative binomial
qnbinom(p=0.05,size=10,mu=5)

# 95% confidence interval for a geometric series
qnbinom(p=c(0.025,0.975),prob=0.5,size=10)

# random sample from a negative binomial

MyVec <- rnbinom(n=1000,size=1,mu=20)
quantile(MyVec,prob=c(0.025,0.975))

# compare to exact calculation
qnbinom(p=c(0.025,0.975),size=1,mu=20)



