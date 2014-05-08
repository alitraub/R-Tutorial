# Calculating the Power of a Test
# 1. Calculating the Power using a normal distribution
    # Null hypothesis is that the mean is equal to a given number, a
    # The power of a test is the probability that we can the reject null hypothesis at a given mean 
    # probability that we accept the null hypothesis when we should not. This is the probability to make a type II error. The power is the probability that we do not make a type II error so we then take one minus the result to get the power
        # Looking for the power to detect a true mean that differs from a by 1.5
a <- 5
s <- 2
n <- 20
error <- qnorm(0.975)*s/sqrt(n)
left <- a-error
right <- a+error
left
right
    # Find Z-scores if the true mean is 6.5
assumed <- a +1.5
zleft <- (left-assumed)/(s/sqrt(n))
zright <- (right-assumed)/(s/sqrt(n))
p <- pnorm(zright)-pnorm(zleft)
p
    # Probability that we make a type II error if the true mean is 6.5 is approximately 8.1%
    # Power of the test is 1-p
1-p
    # Power of the test is 91.8% --> If the true mean is 6.5, then we are 91.8% sure to reject the null hypothesis that the mean is 5



# 2. Calculating the Power using a t Distribution
    # Repeat test above using sample sd vs. population sd
a <- 5
s <- 2
n <- 20
error <- qt(0.975,df=n-1)*s/sqrt(n)
left <- a-error
right <- a+error
left
right
assumed <- a +1.5
tleft <- (left-assumed)/(s/sqrt(n))
tright <- (right-assumed)/(s/sqrt(n))
p <- pt(tright,df=n-1)-pt(tleft,df=n-1)
p
    # Probability of making a type II error if the true mean is 6.5 is 11.1%
1-p
    # Power is 88.9%
    # Find power using non-centrality parameter -- give critical t scores and the amount that the mean would be shifted if the alternate mean were the true mean
ncp <- 1.5/(s/sqrt(n))
t <- qt(0.975,df=n-1)
pt(t,df=n-1,ncp=ncp)-pt(-t,df=n-1,ncp=ncp)
1-(pt(t,df=n-1,ncp=ncp)-pt(-t,df=n-1,ncp=ncp))
    # Probability of making a type II error is 11.1% and power is 88.9%
    # Final way -- same thing but with one command
power.t.test(n=n,delta=1.5,sd=s,sig.level=0.05,
             type="one.sample",alternative="two.sided",strict=TRUE)
    # See help(power.t.test) for more info



# 3. Calculating Many Powers from a t Distribution
m1 <- c(10,12,30)
m2 <- c(10.5,13,28.5)
sd1 <- c(3,4,4.5)
sd2 <- c(2.5,5.3,3)
num1 <- c(300,210,420)
num2 <- c(230,340,400)
se <- sqrt(sd1*sd1/num1+sd2*sd2/num2)
    # Define the confidence interval, using pmin to get degrees of freedom
left <- qt(0.025,df=pmin(num1,num2)-1)*se
right <- -left
left
right
    # Calculate power of one-sided test assuming a true mean of 1
tl <- (left-1)/se
tr <- (right-1)/se
tl
tr
probII <- pt(tr,df=pmin(num1,num2)-1)- pt(tl,df=pmin(num1,num2)-1)
probII
power <- 1-probII
power
    # Results are values from a two-sided test
    # Can also use non-central parameter
t <- qt(0.975,df=pmin(num1,num2)-1)
t
ncp <- (1)/se
pt(t,df=pmin(num1,num2)-1,ncp=ncp)-pt(-t,df=pmin(num1,num2)-1,ncp=ncp)
1-pt(t,df=pmin(num1,num2)-1,ncp=ncp)-pt(-t,df=pmin(num1,num2)-1,ncp=ncp)






