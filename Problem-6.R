data = read_csv("~/Desktop/programming/R_Programming/3rd_Assignment/Dataset_R.csv")
library(dplyr)
library(tm)
review_comparison <- data %>%
  group_by(review_overall) %>%
  summarise(avg_review_text = mean(nchar(review_text))) %>%
  arrange(desc(avg_review_text))
print(review_comparison)