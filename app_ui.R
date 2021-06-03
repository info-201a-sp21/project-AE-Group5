# Introduction page

intro_sidebar_content <- sidebarPanel(
  h4("What Is Climate Change?"),
  p("  Climate change includes both global warming driven by human-induced
    emissions of greenhouse gases and the resulting large-scale shifts in
    weather patterns."),
  p("To cope with this problem, Paris Aggrement was signed by
    nations to maintain the temperature well under 2.0 Celsius (3.6 Fahrenheit) in 2015.
    However, the temperature is sitll higher than this value now."),
  p("(Cited from Wikipedia)")
  
)

intro_main_content <- mainPanel(
  h2("Climate Change"),
  img(src = "climate-crisis-classes.jpg", height = 350, width = 550),
  h3("Why This Matters?"),
  p("Environmental issues are becoming more and more severe in the present
    world. One of the factors that cause the deterioration of the environment
    is human activities. We want to find out how the human??s actions impact the
    environment and what are the potential dangers it brings to the future.
    Climate change is one of the most serious problem that needs to be solved
    as soon as possible."),
  h3("The Source of Data:"),
  p("In our research, we use three different datasets. The datasets of forest
    loss and fossil fuel combustion are downloaded from the website called
    Our World in Data, and the dataset of temperature change comes from 
    Kaggle." ),
  h3("Research Questions:"),
  h4("How is temperature change during these years?"),
  h4("How does human activities impact the envrionment?")
)

intro_panel <- tabPanel(
  "Introduction",
  sidebarLayout(
    intro_sidebar_content,
    intro_main_content
  )
)


# Interactive Scatter plot tab

scatter_sidebar_content <- sidebarPanel(
  textInput(
    inputId = "search",
    label = "Find a country (capitalize the first letter)",
    value = "World"
  )
)

scatter_main_content <- mainPanel(
  p("Fossil fuel conbustion is one of the human activity that increase the
    CO2 emssion, leading to serious envrironmental issues."),
  p("This scatter attempts to show the trend of fossil fuel combustion change.
    The plot is made to sort by different countries, and it can also make a
    plot that shows the world's data (whihc is the defalt value). The
    scatter plot demonstrates an increasing trend of fossil fuel combustion."),
  plotlyOutput("scatterPlot"),
  h5("Insights:"),
  h6("- The amount of fossil fuel combustion increases."),
  h6("- There are some fluctuations in each country, but the overall trend
     is increasing from 1965 to 2019.")
)

scatter_panel <- tabPanel(
  "Fossil Fuel Combustion",
  titlePanel("Fossil Fuel Combustion"),
  sidebarLayout(
    scatter_sidebar_content,
    scatter_main_content
  )
)


#Interactive map design

#map_design
Map_sidebar_content1 <- sidebarPanel(
  selectInput(
    "select", label = "Year", 
    choices = temperature_change$year
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

ui <- fluidPage(
  includeCSS("style.css"),
  navbarPage(
  "Climate Change",
  intro_panel,
  map_panel,
  scatter_panel)
)