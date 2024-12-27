# Preprocessing IMDb Data

# Load required libraries
library(dplyr)
library(tidyr)

# Load data
akas <- read.delim("data/title.akas.tsv", sep = "\t", header = TRUE, stringsAsFactors = FALSE, na.strings = "\\N")
basics <- read.delim("data/title.basics.tsv", sep = "\t", header = TRUE, stringsAsFactors = FALSE, na.strings = "\\N")
ratings <- read.delim("data/title.ratings.tsv", sep = "\t", header = TRUE, stringsAsFactors = FALSE, na.strings = "\\N")

# Merge datasets
merged_data <- akas %>%
  inner_join(basics, by = c("titleId" = "tconst")) %>%
  inner_join(ratings, by = c("titleId" = "tconst"))

# Remove duplicates (keep ordering = 1)
merged_data <- merged_data %>%
  filter(ordering == 1)

# Remove missing values in key columns
cleaned_data <- merged_data %>%
  filter(!is.na(genres) & !is.na(numVotes) & !is.na(averageRating))

# Separate genres
cleaned_data <- cleaned_data %>%
  separate_rows(genres, sep = ",")

# Categorize runtime
cleaned_data <- cleaned_data %>%
  mutate(runtimeCategory = case_when(
    runtimeMinutes < 90 ~ "Short",
    runtimeMinutes >= 90 & runtimeMinutes <= 120 ~ "Medium",
    runtimeMinutes > 120 ~ "Long",
    TRUE ~ "Unknown"
  ))

# Calculate confidence score
max_votes <- max(cleaned_data$numVotes, na.rm = TRUE)
cleaned_data <- cleaned_data %>%
  mutate(confidenceScore = (averageRating * numVotes) / max_votes)

# Save cleaned dataset
write.csv(cleaned_data, "data/merged_data.csv", row.names = FALSE)
