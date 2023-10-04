#!/usr/bin/env Rscript

library(MASS)
library(margins)

set.seed(123)

n <- 10000 # coefficients get closer and closer to actual b0, b1, b2 as n grows

b0 <- 1
b1 <- 5
b2 <- 7

x1=rnorm(n, mean = 0, sd = 1)
x2=rnorm(n, mean = 0, sd = 1)

epsilon=rnorm(n, mean = 0, sd = 1) # Probit assumption is that epsilon ~ N(0,1)

y_star = b0 + b1 * x1 + b2 * x2 + epsilon

y = c()

c1 <- 1
c2 <- 2
c3 <- 3

for (y_star_i in y_star) {
	if(y_star_i < c1) {
		y <- c(y,1)
	} else if (c1 <= y_star_i & y_star_i < c2) {
		y <- c(y,2)
	} else if (c2 <= y_star_i & y_star_i < c3) {
		y <- c(y,3)
	} else if (c3 <= y_star_i){
		y <- c(y,4)
	}
}

model <- polr(as.factor(y) ~ x1 + x2, method="probit")
summary(model)
me <- ocME(model, rev.dum = TRUE, digits = 3) # https://rdrr.io/cran/erer/man/ocME.html
print(me$out)

