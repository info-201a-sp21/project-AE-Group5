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
    plot that shows the world's data (which is the default value). The
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
Map_sidebar_content <- sidebarPanel(
  selectInput(
    "select", label = "Year", 
    choices = temperature_change$year
  ),
  
)
map_main_content <- mainPanel(
  p("This is the interactive map which display the earth surface temperature 
  change by comparing countries in different years. Through this map, we can have 
  a better idea of climate trends in 50 years from 1963-2013."),
  plotlyOutput("map"),
  h5("Insights:"),
  h6("- The general global trend of earth surface temperature is increasing."),
  h6("- The developed countries' earth surface temperature relatively have more 
  increase than deloping countires.")
)

map_panel <- tabPanel(
  "Earth Surface Temperature",
  titlePanel("Earth Surface Temperature"),
  sidebarLayout(
    Map_sidebar_content,
    map_main_content
  )
)


# Interactive Bar plot
barplot_sidebar_content <- sidebarPanel(
  selectInput(
    inputId = "plotSearch",
    label = "Find a country (capitalize the first letter)",
    choices = unique(forest_loss$Entity)
  )
)


barplot_main_content <- mainPanel(
  p("This is an interactive bar plot that shows the net change of forest area 
  globally as well as in different countries in the wolrd, and it is divided into 
  10 year periods to deal with the volatility of changes. The trend of deforestation
  is varied in different countries, but the world's data demonstrates that the amount
  of forest loss is decreasing over the years."),
  plotlyOutput("barPlot"),
  h5("Insights:"),
  h6("- The amount of deforestation is decreasing globally."),
  h6("- Bigger countries with higher populations have a greater rate of deforestation.")
)

barplot_panel <- tabPanel(
  "Forest Loss",
  titlePanel("Forest Loss"),
  sidebarLayout(
    barplot_main_content,
    barplot_sidebar_content
  )
)

#Summary
summary_page <- tabPanel(
  title = "Takeways",
  titlePanel("Key Takeways"),
  h2("Fossil Fuel Combustion"),
  hr(),
  p("Through this scatterplot, the trend of fossil fuel combustion spending is 
  general global increasing among years. China and the United States are the two 
    countries increasing fossil fuel combustion spending from 1965 to 2019. 
    Besides, China has three times more spending increase than the United States. 
    Interestingly, United States' fossil fuel combustion spending the highest 
    year in 2000, and it starts to decrease slightly, while China's fossil fuel 
    combustion spending start dramatically increasing after 2000. By discovering
    the data from this page, it helps us gain insight that the burning fossil 
    still is used in many countries, and the idea of eco-friendly lack of supported.
    "),
  br(),
  h3("China Fossil Fuel Combustion Trend"),
  img(src = "CHINA.png", height = 350, width = 550),
  h3("USA Fossil Fuel Combustion Trend"),
  img(src = "US.png", height = 350, width = 550),
  h2("Earth Surface Temperature"),
  hr(),
  p("This map shows that the map is global earth surface temperature  is 
  generally increasing. Overall, the global temperature increases around 0.5 to 
  1 Celsius in 50 years. Besides, the interactive map shows how the earth's 
  temperature changes in a specific country. For examples,
  the United States average temperature in 1964 was -3.196 Celsius, -2.155 in 2013.
    Russian, average temperature was -24.793 in 1964 and -24.229 in 2013. 
    This page of the map brings us a clear idea of how the earth temperature 
    change in countries or global, climate change trend is harmful to the environment,
    and we predict that the fossil fuel combustion spending can be one of the 
    factors that cause surface temperature increase."),
  br(),
  h3("Earth Surface Temperature in 1964"),
  img(src = "1964.jpg", height = 350, width = 550),
  h3("Earth Surface Temperature in 2013"),
  img(src = "2013.jpg", height = 350, width = 550),
  h2("Deforestation Trend"),
  hr(),
  p(" The bar plot shows that the overall trend of deforestation is decreasing. 
  The amount of forest loss has reduced by about 5 to 6 million trees over two decades.
  The world's data for deforestation was at about 15-16 million in 1990 and it 
  decreases to 10-11 million in 2020. Big countries such as China, Mexico and Canada 
  are reducing the deforesation levels but to varying degrees. Some countries like China
  decreased at lower level than countries like Canada. Through the bar plot, we learned
  that deforestation is still occuring in many countries, but overall it has decreased worldwide.
  Knowing this information helps us to analyze the amount of deforestation in each country and how 
  different countries contribute to the global climate change."),
  br(),
  h3("Global Deforestation"),
  img(src = "globaldeforestation.jpg", height = 350, width = 550),
  h3("China Deforestation"),
  img(src = "chinadeforestation.jpg", height = 350, width = 550),
)


ui <- fluidPage(
  includeCSS("style.css"),
  navbarPage(
  "Climate Change",
  intro_panel,
  map_panel,
  scatter_panel,
  barplot_panel,
  summary_page)
)

