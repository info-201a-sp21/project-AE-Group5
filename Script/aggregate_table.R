library("dplyr")

fossil_fuel_combustion <- read.csv("data/fossil-fuel-primary-energy.csv",
                                   stringsAsFactors = FALSE)

# group by entity
# sorted descending by comparing 1965 and 2019 with abs
aggregated_table <- function(dataset) {
  dataset %>%
    filter(Year == "1965" | Year == "2019") %>%
    filter(Entity != "World") %>%
    group_by(Entity) %>%
    summarise(fossil_fuel_1965 = Fossil.Fuels..TWh.[which(Year == "1965")],
              fossil_fuel_2019 = Fossil.Fuels..TWh.[which(Year == "2019")],
              abuslate_value = abs(fossil_fuel_2019 - fossil_fuel_1965))%>%
    arrange(desc(abouslate_value))
}

Aggregated_table <- aggregated_table(fossil_fuel_combustion)
