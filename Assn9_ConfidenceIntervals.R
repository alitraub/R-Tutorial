# Calculating Confidence Intervals

# 1. Calculating Confidence Interval from a Normal Distribution
a <- 5 # Sample mean
s <- 2 # SD
n <- 20 # Sample size
error <- qnorm(0.975)*s/sqrt(n)
left <- a-error
right <- a+error
left # The true mean has a 95% probability of being between 4.12 and 5.88
right 


# 2. Calculating a Confidence Interval from a t Distribution
    # This time the SD is a sample vs. a population SD
error <- qt(0.975,df=n-1)*s/sqrt(n)
left # The true mean has a 95% probability of being between 4.06 and 5.94
right

    # Univariate data set
summary(w1)
length(w1$vals)
mean(w1$vals)
sd(w1$vals)
    # Calculate an error for the mean
error <- qt(0.974,df=length(w1$vals)-1)*sd(w1$vals)/sqrt(length(w1$vals))
error
    # Confidence interval found by adding and subtracting error from mean
left <- mean(w1$vals)-error
right <- mean(w1$vals)+error
left # The true mean has a 95% probability of being between 0.66 and 0.87, assuming that the original random variable is normally distributed and the samples are independent
right


# 3. Calculating Many Confidence Intervals from a t Distribution
    # m --> mean, sd --> std dev, num --> sample size
m1 <- c(10,12,30)
m2 <- c(10.5,13,28.5)
sd1 <- c(3,4,4.5)
sd2 <- c(2.5,5.3,3)
num1 <- c(300,210,420)
num2 <- c(230,340,400)
se <- sqrt(sd1*sd1/num1+sd2*sd2/num2)
error <- qt(0.975,df=pmin(num1,num2)-1)*se
    # Calculate confidence intervals
        # Use pmin to find degrees of freedom
        # Null hypothesis is that there is no difference between means
left <- (m1-m2)-error
right <- (m1-m2)+error
left # There is a 95% chance that the true mean is between -0.97 and -0.03
right




