library("dplyr")

fossil_fuel_combustion <- read.csv("data/fossil-fuel-primary-energy.csv",
                                   stringsAsFactors = FALSE)

names(fossil_fuel_combustion)[1] <- "country"

# group by entity
# sorted descending by comparing 1965 and 2019 with abs
table <- function(dataset) {
  dataset %>%
    filter(Year == "1965" | Year == "2019") %>%
    filter(country != "World") %>%
    group_by(country) %>%
    summarise(
      fossil_fuel_1965 = Fossil.Fuels..TWh.[which(Year == "1965")],
      fossil_fuel_2019 = Fossil.Fuels..TWh.[which(Year == "2019")],
      abouslate_value = abs(fossil_fuel_2019 - fossil_fuel_1965),
      .groups = "drop"
    ) %>%
    arrange(desc(abouslate_value))
}

aggregated_table <- table(fossil_fuel_combustion)
