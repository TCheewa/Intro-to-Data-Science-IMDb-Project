# Correlation Analysis

# Load required libraries
library(ggplot2)
library(reshape2)

# Load cleaned data
cleaned_data <- read.csv("data/merged_data.csv")

# Compute correlation matrix
numeric_data <- cleaned_data %>%
  select(confidenceScore, averageRating, runtimeMinutes, numVotes) %>%
  mutate(across(everything(), as.numeric))

cor_matrix <- cor(numeric_data, use = "complete.obs")

# Visualize correlation matrix
cor_data <- melt(cor_matrix)
ggplot(cor_data, aes(Var1, Var2, fill = value)) +
  geom_tile() +
  geom_text(aes(label = round(value, 2))) +
  scale_fill_gradient2(low = "blue", mid = "white", high = "red", midpoint = 0) +
  labs(title = "Correlation Heatmap", x = "Variable", y = "Variable") +
  theme_minimal()

# Save heatmap
ggsave("outputs/correlation_heatmap.png")
