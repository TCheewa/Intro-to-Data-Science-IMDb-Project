# Linear Regression

# Load required libraries
library(ggplot2)

# Load cleaned data
cleaned_data <- read.csv("data/merged_data.csv")

# Linear regression model
linear_model <- lm(averageRating ~ confidenceScore + runtimeCategory + numVotes, data = cleaned_data)

# Summary of the model
summary(linear_model)

# Diagnostic plots
par(mfrow = c(2, 2))
plot(linear_model)

# Save residual plot
png("outputs/linear_regression_diagnostics.png")
plot(linear_model)
dev.off()
