

# Link to this R code is in this video description 
# Load required library
library(ggplot2)

# Create example data
values <- c(1:100)
data <- data.frame(time = values,
                   lower = sin(values/10) - 0.5,
                   upper = sin(values/10) + 0.5,
                   median = sin(values/10))

# List of hex color code https://www.color-hex.com/
# Plot the confidence interval/uncertainty band + median line------------------.
ggplot(data = data) +
  geom_ribbon(aes(x = time, ymin = lower, ymax = upper, fill = "min_max"), 
              alpha = 0.2) +
  geom_line(aes(x = time, y = median, color = "median")) +
  scale_fill_manual(name = "name 1",
                    values = c("min_max" = "#1E88E5")) +
  scale_color_manual(name = "name 2",
                     values = c("median" = "#1E88E5")) +
  labs(title = "title", x = "x label", y = "y label") +
  theme_bw() + 
  theme(legend.position = "right")

# Merge legend together---------------------------------------------------------
ggplot(data = data) +
  geom_ribbon(aes(x = time, ymin = lower, ymax = upper, fill = "median_min_max"), 
              alpha = 0.2) +
  geom_line(aes(x = time, y = median, color = "median_min_max")) +
  scale_fill_manual(name = "name",
                    values = c("median_min_max" = "#1E88E5")) +
  scale_color_manual(name = "name",
                     values = c("median_min_max" = "#1E88E5")) +
  labs(title = "title", x = "x label", y = "y label") +
  theme_bw() +
  theme(legend.position = "right")

# add another line to the plot--------------------------------------------------
ggplot(data = data) +
  geom_ribbon(aes(x = time, ymin = lower, ymax = upper, fill = "min_max"),
              alpha = 0.2) +
  geom_line(aes(x = time, y = median, color = "median")) +
  geom_line(aes(x = time, y = median + 2, color = "new_line")) +
  scale_fill_manual(name = "name",
                    values = c("min_max" = "#1E88E5")) +
  scale_color_manual(name = "name",
                     values = c("median" = "#1E88E5",
                                "new_line" = "#F36013"),
                     breaks = c("new_line", "median"))  +
  labs(title = "title", x = "x label", y = "y label") +
  theme_bw() +
  theme(legend.position = "right")


# add another uncertainty line--------------------------------------------------
ggplot(data = data) +
  # first median line and confidence interval
  geom_ribbon(aes(x = time, ymin = lower, ymax = upper, fill = "min_max"),
              alpha = 0.2) +
  geom_line(aes(x = time, y = median, color = "median")) +
  # add another median line and confidence interval
  geom_ribbon(aes(x = time, ymin = lower - 3, ymax = upper - 3, fill = "new_min_max"),
              alpha = 0.2) +
  geom_line(aes(x = time, y = median - 3, color = "new_median")) +
  # add another line 
  geom_line(aes(x = time, y = median + 2, color = "new_line")) +
  # change color of the first and second confidence interval
  scale_fill_manual(name = "name",
                    values = c("min_max" = "#1E88E5",
                               "new_min_max" = "#d614c0")) +
  # change color of the 3 lines
  scale_color_manual(name = "name",
                     values = c("median" = "#1E88E5",
                                "new_median" = "#d614c0",
                                "new_line" = "#F36013"),
                     breaks = c("median", "new_median", "new_line"))  +
  labs(title = "title", x = "x label", y = "y label") +
  theme_bw() +
  theme(legend.position = "right")

# Save plot (the last plot shown here will be saved)----------------------------
ggsave("C:/examples/plot.pdf", width = 4, height = 2)
