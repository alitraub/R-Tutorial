# Calculating P Values
# 1. Calculating a single p value from a normal distribution
    # Null hypothesis is that the mean is close to a
    # Sample mean --> x
    # Standard deviation --> s (assumed given)
  # Calculating the p value using the Z score
    # If Z score is postivie, we need to take 1-(associated probability), two-sided --> mulitiply by two
    # Ensure not negative by taking + and - of absolute value of Z
a <- 5
s <- 2
n <- 20
xbar <- 7
z <- (xbar-a)/(s/sqrt(n))
z
2*pnorm(-abs(z))
    # Now look at same probem by specify mean and sd within pnorm --> harder to force use of left tail
    # Since sample mean is more than assumed mean, we have to take 2 times one minus the probability
2*(1-pnorm(xbar,mean=a,sd=s/sqrt(20)))



# 2. Calculating a single p value from a t distribution
    # You must now specify the degrees of freedom
t <- (xbar-a)/(s/sqrt(n))
t
2*pt(-abs(t),df=n-1)
    # Univariate dataset and we want to find the p value
summary(w1)
length(w1$vals)
    # Null hypothesis is that the mean is 0.7
t <- (mean(w1$vals)-0.7)/(sd(w1$vals)/sqrt(length(w1$vals)))
t
2*pt(-abs(t),df=length(w1$vals)-1)



# 3. Calculating many p values from a t distribution
    # Null hypothesisi is that mean one - mean 2 is 0
m1 <- c(10,12,30)
m2 <- c(10.5,13,28.5)
sd1 <- c(3,4,4.5)
sd2 <- c(2.5,5.3,3)
num1 <- c(300,210,420)
num2 <- c(230,340,400)
se <- sqrt(sd1*sd1/num1+sd2*sd2/num2) # Std error
t <- (m1-m2)/se
    # Use pmin to get the degrees of freedom
pt(t,df=pmin(num1,num2)-1) # Last p value is not correct because the entered t value was positive instead of negative
pt(-abs(t),df=pmin(num1,num2)-1) # Use abs to fix that problem



# 4. The Easy Way
x = c(9.0,9.5,9.6,10.2,11.6)
t.test(x)

t.test(x,mu=10)

t.test(x,mu=10,alternative="less")

y = c(9.9,8.7,9.8,10.5,8.9,8.3,9.8,9.0)
t.test(x,y)



