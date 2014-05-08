# Two-Way Tables
# 1. Creating a Table from Data
smokerData <- read.csv(file="/Users/Ali/Desktop/R Tutorial/smoker.csv",head=TRUE,sep=",")
summary(smokerData)
    # Create two-way table using table command
smoke <- table(smokerData$Smoke,smokerData$SES)
smoke



# 2. Creating Tables Directly
smoke <- matrix(c(51,43,22,92,28,21,68,22,9),ncol=3,byrow=TRUE)
colnames(smoke) <- c("High","Low","Middle")
rownames(smoke) <- c("current","former","never")
smoke <- as.table(smoke)
smoke



# 3. Tools for Working with Tables
barplot(smoke,legend=TRUE,beside=TRUE,main="Smoking Status by SES")
plot(smoke,main="Smoking Status by Socioeconomic Status")
    # Calculate marginal distributions using the margin.table command
    # Calculate marginal distributions across the rows or columns based on the one optional argument
margin.table(smoke)
margin.table(smoke,1)
margin.table(smoke,2)
    # Combine commands to get proportions
smoke/margin.table(smoke)
margin.table(smoke,1)/margin.table(smoke)
margin.table(smoke,2)/margin.table(smoke)
    # Get proportions using the prop.table command
prop.table(smoke)
prop.table(smoke,1)
prop.table(smoke,2)
    # Use a chi-squared test to determine if the proportions are different
summary(smoke)
    # P-value less than 5% means we can reject the null hypothesis and say that proportions vary
    # Complicated way involves linear algebra
expected <- as.array(margin.table(smoke,1)) %*% t(as.array(margin.table(smoke,2))) / margin.table(smoke)
expected
    # t function takes transpose of the array
    # Result of above can be compared directly to existing table
chi <- sum((expected - as.array(smoke))^2/expected)
chi
1-pchisq(chi,df=4) # Returns p-value for this statistic



# 4. Graphical Views of Tables
mosaicplot(smoke)
    # Use help(mosaicplot) to learn of other options
mosaicplot(smoke,main="Smokers",xlab="Status",ylab="Economic Class")
    # Use sort to determine which side determines the primary proportion
mosaicplot(smoke,main="Smokers",xlab="Status",ylab="Economic Class")
mosaicplot(smoke,sort=c(2,1))
    # Switch which side is used for the vertical and horizontal axis using the dir command
mosaicplot(smoke,main="Smokers",xlab="Status",ylab="Economic Class")
mosaicplot(smoke,dir=c("v","h"))




