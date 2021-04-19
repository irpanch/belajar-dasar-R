# creating a functions in R
# https://swcarpentry.github.io/r-novice-inflammation/02-func-R/
# https://swcarpentry.github.io/r-novice-inflammation/14-supp-call-stack/

fahrenheit_to_celcius <- function(temp_F) {
  temp_C <- (temp_F - 32)*5/9
  return(temp_C)
}

fahrenheit_to_celcius(212)

celcius_to_kelvin <- function(temp_C) {
  temp_K <- temp_C + 273.15
  return(temp_K)
}

celcius_to_kelvin(26.85)

## combine function
fahrenheit_to_kelvin <- function(temp_F) {
  temp_C <- fahrenheit_to_celcius(temp_F)
  temp_K <- celcius_to_kelvin(temp_C)
  return(temp_K)
}

fahrenheit_to_kelvin(32)

## freezing point of water in Fahrenheit
## from fahrenheit to celcius, then from celcius to kelvin.
celcius_to_kelvin(fahrenheit_to_celcius(32))

## create a function practice 1
best_practice <- c("Write", "programs","for","people","not",
                   "computers")
asterisk <- "***"

highlight <- function(content,wrapper) {
  # takes wrapper as begin and end of vector
  # content vector is in between
  a <-  c(wrapper,content,wrapper) 
  return(a)
}

highlight(best_practice,asterisk)

## create a function practice 2
dry_principle <- c("Don't","repeat","yourself","or",
                   "others")

edges <- function(v) {
  b <- c(v[1],v[length(v)])
  return(b)
}

edges(dry_principle)

## create a function practice 3
input_1 <- 20
mySum <- function(input_1,input_2=10) {
  output <- input_1+input_2
  return(output)
}

mySum(input_1 = 1,3)
mySum(3)
mySum(input_2 = 3)

# testing, error handling, and documenting
center <- function(data,midpoint) {
  new_data <- (data-mean(data,na.rm = TRUE))+midpoint
  return(new_data)
}

z <- c(0,0,0,0)
z

center(z,3)

dat <- read.csv(file="data/inflammation-01.csv",header=FALSE)
centered <- center(dat[,4],0)
head(centered)

## test the result

### original min
min(dat[,4])

### original mean
mean(dat[,4])

### original max
max(dat[,4])

### centered min
min(centered)

### centered mean
mean(centered)

### centered max
max(centered)

### because original mean is 1.75, if we extract that with
### mean that will be zero, which is true when we check
### the mean of centered vector.

### check with standard deviation
sd(dat[,4])
sd(centered)
### same number, check again if there's difference in 6 decimal
sd(dat[,4])-sd(centered)
### good, the difference is zero
### more checking with rounding decimal
all.equal(sd(dat[,4]),sd(centered))
### the result is true, meaning is equal

# Error handling
# what happens if we have missing data (NA values) in the data
# argument we provide to center

## new data object to set one velun in column 4 to NA
datNA <- dat
datNA[10,4] <- NA

## returns all NA values, then corrected the function 'center'
## adding na.rm=TRUE
center(datNA[,4],0)

## and many more, I stop right here. see the URL for complete
## exercise. 