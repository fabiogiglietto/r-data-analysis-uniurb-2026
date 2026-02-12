# =============================================================================
# Day 3: SOLUTIONS
# Data Analysis with R and Claude Code
# =============================================================================

library(tidyverse)
corona <- read_csv("data/fabrizio_corona_tiktok_jan2026.csv",
                   col_types = cols(video_id = col_character(),
                                    music_id = col_character()))

# Prepare data
corona <- corona |>
  mutate(
    engagement_total = like_count + comment_count + share_count,
    engagement_rate = engagement_total / view_count
  )

# Exercise 1: Create share_ratio variable
corona <- corona |>
  mutate(share_ratio = share_count / view_count)

# Verify
corona |> select(video_id, share_count, view_count, share_ratio) |> head()

# Exercise 2: Create popularity category
corona <- corona |>
  mutate(
    popularity = case_when(
      view_count < 10000 ~ "low",
      view_count >= 10000 & view_count < 100000 ~ "medium",
      view_count >= 100000 ~ "high"
    )
  )

# Exercise 3: Count videos in each popularity category
corona |> count(popularity)
# Results will show distribution across low, medium, high

# Exercise 4: Average duration by popularity category
corona |>
  group_by(popularity) |>
  summarize(avg_duration = mean(duration))

# Exercise 5: Top 5 authors by total engagement
corona |>
  group_by(author_name) |>
  summarize(total_engagement = sum(engagement_total)) |>
  arrange(desc(total_engagement)) |>
  head(5)

# Exercise 6: Date with most videos posted
corona |>
  count(create_date, sort = TRUE) |>
  head(1)

# Exercise 7: Date with most total views
corona |>
  group_by(create_date) |>
  summarize(total_views = sum(view_count)) |>
  arrange(desc(total_views)) |>
  head(1)

# CHALLENGE: Day with highest average views per video
corona |>
  group_by(create_date) |>
  summarize(
    n_videos = n(),
    avg_views = mean(view_count)
  ) |>
  arrange(desc(avg_views)) |>
  head(1)
