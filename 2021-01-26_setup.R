#-----------------
# SETUP
#-----------------

# Get the Data

# Read in with tidytuesdayR package 
# Install from CRAN via: install.packages("tidytuesdayR")
# This loads the readme and all the datasets for the week of interest

# Either ISO-8601 date or year/week works!

tuesdata <- tidytuesdayR::tt_load('2021-01-26')
tuesdata <- tidytuesdayR::tt_load(2021, week = 5)

plastics <- tuesdata$plastics

# Or read in the data manually

plastics <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-01-26/plastics.csv')

#-----------------
# Libraries
#-----------------
library(tidyverse)

#-----------------
# Plastic Key
#-----------------

# hdpe
# High density polyethylene
# ldpe
# Low density polyethylene
# o
# Category marked other
# pet
# Polyester plastic
# pp
# Polypropylene
# ps
# Polystyrene
# pvc
# PVC plastic

#-----------------
# Coke vs. Pepsi
#-----------------

pepsi <- plastics %>%
  filter(parent_company == 'PepsiCo')

pepsi_long <- pepsi %>%
  pivot_longer(cols = c(4:12), names_to = "plastic_type") %>%
  filter(plastic_type != "grand_total") %>%
  group_by(plastic_type) %>%
  summarise()

coke <- plastics %>%
  filter(parent_company == 'The Coca-Cola Company')

coke_long <- coke %>%
  pivot_longer(cols = c(4:12), names_to = "plastic_type")

ggplot(data = pepsi_long) +
  geom_point(aes(x = plastic_type,
               y = value),
             color = "blue")

ggplot(data = coke_long) +
  geom_point(aes(x = plastic_type,
                 y = value),
             color = "red")


