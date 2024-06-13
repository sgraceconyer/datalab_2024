#load libraries
library(tidyverse)
library(dplyr)
library(readr)

#Load CSV's
messy_dives <- read_csv('https://raw.githubusercontent.com/databrew/intro-to-data-science/main/data/whales-dives-messy.csv')

head(messy_dives)
head(dives)


#Rename
names(messy_dives) <- c(
  "species",
  "behaviour",
  "prey.volume",
  "prey.depth",
  "dive.time",
  "surface.time",
  "blow.interval",
  "blow.number",
  "year",
  "month",
  "day",
  "sit"
  )

messy_dives <- messy_dives %>%
mutate(year = ifelse(nchar(year) == 2 , paste0("20", year), year)) %>% 
mutate(month = ifelse(nchar(month) == 1 , paste0("0", month), month)) %>% 
mutate(day = ifelse(nchar(day) == 1 , paste0("0", day), day)) %>% 
mutate(sit==substr(sit,10,12))

#Making an ID column  
messy_dives<-messy_dives %>% 
  arrange(year,month,day) %>% 
  mutate(id=paste0(year,month,day,sit)) %>% 
  select(-sit,-month,-year)

#move the id column to the front
messy_dives<-messy_dives %>% 
  select(last_col(),everything())

#remove NA rows from the data
messy_dives<-messy_dives %>% 
  drop_na()

messy_dives<-messy_dives %>% 
  filter(species%in%c('FW','HW','FinW','Hw')) %>% 
  filter(behavior%in%c("FEED","OTHER"))


#Changing output 




