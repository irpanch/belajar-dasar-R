# ISLR. chapter 2. Lab: Introduction to R

# create a matrix
x = matrix(data=c(1,2,3,4), nrow = 2, ncol = 2)
x

# we could omi typing data=, nrow=, and ncol
x=matrix(c(1,2,3,4),2,2)
x

# if we want sequence matrix by row.
matrix(c(1,2,3,4),2,2,byrow = T)

sqrt(x)

x^2

# rnorm() generate random variabel with normal dist.
# with first argument is n (the number of sample)

x=rnorm(50)
y=x+rnorm(50,mean = 50,sd=1)
cor(x,y)

# untuk mendapat random number yang konsisten
# gunakan set.seed()

set.seed(1303)
rnorm(50)

set.seed(3)
y=rnorm(100)
mean(y)
var(y)
sqrt(var(y)) # get standard deviation
sd(y)  # same as above.



# graphics

x=rnorm(100)
y=rnorm(100)
plot(x,y)
plot(x,y,xlab="this is the x-axis",ylab="this is the
     y axis",main="Plot of X vs Y", col="green")

pdf("Figure.pdf")
dev.off()  # this indicate done with the plot

# baru sampai hal 45