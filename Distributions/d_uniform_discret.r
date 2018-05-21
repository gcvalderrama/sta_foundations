
install.packages("plotly")
library(plotly)


# experimento completamente al azar 

x <- seq(0, 1, length=100)
fd <- dunif(x)

plot_ly(x = x , y = fd, type = 'scatter', mode='lines', fill = 'tozeroy')



fp <- punif(x)
plot_ly(x = x , y = fp, type = 'scatter', mode='lines', fill = 'tozeroy')



#-------------------------------------------------
# uniform
# params specific minimum and maximum

# dunif for density plot
limits <- seq(0,10,by=0.01)
z <-dunif(x=limits,min=0,max=5)
names(z) <- limits
plot(x=limits, y=z,type="l",xlim=c(0,10))

#punif for cumulative density (= tail probabilities)
limits <- seq(0,10,by=0.01)
z <-punif(q=limits,min=0,max=5)
names(z) <- limits
plot(x=limits, y=z,type="l",xlim=c(0,10))

#qunif for quantiles
qunif(p=c(0.025,0.975),min=0,max=5)

#runif for random data
hist(runif(n=100,min=0,max=5))
hist(runif(n=1000,min=0,max=5))
#------------------------------------