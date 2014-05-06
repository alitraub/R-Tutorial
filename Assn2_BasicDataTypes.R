#Exploring variable types
a <- 3
a
b <- sqrt(a*a+3)
b
#List defined variables 
ls() 

#Create a vector (variable containing a list of values)
a <- c(1,2,3,4,5)
a
a+1
mean(a)
var(a)
a[1]
a[2]
a[7] #Informs you that there is no seventh entry stored in a
a[0] #Automatically tells you type of data
#Create a list of 10 numbers
a <- numeric(10)
#Determine what type of data is being stored in a
typeof(a)
# Create some string data
a <- "hello world"
a
b <- c("hello", "there")
b
# String data is called "character" data
typeof(b)
typeof(a)
# Create a list of 20 characters (default is ")
a = character(20)
a


#Learning about factors: R automatically assumes that when data columns contain both
#string and numerical data that the values are factors, such as in Column CHBR . 
#This is not the case when the data is all numerical, in the case of Column C.
summary(tree$CHBR)
tree$C
summary(tree$C)
#Tell R that values in column C are factors
tree$C <- factor(tree$C)
tree$C
summary(tree$C)
levels(tree$C)


#Exploring data frames
a <- c(1,2,3,4)
b <- c(2,4,6,8)
levels <- factor(c("A","B","A","B"))
bubba <- data.frame(first=a,
                      second=b,
                      f=levels)
bubba
summary(bubba)
bubba$first
bubba$second
bubba$f


#Exploring logical data (TRUE or FALSE type)
a = TRUE
typeof(a) 
b = FALSE
typeof(b)
#Difference between operators that act on entries within a vector and the whole vector:
a = c(TRUE, FALSE)
b = c(FALSE, FALSE)
a|b #entry wise or
#Result is TRUE, FALSE because TRUE overrides false in the first entry and the second entry is FALSE for both variables
a||b #or
# Result is TRUE because TRUE overrides FALSE
xor(a,b) #exclusive or
#Result is TRUE, FALSE because TRUE overrides false in the first entry and the second entry is FALSE for both variables
#Determining the type of data by understanding logical data
a = c(1,2,3)
is.numeric(a)
#Result is TRUE because the data is numeric
is.factor(a)
#Result is FALSE because we have not defined the values stored in a as factors


#Exploring tables -- One-Way Tables
#Argument is vector of factors and ouput is frequency that each factor occurs
a <- factor(c("A","A","B","A","B","B","C","A","C"))
results <- table(a)
results
attributes(results) #Tells number of columns containing data and names of each column
summary(results)


#Creating a matrix is required to create a two-way table
occur <- matrix(c(4,3,2),ncol=3,byrow=TRUE)
occur #The variable "occur" is a matrix
#Converting a matrix to a table
colnames(occur) <- c("A","B","C") #Defines column names
occur
occur <- as.table(occur) #Converts to a table
attributes(occur)


#Two-way tables
a <- c("Sometimes","Sometimes","Never","Always","Always","Sometimes","Sometimes","Never")
b <- c("Maybe","Maybe","Yes","Maybe","Maybe","No","Yes","No")
results <- table(a,b)
results
#Also possible to manually enter table data
sexsmoke <- matrix(c(70,120,65,140),ncol=2,byrow=TRUE) #Byrow = TRUE tells R that we want the numbers to be filled across the rows before down the columns
rownames(sexsmoke)<-c("male","female")
colnames(sexsmoke)<-c("smoke","nosmoke")
sexsmoke <- as.table(sexsmoke)
sexsmoke






