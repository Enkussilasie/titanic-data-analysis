# Exploratory Data Analysis (Titanic Dataset)
# Demonstrates: Data cleaning, summary stats, and visualization

# Load libraries
library(tidyverse)
library(ggplot2)

# 1. Load data
data <- read_csv("data.csv")  # Replace with your filename

# 2. Clean data (handle missing values)
data_clean <- data %>%
  drop_na()  # Or use mutate() to fill NAs

# 3. Summary statistics
summary_stats <- summary(data_clean)
print(summary_stats)

# 4. Visualization: Age distribution
ggplot(data_clean, aes(x = Age)) +
  geom_histogram(fill = "blue", bins = 20) +
  labs(title = "Distribution of Passenger Ages",
       x = "Age",
       y = "Count") +
  theme_minimal()

# Save plot
ggsave("age_distribution.png")
# Extra: Survival rate by gender
ggplot(data_clean, aes(x = Sex, fill = factor(Survived))) +
  geom_bar(position = "fill") +
  labs(title = "Survival Rate by Gender",
       x = "Gender",
       y = "Proportion Survived",
       fill = "Survived (0=No, 1=Yes)") +
  theme_minimal()

ggsave("survival_by_gender.png")  # Saves the plot
