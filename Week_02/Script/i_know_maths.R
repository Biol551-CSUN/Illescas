#Created by: Sandy Illescas
#Created on: 2023-02-02
####################################

### Load Libraries #######
library(tidyverse)
library(here)

### Read in data #######
WeightData <- read_csv(here("Week_02","Data","weightdata.csv"))

### Data Analysis #######
head(WeightData)
tail(WeightData)
view(WeightData)
