#tidytuesday
# 2019-11-05
# Keene Morrow

#-----------------
# 1. Read in data
#-----------------

library(tidyverse)
library(rgdal)
library(usmap)

commute_mode <- readr::read_csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2019/2019-11-05/commute.csv")

state_commute <- commute_mode %>% 
  group_by(state, mode) %>%
  summarize(percent = mean(percent))

state_bike <- state_commute %>%
  filter(mode == "Bike")

state_walk <- state_commute %>%
  filter(mode == "Walk")

#-----------------
# 2. Read in US States Shape File
#-----------------

# US_states <- readOGR(
#   dsn = paste0(getwd(), here::here("US_States_Spatial")),
#   layer = "states.shp",
#   verbose = FALSE
# )

plot_usmap(data = state_bike,
           values = "percent")

plot_usmap(data = state_walk,
           values = "percent")
