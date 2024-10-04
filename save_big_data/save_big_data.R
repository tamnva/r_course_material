
# Set working directory, where the data will be saved
setwd("C:/examples")

# Create example data (10 million rows x 10 columns)
large_data <- data.frame(1:10^8, ncol = 10) + 0.123456789

# Save as .csv files
write.csv(large_data, "large_data.csv", row.names = FALSE)

# Save as .rds file
saveRDS(large_data, "large_data.rds")

# Save as parquet
library(arrow)
write_parquet(large_data, "large_data.parquet")

# Save as netCDF
library(ncdf4)
data_array <- as.matrix(large_data)

dimX <- ncdim_def(name = "row", units = "", vals = 1:nrow(data_array))
dimY <- ncdim_def(name = "column", units = "", vals = 1:ncol(data_array))

var_def <- ncvar_def(name = "data", units = "", 
                     dim = list(dimX, dimY), 
                     missval = NA, 
                     longname = "Data from data frame")

ncfile <- nc_create("large_data.nc", var_def) # Create NetCDF file
ncvar_put(ncfile, var_def, data_array)    # Write data to file
nc_close(ncfile)                          # Close the NetCDF file

