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
dev.off()  # jalankan terus hingga null device = 1. 

x=seq(1,10)
x
x=1:10
x
x=seq(-pi,pi,length=50)
x

# contour plot
## take three argument
## 1. A vector of the x values (first dimension)
## 2. A vector of the y values (second dimension), and
## 3. A matrix whose elements correspond to the z values

### dari ?contour
require(grDevices) # for colours
x <- -6:16
op <- par(mfrow = c(2, 2))
contour(outer(x, x), method = "edge", vfont = c("sans serif", "plain"))
z <- outer(x, sqrt(abs(x)), FUN = "/")
image(x, x, z)
contour(x, x, z, col = "pink", add = TRUE, method = "edge",
        vfont = c("sans serif", "plain"))
contour(x, x, z, ylim = c(1, 6), method = "simple", labcex = 1,
        xlab = quote(x[1]), ylab = quote(x[2]))
contour(x, x, z, ylim = c(-6, 6), nlev = 20, lty = 2, method = "simple",
        main = "20 levels; \"simple\" labelling method")
par(op)


### dari stackoverflow. coba superscript lab di plot.
plot(rnorm(30), xlab = expression(paste("4"^"th", " moment")))

## lanjut dari ISLR hal 46
y=x
f=outer(x,y,function(x,y)cos(y)/(1+x^2))
contour(x,y,f)
contour(x,y,f,nlevels = 45,add = T)
fa=(f-t(f))/2
contour(x,y,fa, nlevels = 15)


# image function
# dikenal juga dengan "heatmap"

image(x,y,fa)
persp(x,y,fa)
persp(x,y,fa,theta = 30)
persp(x,y,fa,theta = 30, phi = 20)
persp(x,y,fa,theta = 30, phi = 70)
persp(x,y,fa,theta = 30, phi = 40)


# Indexing data
A=matrix(1:16,4,4)
A
A[2,3]
A[c(1,3),c(2,4)]
A[1:3,2:4]
A[1:2,]
A[,1:2]
A[1,]
## exclude row or column using negative sign
A[-c(1,3),]
A[-c(1,3),-c(1,3,4)]
## lihat dimensi matrix
dim(A)

# Loading data
## read.table untuk import write.table untuk export

Auto=read.table("Auto.csv")

## atau dengan read.csv
library(readr)
Auto <- read_csv("Auto.csv")
