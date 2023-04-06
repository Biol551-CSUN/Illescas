### We are practicing with tidy biogeochemistry data from Hawaii to create a new script for lab today ###
### Created by: Sandy Illescas ###
### Updated on: 2023-02-16 ######

###Load Libraries###
library(tidyverse)
library(here)
library(ggthemes)
library(beyonce)
library('devtools')
library(ggplot2)

###############################

ChemData<-read_csv(here("Week_04","Data", "chemicaldata_maunalua.csv"))
View(ChemData)
glimpse(ChemData)


myplot<- ChemData %>% 
  separate(col = Tide_time, # choose the tide time col
           into = c("Tide","Time"), #Separating into two columns for Tide and time
           sep = "_")%>% # separate by _
  filter(complete.cases(.)) %>% # this filters out all n/a's
  filter(Season == "SPRING") %>% # this filters out any measurement not taken in the spring
  select(Zone, Silicate, Tide) %>% # this selects what data we want to keep for our graph
  group_by(Zone,Tide) %>% # this groups the x-axis by zone and y-axis by tide
  summarise(mean_vals = mean(Silicate, na.rm = TRUE))#this creates a mean of all tide values to show on y-axis
  

 
view(myplot)
#######create plot######

p <- ggplot(myplot, aes(Zone, mean_vals)) #this creates a graph 
p +geom_bar(stat = "identity") #this creates a bar graph

ggsave(here("Week_04","Output","MyGraph.png"))

       