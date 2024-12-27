# Clustering Analysis

# Load required libraries
library(cluster)
library(ggplot2)

# Load cleaned data
cleaned_data <- read.csv("data/merged_data.csv")

# Select and scale data
clustering_data <- cleaned_data %>%
  select(confidenceScore, averageRating) %>%
  scale()

# K-means clustering
set.seed(123)
kmeans_result <- kmeans(clustering_data, centers = 3, nstart = 20)

# Add cluster assignments to data
cleaned_data$cluster <- as.factor(kmeans_result$cluster)

# Visualize clusters
ggplot(cleaned_data, aes(x = confidenceScore, y = averageRating, color = cluster)) +
  geom_point(alpha = 0.7) +
  labs(title = "Clustering of Movies by Confidence Score and Average Rating",
       x = "Confidence Score", y = "Average Rating") +
  theme_minimal()

# Save cluster plot
ggsave("outputs/clustering_plot.png")
