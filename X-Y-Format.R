#load tidyverse for "pivot_wider"
library(tidyverse)
library(vegan)
library(dplyr)

#Read in data 

data<-read.csv("C:/Users/Parke/OneDrive/Documents/MS Thesis/Data/Floating23_MB_Feb.csv")

#reading in the data with the correct columns was hard, here are two options for future readins

d <- data[, c('Date', 'Pond', 'ID', 'Count', 'Direction')]

d2 <- data[, c(1:3, 9, 8)]
# date, pond, direction, ID, count

#Remove rows with N/A (typically these are the rows between data entries)
#note: this will also remove rows with (-) ex: ponds with unknown directions

d2<- na.omit(d2)
         
#Convert data from x to y format 

d2$Count<- as.numeric(d2$Count)
d2$X<- ID


Wider<-d2 %>%
  pivot_wider(names_from = ID, values_from = Count)

# This pointed out a duplicate in my datasheet  
#d2 %>%
#group_by(Date, Pond, Direction, ID) %>%
#summarise(n = dplyr::n(), .groups = "drop") %>%
#filter(n > 1L) 




