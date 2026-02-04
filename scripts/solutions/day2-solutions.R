# =============================================================================
# Day 2: SOLUTIONS
# Data Analysis with R and Claude Code
# =============================================================================

library(tidyverse)
corona <- read_csv("data/fabrizio_corona_tiktok_jan2026.csv")

# Exercise 1: How many rows and columns does the Corona dataset have?
nrow(corona)  # 9373 rows
ncol(corona)  # 14 columns
dim(corona)   # Both: 9373 x 14

# Exercise 2: What is the data type of each column?
glimpse(corona)
# video_id: character
# create_time: double (numeric)
# create_datetime: datetime
# create_date: date
# description: character
# hashtags: character
# duration: double (numeric)
# view_count: double (numeric)
# like_count: double (numeric)
# comment_count: double (numeric)
# share_count: double (numeric)
# author_name: character
# music_id: character
# region_code: character

# Exercise 3: How many unique authors are in the dataset?
n_distinct(corona$author_name)  # 4964 unique authors

# Exercise 4: Filter videos with more than 500,000 views
high_view_videos <- corona |> filter(view_count > 500000)
nrow(high_view_videos)  # Count how many

# Exercise 5: Select specific columns
corona |> select(author_name, description, view_count, like_count)

# Exercise 6: Filter by multiple conditions
corona |> 
  filter(like_count > 10000 & comment_count > 100) |>
  nrow()

# Exercise 7: Videos from first week of January
corona |> 
  filter(create_date >= "2026-01-01" & create_date <= "2026-01-07")

# CHALLENGE: Video with most views
corona |>
  arrange(desc(view_count)) |>
  head(1) |>
  select(author_name, view_count, description)
