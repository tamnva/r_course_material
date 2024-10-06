# The link to this R script in in the video description
# This command write csv file to C:/examples

write.csv(matrix(runif(100), ncol = 10),
          file = "C:/examples/matrix.csv", 
          row.names = FALSE)

message("DONE: matrix.csv file was saved to C:/examples")

# Check where R is installed
# R.home()