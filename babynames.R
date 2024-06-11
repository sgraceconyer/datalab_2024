#Load library (babynames)
library(babynames)
library(ggplot2)
library(tidyverse)
library(dplyr)
bb_names<-babynames

# Create plot using ggplot2
ggplot(babynames %>% filter(name=="Marie",year>=1982),aes(x = year, y=prop))+
  geom_line() +
  labs(title = "Maries in History" , x = "Names", y="proportion")+
  theme_gray()

babynames %>% 
group_by(sex) %>% 
  filter(name=="Marie", sex=="f") %>% 
  tally()
#Number of people named "Marie"


ggplot(babynames %>% filter(name=="Joe",),aes(x = year, y=prop,colour=sex))+
  geom_line()
  labs(title = "Joe's throughtout History" , x = "Names", y="proportion")+
  theme_gray()
  
bbnames_2002 <- bb_names %>% 
  filter(sex == 'F',
         year == '2002') %>%
  arrange(desc(n)) %>% 
  head(10)
 
# Create a bar chart of the 10 most popular female names in 2002
ggplot(data = bbnames_2002, aes(x=name,y=n))+
  geom_col(fill="blue")+
  labs(title = "Women names of 2002" , x = "Names", y="proportion")+
  theme_gray()
  
the_nineties<-bb_names %>% 
  filter(year<=1999,year>=1990)
    
