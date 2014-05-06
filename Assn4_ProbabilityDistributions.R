help(Distributions)
# d = height of probability density function
# p = cumulative density function
# q = quantiles
# r = randomly generated numbers

help(Normal)
# dnorm = height of probability distribution at each point
    # Assumes we want mean of 0

dnorm(0)
dnorm(0)*sqrt(2*pi)
dnorm(0, mean=4)
dnorm(0,mean=4,sd=10)
v <- c(0,1,2)
dnorm(v)
x <- seq(-20,20,by=.1)
y <- dnorm(x)
plot(x,y)
y <- dnorm(x,mean=2.5,sd=0.1)
plot(x,y)

#pnorm = probability that a normally distributed random number will be less than any given number
    # Cumulative Distribution Function
    # lower.tail option allows us to find the probability that a normally distributed random number will be greater than any given number

pnorm(0)
pnorm(1)
pnorm(0,mean=2)
pnorm(0,mean=2,sd=3)
v <- c(0,1,2)
pnorm(v)
x <- seq(-20,20,by=.1)
y <- dnorm(x)
plot(x,y)
y <- dnorm(x,mean=3,sd=4)
plot(x,y)

pnorm(0,lower.tail=FALSE)
pnorm(1,lower.tail=FALSE)
pnorm(0,mean=2,lower.tail=FALSE)

#qnorm returns the number whose cumulative distribution matches a given probability
    # Z score

qnorm(0.5)
qnorm(0.5,mean=1)
qnorm(0.5,mean=1,sd=2)
qnorm(0.5,mean=2,sd=2)
qnorm(0.5,mean=2,sd=4)
qnorm(0.25,mean=2,sd=2)
qnorm(0.333)
qnorm(0.333,sd=3)
qnorm(0.72,mean=5,sd=2)
v = c(0.1,0.3,0.75)
qnorm(v)
x <- seq(0,1, by=.05)
y <- qnorm(x)
plot(x,y)
y <- qnorm(x,mean=3,sd=2)
plot(x,y)
y <- qnorm(x,mean=3,sd=0.1)
plot(x,y)

#rnorm generates random numbers whose distribution is normal
    #argument is number of numbers that you want, can specify mean and sd

rnorm(4)
rnorm(4,mean=3)
rnorm(4,mean=3,sd=3)
rnorm(4,mean=3,sd=3)
y <- rnorm(200)
y <- rnorm(200,mean=2)
hist(y)
y <- rnorm(200,mean=2,sd=4)
hist(y)
qqnorm(y) #Creates QQ plot
qqline(y) #Adds line of best fit to QQ plot


#Creating t Distributions
help(TDist)

#Commands assume that values are normalized to mean of 0 and sd of 1
    #Must specify degrees of freedom (dt,pt,qt, and rt -- based on same naming conventions as above)

x <- seq(-20,20,by=.5)
y <- dt(x,df=10) #Distribution of x with 10 degrees of freedom
plot(x,y)
y <- dt(x,df=50)
plot(x,y)

pt(-3,df=10) #Cumulative probability distribution with 10 degrees of freedom
pt(3,df=10)
1-pt(3,df=10)
pt(3,df=10)
pt(3,df=20)
x=c(-3,-4,-2,-1)
pt((mean(x)-2)/sd(x),df=20)
pt((mean(x)-2)/sd(x),df=40)

qt(0.05,df=10) # Inverse CPD with 10 degrees of freedom
qt(0.95,df=10)
qt(0.05,df=20)
qt(0.95,df=20)
x <- c(0.005,.025,.05)
qt(v,df=253)
qt(v,df=25)

rt(3,df=10) # 3 random numbers generated with a t distribution with 10 degrees of freedom
rt(3,df=20)
rt(3,df=20)


#The Binomial Distribution
help(Binomial)


x <- seq(0,50,by=1)
y <- dbinom(x,50,0.2) #For each value of x, determine the normal distribution of results given that there are 50 trials and a 0.2 probability of success for each trial
plot(x,y)
y <- dbinom(x,50,0.6)
plot(x,y)
x <- seq(0,100,by=1)
y <- dbinom(x,100,0.6)
plot(x,y)

pbinom(24,50,0.5) #cumulative probability binominal distribution
pbinom(25,50,0.5)
pbinom(25,51,0.5)
pbinom(25,50,0.5)
pbinom(25,50,0.25)
pbinom(25,500,0.25)

qbinom(0.5,51,1/2)
qbinom(0.25,51,1/2)
pbinom(23,51,1/2)
pbinom(22,51,1/2)

rbinom(5,100,0.2) #Five random numbers from 100 trials with a 0.2 probability of success in each trial
rbinom(5,100,0.7)


#Chi-Squared
help(Chisquare)

#Assumed that value is normalized, so no mean can be specified
# Must specify df

x <- seq(-20,20,by=.5)
y <- dchisq(x,df=10)
plot(x,y)
y <- dchisq(x,df=12)
plot(x,y)

pchisq(2,df=10)
pchisq(3,df=10)
1-pchisq(3,df=10)
pchisq(3,df=20)
x=c(2,4,5,6)
pchisq(x,df=20)

qchisq(0.05,df=10)
qchisq(0.95,df=10)
qchisq(0.05,df=20)
v <- c(0.005,0.025,0.05)
qchisq(v,df=25)
qchisq(v,df=253)

rchisq(3,df=10)
rchisq(3,df=20)
rchisq(3,df=20)











