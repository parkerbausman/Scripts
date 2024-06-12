#load tidyverse for "pivot_wider"
library(tidyverse)
library(vegan)
library(dplyr)

#Read in data 

data<-read.csv("C:/Users/Parke/OneDrive/Documents/MS Thesis/Data/MC_BankEmergence_2022.csv")
View(data)

#reading in the data with the correct columns was hard, here are two options for future readins

d <- data[, c('Date', 'Pond', 'ID', 'Count', 'Direction')]

d2 <- data[, c(1:3, 11, 9)]
#Date pond direction ID Count 

#Remove rows with N/A (typically these are the rows between data entries)
#note: this will also remove rows with (-) ex: ponds with unknown directions

d2<- na.omit(d2)

#Convert data from x to y format 

d2$Count<- as.numeric(d2$Count)

names(d2)[names(d2) == "X"] <- "ID"

combined_d2 <- d2 %>%
  group_by(ID,) %>%
  summarise_all(function(x) paste(unique(x), collapse = ","))


d3<- distinct(d2)


Wider<-d2 %>%
  pivot_wider(names_from = ID, values_from = Count)

# This pointed out a duplicate in my datasheet  
d2 %>%
group_by(Date, Pond, Direction, ID) %>%
summarise(n = dplyr::n(), .groups = "drop") %>%
filter(n > 1L) 






