

# Load Libraries
library(tidyverse)
library(datapasta)
library(reprex)

# Load Data
data(penguins, package = "palmerpenguins")

# Make Buggy Function
#Calculate the Average Body Mass

calculate_average <- function(data) {
  total <- sum(data$body_mass_g)
  count <- length(data$body_mass_g)
  
  average <- total * count  # Bug: incorrect calculation, instead of dividing by the count, it is multiplying the count
  
  return(average)
}

# Test the Function and Reproduce 
# Here we will be using "datapasta" and "reprex"

result <- calculate_average(penguins) 
result #this calls back our result

print(result) # print the result

# use datapasta to create reproducible code
df_paste <- dpasta(result)

# use reprex to create reproducible example
reprex(df_paste)

sessionInfo()
