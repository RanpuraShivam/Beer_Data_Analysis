# Calculate average ABV for each brewery
brewery_avg_ABV <- aggregate(beer_ABV ~ beer_brewerId, data = data, FUN = mean)

# Calculate average overall review rating for each brewery
brewery_avg_rating <- aggregate(review_overall ~ beer_brewerId, data = data, FUN = mean)

# Merge the two datasets
brewery_stats <- merge(brewery_avg_ABV, brewery_avg_rating, by = "beer_brewerId")

# Calculate a combined score for each brewery based on ABV and overall rating
brewery_stats$combined_score <- scale(brewery_stats$beer_ABV) + scale(brewery_stats$review_overall)

# Find the name of the beer with the highest overall rating for each brewery
top_beer_by_brewery <- aggregate(beer_name ~ beer_brewerId, data = data, 
                                 FUN = function(x) {
                                   top_beer_index <- which.max(data$review_overall)
                                   top_beer_name <- data$beer_name[top_beer_index]
                                   return(top_beer_name)
                                 })

# Merge the top beer information into brewery stats
brewery_stats <- merge(brewery_stats, top_beer_by_brewery, by = "beer_brewerId")

# Rank breweries by combined score in descending order
top_3_breweries <- head(brewery_stats[order(brewery_stats$combined_score, decreasing = TRUE), ], 3)

# Print the top 3 breweries
print("Top 3 Breweries Based on Combined Criteria:")
print(top_3_breweries)

