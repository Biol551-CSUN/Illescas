### Today we are going to plot penguin data ###
### Created by: Sandy Illescas ###############
### Updated on 2023-2-28 #####################

#### Load Libraries ####
library(palmerpenguins)
library(tidyverse)
library(here)
library(dadjokeapi)

### Load data ###
# The data is part of the package and is called penguins
glimpse(penguins)

#### Working with dplyr ###

filter(.data = penguins,
       sex == "female") # dumps anything that is not female.

filter(.data = penguins, 
       year == 2008) # this filters data to only contain 2008 data collection

filter(.data = penguins, 
       body_mass_g > 5000) # this will only keep body mass more than 5000

filter(.data = penguins, 
       sex == "female", 
       body_mass_g > 5000) # this is how we stack our preferences just using a comma in between

filter(.data = penguins,
       year == 2008 | year == 2009) # this allows us to choose either values in a column instead of just one.
                                      ## a cleaner way to do this is also island %in% c("Dream, "Biscoe") 

filter (.data = penguins,
        island != "Dream") # dont forget to put quotes for labels directly in column.

filter(.data = penguins,
       species == "Adelie" & year == 2008) # this requires data to meet both conditions

data2 <- mutate(.data = penguins, 
       body_mass_kg = body_mass_g/1000,
       Ratio_depth_to_length = bill_depth_mm/bill_length_mm)

data3 <- mutate(.data = penguins, 
                after_2008 = ifelse(year>2008, "After 2008", "Before 2008"))

data4 <- mutate(.data = penguins, 
                FlipperLength_and_Body_Mass = flipper_length_mm + body_mass_g)

data5 <- mutate(.data = penguins,
         Bigness = ifelse(body_mass_g > 4000, "Big", "Small"))      

view(data5) 

penguins %>%  # this calls penguin dataset to work with 
  filter(sex == "female") %>%  # keeps only female data
  mutate(log_mass = log(body_mass_g)) %>% # calculate log biomas
  select(Species = species, Island = island, Sex = sex, 'Log(mass)' = log_mass) # This lets us rename columns at the same time! :)

penguins %>% 
  drop_na(sex) %>% 
  group_by(island, species) %>% 
  summarise(mean_flipper = mean(flipper_length_mm, na.rm = TRUE),
            min_flipper = min(flipper_length_mm, na.rm = TRUE),# na.rm = TRUE allows us to leave out mean calculations for N/As for this specific column.
            sd_flipper = sd(flipper_length_mm, na.rm = TRUE))

penguins %>% 
  drop_na(sex) %>%
  ggplot(aes(x = sex, 
           y = flipper_length_mm)) +
  geom_boxplot()
 
groan()
