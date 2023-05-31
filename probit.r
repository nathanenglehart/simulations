#!/usr/bin/env Rscript

library(MASS)
library(margins)

set.seed(123)

n <- 100000 # coefficients get closer and closer to actual b0, b1, b2 as this gets larger

b0 <- 1
b1 <- 2
b2 <- 3

x1=rnorm(n, mean = 10, sd = 125)
x2=rnorm(n, mean = 2, sd = 16)

epsilon=rnorm(n, mean = 0, sd = 1) # Probit assumption is that epsilon ~ N(0,1)

y_star = b0 + b1 * x1 + b2 * x2 + epsilon

y=(y_star > 0)

model <- glm(y ~ x1 + x2, family = binomial(link = "probit"))

summary(model)
summary(margins(model))
