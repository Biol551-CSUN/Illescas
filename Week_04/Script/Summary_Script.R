### We are practicing with tidy biogeochemistry data from Hawaii ###
### Created by: Sandy Illescas ###
### Updated on: 2023-02-16 ######

###Load Libraries###
library(tidyverse)
library(tidyquant)
library(ggdist)
library(here)


###Load Data ###
ChemData <- read.csv(here("Week_04","Data","chemicaldata_maunalua.csv"))
View(ChemData)
glimpse(ChemData)

ChemData_clean <- ChemData %>%
  filter(complete.cases(.)) # Filters out everything that is not a complete row!
View(ChemData_clean)

ChemData_clean <- ChemData %>%
  drop_na() %>% # this filters out everything that contains NA
separate (col = Tide_time, # chooses the tide time column
          into = c("Tide", "Time"),# separate it into two columns Tide and time
          sep = "_", ## separate by
        #This deletes the original column and creates two new ones.  If we wanted to keep it we would add: remove = FALSE
          remove = FALSE) %>%
unite (col = "Site_Zone", # This is going to unite 1 or more columns and when you use "" you are assigning a new name to your column. 
        c (Site,Zone), # This is choosing what columns to unite.
        sep = ".",     # This lets you put a . in the middle. 
        remove = FALSE) # This keeps the original column. 
ChemData_long <-ChemData_clean %>%
  pivot_longer(cols = Temp_in:percent_sgd, # the cols you want to pivot, this says select the temp to percent SGD cols
               names_to = "Variables", # the names of the new cols with all the column names.
               values_to = "Values")

ChemData_long %>%
  group_by(Variables, Site) %>% #group by everything we want
  summarise(Param_means = mean(Values, na.rm = TRUE), # this gets the mean
            Param_vars = var(Values, na.rm = TRUE))   # this gets the variance

ChemData_long %>%
  ggplot(aes(x = Site, y = Values))+
  geom_boxplot()+
  facet_wrap(~Variables, scales = "free") # scales = "free allows the axis to determine the best scale of values for each plot. 
ChemData_wide <- ChemData_long %>%
  pivot_wider(names_from = Variables, # column with the names for the new columns
              values_from = Values)    #column with the values. 

ChemData_clean <- ChemData %>%
  drop_na() %>%  #filters out everything that is not a complete row
  separate(col = Tide_time, # this chooses the tide time col
           into = c("Tide", "Time"),# separate it into two columns Tide and time
           sep = "_",  #this separates by _
           remove = FALSE) %>%
  pivot_longer(cols = Temp_in:percent_sgd, # this lets you choose the columns you want to pivot.  This says select the temp to percent SGD cols
               names_to = "Variables", # the names of the new columns with all the column names
               values_to = "Values")  %>%
  group_by(Variables, Site, Time) %>%
  
  summarise (mean_vals = mean(Values, na.rm = TRUE)) %>%
  pivot_wider(names_from = Variables, 
              values_from = mean_vals) %>%# now mean_vals is the col name


########## Here we will export as a csv file to our output folder in week 4 ##########

write_csv(here("Week_04", "Output", "summary.csv")) # export as csv to output folder

