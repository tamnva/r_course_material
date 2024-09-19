
# Link to the R script in this tutorial is in this video description
#------------------------------------------------------------------------------#
#                                 apply()                                      #
#------------------------------------------------------------------------------#
# example matrix 4 rows x 3 columns
mat <- matrix(runif(12), ncol = 3)

# get mean of rows
apply(mat, 1, mean, simplify = TRUE)

# get mean of columns
apply(mat, 2, mean)

# apply with custom function (e.g., sum of square)
apply(mat, 1, function(x) sum(x^2))

# get quantile of rows
apply(mat, 1, quantile, probs = c(0.05, 0.95), simplify = FALSE)


# apply to matrix of words
mat_words <- matrix(rep("tEsT", 12), nrow = 3)

# convet all to lower case
apply(mat_words, 1, tolower)

#------------------------------------------------------------------------------#
#                                lapply()                                      #
#------------------------------------------------------------------------------#

# lapply over vector 
vec <- 1:10

# sqrt of each element
lapply(vec, sqrt)

# lapply over a list
lst <- list(vec = vec, mat = round(mat, 2))

# mean of each element of list
lapply(lst, mean)

# quantiles of each element of list
lapply(lst, quantile, probs = c(0.05, 0.95))

#------------------------------------------------------------------------------#
#                                sapply()                                      #
#------------------------------------------------------------------------------#

# mean of each element of list
sapply(lst, quantile, probs = c(0.05, 0.95), simplify = FALSE)


