library(ggplot2)
library(plotly)

fossil_fuel_combustion <- read.csv("data/fossil-fuel-primary-energy.csv",
                                   stringsAsFactors = FALSE)


pie_chart <- function(dataset) {
<<<<<<< HEAD
  pie_chart_info <- dataset %>%
    filter(Entity != "World") %>%
    filter(Year == "2019") %>%
    select(Year, Entity, Fossil.Fuels..TWh.)
  
  ggplot(pie_chart_info) +
    geom_col(
      mapping = aes(x = Entity, y = Fossil.Fuels..TWh., fill = Year),
      width = 0.8
    ) +
    scale_fill_gradient(low = "gray", high = "red") +
    labs(
      title = "2019 Fossil Fuel Consumption Broken Down",
      x = "Country",
      y = "Fossil Fuels (TWh)"
    ) +
    coord_polar()
=======
  fig <- plot_ly(dataset, labels = ~Entity, values = ~1, type = "pie")
  fig <- fig %>% layout(title = "2019 Fossil Fuel Usage Breakdown",
                        xaxis = list(showgrid = FALSE,
                                     zeroline = FALSE,
                                     showticklabels = FALSE),
                        yaxis = list(showgrid = FALSE,
                                     zeroline = FALSE,
                                     showticklabels = FALSE))
>>>>>>> 7c6251dbc9d762403304ddbb256801c2751ce141
}

pie_plot <- pie_chart(fossil_fuel_combustion)
