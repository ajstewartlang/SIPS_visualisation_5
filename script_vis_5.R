library(ggplot2)
library(readr)
library(dplyr)
library(magrittr)
library(ggthemes)
library(stringr)
library(tools)

full_trains <- read_csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2019/2019-02-26/full_trains.csv")

# Visualisation 5 ####
full_trains %>%
  filter(year == 2017) %>%
  filter(service == "International") %>%
  mutate(departure_station = toTitleCase(tolower(departure_station))) %>%
  mutate(departure_station = reorder(departure_station, num_late_at_departure)) %>%
  ggplot(aes(x = departure_station, y = num_late_at_departure, 
             colour = departure_station)) +
  geom_boxplot() +
  guides(colour = FALSE) +
  coord_flip() +
  labs(title = "International SNCF Trains Departing Late in 2017",
       subtitle = "By Departure Station")  +
  scale_color_colorblind() +
  theme_fivethirtyeight() 
