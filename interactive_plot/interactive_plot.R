install.packages("ggplot2")       # Static plot
install.packages("plotly")        # Interactive plot
install.packages("gapminder")     # Example data

library(ggplot2)
library(plotly)
library(gapminder)

p <- ggplot(gapminder[gapminder$year == 1977,]) +
  geom_point(aes(gdpPercap, lifeExp, size = pop, color=continent),
             alpha = 0.5) +
  theme_bw()

ggplotly(p)
