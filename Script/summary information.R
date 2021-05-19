# Summary information

rm(list = ls())

library(dplyr)
library(lintr)


fossil_fuel_combustion <- read.csv("data/fossil-fuel-primary-energy.csv")

get_summary_info <- function(dataset) {
  result <- list()

  # Which year has the highest fossil fuels?
  result$year_highest_ff <- dataset %>%
    group_by(Year) %>%
    summarize(total_combustion = sum(Fossil.Fuels..TWh.)) %>%
    filter(total_combustion == max(total_combustion)) %>%
    pull(Year)

  # Which year has the lowest fossil fuels?
  result$year_lowest_ff <- dataset %>%
    group_by(Year) %>%
    summarize(total_combustion = sum(Fossil.Fuels..TWh.)) %>%
    filter(total_combustion == min(total_combustion)) %>%
    pull(Year)

  # Which country has the highest fossil fuels in 2019?
  result$country_highest_ff_2019 <- dataset %>%
    filter(Year == "2019") %>%
    filter(Entity != "World") %>%
    filter(Fossil.Fuels..TWh. == max(Fossil.Fuels..TWh.)) %>%
    pull(Entity)

  # What is the mean of fossil fuels in 1965 and 2019?
  result$mean_ff <- dataset %>%
    summarize(mean_ff = mean(Fossil.Fuels..TWh.)) %>%
    pull(mean_ff)

  # Which country has the highest absolute fossil fuels between 1965 and 2019?
  result$country_highest_abs_ff <- fossil_fuel_combustion %>%
    filter(Year == "1965" | Year == "2019") %>%
    filter(Entity != "World") %>%
    group_by(Entity) %>%
    summarise(ff_1965 = Fossil.Fuels..TWh.[which(Year == "1965")],
              ff_2019 = Fossil.Fuels..TWh.[which(Year == "2019")],
              abs_value = ff_2019 - ff_1965, .groups = "drop") %>%
    filter(abs_value == max(abs_value)) %>%
    pull(Entity)

  return(result)
}

summary_info <- get_summary_info(fossil_fuel_combustion)
