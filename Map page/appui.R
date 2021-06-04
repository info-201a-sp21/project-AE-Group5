#Interactive map design

#map_design
Map_sidebar_content1 <- sidebarPanel(
selectInput(
  "select", label = "Year", 
  choices = temperature_change$year,
  selected =temperature_change$year[,4]
),

)
map_main_content <- mainPanel(
  p("This is the interactive map which display the earth surface temperature 
  change by comparing countries in different years.Through this map, it show us 
  a better idea of climate trends in 50 years."),
  plotlyOutput("map"),
  h5("Insights:"),
  h6("- The general global trend of earth surface temperature is increasing."),
  h6("- The develpoed countires' earth surface temperature relatively have more 
  increase than deloping countires.")
)

map_panel <- tabPanel(
  "Earth Surface Temperature",
  titlePanel("Earth Surface Temperature"),
  sidebarLayout(
    Map_sidebar_content1,
    map_main_content
  )
)

ui <- navbarPage(
  "Earth Surface Temperature",
  map_panel
)
