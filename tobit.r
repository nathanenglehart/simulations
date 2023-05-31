#!/usr/bin/env Rscript

library(MASS)
library(VGAM)

n <- 10000

b0 <- 1
b1 <- 2
b2 <- 3

x1=rnorm(n, mean=0, sd=1)
x2=rnorm(n, mean=0, sd=1)

epsilon=rnorm(n, mean=0, sd=1) # Tobit assumption needs epsilon ~ N(0,sigma^2)

y_star = b0 + b1 * x1 + b2* x2 + epsilon

y = c()

for (i in 1:length(y_star)) {
	if(y_star[i] < 0) {
		y[i] = 0
	} else {
		y[i] = y_star[i]
	}
}

model <- vglm(y ~ x1 + x2, family=tobit("Lower"=0))
summary(model)
