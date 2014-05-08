# Data Management
# 1. Appending Data
    # rbind --> append rows
    # cbind --> append columns
a <- data.frame(one=c(0,1,2),two=c("a","a","b"))
b <- data.frame(one=c(10,11,12),two=c("c","c","d"))
a
b
v <- rbind(a,b)
typeof(v)
v
w <- cbind(a,b)
typeof(w)
w
names(w) = c("one","two","three","four")
w
    # Works with matrices too
A = matrix(c( 1, 2, 3, 4, 5, 6),ncol=3,byrow=TRUE)
A
B = matrix(c(10,20,30,40,50,60),ncol=3,byrow=TRUE)
B
V <- rbind(A,B)
typeof(V)
V
W <- cbind(A,B)
typeof(W)
W



# 2. Applying Functions Across Data Elements
    # apply commands take a function and have the function perform an operation on each part of the data
    # lapply takes a list of items and performs some function on each member of the list
x <- list(a=rnorm(200,mean=1,sd=10),
          b=rexp(300,10.0),
          c=as.factor(c("a","b","b","b","c","c")))
lapply(x,summary) # A summary is performed on every item in the list
    # sapply function is similar by it tries to return the result in a vector or matrix, if possible
x <- list(a=rnorm(8,mean=1,sd=10), b=rexp(10,10.0))
x
val <- lapply(x,mean)
typeof(val)
val
val$a
val$b
other <- sapply(x,mean)
typeof(other)
other
other [1]
other [2]
    # tapply function will take a list of data and willa apply a function to each subset of the data that matches the given factors
val <- data.frame(a=c(1,2,10,20,5,50),
                  b=as.factor(c("a","a","b","b","a","b")))
val
result <- tapply(val$a,val$b,mean)
typeof(result)
result
result[1]
result[2]
result <- tapply(val$a,val$b,summary)
typeof(result)
result



