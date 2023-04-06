### Today we are going to use Maunalua Chemistry Data ###
### Created by: Sandy Illescas ###############
### Updated on 2023-3-9 #####################

#######Load Libraries######
library(ggmap)
library(tidyverse)
library(here)
library(ggsn)

###########################


Oahu <- get_map("Oahu")

ggmap(Oahu)
