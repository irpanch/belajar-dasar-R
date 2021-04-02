# An Introduction to Statistical Learning (ISLR). (James, et all 2013) 
# excercise chapter 2. starting from number 8.

## Number 8
library(ISLR)
college <- read.csv("College.csv")
fix(college)
rownames(college) <- college[,1] # getting row names from the first column
college <- college[,-1] # delete first column, because we already assign it.

summary(college)
attach(college)
pairs(~college[,1:10],college)

