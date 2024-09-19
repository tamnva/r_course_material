

# example matrix 5 rows x 2 columns
mat <- matrix(runif(12), ncol = 3)

# get mean of rows
apply(mat, 1, mean, simplify = FALSE)
apply(mat, 1, quantile, simplify = FALSE)


# lapply over vector or list
vec <- 1:10
lapply(vec, sum)

