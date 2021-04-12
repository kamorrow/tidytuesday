#tidytuesday - 2019-10-22

library(tidyverse)
library(ggridges)

horror_movies <- readr::read_csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2019/2019-10-22/horror_movies.csv") %>%
  separate(movie_run_time, c("run_time", "run_time_units"), sep = " ") %>%
  as.numeric()
  

ggplot(data = horror_movies, aes(x = language, y = run_time)) +
  geom_point()
