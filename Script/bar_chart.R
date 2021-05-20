
# Bar chart
library("dplyr")
library("ggplot2")


fossil_fuel_combustion <- read.csv("data/fossil-fuel-primary-energy.csv",
  stringsAsFactors = FALSE
)
names(fossil_fuel_combustion)[1] <- "country"


bar_chart <- function(dataset) {
  bar_chart_info <- dataset %>%
    filter(country != "World") %>%
    filter(Year == "1965" | Year == "1992" | Year == "2019") %>%
    select(Year, country, Fossil.Fuels..TWh.)

  ggplot(bar_chart_info) +
    geom_col(
      mapping = aes(x = country, y = Fossil.Fuels..TWh., fill = Year),
      width = 0.8
    ) +
    scale_fill_gradient(low = "darkgray", high = "darkred") +
    labs(
      title = " Fossil Fuels Combustion from 1965, 1992 and 2019 by Country",
      x = "Country",
      y = "Fossil Fuels (TWh)"
    ) +
    coord_flip()
}

bar_chart(fossil_fuel_combustion)
