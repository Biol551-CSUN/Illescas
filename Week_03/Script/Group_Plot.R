#Created by: Sandy Illescas
#Created on: 2023-02-09
#Group graphing project
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


p3<-ggplot() + 
       geom_density(data = penguins, aes(x = flipper_length_mm, 
                        fill = island),
                    colour = NA) +

            facet_grid(rows = vars(island)) +
         labs(title = "Density of Flipper Length According to Island",
     x = "Flipper Length (mm)",
     y = "Density") +
 theme(axis.title = element_text(size = 20,
                                  color = "Dark Blue"),
        panel.background = element_rect(fill = "light blue")) +
 
   guides(fill = FALSE) +     
   scale_fill_manual(values = beyonce_palette(9))


p3
ggsave(here("Week_03", "Output", "Group_Penguin_plot.png")

       