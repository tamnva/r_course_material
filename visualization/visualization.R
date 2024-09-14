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

# plot with ggplot -------------------------------------------------------------
ggplot(data = data) + 
  geom_line(aes(x = date, y = t_ave, color = t_ave), linewidth = 0.5) +
  coord_fixed(ratio = 10) +
  facet_grid(row = vars(year)) +
  scale_colour_gradientn(name = "temperature", colours = c("blue",  "orange")) +
  labs(x = " ", y = "temperature") +
  theme(legend.position = "top")

ggsave(filename = "C:/examples/myplot.pdf", width = 6, height = 4)

