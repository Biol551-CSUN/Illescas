#Created by: Sandy Illescas
#Created on: 2023-02-09
####################################

### Load Libraries #######

library(palmerpenguins)
library(tidyverse)
library(here)
library('devtools')
library(beyonce)
library(praise)
library(ggthemes)
####################################

###Load Data ###
###The data is part of the penguin data, we are not creating a new data set###
glimpse(penguins)

plot1<-ggplot(data=penguins,
       mapping = aes(x = bill_depth_mm,
                     y = bill_length_mm,
                     group = species,
                     color = species)) +


geom_point() +
  geom_smooth(method = "lm")+
labs(x = "Bill Depth (mm)",
     y = "Bill Length (mm)",
     ) +
  scale_colour_viridis_d() +
  scale_x_continuous(breaks = c(14,17,21),
                     labels = c("low", "medium", "high")) +
  scale_color_manual(values = beyonce_palette(9)) +
  coord_polar("x")+
theme(axis.title = element_text(size = 20,
                                color = "Dark Blue"),
      panel.background = element_rect(fill = "light blue")) 
praise()

ggsave(here("Week_03", "Output", "penguin.png"),
       width = 7, height = 5) ### numbers are in inches
  

    