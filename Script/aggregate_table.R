library("dplyr")

fossil_fuel_combustion <- read.csv("data/fossil-fuel-primary-energy.csv",
                                   stringsAsFactors = FALSE)

# group by entity
# sorted descending by comparing 1965 and 2019 with abs
table <- function(dataset) {
  a_table <- dataset %>%
    filter(Year == "1965" | Year == "2019") %>%
    filter(Entity != "World") %>%
    group_by(Entity) %>%
    summarise(
      fossil_fuel_1965 = Fossil.Fuels..TWh.[which(Year == "1965")],
      fossil_fuel_2019 = Fossil.Fuels..TWh.[which(Year == "2019")],
      absolute_value = abs(fossil_fuel_2019 - fossil_fuel_1965),
    ) %>%
    arrange(desc(absolute_value)) %>% 
    rename("Fossil fuel 1965" = fossil_fuel_1965,
           "Fossil fuel 2019" = fossil_fuel_2019,
           "Absolute value" = absolute_value,
           "Country" = Entity
    ) 
    return(a_table)
}

aggregated_table <- table(fossil_fuel_combustion)
