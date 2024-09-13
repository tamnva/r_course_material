
# Install/Load required package-------------------------------------------------
install.packages("data.table")

# Load readr package
library(data.table)

# Download and read data--------------------------------------------------------
# https://github.com/tamnva/r_course_material/tree/master/example_data_readr

# Read us_economic_data.csv
# Note: first column should be read as date
data <- fread(file = "C:/examples/us_economic_data.csv",
              sep = ",",
              dec = ".",
              header = TRUE)


# Read climate_data_berlin_dwd.txt
# The STATIONS_ID and MESS_DATUM should be read as character
data <- fread(file = "C:/examples/climate_data_berlin_dwd.txt", 
              sep = ";",
              header = TRUE, 
              colClasses = setNames(c("character", "character"),
                                    c("STATIONS_ID", "MESS_DATUM")))

data$MESS_DATUM <- as.Date(data$MESS_DATUM, format = "%Y%m%d")

# Read output.rch 
# Note: no header, need to skip first 9 lines
data <- fread(file = "C:/examples/output.rch", dec=".",
              header = FALSE, 
              skip = 9)

# Write data--------------------------------------------------------------------
# Write data to text file
fwrite(data, file = "C:/examples/data.txt")



