
# Set working directory, where the data will be saved
setwd("C:/examples")

# Create example data (10 million rows x 10 columns)
large_data <- matrix(runif(10^8), ncol = 10)

# Save as .csv files
write.csv(large_data, "large_data.csv", row.names = FALSE)

# Save as .rds file
saveRDS(large_data, "large_data.rds")

# Save as parquet
library(arrow)
write_parquet(as.data.frame(large_data), "large_data.parquet")

# Save as netCDF
library(ncdf4)

dimX <- ncdim_def(name = "row", units = "", vals = 1:nrow(large_data))
dimY <- ncdim_def(name = "column", units = "", vals = 1:ncol(large_data))

var_def <- ncvar_def(name = "data", units = "", 
                     dim = list(dimX, dimY), 
                     missval = NA, 
                     longname = "Data from data frame")

ncfile <- nc_create("large_data.nc", var_def) # Create NetCDF file
ncvar_put(ncfile, var_def, large_data)    # Write data to file
nc_close(ncfile)                          # Close the NetCDF file

# Save as feather
write_feather(as.data.frame(large_data), "large_data.feather")
