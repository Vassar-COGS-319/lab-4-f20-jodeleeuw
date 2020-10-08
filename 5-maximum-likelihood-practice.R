library(dplyr)
set.seed(12604)

# back to the linear model

# two parameters for the line
intercept <- 3
slope <- 0.5

# create a data frame with X values
model.data <- data.frame(x = runif(20, min = -10, max = 10))

# then generate random Y values with noise around the X values.
model.data <- model.data %>%
  mutate(y = rnorm(20, mean = intercept + slope * x, sd = 1))

plot(y ~ x, data=model.data)

# write a function like the one that calculated RMSE, but this time calculate likelihood
# for the set of parameters. to do this, assume that each data point is normally distributed
# around the line with sd = 1. you'll set the mean of the normal distribution to be the model's
# predicted Y value for the given X value, and then use dnorm() to find the density of the normal.

# it'll be important to use negative log likelihood here; otherwise, you'll end up with numbers
# that are too small for the computer to represent. you can either use log() to convert the probability
# that dnorm() gives you to a log probability, or you can use the argument log=T inside the dnorm
# function to get the log probability directly.

calculate.likelihood <- function(parameters){
  intercept <- parameters[1]
  slope <- parameters[2]
  
  log.likelihood <- model.data %>%
    mutate(y.pred = intercept + slope * x) %>%
    mutate(log.p = dnorm(y, mean=y.pred, sd=1, log=T)) %>%
    pull(log.p) %>%
    sum()
  
  return(-log.likelihood)
}

# run optim() to find the best fitting parameters and plot a line showing the best model fit.
# you should be able to borrow this code almost verbatim from previous parts of the lab,
# though you can rewrite it from scratch if you want to reinforce your understanding.

result <- optim(calculate.likelihood, par = c(0,0))

pred.intercept <- result$par[1]
pred.slope <- result$par[2]

abline(a=pred.intercept, b=pred.slope)
