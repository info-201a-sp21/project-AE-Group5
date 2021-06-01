library(dplyr)
library(ggplot2)
library(plotly)

fossil_fuel <- read.csv("fossil-fuel-primary-energy.csv")

create_scatter <- function(data, search) {
  data <- data %>%
    filter(Entity == search)
  
  p <- ggplot(data = data) +
    geom_point(mapping = aes(x = Year, y = Fossil.Fuels..TWh.)) +
    labs(title = paste0("Fossil Fuel Combustion in ", data$Entity),
         x = "Year", y = "Fossil Fuel Combustion")
  p <- ggplotly(p)
  return(p)
}



server <- function(input, output) {
  output$scatterPlot <- renderPlotly(
      return(create_scatter(fossil_fuel, input$search))
  )
}
