
# Introduction page

intro_sidebar_content <- sidebarPanel(
  h4("What Is Climate Change?"),
  p("  Climate change includes both global warming driven by human-induced
    emissions of greenhouse gases and the resulting large-scale shifts in
    weather patterns."),
  p("To cope with this problem, Paris Aggrement was signed by
    nations to maintain the temperature well under 2.0 ¡ãC (3.6 ¡ãF) in 2015.
    However, the temperature is sitll higher than this value now."),
  p("(Cited from Wikipedia)")
  
)

intro_main_content <- mainPanel(
  h2("Climate Change"),
  h3("Why This Matters?"),
  p("Environmental issues are becoming more and more severe in the present
    world. One of the factors that cause the deterioration of the environment
    is human activities. We want to find out how the human¡¯s actions impact the
    environment and what are the potential dangers it brings to the future.
    Climate change is one of the most serious problem that needs to be solved
    as soon as possible."),
  h3("Research Questions:")
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
  h3("Insights:"),
  h4("- The amount of fossil fuel combustion increases."),
  h4("- There are some fluctuations in each country, but the overall trend
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

ui <- navbarPage(
  "Climate Change",
  intro_panel,
  scatter_panel
)
