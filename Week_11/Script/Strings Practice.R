

##Load Libraries##
library(here)
library(tidyverse)
library(tidytext)
library(wordcloud2)
library(janeaustenr)

words <- "This is a string"
words
words_vector <- c("Apples", "Bananas", "Oranges")
words
words_vector

paste("High temp", "Low pH") ##pastes two categories and seperates them by a space in between

paste("High temp", "Low pH", sep = "-") ##This pastes them together and adds a dash in middle by assigning a seperator.

paste0("High temp", "Low pH") #paste0 Pastes words without seperator

shapes <- c("Square","Circle", "Triangle")
paste("My favorite shape is a", shapes)

two_cities <- c("best", "worst")
paste("It was the", two_cities, "of times.")


shapes # vector of shapes
str_length(shapes)

seq_data <- c("ATCCCGTC")
str_sub(seq_data, start = 2, end = 4)  ##Extract the 2nd to 4th AA

str_sub(seq_data, start = 3, end = 3) <-  "A" #substituting an A in the third position
seq_data

str_dup(seq_data, times = c(2,3)) ##times is the number of times to duplicate


badtreatments <- c("High", " High", "High ", "Low", "Low")
badtreatments

str_trim(badtreatments) ## You can trim off white spaces before and after words, but not within a word


str_pad(badtreatments, 5, side = "right") # adds white space to 5th place of the right side of the word
                                          # adds an additional "character" or space to 4th positon if empty such as in a 3-letter word


str_pad(badtreatments, 5, side = "right", pad = "1")

x <-  "I love R!"
str_to_upper(x) # makes all words upper case
str_to_lower(x) # makes all words lower case
str_to_title(x) # makes it into title (every word capitalized)


data <- c("AAA", "TATA", "CTAG","GCTT") 

str_view(data, pattern = "A") # finds all words with A
str_detect(data, pattern = "A") # counts how many there are in your data. 
str_detect(data, pattern = "AT") # counts how many there multiples are in your data. 

str_locate(data, pattern = "A")

vals <-  c("a.b", "b.c", "c.d")
vals

str_replace(vals, "\\."," ")

vals <-  c(c ("a.b.c", "b.c.d", "c.d.e"))
str_replace(vals,"\\.", " ")


val2 <-  c("test 123", "test 456", "test")

str_subset(val2,"\\d") # Only keeps set that has intergers (List of characters)

str_count(val2, "[aeiou]")# counts any data in your data set that has any vowels
str_count(val2, "[0-9]")  # counts any data in your data set that has any numbers 0-9


strings <-  c("444.5694.92",
              "126.4971.34")

ip<-  "([0-9]{3})[.]([0-9]{4})[-.]([0-9]{2})"
str_detect(strings, ip)


test_fix <-  c("550-153-7578", 
              "banana", 
              "435.114.7586",
              "home: 672-442-6739")


str_detect(strings, phone)
test_fix <- test%>%
  str_replace_all("\\.","-"%>%)
test%>%
  str_replace_all("\\D"," ") %>%
  str_trim()%>%
str_replace_all(" ","-")


phone <-  "([2-9][0-9]{2})[-.]([1-9][0-9]{2})[-.]([0-9]{4})"


original_books <- austen_books() %>% # get allof Jane Autens books
  group_by(book) %>%
  mutate(line = row_number(),
         chapter = cumsum(str_detect(text, regex("^chapter [\\divxlc]",
                                                 ignore_case = TRUE))))%>%
  ungroup()
head(original_books)


cleaned_books %>%
  count(word,sort = TRUE)
