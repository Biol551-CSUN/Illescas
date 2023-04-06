########Created by Sandy Illescas ##########
####### Date created 2023-04-04 ###########
####Load Libraries#####
library(tidyverse)
library(palmerpenguins)
library(PNWColors)  ###for color pallette
library(emokid)


df <-  tibble::tibble(
  a = rnorm(10), # draws 10 random values froma normal distribution
  b = rnorm(10),
  c = rnorm(10),
  d = rnorm(10)
)

head(df)

df<-df %>%
  mutate(a = (a-min(a, na.rm = TRUE))/(max(a, na.rm = TRUE)-min(a, na.rm = TRUE)),
         b = (b-min(b, na.rm = TRUE))/(max(b, na.rm = TRUE)-min(b, na.rm = TRUE)),
         c = (c-min(c, na.rm = TRUE))/(max(c, na.rm = TRUE)-min(c, na.rm = TRUE)),
         d = (d-min(d, na.rm = TRUE))/(max(d, na.rm = TRUE)-min(d, na.rm = TRUE)))

rescale01 <- function(x) {
  value <- (x-min(x, na.rm = TRUE))/(max(x, na.rm = TRUE)-min(x,na.rm = TRUE))
}

df %>%
  mutate(a = rescale01(a),
         b = rescale01(b),
         c = rescale01(c),
         d = rescale01(d))
rescale <- function(x){
  value <-  (x-min(x, na.rm = TRUE))/(max(x, na.rm = TRUE)-min(x, na.rm = TRUE))
}        

F_to_C <- function(temp_F) {
  temp_C <- (temp_F - 32) * 5 / 9
  return(temp_C)
}

F_to_C(32)

F_to_C(100)

F_to_C(212)

C_to_K <- function(temp_C){
  temp_K <- (temp_C + 273.15)
  return(temp_K)
}
C_to_K(0)


################ MAKING PLOTS INTO A FUNCTION ##################

pal <- pnw_palette("Lake", 3, type = "discrete")  ####my color palette

ggplot(penguins, aes(x = body_mass_g, y = bill_length_mm, color = island)) +
  geom_point()+
  geom_smooth(method = "lm") +  ###add linear model
  scale_color_manual("Island", values=pal)+ ##use pretty colors and change the legend title
  theme_bw()

iamlesssad()
######### Name and set up the function ##########

myplot <- function(){
  pal <- pnw_palette("Lake",3, type = "discrete" ) # my color pallette
  
  ggplot(penguins, aes(x = body_mass_g, y = bill_length_mm, color = island))+
    geom_point()+
    geom_smooth(method = "lm") + # add a linear model
    scale_color_manual ("Island", values=pal)+
    theme_bw()
}

myplot <- function(data, x, y) {
  pal <- pnw_palette("Lake", 3, type = "discrete") # my color pallete

  ggplot(data, aes(x = {{x}}, y = {{y}}, color = island))+   ## double curlies allows you to choose a column within your data set 
    geom_point()+
    geom_smooth(method = "lm")+
    scale_color_manual("Island", values=pal)+ # use pretty colors to change the legend title
    theme_bw()
    
}

myplot(data = penguins, x = body_mass_g, y = bill_length_mm)

myplot(data = penguins, x = body_mass_g, y = flipper_length_mm)


########  Adding Defaults ##########

myplot <- function(data = penguins, x, y) {
  pal <- pnw_palette("Lake", 3, type = "discrete") # my color palette
  
ggplot(data, aes(x = {{x}}, y = {{y}}, color = island))+
  geom_point()+
  geom_smooth(method = "lm")+
  scale_color_manual("Island", values = pal)+
  theme_bw()
}

myplot(x = body_mass_g, y = flipper_length_mm)+
  labs(x = "Body Mass (g)",
       y = "Flipper Length (mm)")

####### You can add an if-else ########

a <- 4
b <- 5

if(a < b) { #my question
  f <- 20 # if it is true give me answer 1
    } else { #else give me answer 2
  f <- 10
    }
f

###### Back to plotting #######

myplot <- function(data = penguins, x, y, lines = TRUE){ # add new argument for lines
  pal <- pnw_palette("Lake", 3, type = "discrete") # my color palette
  
ggplot(data, aes(x = {{x}}, y = {{y}}, color = island))+
  geom_point()+
  geom_smooth(method = "lm")+  ##add a linear model
  scale_color_manual ("Island", values = pal)+ ## use pretty colors and change legend title
  theme_bw()

}


###### Adding if-else statement into your code for different plot outcome ########

myplot <- function(data = penguins, x, y, lines = TRUE){ # add new argument for lines
  pal <- pnw_palette("Lake", 3, type = "discrete") # my color palette

if(lines==TRUE){
    ggplot(data, aes(x = {{x}}, y = {{y}}, color = island))+
      geom_point()+
      geom_smooth(method = "lm")+  ##add a linear model
      scale_color_manual ("Island", values = pal)+ ## use pretty colors and change legend title
      theme_bw()
}  
else{
ggplot(data, aes(x = {{x}}, y = {{y}}, color = island))+
  geom_point()+
  scale_color_manual ("Island", values = pal)+ ## use pretty colors and change legend title
  theme_bw()
}
}


##TESTING##
myplot(x = body_mass_g, y = flipper_length_mm)

myplot(x = body_mass_g, y = flipper_length_mm, lines = FALSE)
mymood()

