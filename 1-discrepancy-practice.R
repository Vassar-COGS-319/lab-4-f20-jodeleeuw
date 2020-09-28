library(dplyr)

set.seed(12604) # setting the random number seed will make the results match across runs

# RMSE CALCULATION

# creating some fake data for a linear model to fit

# two parameters for the line
intercept <- 3
slope <- 0.5

# create a data frame with X values
model.data <- data.frame(x = runif(20, min = -10, max = 10))

# then generate random Y values with noise around the X values.
model.data <- model.data %>%
  mutate(y = rnorm(20, mean = intercept + slope * x, sd = 1))

# plot the data and the true underlying model
plot(y ~ x, data=model.data)
abline(a = intercept, b=slope, col="red")

# YOUR JOB:
# calculate the Root Mean Square Error for the true model.
# this involves: 
#   - finding the predicted y value for each x, according to the model
#   - finding the square error for each data point [predicted - data]^2
#   - taking the mean of the square errors, and then taking the sqrt of the mean.




# the answer is 0.935


# CHI-SQUARED CALCULATION

# creating some categorical data to fit
# suppose we have an experiment where people must categorize visual objects into
# three different made-up categories: gexes, zofs, and daxes. we have a model that
# says that people should say gex 50% of the time, zof 30% of the time, and dax 20%
# of the time.

gex.prob <- .5
zof.prob <- .3
dax.prob <- .2

# we can generate a set of answers to 100 questions

answers <- sample(c('gex', 'zof', 'dax'), 100,  replace=T, prob=c(gex.prob, zof.prob, dax.prob))

# let's count how many times each response was given
# we can use the function table() to help us out here

responses <- as.data.frame(table(answers))

# let's add a column to this data to show the model's expected proportion of responses

responses$expected <- c(dax.prob, gex.prob, zof.prob)

# one discrepancy function for categorical data like this is the Chi Squared function

# to calculate chi squared, we do the following for each category:
# find the difference between the observed number of responses and the expected number of responses
# square this value
# divide it by the expected number of responses

# once we do that we sum up the value for all categories. that's chi squared. 

# use mutate() and then sum() to calculate the chi squared for this data.






