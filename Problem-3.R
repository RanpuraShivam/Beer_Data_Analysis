# Calculate correlation between review factors and overall rating
correlation <- cor(data[, c("review_taste", "review_aroma", "review_appearance", "review_palette", "review_overall")])

# Extract correlation coefficients for each factor with overall rating
cor_with_overall <- correlation["review_overall", 1:4]

# Print correlation coefficients
print("Correlation coefficients with overall rating:")
print(cor_with_overall)

# Identify the most important factor based on the highest correlation coefficient
most_important_factor <- names(cor_with_overall)[which.max(abs(cor_with_overall))]
print(paste("Most important factor based on user ratings:", most_important_factor))

