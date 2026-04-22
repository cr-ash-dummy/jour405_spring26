### I made two scatterplots just mapping every film by watch count and rating, and then by likes and rating. 
### I'm probably going to have to cut the data down; the x-axis can't even be measured in actual numbers.
### I tried to do some correlation tests, but they came back with NA. Does that mean there's no correlation, or that I did it wrong?
### I should also make some histograms measuring average watch count and average-average rating.


### Giving this another pass. I was getting an NA result likely because there are NA values somewhere in Average_rating.
### Using cor.test() instead will ignore those NA values, so I can successfully test for correlation between average rating and watch count.
### I tested it using owner rating, found that it worked, then tried finding the correlation between watch count and average rating. Cor.test() also gives a p-value.
### 3-5 tests I can run and reasoning:
### 1. Linear regression model testing ratings against watches. That would give me an understanding of their relationship. I need to remember that all I'm looking for is whether the most-watched films on Letterboxd are the most-liked.
### 2. Histogram of ratings. Is a histogram a test? It's a graph. I should graph how ratings are distributed across this sample of over 10,000 films, so we can understand what it means for a film to be highly rated; is it all that rare? Even if highly watched films are in fact highly rated, is that particularly valuable?
### 2.5. Another test that would help understand the distribution of the data is finding the interquartile range. I could also make box plots, but I find them hard to interpret.
### 3. Correlation tests to check my linear regression models. This will help verify what the models indicate. I should also compare total ratings to average rating and number of watches. There may be a discrepancy between number of ratings and number of watches that could be affecting the data. Like, I don't want to posit that the most-watched films on Letterboxd are also the most well-liked, if they're actually not being rated by very many people. I'm giving too much credit to that minority.

library(tidyverse)
library(readr)
Movie_Data_File <- read_csv("Movie_Data_File.csv")
View(Movie_Data_File)
ggplot(data=Movie_Data_File, aes(x=Movie_Data_File$Watches, y=Movie_Data_File$Average_rating, group=1)) + geom_point()
ggplot(data=Movie_Data_File, aes(x=Movie_Data_File$Likes, y=Movie_Data_File$Average_rating, group=1)) + geom_point()
cor.test(Movie_Data_File$Owner_rating, Movie_Data_File$Average_rating, method="pearson")
cor.test(Movie_Data_File$Watches, Movie_Data_File$Average_rating, method="pearson")