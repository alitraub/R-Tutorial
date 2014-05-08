# Scripting
# 1. Executing a file
help(control)
    # Source command used to read the file and execute the commands in the order given in the file
source('/Users/Ali/Desktop/R Tutorial/Untitled.R')
help (source)
    # Commands will not be written, nor are the results printed -- override using echo, print.eval, and verbose
# Imagine that this file is in the current directory (save as simpleEx.R)
x <- rnorm(10)
mux = mean(x)
cat("The mean of x is ",mean(x),"\n")
summary(x)
cat("The summary of x is \n", summary(x),"\n")
print(summary(x))
source('/Users/Ali/Desktop/R Tutorial/Untitled.R')
source('/Users/Ali/Desktop/R Tutorial/Untitled.R', echo=TRUE)
source('/Users/Ali/Desktop/R Tutorial/Untitled.R', print.eval=TRUE)
source('/Users/Ali/Desktop/R Tutorial/Untitled.R',verbose=TRUE)

# Sometimes it is a problem that files cannot be found. Use dir to see what files are in the directory and use getwd to determine the current directory
getwd()
dir()

# If Statements
x = 0.1
if (x<0.2)
{
  x <- x+1
  cat("increment that number!\n")
}
x

# Else statements
x = 2.0
if (x<0.2)
{
  x <- x+1
  cat("increment that number!\n")
} else
{
  x <- x-1
  cat("nah,make it smaller.\n");
}
x

# Chained if statements
x = 1.0
if (x < 0.2)
{
  x <- x+1
  cat("increment that number!\n")
} else if (x <2.0)
{
  x <- 2.0*x
  cat("not big enough!\n")
} else
{
  x <- x-1
  cat("nah, make ti smaller.\n");
}
x


# For loops -- used to repeat a set of instructions
for (lupe in seq(0,1,by=0.3))
{
  cat(lupe,"\n");
}

x <- c(1,2,4,8,16)
for (loop in x)
{
  cat("value of loop: ",loop,"\n");
}


# While statements -- used to repeat a set of instructions when you do not know in advance how often instructions will be executed

lupe <- 1;
x <- 1
while(x < 4)
{
  x <- rnorm(1,mean=2,sd=3)
  cat("trying this value: ",x," (",lupe," times in loop)\n");
  lupe <- lupe + 1
}



# Repeat Statements
    # Like while, but will only start the loop if the condition is true the first time it is evaluated
    # Must explicityly specify when to stop using the break command
repeat
{
  x <- rnorm(1)
  if(x < -2.0) break
}
x


# Break and Next Statements
    # Break is used to stop the execution of the current loop
    # Next statement is used to skip the statements that follow and restart the current loop

x <- rnorm(5)
x
for(lupe in x)
{
  if (lupe>2.0)
    next
  if ((lupe<0.6) && (lupe>0.5))
    break
  cat("The value of lupe is ",lupe,"\n");
}



# Switch statements
    # Takes expression and returns a value in a list based on the value of the expression
    # If result is a number then it returns the item in the list with the same index
x <- as.integer(2) # Must be cast as an integer if not already one
x
z = switch(x,1,2,3,4,5)
z
x <- 3.5
z = switch(x,1,2,3,4,5)
z
    # If result of expression is a string, then the list of items should be in the form "valueN"=resultN and the statement will return the result that matches the value
y <- rnorm(5)
y
x <- "sd"
z <- switch(x,"mean"=mean(y),"median"=median(y),"variance"=var(y),"sd"=sd(y))
z
x <- "median"
z <- switch(x,"mean"=mean(y),"median"=median(y),"variance"=var(y),"sd"=sd(y))
z


# Scan statement
    # Waits for input from user and returns the value that was typed in
help(scan)
a <- scan(what=double(0))
3.5


a
typeof(a)
# Cannot enter strings when a double is expected

# nmax option can specify how many lines can be typed in
# multi.line option can be used to turn off multi-line entry
a <- scan(what=double(0),nmax=1,multi.line=FALSE)
6.7
a






# 2. Functions
# Assign function a name
newDef <- function(a,b)
{
  x = runif(10,a,b)
  mean(x)
}
newDef(-1,1)
newDef
x <- newDef(0,1)
x
newDef(b=10,a=1)
newDef(10,1)
# List of items can be returned
c = c(1,2,3,4,5)
sample <- function(a,b)
{
  value = switch(a,"median"=median(b),"mean"=mean(b),"variance"=var(b))
  largeVals = length(c[c>1])
  list(stat=value,number=largeVals)
}
result <- sample("median",c)
result
result$stat
result$number






  
  
  





