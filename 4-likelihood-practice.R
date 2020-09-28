# let's imagine that we scaled up Fisher's tea tasting experiment
# and had 10 people each taste 8 cups of tea, counting the number 
# of correct responses for each person.

tea.tasting.data <- data.frame(
  subject = 1:10,
  correct.responses = c(5,3,8,6,5,3,7,4,4,8)
)

# first: what's the likelihood of a model that says that everyone is randomly guessing?
# to answer this you need to calculate the probability of each subject's number of correct
# responses assuming that each subject has a 50% chance of a correct response. you can use
# the binomial distribution for this, specifically the dbinom() function, which gives the
# density of the binomial distribution.

# the dbinom() function takes three arguments:
# dbinom(x, size, prob)
# x is the value that you are getting the probability of
# size is the number of guesses a person gets to make
# prob is the probability of a correct guess.
# for example, to get the probability of 50 heads in 100 fair coin flips, we would do
# dbinom(50, 100, 0.5), because there are 50 heads, 100 attempts, and the probability of heads is 0.5

# once you have this probability for each subject, you need to multiply those values together to get the
# joint probability of the data given the model. hint: the prod() function is helpful!




# second: generalize your code above into a function that takes a single argument, theta,
# and calculates the likelihood for that model.

calculate.likelihood <- function(theta){

  
}

# third: generate a plot with theta values from 0 to 1 on the X-axis, and L(H) on the Y-axis.

# hint: create an array of X values from 0 to 1 in small steps, then use sapply() or a for loop to
# get the corresponding array of Y values.






