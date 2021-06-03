library(dplyr)
library(plotly)
library(ggplot2)

df <- read.csv("GlobalLandTemperaturesByCountry.csv")

temperature_change <-  df %>%
  mutate(year =
           format(as.Date(df$dt),format = "%Y"
           )) %>% 
  filter(year %in% 1964:2013) %>%
  group_by(Country) %>% 
  filter (!duplicated(year)) %>% 
  select(Country, year, AverageTemperature)

#map function
create_map <- function(data, map.var) {
  
    l <- list(color = toRGB("grey"), width = 0.2)
    g <- list(
      showframe = FALSE,
      showcoastlines = FALSE,
      projection = list(type = 'Mercator')
    )
    
#function 
    server <- function(input,output)
      output$map <- renderPlotly({
        
        l <- list(color = toRGB("grey"), width = 0.2)
        
        g <- list(
          showframe = FALSE,
          showcoastlines = FALSE,
          projection = list(type = 'Mercator')
        )
        
        fig <- plot_geo(temperature_change, locationmode = "country names") %>% 
          add_trace(
            z = ~input$select, color = ~input$select, colors = "Blues",
            text = ~Country, locations = ~Country, marker = list(line = l)
          ) %>% 
          colorbar(title = "Average Temperature") %>% 
          layout(
            title = paste0("Global Average Temperature in",input$select),
            geo = g
          )
        return(fig)
      })
}
    
   