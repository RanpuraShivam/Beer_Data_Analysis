# Load libraries
library(tidyverse)
library(tm)  # Add this line

# Set the path to your data file (replace with the actual path)
data_path <- "~/Desktop/programming/R_Programming/3rd_Assignment/Dataset_R.csv"

# Read data from CSV
data <- read.csv(data_path)

# Basic text cleaning for review_text (adjust based on your data)
data$review_clean <- gsub("[^[:alnum:]]\\s*", " ", tolower(data$review_text))  # Remove punctuation and extra spaces

# Create a sentiment lexicon (optional)
# You can use existing sentiment lexicons or build your own

# Calculate sentiment score for each review (optional)
# Use the sentiment lexicon to assign sentiment scores to words in reviews

# Option 1: Sentiment Analysis (if you have a sentiment lexicon)
# sentiment_score <- function(text) {
#   # Implement your sentiment scoring logic using the lexicon
#   # This function should return a sentiment score for the text
# }
# data$sentiment_score <- sapply(data$review_clean, sentiment_score)

# Option 2: TF-IDF analysis (without sentiment lexicon)
dtm <- DocumentTermMatrix(data$review_clean)
tfidf <- weightTfIdf(dtm)

# Calculate average review score and TF-IDF vector for each beer style
avg_review_by_style <- aggregate(review_overall ~ beer_style, data = data, FUN = mean)
avg_tfidf_by_style <- tapply(colMeans(tfidf), data$beer_style, FUN = mean)

# Compare average review score and average TF-IDF vector for each style
comparison <- data.frame(
  beer_style = avg_review_by_style$beer_style,
  avg_review_score = avg_review_by_style$review_overall,
  avg_tfidf_score = avg_tfidf_by_style
)

# Print results (consider visualizing correlations)
print(comparison)

# Further analysis
# - Explore correlations between average review score and average TF-IDF score
# - Analyze sentiment scores (if calculated)
# - Group reviews by style and sentiment for qualitative analysis of written reviews
