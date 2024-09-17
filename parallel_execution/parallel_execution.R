# Load required library
library(foreach)
library(doParallel)

# Check how many logical cores/threads
detectCores(all.tests = TRUE, logical = TRUE)

# Create example data 
m <- matrix(runif(90), ncol = 3, byrow = FALSE)

# Example 1: Get sum square error of a matrix-----------------------------------
# Creates a set of copies of R running in parallel and communicating over sockets.
cl <- makeCluster(2)

# Register the parallel backend with the foreach package
registerDoParallel(cl)

# Execute parallel using foreach and %dopar%
foreach(i = 1:nrow(m), .combine = 'cbind') %dopar% {
  mean(m[i,])
}

# Stop the cluster
stopCluster(cl)

# -----------------------------------------------------------------------------#
#  Example 2: which of the following number is prime number using 3 threads    #
# -----------------------------------------------------------------------------#

# Need to check for these numbers if they are prime numbers
int_numbers <- c(100000049, 100000050, 2, 4)

# Function to check prime number
is.prime <- function(num) {
  if (num == 2) {
    paste0(num, " is a prime number")
  } else if (any(num %% 2:(num-1) == 0)) {
    paste0(num, " is NOT a prime number")
  } else { 
    paste0(num, " is a prime number")
  }
}

# Creates a set of copies of R running in parallel and communicating over sockets.
cl <- makeCluster(2)

# Register the parallel backend with the foreach package
registerDoParallel(cl)

# Execute parallel using foreach and %dopar%
foreach(i = 1:length(int_numbers), .combine = 'c') %dopar% {
  is.prime(int_numbers[i])
}

# Stop the cluster
stopCluster(cl)


