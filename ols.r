#!/usr/bin/env Rscript

library(MASS)

set.seed(123)

n <- 100000 # coefficients get closer and closer to actual b0, b1, b2 as this gets larger

b0 <- 1
b1 <- 2
b2 <- 3

x1=rnorm(n, mean = 0, sd = 1)
x2=rnorm(n, mean = 10, sd = 9)

epsilon=rnorm(n, mean = 0, sd = 25)

y= b0 + b1 * x1 + b2 * x2 + epsilon

model <- lm(y ~ x1 + x2)
summary(model)
