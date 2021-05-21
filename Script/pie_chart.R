library(ggplot2)
library(plotly)

fossil_fuel_combustion <- read.csv("data/fossil-fuel-primary-energy.csv",
                                   stringsAsFactors = FALSE)

only_2019 <- fossil_fuel_combustion %>%
  filter(Year == "2019")

pie_chart <- function(dataset) {
  fig <- plot_ly(dataset, labels = ~, values = ~1, type = "pie")
  fig <- fig %>% layout(title = "2019 Fossil Fuel Usage Breakdown",
                        xaxis = list(showgrid = FALSE,
                                     zeroline = FALSE,
                                     showticklabels = FALSE),
                        yaxis = list(showgrid = FALSE,
                                     zeroline = FALSE,
                                     showticklabels = FALSE))
}

pie_plot <- pie_chart(fossil_fuel_combustion)