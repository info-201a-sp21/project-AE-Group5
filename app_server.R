library(dplyr)
library(ggplot2)
library(plotly)


fossil_fuel <- read.csv("data/fossil-fuel-primary-energy.csv")

df <- read.csv("data/GlobalLandTemperaturesByCountry.csv")

temperature_change <-  df %>%
  mutate(year =
           format(as.Date(df$dt),format = "%Y"
           )) %>% 
  filter(year %in% 1963:2013) %>%
  group_by(Country) %>% 
  filter (!duplicated(year)) %>% 
  select(Country, year, AverageTemperature)


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
  # page 1
  output$scatterPlot <- renderPlotly(
    return(create_scatter(fossil_fuel, input$search))
  )
  
  # page 2
  output$map <- renderPlotly({
    
    l <- list(color = toRGB("grey"), width = 0.2)
    
    g <- list(
      showframe = FALSE,
      showcoastlines = FALSE,
      projection = list(type = 'Mercator')
    )
    
    temperature_change <- temperature_change %>%
      filter(year == input$select)
    
    fig <- plot_geo(temperature_change, locationmode = "country names") %>% 
      add_trace(
        z = ~AverageTemperature, color = ~AverageTemperature, colors = "Blues",
        text = ~Country, locations = ~Country, marker = list(line = l)
      ) %>% 
      colorbar(title = "Average Temperature", tickprefix = "ºC") %>% 
      layout(
        title = paste0("Global Average Temperature in",input$select),
        geo = g
      )
    return(fig)
  })
  
}


