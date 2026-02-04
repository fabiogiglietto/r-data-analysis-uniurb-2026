# =============================================================================
# Day 3: Data Wrangling — Transforming Data for Analysis
# Data Analysis with R and Claude Code
# University of Urbino — PhD in Humanities
# =============================================================================

# Today we'll learn to transform and summarize data

# -----------------------------------------------------------------------------
# SETUP
# -----------------------------------------------------------------------------

library(tidyverse)

# Import the data
corona <- read_csv("data/fabrizio_corona_tiktok_jan2026.csv")

# Quick review - let's check our data
glimpse(corona)


# -----------------------------------------------------------------------------
# SECTION 1: Creating New Variables with mutate()
# -----------------------------------------------------------------------------

# mutate() creates new columns or modifies existing ones

# Create a single new variable
corona <- corona |>
  mutate(engagement_total = like_count + comment_count + share_count)

# Check it worked
corona |> select(video_id, like_count, comment_count, share_count, engagement_total)

# Create an engagement rate (engagement per view)
corona <- corona |>
  mutate(engagement_rate = engagement_total / view_count)

# Create multiple variables at once
corona <- corona |>
  mutate(
    views_thousands = view_count / 1000,
    views_millions = view_count / 1000000,
    like_ratio = like_count / view_count
  )

# Check our new columns
names(corona)

# Exercise: Create a variable called 'comment_ratio' that is comment_count / view_count
# [YOUR CODE HERE]


# -----------------------------------------------------------------------------
# SECTION 2: Recoding Variables with case_when()
# -----------------------------------------------------------------------------

# case_when() lets you create categories based on conditions

# Create duration categories
corona <- corona |>
  mutate(
    duration_category = case_when(
      duration < 30 ~ "short",
      duration >= 30 & duration <= 60 ~ "medium",
      duration > 60 ~ "long"
    )
  )

# Check the distribution
corona |> count(duration_category)

# Create a viral flag
corona <- corona |>
  mutate(is_viral = view_count > 1000000)

# Check
corona |> count(is_viral)

# Create popularity categories
corona <- corona |>
  mutate(
    popularity = case_when(
      view_count < 10000 ~ "low",
      view_count >= 10000 & view_count < 100000 ~ "medium",
      view_count >= 100000 & view_count < 1000000 ~ "high",
      view_count >= 1000000 ~ "viral"
    )
  )

corona |> count(popularity)

# Exercise: Create a variable 'engagement_level' that is:
# - "low" if engagement_rate < 0.01
# - "medium" if engagement_rate >= 0.01 and < 0.05
# - "high" if engagement_rate >= 0.05
# [YOUR CODE HERE]


# -----------------------------------------------------------------------------
# SECTION 3: The Pipe Operator |>
# -----------------------------------------------------------------------------

# The pipe passes the result of the left side as the first argument of the right
# Read it as "and then"

# Without pipe (nested functions - hard to read!)
head(filter(select(corona, author_name, view_count), view_count > 100000), 10)

# With pipe (readable step by step)
corona |>
  select(author_name, view_count) |>
  filter(view_count > 100000) |>
  head(10)

# You can build complex transformations
corona |>
  filter(view_count > 50000) |>
  mutate(engagement_per_thousand = engagement_total / (view_count / 1000)) |>
  select(author_name, view_count, engagement_per_thousand) |>
  head(20)


# -----------------------------------------------------------------------------
# SECTION 4: Summarizing Data with summarize()
# -----------------------------------------------------------------------------

# summarize() calculates summary statistics, collapsing many rows to one

# Overall summary
corona |>
  summarize(
    total_videos = n(),
    total_views = sum(view_count),
    total_likes = sum(like_count),
    avg_views = mean(view_count),
    median_views = median(view_count),
    max_views = max(view_count),
    min_views = min(view_count)
  )

# Note: n() counts rows, no argument needed

# Useful summary functions:
# n()        - count rows
# sum()      - total
# mean()     - average
# median()   - middle value
# sd()       - standard deviation
# min()      - minimum
# max()      - maximum
# first()    - first value
# last()     - last value
# n_distinct() - count unique values

# Handle missing values with na.rm = TRUE
corona |>
  summarize(
    avg_engagement_rate = mean(engagement_rate, na.rm = TRUE)
  )


# -----------------------------------------------------------------------------
# SECTION 5: Group Operations with group_by()
# -----------------------------------------------------------------------------

# group_by() + summarize() = statistics by group

# Statistics by date
daily_stats <- corona |>
  group_by(create_date) |>
  summarize(
    n_videos = n(),
    total_views = sum(view_count),
    avg_views = mean(view_count),
    avg_likes = mean(like_count)
  )

daily_stats

# Statistics by duration category
corona |>
  group_by(duration_category) |>
  summarize(
    n_videos = n(),
    avg_views = mean(view_count),
    avg_engagement_rate = mean(engagement_rate, na.rm = TRUE)
  )

# Group by multiple variables
corona |>
  group_by(duration_category, is_viral) |>
  summarize(
    n_videos = n(),
    avg_views = mean(view_count)
  )

# Don't forget to ungroup() if you continue working with the data
corona_grouped <- corona |>
  group_by(create_date) |>
  mutate(daily_avg = mean(view_count)) |>
  ungroup()


# -----------------------------------------------------------------------------
# SECTION 6: Counting with count()
# -----------------------------------------------------------------------------

# count() is a shortcut for group_by() + summarize(n = n())

# Count videos by date
corona |> count(create_date)

# Count by duration category
corona |> count(duration_category)

# Count and sort (most common first)
corona |> count(author_name, sort = TRUE)

# Count by multiple variables
corona |> count(duration_category, popularity)

# Add count to existing data with add_count()
corona <- corona |>
  add_count(author_name, name = "author_video_count")

# Check - how many videos did each author post?
corona |>
  select(author_name, author_video_count) |>
  distinct() |>
  arrange(desc(author_video_count))


# -----------------------------------------------------------------------------
# SECTION 7: Sorting with arrange()
# -----------------------------------------------------------------------------

# arrange() sorts rows

# Sort by views (ascending - smallest first)
corona |> 
  select(author_name, view_count) |>
  arrange(view_count)

# Sort by views (descending - largest first)
corona |>
  select(author_name, view_count) |>
  arrange(desc(view_count))

# Sort by multiple columns
corona |>
  select(create_date, author_name, view_count) |>
  arrange(create_date, desc(view_count))

# Top 10 most viewed videos
corona |>
  arrange(desc(view_count)) |>
  head(10) |>
  select(author_name, description, view_count, like_count)

# Top 10 most prolific authors
corona |>
  count(author_name, sort = TRUE) |>
  head(10)


# -----------------------------------------------------------------------------
# SECTION 8: Putting It All Together
# -----------------------------------------------------------------------------

# Example: What were the most engaging days?
corona |>
  group_by(create_date) |>
  summarize(
    n_videos = n(),
    total_views = sum(view_count),
    avg_engagement_rate = mean(engagement_rate, na.rm = TRUE)
  ) |>
  arrange(desc(avg_engagement_rate))

# Example: Top authors by total views
corona |>
  group_by(author_name) |>
  summarize(
    n_videos = n(),
    total_views = sum(view_count),
    total_likes = sum(like_count)
  ) |>
  arrange(desc(total_views)) |>
  head(10)

# Example: Do longer videos get more engagement?
corona |>
  group_by(duration_category) |>
  summarize(
    n_videos = n(),
    avg_views = mean(view_count),
    avg_likes = mean(like_count),
    avg_engagement_rate = mean(engagement_rate, na.rm = TRUE)
  )


# -----------------------------------------------------------------------------
# EXERCISES
# -----------------------------------------------------------------------------

# Exercise 1: Create a new variable 'like_ratio' (like_count / view_count)
# [YOUR CODE HERE]


# Exercise 2: Create a 'popularity' category:
# - "low" if views < 10,000
# - "medium" if views 10,000 - 100,000
# - "high" if views > 100,000
# [YOUR CODE HERE]


# Exercise 3: How many videos are in each popularity category?
# [YOUR CODE HERE]


# Exercise 4: What is the average duration for each popularity category?
# [YOUR CODE HERE]


# Exercise 5: Who are the top 5 authors by total engagement 
# (sum of likes + comments + shares)?
# [YOUR CODE HERE]


# Exercise 6: Which date had the most videos posted?
# [YOUR CODE HERE]


# Exercise 7: Which date had the most total views?
# [YOUR CODE HERE]


# CHALLENGE: Using Claude Code, find the day with the highest 
# average views per video. What happened on that day?
# [YOUR CODE HERE]


# -----------------------------------------------------------------------------
# KEY TAKEAWAYS
# -----------------------------------------------------------------------------

# 1. mutate() creates new columns
# 2. case_when() creates categories based on conditions
# 3. summarize() calculates summary statistics
# 4. group_by() + summarize() = statistics by group
# 5. count() is a shortcut for counting occurrences
# 6. arrange() sorts rows

# See you on Day 4 for visualization!
