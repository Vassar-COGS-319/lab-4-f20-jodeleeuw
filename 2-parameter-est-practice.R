library(dplyr)
set.seed(12604)

# practice with parameter estimation

# two parameters for the line
intercept <- 3
slope <- 0.5

# create a data frame with X values
model.data <- data.frame(x = runif(200, min = -10, max = 10))

# then generate random Y values with noise around the X values.
model.data <- model.data %>%
  mutate(y = rnorm(200, mean = intercept + slope * x, sd = 1))

# plot the data and the true underlying model
plot(y ~ x, data=model.data)
abline(a = intercept, b=slope, col="red")

# now we need to write a function that calculates the RMSE for a given set of parameters.
#
# because of the function we will use in a moment, this function must take a vector of parameters
# as the first argument. we can translate that vector back into the intercept and slope inside the function.

calculate.rmse <- function(parameters){
  intercept <- parameters[1]
  slope <- parameters[2]
  
  # fill in the rest...
  # this should be almost exactly the same as the code you just wrote in pt 1
  
  rmse <- model.data %>%
    mutate(y.pred = intercept + slope * x) %>%
    mutate(error = (y.pred - y)^2) %>%
    pull(error) %>%
    mean() %>%
    sqrt()
  
  return(rmse)
  
  # at the end use return(rmse) to return the RMSE
}

# now we use optim to find the best fitting parameters (minimize RMSE)

result <- optim(calculate.rmse, par = c(3,0.5), control=list(trace=TRUE))

# we can extract the parameters from optim, and plot the best fitting line

best.intercept <- result$par[1]
best.slope <- result$par[2]

abline(a=best.intercept, b=best.slope, col="blue")

# note that the best fitting line is not the same as the actual model that generated the data!
# if you were running the experiment that collected this data, what could you do to improve
# the estimate? get more data! try simulating that, and seeing if it helps. 



# if you are done early,
# then try making a plot that has sample size on the X axis and error in the model parameter estimates on
# the Y axis...

