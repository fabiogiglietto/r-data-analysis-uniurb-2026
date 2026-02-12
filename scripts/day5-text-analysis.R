# =============================================================================
# Day 5: Putting It All Together — Text Analysis & Capstone
# Data Analysis with R and Claude Code
# University of Urbino — PhD in Humanities
# =============================================================================

# Today we'll analyze text data and complete a full analysis

# -----------------------------------------------------------------------------
# SETUP
# -----------------------------------------------------------------------------

library(tidyverse)
library(tidytext)
library(scales)

# Import and prepare the data
corona <- read_csv("data/fabrizio_corona_tiktok_jan2026.csv",
                   col_types = cols(video_id = col_character(),
                                    music_id = col_character()))

# Add calculated variables
corona <- corona |>
  mutate(
    engagement_total = like_count + comment_count + share_count,
    engagement_rate = engagement_total / view_count,
    duration_category = factor(
      case_when(
        duration < 30 ~ "short",
        duration >= 30 & duration <= 60 ~ "medium",
        duration > 60 ~ "long"
      ),
      levels = c("short", "medium", "long")
    ),
    is_viral = view_count > 1000000
  )


# -----------------------------------------------------------------------------
# SECTION 1: Analyzing Hashtags
# -----------------------------------------------------------------------------

# The hashtags column contains comma-separated values
# Let's look at a few examples
corona |>
  select(video_id, hashtags) |>
  head(10)

# Step 1: Keep only rows with hashtags
corona_hashtags <- corona |>
  filter(!is.na(hashtags) & hashtags != "")

# How many videos have hashtags?
nrow(corona_hashtags)

# Step 2: Separate hashtags into individual rows
hashtag_counts <- corona_hashtags |>
  # One hashtag per row
  separate_rows(hashtags, sep = ",\\s*") |>
  # Clean up: lowercase, remove whitespace
  mutate(hashtags = str_to_lower(str_trim(hashtags))) |>
  # Remove empty strings
  filter(hashtags != "") |>
  # Count occurrences
  count(hashtags, sort = TRUE)

# View top hashtags
head(hashtag_counts, 20)

# Step 3: Visualize top hashtags (excluding the main search term)
hashtag_counts |>
  filter(hashtags != "fabriziocorona") |>
  head(15) |>
  ggplot(aes(x = reorder(hashtags, n), y = n)) +
  geom_col(fill = "steelblue") +
  coord_flip() +
  labs(
    title = "Most Common Hashtags in Corona Videos",
    subtitle = "Excluding #fabriziocorona",
    x = NULL,
    y = "Number of Videos"
  ) +
  theme_minimal()

# Save the plot
ggsave("output/top_hashtags.png", width = 10, height = 6, dpi = 300)

# Exercise: What are the top 10 hashtags that co-occur with Corona content?
# [YOUR CODE HERE]


# -----------------------------------------------------------------------------
# SECTION 2: Analyzing Video Descriptions (Word Frequency)
# -----------------------------------------------------------------------------

# Load Italian stopwords
# These are common words that don't carry meaning (the, a, is, etc.)
italian_stopwords <- read_csv("resources/italian-stopwords.csv")

# Alternative: Create a simple stopword list
# italian_stopwords <- tibble(word = c(
#   "di", "che", "e", "il", "la", "a", "per", "un", "una", "in", "non",
#   "è", "sono", "da", "con", "si", "come", "ma", "lo", "le", "più",
#   "ho", "ha", "questo", "questa", "quello", "quella", "se", "tutto"
# ))

# Step 1: Tokenize descriptions into words
words <- corona |>
  select(video_id, description) |>
  filter(!is.na(description)) |>
  # Split text into individual words (one word per row)
  unnest_tokens(word, description)

# How many words total?
nrow(words)

# Step 2: Remove stopwords
words_clean <- words |>
  anti_join(italian_stopwords, by = "word")

# How many words after removing stopwords?
nrow(words_clean)

# Step 3: Additional cleaning
words_clean <- words_clean |>
  # Remove numbers
  filter(!str_detect(word, "^[0-9]+$")) |>
  # Remove very short words (often not meaningful)
  filter(nchar(word) > 2) |>
  # Remove common web/social terms
  filter(!word %in% c("https", "http", "www", "com", "tiktok"))

# Step 4: Count word frequencies
word_counts <- words_clean |>
  count(word, sort = TRUE)

# View top words
head(word_counts, 30)

# Step 5: Visualize
word_counts |>
  head(20) |>
  ggplot(aes(x = reorder(word, n), y = n)) +
  geom_col(fill = "coral") +
  coord_flip() +
  labs(
    title = "Most Frequent Words in Video Descriptions",
    subtitle = "After removing Italian stopwords",
    x = NULL,
    y = "Frequency"
  ) +
  theme_minimal()

ggsave("output/top_words.png", width = 10, height = 6, dpi = 300)

# Exercise: Create a word frequency analysis without the name "corona" and "fabrizio"
# What topics emerge?
# [YOUR CODE HERE]


# -----------------------------------------------------------------------------
# SECTION 3: Combining Text and Engagement Analysis
# -----------------------------------------------------------------------------

# Question: Do videos with certain hashtags perform better?

# Calculate average views per hashtag
hashtag_performance <- corona_hashtags |>
  separate_rows(hashtags, sep = ",\\s*") |>
  mutate(hashtags = str_to_lower(str_trim(hashtags))) |>
  filter(hashtags != "" & hashtags != "fabriziocorona") |>
  group_by(hashtags) |>
  summarize(
    n_videos = n(),
    avg_views = mean(view_count),
    total_views = sum(view_count),
    avg_engagement = mean(engagement_rate, na.rm = TRUE)
  ) |>
  filter(n_videos >= 10)  # Only hashtags used at least 10 times

# Top hashtags by average views
hashtag_performance |>
  arrange(desc(avg_views)) |>
  head(15)

# Visualize
hashtag_performance |>
  filter(n_videos >= 20) |>
  arrange(desc(avg_views)) |>
  head(15) |>
  ggplot(aes(x = reorder(hashtags, avg_views), y = avg_views)) +
  geom_col(fill = "purple") +
  coord_flip() +
  scale_y_continuous(labels = label_comma()) +
  labs(
    title = "Top Hashtags by Average Views",
    subtitle = "Hashtags used in at least 20 videos",
    x = NULL,
    y = "Average Views"
  ) +
  theme_minimal()


# -----------------------------------------------------------------------------
# SECTION 4: Reproducible Workflows
# -----------------------------------------------------------------------------

# BEST PRACTICES FOR ORGANIZING YOUR ANALYSIS

# 1. Project structure
# my_analysis/
# ├── data/           # Raw data (never modify!)
# ├── scripts/        # R code
# ├── output/         # Generated figures and tables
# └── README.md       # Description of the project

# 2. Script structure template
# 
# # =============================================================================
# # Title: My Analysis
# # Author: Your Name
# # Date: 2026-02-13
# # Description: Brief description of what this script does
# # =============================================================================
# 
# # SETUP ----------------------------------------------------------------------
# library(tidyverse)
# 
# # IMPORT DATA ----------------------------------------------------------------
# data <- read_csv("data/mydata.csv")
# 
# # CLEAN DATA -----------------------------------------------------------------
# data_clean <- data |>
#   filter(...) |>
#   mutate(...)
# 
# # ANALYSIS -------------------------------------------------------------------
# # Your analysis code here
# 
# # VISUALIZATION --------------------------------------------------------------
# # Your plots here
# 
# # EXPORT ---------------------------------------------------------------------
# ggsave("output/my_plot.png", width = 10, height = 6)
# write_csv(results, "output/results.csv")

# 3. Always comment your code!
# Comments explain WHY, not WHAT


# -----------------------------------------------------------------------------
# SECTION 5: CAPSTONE PROJECT
# -----------------------------------------------------------------------------

# Choose ONE of the following research questions and complete a full analysis.
# Use Claude Code to help you as needed.

# =============================================================================
# OPTION A: ENGAGEMENT ANALYSIS
# =============================================================================
# Research question: What factors are associated with higher engagement on 
# Fabrizio Corona TikTok videos?
# 
# Tasks:
# 1. Calculate an engagement metric of your choice
# 2. Compare engagement across video duration categories
# 3. Identify the top 10 most engaging videos (by your metric)
# 4. Create at least 2 visualizations
# 5. Write a brief summary of your findings (3-5 sentences)

# YOUR CODE FOR OPTION A:
# [YOUR CODE HERE]


# =============================================================================
# OPTION B: TEMPORAL ANALYSIS
# =============================================================================
# Research question: How did TikTok activity about Fabrizio Corona change 
# throughout January 2026?
# 
# Tasks:
# 1. Calculate daily and weekly statistics (video count, total views, avg engagement)
# 2. Identify any spikes or unusual patterns
# 3. Compare the first half vs. second half of the month
# 4. Create at least 2 visualizations (including a time series)
# 5. Write a brief summary of your findings (3-5 sentences)

# YOUR CODE FOR OPTION B:
# [YOUR CODE HERE]


# =============================================================================
# OPTION C: CREATOR ANALYSIS
# =============================================================================
# Research question: Who are the key creators driving the conversation about 
# Fabrizio Corona on TikTok?
# 
# Tasks:
# 1. Identify the most prolific creators (by number of videos)
# 2. Identify the most viewed creators (by total views)
# 3. Are these the same people? Compare the two lists.
# 4. Create at least 2 visualizations
# 5. Write a brief summary of your findings (3-5 sentences)

# YOUR CODE FOR OPTION C:
# [YOUR CODE HERE]


# -----------------------------------------------------------------------------
# SUMMARY TEMPLATE
# -----------------------------------------------------------------------------

# After completing your analysis, write your findings here:
#
# Research Question:
# [Write your research question]
#
# Key Findings:
# 1. [Finding 1]
# 2. [Finding 2]
# 3. [Finding 3]
#
# Conclusion:
# [2-3 sentences summarizing what you learned]
#
# Limitations:
# [What couldn't you answer with this data? What would you need?]


# -----------------------------------------------------------------------------
# CONGRATULATIONS!
# -----------------------------------------------------------------------------

# You've completed the course! Here's what you learned:
#
# Day 1: R basics, variables, vectors, functions
# Day 2: Importing data, exploring datasets, select(), filter()
# Day 3: mutate(), group_by(), summarize(), count(), arrange()
# Day 4: ggplot2 visualizations - histograms, bar charts, line plots, etc.
# Day 5: Text analysis, reproducible workflows, complete analysis
#
# Keep practicing and learning!
#
# Resources:
# - R for Data Science: https://r4ds.hadley.nz/
# - Text Mining with R: https://www.tidytextmining.com/
# - Posit Cheatsheets: https://posit.co/resources/cheatsheets/
# - Claude Code for assistance
#
# Good luck with your research!
