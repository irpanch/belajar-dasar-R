# create a function ci that takes in a numeric vector 
# and gives out the confidence interval of the mean
ci <- function(x) {
  # calculate the mean of data
  u <- mean(x)
  # calculate the standard deviation of the data
  s <- sd(x)
  # calculate the standard error
  se <- s/sqrt(length(x))
  # return the lower and upper bound of the
  # 95% confidence interval
  return(c(u-1.96*se, u+1.96*se))
}

# create a vector d of 100 random values taken from a
# normal distribution with mean 0 and sd 1.
d <- rnorm(n=100,mean = 0,sd=1)

# apply the function ci to get the confidence interval 
# of the vector d

ci(d)
