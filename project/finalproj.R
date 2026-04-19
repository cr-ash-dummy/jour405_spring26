### I made two scatterplots just mapping every film by watch count and rating, and then by likes and rating. 
### I'm probably going to have to cut the data down; the x-axis can't even be measured in actual numbers.
### I tried to do some correlation tests, but they came back with NA. Does that mean there's no correlation, or that I did it wrong?
### I should also make some histograms measuring average watch count and average-average rating.

library(tidyverse)
library(readr)
Movie_Data_File <- read_csv("Movie_Data_File.csv")
View(Movie_Data_File)
ggplot(data=Movie_Data_File, aes(x=Movie_Data_File$Watches, y=Movie_Data_File$Average_rating, group=1)) + geom_point()
ggplot(data=Movie_Data_File, aes(x=Movie_Data_File$Likes, y=Movie_Data_File$Average_rating, group=1)) + geom_point()
