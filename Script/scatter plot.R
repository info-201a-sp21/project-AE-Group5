# Scatter plot

# This plot attempts to express the relationship between the year and fossil
# fuel combustion around the world, and the scatter plot can help to visualize
# the trend.
# It demonstrates that as the year increases, the amount of fossil fuel
# combustion also increases. Although there are fluctuations, the overall trend
# is increasing.

rm(list = ls())

library(dplyr)
library(lintr)
library(ggplot2)


fossil_fuel_combustion <- read.csv("data/fossil-fuel-primary-energy.csv",
                                   stringsAsFactors = FALSE)

scatter_plot_chart <- function(dataset) {
  ff_world_average <- dataset %>%
    filter(Entity == "World")

  ggplot(data = ff_world_average) +
    geom_point(mapping = aes(x = Year, y = Fossil.Fuels..TWh.)) +
    labs(title = "Fossil Fuel Combustion from 1965 to 2019 Around The World",
         x = "Year", y = "Fossil Fuels")
}

scatter_plot_chart(fossil_fuel_combustion)
