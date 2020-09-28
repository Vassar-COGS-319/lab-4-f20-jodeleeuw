library(dplyr)
set.seed(12604)

# THIS FIRST CHUNK IS THE SAME AS WHAT WE JUST DID ####

# practice with parameter estimation

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

# now we need to write a function that calculates the RMSE for a given set of parameters.
#
# because of the function we will use in a moment, this function must take a vector of parameters
# as the first argument. we can translate that vector back into the intercept and slope inside the function.

calculate.rmse <- function(parameters){
  intercept <- parameters[1]
  slope <- parameters[2]
  
  # copy/paste your solution from pt. 2 here!
  
}

# now we use optim to find the best fitting parameters (minimize RMSE)

result <- optim(calculate.rmse, par = c(0,0), control=list(trace=TRUE))

# we can extract the parameters from optim, and plot the best fitting line

best.intercept <- result$par[1]
best.slope <- result$par[2]

abline(a=best.intercept, b=best.slope, col="blue")

# BOOTSTRAPPING - NEW STUFF! ####

# to bootstrap parameter estimates, we simulate new data and fit the model again (and again, and again...)

# STEP 1: estimating the data dispersion

# when we simulate this new data, we need to estimate one more parameter, which is the standard deviation
# of the data (how far away the data points typically are from the best fitting line). with RMSE, we don't 
# really have a way to add this into the model optimization process, so instead of fitting it we can just
# calculate the standard deviation of our sample.

# we can do this by looking at the *residuals* of the model. residuals are the errors that the model makes.

# add a column to the model.data data frame that calculates the regular (non-squared) error for the
# best fitting slope and intercept


  
# now plot the error on the y axis and the x value on the x axis



# this plot shows us how the errors in the model are distributed around the model's prediction.
# if all of the data were perfectly predicted by the model, then we would observe a horizontal line
# at error = 0. 

# if we want to estimate how dispersed the data are around the model's prediction so we can generate new samples
# then we can see that this plot is a pretty useful tool. we can just calculate the standard deviation of the
# model's errors to get an estimate.




# the true SD of the model was 1.0. we should be reasonably close to that with this method.

# STEP 2: generating new data samples

# fill in this function to create a new set of data, with the same sample size as the original sample
# (hint: most of the code you need is up above. just change a few key parameter names...)
# after creating the data frame, return the data frame object.

generate.bootstrap.sample <- function(){
  
  # create a data frame with X values
  
  
  # then generate random Y values with noise around the X values.
 
  # and then return the data frame 
  
}

# STEP 3: fit the model to the new data

generate.bootstrap.parameters <- function(){
  
  data <- generate.bootstrap.sample()
 
  # add code here to fit the model (copying what we did before, but using this new data)
  # this will require writing a new copy of the calculate.rmse function and then running
  # optim to get the parameters
  
  calculate.rmse.bootstrap <- function(parameters){
    
  }
  
  # now we use optim to find the best fitting parameters (minimize RMSE)
  

  
  intercept <- NA # replace this with your estimated intercept variable
  slope <- NA # replace this with your estimate slope variable
  
  return(list(intercept=intercept, slope=slope))
}

# this code will run your bootstrap estimating function 100 times, and store the resulting 
# parameters in a data frame. this code may take a while to run, since it has to repeat the
# parameter estimation process 100 times. it took about a minute on my laptop.
results <- replicate(100, generate.bootstrap.parameters())

parameter.estimates <- data.frame(intercept = unlist(results['intercept', ]), slope = unlist(results['slope',]))

# now we can take the data frame and plot histograms for the parameter estimates
hist(parameter.estimates$intercept)
hist(parameter.estimates$slope)

# these histograms give us one metric of uncertainty in our parameter estimates.
# what happens to the parameter estimate uncertainty as you increase the sample size of the original data (and thus
# the sample size of the bootstrap estimates)?





