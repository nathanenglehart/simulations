#!/usr/bin/env Rscript

library(MASS)
library(marginaleffects)

set.seed(123)

n <- 100000

b0 <- 1
b1 <- 2
b2 <- 3

x1=rnorm(n, mean = 10, sd = 125)
x2=rnorm(n, mean = 2, sd = 16)

epsilon=rnorm(n, mean = 0, sd = 1) 

y <- rpois(n=n, lambda=exp(b0 + b1 * x1 + b2 * x2))

model <- glm(y ~ x1 + x2, family="poisson", data=data)
summary(model)
me <- marginaleffects(model)
summary(me)
