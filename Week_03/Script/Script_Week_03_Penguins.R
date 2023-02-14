#Created by: Sandy Illescas
#Created on: 2023-02-07
####################################

### Load Libraries #######

library(palmerpenguins)
library(tidyverse)

####################################
glimpse(penguins)

ggplot(data=penguins,
       mapping = aes(x = bill_depth_mm,
                     y = bill_length_mm,
                     color = species,      ### color = (column name) gives color to different variables in that given column.
                     shape = island,       ### shape = (column name) gives color to different variables in that given column.
                     size = body_mass_g,
                     alpha = flipper_length_mm)) +  ### alpha makes points transparent so we can see where they populate on top of eachother. 
  geom_point() +
  labs(title = "Bill Depth and Length",
       subtitle = "Dimensions for Adelie, Chinstrap, and Gentoo Penguins", 
       x = "Bill Depth (mm)",
       y = "Bill Depth (mm)",
       color = "Species of Penguins",
       caption = "Source: Palmer Station LTER / palmerpenguins package",
       shape = "Island",
       size = "Body Mass",
       alpha = "Flipper Length") +
  scale_color_viridis_d() +
facet_grid(sex~species) +                   ###facet_grid (variable1~variable2) gives us a grid comparing the two.
facet_wrap(~species)  +                     ###facet_wrap (~variable) creates columns of different variables of that given column. 
facet_wrap(~species, ncol=1) +              ### adding ncol=1 creates a single column to see your facets. This number can be changed. 
  
  
  guides(color = FALSE)                     ### gets rid of color legend since we don't need it anymore due to facets. 

