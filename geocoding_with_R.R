# geocoding with R
# link: https://www.jessesadler.com/post/geocoding-with-r/

library(tidyverse)
install.packages("ggmap", dependencies=TRUE, repos='http://cran.rstudio.com/')
library(ggmap)

letters <- read_csv("dvdm-correspondence-1591.csv")
letters

# get unique source and destination
sources <- distinct(letters,source)
destinations <- distinct(letters, destination)

## because the data is seems uptodate,
## we need to get rid of NA values
sources <- na.omit(sources)
destinations <- na.omit(destinations)

# join the data
cities <- full_join(sources,destinations,by=
                      c("source"="destination"))

# rename column
cities <- rename(cities,place=source)
head(cities,n=2)

# convert tibble to data frame
cities_df <- as.data.frame(cities)

locations_df <- mutate_geocode(cities_df,place)
?register_google

# I stop here, because right know we must get an API key from google, and we have to
# pay for it. Then security also have a big concern since R cannot provide protection
# whatsoever if someone trying to steal our google API.
# ok. finish from now.