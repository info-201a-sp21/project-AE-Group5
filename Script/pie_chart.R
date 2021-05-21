library(ggplot2)
library(plotly)

pie_chart <- function(dataset) {
  fig <- plot_ly(dataset, labels = ~intent, values = ~1, type = "pie")
  fig <- fig %>% layout(title = "2019 Fossil Fuel Usage Breakdown",
                        xaxis = list(showgrid = FALSE,
                                     zeroline = FALSE,
                                     showticklabels = FALSE),
                        yaxis = list(showgrid = FALSE,
                                     zeroline = FALSE,
                                     showticklabels = FALSE))
}

pie_plot <- pie_chart(fossil_fuel_combustion)