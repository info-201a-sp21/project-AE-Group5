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

#function 
    server <- function(input,output) {
      output$map <- renderPlotly({
        
        l <- list(color = toRGB("grey"), width = 0.2)
        
        g <- list(
          showframe = FALSE,
          showcoastlines = FALSE,
          projection = list(type = 'Mercator')
        )
        
        fig <- plot_geo(temperature_change, locationmode = "country names") %>% 
          add_trace(
            z = ~AverageTemperature, color = ~AverageTemperature, colors = "Blues",
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

   