# Calculate average ratings for each beer style
avg_ratings_by_style <- aggregate(cbind(review_taste, review_aroma, review_appearance, review_palette, review_overall) ~ beer_style, data = data, FUN = mean)

# Calculate combined score based on multiple factors
avg_ratings_by_style$combined_score <- rowMeans(avg_ratings_by_style[, c("review_taste", "review_aroma", "review_appearance", "review_palette", "review_overall")])

# Find the beer style with the highest combined score
top_beer_style <- avg_ratings_by_style[which.max(avg_ratings_by_style$combined_score), "beer_style"]

# Print the top-rated beer style
print("Top Beer Style Based on Multiple Factors:")
print(top_beer_style)
