# Indexing Into Vectors
# 1. Indexing with Logicals
    # How to select specific items in a vector
    # Only items corresponding to the variables that return TRUE are returned
a <- c(1,2,3,4,5)
b <- c(TRUE,FALSE,FALSE,TRUE,FALSE)
a[b]
max(a[b])
sum(a[b])



# 2. Unavailable of Missing Values
    # You can ignore missing values using na.rm=TRUE
a <- c(1,2,3,4,NA)
a
sum(a)
sum(a,na.rm=TRUE)
    # is.na alows you to determine which values are missing
is.na(a)
!is.na(a)
a[!is.na(a)]
b <- a[!is.na(a)] # Says to print only those values of a that exist (! means not)
b



# 3. Indices with Logical Expression
    # Remove all values above a given value
a = c(6,2,5,3,8,2)
a
b=a[a<6]
b
    # Join together values that match two different factors in another vector
d = data.frame(one=as.factor(c('a','a','b','b','c','c')),
               two=c(1,2,3,4,5,6))
d
both = d$two[(d$one=='a') | (d$one=='b')] 
both
    # | Does vector operations and || does only TRUE and FALSE results
(c(TRUE,TRUE))|(c(FALSE,TRUE))
(c(TRUE,TRUE))||(c(FALSE,TRUE))
(c(TRUE,TRUE))&(c(FALSE,TRUE))
(c(TRUE,TRUE))&&(c(FALSE,TRUE))






