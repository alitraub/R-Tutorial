# Intermediate Plotting



# 1. Continuous Data
# Define data set
x <- rnorm(10,sd=5,mean=20)
y <- 2.5*x - 1.0 + rnorm(10,sd=9,mean=0)
cor(x,y)

# Mulitple Data Sets on One Plot
plot(x,y,xlab="Independent",ylab="Dependent")
x1 <- runif(8,15,25)
y1 <- 2.5*x1 - 1.0 + runif(8,-6,6)
points(x1,y1,col=2) # This command adds points to the graph that we have already created. Col defines the colour. In this case, "2" gave us red points.
# Symbol can be changed using the pch command
x2 <- runif(8,15,25)
y2 <- 2.5*x2 - 1.0 + runif(8,-6,6)
points(x2,y2,col=3,pch=2) # Colour is now green and symbol is a triangle
# Add a legend
plot(x,y,xlab="Independent",ylab="Dependent",main="Random Stuff")
points(x1,y1,col=2,pch=3)
points(x2,y2,col=4,pch=5)
legend(14,70,c("Original","one","two"),col=c(1,2,4),pch=c(1,3,5)) # 14,70 are dimensions, then label names are listed, colours of symbols are listed, and symbol types are listed
# Change the limits of the axes
plot(x,y,xlab="Independent",ylab="Dependent", main="Random Stuff", xlim=c(0,30),ylim=c(0,100))
points(x1,y1,col=2,pch=3)
points(x2,y2,col=4,pch=5)
legend(14,70,c("Original","uno","dos"),col=c(1,2,4), pch=c(1,3,5))
# Add error bars
plot(x,y,xlab="Independent",ylab="Dependent",main="Random Stuff")
xHigh <- x
yHigh <-y + abs(rnorm(10,sd=3.1))
xLow <- x
yLow <- y - abs(rnorm(10,sd=3.1))
arrows(xHigh,yHigh,xLow,yLow,col=2,angle=90,length=0.1,code=3) # Code tells where to place the error bars -- value can be 1, 2, or 3. If code=2, bars are drawn at pair in 2nd argument. If code=3, bars are drawn at both locations.
# Add noise (jitter)
numberWhite <- rhyper(400,4,5,3)
numberChipped <- rhyper(400,2,7,3)
par(mfrow=c(1,2)) # Sets parameters -- in this case, mfrow was set, which caused the plots to be arranged in an array with 1 row of images and 2 columns of images.
plot(numberWhite,numberChipped,xlab="Number White Marbles Drawn",
     ylab="Number Chipped Marbles Drawn",main="Pulling Marbles")
plot(jitter(numberWhite),jitter(numberChipped), xlab="Number White Marbles Drawn",
     ylab="Number Chipped Marbles Drawn", main="Pulling Marbles with Jitter")

# Multiple Graphs on One Image
par(mfrow=c(2,3))
boxplot(numberWhite,main="first plot")
boxplot(numberChipped,main="second plot")
plot(jitter(numberWhite),jitter(numberChipped), xlab="Number of White Marbles Drawm",
     ylab="Number of Chipped Marbles Drawn", main="Pulling Marbles with Jitter")
hist(numberWhite,main="fourth plot")
hist(numberChipped,main="fifth plot")
mosaicplot(table(numberWhite,numberChipped),main="sixth plot")

# Density Plots
numberWhite <- rhyper(30,4,5,3)
numberChipped <- rhyper(30,2,7,3)
smoothScatter(numberWhite,numberChipped,
              xlab="White Marbles",ylab="Chipped Marbles",main="Drawing Marbles")
# Superimposing a grid
grid(4,3)

# Pairwise Relationships -- useful for exploring large numbers of relationships
  # Input a matrix or data frame and scatter plots will be created of all the combinations of the data
uData <- rnorm(20)
vData <- rnorm(20,mean=5)
wData <- uData + 2*vData + rnorm(20,sd=0.5)
xData <- 2*uData+rnorm(20,sd=0.1)
yData <- 3*vData+rnorm(20,sd=2.5)
d <- data.frame(u=uData,v=vData,w=wData,x=xData,y=yData)
pairs(d)

# Shaded Regions -- Created polygons enclosed by coordinate pairs
x = c(-1,1,1,-1,-1)
y = c(-1,-1,1,1,-1)
plot(x,y)
polygon(x,y,col="blue")
# Useful for shading rejection regions when analyzing statistics.
stdDev <- 0.75;
x <- seq(-5,5,by=0.01)
y <- dnorm(x,sd=stdDev)
right <- qnorm(0.95,sd=stdDev)
plot(x,y,type="l",xaxt="n",ylab="p",
     xlab=expression(paste('Assumed Distribution of ',bar(x))),
     axes=FALSE, ylim=c(0,max(y)*1.05), xlim=c(min(x),max(x)),
     frame.plot=FALSE)
axis(1,at=c(-5,right,0,5),
     pos = c(0,0),
     labels=c(expression(' '),expression(bar(x)[cr]),expression(mu[0]),expression(' ')))
axis(2)
xReject <- seq(right,5,by=0.01)
yReject <- dnorm(xReject,sd=stdDev)
polygon(c(xReject,xReject[length(xReject)],xReject[1]),
        c(yReject,0, 0), col="red")

# Plotting a surface
    # Persp gives perspecive for plotting the surface
x <- seq(0,2*pi,by=pi/100)
y <- x
xg <- (x*0+1) %*% t(y) # %*% Performs matrix multiplication
yg <- (x) %*% t(y*0+1)
f <- sin(xg+yg)
persp(x,y,f,theta=-10,phi=40)



# 2. Discrete Data
    # rhyper --> hypergeometric random number generator

numberWhite <- rhyper(30,4,5,3)
numberChipped <- rhyper(30,2,7,3)

# Barplot
    # Plot command chooses appropriate plot based on data. Data above is numeric, so we need to convert it to factors
numberWhite <- as.factor(numberWhite)
plot(numberWhite)
    # Or create it by using the barplot command and inputting vectors of heights (frequencies calculated with the table command)
numberWhite <- rhyper(30,4,5,3)
totals <- table(numberWhite)
totals
barplot(totals,main="Numbers Draws",ylab="Frequency",xlab="Draws")
    # Name the "ticks"
totals <- table(numberWhite)
rownames(totals) <- c("none","one","two","three")
totals
barplot(totals,main="Number Draws", ylab="Frequency",xlab="Draws")
    # You can rearrange the order
barplot(sort(totals,decreasing=TRUE),main="Number Draws",ylab="Frequency",xlab="Draws")
    # Or you can do it manually
totals
sort(totals,decreasing=TRUE)
totals[c(3,1,4,2)]
barplot(totals[c(3,1,4,2)])
    # A Pareto Chart can be constructed
xLoc = barplot(sort(totals,decreasing=TRUE),main="Number Draws",
               ylab="Frequency",xlab="Draws",ylim=c(0,sum(totals)+2))
points(xLoc,cumsum(sort(totals,decreasing=TRUE)),type="p",col=2)
points(xLoc,cumsum(sort(totals,decreasing=TRUE)),type="l")

# Mosaic Plots -- good for displaying proportions for tables that are divided into two or more conditional distributions
santa <- data.frame(belief=c('no belief','no belief','no belief','no belief',
                               'belief','belief','belief','belief',
                               'belief','belief','no belief','no belief',
                               'belief','belief','no belief','no belief'),
                    sibling=c('older brother','older brother','older brother','older sister',
                                'no older sibling','no older sibling','no older sibling','older sister',
                                'older brother','older sister','older brother','older sister',
                                'no older sibling','older sister','older brother','no older sibling'))
santa
summary(santa)
plot(santa$belief)
plot(santa$sibling)
    # Provide both data sets to make a mosaic plot automatically using plot
plot(santa$sibling,santa$belief)
    # Call it directly using the mosaicplot command
totals = table(santa$belief,santa$sibling)
totals
mosaicplot(totals,main="Older Brothers are Jerks",
           xlab="Belief in Santa Claus",ylab="Older Sibling")
    # Specify colours with the col command
mosaicplot(totals,main="Older Brothers are Jerks",
           xlab="Belief in Santa Claus",ylab="Older Sibling",
           col=c(2,3,4))
    # Change labels and the order in which they appear
rownames(totals)
colnames(totals)
rownames(totals)
colnames(totals)
totals
mosaicplot(totals,main="Older Brothers are Jerks",
           xlab="Belief in Santa Claus",ylab="Older Sibling")
    # Remembder that indices must include both rows and columns, and the transpose command (t) can be used to switch how it is plotted wrt vert and hor axes
totals
totals[c(2,1),c(2,3,1)]
mosaicplot(totals[c(2,1),c(2,3,1)], main="Older Brothers are Jerks",
           xlab="Belief in Santa Claus",ylab="Older Sibling",col=c(2,3,4))
mosaicplot(t(totals),main="Older Brothers are Jerks",
           ylab="Belief in Santa Calus",xlab="Older Sibling",col=c(2,3))



# 3. Miscellaneous Options
# Multiple Representations on One Plot
x = rexp(20,rate=4)
hist(x,ylim=c(0,18),main="This Is a Histogram", xlab="X")
boxplot(x,at=16,horizontal=TRUE,add=TRUE)
rug(x,side=1)
d = density(x)
points(d,type="l",col=3)

# Multiple Windows
    # dev command
    # dev.new() --> new window
    # dev.set() --> choose active window
    # dev.list(), .next(), and .prev() --> list graphical devices
dev.new()
dev.new()
dev.new()
dev.list()
dev.set(3)
x=rnorm(20)
hist(x)
dev.set(2)
boxplot(x)
dev.set(4)
qqnorm(x)
qqline(x)
dev.next()
dev.set(dev.next())
plot(density(x))

# Print to a file
x = rnorm(100)
hist(x)
dev.print(device=png,width=200,"hist.png")
    # Devices can be created
png(file="hist.png")
hist(x)
rug(x,side=1)
dev.off()

# Annotation and Formatting
x <- rnorm(10,mean=0,sd=4)
y <- 3*x-1+rnorm(10,mean=0,sd=2)
summary(x)
summary(y)
plot(x,y,axes=FALSE,col=2)
axis(1,pos=c(0,0),at=seq(-7,5,by=1)) # At specifies tick marks
axis(2,pos=c(0,0),at=seq(-18,11,by=2))
    # Boxes around plots can be suppressed by the bty option
        # Value can be o, l, 7,c, u, J, or n
x <- rnorm(10,mean=0,sd=4)
y <- 3*x-1+rnorm(10,mean=0,sd=2)
plot(x,y,bty="7")
plot(x,y,bty="n")
box(lty=3)
    # Change parameters
par(bty="l")
par(bg="gray") # Background is grey
par(mex=2) # Margins twice as wide
plot(x,y)
    # Add string text to the plot
par(mex=1)
plot(x,y)
text(-1,-2,"numbers!")
    # Notice that letters outside the plot area are cut off -- xpd allows the area to expand to accomodate for that
plot(x,y)
text(-7,-2,"outside the area",xpd=TRUE)























                        





       
       