data = read.csv("~/Desktop/programming/R_Programming/3rd_Assignment/Dataset_R.csv")
library(dplyr)
library(tm)
library(dplyr)

data$review_time <- format(as.POSIXct(data$review_time, origin = "1970-01-01"), "%Y")

highest_rating_year <- data%>%
group_by(review_time) %>%
summarise(avg_rating = mean(review_overall)) %>%
arrange(desc(avg_rating)) %>%
slice_head(n = 1)

print(highest_rating_year)