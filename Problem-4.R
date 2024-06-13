# Calculate a combined score for each beer based on various factors
data$combined_score <- rowMeans(data[, c("review_overall", "review_taste", "review_aroma", "review_appearance", 
                                         "review_palette")], na.rm = TRUE)

# Find the top 3 beers based on the combined score
top_3_beers <- data[order(data$combined_score, decreasing = TRUE), ][1:3, c("beer_name", "beer_style", "beer_ABV")]

# Print the details of the top 3 recommended beers
print("Top 3 Recommended Beers:")
print(top_3_beers)
