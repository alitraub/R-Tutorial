#Exploring operating on variables containing vectors/lists
a <- c(1,2,3,4)
a
a+5
a-10
a*4
a/5

#Results can be saved in another variable
b <- a-10
b

#Experimenting with other operations
sqrt(a) #square root
exp(a) #e raised to each number
log(a) #logarithm
exp(log(a)) #e raised to log of a

#Developing more complex equations
c <- (a+sqrt(a))/(exp(2)+1)
c

#Can perform operations between two variables, as long as those variables contain the same number of values
a+b
a*b
a/b
(a*3)/(sqrt(1-b)*2-1)

#Not all (though most) functions work on an element by element basis
a <- c(1,-2,3,-4)
b <- c(-1,2,-3,4)
min(a,b) #find lowest value contained in a and b
pmin(a,b) #find the lowest value on an element by element basis between a and b

#Exploring numerical descriptors
tree <- read.csv(file="/Users/Ali/Desktop/R Tutorial/trees91.csv", head=TRUE, sep=",")
names(tree)
tree$LFBM
mean(tree$LFBM)
median(tree$LFBM)
quantile(tree$LFBM)
min(tree$LFBM)
max(tree$LFBM)
var(tree$LFBM)
sd(tree$LFBM)
#These values can al be obtained using the summary command
summary(tree$LFBM)
#Given a data frame (see assn 2), output will be in a data frame, as below.
summary(tree)


#Exploring operations on vectors

#Sorting data
a = c(2,4,6,3,1,5)
b = sort(a) #Default is increasing order
c = sort(a,decreasing=TRUE) #Decreasing order can occur, but requires an argument
a
b
c

#Finding min, max, sum, etc.
min(a)
max(a)
sum(a)


