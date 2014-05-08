# Case Study: Working Through a HW Problem
# 1. Problem Statement
# 2. Transforming the Data
engine <- read.csv(file="/Users/Ali/Desktop/R Tutorial/table_7_3.csv",head=TRUE,sep=",")
names(engine)
summary(engine)

# Appears skewed
qqnorm(engine$co,main="Carbon Monoxide")
qqline(engine$co)
boxplot(engine$co,main="Carbon Monoxide")
hist(engine$co,main="Carbon Monoxide")
qqnorm(engine$co,main="Carbon Monoxide")
qqline(engine$co)

# Transform to normalize
lengine <- log(engine$co)
boxplot(lengine,main="Carbon Monoxide")
hist(lengine,main="Carbon Monoxide")
qqnorm(lengine,main="QQ Plot for the log of the Carbon Monoxide")
qqline(lengine)

#3. The confidence interval
m <- mean(lengine) # Find sample mean
s <- sd(lengine) # Find sample sd
n <- length(lengine) # Find sample size
m
s
n
se <- s/sqrt(n) # Find std error
se
error <- se*qt(0.975,df=n-1)
error
left<-m-error
right<-m+error
left
right


# Data was logged so we need to undo it
exp(left)
exp(right)
# Confidence interval is between 5.53 and 7.83


# 4. Test of Significance
    # Null hypothesis is that the mean is 5.4
lNull <- log(5.4) - error
rNull <- log(5.4) + error
lNull
rNull
m # lies outside assumed interval, so null hypothesis can be rejected

    # Calculate p value
2*(1-pt((m-log(5.4))/se,df=n-1)) # Less than 5% --> reject null hypothesis

    # Use a t-test
t.test(lengine,mu=log(5.4),alternative="two.sided")


# 5. The Power of the tets
    # Find probabiliy of accepting null hypothesis if the actual level were 7
tLeft <- (lNull-log(7))/(s/sqrt(n))
tRight <- (rNull-log(7))/(s/sqrt(n))
p <- pt(tRight,df=n-1)-pt(tLeft,df=n-1)
p
1-p # Probability of detecting a difference is the level really is 7 is ~83.7%


# Use non-centrality parameter
t <- qt(0.975,df=n-1)
shift <- (log(5.4)-log(7))/(s/sqrt(n))
pt(t,df=n-1,ncp=shift)-pt(-t,df=n-1,ncp=shift)
1-(pt(t,df=n-1,ncp=shift)-pt(-t,df=n-1,ncp=shift))

# Do it all in one step
power.t.test(n=n,delta=log(7)-log(5.4),sd=s,sig.level=0.05,
             type="one.sample",alternative="two.sided",strict = TRUE)





 
