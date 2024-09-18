# Install package
install.packages("dplyr")

# Load required package
library(dplyr)

# example data
View(mtcars)

# custom function
sum_square <- function(x) sum(x^2)

# sum by group
mtcars %>%
  group_by(cyl, vs) %>%
  summarise(sum_disp = sum(disp),
            mean_disp = mean(disp),
            sum_of_square = sum_square(wt))

# create daily data
daily_data <- data.frame(date = seq.Date(from = as.Date("2023-01-01"),
                                         to = as.Date("2024-12-31"),
                                         by = "days"),
                         daily_value  = runif(731))

daily_data <- daily_data %>%
  mutate(month = format(date, "%m"),
         year = format(date, "%Y"))


daily_data %>%
  group_by(year, month) %>%
  summarise(monthly_ave = mean(daily_value))








