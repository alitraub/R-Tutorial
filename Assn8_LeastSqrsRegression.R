# Linear Least Squares Regression
  # Examining interest rate for 4 year car loans -- looking at and plotting means
    # Specify the data
year <- c(2000,2001,2002,2003,2004)
rate <- c(9.34,8.50,7.62,6.93,6.60)
    # Plot data
plot(year,rate,
     main="Commerical Banks Interest Rate for 4 Year Car Loan",
     sub="http://www.federalreserve.gov/releases/g19/20050805/")
cor(year,rate)
    # Choose explanatory and response variables
        # Regression --> Rate = (slope)year + (intercept)
fit <- lm(rate ~ year)
fit
    # Variable returned is quite complex
attributes(fit)
    # Find slope and intercept by looking at the coefficients attribute
fit$coefficients[1]
fit$coefficients[[1]]
fit$coefficients[2]
fit$coefficients[[2]]
    # Find interest rate in year 2015
fit$coefficients[[2]]*2015+fit$coefficients[[1]]
    # Calculate and plot residuals
res <- rate - (fit$coefficients[[2]]*year+fit$coefficients[[1]])
res
plot(year,res)
    # Other ways to get residuals
residuals(fit)
fit$residuals
plot(year,fit$residuals)
    # Plot regression line on the same plot as your scatter plot
plot(year,rate,
     main="Commerical Banks Interest Rate for 4 Year Car Loan",
     sub="URL HERE")
abline(fit)
    # Find results of an F test
summary(fit)




