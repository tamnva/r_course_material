
# This command write csv file to C:\examples
write.csv(matrix(runif(100), ncol = 10),
          file = "C:\examples\matrix.csv", 
          row.names = FALSE)
