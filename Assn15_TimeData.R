# Time Data Types
# 1. Time and Date Variables
    # POSIXct -- number of seconds since the start of Jan 1, 1970
    # POSIXlt -- vectors, with entries:
        # 1. seconds, 2. minutes, 3. hours, 4. day of month (1-31), 5. month (0-11), 6. years since 1900
        # 7. day of week (0-6), 8. day of year(0-365), 9. DST (+ means yes)
    # Sys.time() gives current time
    # as.POSIXct and as.POSIXlt convert time into different formats
help(DataTimeClasses)
t <- Sys.time()
typeof(t)
t
print(t)
cat(t,"\n")
c <- as.POSIXct(t)
typeof(c)
print(c)
cat(c,"\n")


l <- as.POSIXlt(t)
l
typeof(l)
print(l)
cat(l,"\n")
names(l)
l[[1]]
l[[2]]
l[[3]]
l[[4]]
l[[5]]
l[[6]]
l[[7]]
l[[8]]
l[[9]]

b<- as.POSIXct(l)
cat(b,"\n")

# Converting data into a string -- strftime converts time data into a string

help(strftime)

t <- Sys.time()
cat(t,"\n")
timeStamp <- strftime(t,"%Y-%m-%d %H:%M:%S")
timeStamp
typeof(timeStamp) # Must be converted to do calculations

# Converting string time into useable data time -- strptime
myData <-data.frame(time=c("2014-01-23 14:28:21","2014-01-23 14:28:55",
                           "2014-01-23 14:29:02","2014-01-23 14:31:18"),
                    speed=c(2.0,2.2,3.4,5.5))
myData
summary(myData)
myData$time[1]
typeof(myData$time[1])


myData$time <- strptime(myData$time,"%Y-%m-%d %H:%M:%S")
myData
myData$time[1]
typeof(myData$time[1])
myData$time[1][[2]]

# Performing operations on the fields
N = length(myData$time)
myData$time[2:N] - myData$time[1:(N-1)]
    # as.Date function stores time as number of days vs. number of seconds
theDates <- c("1 jan 2012","1 jan 2013","1 jan 2014")
dateFields <- as.Date(theDates,"%d %b %Y")
typeof(dateFields)
dateFields
N <- length(dateFields)
diff <- dateFields[1:(N-1)] - dateFields[2:N]
diff

# Define a date in terms of number of days after another date using the origin option
infamy <- as.Date(179,origin="1942-06-04")
infamy

today <- Sys.Date()
today
today-infamy

# Format function
theTime <- Sys.time()
theTime
a <- rexp(1,0.1)
a
cat("At about",format(theTime,"%H:%M"),"the time between occurences was around", format(a,digits=3),"seconds\n")


# 2. Time Operations
now <- Sys.time()
now
now-60
earlier <- strptime("2000-01-01 00:00:00","%Y-%m-%d %H:%M:%S")
later <- strptime("2000-01-01 00:00:20","%Y-%m-%d %H:%M:%S")
later-earlier

as.double(later-earlier)

earlier <- strptime("2000-01-01 00:00:00","%Y-%m-%d %H:%M:%S")
later <- strptime("2000-01-01 01:00:00","%Y-%m-%d %H:%M:%S")
later-earlier

as.double(later-earlier)

up <- as.Date("1961-08-13")
down <- as.Date("1989-11-9")
down-up

earlier <- strptime("2000-01-01 00:00:00","%Y-%m-%d %H:%M:%S")
later <- strptime("2000-01-01 01:00:00","%Y-%m-%d %H:%M:%S")
difftime(later,earlier)
difftime(later,earlier,units="secs")

earlier <- strptime("2000-01-01 00:00:00","%Y-%m-%d %H:%M:%S")
later <- strptime("2000-01-01 00:00:20","%Y-%m-%d %H:%M:%S")
d <- difftime(later,earlier)
d
typeof(d)
as.double(d)

diff <- as.difftime("00:30:00","%H:%M:%S",units="hour")
diff
Sys.time()
Sys.time()+diff

# Once a time stamp has been cast into one of R's internal formats, comparisons can be made in a natural way
diff <- as.difftime("00:30:00","%H:%M:%S",units="hour")
now <- Sys.time()
late <- now + diff
now
later
if(now < later)
{
  cat("There you go\n")
}







