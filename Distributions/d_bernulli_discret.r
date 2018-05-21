#http://www.r-tutor.com/elementary-statistics/probability-distributions/binomial-distribution

install.packages("plotly")
library(plotly)


# experimento completamente al azar 


x <- seq(1, 100, length=100)

fd <- dbinom(x = x, size = 100, prob = 0.5)

plot_ly(x = x , y = fd, type = 'scatter', mode='lines', fill = 'tozeroy')



fp <- pbinom(x , size = 100, prob = 0.5 )
plot_ly(x = x , y = fp, type = 'scatter', mode='lines', fill = 'tozeroy')



# probabilidad  0.07 de 5 obtener por lo menos 1,  P(x >= 1)  = 1 - P(x = 0)
1 - dbinom(0, size = 5, prob = 0.07)

#-------------------------------------------------
# Binomial distribution
# p = probability of a dichotomous outcome
# size = number of trials
# x = possible outcomes

# use "d" binom for density function
MyVec <- dbinom(x=seq(0,10),size=10,prob=0.5)
names(MyVec) <- seq(0,10)
barplot(height=MyVec)

MyVec <- dbinom(x=seq(0,10),size=10,prob=0.95)
names(MyVec) <- seq(0,10)
barplot(height=MyVec)

# use "p" binom for cumulative distribution

# what is probability of getting 5 heads out of 10 tosses?
dbinom(x=5,size=10,prob=0.5)

# what is the probability of getting 5 
# or fewer heads out of 10 tosses?
pbinom(q=5,size=10,prob=0.5)
pbinom(q=4,size=9,prob=0.5)


# use "q" binom for quantiles

# what minimum number of heads will be found 
# for 40% of 50 trials with p = 0.5?

qbinom(p=0.4,size=50,prob=0.5)

# what is a 95% confidence interval for 100 trials 
# of a coin with p = 0.7 for heads?
qbinom(p=c(0.025,0.975),size=100,prob=0.7)