# Load ggplot2 library
library(ggplot2)

#ggplot (data = <DATA> ) +                                     # required
#  <GEOM_FUNCTION> (mapping = aes( <MAPPINGS> ),               # required
#                   stat = <STAT> , position = <POSITION> ) +  # -optional
#  <COORDINATE_FUNCTION> +                                     # -optional
#  <FACET_FUNCTION> +                                          # -optional
#  <SCALE_FUNCTION> +                                          # -optional
#  <LABEL, THEME_FUNCTION,...>                                 # -optional

# Read data --------------------------------------------------------------------
data <- read.csv("C:/examples/climate_berlin.txt", header = TRUE, sep = ",")
data$date <- as.Date(data$date, format("%Y-%m-%d"))
data$year <- format(data$date, "%Y")


# Plot t average
ggplot(data = data) +
  geom_line(aes(x = date, y = t_ave, color = t_ave), linewidth = 0.5) +
  #coord_fixed(ratio = 20) +
  facet_grid(rows = vars(year)) +
  scale_color_gradientn(name = "temperature", colors = c("blue", "orange")) +
  labs(title = "Berlin", x = " ", y = "temperature (degree celcious)") +
  theme_bw() +
  theme(legend.position = "right")
  
  
# Plot t_min and t_max as lines
ggplot(data = data) +
  geom_line(aes(x = date, y = t_min, colour = "tmin")) +
  geom_line(aes(x = date, y = t_max, colour = "tmax")) +
  scale_color_manual(name = "temperature",
                     values = c("tmin" = "blue",
                                "tmax" = "red")) +
  labs(title = "Berlin", x = " ", y = "temperature (degree celcious)") +
  theme_bw() +
  theme(legend.position = "right")
  
# Scatter plot t_min with t_max
ggplot(data = data, aes(x = t_min, y = t_max)) +
  geom_point(alpha = 0.4, aes(color = "tmin_tmax")) +
  geom_smooth(method = lm) +
  labs(title = "Berlin", x = " ", y = "temperature (degree celcious)") +
  scale_color_manual(name = "tmin vs. tmax",
                     values = c("tmin_tmax" = "orange")) +
  theme_bw() +
  theme(legend.position = "right")

